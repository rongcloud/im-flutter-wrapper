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
  self.channel = [FlutterMethodChannel
      methodChannelWithName:@"cn.rongcloud.im.flutter/RCIMIWEngine"
            binaryMessenger:[registrar messenger]];
  [registrar addApplicationDelegate:self];
  RCIMWrapperEngine *delegate = [RCIMWrapperEngine sharedInstance];
  [registrar addMethodCallDelegate:delegate channel:self.channel];
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [RCIMIWEngine setDeviceToken:deviceToken];
}

- (void)getMessageById:(FlutterMethodCall *)call result:(FlutterResult)result {
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    int messageId = [(NSNumber *)arguments[@"messageId"] intValue];
    [self.engine getMessageById:messageId
        success:^(RCIMIWMessage *_Nonnull message) {
          dispatch_to_main_queue(^{
            result([RCIMIWPlatformConverter convertMessageToDict:message]);
          });
        }
        error:^(NSInteger code) {
          dispatch_to_main_queue(^{
            result(nil);
          });
        }];
  } else {
    dispatch_to_main_queue(^{
      result(nil);
    });
  }
}

- (void)getMessageByUId:(FlutterMethodCall *)call result:(FlutterResult)result {
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    [self.engine getMessageByUId:messageUId
        success:^(RCIMIWMessage *_Nonnull message) {
          dispatch_to_main_queue(^{
            result([RCIMIWPlatformConverter convertMessageToDict:message]);
          });
        }
        error:^(NSInteger code) {
          dispatch_to_main_queue(^{
            result(nil);
          });
        }];
  } else {
    dispatch_to_main_queue(^{
      result(nil);
    });
  }
}

- (void)destroy:(FlutterMethodCall *)call result:(FlutterResult)result {
  [self.engine destroy];
  self.engine = nil;
  dispatch_to_main_queue(^{
    result(nil);
  });
}
- (void)handleMethodCall:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSLog(@"method : %@", call.method);
  if ([@"engine:create" isEqualToString:call.method]) {
    [self create:call result:result];
  } else if ([@"engine:getMessageById" isEqualToString:call.method]) {
    [self getMessageById:call result:result];
  } else if ([@"engine:getMessageByUId" isEqualToString:call.method]) {
    [self getMessageByUId:call result:result];
  } else if ([@"engine:destroy" isEqualToString:call.method]) {
    [self destroy:call result:result];
  } else if ([@"engine:connect" isEqualToString:call.method]) {
    [self connect:call result:result];
  } else if ([@"engine:disconnect" isEqualToString:call.method]) {
    [self disconnect:call result:result];
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
  } else if ([@"engine:sendMessage" isEqualToString:call.method]) {
    [self sendMessage:call result:result];
  } else if ([@"engine:sendMediaMessage" isEqualToString:call.method]) {
    [self sendMediaMessage:call result:result];
  } else if ([@"engine:cancelSendingMediaMessage"
                 isEqualToString:call.method]) {
    [self cancelSendingMediaMessage:call result:result];
  } else if ([@"engine:downloadMediaMessage" isEqualToString:call.method]) {
    [self downloadMediaMessage:call result:result];
  } else if ([@"engine:cancelDownloadingMediaMessage"
                 isEqualToString:call.method]) {
    [self cancelDownloadingMediaMessage:call result:result];
  } else if ([@"engine:loadConversation" isEqualToString:call.method]) {
    [self loadConversation:call result:result];
  } else if ([@"engine:loadConversations" isEqualToString:call.method]) {
    [self loadConversations:call result:result];
  } else if ([@"engine:removeConversation" isEqualToString:call.method]) {
    [self removeConversation:call result:result];
  } else if ([@"engine:removeConversations" isEqualToString:call.method]) {
    [self removeConversations:call result:result];
  } else if ([@"engine:loadUnreadCount" isEqualToString:call.method]) {
    [self loadUnreadCount:call result:result];
  } else if ([@"engine:loadTotalUnreadCount" isEqualToString:call.method]) {
    [self loadTotalUnreadCount:call result:result];
  } else if ([@"engine:loadUnreadMentionedCount" isEqualToString:call.method]) {
    [self loadUnreadMentionedCount:call result:result];
  } else if ([@"engine:loadUltraGroupAllUnreadCount"
                 isEqualToString:call.method]) {
    [self loadUltraGroupAllUnreadCount:call result:result];
  } else if ([@"engine:loadUltraGroupAllUnreadMentionedCount"
                 isEqualToString:call.method]) {
    [self loadUltraGroupAllUnreadMentionedCount:call result:result];
  } else if ([@"engine:loadUltraGroupUnreadCount"
                 isEqualToString:call.method]) {
    [self loadUltraGroupUnreadCount:call result:result];
  } else if ([@"engine:loadUltraGroupUnreadMentionedCount"
                 isEqualToString:call.method]) {
    [self loadUltraGroupUnreadMentionedCount:call result:result];
  } else if ([@"engine:loadUnreadCountByConversationTypes"
                 isEqualToString:call.method]) {
    [self loadUnreadCountByConversationTypes:call result:result];
  } else if ([@"engine:clearUnreadCount" isEqualToString:call.method]) {
    [self clearUnreadCount:call result:result];
  } else if ([@"engine:saveDraftMessage" isEqualToString:call.method]) {
    [self saveDraftMessage:call result:result];
  } else if ([@"engine:loadDraftMessage" isEqualToString:call.method]) {
    [self loadDraftMessage:call result:result];
  } else if ([@"engine:clearDraftMessage" isEqualToString:call.method]) {
    [self clearDraftMessage:call result:result];
  } else if ([@"engine:loadBlockedConversations" isEqualToString:call.method]) {
    [self loadBlockedConversations:call result:result];
  } else if ([@"engine:changeConversationTopStatus"
                 isEqualToString:call.method]) {
    [self changeConversationTopStatus:call result:result];
  } else if ([@"engine:loadConversationTopStatus"
                 isEqualToString:call.method]) {
    [self loadConversationTopStatus:call result:result];
  } else if ([@"engine:syncConversationReadStatus"
                 isEqualToString:call.method]) {
    [self syncConversationReadStatus:call result:result];
  } else if ([@"engine:sendTypingStatus" isEqualToString:call.method]) {
    [self sendTypingStatus:call result:result];
  } else if ([@"engine:loadMessages" isEqualToString:call.method]) {
    [self loadMessages:call result:result];
  } else if ([@"engine:loadFirstUnreadMessage" isEqualToString:call.method]) {
    [self loadFirstUnreadMessage:call result:result];
  } else if ([@"engine:loadUnreadMentionedMessages"
                 isEqualToString:call.method]) {
    [self loadUnreadMentionedMessages:call result:result];
  } else if ([@"engine:insertMessage" isEqualToString:call.method]) {
    [self insertMessage:call result:result];
  } else if ([@"engine:insertMessages" isEqualToString:call.method]) {
    [self insertMessages:call result:result];
  } else if ([@"engine:clearMessages" isEqualToString:call.method]) {
    [self clearMessages:call result:result];
  } else if ([@"engine:deleteLocalMessages" isEqualToString:call.method]) {
    [self deleteLocalMessages:call result:result];
  } else if ([@"engine:deleteMessages" isEqualToString:call.method]) {
    [self deleteMessages:call result:result];
  } else if ([@"engine:recallMessage" isEqualToString:call.method]) {
    [self recallMessage:call result:result];
  } else if ([@"engine:sendPrivateReadReceiptMessage"
                 isEqualToString:call.method]) {
    [self sendPrivateReadReceiptMessage:call result:result];
  } else if ([@"engine:sendGroupReadReceiptRequest"
                 isEqualToString:call.method]) {
    [self sendGroupReadReceiptRequest:call result:result];
  } else if ([@"engine:sendGroupReadReceiptResponse"
                 isEqualToString:call.method]) {
    [self sendGroupReadReceiptResponse:call result:result];
  } else if ([@"engine:updateMessageExpansion" isEqualToString:call.method]) {
    [self updateMessageExpansion:call result:result];
  } else if ([@"engine:removeMessageExpansionForKeys"
                 isEqualToString:call.method]) {
    [self removeMessageExpansionForKeys:call result:result];
  } else if ([@"engine:changeMessageSentStatus" isEqualToString:call.method]) {
    [self changeMessageSentStatus:call result:result];
  } else if ([@"engine:changeMessageReceiveStatus"
                 isEqualToString:call.method]) {
    [self changeMessageReceiveStatus:call result:result];
  } else if ([@"engine:joinChatRoom" isEqualToString:call.method]) {
    [self joinChatRoom:call result:result];
  } else if ([@"engine:leaveChatRoom" isEqualToString:call.method]) {
    [self leaveChatRoom:call result:result];
  } else if ([@"engine:loadChatRoomMessages" isEqualToString:call.method]) {
    [self loadChatRoomMessages:call result:result];
  } else if ([@"engine:addChatRoomEntry" isEqualToString:call.method]) {
    [self addChatRoomEntry:call result:result];
  } else if ([@"engine:addChatRoomEntries" isEqualToString:call.method]) {
    [self addChatRoomEntries:call result:result];
  } else if ([@"engine:loadChatRoomEntry" isEqualToString:call.method]) {
    [self loadChatRoomEntry:call result:result];
  } else if ([@"engine:loadAllChatRoomEntries" isEqualToString:call.method]) {
    [self loadAllChatRoomEntries:call result:result];
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
  } else if ([@"engine:loadBlacklist" isEqualToString:call.method]) {
    [self loadBlacklist:call result:result];
  } else if ([@"engine:searchMessages" isEqualToString:call.method]) {
    [self searchMessages:call result:result];
  } else if ([@"engine:searchMessagesByTimeRange"
                 isEqualToString:call.method]) {
    [self searchMessagesByTimeRange:call result:result];
  } else if ([@"engine:searchMessagesByUserId" isEqualToString:call.method]) {
    [self searchMessagesByUserId:call result:result];
  } else if ([@"engine:searchConversations" isEqualToString:call.method]) {
    [self searchConversations:call result:result];
  } else if ([@"engine:changeNotificationQuietHours"
                 isEqualToString:call.method]) {
    [self changeNotificationQuietHours:call result:result];
  } else if ([@"engine:removeNotificationQuietHours"
                 isEqualToString:call.method]) {
    [self removeNotificationQuietHours:call result:result];
  } else if ([@"engine:loadNotificationQuietHours"
                 isEqualToString:call.method]) {
    [self loadNotificationQuietHours:call result:result];
  } else if ([@"engine:changeConversationNotificationLevel"
                 isEqualToString:call.method]) {
    [self changeConversationNotificationLevel:call result:result];
  } else if ([@"engine:loadConversationNotificationLevel"
                 isEqualToString:call.method]) {
    [self loadConversationNotificationLevel:call result:result];
  } else if ([@"engine:changeConversationTypeNotificationLevel"
                 isEqualToString:call.method]) {
    [self changeConversationTypeNotificationLevel:call result:result];
  } else if ([@"engine:loadConversationTypeNotificationLevel"
                 isEqualToString:call.method]) {
    [self loadConversationTypeNotificationLevel:call result:result];
  } else if ([@"engine:changeUltraGroupDefaultNotificationLevel"
                 isEqualToString:call.method]) {
    [self changeUltraGroupDefaultNotificationLevel:call result:result];
  } else if ([@"engine:loadUltraGroupDefaultNotificationLevel"
                 isEqualToString:call.method]) {
    [self loadUltraGroupDefaultNotificationLevel:call result:result];
  } else if ([@"engine:changeUltraGroupChannelDefaultNotificationLevel"
                 isEqualToString:call.method]) {
    [self changeUltraGroupChannelDefaultNotificationLevel:call result:result];
  } else if ([@"engine:loadUltraGroupChannelDefaultNotificationLevel"
                 isEqualToString:call.method]) {
    [self loadUltraGroupChannelDefaultNotificationLevel:call result:result];
  } else if ([@"engine:changePushContentShowStatus"
                 isEqualToString:call.method]) {
    [self changePushContentShowStatus:call result:result];
  } else if ([@"engine:changePushLanguage" isEqualToString:call.method]) {
    [self changePushLanguage:call result:result];
  } else if ([@"engine:changePushReceiveStatus" isEqualToString:call.method]) {
    [self changePushReceiveStatus:call result:result];
  } else if ([@"engine:sendGroupMessageToDesignatedUsers"
                 isEqualToString:call.method]) {
    [self sendGroupMessageToDesignatedUsers:call result:result];
  } else if ([@"engine:loadMessageCount" isEqualToString:call.method]) {
    [self loadMessageCount:call result:result];
  } else if ([@"engine:loadTopConversations" isEqualToString:call.method]) {
    [self loadTopConversations:call result:result];
  } else if ([@"engine:syncUltraGroupReadStatus" isEqualToString:call.method]) {
    [self syncUltraGroupReadStatus:call result:result];
  } else if ([@"engine:loadConversationsForAllChannel"
                 isEqualToString:call.method]) {
    [self loadConversationsForAllChannel:call result:result];
  } else if ([@"engine:modifyUltraGroupMessage" isEqualToString:call.method]) {
    [self modifyUltraGroupMessage:call result:result];
  } else if ([@"engine:recallUltraGroupMessage" isEqualToString:call.method]) {
    [self recallUltraGroupMessage:call result:result];
  } else if ([@"engine:clearUltraGroupMessages" isEqualToString:call.method]) {
    [self clearUltraGroupMessages:call result:result];
  } else if ([@"engine:sendUltraGroupTypingStatus"
                 isEqualToString:call.method]) {
    [self sendUltraGroupTypingStatus:call result:result];
  } else if ([@"engine:clearUltraGroupMessagesForAllChannel"
                 isEqualToString:call.method]) {
    [self clearUltraGroupMessagesForAllChannel:call result:result];
  } else if ([@"engine:loadBatchRemoteUltraGroupMessages"
                 isEqualToString:call.method]) {
    [self loadBatchRemoteUltraGroupMessages:call result:result];
  } else if ([@"engine:updateUltraGroupMessageExpansion"
                 isEqualToString:call.method]) {
    [self updateUltraGroupMessageExpansion:call result:result];
  } else if ([@"engine:removeUltraGroupMessageExpansion"
                 isEqualToString:call.method]) {
    [self removeUltraGroupMessageExpansion:call result:result];
  } else if ([@"engine:changeLogLevel" isEqualToString:call.method]) {
    [self changeLogLevel:call result:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)create:(FlutterMethodCall *)call result:(FlutterResult)result {

  NSDictionary *arguments = (NSDictionary *)call.arguments;
  NSString *appkey = arguments[@"appKey"];
  RCIMIWEngineOptions *options = [RCIMIWPlatformConverter
      convertEngineOptionsFromDict:arguments[@"options"]];
  self.engine = [RCIMIWEngine create:appkey options:options];
  [self.engine setEngineDelegate:self];
  result(nil);
}

- (void)connect:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *token = arguments[@"token"];
    int timeout = [(NSNumber *)arguments[@"timeout"] intValue];

    code = [self.engine connect:token timeout:timeout];
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

- (void)createTextMessage:(FlutterMethodCall *)call
                   result:(FlutterResult)result {
  RCIMIWTextMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *text = arguments[@"text"];

    res = [self.engine createTextMessage:type
                                targetId:targetId
                               channelId:channelId
                                    text:text];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createImageMessage:(FlutterMethodCall *)call
                    result:(FlutterResult)result {
  RCIMIWImageMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];

    res = [self.engine createImageMessage:type
                                 targetId:targetId
                                channelId:channelId
                                     path:path];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createFileMessage:(FlutterMethodCall *)call
                   result:(FlutterResult)result {
  RCIMIWFileMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];

    res = [self.engine createFileMessage:type
                                targetId:targetId
                               channelId:channelId
                                    path:path];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createSightMessage:(FlutterMethodCall *)call
                    result:(FlutterResult)result {
  RCIMIWSightMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];
    int duration = [(NSNumber *)arguments[@"duration"] intValue];

    res = [self.engine createSightMessage:type
                                 targetId:targetId
                                channelId:channelId
                                     path:path
                                 duration:duration];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createVoiceMessage:(FlutterMethodCall *)call
                    result:(FlutterResult)result {
  RCIMIWVoiceMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];
    int duration = [(NSNumber *)arguments[@"duration"] intValue];

    res = [self.engine createVoiceMessage:type
                                 targetId:targetId
                                channelId:channelId
                                     path:path
                                 duration:duration];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createReferenceMessage:(FlutterMethodCall *)call
                        result:(FlutterResult)result {
  RCIMIWReferenceMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWMessage *referenceMessage = [RCIMIWPlatformConverter
        convertMessageFromDict:arguments[@"referenceMessage"]];
    NSString *text = arguments[@"text"];

    res = [self.engine createReferenceMessage:type
                                     targetId:targetId
                                    channelId:channelId
                             referenceMessage:referenceMessage
                                         text:text];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createGIFMessage:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  RCIMIWGIFMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *path = arguments[@"path"];

    res = [self.engine createGIFMessage:type
                               targetId:targetId
                              channelId:channelId
                                   path:path];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createCustomMessage:(FlutterMethodCall *)call
                     result:(FlutterResult)result {
  RCIMIWCustomMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWCustomMessagePolicy policy = [RCIMWrapperArgumentAdapter
        convertCustomMessagePolicyFromInteger:[(NSNumber *)arguments[@"policy"]
                                                  integerValue]];
    NSString *messageIdentifier = arguments[@"messageIdentifier"];
    NSDictionary<NSString *, NSString *> *fields = arguments[@"fields"];

    res = [self.engine createCustomMessage:type
                                  targetId:targetId
                                 channelId:channelId
                                    policy:policy
                         messageIdentifier:messageIdentifier
                                    fields:fields];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)createLocationMessage:(FlutterMethodCall *)call
                       result:(FlutterResult)result {
  RCIMIWLocationMessage *res = nil;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    double longitude = [(NSNumber *)arguments[@"longitude"] doubleValue];
    double latitude = [(NSNumber *)arguments[@"latitude"] doubleValue];
    NSString *poiName = arguments[@"poiName"];
    NSString *thumbnailPath = arguments[@"thumbnailPath"];

    res = [self.engine createLocationMessage:type
                                    targetId:targetId
                                   channelId:channelId
                                   longitude:longitude
                                    latitude:latitude
                                     poiName:poiName
                               thumbnailPath:thumbnailPath];
  }
  dispatch_to_main_queue(^{
    result([RCIMIWPlatformConverter convertMessageToDict:res]);
  });
}

- (void)sendMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message =
        [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];

    code = [self.engine sendMessage:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendMediaMessage:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter
        convertMediaMessageFromDict:arguments[@"message"]];

    code = [self.engine sendMediaMessage:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)cancelSendingMediaMessage:(FlutterMethodCall *)call
                           result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter
        convertMediaMessageFromDict:arguments[@"message"]];

    code = [self.engine cancelSendingMediaMessage:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)downloadMediaMessage:(FlutterMethodCall *)call
                      result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter
        convertMediaMessageFromDict:arguments[@"message"]];

    code = [self.engine downloadMediaMessage:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)cancelDownloadingMediaMessage:(FlutterMethodCall *)call
                               result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMediaMessage *message = [RCIMIWPlatformConverter
        convertMediaMessageFromDict:arguments[@"message"]];

    code = [self.engine cancelDownloadingMediaMessage:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversation:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadConversation:type
                                targetId:targetId
                               channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversations:(FlutterMethodCall *)call
                   result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine loadConversations:conversationTypes
                                channelId:channelId
                                startTime:startTime
                                    count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeConversation:(FlutterMethodCall *)call
                    result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine removeConversation:type
                                  targetId:targetId
                                 channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeConversations:(FlutterMethodCall *)call
                     result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine removeConversations:conversationTypes
                                  channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUnreadCount:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadUnreadCount:type
                               targetId:targetId
                              channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadTotalUnreadCount:(FlutterMethodCall *)call
                      result:(FlutterResult)result {
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

- (void)loadUnreadMentionedCount:(FlutterMethodCall *)call
                          result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadUnreadMentionedCount:type
                                        targetId:targetId
                                       channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupAllUnreadCount:(FlutterMethodCall *)call
                              result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadUltraGroupAllUnreadCount];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupAllUnreadMentionedCount:(FlutterMethodCall *)call
                                       result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadUltraGroupAllUnreadMentionedCount];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupUnreadCount:(FlutterMethodCall *)call
                           result:(FlutterResult)result {
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

- (void)loadUltraGroupUnreadMentionedCount:(FlutterMethodCall *)call
                                    result:(FlutterResult)result {
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

- (void)loadUnreadCountByConversationTypes:(FlutterMethodCall *)call
                                    result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    BOOL contain = [(NSNumber *)arguments[@"contain"] boolValue];

    code = [self.engine loadUnreadCountByConversationTypes:conversationTypes
                                                 channelId:channelId
                                                   contain:contain];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearUnreadCount:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];

    code = [self.engine clearUnreadCount:type
                                targetId:targetId
                               channelId:channelId
                               timestamp:timestamp];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)saveDraftMessage:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *draft = arguments[@"draft"];

    code = [self.engine saveDraftMessage:type
                                targetId:targetId
                               channelId:channelId
                                   draft:draft];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadDraftMessage:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadDraftMessage:type
                                targetId:targetId
                               channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearDraftMessage:(FlutterMethodCall *)call
                   result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine clearDraftMessage:type
                                 targetId:targetId
                                channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadBlockedConversations:(FlutterMethodCall *)call
                          result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadBlockedConversations:conversationTypes
                                       channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationTopStatus:(FlutterMethodCall *)call
                             result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    BOOL top = [(NSNumber *)arguments[@"top"] boolValue];

    code = [self.engine changeConversationTopStatus:type
                                           targetId:targetId
                                          channelId:channelId
                                                top:top];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationTopStatus:(FlutterMethodCall *)call
                           result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadConversationTopStatus:type
                                         targetId:targetId
                                        channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)syncConversationReadStatus:(FlutterMethodCall *)call
                            result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];

    code = [self.engine syncConversationReadStatus:type
                                          targetId:targetId
                                         channelId:channelId
                                         timestamp:timestamp];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendTypingStatus:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *currentType = arguments[@"currentType"];

    code = [self.engine sendTypingStatus:type
                                targetId:targetId
                               channelId:channelId
                             currentType:currentType];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long sentTime = [(NSNumber *)arguments[@"sentTime"] longLongValue];
    RCIMIWTimeOrder order = [RCIMWrapperArgumentAdapter
        convertTimeOrderFromInteger:[(NSNumber *)arguments[@"order"]
                                        integerValue]];
    RCIMIWMessageOperationPolicy policy = [RCIMWrapperArgumentAdapter
        convertMessageOperationPolicyFromInteger:[(NSNumber *)
                                                         arguments[@"policy"]
                                                     integerValue]];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine loadMessages:type
                            targetId:targetId
                           channelId:channelId
                            sentTime:sentTime
                               order:order
                              policy:policy
                               count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadFirstUnreadMessage:(FlutterMethodCall *)call
                        result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadFirstUnreadMessage:type
                                      targetId:targetId
                                     channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUnreadMentionedMessages:(FlutterMethodCall *)call
                             result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadUnreadMentionedMessages:type
                                           targetId:targetId
                                          channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)insertMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message =
        [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];

    code = [self.engine insertMessage:message];
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
      [messages
          addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    code = [self.engine insertMessages:messages];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    RCIMIWMessageOperationPolicy policy = [RCIMWrapperArgumentAdapter
        convertMessageOperationPolicyFromInteger:[(NSNumber *)
                                                         arguments[@"policy"]
                                                     integerValue]];

    code = [self.engine clearMessages:type
                             targetId:targetId
                            channelId:channelId
                            timestamp:timestamp
                               policy:policy];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)deleteLocalMessages:(FlutterMethodCall *)call
                     result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages
          addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    code = [self.engine deleteLocalMessages:messages];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)deleteMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages
          addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    code = [self.engine deleteMessages:type
                              targetId:targetId
                             channelId:channelId
                              messages:messages];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)recallMessage:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message =
        [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];

    code = [self.engine recallMessage:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendPrivateReadReceiptMessage:(FlutterMethodCall *)call
                               result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];

    code = [self.engine sendPrivateReadReceiptMessage:targetId
                                            channelId:channelId
                                            timestamp:timestamp];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendGroupReadReceiptRequest:(FlutterMethodCall *)call
                             result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message =
        [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];

    code = [self.engine sendGroupReadReceiptRequest:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendGroupReadReceiptResponse:(FlutterMethodCall *)call
                              result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages
          addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    code = [self.engine sendGroupReadReceiptResponse:targetId
                                           channelId:channelId
                                            messages:messages];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateMessageExpansion:(FlutterMethodCall *)call
                        result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSDictionary<NSString *, NSString *> *expansion = arguments[@"expansion"];

    code = [self.engine updateMessageExpansion:messageUId expansion:expansion];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeMessageExpansionForKeys:(FlutterMethodCall *)call
                               result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSArray<NSString *> *keys = arguments[@"keys"];

    code = [self.engine removeMessageExpansionForKeys:messageUId keys:keys];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeMessageSentStatus:(FlutterMethodCall *)call
                         result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    long messageId = [(NSNumber *)arguments[@"messageId"] longValue];
    RCIMIWSentStatus sentStatus = [RCIMWrapperArgumentAdapter
        convertSentStatusFromInteger:[(NSNumber *)arguments[@"sentStatus"]
                                         integerValue]];

    code = [self.engine changeMessageSentStatus:messageId
                                     sentStatus:sentStatus];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeMessageReceiveStatus:(FlutterMethodCall *)call
                            result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    long messageId = [(NSNumber *)arguments[@"messageId"] longValue];
    RCIMIWReceivedStatus receivedStatus = [RCIMWrapperArgumentAdapter
        convertReceivedStatusFromInteger:[(NSNumber *)
                                                 arguments[@"receivedStatus"]
                                             integerValue]];

    code = [self.engine changeMessageReceiveStatus:messageId
                                    receivedStatus:receivedStatus];
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

    code = [self.engine joinChatRoom:targetId
                        messageCount:messageCount
                          autoCreate:autoCreate];
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

    code = [self.engine leaveChatRoom:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadChatRoomMessages:(FlutterMethodCall *)call
                      result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    RCIMIWTimeOrder order = [RCIMWrapperArgumentAdapter
        convertTimeOrderFromInteger:[(NSNumber *)arguments[@"order"]
                                        integerValue]];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine loadChatRoomMessages:targetId
                                   timestamp:timestamp
                                       order:order
                                       count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addChatRoomEntry:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *key = arguments[@"key"];
    NSString *value = arguments[@"value"];
    BOOL deleteWhenLeft = [(NSNumber *)arguments[@"deleteWhenLeft"] boolValue];
    BOOL overwrite = [(NSNumber *)arguments[@"overwrite"] boolValue];

    code = [self.engine addChatRoomEntry:targetId
                                     key:key
                                   value:value
                          deleteWhenLeft:deleteWhenLeft
                               overwrite:overwrite];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)addChatRoomEntries:(FlutterMethodCall *)call
                    result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSDictionary<NSString *, NSString *> *entries = arguments[@"entries"];
    BOOL deleteWhenLeft = [(NSNumber *)arguments[@"deleteWhenLeft"] boolValue];
    BOOL overwrite = [(NSNumber *)arguments[@"overwrite"] boolValue];

    code = [self.engine addChatRoomEntries:targetId
                                   entries:entries
                            deleteWhenLeft:deleteWhenLeft
                                 overwrite:overwrite];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadChatRoomEntry:(FlutterMethodCall *)call
                   result:(FlutterResult)result {
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

- (void)loadAllChatRoomEntries:(FlutterMethodCall *)call
                        result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];

    code = [self.engine loadAllChatRoomEntries:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeChatRoomEntry:(FlutterMethodCall *)call
                     result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *key = arguments[@"key"];
    BOOL force = [(NSNumber *)arguments[@"force"] boolValue];

    code = [self.engine removeChatRoomEntry:targetId key:key force:force];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeChatRoomEntries:(FlutterMethodCall *)call
                       result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSArray<NSString *> *keys = arguments[@"keys"];
    BOOL force = [(NSNumber *)arguments[@"force"] boolValue];

    code = [self.engine removeChatRoomEntries:targetId keys:keys force:force];
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

    code = [self.engine addToBlacklist:userId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeFromBlacklist:(FlutterMethodCall *)call
                     result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *userId = arguments[@"userId"];

    code = [self.engine removeFromBlacklist:userId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadBlacklistStatus:(FlutterMethodCall *)call
                     result:(FlutterResult)result {
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

- (void)loadBlacklist:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadBlacklist];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchMessages:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *keyword = arguments[@"keyword"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine searchMessages:type
                              targetId:targetId
                             channelId:channelId
                               keyword:keyword
                             startTime:startTime
                                 count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchMessagesByTimeRange:(FlutterMethodCall *)call
                           result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    NSString *keyword = arguments[@"keyword"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    long long endTime = [(NSNumber *)arguments[@"endTime"] longLongValue];
    int offset = [(NSNumber *)arguments[@"offset"] intValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine searchMessagesByTimeRange:type
                                         targetId:targetId
                                        channelId:channelId
                                          keyword:keyword
                                        startTime:startTime
                                          endTime:endTime
                                           offset:offset
                                            count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchMessagesByUserId:(FlutterMethodCall *)call
                        result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *userId = arguments[@"userId"];
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long startTime = [(NSNumber *)arguments[@"startTime"] longLongValue];
    int count = [(NSNumber *)arguments[@"count"] intValue];

    code = [self.engine searchMessagesByUserId:userId
                                          type:type
                                      targetId:targetId
                                     channelId:channelId
                                     startTime:startTime
                                         count:count];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)searchConversations:(FlutterMethodCall *)call
                     result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];
    NSArray<NSNumber *> *messageTypes = arguments[@"messageTypes"];
    NSString *keyword = arguments[@"keyword"];

    code = [self.engine searchConversations:conversationTypes
                                  channelId:channelId
                               messageTypes:messageTypes
                                    keyword:keyword];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeNotificationQuietHours:(FlutterMethodCall *)call
                              result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *startTime = arguments[@"startTime"];
    int spanMins = [(NSNumber *)arguments[@"spanMins"] intValue];
    RCIMIWPushNotificationQuietHoursLevel level = [RCIMWrapperArgumentAdapter
        convertPushNotificationQuietHoursLevelFromInteger:
            [(NSNumber *)arguments[@"level"] integerValue]];

    code = [self.engine changeNotificationQuietHours:startTime
                                            spanMins:spanMins
                                               level:level];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeNotificationQuietHours:(FlutterMethodCall *)call
                              result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine removeNotificationQuietHours];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadNotificationQuietHours:(FlutterMethodCall *)call
                            result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {

    code = [self.engine loadNotificationQuietHours];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationNotificationLevel:(FlutterMethodCall *)call
                                     result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter
        convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"]
                                                    integerValue]];

    code = [self.engine changeConversationNotificationLevel:type
                                                   targetId:targetId
                                                  channelId:channelId
                                                      level:level];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationNotificationLevel:(FlutterMethodCall *)call
                                   result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadConversationNotificationLevel:type
                                                 targetId:targetId
                                                channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeConversationTypeNotificationLevel:(FlutterMethodCall *)call
                                         result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter
        convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"]
                                                    integerValue]];

    code = [self.engine changeConversationTypeNotificationLevel:type
                                                          level:level];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationTypeNotificationLevel:(FlutterMethodCall *)call
                                       result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];

    code = [self.engine loadConversationTypeNotificationLevel:type];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeUltraGroupDefaultNotificationLevel:(FlutterMethodCall *)call
                                          result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter
        convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"]
                                                    integerValue]];

    code = [self.engine changeUltraGroupDefaultNotificationLevel:targetId
                                                           level:level];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupDefaultNotificationLevel:(FlutterMethodCall *)call
                                        result:(FlutterResult)result {
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

- (void)changeUltraGroupChannelDefaultNotificationLevel:
            (FlutterMethodCall *)call
                                                 result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWPushNotificationLevel level = [RCIMWrapperArgumentAdapter
        convertPushNotificationLevelFromInteger:[(NSNumber *)arguments[@"level"]
                                                    integerValue]];

    code =
        [self.engine changeUltraGroupChannelDefaultNotificationLevel:targetId
                                                           channelId:channelId
                                                               level:level];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadUltraGroupChannelDefaultNotificationLevel:(FlutterMethodCall *)call
                                               result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code =
        [self.engine loadUltraGroupChannelDefaultNotificationLevel:targetId
                                                         channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changePushContentShowStatus:(FlutterMethodCall *)call
                             result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    BOOL showContent = [(NSNumber *)arguments[@"showContent"] boolValue];

    code = [self.engine changePushContentShowStatus:showContent];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changePushLanguage:(FlutterMethodCall *)call
                    result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *language = arguments[@"language"];

    code = [self.engine changePushLanguage:language];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changePushReceiveStatus:(FlutterMethodCall *)call
                         result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    BOOL receive = [(NSNumber *)arguments[@"receive"] boolValue];

    code = [self.engine changePushReceiveStatus:receive];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendGroupMessageToDesignatedUsers:(FlutterMethodCall *)call
                                   result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message =
        [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    NSArray<NSString *> *userIds = arguments[@"userIds"];

    code = [self.engine sendGroupMessageToDesignatedUsers:message
                                                  userIds:userIds];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadMessageCount:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadMessageCount:type
                                targetId:targetId
                               channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadTopConversations:(FlutterMethodCall *)call
                      result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSArray<NSNumber *> *conversationTypes = arguments[@"conversationTypes"];
    NSString *channelId = arguments[@"channelId"];

    code = [self.engine loadTopConversations:conversationTypes
                                   channelId:channelId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)syncUltraGroupReadStatus:(FlutterMethodCall *)call
                          result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];

    code = [self.engine syncUltraGroupReadStatus:targetId
                                       channelId:channelId
                                       timestamp:timestamp];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadConversationsForAllChannel:(FlutterMethodCall *)call
                                result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWConversationType type = [RCIMWrapperArgumentAdapter
        convertConversationTypeFromInteger:[(NSNumber *)arguments[@"type"]
                                               integerValue]];
    NSString *targetId = arguments[@"targetId"];

    code = [self.engine loadConversationsForAllChannel:type targetId:targetId];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)modifyUltraGroupMessage:(FlutterMethodCall *)call
                         result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    RCIMIWMessage *message =
        [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];

    code = [self.engine modifyUltraGroupMessage:messageUId message:message];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)recallUltraGroupMessage:(FlutterMethodCall *)call
                         result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWMessage *message =
        [RCIMIWPlatformConverter convertMessageFromDict:arguments[@"message"]];
    BOOL deleteRemote = [(NSNumber *)arguments[@"deleteRemote"] boolValue];

    code = [self.engine recallUltraGroupMessage:message
                                   deleteRemote:deleteRemote];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearUltraGroupMessages:(FlutterMethodCall *)call
                         result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];
    RCIMIWMessageOperationPolicy policy = [RCIMWrapperArgumentAdapter
        convertMessageOperationPolicyFromInteger:[(NSNumber *)
                                                         arguments[@"policy"]
                                                     integerValue]];

    code = [self.engine clearUltraGroupMessages:targetId
                                      channelId:channelId
                                      timestamp:timestamp
                                         policy:policy];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)sendUltraGroupTypingStatus:(FlutterMethodCall *)call
                            result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    NSString *channelId = arguments[@"channelId"];
    RCIMIWUltraGroupTypingStatus typingStatus = [RCIMWrapperArgumentAdapter
        convertUltraGroupTypingStatusFromInteger:
            [(NSNumber *)arguments[@"typingStatus"] integerValue]];

    code = [self.engine sendUltraGroupTypingStatus:targetId
                                         channelId:channelId
                                      typingStatus:typingStatus];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)clearUltraGroupMessagesForAllChannel:(FlutterMethodCall *)call
                                      result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *targetId = arguments[@"targetId"];
    long long timestamp = [(NSNumber *)arguments[@"timestamp"] longLongValue];

    code = [self.engine clearUltraGroupMessagesForAllChannel:targetId
                                                   timestamp:timestamp];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)loadBatchRemoteUltraGroupMessages:(FlutterMethodCall *)call
                                   result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;

    NSMutableArray *messages = [NSMutableArray array];
    NSArray<NSDictionary *> *elementList = arguments[@"messages"];
    for (NSDictionary *element in elementList) {
      [messages
          addObject:[RCIMIWPlatformConverter convertMessageFromDict:element]];
    }

    code = [self.engine loadBatchRemoteUltraGroupMessages:messages];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)updateUltraGroupMessageExpansion:(FlutterMethodCall *)call
                                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSDictionary<NSString *, NSString *> *expansion = arguments[@"expansion"];

    code = [self.engine updateUltraGroupMessageExpansion:messageUId
                                               expansion:expansion];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)removeUltraGroupMessageExpansion:(FlutterMethodCall *)call
                                  result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    NSString *messageUId = arguments[@"messageUId"];
    NSArray<NSString *> *keys = arguments[@"keys"];

    code = [self.engine removeUltraGroupMessageExpansion:messageUId keys:keys];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)changeLogLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
  NSInteger code = -1;
  if (self.engine != nil) {
    NSDictionary *arguments = (NSDictionary *)call.arguments;
    RCIMIWLogLevel level = [RCIMWrapperArgumentAdapter
        convertLogLevelFromInteger:[(NSNumber *)arguments[@"level"]
                                       integerValue]];

    code = [self.engine changeLogLevel:level];
  }
  dispatch_to_main_queue(^{
    result(@(code));
  });
}

- (void)onMessageReceived:(RCIMIWMessage *)message
                     left:(NSInteger)left
                  offline:(BOOL)offline
               hasPackage:(BOOL)hasPackage {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];
  [arguments setValue:@(left) forKey:@"left"];
  [arguments setValue:@(offline) forKey:@"offline"];
  [arguments setValue:@(hasPackage) forKey:@"hasPackage"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageReceived" arguments:arguments.copy];
  });
}

- (void)onConnectionStatusChanged:(RCIMIWConnectionStatus)status {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConnectionStatusToInteger:status])
               forKey:@"status"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConnectionStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onConversationTopStatusSynced:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(NSString *)channelId
                                  top:(BOOL)top {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(top) forKey:@"top"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTopStatusSynced"
               arguments:arguments.copy];
  });
}

- (void)onRemoteMessageRecalled:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteMessageRecalled"
               arguments:arguments.copy];
  });
}

- (void)onPrivateReadReceiptReceived:(NSString *)targetId
                           channelId:(NSString *)channelId
                           timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPrivateReadReceiptReceived"
               arguments:arguments.copy];
  });
}

- (void)onRemoteMessageExpansionUpdated:
            (NSDictionary<NSString *, NSString *> *)expansion
                                message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:expansion forKey:@"expansion"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteMessageExpansionUpdated"
               arguments:arguments.copy];
  });
}

- (void)onRemoteMessageExpansionForKeyRemoved:(RCIMIWMessage *)message
                                         keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteMessageExpansionForKeyRemoved"
               arguments:arguments.copy];
  });
}

- (void)onChatRoomMemberChanged:(NSString *)targetId
                        actions:
                            (NSArray<RCIMIWChatRoomMemberAction *> *)actions {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];

  NSMutableArray *actions_arr = [NSMutableArray array];
  for (RCIMIWChatRoomMemberAction *element in actions) {
    [actions_arr addObject:[RCIMIWPlatformConverter
                               convertChatRoomMemberActionToDict:element]];
  }
  [arguments setValue:actions_arr.copy forKey:@"actions"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomMemberChanged"
               arguments:arguments.copy];
  });
}

- (void)onTypingStatusChanged:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(NSString *)channelId
             userTypingStatus:
                 (NSArray<RCIMIWTypingStatus *> *)userTypingStatus {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *userTypingStatus_arr = [NSMutableArray array];
  for (RCIMIWTypingStatus *element in userTypingStatus) {
    [userTypingStatus_arr
        addObject:[RCIMIWPlatformConverter convertTypingStatusToDict:element]];
  }
  [arguments setValue:userTypingStatus_arr.copy forKey:@"userTypingStatus"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTypingStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onConversationReadStatusSyncMessageReceived:(RCIMIWConversationType)type
                                           targetId:(NSString *)targetId
                                          timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationReadStatusSyncMessageReceived"
               arguments:arguments.copy];
  });
}

- (void)onChatRoomEntriesSynced:(NSString *)roomId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:roomId forKey:@"roomId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesSynced"
               arguments:arguments.copy];
  });
}

- (void)
    onChatRoomEntriesChanged:(RCIMIWChatRoomEntriesOperationType)operationType
                      roomId:(NSString *)roomId
                     entries:(NSDictionary<NSString *, NSString *> *)entries {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments
      setValue:@([RCIMWrapperArgumentAdapter
                   convertChatRoomEntriesOperationTypeToInteger:operationType])
        forKey:@"operationType"];
  [arguments setValue:roomId forKey:@"roomId"];
  [arguments setValue:entries forKey:@"entries"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesChanged"
               arguments:arguments.copy];
  });
}

- (void)onRemoteUltraGroupMessageExpansionUpdated:
    (NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteUltraGroupMessageExpansionUpdated"
               arguments:arguments.copy];
  });
}

- (void)onRemoteUltraGroupMessageModified:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteUltraGroupMessageModified"
               arguments:arguments.copy];
  });
}

- (void)onRemoteUltraGroupMessageRecalled:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onRemoteUltraGroupMessageRecalled"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupReadTimeReceived:(NSString *)targetId
                           channelId:(NSString *)channelId
                           timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupReadTimeReceived"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupTypingStatusChanged:
    (NSArray<RCIMIWUltraGroupTypingStatusInfo *> *)info {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];

  NSMutableArray *info_arr = [NSMutableArray array];
  for (RCIMIWUltraGroupTypingStatusInfo *element in info) {
    [info_arr addObject:[RCIMIWPlatformConverter
                            convertUltraGroupTypingStatusInfoToDict:element]];
  }
  [arguments setValue:info_arr.copy forKey:@"info"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupTypingStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onMessageBlocked:(RCIMIWBlockedMessageInfo *)info {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments
      setValue:[RCIMIWPlatformConverter convertBlockedMessageInfoToDict:info]
        forKey:@"info"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageBlocked" arguments:arguments.copy];
  });
}

- (void)onChatRoomStatusChanged:(NSString *)targetId
                         status:(RCIMIWChatRoomStatus)status {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertChatRoomStatusToInteger:status])
               forKey:@"status"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onGroupMessageReadReceiptRequestReceived:(NSString *)targetId
                                      messageUId:(NSString *)messageUId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:messageUId forKey:@"messageUId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageReadReceiptRequestReceived"
               arguments:arguments.copy];
  });
}

- (void)onGroupMessageReadReceiptResponseReceived:(NSString *)targetId
                                       messageUId:(NSString *)messageUId
                                   respondUserIds:
                                       (NSDictionary<NSString *, NSNumber *> *)
                                           respondUserIds {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:respondUserIds forKey:@"respondUserIds"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageReadReceiptResponseReceived"
               arguments:arguments.copy];
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

- (void)onConversationLoaded:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                conversation:(nullable RCIMIWConversation *)conversation {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments
      setValue:[RCIMIWPlatformConverter convertConversationToDict:conversation]
        forKey:@"conversation"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationLoaded"
               arguments:arguments.copy];
  });
}

- (void)onConversationsLoaded:(NSInteger)code
            conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                    channelId:(NSString *)channelId
                    startTime:(long long)startTime
                        count:(int)count
                conversations:(NSArray<RCIMIWConversation *> *)conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr
        addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsLoaded"
               arguments:arguments.copy];
  });
}

- (void)onConversationRemoved:(NSInteger)code
                         type:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(NSString *)channelId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationRemoved"
               arguments:arguments.copy];
  });
}

- (void)onConversationsRemoved:(NSInteger)code
             conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                     channelId:(NSString *)channelId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsRemoved"
               arguments:arguments.copy];
  });
}

- (void)onTotalUnreadCountLoaded:(NSInteger)code
                       channelId:(NSString *)channelId
                           count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTotalUnreadCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUnreadCountLoaded:(NSInteger)code
                       type:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(NSString *)channelId
                      count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUnreadCountByConversationTypesLoaded:(NSInteger)code
                             conversationTypes:
                                 (NSArray<NSNumber *> *)conversationTypes
                                     channelId:(NSString *)channelId
                                       contain:(BOOL)contain
                                         count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(contain) forKey:@"contain"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadCountByConversationTypesLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUnreadMentionedCountLoaded:(NSInteger)code
                                type:(RCIMIWConversationType)type
                            targetId:(NSString *)targetId
                           channelId:(NSString *)channelId
                               count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadMentionedCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupAllUnreadCountLoaded:(NSInteger)code
                                   count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupAllUnreadCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupAllUnreadMentionedCountLoaded:(NSInteger)code
                                            count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupAllUnreadMentionedCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUnreadCountCleared:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                   timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadCountCleared"
               arguments:arguments.copy];
  });
}

- (void)onDraftMessageSaved:(NSInteger)code
                       type:(RCIMIWConversationType)type
                   targetId:(NSString *)targetId
                  channelId:(NSString *)channelId
                      draft:(NSString *)draft {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:draft forKey:@"draft"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDraftMessageSaved"
               arguments:arguments.copy];
  });
}

- (void)onDraftMessageCleared:(NSInteger)code
                         type:(RCIMIWConversationType)type
                     targetId:(NSString *)targetId
                    channelId:(NSString *)channelId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDraftMessageCleared"
               arguments:arguments.copy];
  });
}

- (void)onDraftMessageLoaded:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                       draft:(NSString *)draft {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:draft forKey:@"draft"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDraftMessageLoaded"
               arguments:arguments.copy];
  });
}

- (void)onBlockedConversationsLoaded:(NSInteger)code
                   conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                           channelId:(NSString *)channelId
                       conversations:(nullable NSArray<RCIMIWConversation *> *)
                                         conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr
        addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlockedConversationsLoaded"
               arguments:arguments.copy];
  });
}

- (void)onConversationTopStatusChanged:(NSInteger)code
                                  type:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(NSString *)channelId
                                   top:(BOOL)top {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(top) forKey:@"top"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTopStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onConversationTopStatusLoaded:(NSInteger)code
                                 type:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(NSString *)channelId
                                  top:(BOOL)top {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(top) forKey:@"top"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTopStatusLoaded"
               arguments:arguments.copy];
  });
}

- (void)onConversationReadStatusSynced:(NSInteger)code
                                  type:(RCIMIWConversationType)type
                              targetId:(NSString *)targetId
                             channelId:(NSString *)channelId
                             timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationReadStatusSynced"
               arguments:arguments.copy];
  });
}

- (void)onMessageAttached:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageAttached" arguments:arguments.copy];
  });
}

- (void)onMessageSent:(NSInteger)code
              message:(nullable RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageSent" arguments:arguments.copy];
  });
}

- (void)onMediaMessageAttached:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments
      setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message]
        forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageAttached"
               arguments:arguments.copy];
  });
}

- (void)onMediaMessageSending:(RCIMIWMediaMessage *)message
                     progress:(int)progress {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments
      setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message]
        forKey:@"message"];
  [arguments setValue:@(progress) forKey:@"progress"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageSending"
               arguments:arguments.copy];
  });
}

- (void)onSendingMediaMessageCanceled:(NSInteger)code
                              message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments
      setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message]
        forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onSendingMediaMessageCanceled"
               arguments:arguments.copy];
  });
}

- (void)onMediaMessageSent:(NSInteger)code
                   message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments
      setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message]
        forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageSent" arguments:arguments.copy];
  });
}

- (void)onMediaMessageDownloading:(RCIMIWMediaMessage *)message
                         progress:(int)progress {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments
      setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message]
        forKey:@"message"];
  [arguments setValue:@(progress) forKey:@"progress"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageDownloading"
               arguments:arguments.copy];
  });
}

- (void)onMediaMessageDownloaded:(NSInteger)code
                         message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments
      setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message]
        forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMediaMessageDownloaded"
               arguments:arguments.copy];
  });
}

- (void)onDownloadingMediaMessageCanceled:(NSInteger)code
                                  message:(RCIMIWMediaMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments
      setValue:[RCIMIWPlatformConverter convertMediaMessageToDict:message]
        forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onDownloadingMediaMessageCanceled"
               arguments:arguments.copy];
  });
}

- (void)onMessagesLoaded:(NSInteger)code
                    type:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
               channelId:(NSString *)channelId
                sentTime:(long long)sentTime
                   order:(RCIMIWTimeOrder)order
                messages:(nullable NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(sentTime) forKey:@"sentTime"];
  [arguments
      setValue:@([RCIMWrapperArgumentAdapter convertTimeOrderToInteger:order])
        forKey:@"order"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesLoaded" arguments:arguments.copy];
  });
}

- (void)onUnreadMentionedMessagesLoaded:(NSInteger)code
                                   type:(RCIMIWConversationType)type
                               targetId:(NSString *)targetId
                              channelId:(NSString *)channelId
                               messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUnreadMentionedMessagesLoaded"
               arguments:arguments.copy];
  });
}

- (void)onFirstUnreadMessageLoaded:(NSInteger)code
                              type:(RCIMIWConversationType)type
                          targetId:(NSString *)targetId
                         channelId:(NSString *)channelId
                           message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onFirstUnreadMessageLoaded"
               arguments:arguments.copy];
  });
}

- (void)onMessageInserted:(NSInteger)code message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageInserted" arguments:arguments.copy];
  });
}

- (void)onMessagesInserted:(NSInteger)code
                  messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesInserted" arguments:arguments.copy];
  });
}

- (void)onMessageCleared:(NSInteger)code
                    type:(RCIMIWConversationType)type
                targetId:(NSString *)targetId
               channelId:(NSString *)channelId
               timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageCleared" arguments:arguments.copy];
  });
}

- (void)onLocalMessagesDeleted:(NSInteger)code
                      messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onLocalMessagesDeleted"
               arguments:arguments.copy];
  });
}

- (void)onMessagesDeleted:(NSInteger)code
                     type:(RCIMIWConversationType)type
                 targetId:(NSString *)targetId
                channelId:(NSString *)channelId
                 messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
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
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageRecalled" arguments:arguments.copy];
  });
}

- (void)onPrivateReadReceiptMessageSent:(NSInteger)code
                               targetId:(NSString *)targetId
                              channelId:(NSString *)channelId
                              timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPrivateReadReceiptMessageSent"
               arguments:arguments.copy];
  });
}

- (void)onMessageExpansionUpdated:(NSInteger)code
                       messageUId:(NSString *)messageUId
                        expansion:
                            (NSDictionary<NSString *, NSString *> *)expansion {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:expansion forKey:@"expansion"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageExpansionUpdated"
               arguments:arguments.copy];
  });
}

- (void)onMessageExpansionForKeysRemoved:(NSInteger)code
                              messageUId:(NSString *)messageUId
                                    keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageExpansionForKeysRemoved"
               arguments:arguments.copy];
  });
}

- (void)onMessageReceiveStatusChanged:(NSInteger)code
                            messageId:(long)messageId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(messageId) forKey:@"messageId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageReceiveStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onMessageSentStatusChanged:(NSInteger)code messageId:(long)messageId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(messageId) forKey:@"messageId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageSentStatusChanged"
               arguments:arguments.copy];
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

- (void)onChatRoomMessagesLoaded:(NSInteger)code
                        targetId:(NSString *)targetId
                        messages:(NSArray<RCIMIWMessage *> *)messages
                        syncTime:(long long)syncTime {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  [arguments setValue:@(syncTime) forKey:@"syncTime"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomMessagesLoaded"
               arguments:arguments.copy];
  });
}

- (void)onChatRoomEntryAdded:(NSInteger)code
                    targetId:(NSString *)targetId
                         key:(NSString *)key {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:key forKey:@"key"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntryAdded"
               arguments:arguments.copy];
  });
}

- (void)onChatRoomEntriesAdded:(NSInteger)code
                      targetId:(NSString *)targetId
                       entries:(NSDictionary<NSString *, NSString *> *)entries
                  errorEntries:
                      (NSDictionary<NSString *, NSNumber *> *)errorEntries {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:entries forKey:@"entries"];
  [arguments setValue:errorEntries forKey:@"errorEntries"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesAdded"
               arguments:arguments.copy];
  });
}

- (void)onChatRoomEntryLoaded:(NSInteger)code
                     targetId:(NSString *)targetId
                        entry:(NSDictionary<NSString *, NSString *> *)entry {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:entry forKey:@"entry"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntryLoaded"
               arguments:arguments.copy];
  });
}

- (void)onAllChatRoomEntriesLoaded:(NSInteger)code
                          targetId:(NSString *)targetId
                           entries:
                               (NSDictionary<NSString *, NSString *> *)entries {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:entries forKey:@"entries"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onAllChatRoomEntriesLoaded"
               arguments:arguments.copy];
  });
}

- (void)onChatRoomEntryRemoved:(NSInteger)code
                      targetId:(NSString *)targetId
                           key:(NSString *)key {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:key forKey:@"key"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntryRemoved"
               arguments:arguments.copy];
  });
}

- (void)onChatRoomEntriesRemoved:(NSInteger)code
                        targetId:(NSString *)targetId
                            keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onChatRoomEntriesRemoved"
               arguments:arguments.copy];
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

- (void)onBlacklistStatusLoaded:(NSInteger)code
                         userId:(NSString *)userId
                         status:(RCIMIWBlacklistStatus)status {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userId forKey:@"userId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertBlacklistStatusToInteger:status])
               forKey:@"status"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlacklistStatusLoaded"
               arguments:arguments.copy];
  });
}

- (void)onBlacklistLoaded:(NSInteger)code
                  userIds:(NSArray<NSString *> *)userIds {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userIds forKey:@"userIds"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBlacklistLoaded" arguments:arguments.copy];
  });
}

- (void)onMessagesSearched:(NSInteger)code
                      type:(RCIMIWConversationType)type
                  targetId:(NSString *)targetId
                 channelId:(NSString *)channelId
                   keyword:(NSString *)keyword
                 startTime:(long long)startTime
                     count:(int)count
                  messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:keyword forKey:@"keyword"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesSearched" arguments:arguments.copy];
  });
}

- (void)onMessagesSearchedByTimeRange:(NSInteger)code
                                 type:(RCIMIWConversationType)type
                             targetId:(NSString *)targetId
                            channelId:(NSString *)channelId
                              keyword:(NSString *)keyword
                            startTime:(long long)startTime
                              endTime:(long long)endTime
                               offset:(int)offset
                                count:(int)count
                             messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:keyword forKey:@"keyword"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(endTime) forKey:@"endTime"];
  [arguments setValue:@(offset) forKey:@"offset"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesSearchedByTimeRange"
               arguments:arguments.copy];
  });
}

- (void)onMessagesSearchedByUserId:(NSInteger)code
                            userId:(NSString *)userId
                              type:(RCIMIWConversationType)type
                          targetId:(NSString *)targetId
                         channelId:(NSString *)channelId
                         startTime:(long long)startTime
                             count:(int)count
                          messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:userId forKey:@"userId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(startTime) forKey:@"startTime"];
  [arguments setValue:@(count) forKey:@"count"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessagesSearchedByUserId"
               arguments:arguments.copy];
  });
}

- (void)onConversationsSearched:(NSInteger)code
              conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                      channelId:(NSString *)channelId
                   messageTypes:(NSArray<NSNumber *> *)messageTypes
                        keyword:(NSString *)keyword
                  conversations:(NSArray<RCIMIWSearchConversationResult *> *)
                                    conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:messageTypes forKey:@"messageTypes"];
  [arguments setValue:keyword forKey:@"keyword"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWSearchConversationResult *element in conversations) {
    [conversations_arr
        addObject:[RCIMIWPlatformConverter
                      convertSearchConversationResultToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsSearched"
               arguments:arguments.copy];
  });
}

- (void)onGroupReadReceiptRequestSent:(NSInteger)code
                              message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupReadReceiptRequestSent"
               arguments:arguments.copy];
  });
}

- (void)onGroupReadReceiptResponseSent:(NSInteger)code
                              targetId:(NSString *)targetId
                             channelId:(NSString *)channelId
                              messages:(NSArray<RCIMIWMessage *> *)messages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *messages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in messages) {
    [messages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:messages_arr.copy forKey:@"messages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupReadReceiptResponseSent"
               arguments:arguments.copy];
  });
}

- (void)onNotificationQuietHoursChanged:(NSInteger)code
                              startTime:(NSString *)startTime
                               spanMins:(int)spanMins
                                  level:(RCIMIWPushNotificationQuietHoursLevel)
                                            level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:startTime forKey:@"startTime"];
  [arguments setValue:@(spanMins) forKey:@"spanMins"];
  [arguments
      setValue:@([RCIMWrapperArgumentAdapter
                   convertPushNotificationQuietHoursLevelToInteger:level])
        forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onNotificationQuietHoursChanged"
               arguments:arguments.copy];
  });
}

- (void)onNotificationQuietHoursRemoved:(NSInteger)code {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onNotificationQuietHoursRemoved"
               arguments:arguments.copy];
  });
}

- (void)onNotificationQuietHoursLoaded:(NSInteger)code
                             startTime:(NSString *)startTime
                              spanMins:(int)spanMins
                                 level:(RCIMIWPushNotificationQuietHoursLevel)
                                           level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:startTime forKey:@"startTime"];
  [arguments setValue:@(spanMins) forKey:@"spanMins"];
  [arguments
      setValue:@([RCIMWrapperArgumentAdapter
                   convertPushNotificationQuietHoursLevelToInteger:level])
        forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onNotificationQuietHoursLoaded"
               arguments:arguments.copy];
  });
}

- (void)onConversationNotificationLevelChanged:(NSInteger)code
                                          type:(RCIMIWConversationType)type
                                      targetId:(NSString *)targetId
                                     channelId:(NSString *)channelId
                                         level:(RCIMIWPushNotificationLevel)
                                                   level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationNotificationLevelChanged"
               arguments:arguments.copy];
  });
}

- (void)onConversationNotificationLevelLoaded:(NSInteger)code
                                         type:(RCIMIWConversationType)type
                                     targetId:(NSString *)targetId
                                    channelId:(NSString *)channelId
                                        level:
                                            (RCIMIWPushNotificationLevel)level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationNotificationLevelLoaded"
               arguments:arguments.copy];
  });
}

- (void)onConversationTypeNotificationLevelChanged:(NSInteger)code
                                              type:(RCIMIWConversationType)type
                                             level:(RCIMIWPushNotificationLevel)
                                                       level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTypeNotificationLevelChanged"
               arguments:arguments.copy];
  });
}

- (void)onConversationTypeNotificationLevelLoaded:(NSInteger)code
                                             type:(RCIMIWConversationType)type
                                            level:(RCIMIWPushNotificationLevel)
                                                      level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationTypeNotificationLevelLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupDefaultNotificationLevelChanged:(NSInteger)code
                                           targetId:(NSString *)targetId
                                              level:
                                                  (RCIMIWPushNotificationLevel)
                                                      level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupDefaultNotificationLevelChanged"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupDefaultNotificationLevelLoaded:(NSInteger)code
                                          targetId:(NSString *)targetId
                                             level:(RCIMIWPushNotificationLevel)
                                                       level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupDefaultNotificationLevelLoaded"
               arguments:arguments.copy];
  });
}

- (void)
    onUltraGroupChannelDefaultNotificationLevelChanged:(NSInteger)code
                                              targetId:(NSString *)targetId
                                             channelId:(NSString *)channelId
                                                 level:
                                                     (RCIMIWPushNotificationLevel)
                                                         level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:
                @"engine:onUltraGroupChannelDefaultNotificationLevelChanged"
               arguments:arguments.copy];
  });
}

- (void)
    onUltraGroupChannelDefaultNotificationLevelLoaded:(NSInteger)code
                                             targetId:(NSString *)targetId
                                            channelId:(NSString *)channelId
                                                level:
                                                    (RCIMIWPushNotificationLevel)
                                                        level {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertPushNotificationLevelToInteger:level])
               forKey:@"level"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong
        invokeMethod:@"engine:onUltraGroupChannelDefaultNotificationLevelLoaded"
           arguments:arguments.copy];
  });
}

- (void)onPushContentShowStatusChanged:(NSInteger)code
                           showContent:(BOOL)showContent {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(showContent) forKey:@"showContent"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPushContentShowStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onPushLanguageChanged:(NSInteger)code language:(NSString *)language {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:language forKey:@"language"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPushLanguageChanged"
               arguments:arguments.copy];
  });
}

- (void)onPushReceiveStatusChanged:(NSInteger)code receive:(BOOL)receive {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@(receive) forKey:@"receive"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onPushReceiveStatusChanged"
               arguments:arguments.copy];
  });
}

- (void)onMessageCountLoaded:(NSInteger)code
                        type:(RCIMIWConversationType)type
                    targetId:(NSString *)targetId
                   channelId:(NSString *)channelId
                       count:(int)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onMessageCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onTopConversationsLoaded:(NSInteger)code
               conversationTypes:(NSArray<NSNumber *> *)conversationTypes
                       channelId:(NSString *)channelId
                   conversations:
                       (nullable NSArray<RCIMIWConversation *> *)conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:conversationTypes forKey:@"conversationTypes"];
  [arguments setValue:channelId forKey:@"channelId"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr
        addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onTopConversationsLoaded"
               arguments:arguments.copy];
  });
}

- (void)onGroupMessageToDesignatedUsersAttached:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageToDesignatedUsersAttached"
               arguments:arguments.copy];
  });
}

- (void)onGroupMessageToDesignatedUsersSent:(NSInteger)code
                                    message:(RCIMIWMessage *)message {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onGroupMessageToDesignatedUsersSent"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupReadStatusSynced:(NSInteger)code
                            targetId:(NSString *)targetId
                           channelId:(NSString *)channelId
                           timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupReadStatusSynced"
               arguments:arguments.copy];
  });
}

- (void)onConversationsLoadedForAllChannel:(NSInteger)code
                                      type:(RCIMIWConversationType)type
                                  targetId:(NSString *)targetId
                             conversations:(NSArray<RCIMIWConversation *> *)
                                               conversations {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertConversationTypeToInteger:type])
               forKey:@"type"];
  [arguments setValue:targetId forKey:@"targetId"];

  NSMutableArray *conversations_arr = [NSMutableArray array];
  for (RCIMIWConversation *element in conversations) {
    [conversations_arr
        addObject:[RCIMIWPlatformConverter convertConversationToDict:element]];
  }
  [arguments setValue:conversations_arr.copy forKey:@"conversations"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onConversationsLoadedForAllChannel"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupUnreadMentionedCountLoaded:(NSInteger)code
                                      targetId:(NSString *)targetId
                                         count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupUnreadMentionedCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupUnreadCountLoaded:(NSInteger)code
                             targetId:(NSString *)targetId
                                count:(NSInteger)count {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(count) forKey:@"count"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupUnreadCountLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageModified:(NSInteger)code
                         messageUId:(NSString *)messageUId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageModified"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageRecalled:(NSInteger)code
                            message:(RCIMIWMessage *)message
                       deleteRemote:(BOOL)deleteRemote {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:[RCIMIWPlatformConverter convertMessageToDict:message]
               forKey:@"message"];
  [arguments setValue:@(deleteRemote) forKey:@"deleteRemote"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageRecalled"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessagesCleared:(NSInteger)code
                           targetId:(NSString *)targetId
                          channelId:(NSString *)channelId
                          timestamp:(long long)timestamp
                             policy:(RCIMIWMessageOperationPolicy)policy {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertMessageOperationPolicyToInteger:policy])
               forKey:@"policy"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessagesCleared"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessagesClearedForAllChannel:(NSInteger)code
                                        targetId:(NSString *)targetId
                                       timestamp:(long long)timestamp {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:@(timestamp) forKey:@"timestamp"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessagesClearedForAllChannel"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupTypingStatusSent:(NSInteger)code
                            targetId:(NSString *)targetId
                           channelId:(NSString *)channelId
                        typingStatus:
                            (RCIMIWUltraGroupTypingStatus)typingStatus {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:targetId forKey:@"targetId"];
  [arguments setValue:channelId forKey:@"channelId"];
  [arguments setValue:@([RCIMWrapperArgumentAdapter
                          convertUltraGroupTypingStatusToInteger:typingStatus])
               forKey:@"typingStatus"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupTypingStatusSent"
               arguments:arguments.copy];
  });
}

- (void)onBatchRemoteUltraGroupMessagesLoaded:(NSInteger)code
                              matchedMessages:
                                  (NSArray<RCIMIWMessage *> *)matchedMessages
                           notMatchedMessages:
                               (NSArray<RCIMIWMessage *> *)notMatchedMessages {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];

  NSMutableArray *matchedMessages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in matchedMessages) {
    [matchedMessages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:matchedMessages_arr.copy forKey:@"matchedMessages"];

  NSMutableArray *notMatchedMessages_arr = [NSMutableArray array];
  for (RCIMIWMessage *element in notMatchedMessages) {
    [notMatchedMessages_arr
        addObject:[RCIMIWPlatformConverter convertMessageToDict:element]];
  }
  [arguments setValue:notMatchedMessages_arr.copy forKey:@"notMatchedMessages"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onBatchRemoteUltraGroupMessagesLoaded"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageExpansionUpdated:(NSInteger)code
                                  expansion:
                                      (NSDictionary<NSString *, NSString *> *)
                                          expansion
                                 messageUId:(NSString *)messageUId {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:expansion forKey:@"expansion"];
  [arguments setValue:messageUId forKey:@"messageUId"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageExpansionUpdated"
               arguments:arguments.copy];
  });
}

- (void)onUltraGroupMessageExpansionRemoved:(NSInteger)code
                                 messageUId:(NSString *)messageUId
                                       keys:(NSArray<NSString *> *)keys {
  NSMutableDictionary *arguments = [NSMutableDictionary dictionary];
  [arguments setValue:@(code) forKey:@"code"];
  [arguments setValue:messageUId forKey:@"messageUId"];
  [arguments setValue:keys forKey:@"keys"];

  __weak typeof(self.channel) weak = self.channel;
  dispatch_to_main_queue(^{
    typeof(weak) strong = weak;
    [strong invokeMethod:@"engine:onUltraGroupMessageExpansionRemoved"
               arguments:arguments.copy];
  });
}

@end
