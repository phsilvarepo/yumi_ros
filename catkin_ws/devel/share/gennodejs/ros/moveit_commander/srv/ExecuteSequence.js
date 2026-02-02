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

class ExecuteSequenceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sequence_name = null;
    }
    else {
      if (initObj.hasOwnProperty('sequence_name')) {
        this.sequence_name = initObj.sequence_name
      }
      else {
        this.sequence_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExecuteSequenceRequest
    // Serialize message field [sequence_name]
    bufferOffset = _serializer.string(obj.sequence_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecuteSequenceRequest
    let len;
    let data = new ExecuteSequenceRequest(null);
    // Deserialize message field [sequence_name]
    data.sequence_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.sequence_name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/ExecuteSequenceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52c8109f5f66115d8b7c47f5e2f8a7f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sequence_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ExecuteSequenceRequest(null);
    if (msg.sequence_name !== undefined) {
      resolved.sequence_name = msg.sequence_name;
    }
    else {
      resolved.sequence_name = ''
    }

    return resolved;
    }
};

class ExecuteSequenceResponse {
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
    // Serializes a message object of type ExecuteSequenceResponse
    // Serialize message field [acknowledge]
    bufferOffset = _serializer.bool(obj.acknowledge, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecuteSequenceResponse
    let len;
    let data = new ExecuteSequenceResponse(null);
    // Deserialize message field [acknowledge]
    data.acknowledge = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_commander/ExecuteSequenceResponse';
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
    const resolved = new ExecuteSequenceResponse(null);
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
  Request: ExecuteSequenceRequest,
  Response: ExecuteSequenceResponse,
  md5sum() { return '65d92ddaa3284a638f28b061d5f3a854'; },
  datatype() { return 'moveit_commander/ExecuteSequence'; }
};
