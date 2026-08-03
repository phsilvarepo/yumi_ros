cmake_minimum_required(VERSION 2.8.3)
project(moveit_poses)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  message_generation
  roscpp
  tf2
  tf2_ros
  tf2_geometry_msgs
)

add_service_files(
  FILES
  GetApproachEngagePoses.srv
)

generate_messages(
  DEPENDENCIES
  geometry_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS geometry_msgs message_runtime roscpp tf2 tf2_ros tf2_geometry_msgs
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(moveit_poses_node
  src/moveit_poses_node.cpp
  src/PoseDeriver.cpp
)
add_dependencies(moveit_poses_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(moveit_poses_node ${catkin_LIBRARIES})
