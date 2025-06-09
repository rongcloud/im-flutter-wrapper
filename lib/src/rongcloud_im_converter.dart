import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

class RCIMConverter {
  static Map<String, Function> decodeMap = {};
  static RCIMIWMessage convertMessage(Map<String, dynamic> json) {
    RCIMIWMessageType messageType =
        RCIMIWMessageType.values[json['messageType']];

    switch (messageType) {
      case RCIMIWMessageType.unknown:
      case RCIMIWMessageType.userCustom:
        if (json['rawData'] != "" &&
            decodeMap.containsKey(json['objectName'])) {
          return decodeMap[json['objectName']!]!(json);
        }
        return RCIMIWUnknownMessage.fromJson(json);
      case RCIMIWMessageType.custom:
        return RCIMIWCustomMessage.fromJson(json);
      case RCIMIWMessageType.text:
        return RCIMIWTextMessage.fromJson(json);
      case RCIMIWMessageType.voice:
        var duration = json['duration'];
        // web 端有返回 double 的情况
        if (duration is double) {
          json['duration'] = duration.ceil();
        }
        return RCIMIWVoiceMessage.fromJson(json);
      case RCIMIWMessageType.image:
        return RCIMIWImageMessage.fromJson(json);
      case RCIMIWMessageType.file:
        return RCIMIWFileMessage.fromJson(json);
      case RCIMIWMessageType.sight:
        var duration = json['duration'];
        // web 端有返回 double 的情况
        if (duration is double) {
          json['duration'] = duration.ceil();
        }
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
      case RCIMIWMessageType.nativeCustom:
        return RCIMIWNativeCustomMessage.fromJson(json);
      case RCIMIWMessageType.nativeCustomMedia:
        return RCIMIWNativeCustomMediaMessage.fromJson(json);
      case RCIMIWMessageType.groupNotification:
        return RCIMIWGroupNotificationMessage.fromJson(json);
    }
  }
}
