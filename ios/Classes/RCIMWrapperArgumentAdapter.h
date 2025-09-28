//
//  RCIMWrapperArgumentAdapter.h
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RongIMWrapper.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMWrapperArgumentAdapter : NSObject


+ (RCIMIWGroupInviteHandlePermission)convertGroupInviteHandlePermissionFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupInviteHandlePermissionToInteger:(RCIMIWGroupInviteHandlePermission)GroupInviteHandlePermission;


+ (RCIMIWGroupApplicationStatus)convertGroupApplicationStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupApplicationStatusToInteger:(RCIMIWGroupApplicationStatus)GroupApplicationStatus;


+ (RCIMIWGroupApplicationDirection)convertGroupApplicationDirectionFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupApplicationDirectionToInteger:(RCIMIWGroupApplicationDirection)GroupApplicationDirection;


+ (RCIMIWGroupOperation)convertGroupOperationFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupOperationToInteger:(RCIMIWGroupOperation)GroupOperation;


+ (RCIMIWGroupJoinPermission)convertGroupJoinPermissionFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupJoinPermissionToInteger:(RCIMIWGroupJoinPermission)GroupJoinPermission;


+ (RCIMIWGroupStatus)convertGroupStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupStatusToInteger:(RCIMIWGroupStatus)GroupStatus;


+ (RCIMIWGroupOperationPermission)convertGroupOperationPermissionFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupOperationPermissionToInteger:(RCIMIWGroupOperationPermission)GroupOperationPermission;


+ (RCIMIWGroupOperationType)convertGroupOperationTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupOperationTypeToInteger:(RCIMIWGroupOperationType)GroupOperationType;


+ (RCIMIWGroupMemberInfoEditPermission)convertGroupMemberInfoEditPermissionFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupMemberInfoEditPermissionToInteger:(RCIMIWGroupMemberInfoEditPermission)GroupMemberInfoEditPermission;


+ (RCIMIWGroupMemberRole)convertGroupMemberRoleFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupMemberRoleToInteger:(RCIMIWGroupMemberRole)GroupMemberRole;


+ (RCIMIWGroupApplicationType)convertGroupApplicationTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertGroupApplicationTypeToInteger:(RCIMIWGroupApplicationType)GroupApplicationType;


+ (RCIMIWTranslateStrategy)convertTranslateStrategyFromInteger:(NSInteger)integer;
+ (NSInteger)convertTranslateStrategyToInteger:(RCIMIWTranslateStrategy)TranslateStrategy;


+ (RCIMIWImportanceHW)convertImportanceHWFromInteger:(NSInteger)integer;
+ (NSInteger)convertImportanceHWToInteger:(RCIMIWImportanceHW)ImportanceHW;


+ (RCIMIWMessageOperationPolicy)convertMessageOperationPolicyFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageOperationPolicyToInteger:(RCIMIWMessageOperationPolicy)MessageOperationPolicy;


+ (RCIMIWNativeCustomMessagePersistentFlag)convertNativeCustomMessagePersistentFlagFromInteger:(NSInteger)integer;
+ (NSInteger)convertNativeCustomMessagePersistentFlagToInteger:(RCIMIWNativeCustomMessagePersistentFlag)NativeCustomMessagePersistentFlag;


+ (RCIMIWVIVOPushType)convertVIVOPushTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertVIVOPushTypeToInteger:(RCIMIWVIVOPushType)VIVOPushType;


+ (RCIMIWSpeechToTextStatus)convertSpeechToTextStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertSpeechToTextStatusToInteger:(RCIMIWSpeechToTextStatus)SpeechToTextStatus;


+ (RCIMIWSentStatus)convertSentStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertSentStatusToInteger:(RCIMIWSentStatus)SentStatus;


+ (RCIMIWChatRoomSyncStatus)convertChatRoomSyncStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomSyncStatusToInteger:(RCIMIWChatRoomSyncStatus)ChatRoomSyncStatus;


+ (RCIMIWPushNotificationQuietHoursLevel)convertPushNotificationQuietHoursLevelFromInteger:(NSInteger)integer;
+ (NSInteger)convertPushNotificationQuietHoursLevelToInteger:(RCIMIWPushNotificationQuietHoursLevel)PushNotificationQuietHoursLevel;


+ (RCIMIWMessageDirection)convertMessageDirectionFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageDirectionToInteger:(RCIMIWMessageDirection)MessageDirection;


+ (RCIMIWTranslateStatus)convertTranslateStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertTranslateStatusToInteger:(RCIMIWTranslateStatus)TranslateStatus;


+ (RCIMIWReceivedStatus)convertReceivedStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertReceivedStatusToInteger:(RCIMIWReceivedStatus)ReceivedStatus;


+ (RCIMIWChatRoomMemberActionType)convertChatRoomMemberActionTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomMemberActionTypeToInteger:(RCIMIWChatRoomMemberActionType)ChatRoomMemberActionType;


+ (RCIMIWPushNotificationLevel)convertPushNotificationLevelFromInteger:(NSInteger)integer;
+ (NSInteger)convertPushNotificationLevelToInteger:(RCIMIWPushNotificationLevel)PushNotificationLevel;


+ (RCIMIWTranslateMode)convertTranslateModeFromInteger:(NSInteger)integer;
+ (NSInteger)convertTranslateModeToInteger:(RCIMIWTranslateMode)TranslateMode;


+ (RCIMIWTranslateResultType)convertTranslateResultTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertTranslateResultTypeToInteger:(RCIMIWTranslateResultType)TranslateResultType;


+ (RCIMIWMessageType)convertMessageTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageTypeToInteger:(RCIMIWMessageType)MessageType;


+ (RCIMIWMessageBlockType)convertMessageBlockTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageBlockTypeToInteger:(RCIMIWMessageBlockType)MessageBlockType;


+ (RCIMIWMessageAuditType)convertMessageAuditTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageAuditTypeToInteger:(RCIMIWMessageAuditType)MessageAuditType;


+ (RCIMIWChatRoomMemberBanType)convertChatRoomMemberBanTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomMemberBanTypeToInteger:(RCIMIWChatRoomMemberBanType)ChatRoomMemberBanType;


+ (RCIMIWChatRoomMemberOperateType)convertChatRoomMemberOperateTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomMemberOperateTypeToInteger:(RCIMIWChatRoomMemberOperateType)ChatRoomMemberOperateType;


+ (RCIMIWTimeOrder)convertTimeOrderFromInteger:(NSInteger)integer;
+ (NSInteger)convertTimeOrderToInteger:(RCIMIWTimeOrder)TimeOrder;


+ (RCIMIWCustomMessagePolicy)convertCustomMessagePolicyFromInteger:(NSInteger)integer;
+ (NSInteger)convertCustomMessagePolicyToInteger:(RCIMIWCustomMessagePolicy)CustomMessagePolicy;


+ (RCIMIWChatRoomStatus)convertChatRoomStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomStatusToInteger:(RCIMIWChatRoomStatus)ChatRoomStatus;


+ (RCIMIWConversationType)convertConversationTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertConversationTypeToInteger:(RCIMIWConversationType)ConversationType;


+ (RCIMIWErrorCode)convertErrorCodeFromInteger:(NSInteger)integer;
+ (NSInteger)convertErrorCodeToInteger:(RCIMIWErrorCode)ErrorCode;


+ (RCIMIWChatRoomSyncStatusReason)convertChatRoomSyncStatusReasonFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomSyncStatusReasonToInteger:(RCIMIWChatRoomSyncStatusReason)ChatRoomSyncStatusReason;


+ (RCIMIWUltraGroupTypingStatus)convertUltraGroupTypingStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertUltraGroupTypingStatusToInteger:(RCIMIWUltraGroupTypingStatus)UltraGroupTypingStatus;


+ (RCIMIWMentionedType)convertMentionedTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertMentionedTypeToInteger:(RCIMIWMentionedType)MentionedType;


+ (RCIMIWAreaCode)convertAreaCodeFromInteger:(NSInteger)integer;
+ (NSInteger)convertAreaCodeToInteger:(RCIMIWAreaCode)AreaCode;


+ (RCIMIWChatRoomEntriesOperationType)convertChatRoomEntriesOperationTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomEntriesOperationTypeToInteger:(RCIMIWChatRoomEntriesOperationType)ChatRoomEntriesOperationType;


+ (RCIMIWLogLevel)convertLogLevelFromInteger:(NSInteger)integer;
+ (NSInteger)convertLogLevelToInteger:(RCIMIWLogLevel)LogLevel;


+ (RCIMIWBlacklistStatus)convertBlacklistStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertBlacklistStatusToInteger:(RCIMIWBlacklistStatus)BlacklistStatus;


+ (RCIMIWImportanceHonor)convertImportanceHonorFromInteger:(NSInteger)integer;
+ (NSInteger)convertImportanceHonorToInteger:(RCIMIWImportanceHonor)ImportanceHonor;


+ (RCIMIWConnectionStatus)convertConnectionStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertConnectionStatusToInteger:(RCIMIWConnectionStatus)ConnectionStatus;


+ (RCIMIWPlatform)convertPlatformFromInteger:(NSInteger)integer;
+ (NSInteger)convertPlatformToInteger:(RCIMIWPlatform)Platform;


+ (RCIMIWSubscribeOperationType)convertSubscribeOperationTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertSubscribeOperationTypeToInteger:(RCIMIWSubscribeOperationType)SubscribeOperationType;


+ (RCIMIWSubscribeType)convertSubscribeTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertSubscribeTypeToInteger:(RCIMIWSubscribeType)SubscribeType;


+ (RCIMIWUserProfileVisibility)convertUserProfileVisibilityFromInteger:(NSInteger)integer;
+ (NSInteger)convertUserProfileVisibilityToInteger:(RCIMIWUserProfileVisibility)UserProfileVisibility;


+ (RCIMIWUserGender)convertUserGenderFromInteger:(NSInteger)integer;
+ (NSInteger)convertUserGenderToInteger:(RCIMIWUserGender)UserGender;



@end

NS_ASSUME_NONNULL_END
