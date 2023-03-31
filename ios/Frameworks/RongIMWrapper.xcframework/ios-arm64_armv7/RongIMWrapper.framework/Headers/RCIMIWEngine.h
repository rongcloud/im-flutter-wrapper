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
#import <RongIMWrapper/RCIMIWEngineDelegate.h>
#import <RongIMWrapper/RCIMIWDefines.h>

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

#pragma mark - 消息创建/注册

- (NSInteger)registerCustomMessage:(NSArray<Class> *)messageContentClassList;

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

- (NSInteger)changeMessageSentStatus:(long)messageId
                          sentStatus:(RCIMIWSentStatus)sentStatus
__deprecated_msg("Use [RCIMIWEngine changeMessageSentStatus:sentStatus:messageSentStatusChanged:] instead");

- (NSInteger)changeMessageSentStatus:(long)messageId
                          sentStatus:(RCIMIWSentStatus)sentStatus
            messageSentStatusChanged:(nullable void (^)(NSInteger code))messageSentStatusChangedBlock;

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
//- (NSInteger)createTag:(NSString *)tagId tagName:(NSString *)tagName;
//
//- (NSInteger)removeTag:(NSString *)tagId;
//
//- (NSInteger)updateTagNameById:(NSString *)tagId newName:(NSString *)newName;
//
//- (NSInteger)loadTags;
//
//- (NSInteger)addConversationsToTag:(NSString *)tagId
//                  conversationType:(RCIMIWConversationType)type
//                          targetId:(NSString *)targetId;
//
///*!
// 从指定标签移除会话
// */
//- (NSInteger)removeConversationsFromTag:(NSString *)tagId
//                       conversationType: (RCIMIWConversationType)type
//                               targetId:(NSString *)targetId;
//
///*!
// 删除指定会话中的某些标签
// */
//- (NSInteger)removeTagsFromConversation:(RCIMIWConversationType)type
//                               targetId:(NSString *)targetId
//                                 tagIds:(NSArray<NSString *> *)tagIds;
//
//- (NSInteger)loadTagsFromConversation:(RCIMIWConversationType)type targetId:(NSString *)targetId;
//
//- (NSInteger)loadConversationsFromTagByPage:(NSString *)tagId
//                                  timestamp:(long long)timestamp
//                                      count:(int)count;
//
//- (NSInteger)loadUnreadCountByTag:(NSString *)tagId containBlocked:(BOOL)containBlocked;
//
//- (NSInteger)changeConversationTopStatusInTag:(NSString *)tagId conversationType:(RCIMIWConversationType)type targetId:(NSString *)targetId top:(BOOL)top;
//
//- (NSInteger)loadConversationTopStatusInTag:(NSString *)tagId conversationType:(RCIMIWConversationType)type targetId:(NSString *)targetId;
//
//- (NSInteger)clearMessagesUnreadStatusByTag:(NSString *)tagId;
//
///*!
// @param deleteMessage 是否清除本地历史消息
// */
//- (NSInteger)clearConversationsByTag:(NSString *)tagId deleteMessage:(BOOL)deleteMessage;

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

@end

NS_ASSUME_NONNULL_END
