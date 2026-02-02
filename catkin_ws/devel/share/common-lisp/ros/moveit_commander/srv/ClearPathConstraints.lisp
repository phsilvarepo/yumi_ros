; Auto-generated. Do not edit!


(cl:in-package moveit_commander-srv)


;//! \htmlinclude ClearPathConstraints-request.msg.html

(cl:defclass <ClearPathConstraints-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ClearPathConstraints-request (<ClearPathConstraints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearPathConstraints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearPathConstraints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<ClearPathConstraints-request> is deprecated: use moveit_commander-srv:ClearPathConstraints-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearPathConstraints-request>) ostream)
  "Serializes a message object of type '<ClearPathConstraints-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearPathConstraints-request>) istream)
  "Deserializes a message object of type '<ClearPathConstraints-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearPathConstraints-request>)))
  "Returns string type for a service object of type '<ClearPathConstraints-request>"
  "moveit_commander/ClearPathConstraintsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearPathConstraints-request)))
  "Returns string type for a service object of type 'ClearPathConstraints-request"
  "moveit_commander/ClearPathConstraintsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearPathConstraints-request>)))
  "Returns md5sum for a message object of type '<ClearPathConstraints-request>"
  "49e58fb292754f342bf15cc029614808")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearPathConstraints-request)))
  "Returns md5sum for a message object of type 'ClearPathConstraints-request"
  "49e58fb292754f342bf15cc029614808")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearPathConstraints-request>)))
  "Returns full string definition for message of type '<ClearPathConstraints-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearPathConstraints-request)))
  "Returns full string definition for message of type 'ClearPathConstraints-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearPathConstraints-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearPathConstraints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearPathConstraints-request
))
;//! \htmlinclude ClearPathConstraints-response.msg.html

(cl:defclass <ClearPathConstraints-response> (roslisp-msg-protocol:ros-message)
  ((acknowledge
    :reader acknowledge
    :initarg :acknowledge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ClearPathConstraints-response (<ClearPathConstraints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearPathConstraints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearPathConstraints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<ClearPathConstraints-response> is deprecated: use moveit_commander-srv:ClearPathConstraints-response instead.")))

(cl:ensure-generic-function 'acknowledge-val :lambda-list '(m))
(cl:defmethod acknowledge-val ((m <ClearPathConstraints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:acknowledge-val is deprecated.  Use moveit_commander-srv:acknowledge instead.")
  (acknowledge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearPathConstraints-response>) ostream)
  "Serializes a message object of type '<ClearPathConstraints-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'acknowledge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearPathConstraints-response>) istream)
  "Deserializes a message object of type '<ClearPathConstraints-response>"
    (cl:setf (cl:slot-value msg 'acknowledge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearPathConstraints-response>)))
  "Returns string type for a service object of type '<ClearPathConstraints-response>"
  "moveit_commander/ClearPathConstraintsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearPathConstraints-response)))
  "Returns string type for a service object of type 'ClearPathConstraints-response"
  "moveit_commander/ClearPathConstraintsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearPathConstraints-response>)))
  "Returns md5sum for a message object of type '<ClearPathConstraints-response>"
  "49e58fb292754f342bf15cc029614808")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearPathConstraints-response)))
  "Returns md5sum for a message object of type 'ClearPathConstraints-response"
  "49e58fb292754f342bf15cc029614808")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearPathConstraints-response>)))
  "Returns full string definition for message of type '<ClearPathConstraints-response>"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearPathConstraints-response)))
  "Returns full string definition for message of type 'ClearPathConstraints-response"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearPathConstraints-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearPathConstraints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearPathConstraints-response
    (cl:cons ':acknowledge (acknowledge msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClearPathConstraints)))
  'ClearPathConstraints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClearPathConstraints)))
  'ClearPathConstraints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearPathConstraints)))
  "Returns string type for a service object of type '<ClearPathConstraints>"
  "moveit_commander/ClearPathConstraints")