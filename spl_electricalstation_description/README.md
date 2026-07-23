spl_electricalstation_description
====================

This package provides a simple URDF/xacro that models a table (as `base_link`) and includes the existing `yumi_description` robot placed on top of the table.

Quick start
-----------

1. Make sure your ROS environment is sourced and you are in a catkin workspace that overlays this repository.
2. Run:

```bash
roslaunch spl_electricalstation_description view_robot.launch
```

This will launch `joint_state_publisher` and `robot_state_publisher` and optionally `rviz` if installed. The robot description is generated from the xacro and the yumi model included from `yumi_description`.

Notes and assumptions
---------------------
- The package depends on the existing `yumi_description` package in the same workspace. The xacro calls `$(find yumi_description)/urdf/yumi.xacro`.
- The yumi macro is invoked with parent `table_top` so its `yumi_base_link` is effectively attached to the table top.
