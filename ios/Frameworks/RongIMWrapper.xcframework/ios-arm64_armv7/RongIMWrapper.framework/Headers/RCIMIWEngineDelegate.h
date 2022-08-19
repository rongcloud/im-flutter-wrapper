//
//  RCIMIWEngineDelegate.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/15/22.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWConversation.h>
#import <RongIMWrapper/RCIMIWChatRoomMemberAction.h>
#import <RongIMWrapper/RCIMIWDefines.h>

@class RCIMIWMessage;
@class RCIMIWMediaMessage;
@class RCIMIWConversation;
@class RCIMIWTypingStatus;
@class RCIMIWTagInfo;
@class RCIMIWConversationTagInfo;
@class RCIMIWBlockedMessageInfo;
@class RCIMIWUltraGroupTypingStatusInfo;
@class RCIMIWSearchConversationResult;

#ifndef RCIMIWEngineDelegate_h
#define RCIMIWEngineDelegate_h

NS_ASSUME_NONNULL_BEGIN

@protocol RCIMIWEngineDelegate <NSObject>

@optional

#pragma mark - 事件监听

/*!
 连接状态监听
 */
- (void)onConnectionStatusChanged:(RCIMIWConnectionStatus)status;

/*!
接收消息的回调方法

@param message 当前接收到的消息
@param left 还剩余的未接收的消息数，left>=0
@param offline 是否是离线消息
@param hasPackage SDK 拉取服务器的消息以包(package)的形式批量拉取，有 package 存在就意味着远端服务器还有消息尚未被 SDK
拉取
@discussion 和上面的 - (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object 功能完全一致，额外把
offline 和 hasPackage 参数暴露，开发者可以根据 nLeft、offline、hasPackage 来决定何时的时机刷新 UI ；建议当 hasPackage=0
并且 nLeft=0 时刷新 UI
@warning 如果使用此方法，那么就不能再使用 RCIM 中 - (void)onReceived:(RCMessage *)message left:(int)nLeft
object:(id)object 的使用，否则会出现重复操作的情形
*/
- (void)onMessageReceived:(RCIMIWMessage *)message
                     left:(NSInteger)left
                  offline:(BOOL)offline
               hasPackage:(BOOL)hasPackage;

#pragma mark - 接口调用回调

- (void)onConnected:(NSInteger)code userId:(nullable NSString *)userId;

- (void)onDatabaseOpened:(NSInteger)code;
// 消息插入本地数据库
- (void)onMessageAttached:(RCIMIWMessage *)message;

- (void)onMediaMessageAttached:(RCIMIWMediaMessage *)message;

- (void)onMessageSent:(NSInteger)code message:(nullable RCIMIWMessage *)message;

- (void)onMediaMessageSent:(NSInteger)code message:(RCIMIWMediaMessage *)message;

- (void)onMediaMessageSending:(RCIMIWMediaMessage*)message progress:(int)progress;

- (void)onSendingMediaMessageCanceled:(NSInteger)code message:(RCIMIWMediaMessage *)message;

- (void)onMediaMessageDownloading:(RCIMIWMediaMessage *)message progress:(int)progress;

- (void)onMediaMessageDownloaded:(NSInteger)code message:(RCIMIWMediaMessage *)message;

- (void)onDownloadingMediaMessageCanceled:(NSInteger)code message:(RCIMIWMediaMessage *)message;

- (void)onGroupMessageToDesignatedUsersAttached:(RCIMIWMessage *)message;

- (void)onGroupMessageToDesignatedUsersSent:(NSInteger)code message:(RCIMIWMessage *)message;

#pragma mark - 获取历史消息

- (void)onMessagesLoaded:(NSInteger)code
                    type:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
               channelId:(NSString *)channelId
                sentTime:(long long)sentTime
                   order:(RCIMIWTimeOrder)order
                messages:(nullable NSArray<RCIMIWMessage *> *)messages;

- (void)onUnreadMentionedMessagesLoaded:(NSInteger)code
                                   type:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                              channelId:(NSString *)channelId
                               messages:(NSArray<RCIMIWMessage *> *)messages;

- (void)onFirstUnreadMessageLoaded:(NSInteger)code
                              type:(RCIMIWConversationType)type
                          targetId:(NSString *)targetId
                         channelId:(NSString *)channelId
                           message:(RCIMIWMessage *)message;

#pragma mark - 插入消息

- (void)onMessageInserted:(NSInteger)code message:(RCIMIWMessage *)message;

/*!
 批量插入消息
 */
- (void)onMessagesInserted:(NSInteger)code messages:(NSArray<RCIMIWMessage *> *)messages;

#pragma mark - 删除消息

- (void)onMessageCleared:(NSInteger)code
                    type:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
               channelId:(NSString *)channelId
              timestamp:(long long)recordTime;

- (void)onLocalMessagesDeleted:(NSInteger)code messages:(NSArray<RCIMIWMessage *> *)messages;

- (void)onMessagesDeleted:(NSInteger)code
                     type:(RCIMIWConversationType)type
                 targetId:(NSString *)targetId
                channelId:(NSString *)channelId
                 messages:(NSArray<RCIMIWMessage *> *)messages;

#pragma mark - 撤回消息

/*!
 本端调用撤回消息的回调
 */
- (void)onMessageRecalled:(NSInteger)code message:(RCIMIWMessage *)message;

/*!
 远端撤回消息
 */
- (void)onRemoteMessageRecalled:(RCIMIWMessage *)message;

- (void)onPrivateReadReceiptMessageSent:(NSInteger)code
                               targetId:(NSString *)targetId
                              channelId:(NSString *)channelId
                              timestamp:(long long)timestamp;

- (void)onMessageExpansionUpdated:(NSInteger)code
                       messageUId:(NSString *)messageUId
                        expansion:(NSDictionary<NSString *, NSString *> *)expansion;

- (void)onMessageExpansionForKeysRemoved:(NSInteger)code
                              messageUId:(NSString *)messageUId
                                    keys:(NSArray<NSString *> *)keys;
/**
 远端更改消息扩展信息的回调

 @param expansion 消息扩展信息中更新的键值对
 @param message 消息

 @discussion expansionDic 只包含更新的键值对，不是全部的数据。如果想获取全部的键值对，请使用 message 的 expansion 属性。
*/
- (void)onRemoteMessageExpansionUpdated:(NSDictionary<NSString *,NSString *> *)expansion message:(RCIMIWMessage *)message;

/**
 远端删除消息扩展信息的回调
 */
- (void)onRemoteMessageExpansionForKeyRemoved:(RCIMIWMessage *)message keys:(NSArray<NSString *> *)keys;

- (void)onMessageReceiveStatusChanged:(NSInteger)code messageId:(long)messageId;

- (void)onMessageSentStatusChanged:(NSInteger)code messageId:(long)messageId;

- (void)onMessageBlocked:(RCIMIWBlockedMessageInfo *)info;

#pragma mark - Conversation

- (void)onConversationLoaded:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                conversation:(nullable RCIMIWConversation *)conversation;

- (void)onConversationsLoaded:(NSInteger)code
            conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                    channelId:(NSString *)channelId
                    startTime:(long long)startTime
                        count:(int)count
                conversations:(NSArray<RCIMIWConversation *> *)conversations;

- (void)onConversationRemoved:(NSInteger)code
                         type:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(NSString *)channelId;

- (void)onConversationsRemoved:(NSInteger)code
             conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                     channelId:(NSString *)channelId;

- (void)onMessageCountLoaded:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                       count:(int)count;

- (void)onTotalUnreadCountLoaded:(NSInteger)code channelId:(NSString *)channelId count:(NSInteger)count;

- (void)onUnreadCountLoaded:(NSInteger)code
                       type:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(NSString *)channelId
                      count:(NSInteger)count;

- (void)onUnreadCountByConversationTypesLoaded:(NSInteger)code
                             conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                                     channelId:(NSString *)channelId
                                       contain:(BOOL)contain
                                         count:(NSInteger)count;

- (void)onUnreadMentionedCountLoaded:(NSInteger)code
                                type:(RCIMIWConversationType)type
                            targetId:(NSString *)targetId
                           channelId:(NSString *)channelId
                               count:(NSInteger)count;


- (void)onUnreadCountCleared:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                   timestamp:(long long)timestamp;

#pragma mark - 会话草稿

- (void)onDraftMessageSaved:(NSInteger)code
                       type:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(NSString *)channelId
                      draft:(NSString *)draft;

- (void)onDraftMessageLoaded:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                       draft:(NSString *)draft;

- (void)onDraftMessageCleared:(NSInteger)code
                         type:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(NSString *)channelId;

#pragma mark - 会话免打扰

- (void)onConversationNotificationLevelChanged:(NSInteger)code
                                           type:(RCIMIWConversationType)type
                                       targetId:(NSString *)targetId
                                      channelId:(NSString *)channelId
                                         level:(RCIMIWPushNotificationLevel)level;

- (void)onConversationNotificationLevelLoaded:(NSInteger)code
                                          type:(RCIMIWConversationType)type
                                      targetId:(NSString *)targetId
                                     channelId:(NSString *)channelId
                                         level:(RCIMIWPushNotificationLevel)level;

- (void)onBlockedConversationsLoaded:(NSInteger)code
                   conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                           channelId:(NSString *)channelId
                       conversations:(nullable NSArray<RCIMIWConversation *> *)conversations;

// 暂时注释，原生功能还未开发完成
//- (void)onConversationNotificationStatusSynced:(RCIMIWConversationType)type
//                                      targetId:(NSString *)targetId
//                                     channelId:(NSString *)channelId
//                                        status:(RCIMIWNotificationStatus)status;

- (void)onConversationTypeNotificationLevelChanged:(NSInteger)code
                                              type:(RCIMIWConversationType)type
                                             level:(RCIMIWPushNotificationLevel)level;

- (void)onConversationTypeNotificationLevelLoaded:(NSInteger)code
                                             type:(RCIMIWConversationType)type
                                             level:(RCIMIWPushNotificationLevel)level;

#pragma mark - 会话置顶

- (void)onConversationTopStatusChanged:(NSInteger)code
                                  type:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(NSString *)channelId
                                   top:(BOOL)top;

- (void)onConversationTopStatusLoaded:(NSInteger)code
                                 type:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(NSString *)channelId
                                  top:(BOOL)top;

- (void)onTopConversationsLoaded:(NSInteger)code
               conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(NSString *)channelId
                   conversations:(nullable NSArray<RCIMIWConversation *> *)conversations;

- (void)onConversationTopStatusSynced:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(NSString *)channelId
                                  top:(BOOL)top;


#pragma mark - 多端状态同步

- (void)onConversationReadStatusSynced:(NSInteger)code
                                  type:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(NSString *)channelId
                             timestamp:(long long)timestamp;

#pragma mark - 单聊回执

- (void)onPrivateReadReceiptReceived:(NSString *)targetId
                           channelId:(NSString *)channelId
                           timestamp:(long long)timestamp;

/**
 * 收到自己登录的其他端消息同步阅读状态
 * @param type      会话类型
 * @param targetId  目标 ID
 * 消息时间戳，表示小于或等于此时间戳之前的消息为已读
 */
- (void)onConversationReadStatusSyncMessageReceived:(RCIMIWConversationType)type
                                           targetId:(NSString *)targetId
                                          timestamp:(long long)timestamp;

#pragma mark - 群聊回执

/*!
  发起回执请求
 */
- (void)onGroupReadReceiptRequestSent:(NSInteger)code message:(RCIMIWMessage *)message;

/*!
  发起回执响应
 */
- (void)onGroupReadReceiptResponseSent:(NSInteger)code
                              targetId:(NSString *)targetId
                             channelId:(NSString *)channelId
                              messages:(NSArray <RCIMIWMessage *> *)messages;

/*!
  群聊消息回执请求监听
 */
- (void)onGroupMessageReadReceiptRequestReceived:(NSString *)targetId messageUId:(NSString *)messageUId;

/*!
  群聊消息回执响应监听
 */
- (void)onGroupMessageReadReceiptResponseReceived:(NSString *)targetId messageUId:(NSString *)messageUId respondUserIds:(NSDictionary<NSString *, NSNumber *> *)respondUserIds;

#pragma mark - 输入状态

- (void)onTypingStatusChanged:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(NSString *)channelId
             userTypingStatus:(NSArray<RCIMIWTypingStatus *> *)userTypingStatus;

#pragma mark - 聊天室

- (void)onChatRoomJoining:(NSString *)targetId;

- (void)onChatRoomJoined:(NSInteger)code targetId:(NSString *)targetId;

- (void)onChatRoomLeft:(NSInteger)code targetId:(NSString *)targetId;

- (void)onChatRoomStatusChanged:(NSString *)targetId status:(RCIMIWChatRoomStatus)status;

- (void)onChatRoomMemberChanged:(NSString *)targetId actions:(NSArray<RCIMIWChatRoomMemberAction *> *)actions;

- (void)onChatRoomMessagesLoaded:(NSInteger)code
                        targetId:(NSString *)targetId
                        messages:(NSArray<RCIMIWMessage *> *)messages
                        syncTime:(long long)syncTime;

- (void)onChatRoomEntryAdded:(NSInteger)code targetId:(NSString *)targetId key:(NSString *)key;

- (void)onChatRoomEntriesAdded:(NSInteger)code
                      targetId:(NSString *)targetId
                       entries:(NSDictionary<NSString *, NSString *> *)entries
                  errorEntries:(NSDictionary<NSString *, NSNumber *> *)errorEntries;

- (void)onChatRoomEntryLoaded:(NSInteger)code targetId:(NSString *)targetId entry:(NSDictionary<NSString *, NSString *> *)entry;

- (void)onAllChatRoomEntriesLoaded:(NSInteger)code
                          targetId:(NSString *)targetId
                           entries:(NSDictionary<NSString *, NSString*> *)entries;

- (void)onChatRoomEntryRemoved:(NSInteger)code targetId:(NSString *)targetId key:(NSString *)key;

- (void)onChatRoomEntriesRemoved:(NSInteger)code targetId:(NSString *)targetId keys:(NSArray<NSString *> *)keys;

// kv 同步完成
- (void)onChatRoomEntriesSynced:(NSString *)roomId;

// kv 改变回调，包含更新和删除
- (void)onChatRoomEntriesChanged:(RCIMIWChatRoomEntriesOperationType)operationType
                     roomId:(NSString *)roomId
                    entries:(NSDictionary<NSString *, NSString*> *)entries;

#pragma mark - 用户管理

- (void)onBlacklistAdded:(NSInteger)code userId:(NSString *)userId;

- (void)onBlacklistRemoved:(NSInteger)code userId:(NSString *)userId;

- (void)onBlacklistLoaded:(NSInteger)code userIds:(NSArray<NSString *> *)userIds;

- (void)onBlacklistStatusLoaded:(NSInteger)code userId:(NSString *)userId status:(RCIMIWBlacklistStatus)status;

#pragma mark - 搜索消息

- (void)onMessagesSearched:(NSInteger)code
                      type:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 channelId:(NSString *)channelId
                   keyword:(NSString *)keyword
                 startTime:(long long)startTime
                     count:(int)count
                  messages:(NSArray<RCIMIWMessage *> *)messages;

- (void)onMessagesSearchedByTimeRange:(NSInteger)code
                      type:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 channelId:(NSString *)channelId
                   keyword:(NSString *)keyword
                 startTime:(long long)startTime
                   endTime:(long long)endTime
                    offset:(int)offset
                     count:(int)count
                  messages:(NSArray<RCIMIWMessage *> *)messages;

- (void)onMessagesSearchedByUserId:(NSInteger)code
                            userId:(NSString *)userId
                              type:(RCIMIWConversationType)type
                          targetId:(NSString *)targetId
                         channelId:(NSString *)channelId
                         startTime:(long long)startTime
                             count:(int)count
                          messages:(NSArray<RCIMIWMessage *> *)messages;

- (void)onConversationsSearched:(NSInteger)code
              conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                      channelId:(NSString *)channelId
                   messageTypes:(NSArray <NSNumber *>*)messageTypes
                        keyword:(NSString *)keyword
                  conversations:(NSArray<RCIMIWSearchConversationResult *> *)conversations;

#pragma mark - 会话标签

- (void)onTagCreated:(NSInteger)code tagId:(NSString *)tagId tagName:(NSString *)tagName;

- (void)onTagRemoved:(NSInteger)code tagId:(NSString *)tagId;

- (void)onTagNameUpdatedByName:(NSInteger)code tagId:(NSString *)tagId newName:(NSString *)newName;

- (void)onTagsLoaded:(NSInteger)code tags:(NSArray<RCIMIWTagInfo *> *)tags;

- (void)onConversationsAddedToTag:(NSInteger)code
                            tagId:(NSString *)tagId
                 conversationType:(RCIMIWConversationType)type
                         targetId:(NSString *)targetId;

- (void)onConversationsRemovedFromTag:(NSInteger)code
                                tagId:(NSString *)tagId
                     conversationType: (RCIMIWConversationType)type
                             targetId:(NSString *)targetId;

- (void)onTagsRemovedFromConversation:(NSInteger)code
                     conversationType:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                               tagIds:(NSArray<NSString *> *)tagIds;

- (void)onTagsLoadedFromConversation:(NSInteger)code
                                tags:(NSArray<RCIMIWConversationTagInfo *> *)tags
                    conversationType:(RCIMIWConversationType)type
                            targetId:(NSString *)targetId;

- (void)onConversationsLoadedFromTagByPage:(NSInteger)code
                                     tagId:(NSString *)tagId
                                 timestamp:(long long)timestamp
                                     count:(int)count;

- (void)onUnreadCountLoadedByTag:(NSInteger)code
                           count:(NSInteger)count
                           tagId:(NSString *)tagId
                  containBlocked:(BOOL)containBlocked;

- (void)onConversationTopStatusChangedInTag:(NSInteger)code
                                      tagId:(NSString *)tagId
                           conversationType:(RCIMIWConversationType)type
                                   targetId:(NSString *)targetId
                                        top:(BOOL)top;

- (void)onConversationTopStatusLoadedInTag:(NSInteger)code
                                     tagId:(NSString *)tagId
                          conversationType:(RCIMIWConversationType)type
                                  targetId:(NSString *)targetId
                                       top:(BOOL)top;

- (void)onMessagesUnreadStatusClearedByTag:(NSInteger)code
                                     tagId:(NSString *)tagId;

- (void)onConversationClearedByTag:(NSInteger)code
                             tagId:(NSString *)tagId
                     deleteMessage:(BOOL)deleteMessage;

#pragma mark - 全局免打扰

- (void)onNotificationQuietHoursChanged:(NSInteger)code
                                   startTime:(NSString *)startTime
                                    spanMins:(int)spanMins
                                       level:(RCIMIWPushNotificationQuietHoursLevel)level;

- (void)onNotificationQuietHoursRemoved:(NSInteger)code;

- (void)onNotificationQuietHoursLoaded:(NSInteger)code
                                  startTime:(NSString *)startTime
                                   spanMins:(int)spanMins
                                      level:(RCIMIWPushNotificationQuietHoursLevel)level;

- (void)onPushContentShowStatusChanged:(NSInteger)code showContent:(BOOL)showContent;

- (void)onPushLanguageChanged:(NSInteger)code language:(NSString *)language;

- (void)onPushReceiveStatusChanged:(NSInteger)code receive:(BOOL)receive;

#pragma mark - 超级群

- (void)onUltraGroupReadStatusSynced:(NSInteger)code
                            targetId:(NSString *)targetId
                           channelId:(NSString *)channelId
                           timestamp:(long long)timestamp;

- (void)onConversationsLoadedForAllChannel:(NSInteger)code
                                         type:(RCIMIWConversationType)type
                                     targetId:(NSString *)targetId
                             conversations:(NSArray<RCIMIWConversation *> *)conversations;

- (void)onUltraGroupMessageModified:(NSInteger)code messageUId:(NSString *)messageUId;

- (void)onUltraGroupMessageRecalled:(NSInteger)code message:(RCIMIWMessage *)message deleteRemote:(BOOL)deleteRemote;

- (void)onUltraGroupMessagesCleared:(NSInteger)code
                           targetId:(NSString *)targetId
                          channelId:(NSString *)channelId
                          timestamp:(long long)timestamp
                             policy:(RCIMIWMessageOperationPolicy)policy;

- (void)onUltraGroupMessagesClearedForAllChannel:(NSInteger)code
                                        targetId:(NSString *)targetId
                                       timestamp:(long long)timestamp;

- (void)onUltraGroupTypingStatusSent:(NSInteger)code
                            targetId:(NSString *)targetId
                           channelId:(NSString *)channelId
                        typingStatus:(RCIMIWUltraGroupTypingStatus)typingStatus;

- (void)onBatchRemoteUltraGroupMessagesLoaded:(NSInteger)code
                                matchedMessages:(NSArray<RCIMIWMessage *> *)matchedMessages
                             notMatchedMessages:(NSArray<RCIMIWMessage *> *)notMatchMessages;

- (void)onUltraGroupMessageExpansionUpdated:(NSInteger)code
                                  expansion:(NSDictionary<NSString *, NSString *> *)expansion
                                 messageUId:(NSString *)messageUId;

- (void)onUltraGroupMessageExpansionRemoved:(NSInteger)code
                                 messageUId:(NSString *)messageUId
                                       keys:(NSArray<NSString *> *)keys;

/**
 超级群已读时间同步
 
 @param targetId 会话 ID
 @param channelId 频道 ID
 @param timestamp 已读时间
 */
- (void)onUltraGroupReadTimeReceived:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp;

/**
 超级群远端更新消息扩展的回调
 */
- (void)onRemoteUltraGroupMessageExpansionUpdated:(NSArray<RCIMIWMessage *> *)messages;

/**
 超级群远端修改消息的回调
 */
- (void)onRemoteUltraGroupMessageModified:(NSArray<RCIMIWMessage *> *)messages;

- (void)onRemoteUltraGroupMessageRecalled:(NSArray<RCIMIWMessage *> *)messages;

- (void)onUltraGroupTypingStatusChanged:(NSArray<RCIMIWUltraGroupTypingStatusInfo *> *)info;


/*!
 设置超级群的默认消息状态

 @param targetId                    会话 ID
 @param level                       消息通知级别
 */
- (void)onUltraGroupDefaultNotificationLevelChanged:(NSInteger)code
                                                       targetId:(NSString *)targetId
                                                          level:(RCIMIWPushNotificationLevel)level;

/*!
 获取超级群的默认消息状态

 @param targetId                    会话 ID
 */
- (void)onUltraGroupDefaultNotificationLevelLoaded:(NSInteger)code
                                          targetId:(NSString *)targetId
                                             level:(RCIMIWPushNotificationLevel)level;

/*!
 设置超级群频道的默认消息状态

 @param targetId                    会话 ID
 @param channelId                   频道 ID
 @param level                       消息通知级别
 */
- (void)onUltraGroupChannelDefaultNotificationLevelChanged:(NSInteger)code
                                                  targetId:(NSString *)targetId
                                                 channelId:(NSString *)channelId
                                                     level:(RCIMIWPushNotificationLevel)level;

/*!
 获取超级群频道的默认消息状态

 @param targetId                    会话 ID
 @param channelId                   频道 ID
 */
- (void)onUltraGroupChannelDefaultNotificationLevelLoaded:(NSInteger)code
                                                 targetId:(NSString *)targetId
                                                channelId:(NSString *)channelId
                                                    level:(RCIMIWPushNotificationLevel)level;

// 获取超级群所有会话的未读消息数
- (void)onUltraGroupAllUnreadCountLoaded:(NSInteger)code count:(NSInteger)count;
// 获取超级群所有会话的未读 @ 消息数
- (void)onUltraGroupAllUnreadMentionedCountLoaded:(NSInteger)code count:(NSInteger)count;
// 获取超级群指定会话的未读消息数
- (void)onUltraGroupUnreadCountLoaded:(NSInteger)code
                             targetId:(NSString *)targetId
                                count:(NSInteger)count;
// 获取指定会话的未读 @ 消息数
- (void)onUltraGroupUnreadMentionedCountLoaded:(NSInteger)code
                                      targetId:(NSString *)targetId
                                         count:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END

#endif /* RCIMIWEngineDelegate_h */
