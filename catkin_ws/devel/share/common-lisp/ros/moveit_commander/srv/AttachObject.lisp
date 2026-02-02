; Auto-generated. Do not edit!


(cl:in-package moveit_commander-srv)


;//! \htmlinclude AttachObject-request.msg.html

(cl:defclass <AttachObject-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:string
    :initform ""))
)

(cl:defclass AttachObject-request (<AttachObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AttachObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AttachObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<AttachObject-request> is deprecated: use moveit_commander-srv:AttachObject-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <AttachObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:name-val is deprecated.  Use moveit_commander-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <AttachObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:frame_id-val is deprecated.  Use moveit_commander-srv:frame_id instead.")
  (frame_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AttachObject-request>) ostream)
  "Serializes a message object of type '<AttachObject-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AttachObject-request>) istream)
  "Deserializes a message object of type '<AttachObject-request>"
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
      (cl:setf (cl:slot-value msg 'frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AttachObject-request>)))
  "Returns string type for a service object of type '<AttachObject-request>"
  "moveit_commander/AttachObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AttachObject-request)))
  "Returns string type for a service object of type 'AttachObject-request"
  "moveit_commander/AttachObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AttachObject-request>)))
  "Returns md5sum for a message object of type '<AttachObject-request>"
  "3dc60b3ba98237bbd45bfef93f9da692")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AttachObject-request)))
  "Returns md5sum for a message object of type 'AttachObject-request"
  "3dc60b3ba98237bbd45bfef93f9da692")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AttachObject-request>)))
  "Returns full string definition for message of type '<AttachObject-request>"
  (cl:format cl:nil "string name~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AttachObject-request)))
  "Returns full string definition for message of type 'AttachObject-request"
  (cl:format cl:nil "string name~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AttachObject-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'frame_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AttachObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AttachObject-request
    (cl:cons ':name (name msg))
    (cl:cons ':frame_id (frame_id msg))
))
;//! \htmlinclude AttachObject-response.msg.html

(cl:defclass <AttachObject-response> (roslisp-msg-protocol:ros-message)
  ((acknowledge
    :reader acknowledge
    :initarg :acknowledge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AttachObject-response (<AttachObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AttachObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AttachObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<AttachObject-response> is deprecated: use moveit_commander-srv:AttachObject-response instead.")))

(cl:ensure-generic-function 'acknowledge-val :lambda-list '(m))
(cl:defmethod acknowledge-val ((m <AttachObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:acknowledge-val is deprecated.  Use moveit_commander-srv:acknowledge instead.")
  (acknowledge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AttachObject-response>) ostream)
  "Serializes a message object of type '<AttachObject-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'acknowledge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AttachObject-response>) istream)
  "Deserializes a message object of type '<AttachObject-response>"
    (cl:setf (cl:slot-value msg 'acknowledge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AttachObject-response>)))
  "Returns string type for a service object of type '<AttachObject-response>"
  "moveit_commander/AttachObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AttachObject-response)))
  "Returns string type for a service object of type 'AttachObject-response"
  "moveit_commander/AttachObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AttachObject-response>)))
  "Returns md5sum for a message object of type '<AttachObject-response>"
  "3dc60b3ba98237bbd45bfef93f9da692")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AttachObject-response)))
  "Returns md5sum for a message object of type 'AttachObject-response"
  "3dc60b3ba98237bbd45bfef93f9da692")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AttachObject-response>)))
  "Returns full string definition for message of type '<AttachObject-response>"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AttachObject-response)))
  "Returns full string definition for message of type 'AttachObject-response"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AttachObject-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AttachObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AttachObject-response
    (cl:cons ':acknowledge (acknowledge msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AttachObject)))
  'AttachObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AttachObject)))
  'AttachObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AttachObject)))
  "Returns string type for a service object of type '<AttachObject>"
  "moveit_commander/AttachObject")