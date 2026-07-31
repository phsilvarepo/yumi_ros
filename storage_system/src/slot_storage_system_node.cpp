#include <ros/ros.h>
#include <storage_system/SlotStorageSystem.h>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "slot_storage_system");

	if(ros::ok())
	{
		storage_system::SlotStorageSystem storage;
		storage.run();
	}

	return 0;
}
