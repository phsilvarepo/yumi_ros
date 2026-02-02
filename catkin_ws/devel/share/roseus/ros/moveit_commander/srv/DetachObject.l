;; Auto-generated. Do not edit!


(when (boundp 'moveit_commander::DetachObject)
  (if (not (find-package "MOVEIT_COMMANDER"))
    (make-package "MOVEIT_COMMANDER"))
  (shadow 'DetachObject (find-package "MOVEIT_COMMANDER")))
(unless (find-package "MOVEIT_COMMANDER::DETACHOBJECT")
  (make-package "MOVEIT_COMMANDER::DETACHOBJECT"))
(unless (find-package "MOVEIT_COMMANDER::DETACHOBJECTREQUEST")
  (make-package "MOVEIT_COMMANDER::DETACHOBJECTREQUEST"))
(unless (find-package "MOVEIT_COMMANDER::DETACHOBJECTRESPONSE")
  (make-package "MOVEIT_COMMANDER::DETACHOBJECTRESPONSE"))

(in-package "ROS")





(defclass moveit_commander::DetachObjectRequest
  :super ros::object
  :slots (_name ))

(defmethod moveit_commander::DetachObjectRequest
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

(defclass moveit_commander::DetachObjectResponse
  :super ros::object
  :slots (_acknowledge ))

(defmethod moveit_commander::DetachObjectResponse
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

(defclass moveit_commander::DetachObject
  :super ros::object
  :slots ())

(setf (get moveit_commander::DetachObject :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::DetachObject :datatype-) "moveit_commander/DetachObject")
(setf (get moveit_commander::DetachObject :request) moveit_commander::DetachObjectRequest)
(setf (get moveit_commander::DetachObject :response) moveit_commander::DetachObjectResponse)

(defmethod moveit_commander::DetachObjectRequest
  (:response () (instance moveit_commander::DetachObjectResponse :init)))

(setf (get moveit_commander::DetachObjectRequest :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::DetachObjectRequest :datatype-) "moveit_commander/DetachObjectRequest")
(setf (get moveit_commander::DetachObjectRequest :definition-)
      "string name
---
bool acknowledge
")

(setf (get moveit_commander::DetachObjectResponse :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::DetachObjectResponse :datatype-) "moveit_commander/DetachObjectResponse")
(setf (get moveit_commander::DetachObjectResponse :definition-)
      "string name
---
bool acknowledge
")



(provide :moveit_commander/DetachObject "f24e999f14fde73573863e4f3aa6d481")


