; Auto-generated. Do not edit!


(cl:in-package moveit_commander-srv)


;//! \htmlinclude RemoveObjectFromScene-request.msg.html

(cl:defclass <RemoveObjectFromScene-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass RemoveObjectFromScene-request (<RemoveObjectFromScene-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RemoveObjectFromScene-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RemoveObjectFromScene-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<RemoveObjectFromScene-request> is deprecated: use moveit_commander-srv:RemoveObjectFromScene-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <RemoveObjectFromScene-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:name-val is deprecated.  Use moveit_commander-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RemoveObjectFromScene-request>) ostream)
  "Serializes a message object of type '<RemoveObjectFromScene-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RemoveObjectFromScene-request>) istream)
  "Deserializes a message object of type '<RemoveObjectFromScene-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RemoveObjectFromScene-request>)))
  "Returns string type for a service object of type '<RemoveObjectFromScene-request>"
  "moveit_commander/RemoveObjectFromSceneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemoveObjectFromScene-request)))
  "Returns string type for a service object of type 'RemoveObjectFromScene-request"
  "moveit_commander/RemoveObjectFromSceneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RemoveObjectFromScene-request>)))
  "Returns md5sum for a message object of type '<RemoveObjectFromScene-request>"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RemoveObjectFromScene-request)))
  "Returns md5sum for a message object of type 'RemoveObjectFromScene-request"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RemoveObjectFromScene-request>)))
  "Returns full string definition for message of type '<RemoveObjectFromScene-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RemoveObjectFromScene-request)))
  "Returns full string definition for message of type 'RemoveObjectFromScene-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RemoveObjectFromScene-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RemoveObjectFromScene-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RemoveObjectFromScene-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude RemoveObjectFromScene-response.msg.html

(cl:defclass <RemoveObjectFromScene-response> (roslisp-msg-protocol:ros-message)
  ((acknowledge
    :reader acknowledge
    :initarg :acknowledge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RemoveObjectFromScene-response (<RemoveObjectFromScene-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RemoveObjectFromScene-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RemoveObjectFromScene-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<RemoveObjectFromScene-response> is deprecated: use moveit_commander-srv:RemoveObjectFromScene-response instead.")))

(cl:ensure-generic-function 'acknowledge-val :lambda-list '(m))
(cl:defmethod acknowledge-val ((m <RemoveObjectFromScene-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:acknowledge-val is deprecated.  Use moveit_commander-srv:acknowledge instead.")
  (acknowledge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RemoveObjectFromScene-response>) ostream)
  "Serializes a message object of type '<RemoveObjectFromScene-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'acknowledge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RemoveObjectFromScene-response>) istream)
  "Deserializes a message object of type '<RemoveObjectFromScene-response>"
    (cl:setf (cl:slot-value msg 'acknowledge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RemoveObjectFromScene-response>)))
  "Returns string type for a service object of type '<RemoveObjectFromScene-response>"
  "moveit_commander/RemoveObjectFromSceneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemoveObjectFromScene-response)))
  "Returns string type for a service object of type 'RemoveObjectFromScene-response"
  "moveit_commander/RemoveObjectFromSceneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RemoveObjectFromScene-response>)))
  "Returns md5sum for a message object of type '<RemoveObjectFromScene-response>"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RemoveObjectFromScene-response)))
  "Returns md5sum for a message object of type 'RemoveObjectFromScene-response"
  "f24e999f14fde73573863e4f3aa6d481")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RemoveObjectFromScene-response>)))
  "Returns full string definition for message of type '<RemoveObjectFromScene-response>"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RemoveObjectFromScene-response)))
  "Returns full string definition for message of type 'RemoveObjectFromScene-response"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RemoveObjectFromScene-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RemoveObjectFromScene-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RemoveObjectFromScene-response
    (cl:cons ':acknowledge (acknowledge msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RemoveObjectFromScene)))
  'RemoveObjectFromScene-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RemoveObjectFromScene)))
  'RemoveObjectFromScene-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RemoveObjectFromScene)))
  "Returns string type for a service object of type '<RemoveObjectFromScene>"
  "moveit_commander/RemoveObjectFromScene")