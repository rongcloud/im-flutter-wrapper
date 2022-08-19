//
// Created by RongCloud on 2/16/22.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

@class RCIMIWMessage;

@interface RCIMIWConversation : NSObject

/*!
 会话类型
 */
@property (nonatomic, assign, readonly) RCIMIWConversationType conversationType;

/*!
 会话 ID
 */
@property (nonatomic, copy, readonly) NSString *targetId;

/*!
 该会话的业务标识，长度限制 20 字符
 */
@property (nonatomic, copy, readonly) NSString *channelId;

/*!
 会话中的未读消息数量
 */
@property (nonatomic, assign, readonly) NSInteger unreadCount;

/*!
会话中 @ 消息的个数

@discussion 在清除会话未读数（clearMessagesUnreadStatus:targetId:）的时候，会将此值置成 0。
*/
@property (nonatomic, assign, readonly) NSInteger mentionedCount;

/*!
 是否置顶，默认值为 NO

 @discussion
 如果设置了置顶，在 IMKit 的 RCConversationListViewController 中会将此会话置顶显示。
 */
@property (nonatomic, assign, readonly) BOOL top;

/*!
 会话中存在的草稿
 */
@property (nonatomic, copy, readonly) NSString *draft;

/*!
 会话中最后一条消息的内容
 */
@property (nonatomic, strong, readonly) RCIMIWMessage *lastMessage;

/*!
 免打扰级别
 */
@property (nonatomic, assign, readonly) RCIMIWPushNotificationLevel notificationLevel;


@end
