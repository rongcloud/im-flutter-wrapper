//
//  RCIMWrapperArgumentAdapter.m
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#import "RCIMWrapperArgumentAdapter.h"

@implementation RCIMWrapperArgumentAdapter

+ (RCIMIWGroupInviteHandlePermission)convertGroupInviteHandlePermissionFromInteger:(NSInteger)integer {
  NSArray *GroupInviteHandlePermissionArray = @[
    @(RCIMIWGroupInviteHandlePermissionFree),
    @(RCIMIWGroupInviteHandlePermissionInviteeVerify),
  ];
  RCIMIWGroupInviteHandlePermission GroupInviteHandlePermission = [[GroupInviteHandlePermissionArray objectAtIndex:integer] integerValue];
  return GroupInviteHandlePermission;
}
+ (NSInteger)convertGroupInviteHandlePermissionToInteger:(RCIMIWGroupInviteHandlePermission)GroupInviteHandlePermission {
  NSArray *GroupInviteHandlePermissionArray = @[
    @(RCIMIWGroupInviteHandlePermissionFree),
    @(RCIMIWGroupInviteHandlePermissionInviteeVerify),
  ];
  NSInteger index = [GroupInviteHandlePermissionArray indexOfObject:@(GroupInviteHandlePermission)];
  return index;
}

+ (RCIMIWGroupApplicationStatus)convertGroupApplicationStatusFromInteger:(NSInteger)integer {
  NSArray *GroupApplicationStatusArray = @[
    @(RCIMIWGroupApplicationStatusManagerUnHandled),
    @(RCIMIWGroupApplicationStatusManagerRefused),
    @(RCIMIWGroupApplicationStatusInviteeUnHandled),
    @(RCIMIWGroupApplicationStatusInviteeRefused),
    @(RCIMIWGroupApplicationStatusJoined),
    @(RCIMIWGroupApplicationStatusExpired),
  ];
  RCIMIWGroupApplicationStatus GroupApplicationStatus = [[GroupApplicationStatusArray objectAtIndex:integer] integerValue];
  return GroupApplicationStatus;
}
+ (NSInteger)convertGroupApplicationStatusToInteger:(RCIMIWGroupApplicationStatus)GroupApplicationStatus {
  NSArray *GroupApplicationStatusArray = @[
    @(RCIMIWGroupApplicationStatusManagerUnHandled),
    @(RCIMIWGroupApplicationStatusManagerRefused),
    @(RCIMIWGroupApplicationStatusInviteeUnHandled),
    @(RCIMIWGroupApplicationStatusInviteeRefused),
    @(RCIMIWGroupApplicationStatusJoined),
    @(RCIMIWGroupApplicationStatusExpired),
  ];
  NSInteger index = [GroupApplicationStatusArray indexOfObject:@(GroupApplicationStatus)];
  return index;
}

+ (RCIMIWGroupApplicationDirection)convertGroupApplicationDirectionFromInteger:(NSInteger)integer {
  NSArray *GroupApplicationDirectionArray = @[
    @(RCIMIWGroupApplicationDirectionApplicationSent),
    @(RCIMIWGroupApplicationDirectionInvitationSent),
    @(RCIMIWGroupApplicationDirectionInvitationReceived),
    @(RCIMIWGroupApplicationDirectionApplicationReceived),
  ];
  RCIMIWGroupApplicationDirection GroupApplicationDirection = [[GroupApplicationDirectionArray objectAtIndex:integer] integerValue];
  return GroupApplicationDirection;
}
+ (NSInteger)convertGroupApplicationDirectionToInteger:(RCIMIWGroupApplicationDirection)GroupApplicationDirection {
  NSArray *GroupApplicationDirectionArray = @[
    @(RCIMIWGroupApplicationDirectionApplicationSent),
    @(RCIMIWGroupApplicationDirectionInvitationSent),
    @(RCIMIWGroupApplicationDirectionInvitationReceived),
    @(RCIMIWGroupApplicationDirectionApplicationReceived),
  ];
  NSInteger index = [GroupApplicationDirectionArray indexOfObject:@(GroupApplicationDirection)];
  return index;
}

+ (RCIMIWGroupOperation)convertGroupOperationFromInteger:(NSInteger)integer {
  NSArray *GroupOperationArray = @[
    @(RCIMIWGroupOperationCreate),
    @(RCIMIWGroupOperationJoin),
    @(RCIMIWGroupOperationKick),
    @(RCIMIWGroupOperationQuit),
    @(RCIMIWGroupOperationDismiss),
    @(RCIMIWGroupOperationAddManager),
    @(RCIMIWGroupOperationRemoveManager),
    @(RCIMIWGroupOperationTransferGroupOwner),
  ];
  RCIMIWGroupOperation GroupOperation = [[GroupOperationArray objectAtIndex:integer] integerValue];
  return GroupOperation;
}
+ (NSInteger)convertGroupOperationToInteger:(RCIMIWGroupOperation)GroupOperation {
  NSArray *GroupOperationArray = @[
    @(RCIMIWGroupOperationCreate),
    @(RCIMIWGroupOperationJoin),
    @(RCIMIWGroupOperationKick),
    @(RCIMIWGroupOperationQuit),
    @(RCIMIWGroupOperationDismiss),
    @(RCIMIWGroupOperationAddManager),
    @(RCIMIWGroupOperationRemoveManager),
    @(RCIMIWGroupOperationTransferGroupOwner),
  ];
  NSInteger index = [GroupOperationArray indexOfObject:@(GroupOperation)];
  return index;
}

+ (RCIMIWGroupJoinPermission)convertGroupJoinPermissionFromInteger:(NSInteger)integer {
  NSArray *GroupJoinPermissionArray = @[
    @(RCIMIWGroupJoinPermissionOwnerVerify),
    @(RCIMIWGroupJoinPermissionFree),
    @(RCIMIWGroupJoinPermissionOwnerOrManagerVerify),
    @(RCIMIWGroupJoinPermissionNoOneAllowed),
  ];
  RCIMIWGroupJoinPermission GroupJoinPermission = [[GroupJoinPermissionArray objectAtIndex:integer] integerValue];
  return GroupJoinPermission;
}
+ (NSInteger)convertGroupJoinPermissionToInteger:(RCIMIWGroupJoinPermission)GroupJoinPermission {
  NSArray *GroupJoinPermissionArray = @[
    @(RCIMIWGroupJoinPermissionOwnerVerify),
    @(RCIMIWGroupJoinPermissionFree),
    @(RCIMIWGroupJoinPermissionOwnerOrManagerVerify),
    @(RCIMIWGroupJoinPermissionNoOneAllowed),
  ];
  NSInteger index = [GroupJoinPermissionArray indexOfObject:@(GroupJoinPermission)];
  return index;
}

+ (RCIMIWGroupStatus)convertGroupStatusFromInteger:(NSInteger)integer {
  NSArray *GroupStatusArray = @[
    @(RCIMIWGroupStatusUsing),
    @(RCIMIWGroupStatusDismissed),
    @(RCIMIWGroupStatusBanned),
    @(RCIMIWGroupStatusMuted),
  ];
  RCIMIWGroupStatus GroupStatus = [[GroupStatusArray objectAtIndex:integer] integerValue];
  return GroupStatus;
}
+ (NSInteger)convertGroupStatusToInteger:(RCIMIWGroupStatus)GroupStatus {
  NSArray *GroupStatusArray = @[
    @(RCIMIWGroupStatusUsing),
    @(RCIMIWGroupStatusDismissed),
    @(RCIMIWGroupStatusBanned),
    @(RCIMIWGroupStatusMuted),
  ];
  NSInteger index = [GroupStatusArray indexOfObject:@(GroupStatus)];
  return index;
}

+ (RCIMIWGroupOperationPermission)convertGroupOperationPermissionFromInteger:(NSInteger)integer {
  NSArray *GroupOperationPermissionArray = @[
    @(RCIMIWGroupOperationPermissionOwner),
    @(RCIMIWGroupOperationPermissionOwnerOrManager),
    @(RCIMIWGroupOperationPermissionEveryone),
  ];
  RCIMIWGroupOperationPermission GroupOperationPermission = [[GroupOperationPermissionArray objectAtIndex:integer] integerValue];
  return GroupOperationPermission;
}
+ (NSInteger)convertGroupOperationPermissionToInteger:(RCIMIWGroupOperationPermission)GroupOperationPermission {
  NSArray *GroupOperationPermissionArray = @[
    @(RCIMIWGroupOperationPermissionOwner),
    @(RCIMIWGroupOperationPermissionOwnerOrManager),
    @(RCIMIWGroupOperationPermissionEveryone),
  ];
  NSInteger index = [GroupOperationPermissionArray indexOfObject:@(GroupOperationPermission)];
  return index;
}

+ (RCIMIWGroupOperationType)convertGroupOperationTypeFromInteger:(NSInteger)integer {
  NSArray *GroupOperationTypeArray = @[
    @(RCIMIWGroupOperationTypeAdd),
    @(RCIMIWGroupOperationTypeRemove),
  ];
  RCIMIWGroupOperationType GroupOperationType = [[GroupOperationTypeArray objectAtIndex:integer] integerValue];
  return GroupOperationType;
}
+ (NSInteger)convertGroupOperationTypeToInteger:(RCIMIWGroupOperationType)GroupOperationType {
  NSArray *GroupOperationTypeArray = @[
    @(RCIMIWGroupOperationTypeAdd),
    @(RCIMIWGroupOperationTypeRemove),
  ];
  NSInteger index = [GroupOperationTypeArray indexOfObject:@(GroupOperationType)];
  return index;
}

+ (RCIMIWGroupMemberInfoEditPermission)convertGroupMemberInfoEditPermissionFromInteger:(NSInteger)integer {
  NSArray *GroupMemberInfoEditPermissionArray = @[
    @(RCIMIWGroupMemberInfoEditPermissionOwnerOrManagerOrSelf),
    @(RCIMIWGroupMemberInfoEditPermissionOwnerOrSelf),
    @(RCIMIWGroupMemberInfoEditPermissionSelf),
  ];
  RCIMIWGroupMemberInfoEditPermission GroupMemberInfoEditPermission = [[GroupMemberInfoEditPermissionArray objectAtIndex:integer] integerValue];
  return GroupMemberInfoEditPermission;
}
+ (NSInteger)convertGroupMemberInfoEditPermissionToInteger:(RCIMIWGroupMemberInfoEditPermission)GroupMemberInfoEditPermission {
  NSArray *GroupMemberInfoEditPermissionArray = @[
    @(RCIMIWGroupMemberInfoEditPermissionOwnerOrManagerOrSelf),
    @(RCIMIWGroupMemberInfoEditPermissionOwnerOrSelf),
    @(RCIMIWGroupMemberInfoEditPermissionSelf),
  ];
  NSInteger index = [GroupMemberInfoEditPermissionArray indexOfObject:@(GroupMemberInfoEditPermission)];
  return index;
}

+ (RCIMIWGroupMemberRole)convertGroupMemberRoleFromInteger:(NSInteger)integer {
  NSArray *GroupMemberRoleArray = @[
    @(RCIMIWGroupMemberRoleUndef),
    @(RCIMIWGroupMemberRoleNormal),
    @(RCIMIWGroupMemberRoleManager),
    @(RCIMIWGroupMemberRoleOwner),
  ];
  RCIMIWGroupMemberRole GroupMemberRole = [[GroupMemberRoleArray objectAtIndex:integer] integerValue];
  return GroupMemberRole;
}
+ (NSInteger)convertGroupMemberRoleToInteger:(RCIMIWGroupMemberRole)GroupMemberRole {
  NSArray *GroupMemberRoleArray = @[
    @(RCIMIWGroupMemberRoleUndef),
    @(RCIMIWGroupMemberRoleNormal),
    @(RCIMIWGroupMemberRoleManager),
    @(RCIMIWGroupMemberRoleOwner),
  ];
  NSInteger index = [GroupMemberRoleArray indexOfObject:@(GroupMemberRole)];
  return index;
}

+ (RCIMIWGroupApplicationType)convertGroupApplicationTypeFromInteger:(NSInteger)integer {
  NSArray *GroupApplicationTypeArray = @[
    @(RCIMIWGroupApplicationTypeApplication),
    @(RCIMIWGroupApplicationTypeInvitation),
  ];
  RCIMIWGroupApplicationType GroupApplicationType = [[GroupApplicationTypeArray objectAtIndex:integer] integerValue];
  return GroupApplicationType;
}
+ (NSInteger)convertGroupApplicationTypeToInteger:(RCIMIWGroupApplicationType)GroupApplicationType {
  NSArray *GroupApplicationTypeArray = @[
    @(RCIMIWGroupApplicationTypeApplication),
    @(RCIMIWGroupApplicationTypeInvitation),
  ];
  NSInteger index = [GroupApplicationTypeArray indexOfObject:@(GroupApplicationType)];
  return index;
}

+ (RCIMIWTranslateStrategy)convertTranslateStrategyFromInteger:(NSInteger)integer {
  NSArray *TranslateStrategyArray = @[
    @(RCIMIWTranslateStrategyDefaultFollowUser),
    @(RCIMIWTranslateStrategyAutoOn),
    @(RCIMIWTranslateStrategyAutoOff),
  ];
  RCIMIWTranslateStrategy TranslateStrategy = [[TranslateStrategyArray objectAtIndex:integer] integerValue];
  return TranslateStrategy;
}
+ (NSInteger)convertTranslateStrategyToInteger:(RCIMIWTranslateStrategy)TranslateStrategy {
  NSArray *TranslateStrategyArray = @[
    @(RCIMIWTranslateStrategyDefaultFollowUser),
    @(RCIMIWTranslateStrategyAutoOn),
    @(RCIMIWTranslateStrategyAutoOff),
  ];
  NSInteger index = [TranslateStrategyArray indexOfObject:@(TranslateStrategy)];
  return index;
}

+ (RCIMIWImportanceHW)convertImportanceHWFromInteger:(NSInteger)integer {
  NSArray *ImportanceHWArray = @[
    @(RCIMIWImportanceHWNormal),
    @(RCIMIWImportanceHWLow),
  ];
  RCIMIWImportanceHW ImportanceHW = [[ImportanceHWArray objectAtIndex:integer] integerValue];
  return ImportanceHW;
}
+ (NSInteger)convertImportanceHWToInteger:(RCIMIWImportanceHW)ImportanceHW {
  NSArray *ImportanceHWArray = @[
    @(RCIMIWImportanceHWNormal),
    @(RCIMIWImportanceHWLow),
  ];
  NSInteger index = [ImportanceHWArray indexOfObject:@(ImportanceHW)];
  return index;
}

+ (RCIMIWMessageOperationPolicy)convertMessageOperationPolicyFromInteger:(NSInteger)integer {
  NSArray *MessageOperationPolicyArray = @[
    @(RCIMIWMessageOperationPolicyLocal),
    @(RCIMIWMessageOperationPolicyRemote),
    @(RCIMIWMessageOperationPolicyLocalRemote),
  ];
  RCIMIWMessageOperationPolicy MessageOperationPolicy = [[MessageOperationPolicyArray objectAtIndex:integer] integerValue];
  return MessageOperationPolicy;
}
+ (NSInteger)convertMessageOperationPolicyToInteger:(RCIMIWMessageOperationPolicy)MessageOperationPolicy {
  NSArray *MessageOperationPolicyArray = @[
    @(RCIMIWMessageOperationPolicyLocal),
    @(RCIMIWMessageOperationPolicyRemote),
    @(RCIMIWMessageOperationPolicyLocalRemote),
  ];
  NSInteger index = [MessageOperationPolicyArray indexOfObject:@(MessageOperationPolicy)];
  return index;
}

+ (RCIMIWNativeCustomMessagePersistentFlag)convertNativeCustomMessagePersistentFlagFromInteger:(NSInteger)integer {
  NSArray *NativeCustomMessagePersistentFlagArray = @[
    @(RCIMIWNativeCustomMessagePersistentNone),
    @(RCIMIWNativeCustomMessagePersistentPersisted),
    @(RCIMIWNativeCustomMessagePersistentCounted),
    @(RCIMIWNativeCustomMessagePersistentStatus),
  ];
  RCIMIWNativeCustomMessagePersistentFlag NativeCustomMessagePersistentFlag = [[NativeCustomMessagePersistentFlagArray objectAtIndex:integer] integerValue];
  return NativeCustomMessagePersistentFlag;
}
+ (NSInteger)convertNativeCustomMessagePersistentFlagToInteger:(RCIMIWNativeCustomMessagePersistentFlag)NativeCustomMessagePersistentFlag {
  NSArray *NativeCustomMessagePersistentFlagArray = @[
    @(RCIMIWNativeCustomMessagePersistentNone),
    @(RCIMIWNativeCustomMessagePersistentPersisted),
    @(RCIMIWNativeCustomMessagePersistentCounted),
    @(RCIMIWNativeCustomMessagePersistentStatus),
  ];
  NSInteger index = [NativeCustomMessagePersistentFlagArray indexOfObject:@(NativeCustomMessagePersistentFlag)];
  return index;
}

+ (RCIMIWVIVOPushType)convertVIVOPushTypeFromInteger:(NSInteger)integer {
  NSArray *VIVOPushTypeArray = @[
    @(RCIMIWVIVOPushTypeOperate),
    @(RCIMIWVIVOPushTypeSystem),
  ];
  RCIMIWVIVOPushType VIVOPushType = [[VIVOPushTypeArray objectAtIndex:integer] integerValue];
  return VIVOPushType;
}
+ (NSInteger)convertVIVOPushTypeToInteger:(RCIMIWVIVOPushType)VIVOPushType {
  NSArray *VIVOPushTypeArray = @[
    @(RCIMIWVIVOPushTypeOperate),
    @(RCIMIWVIVOPushTypeSystem),
  ];
  NSInteger index = [VIVOPushTypeArray indexOfObject:@(VIVOPushType)];
  return index;
}

+ (RCIMIWSentStatus)convertSentStatusFromInteger:(NSInteger)integer {
  NSArray *SentStatusArray = @[
    @(RCIMIWSentStatusSending),
    @(RCIMIWSentStatusFailed),
    @(RCIMIWSentStatusSent),
    @(RCIMIWSentStatusReceived),
    @(RCIMIWSentStatusRead),
    @(RCIMIWSentStatusDestroyed),
    @(RCIMIWSentStatusCanceled),
  ];
  RCIMIWSentStatus SentStatus = [[SentStatusArray objectAtIndex:integer] integerValue];
  return SentStatus;
}
+ (NSInteger)convertSentStatusToInteger:(RCIMIWSentStatus)SentStatus {
  NSArray *SentStatusArray = @[
    @(RCIMIWSentStatusSending),
    @(RCIMIWSentStatusFailed),
    @(RCIMIWSentStatusSent),
    @(RCIMIWSentStatusReceived),
    @(RCIMIWSentStatusRead),
    @(RCIMIWSentStatusDestroyed),
    @(RCIMIWSentStatusCanceled),
  ];
  NSInteger index = [SentStatusArray indexOfObject:@(SentStatus)];
  return index;
}

+ (RCIMIWChatRoomSyncStatus)convertChatRoomSyncStatusFromInteger:(NSInteger)integer {
  NSArray *ChatRoomSyncStatusArray = @[
    @(RCIMIWChatRoomSyncStatusQuit),
    @(RCIMIWChatRoomSyncStatusJoin),
  ];
  RCIMIWChatRoomSyncStatus ChatRoomSyncStatus = [[ChatRoomSyncStatusArray objectAtIndex:integer] integerValue];
  return ChatRoomSyncStatus;
}
+ (NSInteger)convertChatRoomSyncStatusToInteger:(RCIMIWChatRoomSyncStatus)ChatRoomSyncStatus {
  NSArray *ChatRoomSyncStatusArray = @[
    @(RCIMIWChatRoomSyncStatusQuit),
    @(RCIMIWChatRoomSyncStatusJoin),
  ];
  NSInteger index = [ChatRoomSyncStatusArray indexOfObject:@(ChatRoomSyncStatus)];
  return index;
}

+ (RCIMIWPushNotificationQuietHoursLevel)convertPushNotificationQuietHoursLevelFromInteger:(NSInteger)integer {
  NSArray *PushNotificationQuietHoursLevelArray = @[
    @(RCIMIWPushNotificationQuietHoursLevelNone),
    @(RCIMIWPushNotificationQuietHoursLevelMention),
    @(RCIMIWPushNotificationQuietHoursLevelBlocked),
  ];
  RCIMIWPushNotificationQuietHoursLevel PushNotificationQuietHoursLevel = [[PushNotificationQuietHoursLevelArray objectAtIndex:integer] integerValue];
  return PushNotificationQuietHoursLevel;
}
+ (NSInteger)convertPushNotificationQuietHoursLevelToInteger:(RCIMIWPushNotificationQuietHoursLevel)PushNotificationQuietHoursLevel {
  NSArray *PushNotificationQuietHoursLevelArray = @[
    @(RCIMIWPushNotificationQuietHoursLevelNone),
    @(RCIMIWPushNotificationQuietHoursLevelMention),
    @(RCIMIWPushNotificationQuietHoursLevelBlocked),
  ];
  NSInteger index = [PushNotificationQuietHoursLevelArray indexOfObject:@(PushNotificationQuietHoursLevel)];
  return index;
}

+ (RCIMIWMessageDirection)convertMessageDirectionFromInteger:(NSInteger)integer {
  NSArray *MessageDirectionArray = @[
    @(RCIMIWMessageDirectionSend),
    @(RCIMIWMessageDirectionReceive),
  ];
  RCIMIWMessageDirection MessageDirection = [[MessageDirectionArray objectAtIndex:integer] integerValue];
  return MessageDirection;
}
+ (NSInteger)convertMessageDirectionToInteger:(RCIMIWMessageDirection)MessageDirection {
  NSArray *MessageDirectionArray = @[
    @(RCIMIWMessageDirectionSend),
    @(RCIMIWMessageDirectionReceive),
  ];
  NSInteger index = [MessageDirectionArray indexOfObject:@(MessageDirection)];
  return index;
}

+ (RCIMIWTranslateStatus)convertTranslateStatusFromInteger:(NSInteger)integer {
  NSArray *TranslateStatusArray = @[
    @(RCIMIWTranslateStatusNone),
    @(RCIMIWTranslateStatusTranslating),
    @(RCIMIWTranslateStatusSuccess),
    @(RCIMIWTranslateStatusFailed),
  ];
  RCIMIWTranslateStatus TranslateStatus = [[TranslateStatusArray objectAtIndex:integer] integerValue];
  return TranslateStatus;
}
+ (NSInteger)convertTranslateStatusToInteger:(RCIMIWTranslateStatus)TranslateStatus {
  NSArray *TranslateStatusArray = @[
    @(RCIMIWTranslateStatusNone),
    @(RCIMIWTranslateStatusTranslating),
    @(RCIMIWTranslateStatusSuccess),
    @(RCIMIWTranslateStatusFailed),
  ];
  NSInteger index = [TranslateStatusArray indexOfObject:@(TranslateStatus)];
  return index;
}

+ (RCIMIWReceivedStatus)convertReceivedStatusFromInteger:(NSInteger)integer {
  NSArray *ReceivedStatusArray = @[
    @(RCIMIWReceivedStatusUnread),
    @(RCIMIWReceivedStatusRead),
    @(RCIMIWReceivedStatusListened),
    @(RCIMIWReceivedStatusDownloaded),
    @(RCIMIWReceivedStatusRetrieved),
    @(RCIMIWReceivedStatusMultipleReceive),
  ];
  RCIMIWReceivedStatus ReceivedStatus = [[ReceivedStatusArray objectAtIndex:integer] integerValue];
  return ReceivedStatus;
}
+ (NSInteger)convertReceivedStatusToInteger:(RCIMIWReceivedStatus)ReceivedStatus {
  NSArray *ReceivedStatusArray = @[
    @(RCIMIWReceivedStatusUnread),
    @(RCIMIWReceivedStatusRead),
    @(RCIMIWReceivedStatusListened),
    @(RCIMIWReceivedStatusDownloaded),
    @(RCIMIWReceivedStatusRetrieved),
    @(RCIMIWReceivedStatusMultipleReceive),
  ];
  NSInteger index = [ReceivedStatusArray indexOfObject:@(ReceivedStatus)];
  return index;
}

+ (RCIMIWChatRoomMemberActionType)convertChatRoomMemberActionTypeFromInteger:(NSInteger)integer {
  NSArray *ChatRoomMemberActionTypeArray = @[
    @(RCIMIWChatRoomMemberActionTypeUnknown),
    @(RCIMIWChatRoomMemberActionTypeJoin),
    @(RCIMIWChatRoomMemberActionTypeLeave),
  ];
  RCIMIWChatRoomMemberActionType ChatRoomMemberActionType = [[ChatRoomMemberActionTypeArray objectAtIndex:integer] integerValue];
  return ChatRoomMemberActionType;
}
+ (NSInteger)convertChatRoomMemberActionTypeToInteger:(RCIMIWChatRoomMemberActionType)ChatRoomMemberActionType {
  NSArray *ChatRoomMemberActionTypeArray = @[
    @(RCIMIWChatRoomMemberActionTypeUnknown),
    @(RCIMIWChatRoomMemberActionTypeJoin),
    @(RCIMIWChatRoomMemberActionTypeLeave),
  ];
  NSInteger index = [ChatRoomMemberActionTypeArray indexOfObject:@(ChatRoomMemberActionType)];
  return index;
}

+ (RCIMIWPushNotificationLevel)convertPushNotificationLevelFromInteger:(NSInteger)integer {
  NSArray *PushNotificationLevelArray = @[
    @(RCIMIWPushNotificationLevelAllMessage),
    @(RCIMIWPushNotificationLevelNone),
    @(RCIMIWPushNotificationLevelMention),
    @(RCIMIWPushNotificationLevelMentionUsers),
    @(RCIMIWPushNotificationLevelMentionAll),
    @(RCIMIWPushNotificationLevelBlocked),
  ];
  RCIMIWPushNotificationLevel PushNotificationLevel = [[PushNotificationLevelArray objectAtIndex:integer] integerValue];
  return PushNotificationLevel;
}
+ (NSInteger)convertPushNotificationLevelToInteger:(RCIMIWPushNotificationLevel)PushNotificationLevel {
  NSArray *PushNotificationLevelArray = @[
    @(RCIMIWPushNotificationLevelAllMessage),
    @(RCIMIWPushNotificationLevelNone),
    @(RCIMIWPushNotificationLevelMention),
    @(RCIMIWPushNotificationLevelMentionUsers),
    @(RCIMIWPushNotificationLevelMentionAll),
    @(RCIMIWPushNotificationLevelBlocked),
  ];
  NSInteger index = [PushNotificationLevelArray indexOfObject:@(PushNotificationLevel)];
  return index;
}

+ (RCIMIWTranslateMode)convertTranslateModeFromInteger:(NSInteger)integer {
  NSArray *TranslateModeArray = @[
    @(RCIMIWTranslateModeMechanical),
    @(RCIMIWTranslateModeIntelligent),
  ];
  RCIMIWTranslateMode TranslateMode = [[TranslateModeArray objectAtIndex:integer] integerValue];
  return TranslateMode;
}
+ (NSInteger)convertTranslateModeToInteger:(RCIMIWTranslateMode)TranslateMode {
  NSArray *TranslateModeArray = @[
    @(RCIMIWTranslateModeMechanical),
    @(RCIMIWTranslateModeIntelligent),
  ];
  NSInteger index = [TranslateModeArray indexOfObject:@(TranslateMode)];
  return index;
}

+ (RCIMIWTranslateResultType)convertTranslateResultTypeFromInteger:(NSInteger)integer {
  NSArray *TranslateResultTypeArray = @[
    @(RCIMIWTranslateResultTypeMessage),
    @(RCIMIWTranslateResultTypeCustomText),
  ];
  RCIMIWTranslateResultType TranslateResultType = [[TranslateResultTypeArray objectAtIndex:integer] integerValue];
  return TranslateResultType;
}
+ (NSInteger)convertTranslateResultTypeToInteger:(RCIMIWTranslateResultType)TranslateResultType {
  NSArray *TranslateResultTypeArray = @[
    @(RCIMIWTranslateResultTypeMessage),
    @(RCIMIWTranslateResultTypeCustomText),
  ];
  NSInteger index = [TranslateResultTypeArray indexOfObject:@(TranslateResultType)];
  return index;
}

+ (RCIMIWMessageType)convertMessageTypeFromInteger:(NSInteger)integer {
  NSArray *MessageTypeArray = @[
    @(RCIMIWMessageTypeUnknown),
    @(RCIMIWMessageTypeCustom),
    @(RCIMIWMessageTypeText),
    @(RCIMIWMessageTypeVoice),
    @(RCIMIWMessageTypeImage),
    @(RCIMIWMessageTypeFile),
    @(RCIMIWMessageTypeSight),
    @(RCIMIWMessageTypeGIF),
    @(RCIMIWMessageTypeRecall),
    @(RCIMIWMessageTypeReference),
    @(RCIMIWMessageTypeCommand),
    @(RCIMIWMessageTypeCommandNotification),
    @(RCIMIWMessageTypeLocation),
    @(RCIMIWMessageTypeUserCustom),
    @(RCIMIWMessageTypeNativeCustom),
    @(RCIMIWMessageTypeNativeCustomMedia),
    @(RCIMIWMessageTypeGroupNotification),
  ];
  RCIMIWMessageType MessageType = [[MessageTypeArray objectAtIndex:integer] integerValue];
  return MessageType;
}
+ (NSInteger)convertMessageTypeToInteger:(RCIMIWMessageType)MessageType {
  NSArray *MessageTypeArray = @[
    @(RCIMIWMessageTypeUnknown),
    @(RCIMIWMessageTypeCustom),
    @(RCIMIWMessageTypeText),
    @(RCIMIWMessageTypeVoice),
    @(RCIMIWMessageTypeImage),
    @(RCIMIWMessageTypeFile),
    @(RCIMIWMessageTypeSight),
    @(RCIMIWMessageTypeGIF),
    @(RCIMIWMessageTypeRecall),
    @(RCIMIWMessageTypeReference),
    @(RCIMIWMessageTypeCommand),
    @(RCIMIWMessageTypeCommandNotification),
    @(RCIMIWMessageTypeLocation),
    @(RCIMIWMessageTypeUserCustom),
    @(RCIMIWMessageTypeNativeCustom),
    @(RCIMIWMessageTypeNativeCustomMedia),
    @(RCIMIWMessageTypeGroupNotification),
  ];
  NSInteger index = [MessageTypeArray indexOfObject:@(MessageType)];
  return index;
}

+ (RCIMIWMessageBlockType)convertMessageBlockTypeFromInteger:(NSInteger)integer {
  NSArray *MessageBlockTypeArray = @[
    @(RCIMIWMessageBlockTypeUnknown),
    @(RCIMIWMessageBlockTypeGlobal),
    @(RCIMIWMessageBlockTypeCustom),
    @(RCIMIWMessageBlockTypeThirdParty),
  ];
  RCIMIWMessageBlockType MessageBlockType = [[MessageBlockTypeArray objectAtIndex:integer] integerValue];
  return MessageBlockType;
}
+ (NSInteger)convertMessageBlockTypeToInteger:(RCIMIWMessageBlockType)MessageBlockType {
  NSArray *MessageBlockTypeArray = @[
    @(RCIMIWMessageBlockTypeUnknown),
    @(RCIMIWMessageBlockTypeGlobal),
    @(RCIMIWMessageBlockTypeCustom),
    @(RCIMIWMessageBlockTypeThirdParty),
  ];
  NSInteger index = [MessageBlockTypeArray indexOfObject:@(MessageBlockType)];
  return index;
}

+ (RCIMIWMessageAuditType)convertMessageAuditTypeFromInteger:(NSInteger)integer {
  NSArray *MessageAuditTypeArray = @[
    @(RCIMIWMessageAuditTypeDisallow),
    @(RCIMIWMessageAuditTypeAllow),
  ];
  RCIMIWMessageAuditType MessageAuditType = [[MessageAuditTypeArray objectAtIndex:integer] integerValue];
  return MessageAuditType;
}
+ (NSInteger)convertMessageAuditTypeToInteger:(RCIMIWMessageAuditType)MessageAuditType {
  NSArray *MessageAuditTypeArray = @[
    @(RCIMIWMessageAuditTypeDisallow),
    @(RCIMIWMessageAuditTypeAllow),
  ];
  NSInteger index = [MessageAuditTypeArray indexOfObject:@(MessageAuditType)];
  return index;
}

+ (RCIMIWChatRoomMemberBanType)convertChatRoomMemberBanTypeFromInteger:(NSInteger)integer {
  NSArray *ChatRoomMemberBanTypeArray = @[
    @(RCIMIWChatRoomMemberBanTypeUnmuteUsers),
    @(RCIMIWChatRoomMemberBanTypeMuteUsers),
    @(RCIMIWChatRoomMemberBanTypeUnmuteAll),
    @(RCIMIWChatRoomMemberBanTypeMuteAll),
    @(RCIMIWChatRoomMemberBanTypeRemoveWhitelist),
    @(RCIMIWChatRoomMemberBanTypeAddWhitelist),
    @(RCIMIWChatRoomMemberBanTypeUnmuteGlobal),
    @(RCIMIWChatRoomMemberBanTypeMuteGlobal),
  ];
  RCIMIWChatRoomMemberBanType ChatRoomMemberBanType = [[ChatRoomMemberBanTypeArray objectAtIndex:integer] integerValue];
  return ChatRoomMemberBanType;
}
+ (NSInteger)convertChatRoomMemberBanTypeToInteger:(RCIMIWChatRoomMemberBanType)ChatRoomMemberBanType {
  NSArray *ChatRoomMemberBanTypeArray = @[
    @(RCIMIWChatRoomMemberBanTypeUnmuteUsers),
    @(RCIMIWChatRoomMemberBanTypeMuteUsers),
    @(RCIMIWChatRoomMemberBanTypeUnmuteAll),
    @(RCIMIWChatRoomMemberBanTypeMuteAll),
    @(RCIMIWChatRoomMemberBanTypeRemoveWhitelist),
    @(RCIMIWChatRoomMemberBanTypeAddWhitelist),
    @(RCIMIWChatRoomMemberBanTypeUnmuteGlobal),
    @(RCIMIWChatRoomMemberBanTypeMuteGlobal),
  ];
  NSInteger index = [ChatRoomMemberBanTypeArray indexOfObject:@(ChatRoomMemberBanType)];
  return index;
}

+ (RCIMIWChatRoomMemberOperateType)convertChatRoomMemberOperateTypeFromInteger:(NSInteger)integer {
  NSArray *ChatRoomMemberOperateTypeArray = @[
    @(RCIMIWChatRoomMemberOperateTypeDeblock),
    @(RCIMIWChatRoomMemberOperateTypeBlocked),
  ];
  RCIMIWChatRoomMemberOperateType ChatRoomMemberOperateType = [[ChatRoomMemberOperateTypeArray objectAtIndex:integer] integerValue];
  return ChatRoomMemberOperateType;
}
+ (NSInteger)convertChatRoomMemberOperateTypeToInteger:(RCIMIWChatRoomMemberOperateType)ChatRoomMemberOperateType {
  NSArray *ChatRoomMemberOperateTypeArray = @[
    @(RCIMIWChatRoomMemberOperateTypeDeblock),
    @(RCIMIWChatRoomMemberOperateTypeBlocked),
  ];
  NSInteger index = [ChatRoomMemberOperateTypeArray indexOfObject:@(ChatRoomMemberOperateType)];
  return index;
}

+ (RCIMIWTimeOrder)convertTimeOrderFromInteger:(NSInteger)integer {
  NSArray *TimeOrderArray = @[
    @(RCIMIWTimeOrderBefore),
    @(RCIMIWTimeOrderAfter),
  ];
  RCIMIWTimeOrder TimeOrder = [[TimeOrderArray objectAtIndex:integer] integerValue];
  return TimeOrder;
}
+ (NSInteger)convertTimeOrderToInteger:(RCIMIWTimeOrder)TimeOrder {
  NSArray *TimeOrderArray = @[
    @(RCIMIWTimeOrderBefore),
    @(RCIMIWTimeOrderAfter),
  ];
  NSInteger index = [TimeOrderArray indexOfObject:@(TimeOrder)];
  return index;
}

+ (RCIMIWCustomMessagePolicy)convertCustomMessagePolicyFromInteger:(NSInteger)integer {
  NSArray *CustomMessagePolicyArray = @[
    @(RCIMIWCustomMessagePolicyCommand),
    @(RCIMIWCustomMessagePolicyNormal),
    @(RCIMIWCustomMessagePolicyStatus),
    @(RCIMIWCustomMessagePolicyStorage),
  ];
  RCIMIWCustomMessagePolicy CustomMessagePolicy = [[CustomMessagePolicyArray objectAtIndex:integer] integerValue];
  return CustomMessagePolicy;
}
+ (NSInteger)convertCustomMessagePolicyToInteger:(RCIMIWCustomMessagePolicy)CustomMessagePolicy {
  NSArray *CustomMessagePolicyArray = @[
    @(RCIMIWCustomMessagePolicyCommand),
    @(RCIMIWCustomMessagePolicyNormal),
    @(RCIMIWCustomMessagePolicyStatus),
    @(RCIMIWCustomMessagePolicyStorage),
  ];
  NSInteger index = [CustomMessagePolicyArray indexOfObject:@(CustomMessagePolicy)];
  return index;
}

+ (RCIMIWChatRoomStatus)convertChatRoomStatusFromInteger:(NSInteger)integer {
  NSArray *ChatRoomStatusArray = @[
    @(RCIMIWChatRoomStatusReset),
    @(RCIMIWChatRoomStatusDestroyManual),
    @(RCIMIWChatRoomStatusDestroyAuto),
  ];
  RCIMIWChatRoomStatus ChatRoomStatus = [[ChatRoomStatusArray objectAtIndex:integer] integerValue];
  return ChatRoomStatus;
}
+ (NSInteger)convertChatRoomStatusToInteger:(RCIMIWChatRoomStatus)ChatRoomStatus {
  NSArray *ChatRoomStatusArray = @[
    @(RCIMIWChatRoomStatusReset),
    @(RCIMIWChatRoomStatusDestroyManual),
    @(RCIMIWChatRoomStatusDestroyAuto),
  ];
  NSInteger index = [ChatRoomStatusArray indexOfObject:@(ChatRoomStatus)];
  return index;
}

+ (RCIMIWConversationType)convertConversationTypeFromInteger:(NSInteger)integer {
  NSArray *ConversationTypeArray = @[
    @(RCIMIWConversationTypeInvalid),
    @(RCIMIWConversationTypePrivate),
    @(RCIMIWConversationTypeGroup),
    @(RCIMIWConversationTypeChatroom),
    @(RCIMIWConversationTypeSystem),
    @(RCIMIWConversationTypeUltraGroup),
  ];
  RCIMIWConversationType ConversationType = [[ConversationTypeArray objectAtIndex:integer] integerValue];
  return ConversationType;
}
+ (NSInteger)convertConversationTypeToInteger:(RCIMIWConversationType)ConversationType {
  NSArray *ConversationTypeArray = @[
    @(RCIMIWConversationTypeInvalid),
    @(RCIMIWConversationTypePrivate),
    @(RCIMIWConversationTypeGroup),
    @(RCIMIWConversationTypeChatroom),
    @(RCIMIWConversationTypeSystem),
    @(RCIMIWConversationTypeUltraGroup),
  ];
  NSInteger index = [ConversationTypeArray indexOfObject:@(ConversationType)];
  return index;
}

+ (RCIMIWErrorCode)convertErrorCodeFromInteger:(NSInteger)integer {
  NSArray *ErrorCodeArray = @[
    @(RCIMIWErrorCodeSuccess),
    @(RCIMIWErrorCodeParamError),
    @(RCIMIWErrorCodeEngineDestroyed),
    @(RCIMIWErrorCodeNativeOperationError),
    @(RCIMIWErrorCodeResultUnknown),
  ];
  RCIMIWErrorCode ErrorCode = [[ErrorCodeArray objectAtIndex:integer] integerValue];
  return ErrorCode;
}
+ (NSInteger)convertErrorCodeToInteger:(RCIMIWErrorCode)ErrorCode {
  NSArray *ErrorCodeArray = @[
    @(RCIMIWErrorCodeSuccess),
    @(RCIMIWErrorCodeParamError),
    @(RCIMIWErrorCodeEngineDestroyed),
    @(RCIMIWErrorCodeNativeOperationError),
    @(RCIMIWErrorCodeResultUnknown),
  ];
  NSInteger index = [ErrorCodeArray indexOfObject:@(ErrorCode)];
  return index;
}

+ (RCIMIWChatRoomSyncStatusReason)convertChatRoomSyncStatusReasonFromInteger:(NSInteger)integer {
  NSArray *ChatRoomSyncStatusReasonArray = @[
    @(RCIMIWChatRoomSyncStatusLeaveOnMyOwn),
    @(RCIMIWChatRoomSyncStatusOtherDeviceLogin),
  ];
  RCIMIWChatRoomSyncStatusReason ChatRoomSyncStatusReason = [[ChatRoomSyncStatusReasonArray objectAtIndex:integer] integerValue];
  return ChatRoomSyncStatusReason;
}
+ (NSInteger)convertChatRoomSyncStatusReasonToInteger:(RCIMIWChatRoomSyncStatusReason)ChatRoomSyncStatusReason {
  NSArray *ChatRoomSyncStatusReasonArray = @[
    @(RCIMIWChatRoomSyncStatusLeaveOnMyOwn),
    @(RCIMIWChatRoomSyncStatusOtherDeviceLogin),
  ];
  NSInteger index = [ChatRoomSyncStatusReasonArray indexOfObject:@(ChatRoomSyncStatusReason)];
  return index;
}

+ (RCIMIWUltraGroupTypingStatus)convertUltraGroupTypingStatusFromInteger:(NSInteger)integer {
  NSArray *UltraGroupTypingStatusArray = @[
    @(RCIMIWUltraGroupTypingStatusText),
  ];
  RCIMIWUltraGroupTypingStatus UltraGroupTypingStatus = [[UltraGroupTypingStatusArray objectAtIndex:integer] integerValue];
  return UltraGroupTypingStatus;
}
+ (NSInteger)convertUltraGroupTypingStatusToInteger:(RCIMIWUltraGroupTypingStatus)UltraGroupTypingStatus {
  NSArray *UltraGroupTypingStatusArray = @[
    @(RCIMIWUltraGroupTypingStatusText),
  ];
  NSInteger index = [UltraGroupTypingStatusArray indexOfObject:@(UltraGroupTypingStatus)];
  return index;
}

+ (RCIMIWMentionedType)convertMentionedTypeFromInteger:(NSInteger)integer {
  NSArray *MentionedTypeArray = @[
    @(RCIMIWMentionedTypeAll),
    @(RCIMIWMentionedTypePart),
  ];
  RCIMIWMentionedType MentionedType = [[MentionedTypeArray objectAtIndex:integer] integerValue];
  return MentionedType;
}
+ (NSInteger)convertMentionedTypeToInteger:(RCIMIWMentionedType)MentionedType {
  NSArray *MentionedTypeArray = @[
    @(RCIMIWMentionedTypeAll),
    @(RCIMIWMentionedTypePart),
  ];
  NSInteger index = [MentionedTypeArray indexOfObject:@(MentionedType)];
  return index;
}

+ (RCIMIWAreaCode)convertAreaCodeFromInteger:(NSInteger)integer {
  NSArray *AreaCodeArray = @[
    @(RCIMIWAreaCodeBJ),
    @(RCIMIWAreaCodeSG),
    @(RCIMIWAreaCodeNA),
    @(RCIMIWAreaCodeSGB),
    @(RCIMIWAreaCodeSA),
  ];
  RCIMIWAreaCode AreaCode = [[AreaCodeArray objectAtIndex:integer] integerValue];
  return AreaCode;
}
+ (NSInteger)convertAreaCodeToInteger:(RCIMIWAreaCode)AreaCode {
  NSArray *AreaCodeArray = @[
    @(RCIMIWAreaCodeBJ),
    @(RCIMIWAreaCodeSG),
    @(RCIMIWAreaCodeNA),
    @(RCIMIWAreaCodeSGB),
    @(RCIMIWAreaCodeSA),
  ];
  NSInteger index = [AreaCodeArray indexOfObject:@(AreaCode)];
  return index;
}

+ (RCIMIWChatRoomEntriesOperationType)convertChatRoomEntriesOperationTypeFromInteger:(NSInteger)integer {
  NSArray *ChatRoomEntriesOperationTypeArray = @[
    @(RCIMIWChatRoomEntriesOperationTypeUpdate),
    @(RCIMIWChatRoomEntriesOperationTypeRemove),
  ];
  RCIMIWChatRoomEntriesOperationType ChatRoomEntriesOperationType = [[ChatRoomEntriesOperationTypeArray objectAtIndex:integer] integerValue];
  return ChatRoomEntriesOperationType;
}
+ (NSInteger)convertChatRoomEntriesOperationTypeToInteger:(RCIMIWChatRoomEntriesOperationType)ChatRoomEntriesOperationType {
  NSArray *ChatRoomEntriesOperationTypeArray = @[
    @(RCIMIWChatRoomEntriesOperationTypeUpdate),
    @(RCIMIWChatRoomEntriesOperationTypeRemove),
  ];
  NSInteger index = [ChatRoomEntriesOperationTypeArray indexOfObject:@(ChatRoomEntriesOperationType)];
  return index;
}

+ (RCIMIWLogLevel)convertLogLevelFromInteger:(NSInteger)integer {
  NSArray *LogLevelArray = @[
    @(RCIMIWLogLevelNone),
    @(RCIMIWLogLevelError),
    @(RCIMIWLogLevelWarn),
    @(RCIMIWLogLevelInfo),
    @(RCIMIWLogLevelDebug),
    @(RCIMIWLogLevelVerbose),
  ];
  RCIMIWLogLevel LogLevel = [[LogLevelArray objectAtIndex:integer] integerValue];
  return LogLevel;
}
+ (NSInteger)convertLogLevelToInteger:(RCIMIWLogLevel)LogLevel {
  NSArray *LogLevelArray = @[
    @(RCIMIWLogLevelNone),
    @(RCIMIWLogLevelError),
    @(RCIMIWLogLevelWarn),
    @(RCIMIWLogLevelInfo),
    @(RCIMIWLogLevelDebug),
    @(RCIMIWLogLevelVerbose),
  ];
  NSInteger index = [LogLevelArray indexOfObject:@(LogLevel)];
  return index;
}

+ (RCIMIWBlacklistStatus)convertBlacklistStatusFromInteger:(NSInteger)integer {
  NSArray *BlacklistStatusArray = @[
    @(RCIMIWBlacklistStatusUnknown),
    @(RCIMIWBlacklistStatusInBlacklist),
    @(RCIMIWBlacklistStatusNotInBlacklist),
  ];
  RCIMIWBlacklistStatus BlacklistStatus = [[BlacklistStatusArray objectAtIndex:integer] integerValue];
  return BlacklistStatus;
}
+ (NSInteger)convertBlacklistStatusToInteger:(RCIMIWBlacklistStatus)BlacklistStatus {
  NSArray *BlacklistStatusArray = @[
    @(RCIMIWBlacklistStatusUnknown),
    @(RCIMIWBlacklistStatusInBlacklist),
    @(RCIMIWBlacklistStatusNotInBlacklist),
  ];
  NSInteger index = [BlacklistStatusArray indexOfObject:@(BlacklistStatus)];
  return index;
}

+ (RCIMIWImportanceHonor)convertImportanceHonorFromInteger:(NSInteger)integer {
  NSArray *ImportanceHonorArray = @[
    @(RCIMIWImportanceHonorNormal),
    @(RCIMIWImportanceHonorLow),
  ];
  RCIMIWImportanceHonor ImportanceHonor = [[ImportanceHonorArray objectAtIndex:integer] integerValue];
  return ImportanceHonor;
}
+ (NSInteger)convertImportanceHonorToInteger:(RCIMIWImportanceHonor)ImportanceHonor {
  NSArray *ImportanceHonorArray = @[
    @(RCIMIWImportanceHonorNormal),
    @(RCIMIWImportanceHonorLow),
  ];
  NSInteger index = [ImportanceHonorArray indexOfObject:@(ImportanceHonor)];
  return index;
}

+ (RCIMIWConnectionStatus)convertConnectionStatusFromInteger:(NSInteger)integer {
  NSArray *ConnectionStatusArray = @[
    @(RCIMIWConnectionStatusNetworkUnavailable),
    @(RCIMIWConnectionStatusConnected),
    @(RCIMIWConnectionStatusConnecting),
    @(RCIMIWConnectionStatusUnconnected),
    @(RCIMIWConnectionStatusKickedOfflineByOtherClient),
    @(RCIMIWConnectionStatusTokenIncorrect),
    @(RCIMIWConnectionStatusConnUserBlocked),
    @(RCIMIWConnectionStatusSignOut),
    @(RCIMIWConnectionStatusSuspend),
    @(RCIMIWConnectionStatusTimeout),
    @(RCIMIWConnectionStatusUnknown),
  ];
  RCIMIWConnectionStatus ConnectionStatus = [[ConnectionStatusArray objectAtIndex:integer] integerValue];
  return ConnectionStatus;
}
+ (NSInteger)convertConnectionStatusToInteger:(RCIMIWConnectionStatus)ConnectionStatus {
  NSArray *ConnectionStatusArray = @[
    @(RCIMIWConnectionStatusNetworkUnavailable),
    @(RCIMIWConnectionStatusConnected),
    @(RCIMIWConnectionStatusConnecting),
    @(RCIMIWConnectionStatusUnconnected),
    @(RCIMIWConnectionStatusKickedOfflineByOtherClient),
    @(RCIMIWConnectionStatusTokenIncorrect),
    @(RCIMIWConnectionStatusConnUserBlocked),
    @(RCIMIWConnectionStatusSignOut),
    @(RCIMIWConnectionStatusSuspend),
    @(RCIMIWConnectionStatusTimeout),
    @(RCIMIWConnectionStatusUnknown),
  ];
  NSInteger index = [ConnectionStatusArray indexOfObject:@(ConnectionStatus)];
  return index;
}

@end
