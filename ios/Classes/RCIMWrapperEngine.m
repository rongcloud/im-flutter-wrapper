//
//  RCIMWrapperEngine.m
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#import "RCIMWrapperEngine.h"
#import "RCIMWrapperArgumentAdapter.h"
#import "RCIMWrapperMainThreadPoster.h"

@interface RCIMWrapperEngine ()

@property(nonatomic, strong) RCIMIWEngine *engine;
@property(nonatomic, strong) FlutterMethodChannel *channel;

@end

@implementation RCIMWrapperEngine

static RCIMWrapperEngine *instance = nil;

+ (instancetype)sharedInstance {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  self.channel = [FlutterMethodChannel methodChannelWithName:@"cn.rongcloud.im.flutter/RCIMIWEngine" binaryMessenger:[registrar messenger]];
  [registrar addApplicationDelegate:self];
  RCIMWrapperEngine *delegate = [RCIMWrapperEngine sharedInstance];
  [registrar addMethodCallDelegate:delegate channel:self.channel];
}

- (void)registerCustomMessage:(NSArray<Class> *)messageContentClassList {
  if (self.engine != nil) {
    [self.engine registerCustomMessage:messageContentClassList];
  }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  [RCIMIWEngine setDeviceToken:deviceToken];
}

- (void)destroy:(FlutterMethodCall *)call result:(FlutterResult)result {
  [self.engine destroy];
  self.engine = nil;
  dispatch_to_main_queue(^{
    result(nil);
  });
}
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSLog(@"method : %@", call.method);
  if ([@"engine:create" isEqualToString:call.method]) {
    [self create:call result:result];
  } else if ([@"engine:destroy" isEqualToString:call.method]) {
    [self destroy:call result:result];
  } else if ([@"engine:registerNativeCustomMessage" isEqualToString:call.method]) {
    [self registerNativeCustomMessage:call result:result];
  } else if ([@"engine:registerNativeCustomMediaMessage" isEqualToString:call.method]) {
    [self registerNativeCustomMediaMessage:call result:result];
  } else if ([@"engine:connect" isEqualToString:call.method]) {
    [self connect:call result:result];
  } else if ([@"engine:disconnect" isEqualToString:call.method]) {
    [self disconnect:call result:result];
  } else if ([@"engine:getConnectionStatus" isEqualToString:call.method]) {
    [self getConnectionStatus:call result:result];
  } else if ([@"engine:createTextMessage" isEqualToString:call.method]) {
    [self createTextMessage:call result:result];
  } else if ([@"engine:createImageMessage" isEqualToString:call.method]) {
    [self createImageMessage:call result:result];
  } else if ([@"engine:createFileMessage" isEqualToString:call.method]) {
    [self createFileMessage:call result:result];
  } else if ([@"engine:createSightMessage" isEqualToString:call.method]) {
    [self createSightMessage:call result:result];
  } else if ([@"engine:createVoiceMessage" isEqualToString:call.method]) {
    [self createVoiceMessage:call result:result];
  } else if ([@"engine:createReferenceMessage" isEqualToString:call.method]) {
    [self createReferenceMessage:call result:result];
  } else if ([@"engine:createGIFMessage" isEqualToString:call.method]) {
    [self createGIFMessage:call result:result];
  } else if ([@"engine:createCustomMessage" isEqualToString:call.method]) {
    [self createCustomMessage:call result:result];
  } else if ([@"engine:createLocationMessage" isEqualToString:call.method]) {
    [self createLocationMessage:call result:result];
  } else if ([@"engine:createNativeCustomMessage" isEqualToString:call.method]) {
    [self createNativeCustomMessage:call result:result];
  } else if ([@"engine:createNativeCustomMediaMessage" isEqualToString:call.method]) {
    [self createNativeCustomMediaMessage:call result:result];
  } else if ([@"engine:sendMessage" isEqualToString:call.method]) {
    [self sendMessage:call result:result];
  } else if ([@"engine:sendMediaMessage" isEqualToString:call.method]) {
    [self sendMediaMessage:call result:result];
  } else if ([@"engine:cancelSendingMediaMessage" isEqualToString:call.method]) {
    [self cancelSendingMediaMessage:call result:result];
  } else if ([@"engine:downloadMediaMessage" isEqualToString:call.method]) {
    [self downloadMediaMessage:call result:result];
  } else if ([@"engine:cancelDownloadingMediaMessage" isEqualToString:call.method]) {
    [self cancelDownloadingMediaMessage:call result:result];
  } else if ([@"engine:loadConversation" isEqualToString:call.method]) {
    [self loadConversation:call result:result];
  } else if ([@"engine:getConversation" isEqualToString:call.method]) {
    [self getConversation:call result:result];
  } else if ([@"engine:loadConversations" isEqualToString:call.method]) {
    [self loadConversations:call result:result];
  } else if ([@"engine:getConversations" isEqualToString:call.method]) {
    [self getConversations:call result:result];
  } else if ([@"engine:getConversationsWithPriority" isEqualToString:call.method]) {
    [self getConversationsWithPriority:call result:result];
  } else if ([@"engine:getUnreadConversations" isEqualToString:call.method]) {
    [self getUnreadConversations:call result:result];
  } else if ([@"engine:removeConversation" isEqualToString:call.method]) {
    [self removeConversation:call result:result];
  } else if ([@"engine:removeConversations" isEqualToString:call.method]) {
    [self removeConversations:call result:result];
  } else if ([@"engine:loadUnreadCount" isEqualToString:call.method]) {
    [self loadUnreadCount:call result:result];
  } else if ([@"engine:getUnreadCount" isEqualToString:call.method]) {
    [self getUnreadCount:call result:result];
  } else if ([@"engine:loadTotalUnreadCount" isEqualToString:call.method]) {
    [self loadTotalUnreadCount:call result:result];
  } else if ([@"engine:getTotalUnreadCount" isEqualToString:call.method]) {
    [self getTotalUnreadCount:call result:result];
  } else if ([@"engine:loadUnreadMentionedCount" isEqualToString:call.method]) {
    [self loadUnreadMentionedCount:call result:result];
  } else if ([@"engine:getUnreadMentionedCount" isEqualToString:call.method]) {
    [self getUnreadMentionedCount:call result:result];
  } else if ([@"engine:loadUltraGroupAllUnreadCount" isEqualToString:call.method]) {
    [self loadUltraGroupAllUnreadCount:call result:result];
  } else if ([@"engine:getUltraGroupAllUnreadCount" isEqualToString:call.method]) {
    [self getUltraGroupAllUnreadCount:call result:result];
  } else if ([@"engine:loadUltraGroupAllUnreadMentionedCount" isEqualToString:call.method]) {
    [self loadUltraGroupAllUnreadMentionedCount:call result:result];
  } else if ([@"engine:getUltraGroupAllUnreadMentionedCount" isEqualToString:call.method]) {
    [self getUltraGroupAllUnreadMentionedCount:call result:result];
  } else if ([@"engine:loadUltraGroupUnreadCount" isEqualToString:call.method]) {
    [self loadUltraGroupUnreadCount:call result:result];
  } else if ([@"engine:getUltraGroupUnreadCount" isEqualToString:call.method]) {
    [self getUltraGroupUnreadCount:call result:result];
  } else if ([@"engine:loadUltraGroupUnreadMentionedCount" isEqualToString:call.method]) {
    [self loadUltraGroupUnreadMentionedCount:call result:result];
  } else if ([@"engine:getUltraGroupUnreadMentionedCount" isEqualToString:call.method]) {
    [self getUltraGroupUnreadMentionedCount:call result:result];
  } else if ([@"engine:loadUnreadCountByConversationTypes" isEqualToString:call.method]) {
    [self loadUnreadCountByConversationTypes:call result:result];
  } else if ([@"engine:getUnreadCountByConversationTypes" isEqualToString:call.method]) {
    [self getUnreadCountByConversationTypes:call result:result];
  } else if ([@"engine:getUnreadCountByLevels" isEqualToString:call.method]) {
    [self getUnreadCountByLevels:call result:result];
  } else if ([@"engine:clearUnreadCount" isEqualToString:call.method]) {
    [self clearUnreadCount:call result:result];
  } else if ([@"engine:saveDraftMessage" isEqualToString:call.method]) {
    [self saveDraftMessage:call result:result];
  } else if ([@"engine:loadDraftMessage" isEqualToString:call.method]) {
    [self loadDraftMessage:call result:result];
  } else if ([@"engine:getDraftMessage" isEqualToString:call.method]) {
    [self getDraftMessage:call result:result];
  } else if ([@"engine:clearDraftMessage" isEqualToString:call.method]) {
    [self clearDraftMessage:call result:result];
  } else if ([@"engine:loadBlockedConversations" isEqualToString:call.method]) {
    [self loadBlockedConversations:call result:result];
  } else if ([@"engine:getBlockedConversations" isEqualToString:call.method]) {
    [self getBlockedConversations:call result:result];
  } else if ([@"engine:changeConversationTopStatus" isEqualToString:call.method]) {
    [self changeConversationTopStatus:call result:result];
  } else if ([@"engine:changeConversationTopStatusWithUpdateTme" isEqualToString:call.method]) {
    [self changeConversationTopStatusWithUpdateTme:call result:result];
  } else if ([@"engine:loadConversationTopStatus" isEqualToString:call.method]) {
    [self loadConversationTopStatus:call result:result];
  } else if ([@"engine:getConversationTopStatus" isEqualToString:call.method]) {
    [self getConversationTopStatus:call result:result];
  } else if ([@"engine:syncConversationReadStatus" isEqualToString:call.method]) {
    [self syncConversationReadStatus:call result:result];
  } else if ([@"engine:sendTypingStatus" isEqualToString:call.method]) {
    [self sendTypingStatus:call result:result];
  } else if ([@"engine:loadMessages" isEqualToString:call.method]) {
    [self loadMessages:call result:result];
  } else if ([@"engine:getMessages" isEqualToString:call.method]) {
    [self getMessages:call result:result];
  } else if ([@"engine:getMessageById" isEqualToString:call.method]) {
    [self getMessageById:call result:result];
  } else if ([@"engine:getMessageByUId" isEqualToString:call.method]) {
    [self getMessageByUId:call result:result];
  } else if ([@"engine:getMessagesAroundTime" isEqualToString:call.method]) {
    [self getMessagesAroundTime:call result:result];
  } else if ([@"engine:getLocalMessagesByMessageTypes" isEqualToString:call.method]) {
    [self getLocalMessagesByMessageTypes:call result:result];
  } else if ([@"engine:loadFirstUnreadMessage" isEqualToString:call.method]) {
    [self loadFirstUnreadMessage:call result:result];
  } else if ([@"engine:getFirstUnreadMessage" isEqualToString:call.method]) {
    [self getFirstUnreadMessage:call result:result];
  } else if ([@"engine:loadUnreadMentionedMessages" isEqualToString:call.method]) {
    [self loadUnreadMentionedMessages:call result:result];
  } else if ([@"engine:getUnreadMentionedMessages" isEqualToString:call.method]) {
    [self getUnreadMentionedMessages:call result:result];
  } else if ([@"engine:insertMessage" isEqualToString:call.method]) {
    [self insertMessage:call result:result];
  } else if ([@"engine:insertMessages" isEqualToString:call.method]) {
    [self insertMessages:call result:result];
  } else if ([@"engine:clearMessages" isEqualToString:call.method]) {
    [self clearMessages:call result:result];
  } else if ([@"engine:deleteLocalMessages" isEqualToString:call.method]) {
    [self deleteLocalMessages:call result:result];
  } else if ([@"engine:deleteLocalMessageByIds" isEqualToString:call.method]) {
    [self deleteLocalMessageByIds:call result:result];
  } else if ([@"engine:deleteMessages" isEqualToString:call.method]) {
    [self deleteMessages:call result:result];
  } else if ([@"engine:recallMessage" isEqualToString:call.method]) {
    [self recallMessage:call result:result];
  } else if ([@"engine:sendPrivateReadReceiptMessage" isEqualToString:call.method]) {
    [self sendPrivateReadReceiptMessage:call result:result];
  } else if ([@"engine:sendGroupReadReceiptRequest" isEqualToString:call.method]) {
    [self sendGroupReadReceiptRequest:call result:result];
  } else if ([@"engine:sendGroupReadReceiptResponse" isEqualToString:call.method]) {
    [self sendGroupReadReceiptResponse:call result:result];
  } else if ([@"engine:updateMessageExpansion" isEqualToString:call.method]) {
    [self updateMessageExpansion:call result:result];
  } else if ([@"engine:removeMessageExpansionForKeys" isEqualToString:call.method]) {
    [self removeMessageExpansionForKeys:call result:result];
  } else if ([@"engine:changeMessageSentStatus" isEqualToString:call.method]) {
    [self changeMessageSentStatus:call result:result];
  } else if ([@"engine:changeMessageReceiveStatus" isEqualToString:call.method]) {
    [self changeMessageReceiveStatus:call result:result];
  } else if ([@"engine:changeMessageReceiveStatusInfo" isEqualToString:call.method]) {
    [self changeMessageReceiveStatusInfo:call result:result];
  } else if ([@"engine:updateMessageLocalExtra" isEqualToString:call.method]) {
    [self updateMessageLocalExtra:call result:result];
  } else if ([@"engine:joinChatRoom" isEqualToString:call.method]) {
    [self joinChatRoom:call result:result];
  } else if ([@"engine:leaveChatRoom" isEqualToString:call.method]) {
    [self leaveChatRoom:call result:result];
  } else if ([@"engine:loadChatRoomMessages" isEqualToString:call.method]) {
    [self loadChatRoomMessages:call result:result];
  } else if ([@"engine:getChatRoomMessages" isEqualToString:call.method]) {
    [self getChatRoomMessages:call result:result];
  } else if ([@"engine:addChatRoomEntry" isEqualToString:call.method]) {
    [self addChatRoomEntry:call result:result];
  } else if ([@"engine:addChatRoomEntries" isEqualToString:call.method]) {
    [self addChatRoomEntries:call result:result];
  } else if ([@"engine:loadChatRoomEntry" isEqualToString:call.method]) {
    [self loadChatRoomEntry:call result:result];
  } else if ([@"engine:getChatRoomEntry" isEqualToString:call.method]) {
    [self getChatRoomEntry:call result:result];
  } else if ([@"engine:loadChatRoomAllEntries" isEqualToString:call.method]) {
    [self loadChatRoomAllEntries:call result:result];
  } else if ([@"engine:getChatRoomAllEntries" isEqualToString:call.method]) {
    [self getChatRoomAllEntries:call result:result];
  } else if ([@"engine:removeChatRoomEntry" isEqualToString:call.method]) {
    [self removeChatRoomEntry:call result:result];
  } else if ([@"engine:removeChatRoomEntries" isEqualToString:call.method]) {
    [self removeChatRoomEntries:call result:result];
  } else if ([@"engine:addToBlacklist" isEqualToString:call.method]) {
    [self addToBlacklist:call result:result];
  } else if ([@"engine:removeFromBlacklist" isEqualToString:call.method]) {
    [self removeFromBlacklist:call result:result];
  } else if ([@"engine:loadBlacklistStatus" isEqualToString:call.method]) {
    [self loadBlacklistStatus:call result:result];
  } else if ([@"engine:getBlacklistStatus" isEqualToString:call.method]) {
    [self getBlacklistStatus:call result:result];
  } else if ([@"engine:loadBlacklist" isEqualToString:call.method]) {
    [self loadBlacklist:call result:result];
  } else if ([@"engine:getBlacklist" isEqualToString:call.method]) {
    [self getBlacklist:call result:result];
  } else if ([@"engine:searchMessages" isEqualToString:call.method]) {
    [self searchMessages:call result:result];
  } else if ([@"engine:searchMessagesByTimeRange" isEqualToString:call.method]) {
    [self searchMessagesByTimeRange:call result:result];
  } else if ([@"engine:searchMessagesByUserId" isEqualToString:call.method]) {
    [self searchMessagesByUserId:call result:result];
  } else if ([@"engine:searchMessagesByMessageTypes" isEqualToString:call.method]) {
    [self searchMessagesByMessageTypes:call result:result];
  } else if ([@"engine:searchConversations" isEqualToString:call.method]) {
    [self searchConversations:call result:result];
  } else if ([@"engine:changeNotificationQuietHours" isEqualToString:call.method]) {
    [self changeNotificationQuietHours:call result:result];
  } else if ([@"engine:removeNotificationQuietHours" isEqualToString:call.method]) {
    [self removeNotificationQuietHours:call result:result];
  } else if ([@"engine:loadNotificationQuietHours" isEqualToString:call.method]) {
    [self loadNotificationQuietHours:call result:result];
  } else if ([@"engine:getNotificationQuietHours" isEqualToString:call.method]) {
    [self getNotificationQuietHours:call result:result];
  } else if ([@"engine:changeConversationNotificationLevel" isEqualToString:call.method]) {
    [self changeConversationNotificationLevel:call result:result];
  } else if ([@"engine:loadConversationNotificationLevel" isEqualToString:call.method]) {
    [self loadConversationNotificationLevel:call result:result];
  } else if ([@"engine:getConversationNotificationLevel" isEqualToString:call.method]) {
    [self getConversationNotificationLevel:call result:result];
  } else if ([@"engine:changeConversationTypeNotificationLevel" isEqualToString:call.method]) {
    [self changeConversationTypeNotificationLevel:call result:result];
  } else if ([@"engine:loadConversationTypeNotificationLevel" isEqualToString:call.method]) {
    [self loadConversationTypeNotificationLevel:call result:result];
  } else if ([@"engine:getConversationTypeNotificationLevel" isEqualToString:call.method]) {
    [self getConversationTypeNotificationLevel:call result:result];
  } else if ([@"engine:changeUltraGroupDefaultNotificationLevel" isEqualToString:call.method]) {
    [self changeUltraGroupDefaultNotificationLevel:call result:result];
  } else if ([@"engine:loadUltraGroupDefaultNotificationLevel" isEqualToString:call.method]) {
    [self loadUltraGroupDefaultNotificationLevel:call result:result];
  } else if ([@"engine:getUltraGroupDefaultNotificationLevel" isEqualToString:call.method]) {
    [self getUltraGroupDefaultNotificationLevel:call result:result];
  } else if ([@"engine:changeUltraGroupChannelDefaultNotificationLevel" isEqualToString:call.method]) {
    [self changeUltraGroupChannelDefaultNotificationLevel:call result:result];
  } else if ([@"engine:loadUltraGroupChannelDefaultNotificationLevel" isEqualToString:call.method]) {
    [self loadUltraGroupChannelDefaultNotificationLevel:call result:result];
  } else if ([@"engine:getUltraGroupChannelDefaultNotificationLevel" isEqualToString:call.method]) {
    [self getUltraGroupChannelDefaultNotificationLevel:call result:result];
  } else if ([@"engine:changePushContentShowStatus" isEqualToString:call.method]) {
    [self changePushContentShowStatus:call result:result];
  } else if ([@"engine:changePushLanguage" isEqualToString:call.method]) {
    [self changePushLanguage:call result:result];
  } else if ([@"engine:changePushReceiveStatus" isEqualToString:call.method]) {
    [self changePushReceiveStatus:call result:result];
  } else if ([@"engine:sendGroupMessageToDesignatedUsers" isEqualToString:call.method]) {
    [self sendGroupMessageToDesignatedUsers:call result:result];
  } else if ([@"engine:loadMessageCount" isEqualToString:call.method]) {
    [self loadMessageCount:call result:result];
  } else if ([@"engine:getMessageCount" isEqualToString:call.method]) {
    [self getMessageCount:call result:result];
  } else if ([@"engine:loadTopConversations" isEqualToString:call.method]) {
    [self loadTopConversations:call result:result];
  } else if ([@"engine:getTopConversations" isEqualToString:call.method]) {
    [self getTopConversations:call result:result];
  } else if ([@"engine:syncUltraGroupReadStatus" isEqualToString:call.method]) {
    [self syncUltraGroupReadStatus:call result:result];
  } else if ([@"engine:loadConversationsForAllChannel" isEqualToString:call.method]) {
    [self loadConversationsForAllChannel:call result:result];
  } else if ([@"engine:getConversationsForAllChannel" isEqualToString:call.method]) {
    [self getConversationsForAllChannel:call result:result];
  } else if ([@"engine:modifyUltraGroupMessage" isEqualToString:call.method]) {
    [self modifyUltraGroupMessage:call result:result];
  } else if ([@"engine:recallUltraGroupMessage" isEqualToString:call.method]) {
    [self recallUltraGroupMessage:call result:result];
  } else if ([@"engine:clearUltraGroupMessages" isEqualToString:call.method]) {
    [self clearUltraGroupMessages:call result:result];
  } else if ([@"engine:sendUltraGroupTypingStatus" isEqualToString:call.method]) {
    [self sendUltraGroupTypingStatus:call result:result];
  } else if ([@"engine:clearUltraGroupMessagesForAllChannel" isEqualToString:call.method]) {
    [self clearUltraGroupMessagesForAllChannel:call result:result];
  } else if ([@"engine:loadBatchRemoteUltraGroupMessages" isEqualToString:call.method]) {
    [self loadBatchRemoteUltraGroupMessages:call result:result];
  } else if ([@"engine:getBatchRemoteUltraGroupMessages" isEqualToString:call.method]) {
    [self getBatchRemoteUltraGroupMessages:call result:result];
  } else if ([@"engine:updateUltraGroupMessageExpansion" isEqualToString:call.method]) {
    [self updateUltraGroupMessageExpansion:call result:result];
  } else if ([@"engine:removeUltraGroupMessageExpansionForKeys" isEqualToString:call.method]) {
    [self removeUltraGroupMessageExpansionForKeys:call result:result];
  } else if ([@"engine:changeLogLevel" isEqualToString:call.method]) {
    [self changeLogLevel:call result:result];
  } else if ([@"engine:getDeltaTime" isEqualToString:call.method]) {
    [self getDeltaTime:call result:result];
  } else if ([@"engine:getAppSettings" isEqualToString:call.method]) {
    [self getAppSettings:call result:result];
  } else if ([@"engine:createTag" isEqualToString:call.method]) {
    [self createTag:call result:result];
  } else if ([@"engine:removeTag" isEqualToString:call.method]) {
    [self removeTag:call result:result];
  } else if ([@"engine:updateTagNameById" isEqualToString:call.method]) {
    [self updateTagNameById:call result:result];
  } else if ([@"engine:getTags" isEqualToString:call.method]) {
    [self getTags:call result:result];
  } else if ([@"engine:addConversationToTag" isEqualToString:call.method]) {
    [self addConversationToTag:call result:result];
  } else if ([@"engine:removeConversationFromTag" isEqualToString:call.method]) {
    [self removeConversationFromTag:call result:result];
  } else if ([@"engine:removeTagsFromConversation" isEqualToString:call.method]) {
    [self removeTagsFromConversation:call result:result];
  } else if ([@"engine:getTagsFromConversation" isEqualToString:call.method]) {
    [self getTagsFromConversation:call result:result];
  } else if ([@"engine:getConversationsFromTagByPage" isEqualToString:call.method]) {
    [self getConversationsFromTagByPage:call result:result];
  } else if ([@"engine:getUnreadCountByTag" isEqualToString:call.method]) {
    [self getUnreadCountByTag:call result:result];
  } else if ([@"engine:changeConversationTopStatusInTag" isEqualToString:call.method]) {
    [self changeConversationTopStatusInTag:call result:result];
  } else if ([@"engine:getConversationTopStatusInTag" isEqualToString:call.method]) {
    [self getConversationTopStatusInTag:call result:result];
  } else if ([@"engine:clearMessagesUnreadStatusByTag" isEqualToString:call.method]) {
    [self clearMessagesUnreadStatusByTag:call result:result];
  } else if ([@"engine:clearConversationsByTag" isEqualToString:call.method]) {
    [self clearConversationsByTag:call result:result];
  } else if ([@"engine:setModuleName" isEqualToString:call.method]) {
    [self setModuleName:call result:result];
  } else if ([@"engine:writeLog" isEqualToString:call.method]) {
    [self writeLog:call result:result];
  } else if ([@"engine:createGroup" isEqualToString:call.method]) {
    [self createGroup:call result:result];
  } else if ([@"engine:updateGroupInfo" isEqualToString:call.method]) {
    [self updateGroupInfo:call result:result];
  } else if ([@"engine:getGroupsInfo" isEqualToString:call.method]) {
    [self getGroupsInfo:call result:result];
  } else if ([@"engine:kickGroupMembers" isEqualToString:call.method]) {
    [self kickGroupMembers:call result:result];
  } else if ([@"engine:joinGroup" isEqualToString:call.method]) {
    [self joinGroup:call result:result];
  } else if ([@"engine:quitGroup" isEqualToString:call.method]) {
    [self quitGroup:call result:result];
  } else if ([@"engine:dismissGroup" isEqualToString:call.method]) {
    [self dismissGroup:call result:result];
  } else if ([@"engine:transferGroupOwner" isEqualToString:call.method]) {
    [self transferGroupOwner:call result:result];
  } else if ([@"engine:getGroupMembers" isEqualToString:call.method]) {
    [self getGroupMembers:call result:result];
  } else if ([@"engine:getGroupMembersByRole" isEqualToString:call.method]) {
    [self getGroupMembersByRole:call result:result];
  } else if ([@"engine:getJoinedGroupsByRole" isEqualToString:call.method]) {
    [self getJoinedGroupsByRole:call result:result];
  } else if ([@"engine:getJoinedGroups" isEqualToString:call.method]) {
    [self getJoinedGroups:call result:result];
  } else if ([@"engine:setGroupRemark" isEqualToString:call.method]) {
    [self setGroupRemark:call result:result];
  } else if ([@"engine:setGroupMemberInfo" isEqualToString:call.method]) {
    [self setGroupMemberInfo:call result:result];
  } else if ([@"engine:searchJoinedGroups" isEqualToString:call.method]) {
    [self searchJoinedGroups:call result:result];
  } else if ([@"engine:searchGroupMembers" isEqualToString:call.method]) {
    [self searchGroupMembers:call result:result];
  } else if ([@"engine:addGroupManagers" isEqualToString:call.method]) {
    [self addGroupManagers:call result:result];
  } else if ([@"engine:removeGroupManagers" isEqualToString:call.method]) {
    [self removeGroupManagers:call result:result];
  } else if ([@"engine:inviteUsersToGroup" isEqualToString:call.method]) {
    [self inviteUsersToGroup:call result:result];
  } else if ([@"engine:acceptGroupInvite" isEqualToString:call.method]) {
    [self acceptGroupInvite:call result:result];
  } else if ([@"engine:refuseGroupInvite" isEqualToString:call.method]) {
    [self refuseGroupInvite:call result:result];
  } else if ([@"engine:acceptGroupApplication" isEqualToString:call.method]) {
    [self acceptGroupApplication:call result:result];
  } else if ([@"engine:refuseGroupApplication" isEqualToString:call.method]) {
    [self refuseGroupApplication:call result:result];
  } else if ([@"engine:getGroupApplications" isEqualToString:call.method]) {
    [self getGroupApplications:call result:result];
  } else if ([@"engine:addGroupFollows" isEqualToString:call.method]) {
    [self addGroupFollows:call result:result];
  } else if ([@"engine:removeGroupFollows" isEqualToString:call.method]) {
    [self removeGroupFollows:call result:result];
  } else if ([@"engine:getGroupFollows" isEqualToString:call.method]) {
    [self getGroupFollows:call result:result];
  } else if ([@"engine:setCheckChatRoomDuplicateMessage" isEqualToString:call.method]) {
    [self setCheckChatRoomDuplicateMessage:call result:result];
  } else if ([@"engine:translateMessagesWithParams" isEqualToString:call.method]) {
    [self translateMessagesWithParams:call result:result];
  } else if ([@"engine:translateTextsWithParams" isEqualToString:call.method]) {
    [self translateTextsWithParams:call result:result];
  } else if ([@"engine:setTranslationLanguage" isEqualToString:call.method]) {
    [self setTranslationLanguage:call result:result];
  } else if ([@"engine:getTranslationLanguage" isEqualToString:call.method]) {
    [self getTranslationLanguage:call result:result];
  } else if ([@"engine:setAutoTranslateEnable" isEqualToString:call.method]) {
    [self setAutoTranslateEnable:call result:result];
  } else if ([@"engine:getAutoTranslateEnabled" isEqualToString:call.method]) {
    [self getAutoTranslateEnabled:call result:result];
  } else if ([@"engine:batchSetConversationTranslateStrategy" isEqualToString:call.method]) {
    [self batchSetConversationTranslateStrategy:call result:result];
  } else if ([@"engine:calculateTextMD5" isEqualToString:call.method]) {
    [self calculateTextMD5:call result:result];
  } else if ([@"engine:updateMyUserProfileVisibility" isEqualToString:call.method]) {
    [self updateMyUserProfileVisibility:call result:result];
  } else if ([@"engine:getMyUserProfileVisibility" isEqualToString:call.method]) {
    [self getMyUserProfileVisibility:call result:result];
  } else if ([@"engine:updateMyUserProfile" isEqualToString:call.method]) {
    [self updateMyUserProfile:call result:result];
  } else if ([@"engine:getMyUserProfile" isEqualToString:call.method]) {
    [self getMyUserProfile:call result:result];
  } else if ([@"engine:getUserProfiles" isEqualToString:call.method]) {
    [self getUserProfiles:call result:result];
  } else if ([@"engine:searchUserProfileByUniqueId" isEqualToString:call.method]) {
    [self searchUserProfileByUniqueId:call result:result];
  } else if ([@"engine:subscribeEvent" isEqualToString:call.method]) {
    [self subscribeEvent:call result:result];
  } else if ([@"engine:unSubscribeEvent" isEqualToString:call.method]) {
    [self unSubscribeEvent:call result:result];
  } else if ([@"engine:querySubscribeEvent" isEqualToString:call.method]) {
    [self querySubscribeEvent:call result:result];
  } else if ([@"engine:querySubscribeEventByPage" isEqualToString:call.method]) {
    [self querySubscribeEventByPage:call result:result];
  } else if ([@"engine:requestSpeechToTextForMessage" isEqualToString:call.method]) {
    [self requestSpeechToTextForMessage:call result:result];
  } else if ([@"engine:setMessageSpeechToTextVisible" isEqualToString:call.method]) {
    [self setMessageSpeechToTextVisible:call result:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)create:(FlutterMethodCall *)call result:(FlutterResult)result {

  NSDictionary *arguments = (NSDictionary *)call.arguments;
  NSString *appkey = arguments[@"appKey"];
  RCIMIWEngineOptions *options = [RCIMIWPlatformConverter convertEngineOptionsFromDict:arguments[@"options"]];
  self.engine = [RCIMIWEngine create:appkey options:options];
  [self.engine setEngineDelegate:self];
  [self.engine registerCustomMessage:self.messageContentClassList];
  result(nil);
}

- (void)registerNativeCustomMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageIdentifier = arguments[@"messageIdentifier"];
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag = [RCIMWrapperArgumentAdapter convertNativeCustomMessagePersistentFlagFromInteger:[(NSNumber *)arguments[@"persistentFlag"] integerValue]];

    code = [self.engine registerNativeCustomMessage:messageIdentifier persistentFlag:persistentFlag];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)registerNativeCustomMediaMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageIdentifier = arguments[@"messageIdentifier"];
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag = [RCIMWrapperArgumentAdapter convertNativeCustomMessagePersistentFlagFromInteger:[(NSNumber *)arguments[@"persistentFlag"] integerValue]];

    code = [self.engine registerNativeCustomMediaMessage:messageIdentifier persistentFlag:persistentFlag];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)connect:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *token = arguments[@"token"];
    int timeout = [(NSNumber *)arguments[@"timeout"] intValue];
    void (^databaseOpened)(NSInteger code) = nil;
    void (^connected)(NSInteger code, NSString *_Nullable userId) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      databaseOpened = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWConnectCallback_onDatabaseOpened" arguments:arguments.copy];
        });
      };
      connected = ^(NSInteger code, NSString *userId) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:userId forKey:@"userId"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWConnectCallback_onConnected" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine connect:token timeout:timeout databaseOpened:databaseOpened connected:connected];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)disconnect:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    BOOL receivePush = [(NSNumber *)arguments[@"receivePush"] boolValue];

    code = [self.engine disconnect:receivePush];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConnectionStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWConnectionStatus code;
  if (self.engine != nil) {

    code = [self.engine getConnectionStatus];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)createTextMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWTextMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *text = arguments[@"text"];

    res = [self.engine createTextMessage:type targetId:targetId channelId:channelId text:text];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createImageMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWImageMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];

    res = [self.engine createImageMessage:type targetId:targetId channelId:channelId path:path];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createFileMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWFileMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];

    res = [self.engine createFileMessage:type targetId:targetId channelId:channelId path:path];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createSightMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWSightMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];
    int duration = [(NSNumber *)arguments[@"duration"] intValue];

    res = [self.engine createSightMessage:type targetId:targetId channelId:channelId path:path duration:duration];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createVoiceMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWVoiceMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];
    int duration = [(NSNumber *)arguments[@"duration"] intValue];

    res = [self.engine createVoiceMessage:type targetId:targetId channelId:channelId path:path duration:duration];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createReferenceMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWReferenceMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWMessage *referenceMessage = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"referenceMessage"]];
    NSString *text = arguments[@"text"];

    res = [self.engine createReferenceMessage:type targetId:targetId channelId:channelId referenceMessage:referenceMessage text:text];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createGIFMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWGIFMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];

    res = [self.engine createGIFMessage:type targetId:targetId channelId:channelId path:path];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createCustomMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWCustomMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWCustomMessagePolicy policy = [RCIMWrapperArgumentAdapter convertCustomMessagePolicyFromInteger:[(NSNumber *)arguments[@"policy"] integerValue]];
    NSString *messageIdentifier = arguments[@"messageIdentifier"];
    NSDictionary<NSString *, NSString *> *fields = arguments[@"fields"];

    res = [self.engine createCustomMessage:type targetId:targetId channelId:channelId policy:policy messageIdentifier:messageIdentifier fields:fields];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createLocationMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWLocationMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    double longitude = [(NSNumber *)arguments[@"longitude"] doubleValue];
    double latitude = [(NSNumber *)arguments[@"latitude"] doubleValue];
    NSString *poiName = arguments[@"poiName"];
    NSString *thumbnailPath = arguments[@"thumbnailPath"];

    res = [self.engine createLocationMessage:type targetId:targetId channelId:channelId longitude:longitude latitude:latitude poiName:poiName thumbnailPath:thumbnailPath];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createNativeCustomMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWNativeCustomMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *messageIdentifier = arguments[@"messageIdentifier"];
    NSDictionary<NSString *, id> *fields = arguments[@"fields"];

    res = [self.engine createNativeCustomMessage:type targetId:targetId channelId:channelId messageIdentifier:messageIdentifier fields:fields];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createNativeCustomMediaMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWNativeCustomMediaMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *messageIdentifier = arguments[@"messageIdentifier"];
    NSString *path = arguments[@"path"];
    NSDictionary<NSString *, id> *fields = arguments[@"fields"];

    res = [self.engine createNativeCustomMediaMessage:type targetId:targetId channelId:channelId messageIdentifier:messageIdentifier path:path fields:fields];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)sendMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    void (^messageSaved)(RCIMIWMessage *_Nullable message) = nil;
    void (^messageSent)(NSInteger code, RCIMIWMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageSaved = ^(RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendMessageCallback_onMessageSaved" arguments:arguments.copy];
        });
      };
      messageSent = ^(NSInteger code, RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendMessageCallback_onMessageSent" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine sendMessage:message messageSaved:messageSaved messageSent:messageSent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendMediaMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter convertMediaMessageFromDict:arguments[@"message"]];
    void (^messageSaved)(RCIMIWMediaMessage *_Nullable message) = nil;
    void (^messageSending)(RCIMIWMediaMessage *_Nullable message, NSInteger progress) = nil;
    void (^sendingMediaMessageCanceled)(RCIMIWMediaMessage *_Nullable message) = nil;
    void (^messageSent)(NSInteger code, RCIMIWMediaMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageSaved = ^(RCIMIWMediaMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSaved" arguments:arguments.copy];
        });
      };
      messageSending = ^(RCIMIWMediaMessage *message, NSInteger progress) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];
        [arguments setValue:@(progress) forKey:@"progress"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSending" arguments:arguments.copy];
        });
      };
      sendingMediaMessageCanceled = ^(RCIMIWMediaMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendMediaMessageListener_onSendingMediaMessageCanceled" arguments:arguments.copy];
        });
      };
      messageSent = ^(NSInteger code, RCIMIWMediaMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSent" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine sendMediaMessage:message messageSaved:messageSaved messageSending:messageSending sendingMediaMessageCanceled:sendingMediaMessageCanceled messageSent:messageSent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)cancelSendingMediaMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter convertMediaMessageFromDict:arguments[@"message"]];
    void (^cancelSendingMediaMessageCalled)(NSInteger code, RCIMIWMediaMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      cancelSendingMediaMessageCalled = ^(NSInteger code, RCIMIWMediaMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWCancelSendingMediaMessageCallback_onCancelSendingMediaMessageCalled" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine cancelSendingMediaMessage:message cancelSendingMediaMessageCalled:cancelSendingMediaMessageCalled];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)downloadMediaMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter convertMediaMessageFromDict:arguments[@"message"]];
    void (^mediaMessageDownloading)(RCIMIWMediaMessage *_Nullable message, NSInteger progress) = nil;
    void (^downloadingMediaMessageCanceled)(RCIMIWMediaMessage *_Nullable message) = nil;
    void (^mediaMessageDownloaded)(NSInteger code, RCIMIWMediaMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      mediaMessageDownloading = ^(RCIMIWMediaMessage *message, NSInteger progress) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];
        [arguments setValue:@(progress) forKey:@"progress"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloading" arguments:arguments.copy];
        });
      };
      downloadingMediaMessageCanceled = ^(RCIMIWMediaMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWDownloadMediaMessageListener_onDownloadingMediaMessageCanceled" arguments:arguments.copy];
        });
      };
      mediaMessageDownloaded = ^(NSInteger code, RCIMIWMediaMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloaded" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine downloadMediaMessage:message mediaMessageDownloading:mediaMessageDownloading downloadingMediaMessageCanceled:downloadingMediaMessageCanceled mediaMessageDownloaded:mediaMessageDownloaded];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)cancelDownloadingMediaMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter convertMediaMessageFromDict:arguments[@"message"]];
    void (^cancelDownloadingMediaMessageCalled)(NSInteger code, RCIMIWMediaMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      cancelDownloadingMediaMessageCalled = ^(NSInteger code, RCIMIWMediaMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWCancelDownloadingMediaMessageCallback_onCancelDownloadingMediaMessageCalled" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine cancelDownloadingMediaMessage:message cancelDownloadingMediaMessageCalled:cancelDownloadingMediaMessageCalled];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversation:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadConversation:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversation:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(RCIMIWConversation *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWConversation *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertConversationToDict:t] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversation:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine loadConversations:conversationTypes channelId:channelId startTime:startTime count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWConversation *> *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversation *> *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversation *element in t) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversations:conversationTypes channelId:channelId startTime:startTime count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversationsWithPriority:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    BOOL topPriority = [(NSNumber *)arguments[@"topPriority"] boolValue];
    void (^success)(NSArray<RCIMIWConversation *> *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversation *> *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversation *element in t) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversationsWithPriority:conversationTypes channelId:channelId startTime:startTime count:count topPriority:topPriority success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUnreadConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    void (^success)(NSArray<RCIMIWConversation *> *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversation *> *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversation *element in t) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadConversationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadConversationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUnreadConversations:conversationTypes success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeConversation:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^conversationRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveConversationCallback_onConversationRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeConversation:type targetId:targetId channelId:channelId conversationRemoved:conversationRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    void (^conversationsRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationsRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveConversationsCallback_onConversationsRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeConversations:conversationTypes channelId:channelId conversationsRemoved:conversationsRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadUnreadCount:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUnreadCount:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadTotalUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadTotalUnreadCount:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getTotalUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTotalUnreadCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTotalUnreadCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getTotalUnreadCount:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUnreadMentionedCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadUnreadMentionedCount:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUnreadMentionedCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUnreadMentionedCount:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupAllUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadUltraGroupAllUnreadCount];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUltraGroupAllUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUltraGroupAllUnreadCount:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupAllUnreadMentionedCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadUltraGroupAllUnreadMentionedCount];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUltraGroupAllUnreadMentionedCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUltraGroupAllUnreadMentionedCount:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];

    code = [self.engine loadUltraGroupUnreadCount:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUltraGroupUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUltraGroupUnreadCount:targetId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupUnreadMentionedCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];

    code = [self.engine loadUltraGroupUnreadMentionedCount:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUltraGroupUnreadMentionedCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUltraGroupUnreadMentionedCount:targetId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUnreadCountByConversationTypes:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    BOOL contain = [(NSNumber *)arguments[@"contain"] boolValue];

    code = [self.engine loadUnreadCountByConversationTypes:conversationTypes channelId:channelId contain:contain];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUnreadCountByConversationTypes:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    BOOL contain = [(NSNumber *)arguments[@"contain"] boolValue];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUnreadCountByConversationTypes:conversationTypes channelId:channelId contain:contain success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUnreadCountByLevels:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSArray<NSNumber *> *levels = arguments[@"levels"];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUnreadCountByLevels:conversationTypes levels:levels success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    void (^unreadCountCleared)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      unreadCountCleared = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearUnreadCountCallback_onUnreadCountCleared" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine clearUnreadCount:type targetId:targetId channelId:channelId timestamp:timestamp unreadCountCleared:unreadCountCleared];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)saveDraftMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *draft = arguments[@"draft"];
    void (^draftMessageSaved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      draftMessageSaved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSaveDraftMessageCallback_onDraftMessageSaved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine saveDraftMessage:type targetId:targetId channelId:channelId draft:draft draftMessageSaved:draftMessageSaved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadDraftMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadDraftMessage:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getDraftMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSString *_Nullable draft) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSString *draft) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:draft forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetDraftMessageCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetDraftMessageCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getDraftMessage:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearDraftMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^draftMessageCleared)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      draftMessageCleared = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearDraftMessageCallback_onDraftMessageCleared" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine clearDraftMessage:type targetId:targetId channelId:channelId draftMessageCleared:draftMessageCleared];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadBlockedConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadBlockedConversations:conversationTypes channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getBlockedConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSArray<RCIMIWConversation *> *_Nullable conversations) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversation *> *conversations) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversation *element in conversations) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBlockedConversationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBlockedConversationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getBlockedConversations:conversationTypes channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationTopStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    BOOL top = [(NSNumber *)arguments[@"top"] boolValue];
    void (^conversationTopStatusChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationTopStatusChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeConversationTopStatusCallback_onConversationTopStatusChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeConversationTopStatus:type targetId:targetId channelId:channelId top:top conversationTopStatusChanged:conversationTopStatusChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationTopStatusWithUpdateTme:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    BOOL top = [(NSNumber *)arguments[@"top"] boolValue];
    BOOL updateOperationTime = [(NSNumber *)arguments[@"updateOperationTime"] boolValue];
    void (^conversationTopStatusChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationTopStatusChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeConversationTopStatusCallback_onConversationTopStatusChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeConversationTopStatusWithUpdateTme:type targetId:targetId channelId:channelId top:top updateOperationTime:updateOperationTime conversationTopStatusChanged:conversationTopStatusChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationTopStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadConversationTopStatus:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversationTopStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(BOOL top) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(BOOL top) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(top) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationTopStatusCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationTopStatusCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversationTopStatus:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)syncConversationReadStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    void (^conversationReadStatusSynced)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationReadStatusSynced = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSyncConversationReadStatusCallback_onConversationReadStatusSynced" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine syncConversationReadStatus:type targetId:targetId channelId:channelId timestamp:timestamp conversationReadStatusSynced:conversationReadStatusSynced];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendTypingStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *currentType = arguments[@"currentType"];

    code = [self.engine sendTypingStatus:type targetId:targetId channelId:channelId currentType:currentType];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long sentTime = [(NSNumber *)arguments[@"sentTime"] longLongValue];
    RCIMIWTimeOrder order = [RCIMWrapperArgumentAdapter convertTimeOrderFromInteger:[(NSNumber *)arguments[@"order"] integerValue]];
    RCIMIWMessageOperationPolicy policy = [RCIMWrapperArgumentAdapter convertMessageOperationPolicyFromInteger:[(NSNumber *)arguments[@"policy"] integerValue]];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine loadMessages:type targetId:targetId channelId:channelId sentTime:sentTime order:order policy:policy count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long sentTime = [(NSNumber *)arguments[@"sentTime"] longLongValue];
    RCIMIWTimeOrder order = [RCIMWrapperArgumentAdapter convertTimeOrderFromInteger:[(NSNumber *)arguments[@"order"] integerValue]];
    RCIMIWMessageOperationPolicy policy = [RCIMWrapperArgumentAdapter convertMessageOperationPolicyFromInteger:[(NSNumber *)arguments[@"policy"] integerValue]];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in t) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessagesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessagesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getMessages:type targetId:targetId channelId:channelId sentTime:sentTime order:order policy:policy count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getMessageById:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    long messageId = [(NSNumber *)arguments[@"messageId"] longValue];
    void (^success)(RCIMIWMessage *_Nullable message) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessageCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessageCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getMessageById:messageId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getMessageByUId:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    void (^success)(RCIMIWMessage *_Nullable message) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessageCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessageCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getMessageByUId:messageUId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getMessagesAroundTime:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long sentTime = [(NSNumber *)arguments[@"sentTime"] longLongValue];
    int beforeCount = [(NSNumber *)arguments[@"beforeCount"] intValue];
    int afterCount = [(NSNumber *)arguments[@"afterCount"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in t) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getMessagesAroundTime:type targetId:targetId channelId:channelId sentTime:sentTime beforeCount:beforeCount afterCount:afterCount success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getLocalMessagesByMessageTypes:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSArray<NSNumber *> *messageTypes = arguments[@"messageTypes"];
    long long sentTime = [(NSNumber *)arguments[@"sentTime"] longLongValue];
    RCIMIWTimeOrder order = [RCIMWrapperArgumentAdapter convertTimeOrderFromInteger:[(NSNumber *)arguments[@"order"] integerValue]];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessagesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessagesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getLocalMessagesByMessageTypes:type targetId:targetId channelId:channelId messageTypes:messageTypes sentTime:sentTime order:order count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadFirstUnreadMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadFirstUnreadMessage:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getFirstUnreadMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(RCIMIWMessage *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWMessage *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:t] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getFirstUnreadMessage:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUnreadMentionedMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadUnreadMentionedMessages:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUnreadMentionedMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable t) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *t) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in t) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUnreadMentionedMessages:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)insertMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    void (^messageInserted)(NSInteger code, RCIMIWMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageInserted = ^(NSInteger code, RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWInsertMessageCallback_onMessageInserted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine insertMessage:message messageInserted:messageInserted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)insertMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    void (^messagesInserted)(NSInteger code, NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messagesInserted = ^(NSInteger code, NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        NSMutableArray *messages_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:messages_arr.copy forKey:@"messages"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWInsertMessagesCallback_onMessagesInserted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine insertMessages:messages messagesInserted:messagesInserted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    RCIMIWMessageOperationPolicy policy = [RCIMWrapperArgumentAdapter convertMessageOperationPolicyFromInteger:[(NSNumber *)arguments[@"policy"] integerValue]];
    void (^messagesCleared)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messagesCleared = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearMessagesCallback_onMessagesCleared" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine clearMessages:type targetId:targetId channelId:channelId timestamp:timestamp policy:policy messagesCleared:messagesCleared];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)deleteLocalMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    void (^localMessagesDeleted)(NSInteger code, NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      localMessagesDeleted = ^(NSInteger code, NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        NSMutableArray *messages_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:messages_arr.copy forKey:@"messages"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWDeleteLocalMessagesCallback_onLocalMessagesDeleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine deleteLocalMessages:messages localMessagesDeleted:localMessagesDeleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)deleteLocalMessageByIds:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *messageIds = arguments[@"messageIds"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWDeleteLocalMessageByIdsCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine deleteLocalMessageByIds:messageIds onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)deleteMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    void (^messagesDeleted)(NSInteger code, NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messagesDeleted = ^(NSInteger code, NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        NSMutableArray *messages_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:messages_arr.copy forKey:@"messages"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWDeleteMessagesCallback_onMessagesDeleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine deleteMessages:type targetId:targetId channelId:channelId messages:messages messagesDeleted:messagesDeleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)recallMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    void (^messageRecalled)(NSInteger code, RCIMIWMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageRecalled = ^(NSInteger code, RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRecallMessageCallback_onMessageRecalled" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine recallMessage:message messageRecalled:messageRecalled];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendPrivateReadReceiptMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    void (^privateReadReceiptMessageSent)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      privateReadReceiptMessageSent = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSendPrivateReadReceiptMessageCallback_onPrivateReadReceiptMessageSent" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine sendPrivateReadReceiptMessage:targetId channelId:channelId timestamp:timestamp privateReadReceiptMessageSent:privateReadReceiptMessageSent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendGroupReadReceiptRequest:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    void (^groupReadReceiptRequestSent)(NSInteger code, RCIMIWMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      groupReadReceiptRequestSent = ^(NSInteger code, RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSendGroupReadReceiptRequestCallback_onGroupReadReceiptRequestSent" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine sendGroupReadReceiptRequest:message groupReadReceiptRequestSent:groupReadReceiptRequestSent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendGroupReadReceiptResponse:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    void (^groupReadReceiptResponseSent)(NSInteger code, NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      groupReadReceiptResponseSent = ^(NSInteger code, NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        NSMutableArray *message_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [message_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:message_arr.copy forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSendGroupReadReceiptResponseCallback_onGroupReadReceiptResponseSent" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine sendGroupReadReceiptResponse:targetId channelId:channelId messages:messages groupReadReceiptResponseSent:groupReadReceiptResponseSent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateMessageExpansion:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSDictionary<NSString *, NSString *> *expansion = arguments[@"expansion"];
    void (^messageExpansionUpdated)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageExpansionUpdated = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateMessageExpansionCallback_onMessageExpansionUpdated" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine updateMessageExpansion:messageUId expansion:expansion messageExpansionUpdated:messageExpansionUpdated];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeMessageExpansionForKeys:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSArray<NSString *> *keys = arguments[@"keys"];
    void (^messageExpansionForKeysRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageExpansionForKeysRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveMessageExpansionForKeysCallback_onMessageExpansionForKeysRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeMessageExpansionForKeys:messageUId keys:keys messageExpansionForKeysRemoved:messageExpansionForKeysRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeMessageSentStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    long messageId = [(NSNumber *)arguments[@"messageId"] longValue];
    RCIMIWSentStatus sentStatus = [RCIMWrapperArgumentAdapter convertSentStatusFromInteger:[(NSNumber *)arguments[@"sentStatus"] integerValue]];
    void (^messageSentStatusChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageSentStatusChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeMessageSentStatusCallback_onMessageSentStatusChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeMessageSentStatus:messageId sentStatus:sentStatus messageSentStatusChanged:messageSentStatusChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeMessageReceiveStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    long messageId = [(NSNumber *)arguments[@"messageId"] longValue];
    RCIMIWReceivedStatus receivedStatus = [RCIMWrapperArgumentAdapter convertReceivedStatusFromInteger:[(NSNumber *)arguments[@"receivedStatus"] integerValue]];
    void (^messageReceiveStatusChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageReceiveStatusChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeMessageReceivedStatusCallback_onMessageReceiveStatusChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeMessageReceiveStatus:messageId receivedStatus:receivedStatus messageReceiveStatusChanged:messageReceiveStatusChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeMessageReceiveStatusInfo:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    long messageId = [(NSNumber *)arguments[@"messageId"] longValue];
    RCIMIWReceivedStatusInfo *receivedStatusInfo = [RCIMIWPlatformConverter convertReceivedStatusInfoFromDict:arguments[@"receivedStatusInfo"]];
    void (^messageReceiveStatusInfoChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageReceiveStatusInfoChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeMessageReceivedStatusInfoCallback_onMessageReceiveStatusInfoChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeMessageReceiveStatusInfo:messageId receivedStatusInfo:receivedStatusInfo messageReceiveStatusInfoChanged:messageReceiveStatusInfoChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateMessageLocalExtra:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    long messageId = [(NSNumber *)arguments[@"messageId"] longValue];
    NSString *extra = arguments[@"extra"];
    void (^messageLocalExtraUpdated)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageLocalExtraUpdated = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateMessageLocalExtraCallback_onMessageLocalExtraUpdated" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine updateMessageLocalExtra:messageId extra:extra messageLocalExtraUpdated:messageLocalExtraUpdated];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)joinChatRoom:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    int messageCount = [(NSNumber *)arguments[@"messageCount"] intValue];
    BOOL autoCreate = [(NSNumber *)arguments[@"autoCreate"] boolValue];
    void (^chatRoomJoined)(NSInteger code, NSString *_Nullable targetId) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      chatRoomJoined = ^(NSInteger code, NSString *targetId) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:targetId forKey:@"targetId"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWJoinChatRoomCallback_onChatRoomJoined" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine joinChatRoom:targetId messageCount:messageCount autoCreate:autoCreate chatRoomJoined:chatRoomJoined];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)leaveChatRoom:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    void (^chatRoomLeft)(NSInteger code, NSString *_Nullable targetId) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      chatRoomLeft = ^(NSInteger code, NSString *targetId) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:targetId forKey:@"targetId"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWLeaveChatRoomCallback_onChatRoomLeft" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine leaveChatRoom:targetId chatRoomLeft:chatRoomLeft];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadChatRoomMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    RCIMIWTimeOrder order = [RCIMWrapperArgumentAdapter convertTimeOrderFromInteger:[(NSNumber *)arguments[@"order"] integerValue]];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine loadChatRoomMessages:targetId timestamp:timestamp order:order count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getChatRoomMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    RCIMIWTimeOrder order = [RCIMWrapperArgumentAdapter convertTimeOrderFromInteger:[(NSNumber *)arguments[@"order"] integerValue]];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetChatRoomMessagesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetChatRoomMessagesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getChatRoomMessages:targetId timestamp:timestamp order:order count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addChatRoomEntry:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *key = arguments[@"key"];
    NSString *value = arguments[@"value"];
    BOOL deleteWhenLeft = [(NSNumber *)arguments[@"deleteWhenLeft"] boolValue];
    BOOL overwrite = [(NSNumber *)arguments[@"overwrite"] boolValue];
    void (^chatRoomEntryAdded)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      chatRoomEntryAdded = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAddChatRoomEntryCallback_onChatRoomEntryAdded" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine addChatRoomEntry:targetId key:key value:value deleteWhenLeft:deleteWhenLeft overwrite:overwrite chatRoomEntryAdded:chatRoomEntryAdded];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addChatRoomEntries:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSDictionary<NSString *, NSString *> *entries = arguments[@"entries"];
    BOOL deleteWhenLeft = [(NSNumber *)arguments[@"deleteWhenLeft"] boolValue];
    BOOL overwrite = [(NSNumber *)arguments[@"overwrite"] boolValue];
    void (^chatRoomEntriesAdded)(NSInteger code, NSDictionary<NSString *, NSNumber *> *_Nullable errors) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      chatRoomEntriesAdded = ^(NSInteger code, NSDictionary<NSString *, NSNumber *> *errors) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:errors forKey:@"errors"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAddChatRoomEntriesCallback_onChatRoomEntriesAdded" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine addChatRoomEntries:targetId entries:entries deleteWhenLeft:deleteWhenLeft overwrite:overwrite chatRoomEntriesAdded:chatRoomEntriesAdded];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadChatRoomEntry:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *key = arguments[@"key"];

    code = [self.engine loadChatRoomEntry:targetId key:key];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getChatRoomEntry:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *key = arguments[@"key"];
    void (^success)(NSDictionary<NSString *, NSString *> *_Nullable entry) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSDictionary<NSString *, NSString *> *entry) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:entry forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetChatRoomEntryCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetChatRoomEntryCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getChatRoomEntry:targetId key:key success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadChatRoomAllEntries:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];

    code = [self.engine loadChatRoomAllEntries:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getChatRoomAllEntries:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    void (^success)(NSDictionary<NSString *, NSString *> *_Nullable entries) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSDictionary<NSString *, NSString *> *entries) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:entries forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getChatRoomAllEntries:targetId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeChatRoomEntry:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *key = arguments[@"key"];
    BOOL force = [(NSNumber *)arguments[@"force"] boolValue];
    void (^chatRoomEntryRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      chatRoomEntryRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveChatRoomEntryCallback_onChatRoomEntryRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeChatRoomEntry:targetId key:key force:force chatRoomEntryRemoved:chatRoomEntryRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeChatRoomEntries:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSArray<NSString *> *keys = arguments[@"keys"];
    BOOL force = [(NSNumber *)arguments[@"force"] boolValue];
    void (^chatRoomEntriesRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      chatRoomEntriesRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveChatRoomEntriesCallback_onChatRoomEntriesRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeChatRoomEntries:targetId keys:keys force:force chatRoomEntriesRemoved:chatRoomEntriesRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addToBlacklist:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *userId = arguments[@"userId"];
    void (^blacklistAdded)(NSInteger code, NSString *_Nullable userId) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      blacklistAdded = ^(NSInteger code, NSString *userId) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:userId forKey:@"userId"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAddToBlacklistCallback_onBlacklistAdded" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine addToBlacklist:userId blacklistAdded:blacklistAdded];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeFromBlacklist:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *userId = arguments[@"userId"];
    void (^blacklistRemoved)(NSInteger code, NSString *_Nullable userId) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      blacklistRemoved = ^(NSInteger code, NSString *userId) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:userId forKey:@"userId"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveFromBlacklistCallback_onBlacklistRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeFromBlacklist:userId blacklistRemoved:blacklistRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadBlacklistStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *userId = arguments[@"userId"];

    code = [self.engine loadBlacklistStatus:userId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getBlacklistStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *userId = arguments[@"userId"];
    void (^success)(RCIMIWBlacklistStatus status) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWBlacklistStatus status) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@([RCIMWrapperArgumentAdapter convertBlacklistStatusToInteger:status]) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBlacklistStatusCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBlacklistStatusCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getBlacklistStatus:userId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadBlacklist:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadBlacklist];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getBlacklist:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(NSArray<NSString *> *_Nullable userIds) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(NSArray<NSString *> *userIds) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:userIds forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBlacklistCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBlacklistCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getBlacklist:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *keyword = arguments[@"keyword"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchMessages:type targetId:targetId channelId:channelId keyword:keyword startTime:startTime count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchMessagesByTimeRange:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *keyword = arguments[@"keyword"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    long long endTime = [(NSNumber *)arguments[@"endTime"] longLongValue];
    int offset = [(NSNumber *)arguments[@"offset"] intValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchMessagesByTimeRange:type targetId:targetId channelId:channelId keyword:keyword startTime:startTime endTime:endTime offset:offset count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchMessagesByUserId:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *userId = arguments[@"userId"];
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchMessagesByUserId:userId type:type targetId:targetId channelId:channelId startTime:startTime count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchMessagesByMessageTypes:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSArray<NSNumber *> *messageTypes = arguments[@"messageTypes"];
    NSString *keyword = arguments[@"keyword"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWMessage *> *_Nullable messages) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *messages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in messages) {
          [t_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchMessagesByMessageTypes:type targetId:targetId channelId:channelId messageTypes:messageTypes keyword:keyword startTime:startTime count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    NSArray<NSNumber *> *messageTypes = arguments[@"messageTypes"];
    NSString *keyword = arguments[@"keyword"];
    void (^success)(NSArray<RCIMIWSearchConversationResult *> *_Nullable results) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWSearchConversationResult *> *results) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWSearchConversationResult *element in results) {
          [t_arr addObject:[RCIMIWPlatformConverter convertSearchConversationResultToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchConversationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchConversationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchConversations:conversationTypes channelId:channelId messageTypes:messageTypes keyword:keyword success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeNotificationQuietHours:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *startTime = arguments[@"startTime"];
    int spanMinutes = [(NSNumber *)arguments[@"spanMinutes"] intValue];
    RCIMIWPushNotificationQuietHoursLevel level = [RCIMWrapperArgumentAdapter convertPushNotificationQuietHoursLevelFromInteger:[(NSNumber *)arguments[@"level"] integerValue]];
    void (^notificationQuietHoursChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      notificationQuietHoursChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeNotificationQuietHoursCallback_onNotificationQuietHoursChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeNotificationQuietHours:startTime spanMinutes:spanMinutes level:level notificationQuietHoursChanged:notificationQuietHoursChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeNotificationQuietHours:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^notificationQuietHoursRemovedBlock)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      notificationQuietHoursRemovedBlock = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveNotificationQuietHoursCallback_onNotificationQuietHoursRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeNotificationQuietHours:notificationQuietHoursRemovedBlock];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadNotificationQuietHours:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadNotificationQuietHours];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getNotificationQuietHours:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(NSString *_Nullable startTime, int spanMinutes, RCIMIWPushNotificationQuietHoursLevel level) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(NSString *startTime, int spanMinutes, RCIMIWPushNotificationQuietHoursLevel level) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:startTime forKey:@"startTime"];
        [arguments setValue:@(spanMinutes) forKey:@"spanMinutes"];
        [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationQuietHoursLevelToInteger:level]) forKey:@"level"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getNotificationQuietHours:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"] integerValue]];
    void (^conversationNotificationLevelChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationNotificationLevelChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeConversationNotificationLevelCallback_onConversationNotificationLevelChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeConversationNotificationLevel:type targetId:targetId channelId:channelId level:level conversationNotificationLevelChanged:conversationNotificationLevelChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadConversationNotificationLevel:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversationNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(RCIMIWPushNotificationLevel level) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPushNotificationLevel level) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversationNotificationLevel:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationTypeNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"] integerValue]];
    void (^conversationTypeNotificationLevelChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationTypeNotificationLevelChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeConversationTypeNotificationLevelCallback_onConversationTypeNotificationLevelChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeConversationTypeNotificationLevel:type level:level conversationTypeNotificationLevelChanged:conversationTypeNotificationLevelChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationTypeNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];

    code = [self.engine loadConversationTypeNotificationLevel:type];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversationTypeNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    void (^success)(RCIMIWPushNotificationLevel level) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPushNotificationLevel level) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversationTypeNotificationLevel:type success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeUltraGroupDefaultNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"] integerValue]];
    void (^ultraGroupDefaultNotificationLevelChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupDefaultNotificationLevelChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback_onUltraGroupDefaultNotificationLevelChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeUltraGroupDefaultNotificationLevel:targetId level:level ultraGroupDefaultNotificationLevelChanged:ultraGroupDefaultNotificationLevelChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupDefaultNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];

    code = [self.engine loadUltraGroupDefaultNotificationLevel:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUltraGroupDefaultNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    void (^success)(RCIMIWPushNotificationLevel level) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPushNotificationLevel level) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUltraGroupDefaultNotificationLevel:targetId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeUltraGroupChannelDefaultNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"] integerValue]];
    void (^ultraGroupChannelDefaultNotificationLevelChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupChannelDefaultNotificationLevelChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback_onUltraGroupChannelDefaultNotificationLevelChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeUltraGroupChannelDefaultNotificationLevel:targetId channelId:channelId level:level ultraGroupChannelDefaultNotificationLevelChanged:ultraGroupChannelDefaultNotificationLevelChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupChannelDefaultNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadUltraGroupChannelDefaultNotificationLevel:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUltraGroupChannelDefaultNotificationLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(RCIMIWPushNotificationLevel level) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPushNotificationLevel level) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUltraGroupChannelDefaultNotificationLevel:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changePushContentShowStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    BOOL showContent = [(NSNumber *)arguments[@"showContent"] boolValue];
    void (^pushContentShowStatusChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      pushContentShowStatusChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangePushContentShowStatusCallback_onPushContentShowStatusChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changePushContentShowStatus:showContent pushContentShowStatusChanged:pushContentShowStatusChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changePushLanguage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *language = arguments[@"language"];
    void (^pushLanguageChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      pushLanguageChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangePushLanguageCallback_onPushLanguageChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changePushLanguage:language pushLanguageChanged:pushLanguageChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changePushReceiveStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    BOOL receive = [(NSNumber *)arguments[@"receive"] boolValue];
    void (^pushReceiveStatusChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      pushReceiveStatusChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangePushReceiveStatusCallback_onPushReceiveStatusChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changePushReceiveStatus:receive pushReceiveStatusChanged:pushReceiveStatusChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendGroupMessageToDesignatedUsers:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^messageSaved)(RCIMIWMessage *_Nullable message) = nil;
    void (^messageSent)(NSInteger code, RCIMIWMessage *_Nullable message) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      messageSaved = ^(RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSaved" arguments:arguments.copy];
        });
      };
      messageSent = ^(NSInteger code, RCIMIWMessage *message) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSent" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine sendGroupMessageToDesignatedUsers:message userIds:userIds messageSaved:messageSaved messageSent:messageSent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadMessageCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadMessageCount:type targetId:targetId channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getMessageCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessageCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMessageCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getMessageCount:type targetId:targetId channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadTopConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadTopConversations:conversationTypes channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getTopConversations:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    void (^success)(NSArray<RCIMIWConversation *> *_Nullable conversations) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversation *> *conversations) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversation *element in conversations) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTopConversationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTopConversationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getTopConversations:conversationTypes channelId:channelId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)syncUltraGroupReadStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    void (^ultraGroupReadStatusSynced)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupReadStatusSynced = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSyncUltraGroupReadStatusCallback_onUltraGroupReadStatusSynced" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine syncUltraGroupReadStatus:targetId channelId:channelId timestamp:timestamp ultraGroupReadStatusSynced:ultraGroupReadStatusSynced];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationsForAllChannel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];

    code = [self.engine loadConversationsForAllChannel:type targetId:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversationsForAllChannel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    void (^success)(NSArray<RCIMIWConversation *> *_Nullable conversations) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversation *> *conversations) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversation *element in conversations) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversationsForAllChannel:type targetId:targetId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)modifyUltraGroupMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    RCIMIWMessage *message = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    void (^ultraGroupMessageModified)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupMessageModified = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWModifyUltraGroupMessageCallback_onUltraGroupMessageModified" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine modifyUltraGroupMessage:messageUId message:message ultraGroupMessageModified:ultraGroupMessageModified];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)recallUltraGroupMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message = [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    BOOL deleteRemote = [(NSNumber *)arguments[@"deleteRemote"] boolValue];
    void (^ultraGroupMessageRecalled)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupMessageRecalled = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRecallUltraGroupMessageCallback_onUltraGroupMessageRecalled" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine recallUltraGroupMessage:message deleteRemote:deleteRemote ultraGroupMessageRecalled:ultraGroupMessageRecalled];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearUltraGroupMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    RCIMIWMessageOperationPolicy policy = [RCIMWrapperArgumentAdapter convertMessageOperationPolicyFromInteger:[(NSNumber *)arguments[@"policy"] integerValue]];
    void (^ultraGroupMessagesCleared)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupMessagesCleared = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearUltraGroupMessagesCallback_onUltraGroupMessagesCleared" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine clearUltraGroupMessages:targetId channelId:channelId timestamp:timestamp policy:policy ultraGroupMessagesCleared:ultraGroupMessagesCleared];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendUltraGroupTypingStatus:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWUltraGroupTypingStatus typingStatus = [RCIMWrapperArgumentAdapter convertUltraGroupTypingStatusFromInteger:[(NSNumber *)arguments[@"typingStatus"] integerValue]];
    void (^ultraGroupTypingStatusSent)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupTypingStatusSent = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSendUltraGroupTypingStatusCallback_onUltraGroupTypingStatusSent" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine sendUltraGroupTypingStatus:targetId channelId:channelId typingStatus:typingStatus ultraGroupTypingStatusSent:ultraGroupTypingStatusSent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearUltraGroupMessagesForAllChannel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    void (^ultraGroupMessagesClearedForAllChannel)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupMessagesClearedForAllChannel = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearUltraGroupMessagesForAllChannelCallback_onUltraGroupMessagesClearedForAllChannel" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine clearUltraGroupMessagesForAllChannel:targetId timestamp:timestamp ultraGroupMessagesClearedForAllChannel:ultraGroupMessagesClearedForAllChannel];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadBatchRemoteUltraGroupMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    code = [self.engine loadBatchRemoteUltraGroupMessages:messages];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getBatchRemoteUltraGroupMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    void (^success)(NSArray<RCIMIWMessage *> *_Nullable matchedMessages, NSArray<RCIMIWMessage *> *_Nullable notMatchedMessages) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWMessage *> *matchedMessages, NSArray<RCIMIWMessage *> *notMatchedMessages) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *matchedMessages_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in matchedMessages) {
          [matchedMessages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:matchedMessages_arr.copy forKey:@"matchedMessages"];

        NSMutableArray *notMatchedMessages_arr = [NSMutableArray array];
        for (RCIMIWMessage *element in notMatchedMessages) {
          [notMatchedMessages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
        }
        [arguments setValue:notMatchedMessages_arr.copy forKey:@"notMatchedMessages"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getBatchRemoteUltraGroupMessages:messages success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateUltraGroupMessageExpansion:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSDictionary<NSString *, NSString *> *expansion = arguments[@"expansion"];
    void (^ultraGroupMessageExpansionUpdated)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupMessageExpansionUpdated = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateUltraGroupMessageExpansionCallback_onUltraGroupMessageExpansionUpdated" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine updateUltraGroupMessageExpansion:messageUId expansion:expansion ultraGroupMessageExpansionUpdated:ultraGroupMessageExpansionUpdated];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeUltraGroupMessageExpansionForKeys:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSArray<NSString *> *keys = arguments[@"keys"];
    void (^ultraGroupMessageExpansionForKeysRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      ultraGroupMessageExpansionForKeysRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback_onUltraGroupMessageExpansionForKeysRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeUltraGroupMessageExpansionForKeys:messageUId keys:keys ultraGroupMessageExpansionForKeysRemoved:ultraGroupMessageExpansionForKeysRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeLogLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWLogLevel level = [RCIMWrapperArgumentAdapter convertLogLevelFromInteger:[(NSNumber *)arguments[@"level"] integerValue]];

    code = [self.engine changeLogLevel:level];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getDeltaTime:(FlutterMethodCall *)call result:(FlutterResult)result {
  long long code;
  if (self.engine != nil) {

    code = [self.engine getDeltaTime];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getAppSettings:(FlutterMethodCall *)call result:(FlutterResult)result {
  RCIMIWAppSettings *res = nil;
  if (self.engine != nil) {

    res = [self.engine getAppSettings];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertAppSettingsToDict:res]);
  });
}

- (void)createTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    NSString *tagName = arguments[@"tagName"];
    void (^tagCreated)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      tagCreated = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWCreateTagCallback_onTagCreated" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine createTag:tagId tagName:tagName tagCreated:tagCreated];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    void (^tagRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      tagRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveTagCallback_onTagRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeTag:tagId tagRemoved:tagRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateTagNameById:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    NSString *newName = arguments[@"newName"];
    void (^tagNameByIdUpdated)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      tagNameByIdUpdated = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateTagNameByIdCallback_onTagNameByIdUpdated" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine updateTagNameById:tagId newName:newName tagNameByIdUpdated:tagNameByIdUpdated];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getTags:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(NSArray<RCIMIWTagInfo *> *_Nullable results) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(NSArray<RCIMIWTagInfo *> *results) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWTagInfo *element in results) {
          [t_arr addObject:[RCIMIWPlatformConverter convertTagInfoToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTagsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTagsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getTags:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addConversationToTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    void (^conversationToTagAdded)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationToTagAdded = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAddConversationToTagCallback_onConversationToTagAdded" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine addConversationToTag:tagId type:type targetId:targetId conversationToTagAdded:conversationToTagAdded];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeConversationFromTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    void (^conversationFromTagRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationFromTagRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveConversationFromTagCallback_onConversationFromTagRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeConversationFromTag:tagId type:type targetId:targetId conversationFromTagRemoved:conversationFromTagRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeTagsFromConversation:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSArray<NSString *> *tagIds = arguments[@"tagIds"];
    void (^tagsFromConversationRemoved)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      tagsFromConversationRemoved = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveTagsFromConversationCallback_onTagsFromConversationRemoved" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeTagsFromConversation:type targetId:targetId tagIds:tagIds tagsFromConversationRemoved:tagsFromConversationRemoved];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getTagsFromConversation:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    void (^success)(NSArray<RCIMIWConversationTagInfo *> *_Nullable conversations) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversationTagInfo *> *conversations) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversationTagInfo *element in conversations) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationTagInfoToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTagsFromConversationCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetTagsFromConversationCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getTagsFromConversation:type targetId:targetId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversationsFromTagByPage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];
    void (^success)(NSArray<RCIMIWConversation *> *_Nullable conversations) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWConversation *> *conversations) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWConversation *element in conversations) {
          [t_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversationsFromTagByPage:tagId timestamp:timestamp count:count success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUnreadCountByTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    BOOL contain = [(NSNumber *)arguments[@"contain"] boolValue];
    void (^success)(NSInteger count) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger count) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(count) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUnreadCountCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUnreadCountByTag:tagId contain:contain success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationTopStatusInTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    BOOL top = [(NSNumber *)arguments[@"top"] boolValue];
    void (^conversationTopStatusInTagChanged)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      conversationTopStatusInTagChanged = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWChangeConversationTopStatusInTagCallback_onConversationTopStatusInTagChanged" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine changeConversationTopStatusInTag:tagId type:type targetId:targetId top:top conversationTopStatusInTagChanged:conversationTopStatusInTagChanged];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getConversationTopStatusInTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"] integerValue]];
    NSString *targetId = arguments[@"targetId"];
    void (^success)(BOOL top) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(BOOL top) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(top) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getConversationTopStatusInTag:tagId type:type targetId:targetId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearMessagesUnreadStatusByTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    void (^success)(BOOL top) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(BOOL top) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(top) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine clearMessagesUnreadStatusByTag:tagId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearConversationsByTag:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *tagId = arguments[@"tagId"];
    BOOL deleteMessage = [(NSNumber *)arguments[@"deleteMessage"] boolValue];
    void (^success)(BOOL top) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(BOOL top) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(top) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearConversationsByTagCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWClearConversationsByTagCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine clearConversationsByTag:tagId deleteMessage:deleteMessage success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)setModuleName:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *moduleName = arguments[@"moduleName"];
    NSString *version = arguments[@"version"];

    code = [self.engine setModuleName:moduleName version:version];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)writeLog:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *method = arguments[@"method"];
    NSString *callMethod = arguments[@"callMethod"];
    int codeValue = [(NSNumber *)arguments[@"codeValue"] intValue];
    NSString *message = arguments[@"message"];

    code = [self.engine writeLog:method callMethod:callMethod codeValue:codeValue message:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)createGroup:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWGroupInfo *groupInfo = [RCIMIWPlatformConverter convertGroupInfoFromDict:arguments[@"groupInfo"]];
    NSArray<NSString *> *inviteeUserIds = arguments[@"inviteeUserIds"];
    void (^success)(NSInteger processCode) = nil;
    void (^error)(NSInteger errorCode, NSString *_Nullable errorInfo) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger processCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(processCode) forKey:@"processCode"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWCreateGroupCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode, NSString *errorInfo) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"errorCode"];
        [arguments setValue:errorInfo forKey:@"errorInfo"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWCreateGroupCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine createGroup:groupInfo inviteeUserIds:inviteeUserIds success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateGroupInfo:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWGroupInfo *groupInfo = [RCIMIWPlatformConverter convertGroupInfoFromDict:arguments[@"groupInfo"]];
    void (^groupInfoUpdated)(NSInteger code, NSString *_Nullable errorInfo) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      groupInfoUpdated = ^(NSInteger code, NSString *errorInfo) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:errorInfo forKey:@"errorInfo"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGroupInfoUpdatedCallback_onGroupInfoUpdated" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine updateGroupInfo:groupInfo groupInfoUpdated:groupInfoUpdated];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getGroupsInfo:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSString *> *groupIds = arguments[@"groupIds"];
    void (^success)(NSArray<RCIMIWGroupInfo *> *_Nullable groupInfos) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWGroupInfo *> *groupInfos) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWGroupInfo *element in groupInfos) {
          [t_arr addObject:[RCIMIWPlatformConverter convertGroupInfoToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupsInfoCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupsInfoCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getGroupsInfo:groupIds success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)kickGroupMembers:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    RCIMIWQuitGroupConfig *config = [RCIMIWPlatformConverter convertQuitGroupConfigFromDict:arguments[@"config"]];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWKickGroupMembersCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine kickGroupMembers:groupId userIds:userIds config:config onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)joinGroup:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    void (^success)(NSInteger processCode) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger processCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(processCode) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWJoinGroupCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWJoinGroupCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine joinGroup:groupId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)quitGroup:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    RCIMIWQuitGroupConfig *config = [RCIMIWPlatformConverter convertQuitGroupConfigFromDict:arguments[@"config"]];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWQuitGroupCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine quitGroup:groupId config:config onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)dismissGroup:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWDismissGroupCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine dismissGroup:groupId onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)transferGroupOwner:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *newOwnerId = arguments[@"newOwnerId"];
    BOOL quitGroup = [(NSNumber *)arguments[@"quitGroup"] boolValue];
    RCIMIWQuitGroupConfig *config = [RCIMIWPlatformConverter convertQuitGroupConfigFromDict:arguments[@"config"]];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTransferGroupOwnerCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine transferGroupOwner:groupId newOwnerId:newOwnerId quitGroup:quitGroup config:config onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getGroupMembers:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^success)(NSArray<RCIMIWGroupMemberInfo *> *_Nullable groupMembers) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWGroupMemberInfo *> *groupMembers) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWGroupMemberInfo *element in groupMembers) {
          [t_arr addObject:[RCIMIWPlatformConverter convertGroupMemberInfoToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupMembersCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupMembersCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getGroupMembers:groupId userIds:userIds success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getGroupMembersByRole:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    RCIMIWGroupMemberRole role = [RCIMWrapperArgumentAdapter convertGroupMemberRoleFromInteger:[(NSNumber *)arguments[@"role"] integerValue]];
    RCIMIWPagingQueryOption *option = [RCIMIWPlatformConverter convertPagingQueryOptionFromDict:arguments[@"option"]];
    void (^success)(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo *> *_Nullable result) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo *> *result) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertPagingQueryResultToDict:result] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getGroupMembersByRole:groupId role:role option:option success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getJoinedGroupsByRole:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWGroupMemberRole role = [RCIMWrapperArgumentAdapter convertGroupMemberRoleFromInteger:[(NSNumber *)arguments[@"role"] integerValue]];
    RCIMIWPagingQueryOption *option = [RCIMIWPlatformConverter convertPagingQueryOptionFromDict:arguments[@"option"]];
    void (^success)(RCIMIWPagingQueryResult<RCIMIWGroupInfo *> *_Nullable result) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPagingQueryResult<RCIMIWGroupInfo *> *result) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertPagingQueryResultToDict:result] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getJoinedGroupsByRole:role option:option success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getJoinedGroups:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSString *> *groupIds = arguments[@"groupIds"];
    void (^success)(NSArray<RCIMIWGroupInfo *> *_Nullable groupInfos) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWGroupInfo *> *groupInfos) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWGroupInfo *element in groupInfos) {
          [t_arr addObject:[RCIMIWPlatformConverter convertGroupInfoToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetJoinedGroupsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetJoinedGroupsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getJoinedGroups:groupIds success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)setGroupRemark:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *remark = arguments[@"remark"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSetGroupRemarkCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine setGroupRemark:groupId remark:remark onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)setGroupMemberInfo:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *userId = arguments[@"userId"];
    NSString *nickname = arguments[@"nickname"];
    NSString *extra = arguments[@"extra"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSetGroupMemberInfoCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine setGroupMemberInfo:groupId userId:userId nickname:nickname extra:extra onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchJoinedGroups:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupName = arguments[@"groupName"];
    RCIMIWPagingQueryOption *option = [RCIMIWPlatformConverter convertPagingQueryOptionFromDict:arguments[@"option"]];
    void (^success)(RCIMIWPagingQueryResult<RCIMIWGroupInfo *> *_Nullable result) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPagingQueryResult<RCIMIWGroupInfo *> *result) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertPagingQueryResultToDict:result] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchJoinedGroupsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchJoinedGroupsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchJoinedGroups:groupName option:option success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchGroupMembers:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *name = arguments[@"name"];
    RCIMIWPagingQueryOption *option = [RCIMIWPlatformConverter convertPagingQueryOptionFromDict:arguments[@"option"]];
    void (^success)(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo *> *_Nullable result) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo *> *result) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertPagingQueryResultToDict:result] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchGroupMembersCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchGroupMembersCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchGroupMembers:groupId name:name option:option success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addGroupManagers:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAddGroupManagersCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine addGroupManagers:groupId userIds:userIds onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeGroupManagers:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveGroupManagersCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeGroupManagers:groupId userIds:userIds onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)inviteUsersToGroup:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^success)(NSInteger processCode) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger processCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(processCode) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWInviteUsersToGroupCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWInviteUsersToGroupCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine inviteUsersToGroup:groupId userIds:userIds success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)acceptGroupInvite:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *inviterId = arguments[@"inviterId"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAcceptGroupInviteCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine acceptGroupInvite:groupId inviterId:inviterId onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)refuseGroupInvite:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *inviterId = arguments[@"inviterId"];
    NSString *reason = arguments[@"reason"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRefuseGroupInviteCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine refuseGroupInvite:groupId inviterId:inviterId reason:reason onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)acceptGroupApplication:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *inviterId = arguments[@"inviterId"];
    NSString *applicantId = arguments[@"applicantId"];
    void (^success)(NSInteger processCode) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSInteger processCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(processCode) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAcceptGroupApplicationCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAcceptGroupApplicationCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine acceptGroupApplication:groupId inviterId:inviterId applicantId:applicantId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)refuseGroupApplication:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSString *inviterId = arguments[@"inviterId"];
    NSString *applicantId = arguments[@"applicantId"];
    NSString *reason = arguments[@"reason"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRefuseGroupApplicationCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine refuseGroupApplication:groupId inviterId:inviterId applicantId:applicantId reason:reason onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getGroupApplications:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWPagingQueryOption *option = [RCIMIWPlatformConverter convertPagingQueryOptionFromDict:arguments[@"option"]];
    NSArray<NSNumber *> *directions = arguments[@"directions"];
    NSArray<NSNumber *> *status = arguments[@"status"];
    void (^success)(RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo *> *_Nullable result) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo *> *result) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertPagingQueryResultToDict:result] forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupApplicationsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupApplicationsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getGroupApplications:option directions:directions status:status success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addGroupFollows:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWAddGroupFollowsCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine addGroupFollows:groupId userIds:userIds onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeGroupFollows:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^onCompleted)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      onCompleted = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWRemoveGroupFollowsCallback_onCompleted" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine removeGroupFollows:groupId userIds:userIds onCompleted:onCompleted];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getGroupFollows:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *groupId = arguments[@"groupId"];
    void (^success)(NSArray<RCIMIWFollowInfo *> *_Nullable followInfos) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWFollowInfo *> *followInfos) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *t_arr = [NSMutableArray array];
        for (RCIMIWFollowInfo *element in followInfos) {
          [t_arr addObject:[RCIMIWPlatformConverter convertFollowInfoToDict:element]];
        }
        [arguments setValue:t_arr.copy forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupFollowsCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetGroupFollowsCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getGroupFollows:groupId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)setCheckChatRoomDuplicateMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    BOOL enableCheck = [(NSNumber *)arguments[@"enableCheck"] boolValue];

    code = [self.engine setCheckChatRoomDuplicateMessage:enableCheck];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)translateMessagesWithParams:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWTranslateMessagesParams *params = [RCIMIWPlatformConverter convertTranslateMessagesParamsFromDict:arguments[@"params"]];
    void (^completionHandler)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      completionHandler = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine translateMessagesWithParams:params completionHandler:completionHandler];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)translateTextsWithParams:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWTranslateTextParams *params = [RCIMIWPlatformConverter convertTranslateTextParamsFromDict:arguments[@"params"]];
    void (^completionHandler)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      completionHandler = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine translateTextsWithParams:params completionHandler:completionHandler];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)setTranslationLanguage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *language = arguments[@"language"];
    void (^completionHandler)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      completionHandler = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine setTranslationLanguage:language completionHandler:completionHandler];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getTranslationLanguage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(NSString *_Nullable language) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(NSString *language) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:language forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTranslateGetLanguageCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTranslateGetLanguageCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getTranslationLanguage:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)setAutoTranslateEnable:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    BOOL isEnable = [(NSNumber *)arguments[@"isEnable"] boolValue];
    void (^completionHandler)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      completionHandler = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine setAutoTranslateEnable:isEnable completionHandler:completionHandler];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getAutoTranslateEnabled:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(BOOL isEnable) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(BOOL isEnable) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(isEnable) forKey:@"t"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getAutoTranslateEnabled:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)batchSetConversationTranslateStrategy:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *types = arguments[@"types"];
    NSArray<NSString *> *targetIds = arguments[@"targetIds"];
    NSArray<NSString *> *channelIds = arguments[@"channelIds"];
    RCIMIWTranslateStrategy strategy = [RCIMWrapperArgumentAdapter convertTranslateStrategyFromInteger:[(NSNumber *)arguments[@"strategy"] integerValue]];
    void (^completionHandler)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      completionHandler = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine batchSetConversationTranslateStrategy:types targetIds:targetIds channelIds:channelIds strategy:strategy completionHandler:completionHandler];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)calculateTextMD5:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSString *code;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *text = arguments[@"text"];

    code = [self.engine calculateTextMD5:text];
  }
  dispatch_to_main_queue(^{
    result(code);
  });
}

- (void)updateMyUserProfileVisibility:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWUserProfileVisibility visibility = [RCIMWrapperArgumentAdapter convertUserProfileVisibilityFromInteger:[(NSNumber *)arguments[@"visibility"] integerValue]];
    void (^success)() = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^() {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"errorCode"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine updateMyUserProfileVisibility:visibility success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getMyUserProfileVisibility:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(NSInteger visibility) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(NSInteger visibility) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(visibility) forKey:@"visibility"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"errorCode"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getMyUserProfileVisibility:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateMyUserProfile:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWUserProfile *profile = [RCIMIWPlatformConverter convertUserProfileFromDict:arguments[@"profile"]];
    void (^successBlock)() = nil;
    void (^errorBlock)(NSInteger errorCode, NSArray<NSString *> *_Nullable errorKeys) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^() {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateMyUserProfileCallback_onSuccess" arguments:arguments.copy];
        });
      };
      errorBlock = ^(NSInteger errorCode, NSArray<NSString *> *errorKeys) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"errorCode"];
        [arguments setValue:errorKeys forKey:@"errorKeys"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWUpdateMyUserProfileCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine updateMyUserProfile:profile successBlock:successBlock errorBlock:errorBlock];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getMyUserProfile:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    void (^successBlock)(RCIMIWUserProfile *_Nullable userProfile) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      successBlock = ^(RCIMIWUserProfile *userProfile) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertUserProfileToDict:userProfile] forKey:@"userProfile"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMyUserProfileCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"errorCode"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetMyUserProfileCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getMyUserProfile:successBlock error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)getUserProfiles:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSString *> *userIds = arguments[@"userIds"];
    void (^success)(NSArray<RCIMIWUserProfile *> *_Nullable userProfiles) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWUserProfile *> *userProfiles) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *userProfiles_arr = [NSMutableArray array];
        for (RCIMIWUserProfile *element in userProfiles) {
          [userProfiles_arr addObject:[RCIMIWPlatformConverter convertUserProfileToDict:element]];
        }
        [arguments setValue:userProfiles_arr.copy forKey:@"userProfiles"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUserProfilesCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"errorCode"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWGetUserProfilesCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine getUserProfiles:userIds success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchUserProfileByUniqueId:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *uniqueId = arguments[@"uniqueId"];
    void (^success)(RCIMIWUserProfile *_Nullable userProfile) = nil;
    void (^error)(NSInteger errorCode) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(RCIMIWUserProfile *userProfile) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:[RCIMIWPlatformConverter convertUserProfileToDict:userProfile] forKey:@"userProfile"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger errorCode) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(errorCode) forKey:@"errorCode"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine searchUserProfileByUniqueId:uniqueId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)subscribeEvent:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWSubscribeEventRequest *request = [RCIMIWPlatformConverter convertSubscribeEventRequestFromDict:arguments[@"request"]];
    void (^success)() = nil;
    void (^error)(NSInteger code, NSArray<NSString *> *_Nullable failedUserIds) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^() {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSubscribeEventCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code, NSArray<NSString *> *failedUserIds) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:failedUserIds forKey:@"failedUserIds"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSubscribeEventCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine subscribeEvent:request success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)unSubscribeEvent:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWSubscribeEventRequest *request = [RCIMIWPlatformConverter convertSubscribeEventRequestFromDict:arguments[@"request"]];
    void (^success)() = nil;
    void (^error)(NSInteger code, NSArray<NSString *> *_Nullable failedUserIds) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^() {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSubscribeEventCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code, NSArray<NSString *> *failedUserIds) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];
        [arguments setValue:failedUserIds forKey:@"failedUserIds"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWSubscribeEventCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine unSubscribeEvent:request success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)querySubscribeEvent:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWSubscribeEventRequest *request = [RCIMIWPlatformConverter convertSubscribeEventRequestFromDict:arguments[@"request"]];
    void (^success)(NSArray<RCIMIWSubscribeInfoEvent *> *_Nullable subscribeEvents) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWSubscribeInfoEvent *> *subscribeEvents) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *events_arr = [NSMutableArray array];
        for (RCIMIWSubscribeInfoEvent *element in subscribeEvents) {
          [events_arr addObject:[RCIMIWPlatformConverter convertSubscribeInfoEventToDict:element]];
        }
        [arguments setValue:events_arr.copy forKey:@"events"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWQuerySubscribeEventCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWQuerySubscribeEventCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine querySubscribeEvent:request success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)querySubscribeEventByPage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWSubscribeEventRequest *request = [RCIMIWPlatformConverter convertSubscribeEventRequestFromDict:arguments[@"request"]];
    NSInteger pageSize = [(NSNumber *)arguments[@"pageSize"] intValue];
    NSInteger startIndex = [(NSNumber *)arguments[@"startIndex"] intValue];
    void (^success)(NSArray<RCIMIWSubscribeInfoEvent *> *_Nullable subscribeEvents) = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^(NSArray<RCIMIWSubscribeInfoEvent *> *subscribeEvents) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        NSMutableArray *events_arr = [NSMutableArray array];
        for (RCIMIWSubscribeInfoEvent *element in subscribeEvents) {
          [events_arr addObject:[RCIMIWPlatformConverter convertSubscribeInfoEventToDict:element]];
        }
        [arguments setValue:events_arr.copy forKey:@"events"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWQuerySubscribeEventCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWQuerySubscribeEventCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine querySubscribeEventByPage:request pageSize:pageSize startIndex:startIndex success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)requestSpeechToTextForMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    void (^success)() = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^() {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWOperationCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWOperationCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine requestSpeechToTextForMessage:messageUId success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)setMessageSpeechToTextVisible:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSInteger messageId = [(NSNumber *)arguments[@"messageId"] intValue];
    BOOL visible = [(NSNumber *)arguments[@"visible"] boolValue];
    void (^success)() = nil;
    void (^error)(NSInteger code) = nil;
    int cb_handler = [(NSNumber *)arguments[@"cb_handler"] intValue];
    if (cb_handler != -1) {
      success = ^() {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWOperationCallback_onSuccess" arguments:arguments.copy];
        });
      };
      error = ^(NSInteger code) {
        NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
        [arguments setValue:@(cb_handler) forKey:@"cb_handler"];
        [arguments setValue:@(code) forKey:@"code"];

        __weak typeof(self.channel) weak = self.channel;
        dispatch_to_main_queue(^{
          typeof(weak) strong = weak;
          [strong invokeMethod:@"engine_cb:IRCIMIWOperationCallback_onError" arguments:arguments.copy];
        });
      };
    }
    code = [self.engine setMessageSpeechToTextVisible:messageId visible:visible success:success error:error];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)onMessageReceived:(RCIMIWMessage *)message left:(NSInteger)left offline:(BOOL)offline hasPackage:(BOOL)hasPackage {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];
  [arguments setValue:@(left) forKey:@"left"];
  [arguments setValue:@(offline) forKey:@"offline"];
  [arguments setValue:@(hasPackage) forKey:@"hasPackage"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageReceived" arguments:arguments.copy];
  });
}

- (void)onOfflineMessageSyncCompleted {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onOfflineMessageSyncCompleted" arguments:arguments.copy];
  });
}

- (void)onConnectionStatusChanged:(RCIMIWConnectionStatus)status {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConnectionStatusToInteger:status]) forKey:@"status"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConnectionStatusChanged" arguments:arguments.copy];
  });
}

- (void)onConversationTopStatusSynced:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId top:(BOOL)top {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(top) forKey:@"top"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTopStatusSynced" arguments:arguments.copy];
  });
}

- (void)onConversationNotificationLevelSynced:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationNotificationLevelSynced" arguments:arguments.copy];
  });
}

- (void)onConversationTranslationStrategySynced:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId strategy:(RCIMIWTranslateStrategy)strategy {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertTranslateStrategyToInteger:strategy]) forKey:@"strategy"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTranslationStrategySynced" arguments:arguments.copy];
  });
}

- (void)onRemoteMessageRecalled:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteMessageRecalled" arguments:arguments.copy];
  });
}

- (void)onPrivateReadReceiptReceived:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPrivateReadReceiptReceived" arguments:arguments.copy];
  });
}

- (void)onRemoteMessageExpansionUpdated:(NSDictionary<NSString *, NSString *> *)expansion message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:expansion forKey:@"expansion"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteMessageExpansionUpdated" arguments:arguments.copy];
  });
}

- (void)onRemoteMessageExpansionForKeyRemoved:(RCIMIWMessage *)message keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteMessageExpansionForKeyRemoved" arguments:arguments.copy];
  });
}

- (void)onChatRoomMemberChanged:(NSString *)targetId actions:(NSArray<RCIMIWChatRoomMemberAction *> *)actions {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];

  NSMutableArray *actions_arr = [NSMutableArray array];
  for (RCIMIWChatRoomMemberAction *element in actions) {
    [actions_arr addObject:[RCIMIWPlatformConverter convertChatRoomMemberActionToDict:element]];
  }
  [arguments setValue:actions_arr.copy forKey:@"actions"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomMemberChanged" arguments:arguments.copy];
  });
}

- (void)onTypingStatusChanged:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId userTypingStatus:(NSArray<RCIMIWTypingStatus *> *)userTypingStatus {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *userTypingStatus_arr = [NSMutableArray array];
  for (RCIMIWTypingStatus *element in userTypingStatus) {
    [userTypingStatus_arr addObject:[RCIMIWPlatformConverter convertTypingStatusToDict:element]];
  }
  [arguments setValue:userTypingStatus_arr.copy forKey:@"userTypingStatus"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTypingStatusChanged" arguments:arguments.copy];
  });
}

- (void)onConversationReadStatusSyncMessageReceived:(RCIMIWConversationType)type targetId:(NSString *)targetId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationReadStatusSyncMessageReceived" arguments:arguments.copy];
  });
}

- (void)onChatRoomEntriesSynced:(NSString *)roomId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:roomId forKey:@"roomId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesSynced" arguments:arguments.copy];
  });
}

- (void)onChatRoomEntriesChanged:(RCIMIWChatRoomEntriesOperationType)operationType roomId:(NSString *)roomId entries:(NSDictionary<NSString *, NSString *> *)entries {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertChatRoomEntriesOperationTypeToInteger:operationType]) forKey:@"operationType"];
  [arguments setValue:roomId forKey:@"roomId"];
  [arguments setValue:entries forKey:@"entries"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesChanged" arguments:arguments.copy];
  });
}

- (void)onRemoteUltraGroupMessageExpansionUpdated:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteUltraGroupMessageExpansionUpdated" arguments:arguments.copy];
  });
}

- (void)onRemoteUltraGroupMessageModified:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteUltraGroupMessageModified" arguments:arguments.copy];
  });
}

- (void)onRemoteUltraGroupMessageRecalled:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteUltraGroupMessageRecalled" arguments:arguments.copy];
  });
}

- (void)onUltraGroupReadTimeReceived:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupReadTimeReceived" arguments:arguments.copy];
  });
}

- (void)onUltraGroupTypingStatusChanged:(NSArray<RCIMIWUltraGroupTypingStatusInfo *> *)info {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *info_arr = [NSMutableArray array];
  for (RCIMIWUltraGroupTypingStatusInfo *element in info) {
    [info_arr addObject:[RCIMIWPlatformConverter convertUltraGroupTypingStatusInfoToDict:element]];
  }
  [arguments setValue:info_arr.copy forKey:@"info"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupTypingStatusChanged" arguments:arguments.copy];
  });
}

- (void)onSpeechToTextCompleted:(nullable RCIMIWSpeechToTextInfo *)info messageUId:(NSString *)messageUId code:(NSInteger)code {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertSpeechToTextInfoToDict:info] forKey:@"info"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:@(code) forKey:@"code"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onSpeechToTextCompleted" arguments:arguments.copy];
  });
}

- (void)onMessageBlocked:(RCIMIWBlockedMessageInfo *)info {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertBlockedMessageInfoToDict:info] forKey:@"info"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageBlocked" arguments:arguments.copy];
  });
}

- (void)onChatRoomStatusChanged:(NSString *)targetId status:(RCIMIWChatRoomStatus)status {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertChatRoomStatusToInteger:status]) forKey:@"status"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomStatusChanged" arguments:arguments.copy];
  });
}

- (void)onGroupMessageReadReceiptRequestReceived:(NSString *)targetId messageUId:(NSString *)messageUId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:messageUId forKey:@"messageUId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageReadReceiptRequestReceived" arguments:arguments.copy];
  });
}

- (void)onGroupMessageReadReceiptResponseReceived:(NSString *)targetId messageUId:(NSString *)messageUId respondUserIds:(NSDictionary<NSString *, NSNumber *> *)respondUserIds {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:respondUserIds forKey:@"respondUserIds"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageReadReceiptResponseReceived" arguments:arguments.copy];
  });
}

- (void)onConnected:(NSInteger)code userId:(nullable NSString *)userId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userId forKey:@"userId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConnected" arguments:arguments.copy];
  });
}

- (void)onDatabaseOpened:(NSInteger)code {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDatabaseOpened" arguments:arguments.copy];
  });
}

- (void)onConversationLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId conversation:(nullable RCIMIWConversation *)conversation {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:[RCIMIWPlatformConverter convertConversationToDict:conversation] forKey:@"conversation"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationLoaded" arguments:arguments.copy];
  });
}

- (void)onConversationsLoaded:(NSInteger)code conversationTypes:(NSArray<NSNumber *> *)conversationTypes channelId:(NSString *)channelId startTime:(long long)startTime count:(int)count conversations:(nullable NSArray<RCIMIWConversation *> *)conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsLoaded" arguments:arguments.copy];
  });
}

- (void)onConversationRemoved:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationRemoved" arguments:arguments.copy];
  });
}

- (void)onConversationsRemoved:(NSInteger)code conversationTypes:(NSArray<NSNumber *> *)conversationTypes channelId:(NSString *)channelId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsRemoved" arguments:arguments.copy];
  });
}

- (void)onTotalUnreadCountLoaded:(NSInteger)code channelId:(NSString *)channelId count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTotalUnreadCountLoaded" arguments:arguments.copy];
  });
}

- (void)onUnreadCountLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadCountLoaded" arguments:arguments.copy];
  });
}

- (void)onUnreadCountByConversationTypesLoaded:(NSInteger)code conversationTypes:(NSArray<NSNumber *> *)conversationTypes channelId:(NSString *)channelId contain:(BOOL)contain count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(contain) forKey:@"contain"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadCountByConversationTypesLoaded" arguments:arguments.copy];
  });
}

- (void)onUnreadMentionedCountLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadMentionedCountLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupAllUnreadCountLoaded:(NSInteger)code count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupAllUnreadCountLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupAllUnreadMentionedCountLoaded:(NSInteger)code count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupAllUnreadMentionedCountLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupConversationsSynced {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupConversationsSynced" arguments:arguments.copy];
  });
}

- (void)onUnreadCountCleared:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadCountCleared" arguments:arguments.copy];
  });
}

- (void)onDraftMessageSaved:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId draft:(NSString *)draft {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:draft forKey:@"draft"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDraftMessageSaved" arguments:arguments.copy];
  });
}

- (void)onDraftMessageCleared:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDraftMessageCleared" arguments:arguments.copy];
  });
}

- (void)onDraftMessageLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId draft:(NSString *)draft {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:draft forKey:@"draft"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDraftMessageLoaded" arguments:arguments.copy];
  });
}

- (void)onBlockedConversationsLoaded:(NSInteger)code conversationTypes:(NSArray<NSNumber *> *)conversationTypes channelId:(NSString *)channelId conversations:(nullable NSArray<RCIMIWConversation *> *)conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlockedConversationsLoaded" arguments:arguments.copy];
  });
}

- (void)onConversationTopStatusChanged:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId top:(BOOL)top {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(top) forKey:@"top"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTopStatusChanged" arguments:arguments.copy];
  });
}

- (void)onConversationTopStatusLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId top:(BOOL)top {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(top) forKey:@"top"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTopStatusLoaded" arguments:arguments.copy];
  });
}

- (void)onConversationReadStatusSynced:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationReadStatusSynced" arguments:arguments.copy];
  });
}

- (void)onMessageAttached:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageAttached" arguments:arguments.copy];
  });
}

- (void)onMessageSent:(NSInteger)code message:(nullable RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageSent" arguments:arguments.copy];
  });
}

- (void)onMediaMessageAttached:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageAttached" arguments:arguments.copy];
  });
}

- (void)onMediaMessageSending:(RCIMIWMediaMessage *)message progress:(int)progress {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];
  [arguments setValue:@(progress) forKey:@"progress"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageSending" arguments:arguments.copy];
  });
}

- (void)onSendingMediaMessageCanceled:(NSInteger)code message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onSendingMediaMessageCanceled" arguments:arguments.copy];
  });
}

- (void)onMediaMessageSent:(NSInteger)code message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageSent" arguments:arguments.copy];
  });
}

- (void)onMediaMessageDownloading:(RCIMIWMediaMessage *)message progress:(int)progress {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];
  [arguments setValue:@(progress) forKey:@"progress"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageDownloading" arguments:arguments.copy];
  });
}

- (void)onMediaMessageDownloaded:(NSInteger)code message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageDownloaded" arguments:arguments.copy];
  });
}

- (void)onDownloadingMediaMessageCanceled:(NSInteger)code message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDownloadingMediaMessageCanceled" arguments:arguments.copy];
  });
}

- (void)onMessagesLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId sentTime:(long long)sentTime order:(RCIMIWTimeOrder)order messages:(nullable NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(sentTime) forKey:@"sentTime"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertTimeOrderToInteger:order]) forKey:@"order"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesLoaded" arguments:arguments.copy];
  });
}

- (void)onUnreadMentionedMessagesLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadMentionedMessagesLoaded" arguments:arguments.copy];
  });
}

- (void)onFirstUnreadMessageLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onFirstUnreadMessageLoaded" arguments:arguments.copy];
  });
}

- (void)onMessageInserted:(NSInteger)code message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageInserted" arguments:arguments.copy];
  });
}

- (void)onMessagesInserted:(NSInteger)code messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesInserted" arguments:arguments.copy];
  });
}

- (void)onMessagesCleared:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesCleared" arguments:arguments.copy];
  });
}

- (void)onLocalMessagesDeleted:(NSInteger)code messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onLocalMessagesDeleted" arguments:arguments.copy];
  });
}

- (void)onMessagesDeleted:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesDeleted" arguments:arguments.copy];
  });
}

- (void)onMessageRecalled:(NSInteger)code message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageRecalled" arguments:arguments.copy];
  });
}

- (void)onPrivateReadReceiptMessageSent:(NSInteger)code targetId:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPrivateReadReceiptMessageSent" arguments:arguments.copy];
  });
}

- (void)onMessageExpansionUpdated:(NSInteger)code messageUId:(NSString *)messageUId expansion:(NSDictionary<NSString *, NSString *> *)expansion {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:expansion forKey:@"expansion"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageExpansionUpdated" arguments:arguments.copy];
  });
}

- (void)onMessageExpansionForKeysRemoved:(NSInteger)code messageUId:(NSString *)messageUId keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageExpansionForKeysRemoved" arguments:arguments.copy];
  });
}

- (void)onMessageReceiveStatusChanged:(NSInteger)code messageId:(long)messageId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(messageId) forKey:@"messageId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageReceiveStatusChanged" arguments:arguments.copy];
  });
}

- (void)onMessageSentStatusChanged:(NSInteger)code messageId:(long)messageId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(messageId) forKey:@"messageId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageSentStatusChanged" arguments:arguments.copy];
  });
}

- (void)onChatRoomJoined:(NSInteger)code targetId:(NSString *)targetId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomJoined" arguments:arguments.copy];
  });
}

- (void)onChatRoomJoining:(NSString *)targetId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomJoining" arguments:arguments.copy];
  });
}

- (void)onChatRoomLeft:(NSInteger)code targetId:(NSString *)targetId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomLeft" arguments:arguments.copy];
  });
}

- (void)onChatRoomMessagesLoaded:(NSInteger)code targetId:(NSString *)targetId messages:(NSArray<RCIMIWMessage *> *)messages syncTime:(long long)syncTime {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  [arguments setValue:@(syncTime) forKey:@"syncTime"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomMessagesLoaded" arguments:arguments.copy];
  });
}

- (void)onChatRoomEntryAdded:(NSInteger)code targetId:(NSString *)targetId key:(NSString *)key {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:key forKey:@"key"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntryAdded" arguments:arguments.copy];
  });
}

- (void)onChatRoomEntriesAdded:(NSInteger)code targetId:(NSString *)targetId entries:(NSDictionary<NSString *, NSString *> *)entries errorEntries:(NSDictionary<NSString *, NSNumber *> *)errorEntries {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:entries forKey:@"entries"];
  [arguments setValue:errorEntries forKey:@"errorEntries"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesAdded" arguments:arguments.copy];
  });
}

- (void)onChatRoomEntryLoaded:(NSInteger)code targetId:(NSString *)targetId entry:(NSDictionary<NSString *, NSString *> *)entry {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:entry forKey:@"entry"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntryLoaded" arguments:arguments.copy];
  });
}

- (void)onChatRoomAllEntriesLoaded:(NSInteger)code targetId:(NSString *)targetId entries:(NSDictionary<NSString *, NSString *> *)entries {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:entries forKey:@"entries"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomAllEntriesLoaded" arguments:arguments.copy];
  });
}

- (void)onChatRoomEntryRemoved:(NSInteger)code targetId:(NSString *)targetId key:(NSString *)key {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:key forKey:@"key"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntryRemoved" arguments:arguments.copy];
  });
}

- (void)onChatRoomEntriesRemoved:(NSInteger)code targetId:(NSString *)targetId keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesRemoved" arguments:arguments.copy];
  });
}

- (void)onBlacklistAdded:(NSInteger)code userId:(NSString *)userId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userId forKey:@"userId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlacklistAdded" arguments:arguments.copy];
  });
}

- (void)onBlacklistRemoved:(NSInteger)code userId:(NSString *)userId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userId forKey:@"userId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlacklistRemoved" arguments:arguments.copy];
  });
}

- (void)onBlacklistStatusLoaded:(NSInteger)code userId:(NSString *)userId status:(RCIMIWBlacklistStatus)status {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userId forKey:@"userId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertBlacklistStatusToInteger:status]) forKey:@"status"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlacklistStatusLoaded" arguments:arguments.copy];
  });
}

- (void)onBlacklistLoaded:(NSInteger)code userIds:(NSArray<NSString *> *)userIds {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userIds forKey:@"userIds"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlacklistLoaded" arguments:arguments.copy];
  });
}

- (void)onMessagesSearched:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId keyword:(NSString *)keyword startTime:(long long)startTime count:(int)count messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:keyword forKey:@"keyword"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesSearched" arguments:arguments.copy];
  });
}

- (void)onMessagesSearchedByTimeRange:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId keyword:(NSString *)keyword startTime:(long long)startTime endTime:(long long)endTime offset:(int)offset count:(int)count messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:keyword forKey:@"keyword"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(endTime) forKey:@"endTime"];
  [arguments setValue:@(offset) forKey:@"offset"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesSearchedByTimeRange" arguments:arguments.copy];
  });
}

- (void)onMessagesSearchedByUserId:(NSInteger)code userId:(NSString *)userId type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId startTime:(long long)startTime count:(int)count messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userId forKey:@"userId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesSearchedByUserId" arguments:arguments.copy];
  });
}

- (void)onConversationsSearched:(NSInteger)code conversationTypes:(NSArray<NSNumber *> *)conversationTypes channelId:(NSString *)channelId messageTypes:(NSArray<NSNumber *> *)messageTypes keyword:(NSString *)keyword conversations:(NSArray<RCIMIWSearchConversationResult *> *)conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:messageTypes forKey:@"messageTypes"];
  [arguments setValue:keyword forKey:@"keyword"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWSearchConversationResult *element in conversations) {
    [conversations_arr addObject:[RCIMIWPlatformConverter convertSearchConversationResultToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsSearched" arguments:arguments.copy];
  });
}

- (void)onGroupReadReceiptRequestSent:(NSInteger)code message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupReadReceiptRequestSent" arguments:arguments.copy];
  });
}

- (void)onGroupReadReceiptResponseSent:(NSInteger)code targetId:(NSString *)targetId channelId:(NSString *)channelId messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupReadReceiptResponseSent" arguments:arguments.copy];
  });
}

- (void)onNotificationQuietHoursChanged:(NSInteger)code startTime:(NSString *)startTime spanMinutes:(int)spanMinutes level:(RCIMIWPushNotificationQuietHoursLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:startTime forKey:@"startTime"];
  [arguments setValue:@(spanMinutes) forKey:@"spanMinutes"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationQuietHoursLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onNotificationQuietHoursChanged" arguments:arguments.copy];
  });
}

- (void)onNotificationQuietHoursRemoved:(NSInteger)code {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onNotificationQuietHoursRemoved" arguments:arguments.copy];
  });
}

- (void)onNotificationQuietHoursLoaded:(NSInteger)code startTime:(NSString *)startTime spanMinutes:(int)spanMinutes level:(RCIMIWPushNotificationQuietHoursLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:startTime forKey:@"startTime"];
  [arguments setValue:@(spanMinutes) forKey:@"spanMinutes"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationQuietHoursLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onNotificationQuietHoursLoaded" arguments:arguments.copy];
  });
}

- (void)onConversationNotificationLevelChanged:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationNotificationLevelChanged" arguments:arguments.copy];
  });
}

- (void)onConversationNotificationLevelLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationNotificationLevelLoaded" arguments:arguments.copy];
  });
}

- (void)onConversationTypeNotificationLevelChanged:(NSInteger)code type:(RCIMIWConversationType)type level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTypeNotificationLevelChanged" arguments:arguments.copy];
  });
}

- (void)onConversationTypeNotificationLevelLoaded:(NSInteger)code type:(RCIMIWConversationType)type level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTypeNotificationLevelLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupDefaultNotificationLevelChanged:(NSInteger)code targetId:(NSString *)targetId level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupDefaultNotificationLevelChanged" arguments:arguments.copy];
  });
}

- (void)onUltraGroupDefaultNotificationLevelLoaded:(NSInteger)code targetId:(NSString *)targetId level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupDefaultNotificationLevelLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupChannelDefaultNotificationLevelChanged:(NSInteger)code targetId:(NSString *)targetId channelId:(NSString *)channelId level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupChannelDefaultNotificationLevelChanged" arguments:arguments.copy];
  });
}

- (void)onUltraGroupChannelDefaultNotificationLevelLoaded:(NSInteger)code targetId:(NSString *)targetId channelId:(NSString *)channelId level:(RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertPushNotificationLevelToInteger:level]) forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupChannelDefaultNotificationLevelLoaded" arguments:arguments.copy];
  });
}

- (void)onPushContentShowStatusChanged:(NSInteger)code showContent:(BOOL)showContent {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(showContent) forKey:@"showContent"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPushContentShowStatusChanged" arguments:arguments.copy];
  });
}

- (void)onPushLanguageChanged:(NSInteger)code language:(NSString *)language {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:language forKey:@"language"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPushLanguageChanged" arguments:arguments.copy];
  });
}

- (void)onPushReceiveStatusChanged:(NSInteger)code receive:(BOOL)receive {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(receive) forKey:@"receive"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPushReceiveStatusChanged" arguments:arguments.copy];
  });
}

- (void)onMessageCountLoaded:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId channelId:(NSString *)channelId count:(int)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageCountLoaded" arguments:arguments.copy];
  });
}

- (void)onTopConversationsLoaded:(NSInteger)code conversationTypes:(NSArray<NSNumber *> *)conversationTypes channelId:(NSString *)channelId conversations:(nullable NSArray<RCIMIWConversation *> *)conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTopConversationsLoaded" arguments:arguments.copy];
  });
}

- (void)onGroupMessageToDesignatedUsersAttached:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageToDesignatedUsersAttached" arguments:arguments.copy];
  });
}

- (void)onGroupMessageToDesignatedUsersSent:(NSInteger)code message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageToDesignatedUsersSent" arguments:arguments.copy];
  });
}

- (void)onUltraGroupReadStatusSynced:(NSInteger)code targetId:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupReadStatusSynced" arguments:arguments.copy];
  });
}

- (void)onConversationsLoadedForAllChannel:(NSInteger)code type:(RCIMIWConversationType)type targetId:(NSString *)targetId conversations:(NSArray<RCIMIWConversation *> *)conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertConversationTypeToInteger:type]) forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsLoadedForAllChannel" arguments:arguments.copy];
  });
}

- (void)onUltraGroupUnreadMentionedCountLoaded:(NSInteger)code targetId:(NSString *)targetId count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupUnreadMentionedCountLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupUnreadCountLoaded:(NSInteger)code targetId:(NSString *)targetId count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupUnreadCountLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageModified:(NSInteger)code messageUId:(NSString *)messageUId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageModified" arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageRecalled:(NSInteger)code message:(RCIMIWMessage *)message deleteRemote:(BOOL)deleteRemote {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message] forKey:@"message"];
  [arguments setValue:@(deleteRemote) forKey:@"deleteRemote"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageRecalled" arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessagesCleared:(NSInteger)code targetId:(NSString *)targetId channelId:(NSString *)channelId timestamp:(long long)timestamp policy:(RCIMIWMessageOperationPolicy)policy {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertMessageOperationPolicyToInteger:policy]) forKey:@"policy"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessagesCleared" arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessagesClearedForAllChannel:(NSInteger)code targetId:(NSString *)targetId timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessagesClearedForAllChannel" arguments:arguments.copy];
  });
}

- (void)onUltraGroupTypingStatusSent:(NSInteger)code targetId:(NSString *)targetId channelId:(NSString *)channelId typingStatus:(RCIMIWUltraGroupTypingStatus)typingStatus {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertUltraGroupTypingStatusToInteger:typingStatus]) forKey:@"typingStatus"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupTypingStatusSent" arguments:arguments.copy];
  });
}

- (void)onBatchRemoteUltraGroupMessagesLoaded:(NSInteger)code matchedMessages:(NSArray<RCIMIWMessage *> *)matchedMessages notMatchedMessages:(NSArray<RCIMIWMessage *> *)notMatchedMessages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  NSMutableArray *matchedMessages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in matchedMessages) {
    [matchedMessages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:matchedMessages_arr.copy forKey:@"matchedMessages"];

  NSMutableArray *notMatchedMessages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in notMatchedMessages) {
    [notMatchedMessages_arr addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:notMatchedMessages_arr.copy forKey:@"notMatchedMessages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBatchRemoteUltraGroupMessagesLoaded" arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageExpansionUpdated:(NSInteger)code expansion:(NSDictionary<NSString *, NSString *> *)expansion messageUId:(NSString *)messageUId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:expansion forKey:@"expansion"];
  [arguments setValue:messageUId forKey:@"messageUId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageExpansionUpdated" arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageExpansionForKeysRemoved:(NSInteger)code messageUId:(NSString *)messageUId keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageExpansionForKeysRemoved" arguments:arguments.copy];
  });
}

- (void)onGroupOperation:(NSString *)groupId operatorInfo:(RCIMIWGroupMemberInfo *)operatorInfo groupInfo:(RCIMIWGroupInfo *)groupInfo operation:(RCIMIWGroupOperation)operation memberInfos:(NSArray<RCIMIWGroupMemberInfo *> *)memberInfos operationTime:(long long)operationTime {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:groupId forKey:@"groupId"];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupMemberInfoToDict:operatorInfo] forKey:@"operatorInfo"];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupInfoToDict:groupInfo] forKey:@"groupInfo"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertGroupOperationToInteger:operation]) forKey:@"operation"];

  NSMutableArray *memberInfos_arr = [NSMutableArray array];
  for (RCIMIWGroupMemberInfo *element in memberInfos) {
    [memberInfos_arr addObject:[RCIMIWPlatformConverter convertGroupMemberInfoToDict:element]];
  }
  [arguments setValue:memberInfos_arr.copy forKey:@"memberInfos"];

  [arguments setValue:@(operationTime) forKey:@"operationTime"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupOperation" arguments:arguments.copy];
  });
}

- (void)onGroupInfoChanged:(RCIMIWGroupMemberInfo *)operatorInfo fullGroupInfo:(RCIMIWGroupInfo *)fullGroupInfo changedGroupInfo:(RCIMIWGroupInfo *)changedGroupInfo operationTime:(long long)operationTime {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupMemberInfoToDict:operatorInfo] forKey:@"operatorInfo"];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupInfoToDict:fullGroupInfo] forKey:@"fullGroupInfo"];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupInfoToDict:changedGroupInfo] forKey:@"changedGroupInfo"];
  [arguments setValue:@(operationTime) forKey:@"operationTime"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupInfoChanged" arguments:arguments.copy];
  });
}

- (void)onGroupMemberInfoChanged:(NSString *)groupId operatorInfo:(RCIMIWGroupMemberInfo *)operatorInfo memberInfo:(RCIMIWGroupMemberInfo *)memberInfo operationTime:(long long)operationTime {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:groupId forKey:@"groupId"];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupMemberInfoToDict:operatorInfo] forKey:@"operatorInfo"];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupMemberInfoToDict:memberInfo] forKey:@"memberInfo"];
  [arguments setValue:@(operationTime) forKey:@"operationTime"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMemberInfoChanged" arguments:arguments.copy];
  });
}

- (void)onGroupApplicationEvent:(RCIMIWGroupApplicationInfo *)info {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertGroupApplicationInfoToDict:info] forKey:@"info"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupApplicationEvent" arguments:arguments.copy];
  });
}

- (void)onGroupRemarkChangedSync:(NSString *)groupId operationType:(RCIMIWGroupOperationType)operationType groupRemark:(NSString *)groupRemark operationTime:(long long)operationTime {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:groupId forKey:@"groupId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertGroupOperationTypeToInteger:operationType]) forKey:@"operationType"];
  [arguments setValue:groupRemark forKey:@"groupRemark"];
  [arguments setValue:@(operationTime) forKey:@"operationTime"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupRemarkChangedSync" arguments:arguments.copy];
  });
}

- (void)onGroupFollowsChangedSync:(NSString *)groupId operationType:(RCIMIWGroupOperationType)operationType userIds:(NSArray<NSString *> *)userIds operationTime:(long long)operationTime {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:groupId forKey:@"groupId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertGroupOperationTypeToInteger:operationType]) forKey:@"operationType"];
  [arguments setValue:userIds forKey:@"userIds"];
  [arguments setValue:@(operationTime) forKey:@"operationTime"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupFollowsChangedSync" arguments:arguments.copy];
  });
}

- (void)onChatRoomNotifyMultiLoginSync:(RCIMIWChatRoomSyncEvent *)event {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertChatRoomSyncEventToDict:event] forKey:@"event"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomNotifyMultiLoginSync" arguments:arguments.copy];
  });
}

- (void)onChatRoomNotifyBlock:(RCIMIWChatRoomMemberBlockEvent *)event {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertChatRoomMemberBlockEventToDict:event] forKey:@"event"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomNotifyBlock" arguments:arguments.copy];
  });
}

- (void)onChatRoomNotifyBan:(RCIMIWChatRoomMemberBanEvent *)event {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertChatRoomMemberBanEventToDict:event] forKey:@"event"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomNotifyBan" arguments:arguments.copy];
  });
}

- (void)onTranslationDidFinished:(NSArray<RCIMIWTranslateItem *> *)items {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *items_arr = [NSMutableArray array];
  for (RCIMIWTranslateItem *element in items) {
    [items_arr addObject:[RCIMIWPlatformConverter convertTranslateItemToDict:element]];
  }
  [arguments setValue:items_arr.copy forKey:@"items"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTranslationDidFinished" arguments:arguments.copy];
  });
}

- (void)onTranslationLanguageDidChange:(NSString *)language {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:language forKey:@"language"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTranslationLanguageDidChange" arguments:arguments.copy];
  });
}

- (void)onAutoTranslateStateDidChange:(BOOL)isEnable {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(isEnable) forKey:@"isEnable"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onAutoTranslateStateDidChange" arguments:arguments.copy];
  });
}

- (void)onEventChange:(NSArray<RCIMIWSubscribeInfoEvent *> *)subscribeEvents {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *subscribeEvents_arr = [NSMutableArray array];
  for (RCIMIWSubscribeInfoEvent *element in subscribeEvents) {
    [subscribeEvents_arr addObject:[RCIMIWPlatformConverter convertSubscribeInfoEventToDict:element]];
  }
  [arguments setValue:subscribeEvents_arr.copy forKey:@"subscribeEvents"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onEventChange" arguments:arguments.copy];
  });
}

- (void)onSubscriptionSyncCompleted:(RCIMIWSubscribeType)type {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter convertSubscribeTypeToInteger:type]) forKey:@"type"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onSubscriptionSyncCompleted" arguments:arguments.copy];
  });
}

- (void)onSubscriptionChangedOnOtherDevices:(NSArray<RCIMIWSubscribeEvent *> *)subscribeEvents {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *subscribeEvents_arr = [NSMutableArray array];
  for (RCIMIWSubscribeEvent *element in subscribeEvents) {
    [subscribeEvents_arr addObject:[RCIMIWPlatformConverter convertSubscribeEventToDict:element]];
  }
  [arguments setValue:subscribeEvents_arr.copy forKey:@"subscribeEvents"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onSubscriptionChangedOnOtherDevices" arguments:arguments.copy];
  });
}

@end
