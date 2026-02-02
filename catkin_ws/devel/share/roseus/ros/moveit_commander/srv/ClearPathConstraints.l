;; Auto-generated. Do not edit!


(when (boundp 'moveit_commander::ClearPathConstraints)
  (if (not (find-package "MOVEIT_COMMANDER"))
    (make-package "MOVEIT_COMMANDER"))
  (shadow 'ClearPathConstraints (find-package "MOVEIT_COMMANDER")))
(unless (find-package "MOVEIT_COMMANDER::CLEARPATHCONSTRAINTS")
  (make-package "MOVEIT_COMMANDER::CLEARPATHCONSTRAINTS"))
(unless (find-package "MOVEIT_COMMANDER::CLEARPATHCONSTRAINTSREQUEST")
  (make-package "MOVEIT_COMMANDER::CLEARPATHCONSTRAINTSREQUEST"))
(unless (find-package "MOVEIT_COMMANDER::CLEARPATHCONSTRAINTSRESPONSE")
  (make-package "MOVEIT_COMMANDER::CLEARPATHCONSTRAINTSRESPONSE"))

(in-package "ROS")





(defclass moveit_commander::ClearPathConstraintsRequest
  :super ros::object
  :slots ())

(defmethod moveit_commander::ClearPathConstraintsRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass moveit_commander::ClearPathConstraintsResponse
  :super ros::object
  :slots (_acknowledge ))

(defmethod moveit_commander::ClearPathConstraintsResponse
  (:init
   (&key
    ((:acknowledge __acknowledge) nil)
    )
   (send-super :init)
   (setq _acknowledge __acknowledge)
   self)
  (:acknowledge
   (&optional (__acknowledge :null))
   (if (not (eq __acknowledge :null)) (setq _acknowledge __acknowledge)) _acknowledge)
  (:serialization-length
   ()
   (+
    ;; bool _acknowledge
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _acknowledge
       (if _acknowledge (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _acknowledge
     (setq _acknowledge (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass moveit_commander::ClearPathConstraints
  :super ros::object
  :slots ())

(setf (get moveit_commander::ClearPathConstraints :md5sum-) "49e58fb292754f342bf15cc029614808")
(setf (get moveit_commander::ClearPathConstraints :datatype-) "moveit_commander/ClearPathConstraints")
(setf (get moveit_commander::ClearPathConstraints :request) moveit_commander::ClearPathConstraintsRequest)
(setf (get moveit_commander::ClearPathConstraints :response) moveit_commander::ClearPathConstraintsResponse)

(defmethod moveit_commander::ClearPathConstraintsRequest
  (:response () (instance moveit_commander::ClearPathConstraintsResponse :init)))

(setf (get moveit_commander::ClearPathConstraintsRequest :md5sum-) "49e58fb292754f342bf15cc029614808")
(setf (get moveit_commander::ClearPathConstraintsRequest :datatype-) "moveit_commander/ClearPathConstraintsRequest")
(setf (get moveit_commander::ClearPathConstraintsRequest :definition-)
      "
---
bool acknowledge
")

(setf (get moveit_commander::ClearPathConstraintsResponse :md5sum-) "49e58fb292754f342bf15cc029614808")
(setf (get moveit_commander::ClearPathConstraintsResponse :datatype-) "moveit_commander/ClearPathConstraintsResponse")
(setf (get moveit_commander::ClearPathConstraintsResponse :definition-)
      "
---
bool acknowledge
")



(provide :moveit_commander/ClearPathConstraints "49e58fb292754f342bf15cc029614808")


