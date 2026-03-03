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
@class RCIMIWStreamMessage;
@class RCIMIWReferenceInfo;
@class RCIMIWStreamMessageChunkInfo;
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
@class RCIMIWFriendInfo;
@class RCIMIWFriendRelationInfo;
@class RCIMIWFriendApplicationInfo;
@class RCIMIWStreamMessageRequestParams;
@class RCIMIWCombineV2Message;
@class RCIMIWCombineMsgInfo;
@class RCIMIWReadReceiptUser;
@class RCIMIWMessageIdentifier;
@class RCIMIWReadReceiptInfoV5;
@class RCIMIWReadReceiptResponseV5;
@class RCIMIWReadReceiptUsersOption;
@class RCIMIWReadReceiptUsersResult;

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

// StreamMessage
+ (NSDictionary *)convertStreamMessageToDict:(RCIMIWStreamMessage *)message;
+ (RCIMIWStreamMessage *)convertStreamMessageFromDict:(NSDictionary *)message;

// ReferenceInfo
+ (NSDictionary *)convertReferenceInfoToDict:(RCIMIWReferenceInfo *)referenceInfo;
+ (RCIMIWReferenceInfo *)convertReferenceInfoFromDict:(NSDictionary *)referenceInfo;

// StreamMessageChunkInfo
+ (NSDictionary *)convertStreamMessageChunkInfoToDict:(RCIMIWStreamMessageChunkInfo *)chunkInfo;
+ (RCIMIWStreamMessageChunkInfo *)convertStreamMessageChunkInfoFromDict:(NSDictionary *)chunkInfo;

// StreamMessageRequestParams
+ (NSDictionary *)convertStreamMessageRequestParamsToDict:(RCIMIWStreamMessageRequestParams *)params;
+ (RCIMIWStreamMessageRequestParams *)convertStreamMessageRequestParamsFromDict:(NSDictionary *)params;


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

// Friend
+ (NSDictionary *)convertFriendInfoToDict:(RCIMIWFriendInfo *)friendInfo;
+ (RCIMIWFriendInfo *)convertFriendInfoFromDict:(NSDictionary *)dict;
+ (NSDictionary *)convertFriendRelationInfoToDict:(RCIMIWFriendRelationInfo *)relationInfo;
+ (RCIMIWFriendRelationInfo *)convertFriendRelationInfoFromDict:(NSDictionary *)dict;
+ (NSDictionary *)convertFriendApplicationInfoToDict:(RCIMIWFriendApplicationInfo *)applicationInfo;
+ (RCIMIWFriendApplicationInfo *)convertFriendApplicationInfoFromDict:(NSDictionary *)dict;

// CombineV2
+ (NSDictionary *)convertCombineV2MessageToDict:(RCIMIWCombineV2Message *)msg;
+ (RCIMIWCombineV2Message *)convertCombineV2MessageFromDict:(NSDictionary *)dic;
+ (NSDictionary *)convertCombineMsgInfoToDict:(RCIMIWCombineMsgInfo *)info;
+ (RCIMIWCombineMsgInfo *)convertCombineMsgInfoFromDict:(NSDictionary *)dic;

// ReadReceipt V5
+ (NSDictionary *)convertReadReceiptUserToDict:(RCIMIWReadReceiptUser *)user;
+ (RCIMIWReadReceiptUser *)convertReadReceiptUserFromDict:(NSDictionary *)dict;
+ (NSDictionary *)convertMessageIdentifierToDict:(RCIMIWMessageIdentifier *)identifier;
+ (RCIMIWMessageIdentifier *)convertMessageIdentifierFromDict:(NSDictionary *)dict;
+ (NSDictionary *)convertReadReceiptInfoV5ToDict:(RCIMIWReadReceiptInfoV5 *)info;
+ (RCIMIWReadReceiptInfoV5 *)convertReadReceiptInfoV5FromDict:(NSDictionary *)dict;
+ (NSDictionary *)convertReadReceiptResponseV5ToDict:(RCIMIWReadReceiptResponseV5 *)response;
+ (RCIMIWReadReceiptResponseV5 *)convertReadReceiptResponseV5FromDict:(NSDictionary *)dict;
+ (NSDictionary *)convertReadReceiptUsersOptionToDict:(RCIMIWReadReceiptUsersOption *)option;
+ (RCIMIWReadReceiptUsersOption *)convertReadReceiptUsersOptionFromDict:(NSDictionary *)dict;
+ (NSDictionary *)convertReadReceiptUsersResultToDict:(RCIMIWReadReceiptUsersResult *)result;
+ (RCIMIWReadReceiptUsersResult *)convertReadReceiptUsersResultFromDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
