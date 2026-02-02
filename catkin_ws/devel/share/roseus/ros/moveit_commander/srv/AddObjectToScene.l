;; Auto-generated. Do not edit!


(when (boundp 'moveit_commander::AddObjectToScene)
  (if (not (find-package "MOVEIT_COMMANDER"))
    (make-package "MOVEIT_COMMANDER"))
  (shadow 'AddObjectToScene (find-package "MOVEIT_COMMANDER")))
(unless (find-package "MOVEIT_COMMANDER::ADDOBJECTTOSCENE")
  (make-package "MOVEIT_COMMANDER::ADDOBJECTTOSCENE"))
(unless (find-package "MOVEIT_COMMANDER::ADDOBJECTTOSCENEREQUEST")
  (make-package "MOVEIT_COMMANDER::ADDOBJECTTOSCENEREQUEST"))
(unless (find-package "MOVEIT_COMMANDER::ADDOBJECTTOSCENERESPONSE")
  (make-package "MOVEIT_COMMANDER::ADDOBJECTTOSCENERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass moveit_commander::AddObjectToSceneRequest
  :super ros::object
  :slots (_name _object_template _frame_id _pose ))

(defmethod moveit_commander::AddObjectToSceneRequest
  (:init
   (&key
    ((:name __name) "")
    ((:object_template __object_template) "")
    ((:frame_id __frame_id) "")
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _object_template (string __object_template))
   (setq _frame_id (string __frame_id))
   (setq _pose __pose)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:object_template
   (&optional __object_template)
   (if __object_template (setq _object_template __object_template)) _object_template)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _object_template
    4 (length _object_template)
    ;; string _frame_id
    4 (length _frame_id)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _object_template
       (write-long (length _object_template) s) (princ _object_template s)
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _object_template
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _object_template (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass moveit_commander::AddObjectToSceneResponse
  :super ros::object
  :slots (_acknowledge ))

(defmethod moveit_commander::AddObjectToSceneResponse
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

(defclass moveit_commander::AddObjectToScene
  :super ros::object
  :slots ())

(setf (get moveit_commander::AddObjectToScene :md5sum-) "ef97a7771d19303a88031df9a8b7a932")
(setf (get moveit_commander::AddObjectToScene :datatype-) "moveit_commander/AddObjectToScene")
(setf (get moveit_commander::AddObjectToScene :request) moveit_commander::AddObjectToSceneRequest)
(setf (get moveit_commander::AddObjectToScene :response) moveit_commander::AddObjectToSceneResponse)

(defmethod moveit_commander::AddObjectToSceneRequest
  (:response () (instance moveit_commander::AddObjectToSceneResponse :init)))

(setf (get moveit_commander::AddObjectToSceneRequest :md5sum-) "ef97a7771d19303a88031df9a8b7a932")
(setf (get moveit_commander::AddObjectToSceneRequest :datatype-) "moveit_commander/AddObjectToSceneRequest")
(setf (get moveit_commander::AddObjectToSceneRequest :definition-)
      "string name
string object_template
string frame_id
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool acknowledge
")

(setf (get moveit_commander::AddObjectToSceneResponse :md5sum-) "ef97a7771d19303a88031df9a8b7a932")
(setf (get moveit_commander::AddObjectToSceneResponse :datatype-) "moveit_commander/AddObjectToSceneResponse")
(setf (get moveit_commander::AddObjectToSceneResponse :definition-)
      "string name
string object_template
string frame_id
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool acknowledge
")



(provide :moveit_commander/AddObjectToScene "ef97a7771d19303a88031df9a8b7a932")


