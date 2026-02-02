;; Auto-generated. Do not edit!


(when (boundp 'moveit_commander::SetPathConstraints)
  (if (not (find-package "MOVEIT_COMMANDER"))
    (make-package "MOVEIT_COMMANDER"))
  (shadow 'SetPathConstraints (find-package "MOVEIT_COMMANDER")))
(unless (find-package "MOVEIT_COMMANDER::SETPATHCONSTRAINTS")
  (make-package "MOVEIT_COMMANDER::SETPATHCONSTRAINTS"))
(unless (find-package "MOVEIT_COMMANDER::SETPATHCONSTRAINTSREQUEST")
  (make-package "MOVEIT_COMMANDER::SETPATHCONSTRAINTSREQUEST"))
(unless (find-package "MOVEIT_COMMANDER::SETPATHCONSTRAINTSRESPONSE")
  (make-package "MOVEIT_COMMANDER::SETPATHCONSTRAINTSRESPONSE"))

(in-package "ROS")





(defclass moveit_commander::SetPathConstraintsRequest
  :super ros::object
  :slots (_name ))

(defmethod moveit_commander::SetPathConstraintsRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_commander::SetPathConstraintsResponse
  :super ros::object
  :slots (_acknowledge ))

(defmethod moveit_commander::SetPathConstraintsResponse
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

(defclass moveit_commander::SetPathConstraints
  :super ros::object
  :slots ())

(setf (get moveit_commander::SetPathConstraints :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::SetPathConstraints :datatype-) "moveit_commander/SetPathConstraints")
(setf (get moveit_commander::SetPathConstraints :request) moveit_commander::SetPathConstraintsRequest)
(setf (get moveit_commander::SetPathConstraints :response) moveit_commander::SetPathConstraintsResponse)

(defmethod moveit_commander::SetPathConstraintsRequest
  (:response () (instance moveit_commander::SetPathConstraintsResponse :init)))

(setf (get moveit_commander::SetPathConstraintsRequest :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::SetPathConstraintsRequest :datatype-) "moveit_commander/SetPathConstraintsRequest")
(setf (get moveit_commander::SetPathConstraintsRequest :definition-)
      "string name
---
bool acknowledge
")

(setf (get moveit_commander::SetPathConstraintsResponse :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::SetPathConstraintsResponse :datatype-) "moveit_commander/SetPathConstraintsResponse")
(setf (get moveit_commander::SetPathConstraintsResponse :definition-)
      "string name
---
bool acknowledge
")



(provide :moveit_commander/SetPathConstraints "f24e999f14fde73573863e4f3aa6d481")


