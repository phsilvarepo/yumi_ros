#ifndef _POSE_DERIVER_H_
#define _POSE_DERIVER_H_

#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf2_ros/transform_listener.h>

#include <map>
#include <string>

#include "moveit_poses/GetApproachEngagePoses.h"

namespace moveit_poses
{

/**
 * @brief A fixed position+orientation offset (roll/pitch/yaw in degrees,
 * for readability in launch/yaml params — converted to a quaternion
 * internally). Applied relative to a slot's own static TF frame.
 */
struct PoseOffset
{
	double x = 0.0, y = 0.0, z = 0.0;
	double roll_deg = 0.0, pitch_deg = 0.0, yaw_deg = 0.0;
};

/**
 * @brief Per-storage-kind (eurocontainer / redboard) configurable offsets.
 *
 * NOTE: approach.roll_deg/pitch_deg/yaw_deg are NOT used - the approach
 * pose's orientation always equals engage's orientation (approach is a
 * straight Z retreat from engage, not an independently-rotated pose; see
 * PoseDeriver::getPosesClbk). Only approach's position offset is applied.
 */
struct KindConfig
{
	PoseOffset engage;
	PoseOffset approach;
};

/**
 * @brief PoseDeriver — given a StorageSystem-style (storage_id, slot), computes
 * the APPROACH and ENGAGE poses for that slot, expressed in a resolved
 * planning root frame.
 *
 * Computes the slot's existing static TF frame name from the flat slot
 * index (pure indexing math, mirroring the xacro layout in
 * spl_electricalstation_description), builds the local offset pose in that
 * frame, then looks up TF and transforms the result into the requested
 * root frame (resolved from an explicit target_frame, or a group_name ->
 * root frame param map, defaulting to ~default_root_frame — see SPECS doc,
 * Decision #1, revised 2026-08-03 after review: this node DOES own a
 * tf2_ros::TransformListener and DOES call lookupTransform/doTransform).
 *
 * Covers exactly the two storage kinds that have a physical
 * APPROACH/ENGAGE motion: "eurocontainer" (40 slots/side, 2x2 quadrants of
 * 2 cols x 5 rows) and "redboard" (8 slots/side, 2 rows x 4 cols). Gripper
 * storage is out of scope (see SPECS doc).
 */
class PoseDeriver
{
	public:
		PoseDeriver();
		~PoseDeriver();

		void run();

	private:
		ros::NodeHandle m_nh;
		ros::NodeHandle m_pnh;

		tf2_ros::Buffer m_tfBuffer;
		tf2_ros::TransformListener m_tfListener;

		KindConfig m_eurocontainer_cfg;
		KindConfig m_redboard_cfg;

		int m_eurocontainer_capacity;	/*!< \brief Slots per side, default 40 */
		int m_redboard_capacity;		/*!< \brief Slots per side, default 8 */

		std::string m_default_root_frame;			/*!< \brief Used when group_name/target_frame are both empty. Default "world" */
		std::map<std::string, std::string> m_group_root_frames;	/*!< \brief group_name -> root frame, from ~group_root_frames param */
		double m_tf_timeout_sec;		/*!< \brief lookupTransform wait timeout, default 0.5s */

		ros::ServiceServer m_getPosesSrv;

		/** @brief Latched publishers re-publishing the most recent successful
		 * service call's approach/engage poses, for RViz visualization
		 * (add a PoseStamped display on each topic). */
		ros::Publisher m_approachPosePub;
		ros::Publisher m_engagePosePub;

		bool getPosesClbk(GetApproachEngagePoses::Request &req, GetApproachEngagePoses::Response &res);

		/**
		 * @brief Splits a storage_id like "eurocontainer_left" into kind
		 * ("eurocontainer") and side ("left"). Returns false if the storage_id
		 * doesn't match a known kind/side.
		 */
		bool parseStorageId(const std::string &storage_id, std::string &kind, std::string &side) const;

		/**
		 * @brief Flat slot index (0-39) -> eurocontainer TF frame name, mirroring
		 * spl_eurocontainer.xacro's g<gx><gy>_r<row>_c<col> layout:
		 *   quadrant q = slot / 10   (0-3), gx = q / 2, gy = q % 2
		 *   sub = slot % 10, row = sub / 2, col = sub % 2
		 */
		std::string eurocontainerSlotFrame(const std::string &side, int32_t slot) const;

		/**
		 * @brief Flat slot index (0-7) -> redboard TF frame name, mirroring
		 * spl_electricalstation_slots.xacro's redboard_slot_<side>_<row>_<col>
		 * layout (2 rows x 4 cols): row = slot / 4, col = slot % 4.
		 */
		std::string redboardSlotFrame(const std::string &side, int32_t slot) const;

		/**
		 * @brief Builds a PoseStamped with header.frame_id = frame_id and
		 * pose = offset (position as given, orientation from offset's
		 * roll/pitch/yaw converted to a quaternion).
		 */
		geometry_msgs::PoseStamped makePose(const std::string &frame_id, const PoseOffset &offset) const;

		/**
		 * @brief Resolves the output root frame for a request: target_frame if
		 * non-empty, else group_name looked up in m_group_root_frames, else
		 * m_default_root_frame.
		 */
		std::string resolveRootFrame(const std::string &group_name, const std::string &target_frame) const;

		/**
		 * @brief Looks up TF and transforms `pose` (in its own header.frame_id)
		 * into `root_frame`. Returns false (and sets an error message) if the
		 * transform lookup fails/times out.
		 */
		bool transformToRootFrame(const geometry_msgs::PoseStamped &pose, const std::string &root_frame,
			geometry_msgs::PoseStamped &out, std::string &error_message) const;

		/**
		 * @brief Reads a KindConfig's engage/approach PoseOffset fields from
		 * ROS params under the given private-namespace prefix (e.g.
		 * "~eurocontainer/engage/position/x", ".../orientation/roll_deg", etc.).
		 */
		void loadKindConfig(const std::string &prefix, KindConfig &cfg) const;
		void loadOffset(const std::string &prefix, PoseOffset &offset) const;
};

};

#endif /*_POSE_DERIVER_H_*/
