cmake_minimum_required(VERSION 2.8.3)
project(storage_system)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  std_msgs
)

add_message_files(
  FILES
  SPL.msg
  Result.msg
)

add_service_files(
  FILES
  GetSlot.srv
  SetSPL.srv
  GetSPL.srv
  RemoveSPL.srv
  UpdateSPLState.srv
  GetSPLState.srv
  GetNextSPL.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS message_runtime roscpp std_msgs
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(slot_storage_system_node
  src/slot_storage_system_node.cpp
  src/SlotStorageSystem.cpp
)
add_dependencies(slot_storage_system_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(slot_storage_system_node ${catkin_LIBRARIES})
