;; Auto-generated. Do not edit!


(when (boundp 'moveit_commander::RemoveObjectFromScene)
  (if (not (find-package "MOVEIT_COMMANDER"))
    (make-package "MOVEIT_COMMANDER"))
  (shadow 'RemoveObjectFromScene (find-package "MOVEIT_COMMANDER")))
(unless (find-package "MOVEIT_COMMANDER::REMOVEOBJECTFROMSCENE")
  (make-package "MOVEIT_COMMANDER::REMOVEOBJECTFROMSCENE"))
(unless (find-package "MOVEIT_COMMANDER::REMOVEOBJECTFROMSCENEREQUEST")
  (make-package "MOVEIT_COMMANDER::REMOVEOBJECTFROMSCENEREQUEST"))
(unless (find-package "MOVEIT_COMMANDER::REMOVEOBJECTFROMSCENERESPONSE")
  (make-package "MOVEIT_COMMANDER::REMOVEOBJECTFROMSCENERESPONSE"))

(in-package "ROS")





(defclass moveit_commander::RemoveObjectFromSceneRequest
  :super ros::object
  :slots (_name ))

(defmethod moveit_commander::RemoveObjectFromSceneRequest
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

(defclass moveit_commander::RemoveObjectFromSceneResponse
  :super ros::object
  :slots (_acknowledge ))

(defmethod moveit_commander::RemoveObjectFromSceneResponse
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

(defclass moveit_commander::RemoveObjectFromScene
  :super ros::object
  :slots ())

(setf (get moveit_commander::RemoveObjectFromScene :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::RemoveObjectFromScene :datatype-) "moveit_commander/RemoveObjectFromScene")
(setf (get moveit_commander::RemoveObjectFromScene :request) moveit_commander::RemoveObjectFromSceneRequest)
(setf (get moveit_commander::RemoveObjectFromScene :response) moveit_commander::RemoveObjectFromSceneResponse)

(defmethod moveit_commander::RemoveObjectFromSceneRequest
  (:response () (instance moveit_commander::RemoveObjectFromSceneResponse :init)))

(setf (get moveit_commander::RemoveObjectFromSceneRequest :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::RemoveObjectFromSceneRequest :datatype-) "moveit_commander/RemoveObjectFromSceneRequest")
(setf (get moveit_commander::RemoveObjectFromSceneRequest :definition-)
      "string name
---
bool acknowledge
")

(setf (get moveit_commander::RemoveObjectFromSceneResponse :md5sum-) "f24e999f14fde73573863e4f3aa6d481")
(setf (get moveit_commander::RemoveObjectFromSceneResponse :datatype-) "moveit_commander/RemoveObjectFromSceneResponse")
(setf (get moveit_commander::RemoveObjectFromSceneResponse :definition-)
      "string name
---
bool acknowledge
")



(provide :moveit_commander/RemoveObjectFromScene "f24e999f14fde73573863e4f3aa6d481")


