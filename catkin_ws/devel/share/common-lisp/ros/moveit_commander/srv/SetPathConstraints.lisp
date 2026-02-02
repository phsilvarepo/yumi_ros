; Auto-generated. Do not edit!


(cl:in-package moveit_commander-srv)


;//! \htmlinclude SetPathConstraints-request.msg.html

(cl:defclass <SetPathConstraints-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass SetPathConstraints-request (<SetPathConstraints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPathConstraints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPathConstraints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<SetPathConstraints-request> is deprecated: use moveit_commander-srv:SetPathConstraints-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SetPathConstraints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:name-val is deprecated.  Use moveit_commander-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPathConstraints-request>) ostream)
  "Serializes a message object of type '<SetPathConstraints-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPathConstraints-request>) istream)
  "Deserializes a message object of type '<SetPathConstraints-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPathConstraints-request>)))
  "Returns string type for a service object of type '<SetPathConstraints-request>"
  "moveit_commander/SetPathConstraintsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPathConstraints-request)))
  "Returns string type for a service object of type 'SetPathConstraints-request"
  "moveit_commander/SetPathConstraintsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPathConstraints-request>)))
  "Returns md5sum for a message object of type '<SetPathConstraints-request>"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPathConstraints-request)))
  "Returns md5sum for a message object of type 'SetPathConstraints-request"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPathConstraints-request>)))
  "Returns full string definition for message of type '<SetPathConstraints-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPathConstraints-request)))
  "Returns full string definition for message of type 'SetPathConstraints-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPathConstraints-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPathConstraints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPathConstraints-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude SetPathConstraints-response.msg.html

(cl:defclass <SetPathConstraints-response> (roslisp-msg-protocol:ros-message)
  ((acknowledge
    :reader acknowledge
    :initarg :acknowledge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetPathConstraints-response (<SetPathConstraints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPathConstraints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPathConstraints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<SetPathConstraints-response> is deprecated: use moveit_commander-srv:SetPathConstraints-response instead.")))

(cl:ensure-generic-function 'acknowledge-val :lambda-list '(m))
(cl:defmethod acknowledge-val ((m <SetPathConstraints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:acknowledge-val is deprecated.  Use moveit_commander-srv:acknowledge instead.")
  (acknowledge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPathConstraints-response>) ostream)
  "Serializes a message object of type '<SetPathConstraints-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'acknowledge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPathConstraints-response>) istream)
  "Deserializes a message object of type '<SetPathConstraints-response>"
    (cl:setf (cl:slot-value msg 'acknowledge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPathConstraints-response>)))
  "Returns string type for a service object of type '<SetPathConstraints-response>"
  "moveit_commander/SetPathConstraintsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPathConstraints-response)))
  "Returns string type for a service object of type 'SetPathConstraints-response"
  "moveit_commander/SetPathConstraintsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPathConstraints-response>)))
  "Returns md5sum for a message object of type '<SetPathConstraints-response>"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPathConstraints-response)))
  "Returns md5sum for a message object of type 'SetPathConstraints-response"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPathConstraints-response>)))
  "Returns full string definition for message of type '<SetPathConstraints-response>"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPathConstraints-response)))
  "Returns full string definition for message of type 'SetPathConstraints-response"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPathConstraints-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPathConstraints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPathConstraints-response
    (cl:cons ':acknowledge (acknowledge msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPathConstraints)))
  'SetPathConstraints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPathConstraints)))
  'SetPathConstraints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPathConstraints)))
  "Returns string type for a service object of type '<SetPathConstraints>"
  "moveit_commander/SetPathConstraints")