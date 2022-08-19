import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

class RCIMConverter {
  static RCIMIWMessage convertMessage(Map<String, dynamic> json) {
    RCIMIWMessageType messageType =
        RCIMIWMessageType.values[json['messageType']];

    switch (messageType) {
      case RCIMIWMessageType.unknown:
        return RCIMIWUnknownMessage.fromJson(json);
      case RCIMIWMessageType.custom:
        return RCIMIWCustomMessage.fromJson(json);
      case RCIMIWMessageType.text:
        return RCIMIWTextMessage.fromJson(json);
      case RCIMIWMessageType.voice:
        return RCIMIWVoiceMessage.fromJson(json);
      case RCIMIWMessageType.image:
        return RCIMIWImageMessage.fromJson(json);
      case RCIMIWMessageType.file:
        return RCIMIWFileMessage.fromJson(json);
      case RCIMIWMessageType.sight:
        return RCIMIWSightMessage.fromJson(json);
      case RCIMIWMessageType.gif:
        return RCIMIWGIFMessage.fromJson(json);
      case RCIMIWMessageType.recall:
        return RCIMIWRecallNotificationMessage.fromJson(json);
      case RCIMIWMessageType.reference:
        return RCIMIWReferenceMessage.fromJson(json);
      case RCIMIWMessageType.command:
        return RCIMIWCommandMessage.fromJson(json);
      case RCIMIWMessageType.commandNotification:
        return RCIMIWCommandNotificationMessage.fromJson(json);
      case RCIMIWMessageType.location:
        return RCIMIWLocationMessage.fromJson(json);
    }
  }
}
