cmake_minimum_required(VERSION 3.0.2)
project(spl_electricalstation_description)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  robot_state_publisher
  xacro
)

catkin_package(
)

install(DIRECTORY launch urdf config meshes
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
