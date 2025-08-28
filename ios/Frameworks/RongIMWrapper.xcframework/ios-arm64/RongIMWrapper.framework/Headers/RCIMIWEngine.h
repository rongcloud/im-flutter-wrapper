//
//  RCIMIWEngine.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/15/22.
//

#import <Foundation/Foundation.h>

#import <RongIMWrapper/RCIMIWMessage.h>
#import <RongIMWrapper/RCIMIWMediaMessage.h>
#import <RongIMWrapper/RCIMIWTextMessage.h>
#import <RongIMWrapper/RCIMIWImageMessage.h>
#import <RongIMWrapper/RCIMIWVoiceMessage.h>
#import <RongIMWrapper/RCIMIWFileMessage.h>
#import <RongIMWrapper/RCIMIWSightMessage.h>
#import <RongIMWrapper/RCIMIWGIFMessage.h>
#import <RongIMWrapper/RCIMIWReferenceMessage.h>
#import <RongIMWrapper/RCIMIWCustomMessage.h>
#import <RongIMWrapper/RCIMIWLocationMessage.h>
#import <RongIMWrapper/RCIMIWNativeCustomMessage.h>
#import <RongIMWrapper/RCIMIWNativeCustomMediaMessage.h>
#import <RongIMWrapper/RCIMIWGroupNotificationMessage.h>
#import <RongIMWrapper/RCIMIWEngineDelegate.h>
#import <RongIMWrapper/RCIMIWDefines.h>
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
#import <RongIMWrapper/RCIMIWTranslateMessagesParams.h>
#import <RongIMWrapper/RCIMIWTranslateTextParams.h>
#import <RongIMWrapper/RCIMIWUserProfile.h>
#import <RongIMWrapper/RCIMIWSubscribeEvent.h>
#import <RongIMWrapper/RCIMIWSubscribeEventRequest.h>


@class RCIMIWEngineOptions;
@class RCIMIWCompressOptions;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWEngine : NSObject

- (void)setEngineDelegate:(nullable id <RCIMIWEngineDelegate>)delegate;

#pragma mark - 初始化

+ (instancetype)create:(NSString *)appKey;

+ (instancetype)create:(NSString *)appKey options:(RCIMIWEngineOptions *)options;

- (void)destroy;

#pragma mark - 日志等级

- (NSInteger)changeLogLevel:(RCIMIWLogLevel)level;

#pragma mark - 连接

- (NSInteger)connect:(NSString *)token
__deprecated_msg("Use [RCIMIWEngine connect:databaseOpened:connected:] instead");

- (NSInteger)connect:(NSString *)token
      databaseOpened:(nullable void (^)(NSInteger code))databaseOpenedBlock
           connected:(nullable void (^)(NSInteger code, NSString *userId))connectedBlock;

- (NSInteger)connect:(NSString *)token
             timeout:(int)timeout
__deprecated_msg("Use [RCIMIWEngine connect:timeout:databaseOpened:connected:] instead");

- (NSInteger)connect:(NSString *)token
             timeout:(int)timeout
      databaseOpened:(nullable void (^)(NSInteger code))databaseOpenedBlock
           connected:(nullable void (^)(NSInteger code, NSString *userId))connectedBlock;

- (NSInteger)disconnect;

- (NSInteger)disconnect:(BOOL)receivePush;

- (RCIMIWConnectionStatus)getConnectionStatus;

#pragma mark - 消息创建/注册

- (NSInteger)registerCustomMessage:(NSArray<Class> *)messageContentClassList;

/// 注册原生自定义普通消息
///
/// - Parameter messageIdentifier: 消息唯一标识
/// - Parameter persistentFlag: 消息存储策略
/// - Returns: 接口调用状态
- (NSInteger)registerNativeCustomMessage:(NSString *)messageIdentifier persistentFlag:(RCIMIWNativeCustomMessagePersistentFlag)persistent;

/// 注册原生自定义媒体消息
///
/// - Parameter messageIdentifier: 消息唯一标识
/// - Parameter persistentFlag: 消息存储策略
/// - Returns: 接口调用状态
- (NSInteger)registerNativeCustomMediaMessage:(NSString *)messageIdentifier persistentFlag:(RCIMIWNativeCustomMessagePersistentFlag)persistent;

- (RCIMIWTextMessage *)createTextMessage:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                               channelId:(nullable NSString *)channelId
                                    text:(NSString *)text;

- (RCIMIWImageMessage *)createImageMessage:(RCIMIWConversationType)type
                                  targetId:(NSString *)targetId
                                 channelId:(nullable NSString *)channelId
                                      path:(NSString *)path;

- (RCIMIWFileMessage *)createFileMessage:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                               channelId:(nullable NSString *)channelId
                                    path:(NSString *)path;

- (RCIMIWSightMessage *)createSightMessage:(RCIMIWConversationType)type
                                  targetId:(NSString *)targetId
                                 channelId:(nullable NSString *)channelId
                                      path:(NSString *)path
                                  duration:(int)duration;

- (RCIMIWVoiceMessage *)createVoiceMessage:(RCIMIWConversationType)type
                                  targetId:(NSString *)targetId
                                 channelId:(nullable NSString *)channelId
                                      path:(NSString *)path
                                  duration:(int)duration;

- (RCIMIWCustomMessage *)createCustomMessage:(RCIMIWConversationType)type
                                    targetId:(NSString *)targetId
                                   channelId:(nullable NSString *)channelId
                                      policy:(RCIMIWCustomMessagePolicy)policy
                           messageIdentifier:(NSString *)messageIdentifier
                                      fields:(NSDictionary<NSString *, NSString *> *)fields;

- (RCIMIWGIFMessage *)createGIFMessage:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(nullable NSString *)channelId
                                  path:(NSString *)path;

- (RCIMIWReferenceMessage *)createReferenceMessage:(RCIMIWConversationType)type
                                          targetId:(NSString *)targetId
                                         channelId:(nullable NSString *)channelId
                                  referenceMessage:(RCIMIWMessage *)referMessage
                                              text:(NSString *)referenceString;

- (RCIMIWLocationMessage *)createLocationMessage:(RCIMIWConversationType)type
                                        targetId:(NSString *)targetId
                                       channelId:(nullable NSString *)channelId
                                       longitude:(double)longitude
                                        latitude:(double)latitude
                                         poiName:(NSString *)poiName
                                   thumbnailPath:(NSString *)thumbnailPath;

/// 创建原生自定义普通消息
/// 
/// - Parameter type: 会话类型
/// - Parameter targetId: 会话 ID
/// - Parameter channelId: 所属会话的业务标识
/// - Parameter messageIdentifier: 消息唯一标识
/// - Parameter fields: 消息内容
- (RCIMIWNativeCustomMessage *)createNativeCustomMessage:(RCIMIWConversationType)type
                                                targetId:(NSString *)targetId
                                               channelId:(nullable NSString *)channelId
                                       messageIdentifier:(NSString *)messageIdentifier
                                                  fields:(NSDictionary<NSString *, id> *)fields;

/// 创建原生自定义媒体消息
///
/// - Parameter type: 会话类型
/// - Parameter targetId: 会话 ID
/// - Parameter channelId: 所属会话的业务标识
/// - Parameter messageIdentifier: 消息唯一标识
/// - Parameter path: 媒体文件路径
/// - Parameter fields: 消息内容
- (RCIMIWNativeCustomMediaMessage *)createNativeCustomMediaMessage:(RCIMIWConversationType)type
                                                          targetId:(NSString *)targetId
                                                         channelId:(nullable NSString *)channelId
                                                 messageIdentifier:(NSString *)messageIdentifier
                                                              path:(NSString *)path
                                                            fields:(NSDictionary<NSString *, id> *)fields;

#pragma mark - 发送消息

- (NSInteger)sendMessage:(RCIMIWMessage *)message
__deprecated_msg("Use [RCIMIWEngine sendMessage:messageSaved:messageSent:] instead");

- (NSInteger)sendMessage:(RCIMIWMessage *)message
            messageSaved:(nullable void (^)(RCIMIWMessage *message))messageSavedBlock
             messageSent:(nullable void (^)(NSInteger code, RCIMIWMessage *message))messageSentBlock;

- (NSInteger)sendMediaMessage:(RCIMIWMediaMessage *)message
__deprecated_msg("Use [RCIMIWEngine sendMediaMessage:messageSaved:messageSending:sendingMediaMessageCanceled:messageSent:] instead");

- (NSInteger)sendMediaMessage:(RCIMIWMediaMessage *)message
                 messageSaved:(nullable void (^)(RCIMIWMediaMessage *message))messageSavedBlock
               messageSending:(nullable void (^)(RCIMIWMediaMessage *message, NSInteger progress))messageSendingBlock
  sendingMediaMessageCanceled:(nullable void (^)(RCIMIWMediaMessage *message))sendingMediaMessageCanceledBlock
                  messageSent:(nullable void (^)(NSInteger code, RCIMIWMediaMessage *message))messageSentBlock;

- (NSInteger)cancelSendingMediaMessage:(RCIMIWMediaMessage *)message
__deprecated_msg("Use [RCIMIWEngine cancelSendingMediaMessage:cancelSendingMediaMessageCalled:] instead");

- (NSInteger)cancelSendingMediaMessage:(RCIMIWMediaMessage *)message
       cancelSendingMediaMessageCalled:(nullable void (^)(NSInteger code, RCIMIWMediaMessage *message))cancelSendingMediaMessageCalledBlock;

- (NSInteger)sendTypingStatus:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                  currentType:(NSString *)currentType;

- (NSInteger)sendTypingStatus:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
                  currentType:(NSString *)currentType;

/*!
 发送定向消息
 
 @param userIds       接收消息的用户 ID 列表
 
 @return 发送的消息实体
 
 @discussion 此方法用于在群组和讨论组中发送消息给其中的部分用户，其它用户不会收到这条消息。
 @discussion userIds 的用户个数不能超过 300，超过会被截断。
 
 @warning 此方法目前仅支持普通群组。
 
 @remarks 消息操作
 */
- (NSInteger)sendGroupMessageToDesignatedUsers:(RCIMIWMessage *)message userIds:(NSArray<NSString *> *)userIds
__deprecated_msg("Use [RCIMIWEngine sendGroupMessageToDesignatedUsers:messageSaved:messageSent:] instead");

- (NSInteger)sendGroupMessageToDesignatedUsers:(RCIMIWMessage *)message userIds:(NSArray<NSString *> *)userIds
                                  messageSaved:(nullable void (^)(RCIMIWMessage *message))messageSavedBlock
                                   messageSent:(nullable void (^)(NSInteger code, RCIMIWMessage *message))messageSentBlock;

#pragma mark - 下载媒体消息

- (NSInteger)downloadMediaMessage:(RCIMIWMediaMessage *)message
__deprecated_msg("Use [RCIMIWEngine downloadMediaMessage:mediaMessageDownloading:downloadingMediaMessageCanceled:mediaMessageDownloaded:] instead");

- (NSInteger)downloadMediaMessage:(RCIMIWMediaMessage *)message
          mediaMessageDownloading:(nullable void (^)(RCIMIWMediaMessage *message, NSInteger progress))mediaMessageDownloadingBlock
  downloadingMediaMessageCanceled:(nullable void (^)(RCIMIWMediaMessage *message))downloadingMediaMessageCanceledBlock
           mediaMessageDownloaded:(nullable void (^)(NSInteger code, RCIMIWMediaMessage *message))mediaMessageDownloadedBlock;

- (NSInteger)cancelDownloadingMediaMessage:(RCIMIWMediaMessage *)message
__deprecated_msg("Use [RCIMIWEngine cancelDownloadingMediaMessage:cancelDownloadingMediaMessageCalled:] instead");

- (NSInteger)cancelDownloadingMediaMessage:(RCIMIWMediaMessage *)message
       cancelDownloadingMediaMessageCalled:(nullable void (^)(NSInteger code, RCIMIWMediaMessage *message))cancelDownloadingMediaMessageCalledBlock;

#pragma mark - 获取历史消息

//
/*!
 获取远端+本地的消息
 
 @param sentTime    起始的消息发送时间戳，毫秒
 @param order           sentTime 时间的前后顺序
 RCIMIWOrderBefore： 结合传入的时间戳参数，获取 sentTime 之前的消息 （时间递减）
 RCIMIWOrderLater： 结合传入的时间戳参数，获取 sentTime 之后的消息 （时间递增）
 @param count           需要获取的消息数量， 0 < count <= 20，超过 20 条 只会加载 20条
 */
- (NSInteger)loadMessages:(RCIMIWConversationType)type
                 targetId:(NSString *)targetId
                 sentTime:(long long)sentTime
                    order:(RCIMIWTimeOrder)order
                    count:(int)count
__deprecated_msg("Use [RCIMIWEngine getMessages:targetId:sentTime:order:count:success:error:] instead");

- (NSInteger)getMessages:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
                sentTime:(long long)sentTime
                   order:(RCIMIWTimeOrder)order
                   count:(int)count
                 success:(nullable void (^)(NSArray<RCIMIWMessage *> *))successBlock
                   error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadMessages:(RCIMIWConversationType)type
                 targetId:(NSString *)targetId
                channelId:(nullable NSString *)channelId
                 sentTime:(long long)sentTime
                    order:(RCIMIWTimeOrder)order
                    count:(int)count
__deprecated_msg("Use [RCIMIWEngine getMessages:targetId:channelId:sentTime:order:count:success:error:] instead");

- (NSInteger)getMessages:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
               channelId:(nullable NSString *)channelId
                sentTime:(long long)sentTime
                   order:(RCIMIWTimeOrder)order
                   count:(int)count
                 success:(nullable void (^)(NSArray<RCIMIWMessage *> *))successBlock
                   error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 获取指定 policy 类型的消息
 
 @param sentTime    起始的消息发送时间戳，毫秒
 
 @param order           sentTime 时间的前后顺序
 RCIMIWOrderBefore： 结合传入的时间戳参数，获取 sentTime 之前的消息 （时间递减）
 RCIMIWOrderLater： 结合传入的时间戳参数，获取 sentTime 之后的消息 （时间递增）
 
 @param count           需要获取的消息数量
 0 < count <= 20，超过 20 条 只会加载 20条
 policy 为 RCIMIWLoadMessagePolicyLocal 时， count 数量不受限制
 
 @param policy         加载策略（本地、远端、本地+远端）
 */
- (NSInteger)loadMessages:(RCIMIWConversationType)type
                 targetId:(NSString *)targetId
                 sentTime:(long long)sentTime
                    order:(RCIMIWTimeOrder)order
                   policy:(RCIMIWMessageOperationPolicy)policy
                    count:(int)count
__deprecated_msg("Use [RCIMIWEngine getMessages:targetId:sentTime:order:policy:count:success:error:] instead");

- (NSInteger)getMessages:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
                sentTime:(long long)sentTime
                   order:(RCIMIWTimeOrder)order
                  policy:(RCIMIWMessageOperationPolicy)policy
                   count:(int)count
                 success:(nullable void (^)(NSArray<RCIMIWMessage *> *))successBlock
                   error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadMessages:(RCIMIWConversationType)type
                 targetId:(NSString *)targetId
                channelId:(nullable NSString *)channelId
                 sentTime:(long long)sentTime
                    order:(RCIMIWTimeOrder)order
                   policy:(RCIMIWMessageOperationPolicy)policy
                    count:(int)count
__deprecated_msg("Use [RCIMIWEngine getMessages:targetId:channelId:sentTime:order:policy:count:success:error:] instead");

- (NSInteger)getMessages:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
               channelId:(nullable NSString *)channelId
                sentTime:(long long)sentTime
                   order:(RCIMIWTimeOrder)order
                  policy:(RCIMIWMessageOperationPolicy)policy
                   count:(int)count
                 success:(nullable void (^)(NSArray<RCIMIWMessage *> *))successBlock
                   error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadUnreadMentionedMessages:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getUnreadMentionedMessages:targetId:success:error:] instead");

- (NSInteger)getUnreadMentionedMessages:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                                success:(nullable void (^)(NSArray<RCIMIWMessage *> *))successBlock
                                  error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadUnreadMentionedMessages:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                               channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getUnreadMentionedMessages:targetId:channelId:success:error:] instead");

- (NSInteger)getUnreadMentionedMessages:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                              channelId:(nullable NSString *)channelId
                                success:(nullable void (^)(NSArray<RCIMIWMessage *> *))successBlock
                                  error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadFirstUnreadMessage:(RCIMIWConversationType)type
                           targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getFirstUnreadMessage:targetId:success:error:] instead");

- (NSInteger)getFirstUnreadMessage:(RCIMIWConversationType)type
                          targetId:(NSString *)targetId
                           success:(nullable void (^)(RCIMIWMessage *))successBlock
                             error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadFirstUnreadMessage:(RCIMIWConversationType)type
                           targetId:(NSString *)targetId
                          channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getFirstUnreadMessage:targetId:channelId:success:error:] instead");

- (NSInteger)getFirstUnreadMessage:(RCIMIWConversationType)type
                          targetId:(NSString *)targetId
                         channelId:(nullable NSString *)channelId
                           success:(nullable void (^)(RCIMIWMessage *))successBlock
                             error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)getMessageById:(long)messageId
                    success:(nullable void (^)(RCIMIWMessage *message))successBlock
                      error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)getMessageByUId:(NSString *)messageUId
                     success:(nullable void (^)(RCIMIWMessage *message))successBlock
                       error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)getMessagesAroundTime:(RCIMIWConversationType)type
                          targetId:(NSString *)targetId
                         channelId:(nullable NSString *)channelId
                          sentTime:(long long)sentTime
                       beforeCount:(int)beforeCount
                        afterCount:(int)afterCount
                           success:(nullable void (^)(NSArray<RCIMIWMessage *> *))successBlock
                             error:(nullable void (^)(NSInteger code))errorBlock;

/// 异步获取会话中，指定时间、指定数量、指定消息类型（多个）、向前或向后查找的消息实体列表（按照时间从新到旧排列）
///
/// - Parameter type: 会话类型
/// - Parameter targetId: 会话 ID
/// - Parameter channelId: 所属会话的业务标识
/// - Parameter messageTypes: 消息类型列表
/// - Parameter sentTime: 当前的消息时间戳，单位：毫秒
/// - Parameter order: 查询方向
/// - Parameter count: 需要获取的消息数量
///
/// 返回的消息中不包含 sentTime 对应的那条消息。
///
/// 该方法仅获取本地数据库中的消息
/// 超级群不会接收离线消息，超级群调用该接口会出现消息断档的情况，请使用断档消息接口获取超级群消息。
- (NSInteger)getLocalMessagesByMessageTypes:(RCIMIWConversationType)type
                                   targetId:(NSString *)targetId
                                  channelId:(nullable NSString *)channelId
                               messageTypes:(NSArray<NSNumber *> *)messageTypes
                                   sentTime:(long long)sentTime
                                      order:(RCIMIWTimeOrder)order
                                      count:(int)count
                                    success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                                      error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 插入消息

/*!
 插入一条消息，
 可设置消息的方向（messageDirection）为 发送（RCIMIWMessageDirectionSend）或 接收（RCIMIWMessageDirectionReceive），
 同时 必须 设置消息方向对应的 发送状态（sentStatus）或 接收状态（receivedStatus）
 
 @param message 默认创建出来 message 的 messageDirection 是 RCIMIWMessageDirectionSend
 @return 接口调用状态
 */
- (NSInteger)insertMessage:(RCIMIWMessage *)message
__deprecated_msg("Use [RCIMIWEngine insertMessage:messageInserted:] instead");

- (NSInteger)insertMessage:(RCIMIWMessage *)message
           messageInserted:(nullable void (^)(NSInteger code, RCIMIWMessage *message))messageInsertedBlock;

- (NSInteger)insertMessages:(NSArray<RCIMIWMessage *> *)messages
__deprecated_msg("Use [RCIMIWEngine insertMessages:messagesInserted:] instead");

- (NSInteger)insertMessages:(NSArray<RCIMIWMessage *> *)messages
           messagesInserted:(nullable void (^)(NSInteger code, NSArray<RCIMIWMessage *> *messages))messagesInsertedBlock;

#pragma mark - 删除消息

- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine clearMessages:targetId:timestamp:messagesCleared:] instead");

- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 timestamp:(long long)timestamp
           messagesCleared:(nullable void (^)(NSInteger code))messagesClearedBlock;

/*!
 清除历史消息
 
 @param type    会话类型
 @param targetId            会话 ID
 @param channelId          所属会话的业务标识
 @param timestamp          清除消息时间戳，【0 <= timestamp <= 当前会话最后一条消息的 sentTime.
 0 清除所有消息，其他值清除小于等于 recordTime 的消息】
 
 @discussion
 此方法可以清除服务器端历史消息和本地消息，如果清除服务器端消息必须先开通历史消息云存储功能。
 
 @remarks 消息操作
 */
- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 channelId:(nullable NSString *)channelId
                 timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine clearMessages:targetId:channelId:timestamp:messagesCleared:] instead");

- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 channelId:(nullable NSString *)channelId
                 timestamp:(long long)timestamp
           messagesCleared:(nullable void (^)(NSInteger code))messagesClearedBlock;

- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 timestamp:(long long)timestamp
                    policy:(RCIMIWMessageOperationPolicy)policy
__deprecated_msg("Use [RCIMIWEngine clearMessages:targetId:timestamp:policy:messagesCleared:] instead");

- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 timestamp:(long long)timestamp
                    policy:(RCIMIWMessageOperationPolicy)policy
           messagesCleared:(nullable void (^)(NSInteger code))messagesClearedBlock;

/*!
 清除历史消息
 
 @param type    会话类型
 @param targetId            会话 ID
 @param channelId          所属会话的业务标识
 @param timestamp          清除消息时间戳，【0 <= timestamp <= 当前会话最后一条消息的 sentTime,0
 清除所有消息，其他值清除小于等于 recordTime 的消息】
 @param policy         删除策略（
 RCIMIWLoadMessagePolicyLocal: 删除本地；
 RCIMIWLoadMessagePolicyRemote:  删除远端；
 RCIMIWLoadMessagePolicyLocalRemote: 同时删除本地和远端）
 
 @discussion
 此方法可以清除服务器端历史消息和本地消息，如果清除服务器端消息必须先开通历史消息云存储功能。
 例如，您不想从服务器上获取更多的历史消息，通过指定 recordTime 并设置 policy 为 RCIMIWLoadMessagePolicyLocalRemote
 清除消息，成功后只能获取该时间戳之后的历史消息。如果 policy 传 RCIMIWLoadMessagePolicyLocal，只会清除本地消息。
 
 @remarks 消息操作
 */
- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 channelId:(nullable NSString *)channelId
                 timestamp:(long long)timestamp
                    policy:(RCIMIWMessageOperationPolicy)policy
__deprecated_msg("Use [RCIMIWEngine clearMessages:targetId:channelId:timestamp:policy:messagesCleared:] instead");

- (NSInteger)clearMessages:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 channelId:(nullable NSString *)channelId
                 timestamp:(long long)timestamp
                    policy:(RCIMIWMessageOperationPolicy)policy
           messagesCleared:(nullable void (^)(NSInteger code))messagesClearedBlock;

- (NSInteger)deleteLocalMessages:(NSArray<RCIMIWMessage *> *)messages
__deprecated_msg("Use [RCIMIWEngine deleteLocalMessages:localMessagesDeleted:] instead");

- (NSInteger)deleteLocalMessages:(NSArray<RCIMIWMessage *> *)messages
            localMessagesDeleted:(nullable void (^)(NSInteger code, NSArray<RCIMIWMessage *> *messages))localMessagesDeletedBlock;

- (NSInteger)deleteLocalMessageByIds:(NSArray<NSNumber *> *)messageIds
                         onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

- (NSInteger)deleteMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                   messages:(NSArray<RCIMIWMessage *> *)messages
__deprecated_msg("Use [RCIMIWEngine deleteMessages:targetId:messages:messagesDeleted:] instead");

- (NSInteger)deleteMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                   messages:(NSArray<RCIMIWMessage *> *)messages
            messagesDeleted:(nullable void (^)(NSInteger code, NSArray<RCIMIWMessage *> *messages))messagesDeletedBlock;

/*!
 批量删除某个会话中的指定消息（同时删除本地和远端消息）
 
 @param type                     会话类型，不支持聊天室
 @param targetId            目标会话ID
 @param channelId          所属会话的业务标识
 @param messages            将被删除的消息列表
 
 @discussion 此方法会同时删除本地和远端消息。
 一次批量操作仅支持删除属于同一个会话的消息，请确保消息列表中的所有消息来自同一会话
 一次最多删除 100 条消息。
 */
- (NSInteger)deleteMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(nullable NSString *)channelId
                   messages:(NSArray<RCIMIWMessage *> *)messages
__deprecated_msg("Use [RCIMIWEngine deleteMessages:targetId:channelId:messages:messagesDeleted:] instead");

- (NSInteger)deleteMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(nullable NSString *)channelId
                   messages:(NSArray<RCIMIWMessage *> *)messages
            messagesDeleted:(nullable void (^)(NSInteger code, NSArray<RCIMIWMessage *> *messages))messagesDeletedBlock;

#pragma mark - 撤回消息

- (NSInteger)recallMessage:(RCIMIWMessage *)message
__deprecated_msg("Use [RCIMIWEngine recallMessage:messageRecalled:] instead");

- (NSInteger)recallMessage:(RCIMIWMessage *)message
           messageRecalled:(nullable void (^)(NSInteger code, RCIMIWMessage *message))messageRecalledBlock;

- (NSInteger)sendPrivateReadReceiptMessage:(NSString *)targetId
                                 timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine sendPrivateReadReceiptMessage:timestamp:privateReadReceiptMessageSent:] instead");

- (NSInteger)sendPrivateReadReceiptMessage:(NSString *)targetId
                                 timestamp:(long long)timestamp
             privateReadReceiptMessageSent:(nullable void (^)(NSInteger code))privateReadReceiptMessageSentBlock;

/*!
 发送某个单聊会话中消息阅读的回执
 
 @discussion 此接口只支持单聊。收到远端消息已读回执之后，会回调 delegate 中的 onRemoteConversationReadStatusSynced 方法。
 */
- (NSInteger)sendPrivateReadReceiptMessage:(NSString *)targetId
                                 channelId:(nullable NSString *)channelId
                                 timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine sendPrivateReadReceiptMessage:channelId:timestamp:privateReadReceiptMessageSent:] instead");

- (NSInteger)sendPrivateReadReceiptMessage:(NSString *)targetId
                                 channelId:(nullable NSString *)channelId
                                 timestamp:(long long)timestamp
             privateReadReceiptMessageSent:(nullable void (^)(NSInteger code))privateReadReceiptMessageSentBlock;

#pragma mark - 消息扩展

- (NSInteger)updateMessageExpansion:(NSString *)messageUId
                          expansion:(NSDictionary<NSString *, NSString *> *)expansion
__deprecated_msg("Use [RCIMIWEngine updateMessageExpansion:expansion:messageExpansionUpdated:] instead");

- (NSInteger)updateMessageExpansion:(NSString *)messageUId
                          expansion:(NSDictionary<NSString *, NSString *> *)expansion
            messageExpansionUpdated:(nullable void (^)(NSInteger code))messageExpansionUpdatedBlock;

- (NSInteger)removeMessageExpansionForKeys:(NSString *)messageUId
                                      keys:(NSArray<NSString *> *)keys
__deprecated_msg("Use [RCIMIWEngine removeMessageExpansionForKeys:keys:messageExpansionForKeysRemoved:] instead");

- (NSInteger)removeMessageExpansionForKeys:(NSString *)messageUId
                                      keys:(NSArray<NSString *> *)keys
            messageExpansionForKeysRemoved:(nullable void (^)(NSInteger code))messageExpansionForKeysRemovedBlock;

#pragma mark - 修改消息接收、发送状态

- (NSInteger)changeMessageReceiveStatus:(long)messageId
                         receivedStatus:(RCIMIWReceivedStatus)receivedStatus
__deprecated_msg("Use [RCIMIWEngine changeMessageReceiveStatus:receivedStatus:messageReceiveStatusChanged:] instead");

- (NSInteger)changeMessageReceiveStatus:(long)messageId
                         receivedStatus:(RCIMIWReceivedStatus)receivedStatus
            messageReceiveStatusChanged:(nullable void (^)(NSInteger code))messageReceiveStatusChangedBlock;

- (NSInteger)changeMessageReceiveStatusInfo:(long)messageId
                         receivedStatusInfo:(RCIMIWReceivedStatusInfo *)receivedStatusInfo
            messageReceiveStatusInfoChanged:(nullable void (^)(NSInteger code))messageReceiveStatusInfoChangedBlock;

- (NSInteger)changeMessageSentStatus:(long)messageId
                          sentStatus:(RCIMIWSentStatus)sentStatus
__deprecated_msg("Use [RCIMIWEngine changeMessageSentStatus:sentStatus:messageSentStatusChanged:] instead");

- (NSInteger)changeMessageSentStatus:(long)messageId
                          sentStatus:(RCIMIWSentStatus)sentStatus
            messageSentStatusChanged:(nullable void (^)(NSInteger code))messageSentStatusChangedBlock;

#pragma mark - 修改消息本地 extra

- (NSInteger)updateMessageLocalExtra:(long)messageId extra:(NSString *)extra messageLocalExtraUpdated:(nullable void (^)(NSInteger code))messageLocalExtraUpdatedBlock;

#pragma mark - 会话

- (NSInteger)loadConversation:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getConversation:targetId:success:error:] instead");

- (NSInteger)getConversation:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                     success:(nullable void (^)(RCIMIWConversation *))successBlock
                       error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 获取单个会话数据
 
 */
- (NSInteger)loadConversation:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getConversation:targetId:channelId:success:error:] instead");

- (NSInteger)getConversation:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(nullable NSString *)channelId
                     success:(nullable void (^)(RCIMIWConversation *))successBlock
                       error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadConversations:(NSArray<NSNumber *> *)conversationTypes
                     startTime:(long long)startTime
                         count:(int)count
__deprecated_msg("Use [RCIMIWEngine getConversations:startTime:count:success:error:] instead");

- (NSInteger)getConversations:(NSArray<NSNumber *> *)conversationTypes
                    startTime:(long long)startTime
                        count:(int)count
                      success:(nullable void (^)(NSArray<RCIMIWConversation *> *))successBlock
                        error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)getUnreadConversations:(NSArray<NSNumber *> *)conversationTypes
                      success:(nullable void (^)(NSArray<RCIMIWConversation *> *))successBlock
                        error:(nullable void (^)(NSInteger code))errorBlock;


/*!
 分页获取会话列表
 
 @param conversationTypes            会话类型的数组（ 需要将 RCIMIWConversationType 转为 NSNumber 构建 NSArray ）
 @param startTime   会话的时间戳（获取这个时间戳之前的会话列表，0表示从最新开始获取）
 @param count            获取的数量,  0 < count <= 50（当实际取回的会话数量小于 count 值时，表明已取完数据）
 @return    接口调用状态
 
 @discussion 此方法会从本地数据库中，读取会话列表。
 返回的会话列表按照时间从前往后排列，如果有置顶的会话，则置顶的会话会排列在前面。
 
 @remarks 会话
 */
- (NSInteger)loadConversations:(NSArray<NSNumber *> *)conversationTypes
                     channelId:(nullable NSString *)channelId
                     startTime:(long long)startTime
                         count:(int)count
__deprecated_msg("Use [RCIMIWEngine getConversations:channelId:startTime:count:success:error:] instead");

- (NSInteger)getConversations:(NSArray<NSNumber *> *)conversationTypes
                    channelId:(nullable NSString *)channelId
                    startTime:(long long)startTime
                        count:(int)count
                      success:(nullable void (^)(NSArray<RCIMIWConversation *> *))successBlock
                        error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)getConversationsWithPriority:(NSArray<NSNumber *> *)conversationTypes
                                channelId:(nullable NSString *)channelId
                                startTime:(long long)startTime
                                    count:(int)count
                              topPriority:(BOOL)topPriority
                                  success:(nullable void (^)(NSArray<RCIMIWConversation *> *))successBlock
                                    error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)removeConversation:(RCIMIWConversationType)type
                       targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine removeConversation:targetId:conversationRemoved:] instead");

- (NSInteger)removeConversation:(RCIMIWConversationType)type
                       targetId:(NSString *)targetId
            conversationRemoved:(nullable void (^)(NSInteger code))conversationRemovedBlock;

/*!
 从本地存储中删除会话
 
 @param type                     会话类型
 @param targetId            会话 ID
 @param channelId          所属会话的业务标识
 @return              接口调用状态
 
 @discussion
 此方法会从本地存储中删除该会话，但是不会删除会话中的消息。如果此会话中有新的消息，该会话将重新在会话列表中显示，并显示最近的历史消息。
 
 @remarks 会话
 */
- (NSInteger)removeConversation:(RCIMIWConversationType)type
                       targetId:(NSString *)targetId
                      channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine removeConversation:targetId:channelId:conversationRemoved:] instead");

- (NSInteger)removeConversation:(RCIMIWConversationType)type
                       targetId:(NSString *)targetId
                      channelId:(nullable NSString *)channelId
            conversationRemoved:(nullable void (^)(NSInteger code))conversationRemovedBlock;

- (NSInteger)removeConversations:(NSArray<NSNumber *> *)conversationTypes
__deprecated_msg("Use [RCIMIWEngine removeConversations:conversationsRemoved:] instead");

- (NSInteger)removeConversations:(NSArray<NSNumber *> *)conversationTypes
            conversationsRemoved:(nullable void (^)(NSInteger code))conversationsRemovedBlock;

/*!
 删除指定类型的会话
 
 @param conversationTypes  会话类型的数组(需要将 RCConversationType 转为 NSNumber 构建 NSArray)
 @param channelId          所属会话的业务标识
 @return                   接口调用状态
 
 @discussion 此方法会从本地存储中删除该会话，同时删除会话中的消息。
 
 @discussion 此方法不支持超级群的会话类型，包含超级群时可能会造成数据异常。
 
 @remarks 会话
 */
- (NSInteger)removeConversations:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine removeConversations:channelId:conversationsRemoved:] instead");

- (NSInteger)removeConversations:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(nullable NSString *)channelId
            conversationsRemoved:(nullable void (^)(NSInteger code))conversationsRemovedBlock;

- (NSInteger)loadMessageCount:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getMessageCount:targetId:success:error:] instead");

- (NSInteger)getMessageCount:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                     success:(nullable void (^)(NSInteger count))successBlock
                       error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 获取会话中的消息数量
 
 @param type    会话类型
 @param targetId            会话 ID
 @param channelId          所属会话的业务标识
 @return             会话中的消息数量
 
 @remarks 会话
 */
- (NSInteger)loadMessageCount:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getMessageCount:targetId:channelId:success:error:] instead");

- (NSInteger)getMessageCount:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(nullable NSString *)channelId
                     success:(nullable void (^)(NSInteger count))successBlock
                       error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 会话未读数

- (NSInteger)loadTotalUnreadCount
__deprecated_msg("Use [RCIMIWEngine getTotalUnreadCount:error:] instead");

- (NSInteger)getTotalUnreadCount:(nullable void (^)(NSInteger count))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadTotalUnreadCount:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getTotalUnreadCount:success:error:] instead");

- (NSInteger)getTotalUnreadCount:(nullable NSString *)channelId
                         success:(nullable void (^)(NSInteger count))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadUnreadCount:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getUnreadCount:targetId:success:error:] instead");

- (NSInteger)getUnreadCount:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                    success:(nullable void (^)(NSInteger count))successBlock
                      error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadUnreadCount:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getUnreadCount:targetId:channelId:success:error:] instead");

- (NSInteger)getUnreadCount:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(nullable NSString *)channelId
                    success:(nullable void (^)(NSInteger count))successBlock
                      error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadUnreadCountByConversationTypes:(NSArray<NSNumber *> *)conversationTypes
                                        contain:(BOOL)contain
__deprecated_msg("Use [RCIMIWEngine getUnreadCountByConversationTypes:contain:success:error:] instead");

- (NSInteger)getUnreadCountByConversationTypes:(NSArray<NSNumber *> *)conversationTypes
                                       contain:(BOOL)contain
                                       success:(nullable void (^)(NSInteger count))successBlock
                                         error:(nullable void (^)(NSInteger code))errorBlock;

/**
 获取某些类型的会话中所有的未读消息数 （聊天室会话除外）
 
 @param conversationTypes   会话类型的数组
 @param channelId                    所属会话的业务标识
 @param contain                         是否包含免打扰消息的未读数
 @return                  该类型的会话中所有的未读消息数
 
 @remarks 会话
 */
- (NSInteger)loadUnreadCountByConversationTypes:(NSArray<NSNumber *> *)conversationTypes
                                      channelId:(nullable NSString *)channelId
                                        contain:(BOOL)contain
__deprecated_msg("Use [RCIMIWEngine getUnreadCountByConversationTypes:channelId:contain:success:error:] instead");

- (NSInteger)getUnreadCountByConversationTypes:(NSArray<NSNumber *> *)conversationTypes
                                     channelId:(nullable NSString *)channelId
                                       contain:(BOOL)contain
                                       success:(nullable void (^)(NSInteger count))successBlock
                                         error:(nullable void (^)(NSInteger code))errorBlock;

/// - Parameter levels: RCIMIWPushNotificationLevel 数组
- (NSInteger)getUnreadCountByLevels:(NSArray<NSNumber *> *)conversationTypes
                             levels:(NSArray<NSNumber *> *)levels
                            success:(nullable void (^)(NSInteger count))successBlock
                              error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadUnreadMentionedCount:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getUnreadMentionedCount:targetId:success:error:] instead");

- (NSInteger)getUnreadMentionedCount:(RCIMIWConversationType)type
                            targetId:(NSString *)targetId
                             success:(nullable void (^)(NSInteger count))successBlock
                               error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 获取会话中@提醒自己的消息
 
 @discussion 此接口仅支持  RCIMIWConversationTypeGroup、 RCIMIWConversationTypeUltraGroup
 */
- (NSInteger)loadUnreadMentionedCount:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getUnreadMentionedCount:targetId:channelId:success:error:] instead");

- (NSInteger)getUnreadMentionedCount:(RCIMIWConversationType)type
                            targetId:(NSString *)targetId
                           channelId:(nullable NSString *)channelId
                             success:(nullable void (^)(NSInteger count))successBlock
                               error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)clearUnreadCount:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine clearUnreadCount:targetId:timestamp:unreadCountCleared:] instead");

- (NSInteger)clearUnreadCount:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    timestamp:(long long)timestamp
           unreadCountCleared:(nullable void (^)(NSInteger code))unreadCountClearedBlock;

/*!
 清除某个会话中的未读消息数
 
 @param type            会话类型，不支持聊天室
 @param targetId   会话 ID
 @param timestamp 该会话已阅读的最后一条消息的发送时间戳 （该会话在时间戳 timestamp 之前的消息将被置成已读，传 0 表示 清除某个会话中的所有未读消息数）
 */
- (NSInteger)clearUnreadCount:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
                    timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine clearUnreadCount:targetId:channelId:timestamp:unreadCountCleared:] instead");

- (NSInteger)clearUnreadCount:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
                    timestamp:(long long)timestamp
           unreadCountCleared:(nullable void (^)(NSInteger code))unreadCountClearedBlock;

#pragma mark - 会话草稿

- (NSInteger)saveDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                        draft:(NSString *)draft
__deprecated_msg("Use [RCIMIWEngine saveDraftMessage:targetId:draft:draftMessageSaved:] instead");

- (NSInteger)saveDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                        draft:(NSString *)draft
            draftMessageSaved:(nullable void (^)(NSInteger code))draftMessageSavedBlock;

/*!
 保存草稿信息（用户输入但未发送的暂存消息）
 
 @param type        会话类型
 @param targetId    会话 ID
 @param draft       草稿信息
 */
- (NSInteger)saveDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
                        draft:(NSString *)draft
__deprecated_msg("Use [RCIMIWEngine saveDraftMessage:targetId:channelId:draft:draftMessageSaved:] instead");

- (NSInteger)saveDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
                        draft:(NSString *)draft
            draftMessageSaved:(nullable void (^)(NSInteger code))draftMessageSavedBlock;

- (NSInteger)loadDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getDraftMessage:targetId:success:error:] instead");

- (NSInteger)getDraftMessage:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                     success:(nullable void (^)(NSString * _Nullable draft))successBlock
                       error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getDraftMessage:targetId:channelId:success:error:] instead");

- (NSInteger)getDraftMessage:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(nullable NSString *)channelId
                     success:(nullable void (^)(NSString * _Nullable draft))successBlock
                       error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)clearDraftMessage:(RCIMIWConversationType)type
                      targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine clearDraftMessage:targetId:draftMessageCleared:] instead");

- (NSInteger)clearDraftMessage:(RCIMIWConversationType)type
                      targetId:(NSString *)targetId
           draftMessageCleared:(nullable void (^)(NSInteger code))draftMessageClearedBlock;

- (NSInteger)clearDraftMessage:(RCIMIWConversationType)type
                      targetId:(NSString *)targetId
                     channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine clearDraftMessage:targetId:channelId:draftMessageCleared:] instead");

- (NSInteger)clearDraftMessage:(RCIMIWConversationType)type
                      targetId:(NSString *)targetId
                     channelId:(nullable NSString *)channelId
           draftMessageCleared:(nullable void (^)(NSInteger code))draftMessageClearedBlock;

#pragma mark - 会话免打扰

- (NSInteger)changeConversationNotificationLevel:(RCIMIWConversationType)type
                                        targetId:(NSString *)targetId
                                           level:(RCIMIWPushNotificationLevel)level
__deprecated_msg("Use [RCIMIWEngine changeConversationNotificationLevel:targetId:level:conversationNotificationLevelChanged:] instead");

- (NSInteger)changeConversationNotificationLevel:(RCIMIWConversationType)type
                                        targetId:(NSString *)targetId
                                           level:(RCIMIWPushNotificationLevel)level
            conversationNotificationLevelChanged:(nullable void (^)(NSInteger code))conversationNotificationLevelChangedBlock;

/**
 * @param type           会话类型
 * @param targetId  会话 ID
 * @param channelId 频道 ID
 * @param level 消息通知级别
 * @discussion 如要移除免打扰，设置 level 为 RCIMIWPushNotificationLevelDefault 表示移除免打扰
 */
- (NSInteger)changeConversationNotificationLevel:(RCIMIWConversationType)type
                                        targetId:(NSString *)targetId
                                       channelId:(nullable NSString *)channelId
                                           level:(RCIMIWPushNotificationLevel)level
__deprecated_msg("Use [RCIMIWEngine changeConversationNotificationLevel:targetId:channelId:level:conversationNotificationLevelChanged:] instead");

- (NSInteger)changeConversationNotificationLevel:(RCIMIWConversationType)type
                                        targetId:(NSString *)targetId
                                       channelId:(nullable NSString *)channelId
                                           level:(RCIMIWPushNotificationLevel)level
            conversationNotificationLevelChanged:(nullable void (^)(NSInteger code))conversationNotificationLevelChangedBlock;

- (NSInteger)loadConversationNotificationLevel:(RCIMIWConversationType)type
                                      targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getConversationNotificationLevel:targetId:success:error:] instead");

- (NSInteger)getConversationNotificationLevel:(RCIMIWConversationType)type
                                     targetId:(NSString *)targetId
                                      success:(nullable void (^)(RCIMIWPushNotificationLevel level))successBlock
                                        error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadConversationNotificationLevel:(RCIMIWConversationType)type
                                      targetId:(NSString *)targetId
                                     channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getConversationNotificationLevel:targetId:channelId:success:error:] instead");

- (NSInteger)getConversationNotificationLevel:(RCIMIWConversationType)type
                                     targetId:(NSString *)targetId
                                    channelId:(nullable NSString *)channelId
                                      success:(nullable void (^)(RCIMIWPushNotificationLevel level))successBlock
                                        error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadBlockedConversations:(NSArray<NSNumber *> *)conversationTypes
__deprecated_msg("Use [RCIMIWEngine getBlockedConversations:success:error:] instead");

- (NSInteger)getBlockedConversations:(NSArray<NSNumber *> *)conversationTypes
                             success:(nullable void (^)(NSArray<RCIMIWConversation *> *conversations))successBlock
                               error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadBlockedConversations:(NSArray<NSNumber *> *)conversationTypes
                            channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getBlockedConversations:channelId:success:error:] instead");

- (NSInteger)getBlockedConversations:(NSArray<NSNumber *> *)conversationTypes
                           channelId:(nullable NSString *)channelId
                             success:(nullable void (^)(NSArray<RCIMIWConversation *> *conversations))successBlock
                               error:(nullable void (^)(NSInteger code))errorBlock;

/**
 * 设置会话类型免打扰
 * @param type      会话类型
 * @param level    消息通知级别
 * @discussion 如要移除消息提醒状态，设置 level 为 RCIMIWPushNotificationLevelDefault
 */
- (NSInteger)changeConversationTypeNotificationLevel:(RCIMIWConversationType)type
                                               level:(RCIMIWPushNotificationLevel)level
__deprecated_msg("Use [RCIMIWEngine changeConversationTypeNotificationLevel:level:conversationTypeNotificationLevelChanged:] instead");

- (NSInteger)changeConversationTypeNotificationLevel:(RCIMIWConversationType)type
                                               level:(RCIMIWPushNotificationLevel)level
            conversationTypeNotificationLevelChanged:(nullable void (^)(NSInteger code))conversationTypeNotificationLevelChangedBlock;

/**
 * 获取会话类型的消息提醒状态
 * @param type            会话类型
 */
- (NSInteger)loadConversationTypeNotificationLevel:(RCIMIWConversationType)type
__deprecated_msg("Use [RCIMIWEngine getConversationTypeNotificationLevel:success:error:] instead");

- (NSInteger)getConversationTypeNotificationLevel:(RCIMIWConversationType)type
                                          success:(nullable void (^)(RCIMIWPushNotificationLevel level))successBlock
                                            error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 会话置顶

- (NSInteger)changeConversationTopStatus:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                                     top:(BOOL)top
__deprecated_msg("Use [RCIMIWEngine changeConversationTopStatus:targetId:top:conversationTopStatusChanged:] instead");

- (NSInteger)changeConversationTopStatus:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                                     top:(BOOL)top
            conversationTopStatusChanged:(nullable void (^)(NSInteger code))conversationTopStatusChangedBlock;

/**
 *
 * @param type           会话类型
 * @param targetId  会话 ID
 * @param channelId 频道 ID
 * @param top             是否置顶
 * @return         接口调用状态码
 */
- (NSInteger)changeConversationTopStatus:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                               channelId:(nullable NSString *)channelId
                                     top:(BOOL)top
__deprecated_msg("Use [RCIMIWEngine changeConversationTopStatus:targetId:channelId:top:conversationTopStatusChanged:] instead");

- (NSInteger)changeConversationTopStatus:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                               channelId:(nullable NSString *)channelId
                                     top:(BOOL)top
            conversationTopStatusChanged:(nullable void (^)(NSInteger code))conversationTopStatusChangedBlock;

- (NSInteger)changeConversationTopStatusWithUpdateTme:(RCIMIWConversationType)type
                                             targetId:(NSString *)targetId
                                            channelId:(nullable NSString *)channelId
                                                  top:(BOOL)top
                                  updateOperationTime:(BOOL)updateOperationTime
                         conversationTopStatusChanged:(nullable void (^)(NSInteger code))conversationTopStatusChangedBlock;

- (NSInteger)loadConversationTopStatus:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getConversationTopStatus:targetId:success:error:] instead");

- (NSInteger)getConversationTopStatus:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                              success:(nullable void (^)(BOOL top))successBlock
                                error:(nullable void (^)(NSInteger code))errorBlock;

/**
 *
 * @param type           会话类型
 * @param targetId  会话 ID
 * @return         接口调用状态码
 */
- (NSInteger)loadConversationTopStatus:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getConversationTopStatus:targetId:channelId:success:error:] instead");

- (NSInteger)getConversationTopStatus:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(nullable NSString *)channelId
                              success:(nullable void (^)(BOOL top))successBlock
                                error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadTopConversations:(NSArray<NSNumber *> *)conversationTypes
__deprecated_msg("Use [RCIMIWEngine getTopConversations:success:error:] instead");

- (NSInteger)getTopConversations:(NSArray<NSNumber *> *)conversationTypes
                         success:(nullable void (^)(NSArray<RCIMIWConversation *> *conversations))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 获取置顶的会话列表
 
 @param conversationTypes 会话类型的数组（ 需要将 RCIMIWConversationType 转为 NSNumber 构建 NSArray ）
 @return                  接口调用状态
 
 @discussion 此方法会从本地数据库中，读取置顶的会话列表。
 
 @remarks 会话列表
 */
- (NSInteger)loadTopConversations:(NSArray<NSNumber *> *)conversationTypes
                        channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getTopConversations:channelId:success:error:] instead");

- (NSInteger)getTopConversations:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(nullable NSString *)channelId
                         success:(nullable void (^)(NSArray<RCIMIWConversation *> *conversations))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 多端状态同步

- (NSInteger)syncConversationReadStatus:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                              timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine syncConversationReadStatus:targetId:timestamp:conversationReadStatusSynced:] instead");

- (NSInteger)syncConversationReadStatus:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                              timestamp:(long long)timestamp
           conversationReadStatusSynced:(nullable void (^)(NSInteger code))conversationReadStatusSyncedBlock;

/*!
 同步会话阅读状态（把指定会话里所有发送时间早于 timestamp 的消息置为已读）
 
 @param type                  会话类型
 @param targetId         会话 ID
 @param channelId       所属会话的业务标识
 @param timestamp       已经阅读的最后一条消息的 Unix 时间戳(毫秒)
 
 @discussion 此方法不支持超级群的会话类型。
 
 @remarks 高级功能
 */
- (NSInteger)syncConversationReadStatus:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                              channelId:(nullable NSString *)channelId
                              timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine syncConversationReadStatus:targetId:channelId:timestamp:conversationReadStatusSynced:] instead");

- (NSInteger)syncConversationReadStatus:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                              channelId:(nullable NSString *)channelId
                              timestamp:(long long)timestamp
           conversationReadStatusSynced:(nullable void (^)(NSInteger code))conversationReadStatusSyncedBlock;

#pragma mark - 聊天室

- (NSInteger)joinChatRoom:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine joinChatRoom:chatRoomJoined:] instead");

- (NSInteger)joinChatRoom:(NSString *)targetId
           chatRoomJoined:(nullable void (^)(NSInteger code, NSString *targetId))chatRoomJoinedBlock;

- (NSInteger)joinChatRoom:(NSString *)targetId
             messageCount:(int)messageCount
__deprecated_msg("Use [RCIMIWEngine joinChatRoom:messageCount:chatRoomJoined:] instead");

- (NSInteger)joinChatRoom:(NSString *)targetId
             messageCount:(int)messageCount
           chatRoomJoined:(nullable void (^)(NSInteger code, NSString *targetId))chatRoomJoinedBlock;

- (NSInteger)joinChatRoom:(NSString *)targetId
               autoCreate:(BOOL)autoCreate
__deprecated_msg("Use [RCIMIWEngine joinChatRoom:autoCreate:chatRoomJoined:] instead");

- (NSInteger)joinChatRoom:(NSString *)targetId
               autoCreate:(BOOL)autoCreate
           chatRoomJoined:(nullable void (^)(NSInteger code, NSString *targetId))chatRoomJoinedBlock;

/*!
 加入聊天室
 
 @param targetId        聊天室 ID
 @param messageCount    进入聊天室时获取历史消息的数量，-1 <= messageCount <= 50
 @param autoCreate    如果聊天室不存在，是否自动创建。 YES: 自动创建 NO: 不自动创建
 [status: 加入聊天室失败的错误码]
 
 @discussion
 可以通过传入的 messageCount 设置加入聊天室成功之后需要获取的历史消息数量。
 -1 表示不获取任何历史消息，0 表示不特殊设置而使用SDK默认的设置（默认为获取 10 条），0 < messageCount <= 50
 为具体获取的消息数量,最大值为 50。注：如果是 7.x 系统获取历史消息数量不要大于 30
 
 @warning 没有加入过的聊天室(或杀死 app 重新打开)，调用该接口会把该聊天室本地的消息与 KV 清除
 
 @remarks 聊天室
 */
- (NSInteger)joinChatRoom:(NSString *)targetId
             messageCount:(int)messageCount
               autoCreate:(BOOL)autoCreate
__deprecated_msg("Use [RCIMIWEngine joinChatRoom:messageCount:autoCreate:chatRoomJoined:] instead");

- (NSInteger)joinChatRoom:(NSString *)targetId
             messageCount:(int)messageCount
               autoCreate:(BOOL)autoCreate
           chatRoomJoined:(nullable void (^)(NSInteger code, NSString *targetId))chatRoomJoinedBlock;

- (NSInteger)leaveChatRoom:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine leaveChatRoom:chatRoomLeft:] instead");

- (NSInteger)leaveChatRoom:(NSString *)targetId
              chatRoomLeft:(nullable void (^)(NSInteger code, NSString *targetId))chatRoomLeftBlock;

/*!
 获取聊天室的历史消息
 @param targetId         聊天室 ID
 @param timestamp    起始的消息发送时间戳，毫秒
 @param order               拉取顺序
 RCIMIWTimeOrderBefore：表示拉取小（早）于 timestamp 的消息。
 RCIMIWTimeOrderAfter：表示拉取大（晚）于 timestamp 的消息。
 @param count               需要获取的消息数量， 0 < count <= 50
 */
- (NSInteger)loadChatRoomMessages:(NSString *)targetId
                        timestamp:(long long)timestamp
                            order:(RCIMIWTimeOrder)order
                            count:(int)count
__deprecated_msg("Use [RCIMIWEngine getChatRoomMessages:timestamp:order:count:success:error:] instead");

- (NSInteger)getChatRoomMessages:(NSString *)targetId
                       timestamp:(long long)timestamp
                           order:(RCIMIWTimeOrder)order
                           count:(int)count
                         success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;

/// 是否允许聊天室消息排重，默认值为 YES
///
/// 排重的场景如下
/// 发送方弱网情况下发送消息，消息到达服务但发送方没有收到服务 ack，导致发送方认为消息发送失败
/// 此种情况下，服务端和接收方都会收到第一条消息
/// 此时发送方重发该消息，再次达到服务，那么此时服务端会有两条消息（消息内容相同，messageUid 不同）
/// 接收方会收到两条内容相同但 messageUid 不同的消息，SDK 此时会把第二条相同内容消息排重掉
/// 以此来保证重发的相同内容消息，发送方只有一条消息，接收方也只有一条消息
///
/// 当消息量少时，消息排重影响不大；但是本地存在大量消息时，排重会出现性能问题
/// 当 APP 本地存在大量消息，且发生收消息卡顿时，建议将排重关闭
/// 在初始化接口之后连接之前调用
///
/// - Parameter enableCheck: 是否允许聊天室消息排重
///
/// - Since: 5.8.2

- (NSInteger)setCheckChatRoomDuplicateMessage:(BOOL)enableCheck;

#pragma mark - 聊天室 KV

/**
 设置聊天室自定义属性
 
 @param targetId   聊天室 ID
 @param key 聊天室属性名称，Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，最大长度 128 个字符
 @param value 聊天室属性对应的值，最大长度 4096 个字符
 @param deleteWhenLeft   用户掉线或退出时，是否自动删除该 Key、Value 值；自动删除时不会发送通知
 @param overwrite 如果 overwrite 为 YES ，设置聊天室自定义属性，当 key 不存在时，代表增加属性； 当 key 已经存在时，代表更新属性的值。
 如果 overwrite 为 NO，设置聊天室自定义属性，当 key 不存在时，代表增加属性； 当 key 已经存在时，代表更新属性的值，且只有 key
 的创建者可以更新属性的值。
 
 @discussion 必须先开通聊天室状态存储功能
 强制设置聊天室自定义属性，当 key 不存在时，代表增加属性； 当 key 已经存在时，代表更新属性的值。
 
 @remarks 聊天室
 */
- (NSInteger)addChatRoomEntry:(NSString *)targetId
                          key:(NSString *)key
                        value:(NSString *)value
               deleteWhenLeft:(BOOL)deleteWhenLeft
                    overwrite:(BOOL)overwrite
__deprecated_msg("Use [RCIMIWEngine addChatRoomEntry:key:value:deleteWhenLeft:overwrite:chatRoomEntryAdded:] instead");

- (NSInteger)addChatRoomEntry:(NSString *)targetId
                          key:(NSString *)key
                        value:(NSString *)value
               deleteWhenLeft:(BOOL)deleteWhenLeft
                    overwrite:(BOOL)overwrite
           chatRoomEntryAdded:(nullable void (^)(NSInteger code))chatRoomEntryAddedBlock;

- (NSInteger)addChatRoomEntries:(NSString *)targetId
                        entries:(NSDictionary<NSString *, NSString *> *)entries
                 deleteWhenLeft:(BOOL)deleteWhenLeft
                      overwrite:(BOOL)overwrite
__deprecated_msg("Use [RCIMIWEngine addChatRoomEntries:entries:deleteWhenLeft:overwrite:chatRoomEntriesAdded:] instead");

- (NSInteger)addChatRoomEntries:(NSString *)targetId
                        entries:(NSDictionary<NSString *, NSString *> *)entries
                 deleteWhenLeft:(BOOL)deleteWhenLeft
                      overwrite:(BOOL)overwrite
           chatRoomEntriesAdded:(nullable void (^)(NSInteger code, NSDictionary<NSString *, NSNumber *> * _Nullable errors))chatRoomEntriesAddedBlock;

- (NSInteger)loadChatRoomEntry:(NSString *)targetId
                           key:(NSString *)key
__deprecated_msg("Use [RCIMIWEngine getChatRoomEntry:key:success:error:] instead");

- (NSInteger)getChatRoomEntry:(NSString *)targetId
                          key:(NSString *)key
                      success:(nullable void (^)(NSDictionary<NSString *, NSString *> *entry))successBlock
                        error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadChatRoomAllEntries:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getChatRoomAllEntries:success:error:] instead");

- (NSInteger)getChatRoomAllEntries:(NSString *)targetId
                           success:(nullable void (^)(NSDictionary<NSString *, NSString *> *entries))successBlock
                             error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)removeChatRoomEntry:(NSString *)targetId
                             key:(NSString *)key
                           force:(BOOL)force
__deprecated_msg("Use [RCIMIWEngine removeChatRoomEntry:key:force:chatRoomEntryRemoved:] instead");

- (NSInteger)removeChatRoomEntry:(NSString *)targetId
                             key:(NSString *)key
                           force:(BOOL)force
            chatRoomEntryRemoved:(nullable void (^)(NSInteger code))chatRoomEntryRemovedBlock;

- (NSInteger)removeChatRoomEntries:(NSString *)targetId
                              keys:(NSArray<NSString *> *)keys
                             force:(BOOL)force
__deprecated_msg("Use [RCIMIWEngine removeChatRoomEntries:key:force:chatRoomEntriesRemoved:] instead");

- (NSInteger)removeChatRoomEntries:(NSString *)targetId
                              keys:(NSArray<NSString *> *)keys
                             force:(BOOL)force
            chatRoomEntriesRemoved:(nullable void (^)(NSInteger code))chatRoomEntriesRemovedBlock;

#pragma mark - 用户管理

- (NSInteger)addToBlacklist:(NSString *)userId
__deprecated_msg("Use [RCIMIWEngine addToBlacklist:blacklistAdded:] instead");

- (NSInteger)addToBlacklist:(NSString *)userId
             blacklistAdded:(nullable void (^)(NSInteger code, NSString *userId))blacklistAddedBlock;

- (NSInteger)removeFromBlacklist:(NSString *)userId
__deprecated_msg("Use [RCIMIWEngine removeFromBlacklist:blacklistRemoved:] instead");

- (NSInteger)removeFromBlacklist:(NSString *)userId
                blacklistRemoved:(nullable void (^)(NSInteger code, NSString *userId))blacklistRemovedBlock;

- (NSInteger)loadBlacklist
__deprecated_msg("Use [RCIMIWEngine getBlacklist:error:] instead");

- (NSInteger)getBlacklist:(nullable void (^)(NSArray<NSString *> *userIds))successBlock
                    error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)loadBlacklistStatus:(NSString *)userId
__deprecated_msg("Use [RCIMIWEngine getBlacklistStatus:success:error:] instead");

- (NSInteger)getBlacklistStatus:(NSString *)userId
                        success:(nullable void (^)(RCIMIWBlacklistStatus status))successBlock
                          error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 搜索消息

- (NSInteger)searchMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                    keyword:(NSString *)keyword
                  startTime:(long long)startTime
                      count:(int)count
__deprecated_msg("Use [RCIMIWEngine searchMessages:targetId:keyword:startTime:count:success:error:] instead");

- (NSInteger)searchMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                    keyword:(NSString *)keyword
                  startTime:(long long)startTime
                      count:(int)count
                    success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                      error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 根据关键字搜索指定会话中的消息
 
 @param type               会话类型 （ 不支持超级群的会话类型 ）
 @param targetId      会话 ID
 @param keyword        关键字
 @param count            最大的查询数量 0 < count <= 50
 @param startTime   查询 startTime 之前的消息（传 0 表示不限时间）
 
 @return 接口调用状态
 
 @discussion 此方法不支持超级群的会话类型。
 
 @remarks 消息操作
 */
- (NSInteger)searchMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(nullable NSString *)channelId
                    keyword:(NSString *)keyword
                  startTime:(long long)startTime
                      count:(int)count
__deprecated_msg("Use [RCIMIWEngine searchMessages:targetId:channelId:keyword:startTime:count:success:error:] instead");

- (NSInteger)searchMessages:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(nullable NSString *)channelId
                    keyword:(NSString *)keyword
                  startTime:(long long)startTime
                      count:(int)count
                    success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                      error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)searchMessagesByTimeRange:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                               keyword:(NSString *)keyword
                             startTime:(long long)startTime
                               endTime:(long long)endTime
                                offset:(int)offset
                                 count:(int)count
__deprecated_msg("Use [RCIMIWEngine searchMessagesByTimeRange:targetId:keyword:startTime:endTime:offset:count:success:error:] instead");

- (NSInteger)searchMessagesByTimeRange:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                               keyword:(NSString *)keyword
                             startTime:(long long)startTime
                               endTime:(long long)endTime
                                offset:(int)offset
                                 count:(int)count
                               success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                                 error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 根据时间，偏移量和个数搜索指定会话中的消息
 
 @param type                  会话类型
 @param targetId         会话 ID
 @param keyword           关键字，传空默认为是查全部符合条件的消息
 @param startTime      查询 startTime 之后的消息， startTime >= 0
 @param endTime           查询 endTime 之前的消息，endTime > startTime
 @param offset             查询的消息的偏移量，offset >= 0
 @param count               最大的查询数量， 0 < count <= 50。
 
 @return 匹配的消息列表
 
 @discussion 此方法不支持超级群的会话类型。
 
 @remarks 消息操作
 */
- (NSInteger)searchMessagesByTimeRange:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(nullable NSString *)channelId
                               keyword:(NSString *)keyword
                             startTime:(long long)startTime
                               endTime:(long long)endTime
                                offset:(int)offset
                                 count:(int)count
__deprecated_msg("Use [RCIMIWEngine searchMessagesByTimeRange:targetId:channelId:keyword:startTime:endTime:offset:count:success:error:] instead");

- (NSInteger)searchMessagesByTimeRange:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(nullable NSString *)channelId
                               keyword:(NSString *)keyword
                             startTime:(long long)startTime
                               endTime:(long long)endTime
                                offset:(int)offset
                                 count:(int)count
                               success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                                 error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)searchMessagesByUserId:(NSString *)userId
                               type:(RCIMIWConversationType)type
                           targetId:(NSString *)targetId
                          startTime:(long long)startTime
                              count:(int)count
__deprecated_msg("Use [RCIMIWEngine searchMessagesByUserId:type:targetId:startTime:count:success:error:] instead");

- (NSInteger)searchMessagesByUserId:(NSString *)userId
                               type:(RCIMIWConversationType)type
                           targetId:(NSString *)targetId
                          startTime:(long long)startTime
                              count:(int)count
                            success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                              error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 按用户 ID 搜索指定会话中的消息
 
 @param userId           搜索用户 ID
 @param type               会话类型
 @param targetId      会话 ID
 @param count             最大的查询数量  0 < count <= 50
 @param startTime    查询 startTime 之前的消息（传 0 表示不限时间）
 
 @return 匹配的消息列表
 
 @discussion 此方法不支持超级群的会话类型。
 
 @remarks 消息操作
 */
- (NSInteger)searchMessagesByUserId:(NSString *)userId
                               type:(RCIMIWConversationType)type
                           targetId:(NSString *)targetId
                          channelId:(nullable NSString *)channelId
                          startTime:(long long)startTime
                              count:(int)count
__deprecated_msg("Use [RCIMIWEngine searchMessagesByUserId:type:targetId:channelId:startTime:count:success:error:] instead");

- (NSInteger)searchMessagesByUserId:(NSString *)userId
                               type:(RCIMIWConversationType)type
                           targetId:(NSString *)targetId
                          channelId:(nullable NSString *)channelId
                          startTime:(long long)startTime
                              count:(int)count
                            success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                              error:(nullable void (^)(NSInteger code))errorBlock;


- (NSInteger)searchMessagesByMessageTypes:(RCIMIWConversationType)type
                                targetId:(NSString *)targetId
                               channelId:(nullable NSString *)channelId
                            messageTypes:(NSArray<NSNumber *> *)messageTypes
                                 keyword:(NSString *)keyword
                               startTime:(long long)startTime
                                   count:(int)count
                                 success:(nullable void (^)(NSArray<RCIMIWMessage *> *messages))successBlock
                                   error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 群聊回执

- (NSInteger)sendGroupReadReceiptRequest:(RCIMIWMessage *)message
__deprecated_msg("Use [RCIMIWEngine sendGroupReadReceiptRequest:groupReadReceiptRequestSent:] instead");

- (NSInteger)sendGroupReadReceiptRequest:(RCIMIWMessage *)message
             groupReadReceiptRequestSent:(nullable void (^)(NSInteger code, RCIMIWMessage *message))groupReadReceiptRequestSentBlock;

- (NSInteger)sendGroupReadReceiptResponse:(NSString *)targetId
                                 messages:(NSArray<RCIMIWMessage *> *)messages
__deprecated_msg("Use [RCIMIWEngine sendGroupReadReceiptResponse:messages:groupReadReceiptResponseSent:] instead");

- (NSInteger)sendGroupReadReceiptResponse:(NSString *)targetId
                                 messages:(NSArray<RCIMIWMessage *> *)messages
             groupReadReceiptResponseSent:(nullable void (^)(NSInteger code, NSArray<RCIMIWMessage *> *messages))groupReadReceiptResponseSentBlock;

- (NSInteger)sendGroupReadReceiptResponse:(NSString *)targetId
                                channelId:(nullable NSString *)channelId
                                 messages:(NSArray<RCIMIWMessage *> *)messages
__deprecated_msg("Use [RCIMIWEngine sendGroupReadReceiptResponse:channelId:messages:groupReadReceiptResponseSent:] instead");

- (NSInteger)sendGroupReadReceiptResponse:(NSString *)targetId
                                channelId:(nullable NSString *)channelId
                                 messages:(NSArray<RCIMIWMessage *> *)messages
             groupReadReceiptResponseSent:(nullable void (^)(NSInteger code, NSArray<RCIMIWMessage *> *messages))groupReadReceiptResponseSentBlock;

- (NSInteger)searchConversations:(NSArray<NSNumber *> *)conversationTypes
                    messageTypes:(NSArray<NSNumber *> *)messageTypes
                         keyword:(NSString *)keyword
__deprecated_msg("Use [RCIMIWEngine searchConversations:messageTypes:keyword:success:error:] instead");

- (NSInteger)searchConversations:(NSArray<NSNumber *> *)conversationTypes
                    messageTypes:(NSArray<NSNumber *> *)messageTypes
                         keyword:(NSString *)keyword
                         success:(nullable void (^)(NSArray<RCIMIWSearchConversationResult *> *results))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)searchConversations:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(nullable NSString *)channelId
                    messageTypes:(NSArray<NSNumber *> *)messageTypes
                         keyword:(NSString *)keyword
__deprecated_msg("Use [RCIMIWEngine searchConversations:channelId:messageTypes:keyword:success:error:] instead");

- (NSInteger)searchConversations:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(nullable NSString *)channelId
                    messageTypes:(NSArray<NSNumber *> *)messageTypes
                         keyword:(NSString *)keyword
                         success:(nullable void (^)(NSArray<RCIMIWSearchConversationResult *> *results))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 会话标签
//
- (NSInteger)createTag:(NSString *)tagId tagName:(NSString *)tagName tagCreated:(nullable void (^)(NSInteger code))tagCreatedBlock;
//
- (NSInteger)removeTag:(NSString *)tagId tagRemoved:(nullable void (^)(NSInteger code))tagRemovedBlock;

- (NSInteger)updateTagNameById:(NSString *)tagId newName:(NSString *)newName tagNameByIdUpdated:(nullable void (^)(NSInteger code))tagNameByIdUpdatedBlock;

- (NSInteger)getTags:(nullable void (^)(NSArray<RCIMIWTagInfo *> *results))successBlock
               error:(nullable void (^)(NSInteger code))errorBlock;;

- (NSInteger)addConversationToTag:(NSString *)tagId
                             type:(RCIMIWConversationType)type
                         targetId:(NSString *)targetId
           conversationToTagAdded:(nullable void (^)(NSInteger code))conversationToTagAddedBlock;

/*!
 从指定标签移除会话
 */
- (NSInteger)removeConversationFromTag:(NSString *)tagId
                                   type: (RCIMIWConversationType)type
                               targetId:(NSString *)targetId
             conversationFromTagRemoved:(nullable void (^)(NSInteger code))conversationFromTagRemovedBlock;

/*!
 删除指定会话中的某些标签
 */
- (NSInteger)removeTagsFromConversation:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                                 tagIds:(NSArray<NSString *> *)tagIds
            tagsFromConversationRemoved:(nullable void (^)(NSInteger code))tagsFromConversationRemovedBlock;
//
- (NSInteger)getTagsFromConversation:(RCIMIWConversationType)type targetId:(NSString *)targetId
                             success:(nullable void (^)(NSArray<RCIMIWConversationTagInfo *> *conversations))successBlock
                               error:(nullable void (^)(NSInteger code))errorBlock;
//
- (NSInteger)getConversationsFromTagByPage:(NSString *)tagId
                                 timestamp:(long long)timestamp
                                     count:(int)count
                                   success:(nullable void (^)(NSArray<RCIMIWConversation *> *conversations))successBlock
                                     error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)getUnreadCountByTag:(NSString *)tagId contain:(BOOL)containBlocked                     success:(nullable void (^)(NSInteger count))successBlock
                           error:(nullable void (^)(NSInteger code))errorBlock;
//
- (NSInteger)changeConversationTopStatusInTag:(NSString *)tagId type:(RCIMIWConversationType)type targetId:(NSString *)targetId top:(BOOL)top
            conversationTopStatusInTagChanged:(nullable void (^)(NSInteger code))conversationTopStatusInTagChangedBlock;;
//
- (NSInteger)getConversationTopStatusInTag:(NSString *)tagId type:(RCIMIWConversationType)type targetId:(NSString *)targetId
                                   success:(nullable void (^)(BOOL top))successBlock
                                     error:(nullable void (^)(NSInteger code))errorBlock;
//
- (NSInteger)clearMessagesUnreadStatusByTag:(NSString *)tagId
                                    success:(nullable void (^)(BOOL top))successBlock
                                      error:(nullable void (^)(NSInteger code))errorBlock;
/// 清除指定 tag 的会话
/// @param deleteMessage 是否清除本地历史消息
- (NSInteger)clearConversationsByTag:(NSString *)tagId deleteMessage:(BOOL)deleteMessage
                             success:(nullable void (^)(BOOL top))successBlock
                               error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 全局免打扰

/*!
 全局屏蔽某个时间段的消息提醒
 
 @param startTime       开始消息免打扰时间，格式为 HH:MM:SS
 @param spanMinutes        需要消息免打扰分钟数，0 < spanMins < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为
 23：59，则 spanMins 为 23 * 60 + 59 = 1439 分钟。）
 @param level  传递 RCPushNotificationQuietHoursLevelDefault 表示移除免打扰
 */
- (NSInteger)changeNotificationQuietHours:(NSString *)startTime
                              spanMinutes:(int)spanMinutes
                                    level:(RCIMIWPushNotificationQuietHoursLevel)level
__deprecated_msg("Use [RCIMIWEngine changeNotificationQuietHours:spanMinutes:level:notificationQuietHoursChanged:] instead");

- (NSInteger)changeNotificationQuietHours:(NSString *)startTime
                              spanMinutes:(int)spanMinutes
                                    level:(RCIMIWPushNotificationQuietHoursLevel)level
            notificationQuietHoursChanged:(nullable void (^)(NSInteger code))notificationQuietHoursChangedBlock;

- (NSInteger)loadNotificationQuietHours
__deprecated_msg("Use [RCIMIWEngine getNotificationQuietHours:error:] instead");

- (NSInteger)getNotificationQuietHours:(nullable void (^)(NSString *startTime, int spanMinutes, RCIMIWPushNotificationQuietHoursLevel level))successBlock
                                 error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)removeNotificationQuietHours
__deprecated_msg("Use [RCIMIWEngine removeNotificationQuietHours:] instead");

- (NSInteger)removeNotificationQuietHours:(nullable void (^)(NSInteger code))notificationQuietHoursRemovedBlock;

#pragma mark - 推送配置

/*!
 设置 deviceToken（已兼容 iOS 13），用于远程推送
 
 @param deviceToken     从系统获取到的 deviceToken  (不需要处理)
 
 @discussion
 deviceToken 是系统提供的，从苹果服务器获取的，用于 APNs 远程推送必须使用的设备唯一值。
 您需要将 -application:didRegisterForRemoteNotificationsWithDeviceToken: 获取到的 deviceToken 作为参数传入此方法。
 
 如:
 - (void)application:(UIApplication *)application
 didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
 //调用 setDeviceToken
 }
 @remarks 功能设置
 */
+ (NSInteger)setDeviceToken:(NSData *)deviceToken;

/*!
 设置是否显示远程推送的内容
 
 @param showContent 是否显示推送的具体内容（ YES 显示 NO 不显示）
 */
- (NSInteger)changePushContentShowStatus:(BOOL)showContent
__deprecated_msg("Use [RCIMIWEngine changePushContentShowStatus:pushContentShowStatusChanged:] instead");

- (NSInteger)changePushContentShowStatus:(BOOL)showContent
            pushContentShowStatusChanged:(nullable void (^)(NSInteger code))pushContentShowStatusChangedBlock;

/**
 设置推送内容的自然语言
 
 @param language             通过 SDK 设置的语言环境，语言缩写内容格式为 (ISO-639 Language Code)_(ISO-3166 Country Codes)，如：zh_CN。目前融云支持的内置推送语言为 zh_CN、en_US、ar_SA
 */
- (NSInteger)changePushLanguage:(NSString *)language
__deprecated_msg("Use [RCIMIWEngine changePushLanguage:pushLanguageChanged:] instead");

- (NSInteger)changePushLanguage:(NSString *)language
            pushLanguageChanged:(nullable void (^)(NSInteger code))pushLanguageChangedBlock;

/*!
 设置 Web 端在线时，手机端是否接收推送
 
 @param receive     是否接收推送（ YES 接收 NO 不接收）
 */
- (NSInteger)changePushReceiveStatus:(BOOL)receive
__deprecated_msg("Use [RCIMIWEngine changePushReceiveStatus:pushReceiveStatusChanged:] instead");

- (NSInteger)changePushReceiveStatus:(BOOL)receive
            pushReceiveStatusChanged:(nullable void (^)(NSInteger code))pushReceiveStatusChangedBlock;

#pragma mark - 超级群
- (NSInteger)syncUltraGroupReadStatus:(NSString *)targetId
                            channelId:(nullable NSString *)channelId
                            timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine syncUltraGroupReadStatus:channelId:timestamp:ultraGroupReadStatusSynced:] instead");

- (NSInteger)syncUltraGroupReadStatus:(NSString *)targetId
                            channelId:(nullable NSString *)channelId
                            timestamp:(long long)timestamp
           ultraGroupReadStatusSynced:(nullable void (^)(NSInteger code))ultraGroupReadStatusSyncedBlock;

- (NSInteger)loadConversationsForAllChannel:(RCIMIWConversationType)type
                                   targetId:(NSString *) targetId
__deprecated_msg("Use [RCIMIWEngine getConversationsForAllChannel:targetId:success:error:] instead");

- (NSInteger)getConversationsForAllChannel:(RCIMIWConversationType)type
                                  targetId:(NSString *) targetId
                                   success:(nullable void (^)(NSArray<RCIMIWConversation *> *conversations))successBlock
                                     error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)modifyUltraGroupMessage:(RCIMIWMessage *)message
__deprecated_msg("Use [RCIMIWEngine modifyUltraGroupMessage:ultraGroupMessageModified:] instead");

- (NSInteger)modifyUltraGroupMessage:(RCIMIWMessage *)message
           ultraGroupMessageModified:(nullable void (^)(NSInteger code))ultraGroupMessageModifiedBlock;

/**
 消息修改
 
 @param messageUId  将被修改的消息id
 @param message         将被修改的消息
 
 @discussion
 此方法只能修改相同频道的同类型消息，仅能修改自己发送的消息
 */
- (NSInteger)modifyUltraGroupMessage:(NSString *)messageUId
                             message:(RCIMIWMessage *)message
__deprecated_msg("Use [RCIMIWEngine modifyUltraGroupMessage:message:ultraGroupMessageModified:] instead");

- (NSInteger)modifyUltraGroupMessage:(NSString *)messageUId
                             message:(RCIMIWMessage *)message
           ultraGroupMessageModified:(nullable void (^)(NSInteger code))ultraGroupMessageModifiedBlock;

/*!
 撤回消息
 
 @param message                 需要撤回的消息
 @param deleteRemote     是否移除远端消息记录，YES: 移除远端消息记录， NO：不移除远端消息记录
 */
- (NSInteger)recallUltraGroupMessage:(RCIMIWMessage *)message
                        deleteRemote:(BOOL)deleteRemote
__deprecated_msg("Use [RCIMIWEngine recallUltraGroupMessage:deleteRemote:ultraGroupMessageRecalled:] instead");

- (NSInteger)recallUltraGroupMessage:(RCIMIWMessage *)message
                        deleteRemote:(BOOL)deleteRemote
           ultraGroupMessageRecalled:(nullable void (^)(NSInteger code))ultraGroupMessageRecalledBlock;

- (NSInteger)clearUltraGroupMessages:(NSString *)targetId
                           channelId:(nullable NSString *)channelId
                           timestamp:(long long)timestamp
                              policy:(RCIMIWMessageOperationPolicy)policy
__deprecated_msg("Use [RCIMIWEngine clearUltraGroupMessages:channelId:timestamp:policy:ultraGroupMessagesCleared:] instead");

- (NSInteger)clearUltraGroupMessages:(NSString *)targetId
                           channelId:(nullable NSString *)channelId
                           timestamp:(long long)timestamp
                              policy:(RCIMIWMessageOperationPolicy)policy
           ultraGroupMessagesCleared:(nullable void (^)(NSInteger code))ultraGroupMessagesClearedBlock;

- (NSInteger)clearUltraGroupMessagesForAllChannel:(NSString *)targetId
                                        timestamp:(long long)timestamp
__deprecated_msg("Use [RCIMIWEngine clearUltraGroupMessagesForAllChannel:timestamp:ultraGroupMessagesClearedForAllChannel:] instead");

- (NSInteger)clearUltraGroupMessagesForAllChannel:(NSString *)targetId
                                        timestamp:(long long)timestamp
           ultraGroupMessagesClearedForAllChannel:(nullable void (^)(NSInteger code))ultraGroupMessagesClearedForAllChannelBlock;

- (NSInteger)sendUltraGroupTypingStatus:(NSString *)targetId
                              channelId:(nullable NSString *)channelId
                           typingStatus:(RCIMIWUltraGroupTypingStatus)typingStatus
__deprecated_msg("Use [RCIMIWEngine sendUltraGroupTypingStatus:channelId:typingStatus:ultraGroupTypingStatusSent:] instead");

- (NSInteger)sendUltraGroupTypingStatus:(NSString *)targetId
                              channelId:(nullable NSString *)channelId
                           typingStatus:(RCIMIWUltraGroupTypingStatus)typingStatus
             ultraGroupTypingStatusSent:(nullable void (^)(NSInteger code))ultraGroupTypingStatusSentBlock;

/*!
 获取同一个超级群下的批量服务消息（含所有频道）
 
 @param messages      消息列表
 @remarks 高级功能
 */
- (NSInteger)loadBatchRemoteUltraGroupMessages:(NSArray<RCIMIWMessage *> *)messages
__deprecated_msg("Use [RCIMIWEngine getBatchRemoteUltraGroupMessages:success:error:] instead");

- (NSInteger)getBatchRemoteUltraGroupMessages:(NSArray<RCIMIWMessage *> *)messages
                                      success:(nullable void (^)(NSArray<RCIMIWMessage *> * _Nullable matchedMessages, NSArray<RCIMIWMessage *> * _Nullable notMatchedMessages))successBlock
                                        error:(nullable void (^)(NSInteger code))errorBlock;

- (NSInteger)updateUltraGroupMessageExpansion:(NSString *)messageUId
                                    expansion:(NSDictionary<NSString *, NSString *> *)expansion
__deprecated_msg("Use [RCIMIWEngine updateUltraGroupMessageExpansion:expansion:ultraGroupMessageExpansionUpdated:] instead");

- (NSInteger)updateUltraGroupMessageExpansion:(NSString *)messageUId
                                    expansion:(NSDictionary<NSString *, NSString *> *)expansion
            ultraGroupMessageExpansionUpdated:(nullable void (^)(NSInteger code))ultraGroupMessageExpansionUpdatedBlock;

- (NSInteger)removeUltraGroupMessageExpansionForKeys:(NSString *)messageUId
                                                keys:(NSArray<NSString *> *)keys
__deprecated_msg("Use [RCIMIWEngine removeUltraGroupMessageExpansionForKeys:keys:ultraGroupMessageExpansionForKeysRemoved:] instead");

- (NSInteger)removeUltraGroupMessageExpansionForKeys:(NSString *)messageUId
                                                keys:(NSArray<NSString *> *)keys
            ultraGroupMessageExpansionForKeysRemoved:(nullable void (^)(NSInteger code))ultraGroupMessageExpansionForKeysRemovedBlock;

/*!
 设置超级群的默认消息状态
 
 @param targetId                    会话 ID
 @param level                       消息通知级别
 */
- (NSInteger)changeUltraGroupDefaultNotificationLevel:(NSString *)targetId
                                                level:(RCIMIWPushNotificationLevel)level
__deprecated_msg("Use [RCIMIWEngine changeUltraGroupDefaultNotificationLevel:level:ultraGroupDefaultNotificationLevelChanged:] instead");

- (NSInteger)changeUltraGroupDefaultNotificationLevel:(NSString *)targetId
                                                level:(RCIMIWPushNotificationLevel)level
            ultraGroupDefaultNotificationLevelChanged:(nullable void (^)(NSInteger code))ultraGroupDefaultNotificationLevelChangedBlock;

/*!
 获取超级群的默认消息状态
 
 @param targetId                    会话 ID
 */
- (NSInteger)loadUltraGroupDefaultNotificationLevel:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getUltraGroupDefaultNotificationLevel:success:error:] instead");

- (NSInteger)getUltraGroupDefaultNotificationLevel:(NSString *)targetId
                                           success:(nullable void (^)(RCIMIWPushNotificationLevel level))successBlock
                                             error:(nullable void (^)(NSInteger code))errorBlock;

/*!
 设置超级群频道的默认消息状态
 
 @param targetId                    会话 ID
 @param channelId                   频道 ID
 @param level                       消息通知级别
 */
- (NSInteger)changeUltraGroupChannelDefaultNotificationLevel:(NSString *)targetId
                                                   channelId:(nullable NSString *)channelId
                                                       level:(RCIMIWPushNotificationLevel)level
__deprecated_msg("Use [RCIMIWEngine changeUltraGroupChannelDefaultNotificationLevel:channelId:level:ultraGroupChannelDefaultNotificationLevelChanged:] instead");

- (NSInteger)changeUltraGroupChannelDefaultNotificationLevel:(NSString *)targetId
                                                   channelId:(nullable NSString *)channelId
                                                       level:(RCIMIWPushNotificationLevel)level
            ultraGroupChannelDefaultNotificationLevelChanged:(nullable void (^)(NSInteger code))ultraGroupChannelDefaultNotificationLevelChangedBlock;

/*!
 获取超级群频道的默认消息状态
 
 @param targetId                    会话 ID
 @param channelId                   频道 ID
 */
- (NSInteger)loadUltraGroupChannelDefaultNotificationLevel:(NSString *)targetId
                                                 channelId:(nullable NSString *)channelId
__deprecated_msg("Use [RCIMIWEngine getUltraGroupChannelDefaultNotificationLevel:channelId:success:error:] instead");

- (NSInteger)getUltraGroupChannelDefaultNotificationLevel:(NSString *)targetId
                                                channelId:(nullable NSString *)channelId
                                                  success:(nullable void (^)(RCIMIWPushNotificationLevel level))successBlock
                                                    error:(nullable void (^)(NSInteger code))errorBlock;

// 获取所有会话的未读消息数
- (NSInteger)loadUltraGroupAllUnreadCount
__deprecated_msg("Use [RCIMIWEngine getUltraGroupAllUnreadCount:error:] instead");

- (NSInteger)getUltraGroupAllUnreadCount:(nullable void (^)(NSInteger count))successBlock
                                   error:(nullable void (^)(NSInteger code))errorBlock;

// 获取所有会话的未读 @ 消息数
- (NSInteger)loadUltraGroupAllUnreadMentionedCount
__deprecated_msg("Use [RCIMIWEngine getUltraGroupAllUnreadMentionedCount:error:] instead");

- (NSInteger)getUltraGroupAllUnreadMentionedCount:(nullable void (^)(NSInteger count))successBlock
                                            error:(nullable void (^)(NSInteger code))errorBlock;

// 获取指定会话的未读消息数
- (NSInteger)loadUltraGroupUnreadCount:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getUltraGroupUnreadCount:success:error:] instead");

- (NSInteger)getUltraGroupUnreadCount:(NSString *)targetId
                              success:(nullable void (^)(NSInteger count))successBlock
                                error:(nullable void (^)(NSInteger code))errorBlock;

// 获取指定会话的未读 @ 消息数
- (NSInteger)loadUltraGroupUnreadMentionedCount:(NSString *)targetId
__deprecated_msg("Use [RCIMIWEngine getUltraGroupUnreadMentionedCount:success:error:] instead");

- (NSInteger)getUltraGroupUnreadMentionedCount:(NSString *)targetId
                                       success:(nullable void (^)(NSInteger count))successBlock
                                         error:(nullable void (^)(NSInteger code))errorBlock;
/*!
 获取当前手机与服务器的时间差
 
 @return 时间差
 @discussion 消息发送成功后，SDK 会与服务器同步时间，消息所在数据库中存储的时间就是服务器时间。
 
 @remarks 数据获取
 */
- (long long)getDeltaTime;

/*!
 设置包名和版本号，埋点使用
 
 @param moduleName             包名
 @param version                    版本号
 */
- (NSInteger)setModuleName:(NSString *)moduleName version:(NSString *)version;

/*!
 上报运行日志
 
 @param method             方法名
 @param callMethod    即将调用方法名
 @param codeValue      错误号，没有错误填0
 @param message           上报消息内容
 */
- (NSInteger)writeLog:(NSString *)method callMethod:(NSString *)callMethod codeValue:(int)codeValue message:(NSString *)message;


/*!
 设置包名和版本号，埋点使用
 
 @param moduleName             包名
 @param version                    版本号
 */

#pragma mark - 用户信息托管

/// 设置自己的信息访问权限
/// - Parameter visibility: 用户信息的访问权限
/// - Parameter success: 成功的回调
/// - Parameter error: 失败的回调
- (NSInteger)updateMyUserProfileVisibility:(RCIMIWUserProfileVisibility)visibility
                                   success:(nullable void (^)(void))successBlock
                                     error:(nullable void (^)(NSInteger errorCode))errorBlock;

/// 获取自己的信息访问权限
/// - Parameter success: 成功的回调
/// - Parameter error: 失败的回调
- (NSInteger)getMyUserProfileVisibility:(nullable void (^)(NSInteger visibility))successBlock
                                  error:(nullable void (^)(NSInteger errorCode))errorBlock;

/// 修改自己的用户信息
/// - Parameter profile: 用户信息
/// - Parameter success: 成功的回调
/// - Parameter error: 失败的回调
- (NSInteger)updateMyUserProfile:(RCIMIWUserProfile *)profile
                    successBlock:(nullable void (^)(void))successBlock
                      errorBlock:(nullable void (^)(NSInteger errorCode, NSArray<NSString *> *_Nullable errorKeys))errorBlock;

/// 查询自己的用户信息
/// - Parameter success: 成功的回调
/// - Parameter error: 失败的回调
- (NSInteger)getMyUserProfile:(nullable void (^)(RCIMIWUserProfile *userProfile))successBlock
                        error:(nullable void (^)(NSInteger errorCode))errorBlock;

/// 批量获取用户信息
/// - Parameter userIds: 用户 ID 列表
/// - Parameter success: 成功的回调
/// - Parameter error: 失败的回调
- (NSInteger)getUserProfiles:(NSArray<NSString *> *)userIds
                     success:(nullable void (^)(NSArray<RCIMIWUserProfile *> *userProfiles))successBlock
                       error:(nullable void (^)(NSInteger errorCode))errorBlock;

/// 按用户应用号精确搜索
/// - Parameter uniqueId: 用户应用号
/// - Parameter success: 成功的回调
/// - Parameter error: 失败的回调，如果搜不到用户，会返回错误码 RC_USER_PROFILE_USER_NOT_EXIST (24366)
- (NSInteger)searchUserProfileByUniqueId:(NSString *)uniqueId
                                 success:(nullable void (^)(RCIMIWUserProfile *userProfile))successBlock
                                   error:(nullable void (^)(NSInteger errorCode))errorBlock;



#pragma mark - 群信息托管

/// 创建群组
/// - Parameter groupInfo: 群组信息及权限，groupId、groupName 必填，否则创建失败
/// - Parameter inviteeUserIds: 被邀请的用户Id列表，可以为空，一次最多允许 30 个用户加入。
/// - Parameter success: 成功回调。
/// - Parameter error: 失败回调
///
/// - Note: 
///
/// **`groupInfo` 参数说明**
/// - `groupId` 最大长度 64 个字符。支持大小写英文字母与数字的组合
/// - `groupName` 最长不超过 64 个字符，群名称可以重复创建
///
/// **`successBlock` 的 `processCode` 参数说明**
/// - 当群组的`inviteHandlePermission` 为被邀请人需要同意才能进群时，`processCode` 返回 `RC_GROUP_NEED_INVITEE_ACCEPT` ( 25427 )，表示需要被邀请人同意后才能进入群组。
/// - 当群组的 `inviteHandlePermission` 为不需被邀请人同意时，`processCode` 返回 RC_SUCCESS ( 0 )，被邀请人会直接加入群组。
- (NSInteger)createGroup:(RCIMIWGroupInfo *)groupInfo
          inviteeUserIds:(nullable NSArray<NSString *> *)inviteeUserIds
                 success:(nullable void (^)(NSInteger processCode))successBlock
                   error:(nullable void (^)(NSInteger errorCode, NSString *errorInfo))errorBlock;

/// 更新群组信息
/// - Parameter groupInfo: 群组信息，groupId 必填，否则更新失败
/// - Parameter success: 成功回调
/// - Parameter error: 失败回调
- (NSInteger)updateGroupInfo:(RCIMIWGroupInfo *)groupInfo
            groupInfoUpdated:(nullable void (^)(NSInteger code, NSString *errorInfo))groupInfoUpdatedBlock;

/// 批量获取群组资料
/// - Parameter groupIds: 群组ID列表，一次最多允许 20 个群组
/// - Parameter success: 成功回调
/// - Parameter error: 失败回调
///
/// - Note: 每秒钟最多查询 5 次
- (NSInteger)getGroupsInfo:(NSArray<NSString *> *)groupIds
                   success:(nullable void (^)(NSArray<RCIMIWGroupInfo *> *groupInfos))successBlock
                     error:(nullable void (^)(NSInteger code))errorBlock;

/// 踢出群成员
/// - Parameter groupId: 群组ID
/// - Parameter userIds: 用户ID列表，一次最多允许 100 个用户
/// - Parameter config: 移除成员配置
/// - Parameter success: 成功回调
/// - Parameter error: 失败回调
- (NSInteger)kickGroupMembers:(NSString *)groupId
                      userIds:(NSArray<NSString *> *)userIds
                       config:(nullable RCIMIWQuitGroupConfig *)config
                  onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 主动加入群组
/// - Parameter groupId: 群组ID
/// - Parameter successBlock: 成功回调。
/// - Parameter errorBlock: 失败回调
/// - Note:
///
/// **`successBlock` 的 `processCode` 参数说明**
/// - 当群组的 `joinPermission` 为需要群主或管理员审批时，`processCode` 返回 `RC_GROUP_JOIN_GROUP_NEED_MANAGER_ACCEPT` ( 25424 )，表示需要等待群主或管理员的审批。
/// - 当群组的 `joinPermission` 为不用验证时，`processCode` 返回 RC_SUCCESS ( 0 )，表示加入群组成功。
- (NSInteger)joinGroup:(NSString *)groupId
               success:(void (^)(NSInteger processCode))successBlock
                 error:(void (^)(NSInteger errorCode))errorBlock;

/// 主动退出群组
/// 用户退出后，群会话信息仍然保留，但不再能接收此群的消息，本地历史消息不删除
/// - Parameter groupId: 群组ID
/// - Parameter config: 退出群组配置
/// - Parameter success: 成功回调
/// - Parameter error: 失败回调
- (NSInteger)quitGroup:(NSString *)groupId
                config:(nullable RCIMIWQuitGroupConfig *)config
           onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 解散群组
/// 只有群主，可以解散自已创建的群组
/// - Parameter groupId: 群组 ID，必填项
/// - Parameter success: 成功回调，无参数
/// - Parameter error: 失败回调，包含错误信息
- (NSInteger)dismissGroup:(NSString *)groupId
              onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 转让群组
/// - Parameter groupId: 群组ID
/// - Parameter newOwnerId: 新群主用户ID
/// - Parameter quitGroup: 是否退出群组
/// - Parameter config: 转让群组配置
- (NSInteger)transferGroupOwner:(NSString *)groupId
                     newOwnerId:(NSString *)newOwnerId
                      quitGroup:(BOOL)quitGroup
                         config:(nullable RCIMIWQuitGroupConfig *)config
                    onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 获取已加入指定群成员信息
/// - Parameter groupId: 群组ID
/// - Parameter userIds: 用户ID列表，一次最多不超过 100 个
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
///
/// - Since: 5.12.0
- (NSInteger)getGroupMembers:(NSString *)groupId
                userIds:(NSArray<NSString *> *)userIds
                success:(nullable void (^)(NSArray<RCIMIWGroupMemberInfo *> *groupMembers))successBlock
                  error:(nullable void (^)(NSInteger errorCode))errorBlock;

/// 分页获取群成员信息
/// - Parameter groupId: 群组ID
/// - Parameter role: 群成员角色
/// - Parameter option: 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 100 条）、是否正序查询（默认按加入群组时间倒序）
/// - Parameter successBlock: 成功回调，此接口不返回分页数据的总条数
/// - Parameter errorBlock: 失败回调
- (NSInteger)getGroupMembersByRole:(NSString *)groupId
                              role:(RCIMIWGroupMemberRole)role
                            option:(RCIMIWPagingQueryOption *)option
                           success:(void (^)(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo *> *result))successBlock
                             error:(void (^)(NSInteger code))errorBlock;

/// 按角色获取已加入群组的资料
/// - Parameter role: 群成员角色
/// - Parameter option: 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 100 条）、是否正序查询（默认倒序）
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
- (NSInteger)getJoinedGroupsByRole:(RCIMIWGroupMemberRole)role
                            option:(RCIMIWPagingQueryOption *)option
                           success:(void (^)(RCIMIWPagingQueryResult<RCIMIWGroupInfo *> *result))successBlock
                             error:(void (^)(NSInteger errorCode))errorBlock;

/// 获取指定已加入群组的资料
/// - Parameter groupIds: 群ID列表，一次最多查询 20 个群组
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
- (NSInteger)getJoinedGroups:(NSArray<NSString *> *)groupIds
                     success:(void (^)(NSArray<RCIMIWGroupInfo *> *groupInfos))successBlock
                       error:(void (^)(NSInteger errorCode))errorBlock;

/// 设置群组备注名
/// - Parameter groupId: 群组ID
/// - Parameter remark: 群备注，字符串长度不超过 64 个字符。传 nil 或 空字符串 表示移除群备注
- (NSInteger)setGroupRemark:(NSString *)groupId
                     remark:(nullable NSString *)remark
                onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 设置群成员资料
/// - Parameter groupId: 群组ID
/// - Parameter userId: 用户ID， 必填项，支持传入当前登录用户 ID
/// - Parameter nickname: 用户昵称，非必填项，长度不超过 64 个字符，传 nil 或 空字符串表示移除用户昵称
/// - Parameter extra: 附加信息，非必填项，长度不超过 128 个字符
- (NSInteger)setGroupMemberInfo:(NSString *)groupId
                         userId:(NSString *)userId
                       nickname:(nullable NSString *)nickname
                          extra:(nullable NSString *)extra
                    onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 按群名称搜索已加入群组的资料
/// - Parameter groupName: 群名称，不能为空最长不超过 64 个字符
/// - Parameter option: 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）
- (NSInteger)searchJoinedGroups:(NSString *)groupName
                         option:(RCIMIWPagingQueryOption *)option
                        success:(void (^)(RCIMIWPagingQueryResult<RCIMIWGroupInfo *> *result))successBlock
                          error:(void (^)(NSInteger errorCode))errorBlock;

/// 根据群成员昵称查询群成员
/// - Parameter groupId: 群组ID
/// - Parameter name: 群成员昵称，必填，不能为空最长不超过 64 个字符。
/// - Parameter option: 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
/// - Note: 优先匹配群成员昵称 nickname，再匹配群成员用户名 name。只要其中一个字段匹配成功，即返回搜索结果。
- (NSInteger)searchGroupMembers:(NSString *)groupId
                           name:(NSString *)name
                         option:(RCIMIWPagingQueryOption *)option
                        success:(void (^)(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo *> *result))successBlock
                          error:(void (^)(NSInteger errorCode))errorBlock;

/// 添加群管理员
/// - Parameter groupId: 群组 ID，必填项
/// - Parameter userIds: 用户 ID 数组，必填项。用户 ID 必须为群成员，一次最多设置 10 个群成员为管理员，管理员上限为 10 个。群主不支持设置为管理员
- (NSInteger)addGroupManagers:(NSString *)groupId
                      userIds:(NSArray<NSString *> *)userIds
                  onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 移除群管理员
/// - Parameter groupId: 群组 ID，必填项
/// - Parameter userIds: 用户 ID 数组，必填项。一次最多操作 10 个管理员
- (NSInteger)removeGroupManagers:(NSString *)groupId
                         userIds:(NSArray<NSString *> *)userIds
                     onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 邀请用户加入群组
/// - Parameter groupId: 群组ID
/// - Parameter userIds: 用户ID列表，一次最多不超过 30 个
/// - Parameter successBlock: 邀请成功回调
/// - Parameter errorBlock: 失败回调
/// - Note:
///
/// **`successBlock` 的 `processCode` 参数说明**
/// - 当群组的 `joinPermission`  为需要群主或管理员审批时，`processCode` 返回 `RC_GROUP_JOIN_GROUP_NEED_MANAGER_ACCEPT` ( 25424 )，表示需要等待群主或管理员审批。
/// - 当群组的 `joinPermission` 为不用验证，同时 `inviteHandlePermission` 为需要被邀请人同意时，`processCode` 返回 `RC_GROUP_NEED_INVITEE_ACCEPT` ( 25427 )，表示需要被邀请人同意后才能进入群组。
- (NSInteger)inviteUsersToGroup:(NSString *)groupId
                        userIds:(NSArray<NSString *> *)userIds
                        success:(void (^)(NSInteger processCode))successBlock
                          error:(void (^)(NSInteger errorCode))errorBlock;

/// 用户同意加入群组
/// - Parameter groupId: 群组ID
/// - Parameter inviterId: 邀请者ID
- (NSInteger)acceptGroupInvite:(NSString *)groupId
                     inviterId:(NSString *)inviterId
                   onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 用户拒绝加入群组
/// - Parameter groupId: 群组ID
/// - Parameter inviterId: 邀请者ID
/// - Parameter reason: 拒绝原因，非必填项，拒绝时可选择是否输入拒绝原因，内容不超过 128 个字符。
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
- (NSInteger)refuseGroupInvite:(NSString *)groupId
                     inviterId:(NSString *)inviterId
                        reason:(nullable NSString *)reason
                   onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 群主或管理员同意用户加入群组
/// - Parameter groupId: 群组 ID
/// - Parameter inviterId: 邀请人用户 ID，非必填，如果是邀请入群，则传邀请人ID；如果是用户主动加群，可以为空。
/// - Parameter applicantId: 申请入群用户 ID
/// - Note:
///
/// **`successBlock` 的 `processCode` 参数说明**
///
/// - 当群组的 `inviteHandlePermission` 为需要被邀请人同意时，若 `processCode` 返回 `RC_GROUP_NEED_INVITEE_ACCEPT` (25427)，表示需等待被邀请人同意方可加入群组。
/// - 当群组的 `inviteHandlePermission` 为无需被邀请人同意时，若 `processCode` 返回 `RC_SUCCESS` (0)，表示被邀请人已成功加入群组。
///
///  以上仅适用于邀请加入群组的情况，当用户主动申请加入群组时，`processCode` 始终为 `RC_SUCCESS` (0)。
- (NSInteger)acceptGroupApplication:(NSString *)groupId
                          inviterId:(nullable NSString *)inviterId
                        applicantId:(NSString *)applicantId
                            success:(void (^)(NSInteger processCode))successBlock
                              error:(void (^)(NSInteger errorCode))errorBlock;

/// 群主或管理员拒绝用户加入群组
/// - Parameter groupId: 群组ID
/// - Parameter inviterId: 邀请人用户 ID ，非必填，如果是邀请入群，则传邀请人ID；如果是主动加群，可以为空。
/// - Parameter applicantId: 申请者ID
/// - Parameter reason: 拒绝原因，内容不超过 128 个字符。
- (NSInteger)refuseGroupApplication:(NSString *)groupId
                          inviterId:(nullable NSString *)inviterId
                        applicantId:(NSString *)applicantId
                             reason:(nullable NSString *)reason
                        onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;


/// 分页获取群组申请列表
/// - Parameter option: 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）
/// - Parameter directions: 申请方向 `RCGroupApplicationDirection` 数组
/// - Parameter status: 状态类型 `RCGroupApplicationStatus` 数组
/// - Parameter successBlock: 成功回调，此接口不支持返回请求总数。
/// - Parameter errorBlock: 失败回调
- (NSInteger)getGroupApplications:(RCIMIWPagingQueryOption *)option
                       directions:(NSArray<NSNumber *> *)directions
                           status:(NSArray<NSNumber *> *)status
                          success:(void (^)(RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo *> *result))successBlock
                            error:(void (^)(NSInteger errorCode))errorBlock;

/// 添加群组特别关注用户
/// - Parameter groupId: 群组ID
/// - Parameter userIds: 用户ID列表，单次最多关注 100 个用户
- (NSInteger)addGroupFollows:(NSString *)groupId
                userIds:(NSArray<NSString *> *)userIds
                 onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 删除群组特别关注用户
/// - Parameter groupId: 群组ID
/// - Parameter userIds: 用户ID列表，单次取消关注 100 个用户
- (NSInteger)removeGroupFollows:(NSString *)groupId
                   userIds:(NSArray<NSString *> *)userIds
                    onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;

/// 获取群组特别关注用户
/// - Parameter groupId: 群组ID
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
- (NSInteger)getGroupFollows:(NSString *)groupId
                success:(void (^)(NSArray<RCIMIWFollowInfo *> *followInfos))successBlock
                  error:(void (^)(NSInteger errorCode))errorBlock;

#pragma mark - 翻译功能

/// 批量翻译文本消息
/// - Parameter params: 翻译的消息参数
/// - Parameter completionHandler: 结果回调
/// - Since: 5.24.0
- (NSInteger)translateMessagesWithParams:(RCIMIWTranslateMessagesParams *)params
                       completionHandler:(nullable void (^)(NSInteger code))completionHandler;

/// 批量翻译文本内容
/// - Parameter params: 翻译的文本参数
/// - Parameter completionHandler: 结果回调
/// - Since: 5.24.0
- (NSInteger)translateTextsWithParams:(RCIMIWTranslateTextParams *)params
                    completionHandler:(nullable void (^)(NSInteger code))completionHandler;

/// 设置用户级别的翻译语言
/// - Parameter language: 语言
/// - Parameter completionHandler: 结果回调
/// - Note: 设置的 `language`，请使用开发者文档中支持的语言设置
/// - Since: 5.24.0
- (NSInteger)setTranslationLanguage:(NSString *)language
                  completionHandler:(void (^)(NSInteger code))completionHandler;

/// 获取用户级别的翻译语言
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
/// - Since: 5.24.0
- (NSInteger)getTranslationLanguage:(nullable void (^)(NSString *language))successBlock
                              error:(nullable void (^)(NSInteger code))errorBlock;

/// 设置用户级别的自动翻译是否开启
/// - Parameter isEnable: 是否自动翻译
/// - Parameter completionHandler: 结果回调
/// - Since: 5.24.0
- (NSInteger)setAutoTranslateEnable:(BOOL)isEnable
                 completionHandler:(void (^)(NSInteger code))completionHandler;

/// 获取用户级别的自动翻译是否开启
/// - Parameter successBlock: 成功回调
/// - Parameter errorBlock: 失败回调
/// - Since: 5.24.0
- (NSInteger)getAutoTranslateEnabled:(nullable void (^)(BOOL isEnable))successBlock
                               error:(nullable void (^)(NSInteger code))errorBlock;

/// 批量设置会话翻译策略
/// - Parameter types: 会话类型列表
/// - Parameter targetIds: 会话ID列表
/// - Parameter channelIds: 频道ID列表
/// - Parameter strategy: 翻译策略
/// - Parameter completionHandler: 结果回调
/// - Since: 5.24.0
- (NSInteger)batchSetConversationTranslateStrategy:(NSArray<NSNumber *> *)types
                                          targetIds:(NSArray<NSString *> *)targetIds
                                          channelIds:(NSArray<NSString *> *)channelIds
                                           strategy:(RCIMIWTranslateStrategy)strategy
                                  completionHandler:(void (^)(NSInteger code))completionHandler;

/// 计算文本MD5值
/// - Parameter text: 需要计算MD5的文本
/// - Returns: MD5字符串，计算失败返回nil
/// - Since: 5.24.0
- (nullable NSString *)calculateTextMD5:(NSString *)text;

///// 创建本地会话
///// - Parameters:
/////   - type: 会话类型
/////   - targetId: 会话ID
/////   - onCompletedBlock: 回调
//- (NSInteger)createConversation:(RCIMIWConversationType)type
//                       targetId:(NSString *) targetId
//                    onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;
//
///// 更新会话操作时间
///// - Parameters:
/////   - type: 会话类型
/////   - targetId: 会话ID
/////   - timestamp: 操作时间戳（精确到毫秒）
/////   - onCompletedBlock: 回调
//- (NSInteger)updateConversationTime:(RCIMIWConversationType)type
//                           targetId:(NSString *)targetId
//                      operationTime:(long)timestamp
//                        onCompleted:(nullable void (^)(NSInteger code))onCompletedBlock;
//
///// 查询用户是否在群组中（仅支持本地数据查询）
///// - Parameters:
/////   - groupId: 群组ID
/////   - userIds: 用户ID数组（最大上限100个）
/////   - successBlock: 已在群组中的用户ID数组的回调
/////   - errorBlock: 失败回调
//- (NSInteger)checkUsersInGroup:(NSString *)groupId
//                  userIds:(NSArray <NSString *>*)userIds
//                  success:(nullable void (^)(NSArray <NSString *> * existUserIds))successBlock
//                    error:(nullable void (^)(NSInteger code))errorBlock;

#pragma mark - 订阅功能

/*!
 订阅事件
 
 @param request 订阅请求对象，包含订阅类型、有效期和用户ID列表
 @param successBlock 成功回调
 @param errorBlock 失败回调, 返回状态码和失败的用户ID列表
 */
- (NSInteger)subscribeEvent:(RCIMIWSubscribeEventRequest *)request
                    success:(void (^)(void))successBlock
                      error:(void (^)(NSInteger code, NSArray<NSString *> * _Nullable failedUserIds))errorBlock;

/*!
 取消订阅事件
 
 @param request 取消订阅请求对象，包含订阅类型和用户ID列表
 @param successBlock 成功回调
 @param errorBlock 失败回调, 返回状态码和失败的用户ID列表
 */
- (NSInteger)unSubscribeEvent:(RCIMIWSubscribeEventRequest *)request
                      success:(void (^)(void))successBlock
                        error:(void (^)(NSInteger code, NSArray<NSString *> * _Nullable failedUserIds))errorBlock;

/*!
 查询订阅事件
 
 @param request 查询请求对象，包含订阅类型和用户ID列表
 @param successBlock 成功回调，返回订阅事件信息列表
 @param errorBlock 失败回调, 返回状态码
 */
- (NSInteger)querySubscribeEvent:(RCIMIWSubscribeEventRequest *)request
                         success:(void (^)(NSArray<RCIMIWSubscribeInfoEvent *> * _Nullable subscribeEvents))successBlock
                           error:(void (^)(NSInteger code))errorBlock;

/*!
 分页查询订阅事件
 
 @param request 查询请求对象，包含订阅类型和用户ID列表
 @Param pageSize 分页大小 [1~200]。
 @Param startIndex 第一页传 0，下一页取返回所有数据的数组数量（比如 pageSize = 20，第二页传 20，第三页传 40）。
 @param successBlock 成功回调，返回订阅事件信息列表
 @param errorBlock 失败回调, 返回状态码
 */
- (NSInteger)querySubscribeEventByPage:(RCIMIWSubscribeEventRequest *)request
                              pageSize:(NSInteger)pageSize
                            startIndex:(NSInteger)startIndex
                              success:(void (^)(NSArray<RCIMIWSubscribeInfoEvent *> * _Nullable subscribeEvents))successBlock
                                error:(void (^)(NSInteger code))errorBlock;

@end

NS_ASSUME_NONNULL_END
