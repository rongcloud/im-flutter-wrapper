package cn.rongcloud.im.wrapper.flutter;


import androidx.annotation.NonNull;
import cn.rongcloud.im.wrapper.constants.RCIMIWAreaCode;
import cn.rongcloud.im.wrapper.constants.RCIMIWBlacklistStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomEntriesOperationType;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomMemberActionType;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomMemberBanType;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomMemberOperateType;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomSyncStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomSyncStatusReason;
import cn.rongcloud.im.wrapper.constants.RCIMIWConnectionStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWConversationType;
import cn.rongcloud.im.wrapper.constants.RCIMIWCustomMessagePolicy;
import cn.rongcloud.im.wrapper.constants.RCIMIWErrorCode;
import cn.rongcloud.im.wrapper.constants.RCIMIWImportanceHW;
import cn.rongcloud.im.wrapper.constants.RCIMIWImportanceHonor;
import cn.rongcloud.im.wrapper.constants.RCIMIWLogLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWMentionedType;
import cn.rongcloud.im.wrapper.constants.RCIMIWMessageAuditType;
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
import cn.rongcloud.im.wrapper.constants.RCIMIWTranslateMode;
import cn.rongcloud.im.wrapper.constants.RCIMIWTranslateResultType;
import cn.rongcloud.im.wrapper.constants.RCIMIWTranslateStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWTranslateStrategy;
import cn.rongcloud.im.wrapper.constants.RCIMIWUltraGroupTypingStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWVIVOPushType;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupApplicationDirection;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupApplicationStatus;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupApplicationType;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupInviteHandlePermission;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupJoinPermission;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupMemberInfoEditPermission;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupMemberRole;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupOperation;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupOperationPermission;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupOperationType;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupStatus;
import cn.rongcloud.im.wrapper.subscribeevent.RCIMIWPlatform;
import cn.rongcloud.im.wrapper.subscribeevent.RCIMIWSubscribeOperationType;
import cn.rongcloud.im.wrapper.subscribeevent.RCIMIWSubscribeType;
import cn.rongcloud.im.wrapper.userprofile.RCIMIWUserGender;
import cn.rongcloud.im.wrapper.userprofile.RCIMIWUserProfileVisibility;

public class RCIMWrapperArgumentAdapter {
  private RCIMWrapperArgumentAdapter() {}

  static RCIMIWGroupInviteHandlePermission toRCIMIWGroupInviteHandlePermission(
      @NonNull Integer type) {
    return RCIMIWGroupInviteHandlePermission.values()[type];
  }

  static RCIMIWGroupApplicationStatus toRCIMIWGroupApplicationStatus(@NonNull Integer type) {
    return RCIMIWGroupApplicationStatus.values()[type];
  }

  static RCIMIWGroupApplicationDirection toRCIMIWGroupApplicationDirection(@NonNull Integer type) {
    return RCIMIWGroupApplicationDirection.values()[type];
  }

  static RCIMIWGroupOperation toRCIMIWGroupOperation(@NonNull Integer type) {
    return RCIMIWGroupOperation.values()[type];
  }

  static RCIMIWGroupJoinPermission toRCIMIWGroupJoinPermission(@NonNull Integer type) {
    return RCIMIWGroupJoinPermission.values()[type];
  }

  static RCIMIWGroupStatus toRCIMIWGroupStatus(@NonNull Integer type) {
    return RCIMIWGroupStatus.values()[type];
  }

  static RCIMIWGroupOperationPermission toRCIMIWGroupOperationPermission(@NonNull Integer type) {
    return RCIMIWGroupOperationPermission.values()[type];
  }

  static RCIMIWGroupOperationType toRCIMIWGroupOperationType(@NonNull Integer type) {
    return RCIMIWGroupOperationType.values()[type];
  }

  static RCIMIWGroupMemberInfoEditPermission toRCIMIWGroupMemberInfoEditPermission(
      @NonNull Integer type) {
    return RCIMIWGroupMemberInfoEditPermission.values()[type];
  }

  static RCIMIWGroupMemberRole toRCIMIWGroupMemberRole(@NonNull Integer type) {
    return RCIMIWGroupMemberRole.values()[type];
  }

  static RCIMIWGroupApplicationType toRCIMIWGroupApplicationType(@NonNull Integer type) {
    return RCIMIWGroupApplicationType.values()[type];
  }

  static RCIMIWTranslateStrategy toRCIMIWTranslateStrategy(@NonNull Integer type) {
    return RCIMIWTranslateStrategy.values()[type];
  }

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

  static RCIMIWChatRoomSyncStatus toRCIMIWChatRoomSyncStatus(@NonNull Integer type) {
    return RCIMIWChatRoomSyncStatus.values()[type];
  }

  static RCIMIWPushNotificationQuietHoursLevel toRCIMIWPushNotificationQuietHoursLevel(
      @NonNull Integer type) {
    return RCIMIWPushNotificationQuietHoursLevel.values()[type];
  }

  static RCIMIWMessageDirection toRCIMIWMessageDirection(@NonNull Integer type) {
    return RCIMIWMessageDirection.values()[type];
  }

  static RCIMIWTranslateStatus toRCIMIWTranslateStatus(@NonNull Integer type) {
    return RCIMIWTranslateStatus.values()[type];
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

  static RCIMIWTranslateMode toRCIMIWTranslateMode(@NonNull Integer type) {
    return RCIMIWTranslateMode.values()[type];
  }

  static RCIMIWTranslateResultType toRCIMIWTranslateResultType(@NonNull Integer type) {
    return RCIMIWTranslateResultType.values()[type];
  }

  static RCIMIWMessageType toRCIMIWMessageType(@NonNull Integer type) {
    return RCIMIWMessageType.values()[type];
  }

  static RCIMIWMessageBlockType toRCIMIWMessageBlockType(@NonNull Integer type) {
    return RCIMIWMessageBlockType.values()[type];
  }

  static RCIMIWMessageAuditType toRCIMIWMessageAuditType(@NonNull Integer type) {
    return RCIMIWMessageAuditType.values()[type];
  }

  static RCIMIWChatRoomMemberBanType toRCIMIWChatRoomMemberBanType(@NonNull Integer type) {
    return RCIMIWChatRoomMemberBanType.values()[type];
  }

  static RCIMIWChatRoomMemberOperateType toRCIMIWChatRoomMemberOperateType(@NonNull Integer type) {
    return RCIMIWChatRoomMemberOperateType.values()[type];
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

  static RCIMIWChatRoomSyncStatusReason toRCIMIWChatRoomSyncStatusReason(@NonNull Integer type) {
    return RCIMIWChatRoomSyncStatusReason.values()[type];
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

  static RCIMIWPlatform toRCIMIWPlatform(@NonNull Integer type) {
    return RCIMIWPlatform.values()[type];
  }

  static RCIMIWSubscribeOperationType toRCIMIWSubscribeOperationType(@NonNull Integer type) {
    return RCIMIWSubscribeOperationType.values()[type];
  }

  static RCIMIWSubscribeType toRCIMIWSubscribeType(@NonNull Integer type) {
    return RCIMIWSubscribeType.values()[type];
  }

  static RCIMIWUserProfileVisibility toRCIMIWUserProfileVisibility(@NonNull Integer type) {
    return RCIMIWUserProfileVisibility.values()[type];
  }

  static RCIMIWUserGender toRCIMIWUserGender(@NonNull Integer type) {
    return RCIMIWUserGender.values()[type];
  }
}
