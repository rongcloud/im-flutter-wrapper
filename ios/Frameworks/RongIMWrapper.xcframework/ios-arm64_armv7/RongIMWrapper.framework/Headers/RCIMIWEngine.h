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

- (NSInteger)connect:(NSString *)token timeout:(int)timeout;

- (NSInteger)disconnect:(BOOL)receivePush;

#pragma mark - 消息创建

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

- (NSInteger)sendMessage:(RCIMIWMessage *)message;

- (NSInteger)sendMediaMessage:(RCIMIWMediaMessage *)message;

- (NSInteger)cancelSendingMediaMessage:(RCIMIWMediaMessage *)message;

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
- (NSInteger)sendGroupMessageToDesignatedUsers:(RCIMIWMessage *)message userIds:(NSArray<NSString *> *)userIds;

#pragma mark - 下载媒体消息

- (NSInteger)downloadMediaMessage:(RCIMIWMediaMessage *)message;

- (NSInteger)cancelDownloadingMediaMessage:(RCIMIWMediaMessage *)message;

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
                channelId:(nullable NSString *)channelId
                 sentTime:(long long)sentTime
                    order:(RCIMIWTimeOrder)order
                    count:(int)count;

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
                channelId:(nullable NSString *)channelId
                 sentTime:(long long)sentTime
                    order:(RCIMIWTimeOrder)order
                   policy:(RCIMIWMessageOperationPolicy)policy
                    count:(int)count;

- (NSInteger)loadUnreadMentionedMessages:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(nullable NSString *)channelId;

- (NSInteger)loadFirstUnreadMessage:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(nullable NSString *)channelId;

- (void)getMessageById:(long)messageId
               success:(void (^)(RCIMIWMessage *message))success
                 error:(void (^)(NSInteger code))error;

- (void)getMessageByUId:(NSString *)messageUId
                success:(void (^)(RCIMIWMessage *message))success
                  error:(void (^)(NSInteger code))error;

#pragma mark - 插入消息

/*!
 插入一条消息，
 可设置消息的方向（messageDirection）为 发送（RCIMIWMessageDirectionSend）或 接收（RCIMIWMessageDirectionReceive），
 同时 必须 设置消息方向对应的 发送状态（sentStatus）或 接收状态（receivedStatus）
 
 @param message 默认创建出来 message 的 messageDirection 是 RCIMIWMessageDirectionSend
 @return 接口调用状态
 */
- (NSInteger)insertMessage:(RCIMIWMessage *)message;

- (NSInteger)insertMessages:(NSArray<RCIMIWMessage *> *)messages;

#pragma mark - 删除消息
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
                 timestamp:(long long)timestamp;

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
                    policy:(RCIMIWMessageOperationPolicy)policy;

- (NSInteger)deleteLocalMessages:(NSArray<RCIMIWMessage *> *)messages;

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
                   messages:(NSArray<RCIMIWMessage *> *)messages;

#pragma mark - 撤回消息

- (NSInteger)recallMessage:(RCIMIWMessage *)message;

/*!
 发送某个单聊会话中消息阅读的回执
 
 @discussion 此接口只支持单聊。收到远端消息已读回执之后，会回调 delegate 中的 onRemoteConversationReadStatusSynced 方法。
 */
- (NSInteger)sendPrivateReadReceiptMessage:(NSString *)targetId
                                 channelId:(nullable NSString *)channelId
                                 timestamp:(long long)timestamp;

#pragma mark - 消息扩展

- (NSInteger)updateMessageExpansion:(NSString *)messageUId
                          expansion:(NSDictionary<NSString *, NSString *> *)expansion;

- (NSInteger)removeMessageExpansionForKeys:(NSString *)messageUId keys:(NSArray<NSString *> *)keys;

#pragma mark - 修改消息接收、发送状态

- (NSInteger)changeMessageReceiveStatus:(long)messageId receivedStatus:(RCIMIWReceivedStatus)receivedStatus;

- (NSInteger)changeMessageSentStatus:(long)messageId sentStatus:(RCIMIWSentStatus)sentStatus;

#pragma mark - 会话

/*!
 获取单个会话数据
 
 */
- (NSInteger)loadConversation:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId;

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
                         count:(int)count;

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
                      channelId:(nullable NSString *)channelId;

/*!
 删除指定类型的会话
 
 @param conversationTypes  会话类型的数组(需要将 RCConversationType 转为 NSNumber 构建 NSArray)
 @param channelId          所属会话的业务标识
 @return                   接口调用状态
 
 @discussion 此方法会从本地存储中删除该会话，同时删除会话中的消息。
 
 @discussion 此方法不支持超级群的会话类型，包含超级群时可能会造成数据异常。
 
 @remarks 会话
 */
- (NSInteger)removeConversations:(NSArray<NSNumber *> *)conversationTypes channelId:(nullable NSString *)channelId;

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
                    channelId:(nullable NSString *)channelId;

#pragma mark - 会话未读数

- (NSInteger)loadTotalUnreadCount:(NSString *)channelId;

- (NSInteger)loadUnreadCount:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(nullable NSString *)channelId;

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
                                        contain:(BOOL)contain;
/*!
 获取会话中@提醒自己的消息
 
 @discussion 此接口仅支持  RCIMIWConversationTypeGroup、 RCIMIWConversationTypeUltraGroup
 */
- (NSInteger)loadUnreadMentionedCount:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(nullable NSString *)channelId;

/*!
 清除某个会话中的未读消息数
 
 @param type            会话类型，不支持聊天室
 @param targetId   会话 ID
 @param timestamp 该会话已阅读的最后一条消息的发送时间戳 （该会话在时间戳 timestamp 之前的消息将被置成已读，传 0 表示 清除某个会话中的所有未读消息数）
 */
- (NSInteger)clearUnreadCount:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
                    timestamp:(long long)timestamp;

#pragma mark - 会话草稿

/*!
 保存草稿信息（用户输入但未发送的暂存消息）
 
 @param type        会话类型
 @param targetId    会话 ID
 @param draft       草稿信息
 */
- (NSInteger)saveDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId
                        draft:(NSString *)draft;

- (NSInteger)loadDraftMessage:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(nullable NSString *)channelId;

- (NSInteger)clearDraftMessage:(RCIMIWConversationType)type
                      targetId:(NSString *)targetId
                     channelId:(nullable NSString *)channelId;

#pragma mark - 会话免打扰

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
                                           level:(RCIMIWPushNotificationLevel)level;

- (NSInteger)loadConversationNotificationLevel:(RCIMIWConversationType)type
                                      targetId:(NSString *)targetId
                                     channelId:(nullable NSString *)channelId;

- (NSInteger)loadBlockedConversations:(NSArray<NSNumber *> *)conversationTypes
                            channelId:(nullable NSString *)channelId;

/**
 * 设置会话类型免打扰
 * @param type      会话类型
 * @param level    消息通知级别
 * @discussion 如要移除消息提醒状态，设置 level 为 RCIMIWPushNotificationLevelDefault
 */

- (NSInteger)changeConversationTypeNotificationLevel:(RCIMIWConversationType)type
                                               level:(RCIMIWPushNotificationLevel)level;
/**
 * 获取会话类型的消息提醒状态
 * @param type            会话类型
 */
- (NSInteger)loadConversationTypeNotificationLevel:(RCIMIWConversationType)type;

#pragma mark - 会话置顶

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
                                     top:(BOOL)top;
/**
 *
 * @param type           会话类型
 * @param targetId  会话 ID
 * @return         接口调用状态码
 */
- (NSInteger)loadConversationTopStatus:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(nullable NSString *)channelId;

/*!
 获取置顶的会话列表
 
 @param conversationTypes 会话类型的数组（ 需要将 RCIMIWConversationType 转为 NSNumber 构建 NSArray ）
 @return                  接口调用状态
 
 @discussion 此方法会从本地数据库中，读取置顶的会话列表。
 
 @remarks 会话列表
 */
- (NSInteger)loadTopConversations:(NSArray<NSNumber *> *)conversationTypes
                        channelId:(nullable NSString *)channelId;

#pragma mark - 多端状态同步
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
                              timestamp:(long long)timestamp;

#pragma mark - 聊天室

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
               autoCreate:(BOOL)autoCreate;

- (NSInteger)leaveChatRoom:(NSString *)targetId;

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
                            count:(int)count;

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
                    overwrite:(BOOL)overwrite;

- (NSInteger)addChatRoomEntries:(NSString *)targetId
                        entries:(NSDictionary<NSString *, NSString *> *)entries
                 deleteWhenLeft:(BOOL)deleteWhenLeft
                      overwrite:(BOOL)overwrite;

- (NSInteger)loadChatRoomEntry:(NSString *)targetId key:(NSString *)key;

- (NSInteger)loadAllChatRoomEntries:(NSString *)targetId;

- (NSInteger)removeChatRoomEntry:(NSString *)targetId
                             key:(NSString *)key
                           force:(BOOL)force;

- (NSInteger)removeChatRoomEntries:(NSString *)targetId
                              keys:(NSArray<NSString *> *)keys
                             force:(BOOL)force;

#pragma mark - 用户管理

- (NSInteger)addToBlacklist:(NSString *)userId;

- (NSInteger)removeFromBlacklist:(NSString *)userId;

- (NSInteger)loadBlacklist;

- (NSInteger)loadBlacklistStatus:(NSString *)userId;

#pragma mark - 搜索消息

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
                      count:(int)count;

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
                                 count:(int)count;

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
                              count:(int)count;

#pragma mark - 群聊回执

- (NSInteger)sendGroupReadReceiptRequest:(RCIMIWMessage *)message;

- (NSInteger)sendGroupReadReceiptResponse:(NSString *)targetId
                                channelId:(nullable NSString *)channelId
                                 messages:(NSArray<RCIMIWMessage *> *)messages;

- (NSInteger)searchConversations:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(nullable NSString *)channelId
                    messageTypes:(NSArray<NSNumber *> *)messageTypes
                         keyword:(NSString *)keyword;

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
 @param spanMins        需要消息免打扰分钟数，0 < spanMins < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为
 23：59，则 spanMins 为 23 * 60 + 59 = 1439 分钟。）
 @param level  传递 RCPushNotificationQuietHoursLevelDefault 表示移除免打扰
 */
- (NSInteger)changeNotificationQuietHours:(NSString *)startTime
                                 spanMins:(int)spanMins
                                    level:(RCIMIWPushNotificationQuietHoursLevel)level;

- (NSInteger)loadNotificationQuietHours;

- (NSInteger)removeNotificationQuietHours;

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
- (NSInteger)changePushContentShowStatus:(BOOL)showContent;

/**
 设置推送内容的自然语言
 
 @param language             通过 SDK 设置的语言环境，语言缩写内容格式为 (ISO-639 Language Code)_(ISO-3166 Country Codes)，如：zh_CN。目前融云支持的内置推送语言为 zh_CN、en_US、ar_SA
 */
- (NSInteger)changePushLanguage:(NSString *)language;

/*!
 设置 Web 端在线时，手机端是否接收推送
 
 @param receive     是否接收推送（ YES 接收 NO 不接收）
 */
- (NSInteger)changePushReceiveStatus:(BOOL)receive;

#pragma mark - 超级群

- (NSInteger)syncUltraGroupReadStatus:(NSString *)targetId
                            channelId:(nullable NSString *)channelId
                            timestamp:(long long)timestamp;

- (NSInteger)loadConversationsForAllChannel:(RCIMIWConversationType)type
                                   targetId:(NSString *) targetId;

/**
 消息修改
 
 @param messageUId  将被修改的消息id
 @param message         将被修改的消息
 
 @discussion
 此方法只能修改相同频道的同类型消息，仅能修改自己发送的消息
 */
- (NSInteger)modifyUltraGroupMessage:(NSString *)messageUId message:(RCIMIWMessage *)message;

/*!
 撤回消息
 
 @param message                 需要撤回的消息
 @param deleteRemote     是否移除远端消息记录，YES: 移除远端消息记录， NO：不移除远端消息记录
 */
- (NSInteger)recallUltraGroupMessage:(RCIMIWMessage *)message deleteRemote:(BOOL)deleteRemote;

- (NSInteger)clearUltraGroupMessages:(NSString *)targetId
                           channelId:(nullable NSString *)channelId
                           timestamp:(long long)timestamp
                              policy:(RCIMIWMessageOperationPolicy)policy;

- (NSInteger)sendUltraGroupTypingStatus:(NSString *)targetId
                              channelId:(nullable NSString *)channelId
                           typingStatus:(RCIMIWUltraGroupTypingStatus)typingStatus;

- (NSInteger)clearUltraGroupMessagesForAllChannel:(NSString *)targetId
                                        timestamp:(long long)timestamp;

/*!
 获取同一个超级群下的批量服务消息（含所有频道）
 
 @param messages      消息列表
 @remarks 高级功能
 */
- (NSInteger)loadBatchRemoteUltraGroupMessages:(NSArray<RCIMIWMessage *> *)messages;

- (NSInteger)updateUltraGroupMessageExpansion:(NSString *)messageUId expansion:(NSDictionary<NSString *, NSString *> *)expansion;

- (NSInteger)removeUltraGroupMessageExpansion:(NSString *)messageUId
                                         keys:(NSArray<NSString *> *)keys;

/*!
 设置超级群的默认消息状态
 
 @param targetId                    会话 ID
 @param level                       消息通知级别
 */
- (NSInteger)changeUltraGroupDefaultNotificationLevel:(NSString *)targetId
                                                level:(RCIMIWPushNotificationLevel)level;

/*!
 获取超级群的默认消息状态
 
 @param targetId                    会话 ID
 */
- (NSInteger)loadUltraGroupDefaultNotificationLevel:(NSString *)targetId;

/*!
 设置超级群频道的默认消息状态
 
 @param targetId                    会话 ID
 @param channelId                   频道 ID
 @param level                       消息通知级别
 */
- (NSInteger)changeUltraGroupChannelDefaultNotificationLevel:(NSString *)targetId
                                                   channelId:(nullable NSString *)channelId
                                                       level:(RCIMIWPushNotificationLevel)level;

/*!
 获取超级群频道的默认消息状态
 
 @param targetId                    会话 ID
 @param channelId                   频道 ID
 */
- (NSInteger)loadUltraGroupChannelDefaultNotificationLevel:(NSString *)targetId
                                                 channelId:(nullable NSString *)channelId;
// 获取所有会话的未读消息数
- (NSInteger)loadUltraGroupAllUnreadCount;
// 获取所有会话的未读 @ 消息数
- (NSInteger)loadUltraGroupAllUnreadMentionedCount;
// 获取指定会话的未读消息数
- (NSInteger)loadUltraGroupUnreadCount:(NSString *)targetId;
// 获取指定会话的未读 @ 消息数
- (NSInteger)loadUltraGroupUnreadMentionedCount:(NSString *)targetId;

@end

NS_ASSUME_NONNULL_END
