package cn.rongcloud.im.wrapper.flutter;


import androidx.annotation.NonNull;
import cn.rongcloud.im.wrapper.constants.RCIMIWAreaCode;
import cn.rongcloud.im.wrapper.constants.RCIMIWBlacklistStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomEntriesOperationType;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomMemberActionType;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWConnectionStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWConversationType;
import cn.rongcloud.im.wrapper.constants.RCIMIWCustomMessagePolicy;
import cn.rongcloud.im.wrapper.constants.RCIMIWErrorCode;
import cn.rongcloud.im.wrapper.constants.RCIMIWImportanceHW;
import cn.rongcloud.im.wrapper.constants.RCIMIWImportanceHonor;
import cn.rongcloud.im.wrapper.constants.RCIMIWLogLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWMentionedType;
import cn.rongcloud.im.wrapper.constants.RCIMIWMessageBlockType;
import cn.rongcloud.im.wrapper.constants.RCIMIWMessageDirection;
import cn.rongcloud.im.wrapper.constants.RCIMIWMessageOperationPolicy;
import cn.rongcloud.im.wrapper.constants.RCIMIWMessageType;
import cn.rongcloud.im.wrapper.constants.RCIMIWNativeCustomMessagePersistentFlag;
import cn.rongcloud.im.wrapper.constants.RCIMIWPushNotificationLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWPushNotificationQuietHoursLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWReceivedStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWSentStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWTimeOrder;
import cn.rongcloud.im.wrapper.constants.RCIMIWUltraGroupTypingStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWVIVOPushType;

public class RCIMWrapperArgumentAdapter {
  private RCIMWrapperArgumentAdapter() {}

  static RCIMIWImportanceHW toRCIMIWImportanceHW(@NonNull Integer type) {
    return RCIMIWImportanceHW.values()[type];
  }

  static RCIMIWMessageOperationPolicy toRCIMIWMessageOperationPolicy(@NonNull Integer type) {
    return RCIMIWMessageOperationPolicy.values()[type];
  }

  static RCIMIWNativeCustomMessagePersistentFlag toRCIMIWNativeCustomMessagePersistentFlag(
      @NonNull Integer type) {
    return RCIMIWNativeCustomMessagePersistentFlag.values()[type];
  }

  static RCIMIWVIVOPushType toRCIMIWVIVOPushType(@NonNull Integer type) {
    return RCIMIWVIVOPushType.values()[type];
  }

  static RCIMIWSentStatus toRCIMIWSentStatus(@NonNull Integer type) {
    return RCIMIWSentStatus.values()[type];
  }

  static RCIMIWPushNotificationQuietHoursLevel toRCIMIWPushNotificationQuietHoursLevel(
      @NonNull Integer type) {
    return RCIMIWPushNotificationQuietHoursLevel.values()[type];
  }

  static RCIMIWMessageDirection toRCIMIWMessageDirection(@NonNull Integer type) {
    return RCIMIWMessageDirection.values()[type];
  }

  static RCIMIWReceivedStatus toRCIMIWReceivedStatus(@NonNull Integer type) {
    return RCIMIWReceivedStatus.values()[type];
  }

  static RCIMIWChatRoomMemberActionType toRCIMIWChatRoomMemberActionType(@NonNull Integer type) {
    return RCIMIWChatRoomMemberActionType.values()[type];
  }

  static RCIMIWPushNotificationLevel toRCIMIWPushNotificationLevel(@NonNull Integer type) {
    return RCIMIWPushNotificationLevel.values()[type];
  }

  static RCIMIWMessageType toRCIMIWMessageType(@NonNull Integer type) {
    return RCIMIWMessageType.values()[type];
  }

  static RCIMIWMessageBlockType toRCIMIWMessageBlockType(@NonNull Integer type) {
    return RCIMIWMessageBlockType.values()[type];
  }

  static RCIMIWTimeOrder toRCIMIWTimeOrder(@NonNull Integer type) {
    return RCIMIWTimeOrder.values()[type];
  }

  static RCIMIWCustomMessagePolicy toRCIMIWCustomMessagePolicy(@NonNull Integer type) {
    return RCIMIWCustomMessagePolicy.values()[type];
  }

  static RCIMIWChatRoomStatus toRCIMIWChatRoomStatus(@NonNull Integer type) {
    return RCIMIWChatRoomStatus.values()[type];
  }

  static RCIMIWConversationType toRCIMIWConversationType(@NonNull Integer type) {
    return RCIMIWConversationType.values()[type];
  }

  static RCIMIWErrorCode toRCIMIWErrorCode(@NonNull Integer type) {
    return RCIMIWErrorCode.values()[type];
  }

  static RCIMIWUltraGroupTypingStatus toRCIMIWUltraGroupTypingStatus(@NonNull Integer type) {
    return RCIMIWUltraGroupTypingStatus.values()[type];
  }

  static RCIMIWMentionedType toRCIMIWMentionedType(@NonNull Integer type) {
    return RCIMIWMentionedType.values()[type];
  }

  static RCIMIWAreaCode toRCIMIWAreaCode(@NonNull Integer type) {
    return RCIMIWAreaCode.values()[type];
  }

  static RCIMIWChatRoomEntriesOperationType toRCIMIWChatRoomEntriesOperationType(
      @NonNull Integer type) {
    return RCIMIWChatRoomEntriesOperationType.values()[type];
  }

  static RCIMIWLogLevel toRCIMIWLogLevel(@NonNull Integer type) {
    return RCIMIWLogLevel.values()[type];
  }

  static RCIMIWBlacklistStatus toRCIMIWBlacklistStatus(@NonNull Integer type) {
    return RCIMIWBlacklistStatus.values()[type];
  }

  static RCIMIWImportanceHonor toRCIMIWImportanceHonor(@NonNull Integer type) {
    return RCIMIWImportanceHonor.values()[type];
  }

  static RCIMIWConnectionStatus toRCIMIWConnectionStatus(@NonNull Integer type) {
    return RCIMIWConnectionStatus.values()[type];
  }
}
