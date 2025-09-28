//
//  RCIMIWPlatformConverter.h
//  RongIMWrapper
//
//  Created by zhangyifan on 2022/5/10.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RCIMIWChatRoomMemberAction;
@class RCIMIWBlockedMessageInfo;
@class RCIMIWGroupReadReceiptInfo;
@class RCIMIWBlockedMessageInfo;
@class RCIMIWTypingStatus;
@class RCIMIWUltraGroupTypingStatusInfo;
@class RCIMIWMessage;
@class RCIMIWMediaMessage;
@class RCIMIWMessagePushOptions;
@class RCIMIWCompressOptions;
@class RCIMIWEngineOptions;
@class RCIMIWSearchConversationResult;
@class RCIMIWAndroidPushOptions;
@class RCIMIWIOSPushOptions;
@class RCIMIWConversation;
@class RCIMIWTagInfo;
@class RCIMIWConversationTagInfo;
@class RCIMIWReceivedStatusInfo;
@class RCIMIWGroupInfo;
@class RCIMIWQuitGroupConfig;
@class RCIMIWPagingQueryOption;
@class RCIMIWPagingQueryResult;
@class RCIMIWFollowInfo;
@class RCIMIWGroupMemberInfo;
@class RCIMIWGroupApplicationInfo;
@class RCIMIWChatRoomSyncEvent;
@class RCIMIWChatRoomMemberBlockEvent;
@class RCIMIWChatRoomMemberBanEvent;
@class RCIMIWTranslateMessagesParams;
@class RCIMIWTranslateTextParams;
@class RCIMIWTranslateItem;
@class RCIMIWUserProfile;
@class RCIMIWSubscribeEvent;
@class RCIMIWSubscribeInfoEvent;
@class RCIMIWSubscribeEventDetail;
@class RCIMIWSubscribeEventRequest;
@class RCIMIWSpeechToTextInfo;
@class RCIMIWAppSettings;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWPlatformConverter : NSObject


// ChatRoomMemberAction
+ (NSDictionary *)convertChatRoomMemberActionToDict:(RCIMIWChatRoomMemberAction *)chatRoomMemberAction;
+ (RCIMIWChatRoomMemberAction *)convertChatRoomMemberActionFromDict:(NSDictionary *)chatRoomMemberAction;

// BlockedMessageInfo
+ (NSDictionary *)convertBlockedMessageInfoToDict:(RCIMIWBlockedMessageInfo *)blockedMessageInfo;
+ (RCIMIWBlockedMessageInfo *)convertBlockedMessageInfoFromDict:(NSDictionary *)blockedMessageInfo;

// GroupReadReceiptInfo
+ (NSDictionary *)convertGroupReadReceiptInfoToDict:(RCIMIWGroupReadReceiptInfo *)groupReadReceiptInfo;
+ (RCIMIWGroupReadReceiptInfo *)convertGroupReadReceiptInfoFromDict:(NSDictionary *)groupReadReceiptInfo;


// TypingStatus
+ (NSDictionary *)convertTypingStatusToDict:(RCIMIWTypingStatus *)typingStatus;
+ (RCIMIWTypingStatus *)convertTypingStatusFromDict:(NSDictionary *)typingStatus;

// UltraGroupTypingStatusInfo
+ (NSDictionary *)convertUltraGroupTypingStatusInfoToDict:(RCIMIWUltraGroupTypingStatusInfo *)ultraGroupTypingStatusInfo;
+ (RCIMIWUltraGroupTypingStatusInfo *)convertUltraGroupTypingStatusInfoFromDict:(NSDictionary *)ultraGroupTypingStatusInfo;


// Message
+ (NSDictionary *)convertMessageToDict:(RCIMIWMessage *)message;
+ (RCIMIWMessage *)convertMessageFromDict:(NSDictionary *)message;

+ (NSDictionary *)convertMediaMessageToDict:(RCIMIWMediaMessage *)message;
+ (RCIMIWMediaMessage *)convertMediaMessageFromDict:(NSDictionary *)message;


// AndroidPushOptions
//+ (NSDictionary *)convertAndroidPushOptionsToDict:(RCIMIWAndroidPushOptions *)androidPushOptions;
//+ (RCIMIWAndroidPushOptions *)convertAndroidPushOptionsFromDict:(NSDictionary *)androidPushOptions;


// EngineOptions
+ (NSDictionary *)convertEngineOptionsToDict:(RCIMIWEngineOptions *)engineOptions;
+ (RCIMIWEngineOptions *)convertEngineOptionsFromDict:(NSDictionary *)engineOptions;


// IOSPushOptions
//+ (NSDictionary *)convertIOSPushOptionsToDict:(RCIMIWIOSPushOptions *)iosPushOptions;
//+ (RCIMIWIOSPushOptions *)convertIOSPushOptionsFromDict:(NSDictionary *)iosPushOptions;


// MessagePushOptions
+ (NSDictionary *)convertMessagePushOptionsToDict:(RCIMIWMessagePushOptions *)messagePushOptions;
+ (RCIMIWMessagePushOptions *)convertMessagePushOptionsFromDict:(NSDictionary *)messagePushOptions;


// Conversation
+ (NSDictionary *)convertConversationToDict:(RCIMIWConversation *)conversation;

// SearchConversationResult
+ (NSDictionary *)convertSearchConversationResultToDict:(RCIMIWSearchConversationResult *)searchConversationResult;

// SearchConversationResult
+ (NSDictionary *)convertTagInfoToDict:(RCIMIWTagInfo *)tagInfo;

// SearchConversationResult
+ (NSDictionary *)convertConversationTagInfoToDict:(RCIMIWConversationTagInfo *)tagInfo;

+ (RCIMIWReceivedStatusInfo *)convertReceivedStatusInfoFromDict:(NSDictionary *)dict;

+ (RCIMIWGroupInfo *)convertGroupInfoFromDict:(NSDictionary *)dict;

+ (NSDictionary *)convertGroupInfoToDict:(RCIMIWGroupInfo *)groupInfo;

+ (RCIMIWQuitGroupConfig *)convertQuitGroupConfigFromDict:(NSDictionary *)dict;

+ (RCIMIWPagingQueryOption *)convertPagingQueryOptionFromDict:(NSDictionary *)dict;

+ (NSDictionary *)convertPagingQueryResultToDict:(RCIMIWPagingQueryResult *)result;

+ (NSDictionary *)convertFollowInfoToDict:(RCIMIWFollowInfo *)followInfo;

+ (NSDictionary *)convertGroupMemberInfoToDict:(RCIMIWGroupMemberInfo *)groupMemberInfo;

+ (NSDictionary *)convertGroupApplicationInfoToDict:(RCIMIWGroupApplicationInfo *)groupApplicationInfo;

+ (NSDictionary *)convertChatRoomSyncEventToDict:(RCIMIWChatRoomSyncEvent *)event;

+ (NSDictionary *)convertChatRoomMemberBlockEventToDict:(RCIMIWChatRoomMemberBlockEvent *)event;

+ (NSDictionary *)convertChatRoomMemberBanEventToDict:(RCIMIWChatRoomMemberBanEvent *)event;

// TranslateMessagesParams
+ (RCIMIWTranslateMessagesParams *)convertTranslateMessagesParamsFromDict:(NSDictionary *)dict;

// TranslateTextParams
+ (RCIMIWTranslateTextParams *)convertTranslateTextParamsFromDict:(NSDictionary *)dict;

// TranslateItem
+ (NSDictionary *)convertTranslateItemToDict:(RCIMIWTranslateItem *)item;

// UserProfile
+ (NSDictionary *)convertUserProfileToDict:(RCIMIWUserProfile *)userProfile;
+ (RCIMIWUserProfile *)convertUserProfileFromDict:(NSDictionary *)dict;

// SubscribeEvent
+ (NSDictionary *)convertSubscribeEventToDict:(RCIMIWSubscribeEvent *)subscribeEvent;
+ (RCIMIWSubscribeEvent *)convertSubscribeEventFromDict:(NSDictionary *)dict;

// SubscribeInfoEvent  
+ (NSDictionary *)convertSubscribeInfoEventToDict:(RCIMIWSubscribeInfoEvent *)subscribeInfoEvent;
+ (RCIMIWSubscribeInfoEvent *)convertSubscribeInfoEventFromDict:(NSDictionary *)dict;

// SubscribeEventDetail
+ (NSDictionary *)convertSubscribeEventDetailToDict:(RCIMIWSubscribeEventDetail *)subscribeEventDetail;
+ (RCIMIWSubscribeEventDetail *)convertSubscribeEventDetailFromDict:(NSDictionary *)dict;

// SubscribeEventRequest
+ (NSDictionary *)convertSubscribeEventRequestToDict:(RCIMIWSubscribeEventRequest *)subscribeEventRequest;
+ (RCIMIWSubscribeEventRequest *)convertSubscribeEventRequestFromDict:(NSDictionary *)dict;

// SpeechToText
+ (NSDictionary *)convertSpeechToTextInfoToDict:(RCIMIWSpeechToTextInfo *)info;
+ (RCIMIWSpeechToTextInfo *)convertSpeechToTextInfoFromDict:(NSDictionary *)dict;

// AppSettings
+ (NSDictionary *)convertAppSettingsToDict:(RCIMIWAppSettings *)settings;
+ (RCIMIWAppSettings *)convertAppSettingsFromDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
