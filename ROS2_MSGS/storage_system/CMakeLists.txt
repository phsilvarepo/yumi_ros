cmake_minimum_required(VERSION 3.8)
project(storage_system)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/SPL.msg"
  "msg/Result.msg"
  "srv/GetSlot.srv"
  "srv/SetSPL.srv"
  "srv/GetSPL.srv"
  "srv/RemoveSPL.srv"
  "srv/UpdateSPLState.srv"
  "srv/GetSPLState.srv"
  "srv/GetNextSPL.srv"
)

ament_export_dependencies(rosidl_default_runtime)

ament_package()
