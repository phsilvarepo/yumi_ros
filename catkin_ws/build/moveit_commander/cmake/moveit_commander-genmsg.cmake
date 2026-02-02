# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "moveit_commander: 0 messages, 7 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(moveit_commander_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv" NAME_WE)
add_custom_target(_moveit_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "moveit_commander" "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv" NAME_WE)
add_custom_target(_moveit_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "moveit_commander" "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv" NAME_WE)
add_custom_target(_moveit_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "moveit_commander" "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv" NAME_WE)
add_custom_target(_moveit_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "moveit_commander" "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv" NAME_WE)
add_custom_target(_moveit_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "moveit_commander" "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv" NAME_WE)
add_custom_target(_moveit_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "moveit_commander" "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv" ""
)

get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv" NAME_WE)
add_custom_target(_moveit_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "moveit_commander" "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
)
_generate_srv_cpp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
)
_generate_srv_cpp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
)
_generate_srv_cpp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
)
_generate_srv_cpp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
)
_generate_srv_cpp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
)
_generate_srv_cpp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
)

### Generating Module File
_generate_module_cpp(moveit_commander
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(moveit_commander_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(moveit_commander_generate_messages moveit_commander_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_cpp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_cpp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_cpp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_cpp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_cpp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_cpp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_cpp _moveit_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(moveit_commander_gencpp)
add_dependencies(moveit_commander_gencpp moveit_commander_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS moveit_commander_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
)
_generate_srv_eus(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
)
_generate_srv_eus(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
)
_generate_srv_eus(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
)
_generate_srv_eus(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
)
_generate_srv_eus(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
)
_generate_srv_eus(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
)

### Generating Module File
_generate_module_eus(moveit_commander
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(moveit_commander_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(moveit_commander_generate_messages moveit_commander_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_eus _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_eus _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_eus _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_eus _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_eus _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_eus _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_eus _moveit_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(moveit_commander_geneus)
add_dependencies(moveit_commander_geneus moveit_commander_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS moveit_commander_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
)
_generate_srv_lisp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
)
_generate_srv_lisp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
)
_generate_srv_lisp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
)
_generate_srv_lisp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
)
_generate_srv_lisp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
)
_generate_srv_lisp(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
)

### Generating Module File
_generate_module_lisp(moveit_commander
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(moveit_commander_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(moveit_commander_generate_messages moveit_commander_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_lisp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_lisp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_lisp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_lisp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_lisp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_lisp _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_lisp _moveit_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(moveit_commander_genlisp)
add_dependencies(moveit_commander_genlisp moveit_commander_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS moveit_commander_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
)
_generate_srv_nodejs(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
)
_generate_srv_nodejs(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
)
_generate_srv_nodejs(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
)
_generate_srv_nodejs(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
)
_generate_srv_nodejs(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
)
_generate_srv_nodejs(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
)

### Generating Module File
_generate_module_nodejs(moveit_commander
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(moveit_commander_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(moveit_commander_generate_messages moveit_commander_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_nodejs _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_nodejs _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_nodejs _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_nodejs _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_nodejs _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_nodejs _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_nodejs _moveit_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(moveit_commander_gennodejs)
add_dependencies(moveit_commander_gennodejs moveit_commander_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS moveit_commander_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
)
_generate_srv_py(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
)
_generate_srv_py(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
)
_generate_srv_py(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
)
_generate_srv_py(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
)
_generate_srv_py(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
)
_generate_srv_py(moveit_commander
  "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
)

### Generating Module File
_generate_module_py(moveit_commander
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(moveit_commander_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(moveit_commander_generate_messages moveit_commander_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ExecuteSequence.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_py _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AddObjectToScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_py _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/RemoveObjectFromScene.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_py _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/AttachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_py _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/DetachObject.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_py _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/SetPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_py _moveit_commander_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/moveit_commander/srv/ClearPathConstraints.srv" NAME_WE)
add_dependencies(moveit_commander_generate_messages_py _moveit_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(moveit_commander_genpy)
add_dependencies(moveit_commander_genpy moveit_commander_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS moveit_commander_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/moveit_commander
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(moveit_commander_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(moveit_commander_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/moveit_commander
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(moveit_commander_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(moveit_commander_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/moveit_commander
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(moveit_commander_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(moveit_commander_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/moveit_commander
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(moveit_commander_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(moveit_commander_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/moveit_commander
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(moveit_commander_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(moveit_commander_generate_messages_py geometry_msgs_generate_messages_py)
endif()
