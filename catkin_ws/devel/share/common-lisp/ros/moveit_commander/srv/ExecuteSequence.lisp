; Auto-generated. Do not edit!


(cl:in-package moveit_commander-srv)


;//! \htmlinclude ExecuteSequence-request.msg.html

(cl:defclass <ExecuteSequence-request> (roslisp-msg-protocol:ros-message)
  ((sequence_name
    :reader sequence_name
    :initarg :sequence_name
    :type cl:string
    :initform ""))
)

(cl:defclass ExecuteSequence-request (<ExecuteSequence-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecuteSequence-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecuteSequence-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<ExecuteSequence-request> is deprecated: use moveit_commander-srv:ExecuteSequence-request instead.")))

(cl:ensure-generic-function 'sequence_name-val :lambda-list '(m))
(cl:defmethod sequence_name-val ((m <ExecuteSequence-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:sequence_name-val is deprecated.  Use moveit_commander-srv:sequence_name instead.")
  (sequence_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecuteSequence-request>) ostream)
  "Serializes a message object of type '<ExecuteSequence-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sequence_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sequence_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecuteSequence-request>) istream)
  "Deserializes a message object of type '<ExecuteSequence-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sequence_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sequence_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecuteSequence-request>)))
  "Returns string type for a service object of type '<ExecuteSequence-request>"
  "moveit_commander/ExecuteSequenceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteSequence-request)))
  "Returns string type for a service object of type 'ExecuteSequence-request"
  "moveit_commander/ExecuteSequenceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecuteSequence-request>)))
  "Returns md5sum for a message object of type '<ExecuteSequence-request>"
  "65d92ddaa3284a638f28b061d5f3a854")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecuteSequence-request)))
  "Returns md5sum for a message object of type 'ExecuteSequence-request"
  "65d92ddaa3284a638f28b061d5f3a854")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecuteSequence-request>)))
  "Returns full string definition for message of type '<ExecuteSequence-request>"
  (cl:format cl:nil "string sequence_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecuteSequence-request)))
  "Returns full string definition for message of type 'ExecuteSequence-request"
  (cl:format cl:nil "string sequence_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecuteSequence-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sequence_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecuteSequence-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecuteSequence-request
    (cl:cons ':sequence_name (sequence_name msg))
))
;//! \htmlinclude ExecuteSequence-response.msg.html

(cl:defclass <ExecuteSequence-response> (roslisp-msg-protocol:ros-message)
  ((acknowledge
    :reader acknowledge
    :initarg :acknowledge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ExecuteSequence-response (<ExecuteSequence-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecuteSequence-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecuteSequence-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_commander-srv:<ExecuteSequence-response> is deprecated: use moveit_commander-srv:ExecuteSequence-response instead.")))

(cl:ensure-generic-function 'acknowledge-val :lambda-list '(m))
(cl:defmethod acknowledge-val ((m <ExecuteSequence-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_commander-srv:acknowledge-val is deprecated.  Use moveit_commander-srv:acknowledge instead.")
  (acknowledge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecuteSequence-response>) ostream)
  "Serializes a message object of type '<ExecuteSequence-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'acknowledge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecuteSequence-response>) istream)
  "Deserializes a message object of type '<ExecuteSequence-response>"
    (cl:setf (cl:slot-value msg 'acknowledge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecuteSequence-response>)))
  "Returns string type for a service object of type '<ExecuteSequence-response>"
  "moveit_commander/ExecuteSequenceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteSequence-response)))
  "Returns string type for a service object of type 'ExecuteSequence-response"
  "moveit_commander/ExecuteSequenceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecuteSequence-response>)))
  "Returns md5sum for a message object of type '<ExecuteSequence-response>"
  "65d92ddaa3284a638f28b061d5f3a854")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecuteSequence-response)))
  "Returns md5sum for a message object of type 'ExecuteSequence-response"
  "65d92ddaa3284a638f28b061d5f3a854")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecuteSequence-response>)))
  "Returns full string definition for message of type '<ExecuteSequence-response>"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecuteSequence-response)))
  "Returns full string definition for message of type 'ExecuteSequence-response"
  (cl:format cl:nil "bool acknowledge~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecuteSequence-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecuteSequence-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecuteSequence-response
    (cl:cons ':acknowledge (acknowledge msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecuteSequence)))
  'ExecuteSequence-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecuteSequence)))
  'ExecuteSequence-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteSequence)))
  "Returns string type for a service object of type '<ExecuteSequence>"
  "moveit_commander/ExecuteSequence")