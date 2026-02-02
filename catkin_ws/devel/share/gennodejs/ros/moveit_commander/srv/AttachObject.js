// Auto-generated. Do not edit!

// (in-package moveit_commander.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class AttachObjectRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.frame_id = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('frame_id')) {
        this.frame_id = initObj.frame_id
      }
      else {
        this.frame_id = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AttachObjectRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [frame_id]
    bufferOffset = _serializer.string(obj.frame_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AttachObjectRequest
    let len;
    let data = new AttachObjectRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [frame_id]
    data.frame_id = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += _getByteLength(object.frame_id);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/AttachObjectRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '06f4215fb1ec5c28a0871e1187a86d71';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AttachObjectRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.frame_id !== undefined) {
      resolved.frame_id = msg.frame_id;
    }
    else {
      resolved.frame_id = ''
    }

    return resolved;
    }
};

class AttachObjectResponse {
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
    // Serializes a message object of type AttachObjectResponse
    // Serialize message field [acknowledge]
    bufferOffset = _serializer.bool(obj.acknowledge, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AttachObjectResponse
    let len;
    let data = new AttachObjectResponse(null);
    // Deserialize message field [acknowledge]
    data.acknowledge = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/AttachObjectResponse';
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
    const resolved = new AttachObjectResponse(null);
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
  Request: AttachObjectRequest,
  Response: AttachObjectResponse,
  md5sum() { return '3dc60b3ba98237bbd45bfef93f9da692'; },
  datatype() { return 'moveit_commander/AttachObject'; }
};
