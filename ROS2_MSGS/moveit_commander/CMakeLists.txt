cmake_minimum_required(VERSION 3.8)
project(moveit_commander)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(geometry_msgs REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "srv/ExecuteSequence.srv"
  "srv/AddObjectToScene.srv"
  "srv/RemoveObjectFromScene.srv"
  "srv/AttachObject.srv"
  "srv/DetachObject.srv"
  "srv/SetPathConstraints.srv"
  "srv/ClearPathConstraints.srv"
  "srv/SwitchGroup.srv"
  DEPENDENCIES geometry_msgs
)

ament_export_dependencies(rosidl_default_runtime geometry_msgs)

ament_package()
