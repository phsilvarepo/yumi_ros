;; Auto-generated. Do not edit!


(when (boundp 'moveit_commander::ExecuteSequence)
  (if (not (find-package "MOVEIT_COMMANDER"))
    (make-package "MOVEIT_COMMANDER"))
  (shadow 'ExecuteSequence (find-package "MOVEIT_COMMANDER")))
(unless (find-package "MOVEIT_COMMANDER::EXECUTESEQUENCE")
  (make-package "MOVEIT_COMMANDER::EXECUTESEQUENCE"))
(unless (find-package "MOVEIT_COMMANDER::EXECUTESEQUENCEREQUEST")
  (make-package "MOVEIT_COMMANDER::EXECUTESEQUENCEREQUEST"))
(unless (find-package "MOVEIT_COMMANDER::EXECUTESEQUENCERESPONSE")
  (make-package "MOVEIT_COMMANDER::EXECUTESEQUENCERESPONSE"))

(in-package "ROS")





(defclass moveit_commander::ExecuteSequenceRequest
  :super ros::object
  :slots (_sequence_name ))

(defmethod moveit_commander::ExecuteSequenceRequest
  (:init
   (&key
    ((:sequence_name __sequence_name) "")
    )
   (send-super :init)
   (setq _sequence_name (string __sequence_name))
   self)
  (:sequence_name
   (&optional __sequence_name)
   (if __sequence_name (setq _sequence_name __sequence_name)) _sequence_name)
  (:serialization-length
   ()
   (+
    ;; string _sequence_name
    4 (length _sequence_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sequence_name
       (write-long (length _sequence_name) s) (princ _sequence_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sequence_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sequence_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_commander::ExecuteSequenceResponse
  :super ros::object
  :slots (_acknowledge ))

(defmethod moveit_commander::ExecuteSequenceResponse
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

(defclass moveit_commander::ExecuteSequence
  :super ros::object
  :slots ())

(setf (get moveit_commander::ExecuteSequence :md5sum-) "65d92ddaa3284a638f28b061d5f3a854")
(setf (get moveit_commander::ExecuteSequence :datatype-) "moveit_commander/ExecuteSequence")
(setf (get moveit_commander::ExecuteSequence :request) moveit_commander::ExecuteSequenceRequest)
(setf (get moveit_commander::ExecuteSequence :response) moveit_commander::ExecuteSequenceResponse)

(defmethod moveit_commander::ExecuteSequenceRequest
  (:response () (instance moveit_commander::ExecuteSequenceResponse :init)))

(setf (get moveit_commander::ExecuteSequenceRequest :md5sum-) "65d92ddaa3284a638f28b061d5f3a854")
(setf (get moveit_commander::ExecuteSequenceRequest :datatype-) "moveit_commander/ExecuteSequenceRequest")
(setf (get moveit_commander::ExecuteSequenceRequest :definition-)
      "string sequence_name
---
bool acknowledge
")

(setf (get moveit_commander::ExecuteSequenceResponse :md5sum-) "65d92ddaa3284a638f28b061d5f3a854")
(setf (get moveit_commander::ExecuteSequenceResponse :datatype-) "moveit_commander/ExecuteSequenceResponse")
(setf (get moveit_commander::ExecuteSequenceResponse :definition-)
      "string sequence_name
---
bool acknowledge
")



(provide :moveit_commander/ExecuteSequence "65d92ddaa3284a638f28b061d5f3a854")


