# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "geometry_msgs;message_generation;roscpp;std_msgs;sensor_msgs;moveit_core;moveit_ros_planning_interface".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lmotor_controller".split(';') if "-lmotor_controller" != "" else []
PROJECT_NAME = "moveit_commander"
PROJECT_SPACE_DIR = "/home/ubuntu/catkin_ws/install"
PROJECT_VERSION = "1.0.0"
