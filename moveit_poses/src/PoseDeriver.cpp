#include "moveit_poses/PoseDeriver.h"

#include <tf2/LinearMath/Quaternion.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <cmath>
#include <sstream>

namespace moveit_poses
{

namespace
{
	const double DEG2RAD = M_PI / 180.0;
}

PoseDeriver::PoseDeriver()
	: m_nh()
	, m_pnh("~")
	, m_tfBuffer()
	, m_tfListener(m_tfBuffer)
	, m_eurocontainer_capacity(40)
	, m_redboard_capacity(8)
	, m_default_root_frame("world")
	, m_tf_timeout_sec(0.5)
{
	m_pnh.getParam("eurocontainer/capacity", m_eurocontainer_capacity);
	m_pnh.getParam("redboard/capacity", m_redboard_capacity);

	/** @prm ~default_root_frame (string, default "world") Root frame used when a
	 * request's group_name and target_frame are both empty. */
	m_pnh.getParam("default_root_frame", m_default_root_frame);

	/** @prm ~tf_timeout_sec (double, default 0.5) lookupTransform wait timeout, in seconds. */
	m_pnh.getParam("tf_timeout_sec", m_tf_timeout_sec);

	/** @prm ~group_root_frames (map<string,string>, optional) Maps a MoveIt planning
	 * group name (e.g. "left_arm") to its root/base frame (e.g. "yumi_base_link"),
	 * used to resolve a request's group_name into a TF root frame when target_frame
	 * is not explicitly given. */
	XmlRpc::XmlRpcValue group_root_frames;
	if(m_pnh.getParam("group_root_frames", group_root_frames)
		&& group_root_frames.getType() == XmlRpc::XmlRpcValue::TypeStruct)
	{
		for(auto it = group_root_frames.begin(); it != group_root_frames.end(); ++it)
		{
			m_group_root_frames[it->first] = static_cast<std::string>(it->second);
		}
	}

	// PLACEHOLDER DEFAULTS - see SPECS/20260731_PoseDeriver_Design.md, Open Items.
	// These are NOT calibrated against the real station; they only encode the
	// *shape* of the config (a fixed offset + orientation per kind, per
	// approach/engage). Override via ROS params before real use.

	// Eurocontainer: gripper straight down (pitch -180), engage sits just
	// above the slot frame; approach is a straight vertical retreat.
	m_eurocontainer_cfg.engage.z = 0.05;
	m_eurocontainer_cfg.engage.pitch_deg = -180.0;
	m_eurocontainer_cfg.approach.z = 0.15;
	m_eurocontainer_cfg.approach.pitch_deg = -180.0;

	// Redboard: gripper oriented per the Node-RED reference's engage
	// attitude (roll 90, yaw 180). APPROACH orientation always inherits
	// ENGAGE's orientation (see getPosesClbk) - it is a straight Z retreat,
	// not an independently-rotated pose. (A previous placeholder gave
	// approach its own roll_deg=-90, which was physically wrong - a
	// disjoint rotation between approach and engage - fixed 2026-08-03.)
	m_redboard_cfg.engage.z = 0.05;
	m_redboard_cfg.engage.roll_deg = 90.0;
	m_redboard_cfg.engage.yaw_deg = 180.0;
	m_redboard_cfg.approach.z = 0.15;

	loadKindConfig("eurocontainer", m_eurocontainer_cfg);
	loadKindConfig("redboard", m_redboard_cfg);

	m_getPosesSrv = m_nh.advertiseService("get_approach_engage_poses", &PoseDeriver::getPosesClbk, this);

	// Latched so the last published pose stays visible to RViz even if it
	// only subscribes after the service was called.
	m_approachPosePub = m_nh.advertise<geometry_msgs::PoseStamped>("approach_pose", 1, true);
	m_engagePosePub = m_nh.advertise<geometry_msgs::PoseStamped>("engage_pose", 1, true);

	ROS_INFO_STREAM("[moveit_poses] online. Eurocontainer capacity=" << m_eurocontainer_capacity
		<< ", Redboard capacity=" << m_redboard_capacity
		<< ", default_root_frame='" << m_default_root_frame << "'"
		<< ", " << m_group_root_frames.size() << " group_root_frames entries");
}

PoseDeriver::~PoseDeriver()
{
}

void PoseDeriver::run()
{
	ros::spin();
}

void PoseDeriver::loadOffset(const std::string &prefix, PoseOffset &offset) const
{
	m_pnh.getParam(prefix + "/position/x", offset.x);
	m_pnh.getParam(prefix + "/position/y", offset.y);
	m_pnh.getParam(prefix + "/position/z", offset.z);
	m_pnh.getParam(prefix + "/orientation/roll_deg", offset.roll_deg);
	m_pnh.getParam(prefix + "/orientation/pitch_deg", offset.pitch_deg);
	m_pnh.getParam(prefix + "/orientation/yaw_deg", offset.yaw_deg);
}

void PoseDeriver::loadKindConfig(const std::string &prefix, KindConfig &cfg) const
{
	loadOffset(prefix + "/engage", cfg.engage);
	loadOffset(prefix + "/approach", cfg.approach);
}

bool PoseDeriver::parseStorageId(const std::string &storage_id, std::string &kind, std::string &side) const
{
	if(storage_id == "eurocontainer_left")       { kind = "eurocontainer"; side = "left";  return true; }
	if(storage_id == "eurocontainer_right")      { kind = "eurocontainer"; side = "right"; return true; }
	if(storage_id == "redboard_left")            { kind = "redboard";      side = "left";  return true; }
	if(storage_id == "redboard_right")           { kind = "redboard";      side = "right"; return true; }
	return false;
}

std::string PoseDeriver::eurocontainerSlotFrame(const std::string &side, int32_t slot) const
{
	int quadrant = slot / 10;
	int gx = quadrant / 2;
	int gy = quadrant % 2;
	int sub = slot % 10;
	int row = sub / 2;
	int col = sub % 2;

	std::ostringstream oss;
	oss << "eurocontainer_" << side << "_spl_slot_g" << gx << gy << "_r" << row << "_c" << col;
	return oss.str();
}

std::string PoseDeriver::redboardSlotFrame(const std::string &side, int32_t slot) const
{
	int row = slot / 4;
	int col = slot % 4;

	std::ostringstream oss;
	oss << "redboard_slot_" << side << "_" << row << "_" << col;
	return oss.str();
}

geometry_msgs::PoseStamped PoseDeriver::makePose(const std::string &frame_id, const PoseOffset &offset) const
{
	geometry_msgs::PoseStamped pose;
	pose.header.stamp = ros::Time(0);	// TF lookup below uses Time(0) = "latest available", stamp kept consistent
	pose.header.frame_id = frame_id;

	pose.pose.position.x = offset.x;
	pose.pose.position.y = offset.y;
	pose.pose.position.z = offset.z;

	tf2::Quaternion q;
	q.setRPY(offset.roll_deg * DEG2RAD, offset.pitch_deg * DEG2RAD, offset.yaw_deg * DEG2RAD);
	pose.pose.orientation.x = q.x();
	pose.pose.orientation.y = q.y();
	pose.pose.orientation.z = q.z();
	pose.pose.orientation.w = q.w();

	return pose;
}

std::string PoseDeriver::resolveRootFrame(const std::string &group_name, const std::string &target_frame) const
{
	if(!target_frame.empty())
		return target_frame;

	if(!group_name.empty())
	{
		auto it = m_group_root_frames.find(group_name);
		if(it != m_group_root_frames.end())
			return it->second;

		ROS_WARN_STREAM("[moveit_poses] group_name '" << group_name
			<< "' not found in ~group_root_frames, falling back to default_root_frame '"
			<< m_default_root_frame << "'");
	}

	return m_default_root_frame;
}

bool PoseDeriver::transformToRootFrame(const geometry_msgs::PoseStamped &pose, const std::string &root_frame,
	geometry_msgs::PoseStamped &out, std::string &error_message) const
{
	if(pose.header.frame_id == root_frame)
	{
		out = pose;
		out.header.stamp = ros::Time::now();
		return true;
	}

	try
	{
		geometry_msgs::TransformStamped transform = m_tfBuffer.lookupTransform(
			root_frame, pose.header.frame_id, ros::Time(0), ros::Duration(m_tf_timeout_sec));
		tf2::doTransform(pose, out, transform);
		return true;
	}
	catch(const tf2::TransformException &ex)
	{
		error_message = std::string("TF lookup failed (") + pose.header.frame_id + " -> " + root_frame
			+ "): " + ex.what();
		ROS_ERROR_STREAM("[moveit_poses] " << error_message);
		return false;
	}
}

bool PoseDeriver::getPosesClbk(GetApproachEngagePoses::Request &req, GetApproachEngagePoses::Response &res)
{
	std::string kind, side;
	if(!parseStorageId(req.storage_id, kind, side))
	{
		ROS_ERROR_STREAM("[moveit_poses] Unknown storage_id '" << req.storage_id
			<< "' (expected eurocontainer_{left,right} or redboard_{left,right})");
		res.success = false;
		res.message = "Unknown storage_id";
		return true;
	}

	std::string frame;
	const KindConfig *cfg = nullptr;

	if(kind == "eurocontainer")
	{
		if(req.slot < 0 || req.slot >= m_eurocontainer_capacity)
		{
			ROS_ERROR_STREAM("[moveit_poses] slot " << req.slot << " out of bounds for "
				<< req.storage_id << " (capacity " << m_eurocontainer_capacity << ")");
			res.success = false;
			res.message = "Slot out of bounds";
			return true;
		}
		frame = eurocontainerSlotFrame(side, req.slot);
		cfg = &m_eurocontainer_cfg;
	}
	else // "redboard"
	{
		if(req.slot < 0 || req.slot >= m_redboard_capacity)
		{
			ROS_ERROR_STREAM("[moveit_poses] slot " << req.slot << " out of bounds for "
				<< req.storage_id << " (capacity " << m_redboard_capacity << ")");
			res.success = false;
			res.message = "Slot out of bounds";
			return true;
		}
		frame = redboardSlotFrame(side, req.slot);
		cfg = &m_redboard_cfg;
	}

	// APPROACH must be the same gripper attitude as ENGAGE - it's a straight
	// retreat/retraction along the slot's Z, not an independently-rotated
	// pose. Only the *position* offset is taken from cfg->approach; the
	// orientation always comes from cfg->engage. (Previously each had its
	// own independently-configured roll/pitch/yaw, which produced a
	// physically wrong, disjoint rotation between approach and engage.)
	PoseOffset approach_offset = cfg->approach;
	approach_offset.roll_deg = cfg->engage.roll_deg;
	approach_offset.pitch_deg = cfg->engage.pitch_deg;
	approach_offset.yaw_deg = cfg->engage.yaw_deg;

	geometry_msgs::PoseStamped approach_local = makePose(frame, approach_offset);
	geometry_msgs::PoseStamped engage_local = makePose(frame, cfg->engage);

	std::string root_frame = resolveRootFrame(req.group_name, req.target_frame);

	std::string error_message;
	geometry_msgs::PoseStamped approach_out, engage_out;

	if(!transformToRootFrame(approach_local, root_frame, approach_out, error_message)
		|| !transformToRootFrame(engage_local, root_frame, engage_out, error_message))
	{
		res.success = false;
		res.message = error_message;
		return true;
	}

	res.approach_pose = approach_out;
	res.engage_pose = engage_out;
	res.success = true;
	res.message = "";

	m_approachPosePub.publish(res.approach_pose);
	m_engagePosePub.publish(res.engage_pose);

	ROS_INFO_STREAM("[moveit_poses] " << req.storage_id << " slot " << req.slot
		<< " -> frame '" << frame << "' -> root '" << root_frame << "'");

	return true;
}

};
