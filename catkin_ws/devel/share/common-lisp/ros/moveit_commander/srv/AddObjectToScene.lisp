; Auto-generated. Do not edit!


(cl:in-package moveit_commander-srv)


;//! \htmlinclude AddObjectToScene-request.msg.html

(cl:defclass <AddObjectToScene-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (object_template
    :reader object_template
    :initarg :object_template
    :type cl:string
    :initform "")
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass AddObjectToScene-request (<AddObjectToScene-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddObjectToScene-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddObjectToScene-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<AddObjectToScene-request> is deprecated: use moveit_commander-srv:AddObjectToScene-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <AddObjectToScene-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:name-val is deprecated.  Use moveit_commander-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'object_template-val :lambda-list '(m))
(cl:defmethod object_template-val ((m <AddObjectToScene-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:object_template-val is deprecated.  Use moveit_commander-srv:object_template instead.")
  (object_template m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <AddObjectToScene-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:frame_id-val is deprecated.  Use moveit_commander-srv:frame_id instead.")
  (frame_id m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <AddObjectToScene-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:pose-val is deprecated.  Use moveit_commander-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddObjectToScene-request>) ostream)
  "Serializes a message object of type '<AddObjectToScene-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_template))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_template))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddObjectToScene-request>) istream)
  "Deserializes a message object of type '<AddObjectToScene-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_template) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_template) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddObjectToScene-request>)))
  "Returns string type for a service object of type '<AddObjectToScene-request>"
  "moveit_commander/AddObjectToSceneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddObjectToScene-request)))
  "Returns string type for a service object of type 'AddObjectToScene-request"
  "moveit_commander/AddObjectToSceneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddObjectToScene-request>)))
  "Returns md5sum for a message object of type '<AddObjectToScene-request>"
  "ef97a7771d19303a88031df9a8b7a932")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddObjectToScene-request)))
  "Returns md5sum for a message object of type 'AddObjectToScene-request"
  "ef97a7771d19303a88031df9a8b7a932")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddObjectToScene-request>)))
  "Returns full string definition for message of type '<AddObjectToScene-request>"
  (cl:format cl:nil "string name~%string object_template~%string frame_id~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddObjectToScene-request)))
  "Returns full string definition for message of type 'AddObjectToScene-request"
  (cl:format cl:nil "string name~%string object_template~%string frame_id~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddObjectToScene-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'object_template))
     4 (cl:length (cl:slot-value msg 'frame_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddObjectToScene-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddObjectToScene-request
    (cl:cons ':name (name msg))
    (cl:cons ':object_template (object_template msg))
    (cl:cons ':frame_id (frame_id msg))
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude AddObjectToScene-response.msg.html

(cl:defclass <AddObjectToScene-response> (roslisp-msg-protocol:ros-message)
  ((acknowledge
    :reader acknowledge
    :initarg :acknowledge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AddObjectToScene-response (<AddObjectToScene-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddObjectToScene-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddObjectToScene-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<AddObjectToScene-response> is deprecated: use moveit_commander-srv:AddObjectToScene-response instead.")))

(cl:ensure-generic-function 'acknowledge-val :lambda-list '(m))
(cl:defmethod acknowledge-val ((m <AddObjectToScene-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:acknowledge-val is deprecated.  Use moveit_commander-srv:acknowledge instead.")
  (acknowledge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddObjectToScene-response>) ostream)
  "Serializes a message object of type '<AddObjectToScene-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'acknowledge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddObjectToScene-response>) istream)
  "Deserializes a message object of type '<AddObjectToScene-response>"
    (cl:setf (cl:slot-value msg 'acknowledge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddObjectToScene-response>)))
  "Returns string type for a service object of type '<AddObjectToScene-response>"
  "moveit_commander/AddObjectToSceneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddObjectToScene-response)))
  "Returns string type for a service object of type 'AddObjectToScene-response"
  "moveit_commander/AddObjectToSceneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddObjectToScene-response>)))
  "Returns md5sum for a message object of type '<AddObjectToScene-response>"
  "ef97a7771d19303a88031df9a8b7a932")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddObjectToScene-response)))
  "Returns md5sum for a message object of type 'AddObjectToScene-response"
  "ef97a7771d19303a88031df9a8b7a932")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddObjectToScene-response>)))
  "Returns full string definition for message of type '<AddObjectToScene-response>"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddObjectToScene-response)))
  "Returns full string definition for message of type 'AddObjectToScene-response"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddObjectToScene-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddObjectToScene-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddObjectToScene-response
    (cl:cons ':acknowledge (acknowledge msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddObjectToScene)))
  'AddObjectToScene-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddObjectToScene)))
  'AddObjectToScene-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddObjectToScene)))
  "Returns string type for a service object of type '<AddObjectToScene>"
  "moveit_commander/AddObjectToScene")