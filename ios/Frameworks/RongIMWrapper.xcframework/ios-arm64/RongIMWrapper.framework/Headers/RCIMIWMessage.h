//
//  RCIMIWMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/15/22.
//

#import <Foundation/Foundation.h>

#import <RongIMLibCore/RCMessageContent.h>

#import <RongIMWrapper/RCIMIWMessagePushOptions.h>
#import <RongIMWrapper/RCIMIWConversation.h>
#import <RongIMWrapper/RCIMIWMentionedInfo.h>
#import <RongIMWrapper/RCIMIWReceivedStatusInfo.h>
#import <RongIMWrapper/RCIMIWDefines.h>
#import <RongIMWrapper/RCIMIWReadReceiptInfo.h>
#import <RongIMWrapper/RCIMIWReadReceiptInfoV4.h>
#import <RongIMWrapper/RCIMIWMessageAuditInfo.h>

@class RCIMIWUserInfo;
@class RCIMIWGroupReadReceiptInfo;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWMessage : NSObject

/*!
 * 会话类型
 */
@property (nonatomic, assign, readonly) RCIMIWConversationType conversationType;

/*!
 * 消息类型
 */
@property (nonatomic, assign, readonly) RCIMIWMessageType messageType;

/*!
 * 会话 ID
 */
@property (nonatomic, copy, readonly) NSString *targetId;

/*!
 * 所属会话的业务标识，长度限制 20 字符
 */
@property (nonatomic, copy, readonly) NSString *channelId;

/*!
 * 消息的 ID
 
 @discussion 本地存储的消息的唯一值（数据库索引唯一值）
 */
@property (nonatomic, assign, readonly) long messageId;

@property (nonatomic, copy, readonly) NSString *messageUId;

/*!
 * 是否是离线消息，只在接收消息的回调方法中有效，如果消息为离线消息，则为 YES ，其他情况均为 NO
 */
@property(nonatomic, assign, readonly) BOOL offLine;


@property(nonatomic, strong, readonly) RCIMIWGroupReadReceiptInfo *groupReadReceiptInfo;

/*!
 * 消息的接收时间（Unix 时间戳、毫秒）
 */
@property (nonatomic, assign) long long receivedTime;

/*!
 * 消息的发送时间（Unix 时间戳、毫秒）
 */
@property (nonatomic, assign) long long sentTime;

/// 设置焚烧时间
///
/// 默认是 0，0 代表该消息非阅后即焚消息。
@property (nonatomic, assign) NSUInteger destructDuration;

/*!
 * 消息的接收状态
 */
@property (nonatomic, assign) RCIMIWReceivedStatus receivedStatus;


/// 消息的接收状态
@property (nonatomic, strong) RCIMIWReceivedStatusInfo *receivedStatusInfo;

/// 阅读回执状态
@property (nonatomic, strong) RCIMIWReadReceiptInfo *readReceiptInfo;

/// 群阅读回执状态
///
/// 如果开启了已读回执V4 功能，此参数才有效，否则请使用 readReceiptInfo 属性获取阅读回执状态
/// 如果使用 IMKit，请用 readReceiptInfo 属性
@property (nonatomic, strong)  RCIMIWReadReceiptInfoV4 *readReceiptInfoV4;

/*!
 * 消息的发送状态
 */
@property (nonatomic, assign) RCIMIWSentStatus sentStatus;

/*!
 * 消息的发送者 ID
 */
@property (nonatomic, copy) NSString *senderUserId;

/*!
 * 消息的方向
 */
@property (nonatomic, assign) RCIMIWMessageDirection direction;

@property (nonatomic, strong) RCIMIWUserInfo *userInfo;

// RCMessageContent *content是新增的，暂未封装单独的 RCIMIWMessageContent类
@property (nonatomic, strong) RCMessageContent *msgContent;

@property (nonatomic, strong) RCIMIWMentionedInfo *mentionedInfo;

@property (nonatomic, strong) RCIMIWMessagePushOptions *pushOptions;

/*!
 * 消息的附加字段
 */
@property (nonatomic, copy) NSString *extra;

/// 只在本地有效，通过 setMessageLocalExtra 设置才能将此值保存到消息上
@property (nonatomic, copy) NSString *localExtra;

/*!
 * 消息扩展信息列表
 @discussion 扩展信息只支持单聊和群组，其它会话类型不能设置扩展信息。
 * 如果消息发送后需要更新扩展信息，必须在消息发送前设置此值不为空。
 @discussion 默认消息扩展字典 key 长度不超过 32 ，value 长度不超过 64 ，单次设置扩展数量最大为 20，消息的扩展总数不能超过 300
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *expansion;

/// 消息是否可以包含扩展信息
///
/// 该属性在消息发送时确定，发送之后不能再做修改
/// 扩展信息只支持单聊、群聊、超级群，其它会话类型不能设置扩展信息
@property (nonatomic, assign) BOOL canIncludeExpansion;

/// 送审配置
@property (nonatomic, strong) RCIMIWMessageAuditInfo *auditInfo;

/// 接收定向消息的用户数组
@property (nonatomic, copy, nullable) NSArray<NSString *> *directedUserIds;

//- (instancetype)init __attribute__((unavailable("请使用 RCIMIWEngine 中 createXXMessage 系列方法创建对应的 message ")));

@end

NS_ASSUME_NONNULL_END
