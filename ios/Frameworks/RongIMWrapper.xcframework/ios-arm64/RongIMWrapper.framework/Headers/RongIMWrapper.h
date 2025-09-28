//
//  RongIMWrapper.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/15/22.
//

#import <Foundation/Foundation.h>

//! Project version number for RongIMWrapper.
FOUNDATION_EXPORT double RongIMWrapperVersionNumber;

//! Project version string for RongIMWrapper.
FOUNDATION_EXPORT const unsigned char RongIMWrapperVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <RongIMWrapper/PublicHeader.h>


#import <RongIMWrapper/RCIMIWEngine.h>

#import <RongIMWrapper/RCIMIWEngineOptions.h>
#import <RongIMWrapper/RCIMIWMessagePushOptions.h>
#import <RongIMWrapper/RCIMIWAppSettings.h>
#import <RongIMWrapper/RCIMIWCompressOptions.h>

#import <RongIMWrapper/RCIMIWMessage.h>
#import <RongIMWrapper/RCIMIWMediaMessage.h>
#import <RongIMWrapper/RCIMIWTextMessage.h>
#import <RongIMWrapper/RCIMIWImageMessage.h>
#import <RongIMWrapper/RCIMIWVoiceMessage.h>
#import <RongIMWrapper/RCIMIWSightMessage.h>
#import <RongIMWrapper/RCIMIWFileMessage.h>
#import <RongIMWrapper/RCIMIWGIFMessage.h>
#import <RongIMWrapper/RCIMIWCustomMessage.h>
#import <RongIMWrapper/RCIMIWCommandMessage.h>
#import <RongIMWrapper/RCIMIWReferenceMessage.h>
#import <RongIMWrapper/RCIMIWCommandNotificationMessage.h>
#import <RongIMWrapper/RCIMIWRecallNotificationMessage.h>
#import <RongIMWrapper/RCIMIWLocationMessage.h>
#import <RongIMWrapper/RCIMIWUnknownMessage.h>
#import <RongIMWrapper/RCIMIWNativeCustomMessage.h>
#import <RongIMWrapper/RCIMIWNativeCustomMediaMessage.h>
#import <RongIMWrapper/RCIMIWGroupNotificationMessage.h>
#import <RongIMWrapper/RCIMIWConversation.h>
#import <RongIMWrapper/RCIMIWSearchConversationResult.h>

#import <RongIMWrapper/RCIMIWGroupReadReceiptInfo.h>
#import <RongIMWrapper/RCIMIWBlockedMessageInfo.h>
#import <RongIMWrapper/RCIMIWMentionedInfo.h>
#import <RongIMWrapper/RCIMIWUserInfo.h>
#import <RongIMWrapper/RCIMIWUserProfile.h>
#import <RongIMWrapper/RCIMIWTypingStatus.h>
#import <RongIMWrapper/RCIMIWTagInfo.h>
#import <RongIMWrapper/RCIMIWConversationTagInfo.h>
#import <RongIMWrapper/RCIMIWUltraGroupTypingStatusInfo.h>

#import <RongIMWrapper/RCIMIWPlatformConverter.h>

#import <RongIMWrapper/RCIMIWReadReceiptInfo.h>
#import <RongIMWrapper/RCIMIWReceivedStatusInfo.h>
#import <RongIMWrapper/RCIMIWReadReceiptInfoV4.h>
#import <RongIMWrapper/RCIMIWGroupMessageReaderV2.h>
#import <RongIMWrapper/RCIMIWMessageAuditInfo.h>

#import <RongIMWrapper/RCIMIWDefines.h>

#import <RongIMWrapper/RCIMIWTranslateMode.h>
#import <RongIMWrapper/RCIMIWTranslateStatus.h>
#import <RongIMWrapper/RCIMIWTranslateStrategy.h>
#import <RongIMWrapper/RCIMIWTranslateInfo.h>
#import <RongIMWrapper/RCIMIWTranslateItem.h>
#import <RongIMWrapper/RCIMIWTranslateMessageParam.h>
#import <RongIMWrapper/RCIMIWTranslateMessagesParams.h>
#import <RongIMWrapper/RCIMIWTranslateTextParam.h>
#import <RongIMWrapper/RCIMIWTranslateTextParams.h>
#import <RongIMWrapper/RCIMIWTranslateConverter.h>

#import <RongIMWrapper/RCIMIWSubscribeEvent.h>
#import <RongIMWrapper/RCIMIWSubscribeInfoEvent.h>
#import <RongIMWrapper/RCIMIWSubscribeEventDetail.h>
#import <RongIMWrapper/RCIMIWSubscribeEventConverter.h>
#import <RongIMWrapper/RCIMIWSubscribeEventRequest.h>
#import <RongIMWrapper/RCIMIWPlatform.h>

#import <RongIMWrapper/RCIMIWGroupInfo.h>
#import <RongIMWrapper/RCIMIWQuitGroupConfig.h>
#import <RongIMWrapper/RCIMIWPagingQueryOption.h>
#import <RongIMWrapper/RCIMIWPagingQueryResult.h>
#import <RongIMWrapper/RCIMIWGroupMemberInfo.h>
#import <RongIMWrapper/RCIMIWGroupApplicationInfo.h>
#import <RongIMWrapper/RCIMIWFollowInfo.h>
#import <RongIMWrapper/RCIMIWChatRoomSyncEvent.h>
#import <RongIMWrapper/RCIMIWChatRoomMemberBlockEvent.h>
#import <RongIMWrapper/RCIMIWChatRoomMemberBanEvent.h>
#import <RongIMWrapper/RCIMIWSpeechToTextStatus.h>
#import <RongIMWrapper/RCIMIWSpeechToTextInfo.h>
