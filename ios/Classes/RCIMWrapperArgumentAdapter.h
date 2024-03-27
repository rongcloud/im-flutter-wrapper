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


+ (RCIMIWImportanceHW)convertImportanceHWFromInteger:(NSInteger)integer;
+ (NSInteger)convertImportanceHWToInteger:(RCIMIWImportanceHW)ImportanceHW;


+ (RCIMIWMessageOperationPolicy)convertMessageOperationPolicyFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageOperationPolicyToInteger:(RCIMIWMessageOperationPolicy)MessageOperationPolicy;


+ (RCIMIWVIVOPushType)convertVIVOPushTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertVIVOPushTypeToInteger:(RCIMIWVIVOPushType)VIVOPushType;


+ (RCIMIWSentStatus)convertSentStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertSentStatusToInteger:(RCIMIWSentStatus)SentStatus;


+ (RCIMIWPushNotificationQuietHoursLevel)convertPushNotificationQuietHoursLevelFromInteger:(NSInteger)integer;
+ (NSInteger)convertPushNotificationQuietHoursLevelToInteger:(RCIMIWPushNotificationQuietHoursLevel)PushNotificationQuietHoursLevel;


+ (RCIMIWMessageDirection)convertMessageDirectionFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageDirectionToInteger:(RCIMIWMessageDirection)MessageDirection;


+ (RCIMIWReceivedStatus)convertReceivedStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertReceivedStatusToInteger:(RCIMIWReceivedStatus)ReceivedStatus;


+ (RCIMIWChatRoomMemberActionType)convertChatRoomMemberActionTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertChatRoomMemberActionTypeToInteger:(RCIMIWChatRoomMemberActionType)ChatRoomMemberActionType;


+ (RCIMIWPushNotificationLevel)convertPushNotificationLevelFromInteger:(NSInteger)integer;
+ (NSInteger)convertPushNotificationLevelToInteger:(RCIMIWPushNotificationLevel)PushNotificationLevel;


+ (RCIMIWMessageType)convertMessageTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageTypeToInteger:(RCIMIWMessageType)MessageType;


+ (RCIMIWMessageBlockType)convertMessageBlockTypeFromInteger:(NSInteger)integer;
+ (NSInteger)convertMessageBlockTypeToInteger:(RCIMIWMessageBlockType)MessageBlockType;


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


+ (RCIMIWConnectionStatus)convertConnectionStatusFromInteger:(NSInteger)integer;
+ (NSInteger)convertConnectionStatusToInteger:(RCIMIWConnectionStatus)ConnectionStatus;



@end

NS_ASSUME_NONNULL_END
