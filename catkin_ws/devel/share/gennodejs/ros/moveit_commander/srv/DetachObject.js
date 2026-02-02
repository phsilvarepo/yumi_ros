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

class DetachObjectRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DetachObjectRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DetachObjectRequest
    let len;
    let data = new DetachObjectRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/DetachObjectRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1f3d28f1b044c871e6eff2e9fc3c667';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DetachObjectRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    return resolved;
    }
};

class DetachObjectResponse {
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
    // Serializes a message object of type DetachObjectResponse
    // Serialize message field [acknowledge]
    bufferOffset = _serializer.bool(obj.acknowledge, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DetachObjectResponse
    let len;
    let data = new DetachObjectResponse(null);
    // Deserialize message field [acknowledge]
    data.acknowledge = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/DetachObjectResponse';
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
    const resolved = new DetachObjectResponse(null);
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
  Request: DetachObjectRequest,
  Response: DetachObjectResponse,
  md5sum() { return 'f24e999f14fde73573863e4f3aa6d481'; },
  datatype() { return 'moveit_commander/DetachObject'; }
};
