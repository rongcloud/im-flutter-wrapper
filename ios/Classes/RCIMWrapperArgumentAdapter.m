//
//  RCIMWrapperArgumentAdapter.m
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#import "RCIMWrapperArgumentAdapter.h"

@implementation RCIMWrapperArgumentAdapter

+ (RCIMIWImportanceHW)convertImportanceHWFromInteger:(NSInteger)integer {
  NSArray *ImportanceHWArray = @[
    @(RCIMIWImportanceHWNormal),
    @(RCIMIWImportanceHWLow),
  ];
  RCIMIWImportanceHW ImportanceHW =
      [[ImportanceHWArray objectAtIndex:integer] integerValue];
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

+ (RCIMIWMessageOperationPolicy)convertMessageOperationPolicyFromInteger:
    (NSInteger)integer {
  NSArray *MessageOperationPolicyArray = @[
    @(RCIMIWMessageOperationPolicyLocal),
    @(RCIMIWMessageOperationPolicyRemote),
    @(RCIMIWMessageOperationPolicyLocalRemote),
  ];
  RCIMIWMessageOperationPolicy MessageOperationPolicy =
      [[MessageOperationPolicyArray objectAtIndex:integer] integerValue];
  return MessageOperationPolicy;
}
+ (NSInteger)convertMessageOperationPolicyToInteger:
    (RCIMIWMessageOperationPolicy)MessageOperationPolicy {
  NSArray *MessageOperationPolicyArray = @[
    @(RCIMIWMessageOperationPolicyLocal),
    @(RCIMIWMessageOperationPolicyRemote),
    @(RCIMIWMessageOperationPolicyLocalRemote),
  ];
  NSInteger index =
      [MessageOperationPolicyArray indexOfObject:@(MessageOperationPolicy)];
  return index;
}

+ (RCIMIWVIVOPushType)convertVIVOPushTypeFromInteger:(NSInteger)integer {
  NSArray *VIVOPushTypeArray = @[
    @(RCIMIWVIVOPushTypeOperate),
    @(RCIMIWVIVOPushTypeSystem),
  ];
  RCIMIWVIVOPushType VIVOPushType =
      [[VIVOPushTypeArray objectAtIndex:integer] integerValue];
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
  RCIMIWSentStatus SentStatus =
      [[SentStatusArray objectAtIndex:integer] integerValue];
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

+ (RCIMIWPushNotificationQuietHoursLevel)
    convertPushNotificationQuietHoursLevelFromInteger:(NSInteger)integer {
  NSArray *PushNotificationQuietHoursLevelArray = @[
    @(RCIMIWPushNotificationQuietHoursLevelNone),
    @(RCIMIWPushNotificationQuietHoursLevelMention),
    @(RCIMIWPushNotificationQuietHoursLevelBlocked),
  ];
  RCIMIWPushNotificationQuietHoursLevel PushNotificationQuietHoursLevel =
      [[PushNotificationQuietHoursLevelArray objectAtIndex:integer]
          integerValue];
  return PushNotificationQuietHoursLevel;
}
+ (NSInteger)convertPushNotificationQuietHoursLevelToInteger:
    (RCIMIWPushNotificationQuietHoursLevel)PushNotificationQuietHoursLevel {
  NSArray *PushNotificationQuietHoursLevelArray = @[
    @(RCIMIWPushNotificationQuietHoursLevelNone),
    @(RCIMIWPushNotificationQuietHoursLevelMention),
    @(RCIMIWPushNotificationQuietHoursLevelBlocked),
  ];
  NSInteger index = [PushNotificationQuietHoursLevelArray
      indexOfObject:@(PushNotificationQuietHoursLevel)];
  return index;
}

+ (RCIMIWMessageDirection)convertMessageDirectionFromInteger:
    (NSInteger)integer {
  NSArray *MessageDirectionArray = @[
    @(RCIMIWMessageDirectionSend),
    @(RCIMIWMessageDirectionReceive),
  ];
  RCIMIWMessageDirection MessageDirection =
      [[MessageDirectionArray objectAtIndex:integer] integerValue];
  return MessageDirection;
}
+ (NSInteger)convertMessageDirectionToInteger:
    (RCIMIWMessageDirection)MessageDirection {
  NSArray *MessageDirectionArray = @[
    @(RCIMIWMessageDirectionSend),
    @(RCIMIWMessageDirectionReceive),
  ];
  NSInteger index = [MessageDirectionArray indexOfObject:@(MessageDirection)];
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
  RCIMIWReceivedStatus ReceivedStatus =
      [[ReceivedStatusArray objectAtIndex:integer] integerValue];
  return ReceivedStatus;
}
+ (NSInteger)convertReceivedStatusToInteger:
    (RCIMIWReceivedStatus)ReceivedStatus {
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

+ (RCIMIWChatRoomMemberActionType)convertChatRoomMemberActionTypeFromInteger:
    (NSInteger)integer {
  NSArray *ChatRoomMemberActionTypeArray = @[
    @(RCIMIWChatRoomMemberActionTypeUnknown),
    @(RCIMIWChatRoomMemberActionTypeJoin),
    @(RCIMIWChatRoomMemberActionTypeLeave),
  ];
  RCIMIWChatRoomMemberActionType ChatRoomMemberActionType =
      [[ChatRoomMemberActionTypeArray objectAtIndex:integer] integerValue];
  return ChatRoomMemberActionType;
}
+ (NSInteger)convertChatRoomMemberActionTypeToInteger:
    (RCIMIWChatRoomMemberActionType)ChatRoomMemberActionType {
  NSArray *ChatRoomMemberActionTypeArray = @[
    @(RCIMIWChatRoomMemberActionTypeUnknown),
    @(RCIMIWChatRoomMemberActionTypeJoin),
    @(RCIMIWChatRoomMemberActionTypeLeave),
  ];
  NSInteger index =
      [ChatRoomMemberActionTypeArray indexOfObject:@(ChatRoomMemberActionType)];
  return index;
}

+ (RCIMIWPushNotificationLevel)convertPushNotificationLevelFromInteger:
    (NSInteger)integer {
  NSArray *PushNotificationLevelArray = @[
    @(RCIMIWPushNotificationLevelAllMessage),
    @(RCIMIWPushNotificationLevelNone),
    @(RCIMIWPushNotificationLevelMention),
    @(RCIMIWPushNotificationLevelMentionUsers),
    @(RCIMIWPushNotificationLevelMentionAll),
    @(RCIMIWPushNotificationLevelBlocked),
  ];
  RCIMIWPushNotificationLevel PushNotificationLevel =
      [[PushNotificationLevelArray objectAtIndex:integer] integerValue];
  return PushNotificationLevel;
}
+ (NSInteger)convertPushNotificationLevelToInteger:
    (RCIMIWPushNotificationLevel)PushNotificationLevel {
  NSArray *PushNotificationLevelArray = @[
    @(RCIMIWPushNotificationLevelAllMessage),
    @(RCIMIWPushNotificationLevelNone),
    @(RCIMIWPushNotificationLevelMention),
    @(RCIMIWPushNotificationLevelMentionUsers),
    @(RCIMIWPushNotificationLevelMentionAll),
    @(RCIMIWPushNotificationLevelBlocked),
  ];
  NSInteger index =
      [PushNotificationLevelArray indexOfObject:@(PushNotificationLevel)];
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
  ];
  RCIMIWMessageType MessageType =
      [[MessageTypeArray objectAtIndex:integer] integerValue];
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
  ];
  NSInteger index = [MessageTypeArray indexOfObject:@(MessageType)];
  return index;
}

+ (RCIMIWMessageBlockType)convertMessageBlockTypeFromInteger:
    (NSInteger)integer {
  NSArray *MessageBlockTypeArray = @[
    @(RCIMIWMessageBlockTypeUnknown),
    @(RCIMIWMessageBlockTypeGlobal),
    @(RCIMIWMessageBlockTypeCustom),
    @(RCIMIWMessageBlockTypeThirdParty),
  ];
  RCIMIWMessageBlockType MessageBlockType =
      [[MessageBlockTypeArray objectAtIndex:integer] integerValue];
  return MessageBlockType;
}
+ (NSInteger)convertMessageBlockTypeToInteger:
    (RCIMIWMessageBlockType)MessageBlockType {
  NSArray *MessageBlockTypeArray = @[
    @(RCIMIWMessageBlockTypeUnknown),
    @(RCIMIWMessageBlockTypeGlobal),
    @(RCIMIWMessageBlockTypeCustom),
    @(RCIMIWMessageBlockTypeThirdParty),
  ];
  NSInteger index = [MessageBlockTypeArray indexOfObject:@(MessageBlockType)];
  return index;
}

+ (RCIMIWTimeOrder)convertTimeOrderFromInteger:(NSInteger)integer {
  NSArray *TimeOrderArray = @[
    @(RCIMIWTimeOrderBefore),
    @(RCIMIWTimeOrderAfter),
  ];
  RCIMIWTimeOrder TimeOrder =
      [[TimeOrderArray objectAtIndex:integer] integerValue];
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

+ (RCIMIWCustomMessagePolicy)convertCustomMessagePolicyFromInteger:
    (NSInteger)integer {
  NSArray *CustomMessagePolicyArray = @[
    @(RCIMIWCustomMessagePolicyCommand),
    @(RCIMIWCustomMessagePolicyNormal),
    @(RCIMIWCustomMessagePolicyStatus),
    @(RCIMIWCustomMessagePolicyStorage),
  ];
  RCIMIWCustomMessagePolicy CustomMessagePolicy =
      [[CustomMessagePolicyArray objectAtIndex:integer] integerValue];
  return CustomMessagePolicy;
}
+ (NSInteger)convertCustomMessagePolicyToInteger:
    (RCIMIWCustomMessagePolicy)CustomMessagePolicy {
  NSArray *CustomMessagePolicyArray = @[
    @(RCIMIWCustomMessagePolicyCommand),
    @(RCIMIWCustomMessagePolicyNormal),
    @(RCIMIWCustomMessagePolicyStatus),
    @(RCIMIWCustomMessagePolicyStorage),
  ];
  NSInteger index =
      [CustomMessagePolicyArray indexOfObject:@(CustomMessagePolicy)];
  return index;
}

+ (RCIMIWChatRoomStatus)convertChatRoomStatusFromInteger:(NSInteger)integer {
  NSArray *ChatRoomStatusArray = @[
    @(RCIMIWChatRoomStatusReset),
    @(RCIMIWChatRoomStatusDestroyManual),
    @(RCIMIWChatRoomStatusDestroyAuto),
  ];
  RCIMIWChatRoomStatus ChatRoomStatus =
      [[ChatRoomStatusArray objectAtIndex:integer] integerValue];
  return ChatRoomStatus;
}
+ (NSInteger)convertChatRoomStatusToInteger:
    (RCIMIWChatRoomStatus)ChatRoomStatus {
  NSArray *ChatRoomStatusArray = @[
    @(RCIMIWChatRoomStatusReset),
    @(RCIMIWChatRoomStatusDestroyManual),
    @(RCIMIWChatRoomStatusDestroyAuto),
  ];
  NSInteger index = [ChatRoomStatusArray indexOfObject:@(ChatRoomStatus)];
  return index;
}

+ (RCIMIWConversationType)convertConversationTypeFromInteger:
    (NSInteger)integer {
  NSArray *ConversationTypeArray = @[
    @(RCIMIWConversationTypeInvalid),
    @(RCIMIWConversationTypePrivate),
    @(RCIMIWConversationTypeGroup),
    @(RCIMIWConversationTypeChatroom),
    @(RCIMIWConversationTypeSystem),
    @(RCIMIWConversationTypeUltraGroup),
  ];
  RCIMIWConversationType ConversationType =
      [[ConversationTypeArray objectAtIndex:integer] integerValue];
  return ConversationType;
}
+ (NSInteger)convertConversationTypeToInteger:
    (RCIMIWConversationType)ConversationType {
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
  RCIMIWErrorCode ErrorCode =
      [[ErrorCodeArray objectAtIndex:integer] integerValue];
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

+ (RCIMIWUltraGroupTypingStatus)convertUltraGroupTypingStatusFromInteger:
    (NSInteger)integer {
  NSArray *UltraGroupTypingStatusArray = @[
    @(RCIMIWUltraGroupTypingStatusText),
  ];
  RCIMIWUltraGroupTypingStatus UltraGroupTypingStatus =
      [[UltraGroupTypingStatusArray objectAtIndex:integer] integerValue];
  return UltraGroupTypingStatus;
}
+ (NSInteger)convertUltraGroupTypingStatusToInteger:
    (RCIMIWUltraGroupTypingStatus)UltraGroupTypingStatus {
  NSArray *UltraGroupTypingStatusArray = @[
    @(RCIMIWUltraGroupTypingStatusText),
  ];
  NSInteger index =
      [UltraGroupTypingStatusArray indexOfObject:@(UltraGroupTypingStatus)];
  return index;
}

+ (RCIMIWMentionedType)convertMentionedTypeFromInteger:(NSInteger)integer {
  NSArray *MentionedTypeArray = @[
    @(RCIMIWMentionedTypeAll),
    @(RCIMIWMentionedTypePart),
  ];
  RCIMIWMentionedType MentionedType =
      [[MentionedTypeArray objectAtIndex:integer] integerValue];
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

+ (RCIMIWChatRoomEntriesOperationType)
    convertChatRoomEntriesOperationTypeFromInteger:(NSInteger)integer {
  NSArray *ChatRoomEntriesOperationTypeArray = @[
    @(RCIMIWChatRoomEntriesOperationTypeUpdate),
    @(RCIMIWChatRoomEntriesOperationTypeRemove),
  ];
  RCIMIWChatRoomEntriesOperationType ChatRoomEntriesOperationType =
      [[ChatRoomEntriesOperationTypeArray objectAtIndex:integer] integerValue];
  return ChatRoomEntriesOperationType;
}
+ (NSInteger)convertChatRoomEntriesOperationTypeToInteger:
    (RCIMIWChatRoomEntriesOperationType)ChatRoomEntriesOperationType {
  NSArray *ChatRoomEntriesOperationTypeArray = @[
    @(RCIMIWChatRoomEntriesOperationTypeUpdate),
    @(RCIMIWChatRoomEntriesOperationTypeRemove),
  ];
  NSInteger index = [ChatRoomEntriesOperationTypeArray
      indexOfObject:@(ChatRoomEntriesOperationType)];
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
  RCIMIWLogLevel LogLevel =
      [[LogLevelArray objectAtIndex:integer] integerValue];
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
  RCIMIWBlacklistStatus BlacklistStatus =
      [[BlacklistStatusArray objectAtIndex:integer] integerValue];
  return BlacklistStatus;
}
+ (NSInteger)convertBlacklistStatusToInteger:
    (RCIMIWBlacklistStatus)BlacklistStatus {
  NSArray *BlacklistStatusArray = @[
    @(RCIMIWBlacklistStatusUnknown),
    @(RCIMIWBlacklistStatusInBlacklist),
    @(RCIMIWBlacklistStatusNotInBlacklist),
  ];
  NSInteger index = [BlacklistStatusArray indexOfObject:@(BlacklistStatus)];
  return index;
}

+ (RCIMIWConnectionStatus)convertConnectionStatusFromInteger:
    (NSInteger)integer {
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
  ];
  RCIMIWConnectionStatus ConnectionStatus =
      [[ConnectionStatusArray objectAtIndex:integer] integerValue];
  return ConnectionStatus;
}
+ (NSInteger)convertConnectionStatusToInteger:
    (RCIMIWConnectionStatus)ConnectionStatus {
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
  ];
  NSInteger index = [ConnectionStatusArray indexOfObject:@(ConnectionStatus)];
  return index;
}

@end
