#include "moveit_poses/PoseDeriver.h"

int main(int argc, char **argv)
{
	ros::init(argc, argv, "moveit_poses_node");

	moveit_poses::PoseDeriver deriver;
	deriver.run();

	return 0;
}
