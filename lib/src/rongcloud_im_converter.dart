import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

class RCIMConverter {
  static Map<String, Function> decodeMap = {};
  static RCIMIWMessage convertMessage(Map<String, dynamic> json) {
    final messageTypeValue = json['messageType'];
    if (messageTypeValue is! int ||
        messageTypeValue < 0 ||
        messageTypeValue >= RCIMIWMessageType.values.length) {
      return RCIMIWUnknownMessage.fromJson({
        ...json,
        'messageType': RCIMIWMessageType.unknown.index,
      });
    }
    final messageType = RCIMIWMessageType.values[messageTypeValue];

    switch (messageType) {
      case RCIMIWMessageType.unknown:
        // UnknownMessage.rawData is the only raw payload exposed by the
        // wrapper. Do not invoke a registered custom decoder when the native
        // side did not provide a payload (for example, rawData == null).
        final rawData = json['rawData'];
        if (rawData is String &&
            rawData.isNotEmpty &&
            decodeMap.containsKey(json['objectName'])) {
          return _decodeCustomMessage(json);
        }
        return RCIMIWUnknownMessage.fromJson(json);
      case RCIMIWMessageType.userCustom:
        // Preserve the existing custom-message registration contract. Native
        // user-custom messages carry their decoder input in `content`, and
        // historically this branch used the rawData != "" check as a
        // compatibility signal when rawData is absent.
        if (json['rawData'] != "" &&
            decodeMap.containsKey(json['objectName'])) {
          return _decodeCustomMessage(json);
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
      case RCIMIWMessageType.stream:
        return RCIMIWStreamMessage.fromJson(json);
      case RCIMIWMessageType.nativeCustomMedia:
        return RCIMIWNativeCustomMediaMessage.fromJson(json);
      case RCIMIWMessageType.groupNotification:
        return RCIMIWGroupNotificationMessage.fromJson(json);
      case RCIMIWMessageType.combineV2:
        return RCIMIWCombineV2Message.fromJson(json);
      case RCIMIWMessageType.informationNotification:
        return RCIMIWInformationNotificationMessage.fromJson(json);
      default:
        return RCIMIWUnknownMessage.fromJson(json);
    }
  }

  static RCIMIWMessage _decodeCustomMessage(Map<String, dynamic> json) {
    final objectName = json['objectName'];
    final decoder = objectName is String ? decodeMap[objectName] : null;
    if (decoder != null) {
      try {
        final message = decoder(json);
        if (message is RCIMIWMessage) return message;
      } catch (_) {}
    }
    return RCIMIWUnknownMessage.fromJson(json);
  }
}
