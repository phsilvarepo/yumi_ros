ROS node that tracks the EuroContainers and the SPLs coming to the station on the EC slots (40) and when they are picked up by the robot to and from the redboards, and when they lie in it while being processed... 

The SPLs have ID and state, 

The StorageSystems should be individual .... and different/mirrored for each workspace (left to right) 
Eurocontainers (1 slot for each arm, 40 SPL slots per each container)
Grippers (1 SPL slot), 
Redboards (8 slots for each arm, 1 slot for SPL in each Redboard). 

Following the logic of
https://gitlab.com/atlas_incm/storage_system
check specifically devel branch and the services there

