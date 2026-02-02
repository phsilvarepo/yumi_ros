;; Auto-generated. Do not edit!


(when (boundp 'moveit_commander::AttachObject)
  (if (not (find-package "MOVEIT_COMMANDER"))
    (make-package "MOVEIT_COMMANDER"))
  (shadow 'AttachObject (find-package "MOVEIT_COMMANDER")))
(unless (find-package "MOVEIT_COMMANDER::ATTACHOBJECT")
  (make-package "MOVEIT_COMMANDER::ATTACHOBJECT"))
(unless (find-package "MOVEIT_COMMANDER::ATTACHOBJECTREQUEST")
  (make-package "MOVEIT_COMMANDER::ATTACHOBJECTREQUEST"))
(unless (find-package "MOVEIT_COMMANDER::ATTACHOBJECTRESPONSE")
  (make-package "MOVEIT_COMMANDER::ATTACHOBJECTRESPONSE"))

(in-package "ROS")





(defclass moveit_commander::AttachObjectRequest
  :super ros::object
  :slots (_name _frame_id ))

(defmethod moveit_commander::AttachObjectRequest
  (:init
   (&key
    ((:name __name) "")
    ((:frame_id __frame_id) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _frame_id (string __frame_id))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _frame_id
    4 (length _frame_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_commander::AttachObjectResponse
  :super ros::object
  :slots (_acknowledge ))

(defmethod moveit_commander::AttachObjectResponse
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

(defclass moveit_commander::AttachObject
  :super ros::object
  :slots ())

(setf (get moveit_commander::AttachObject :md5sum-) "3dc60b3ba98237bbd45bfef93f9da692")
(setf (get moveit_commander::AttachObject :datatype-) "moveit_commander/AttachObject")
(setf (get moveit_commander::AttachObject :request) moveit_commander::AttachObjectRequest)
(setf (get moveit_commander::AttachObject :response) moveit_commander::AttachObjectResponse)

(defmethod moveit_commander::AttachObjectRequest
  (:response () (instance moveit_commander::AttachObjectResponse :init)))

(setf (get moveit_commander::AttachObjectRequest :md5sum-) "3dc60b3ba98237bbd45bfef93f9da692")
(setf (get moveit_commander::AttachObjectRequest :datatype-) "moveit_commander/AttachObjectRequest")
(setf (get moveit_commander::AttachObjectRequest :definition-)
      "string name
string frame_id
---
bool acknowledge
")

(setf (get moveit_commander::AttachObjectResponse :md5sum-) "3dc60b3ba98237bbd45bfef93f9da692")
(setf (get moveit_commander::AttachObjectResponse :datatype-) "moveit_commander/AttachObjectResponse")
(setf (get moveit_commander::AttachObjectResponse :definition-)
      "string name
string frame_id
---
bool acknowledge
")



(provide :moveit_commander/AttachObject "3dc60b3ba98237bbd45bfef93f9da692")


