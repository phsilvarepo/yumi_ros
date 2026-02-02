// Auto-generated. Do not edit!

// (in-package moveit_commander.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class AddObjectToSceneRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.object_template = null;
      this.frame_id = null;
      this.pose = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('object_template')) {
        this.object_template = initObj.object_template
      }
      else {
        this.object_template = '';
      }
      if (initObj.hasOwnProperty('frame_id')) {
        this.frame_id = initObj.frame_id
      }
      else {
        this.frame_id = '';
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddObjectToSceneRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [object_template]
    bufferOffset = _serializer.string(obj.object_template, buffer, bufferOffset);
    // Serialize message field [frame_id]
    bufferOffset = _serializer.string(obj.frame_id, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddObjectToSceneRequest
    let len;
    let data = new AddObjectToSceneRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [object_template]
    data.object_template = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [frame_id]
    data.frame_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += _getByteLength(object.object_template);
    length += _getByteLength(object.frame_id);
    return length + 68;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/AddObjectToSceneRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fdb9b76adbf7ae472f5745ad9db6145d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddObjectToSceneRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.object_template !== undefined) {
      resolved.object_template = msg.object_template;
    }
    else {
      resolved.object_template = ''
    }

    if (msg.frame_id !== undefined) {
      resolved.frame_id = msg.frame_id;
    }
    else {
      resolved.frame_id = ''
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    return resolved;
    }
};

class AddObjectToSceneResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.acknowledge = null;
    }
    else {
      if (initObj.hasOwnProperty('acknowledge')) {
        this.acknowledge = initObj.acknowledge
      }
      else {
        this.acknowledge = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddObjectToSceneResponse
    // Serialize message field [acknowledge]
    bufferOffset = _serializer.bool(obj.acknowledge, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddObjectToSceneResponse
    let len;
    let data = new AddObjectToSceneResponse(null);
    // Deserialize message field [acknowledge]
    data.acknowledge = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/AddObjectToSceneResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '49e58fb292754f342bf15cc029614808';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool acknowledge
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddObjectToSceneResponse(null);
    if (msg.acknowledge !== undefined) {
      resolved.acknowledge = msg.acknowledge;
    }
    else {
      resolved.acknowledge = false
    }

    return resolved;
    }
};

module.exports = {
  Request: AddObjectToSceneRequest,
  Response: AddObjectToSceneResponse,
  md5sum() { return 'ef97a7771d19303a88031df9a8b7a932'; },
  datatype() { return 'moveit_commander/AddObjectToScene'; }
};
