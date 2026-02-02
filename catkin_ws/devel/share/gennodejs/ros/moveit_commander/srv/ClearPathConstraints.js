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

class ClearPathConstraintsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ClearPathConstraintsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ClearPathConstraintsRequest
    let len;
    let data = new ClearPathConstraintsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/ClearPathConstraintsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ClearPathConstraintsRequest(null);
    return resolved;
    }
};

class ClearPathConstraintsResponse {
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
    // Serializes a message object of type ClearPathConstraintsResponse
    // Serialize message field [acknowledge]
    bufferOffset = _serializer.bool(obj.acknowledge, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ClearPathConstraintsResponse
    let len;
    let data = new ClearPathConstraintsResponse(null);
    // Deserialize message field [acknowledge]
    data.acknowledge = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/ClearPathConstraintsResponse';
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
    const resolved = new ClearPathConstraintsResponse(null);
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
  Request: ClearPathConstraintsRequest,
  Response: ClearPathConstraintsResponse,
  md5sum() { return '49e58fb292754f342bf15cc029614808'; },
  datatype() { return 'moveit_commander/ClearPathConstraints'; }
};
