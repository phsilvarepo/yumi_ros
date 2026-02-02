; Auto-generated. Do not edit!


(cl:in-package moveit_commander-srv)


;//! \htmlinclude DetachObject-request.msg.html

(cl:defclass <DetachObject-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass DetachObject-request (<DetachObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetachObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetachObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<DetachObject-request> is deprecated: use moveit_commander-srv:DetachObject-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DetachObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:name-val is deprecated.  Use moveit_commander-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetachObject-request>) ostream)
  "Serializes a message object of type '<DetachObject-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetachObject-request>) istream)
  "Deserializes a message object of type '<DetachObject-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetachObject-request>)))
  "Returns string type for a service object of type '<DetachObject-request>"
  "moveit_commander/DetachObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetachObject-request)))
  "Returns string type for a service object of type 'DetachObject-request"
  "moveit_commander/DetachObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetachObject-request>)))
  "Returns md5sum for a message object of type '<DetachObject-request>"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetachObject-request)))
  "Returns md5sum for a message object of type 'DetachObject-request"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetachObject-request>)))
  "Returns full string definition for message of type '<DetachObject-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetachObject-request)))
  "Returns full string definition for message of type 'DetachObject-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetachObject-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetachObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DetachObject-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude DetachObject-response.msg.html

(cl:defclass <DetachObject-response> (roslisp-msg-protocol:ros-message)
  ((acknowledge
    :reader acknowledge
    :initarg :acknowledge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DetachObject-response (<DetachObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetachObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetachObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<DetachObject-response> is deprecated: use moveit_commander-srv:DetachObject-response instead.")))

(cl:ensure-generic-function 'acknowledge-val :lambda-list '(m))
(cl:defmethod acknowledge-val ((m <DetachObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:acknowledge-val is deprecated.  Use moveit_commander-srv:acknowledge instead.")
  (acknowledge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetachObject-response>) ostream)
  "Serializes a message object of type '<DetachObject-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'acknowledge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetachObject-response>) istream)
  "Deserializes a message object of type '<DetachObject-response>"
    (cl:setf (cl:slot-value msg 'acknowledge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetachObject-response>)))
  "Returns string type for a service object of type '<DetachObject-response>"
  "moveit_commander/DetachObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetachObject-response)))
  "Returns string type for a service object of type 'DetachObject-response"
  "moveit_commander/DetachObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetachObject-response>)))
  "Returns md5sum for a message object of type '<DetachObject-response>"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetachObject-response)))
  "Returns md5sum for a message object of type 'DetachObject-response"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetachObject-response>)))
  "Returns full string definition for message of type '<DetachObject-response>"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetachObject-response)))
  "Returns full string definition for message of type 'DetachObject-response"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetachObject-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetachObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DetachObject-response
    (cl:cons ':acknowledge (acknowledge msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DetachObject)))
  'DetachObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DetachObject)))
  'DetachObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetachObject)))
  "Returns string type for a service object of type '<DetachObject>"
  "moveit_commander/DetachObject")