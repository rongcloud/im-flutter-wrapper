package cn.rongcloud.im.wrapper.flutter;

import android.annotation.SuppressLint;
import android.content.Context;
import androidx.annotation.NonNull;
import cn.rongcloud.im.wrapper.RCIMIWEngine;
import cn.rongcloud.im.wrapper.chatroom.RCIMIWChatRoomMemberAction;
import cn.rongcloud.im.wrapper.constants.RCIMIWBlacklistStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWBlockedMessageInfo;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomEntriesOperationType;
import cn.rongcloud.im.wrapper.constants.RCIMIWChatRoomStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWConnectionStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWConversationType;
import cn.rongcloud.im.wrapper.constants.RCIMIWCustomMessagePolicy;
import cn.rongcloud.im.wrapper.constants.RCIMIWLogLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWMessageOperationPolicy;
import cn.rongcloud.im.wrapper.constants.RCIMIWMessageType;
import cn.rongcloud.im.wrapper.constants.RCIMIWPushNotificationLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWPushNotificationQuietHoursLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWReceivedStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWSentStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWTimeOrder;
import cn.rongcloud.im.wrapper.constants.RCIMIWTypingStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWUltraGroupTypingStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWUltraGroupTypingStatusInfo;
import cn.rongcloud.im.wrapper.conversation.RCIMIWConversation;
import cn.rongcloud.im.wrapper.conversation.RCIMIWSearchConversationResult;
import cn.rongcloud.im.wrapper.listener.IGetMessageCallback;
import cn.rongcloud.im.wrapper.listener.RCIMIWListener;
import cn.rongcloud.im.wrapper.messages.RCIMIWCustomMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWFileMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWGIFMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWImageMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWLocationMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWMediaMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWReferenceMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWSightMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWTextMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWVoiceMessage;
import cn.rongcloud.im.wrapper.options.RCIMIWEngineOptions;
import cn.rongcloud.im.wrapper.platform.RCIMIWPlatformConverter;
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterAssets;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class RCIMWrapperEngine implements MethodCallHandler {

  private Context context;
  private FlutterAssets assets;
  private MethodChannel channel;

  private RCIMIWEngine engine = null;

  public static RCIMWrapperEngine getInstance() {
    return SingletonHolder.instance;
  }

  private RCIMWrapperEngine() {}

  private static class SingletonHolder {
    @SuppressLint("StaticFieldLeak")
    private static final RCIMWrapperEngine instance = new RCIMWrapperEngine();
  }

  void init(Context context, BinaryMessenger messenger, FlutterAssets assets) {
    this.context = context;
    this.assets = assets;
    channel = new MethodChannel(messenger, "cn.rongcloud.im.flutter/RCIMIWEngine");
    channel.setMethodCallHandler(this);
  }

  void unInit() {
    context = null;
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "engine:create":
        String appKey = call.argument("appKey");
        RCIMIWEngineOptions options =
            RCIMIWPlatformConverter.convertEngineOptions(
                (HashMap<String, Object>) call.argument("options"));
        engine = RCIMIWEngine.create(context, appKey, options);
        engine.setListener(new RCIMIWListenerImpl());
        RCIMWrapperMainThreadPoster.success(result);
        break;
      case "engine:destroy":
        destroy(call, result);
        break;
      case "engine:getMessageById":
        getMessageById(call, result);
        break;
      case "engine:getMessageByUId":
        getMessageByUId(call, result);
        break;

      case "engine:connect":
        connect(call, result);
        break;

      case "engine:disconnect":
        disconnect(call, result);
        break;

      case "engine:createTextMessage":
        createTextMessage(call, result);
        break;

      case "engine:createImageMessage":
        createImageMessage(call, result);
        break;

      case "engine:createFileMessage":
        createFileMessage(call, result);
        break;

      case "engine:createSightMessage":
        createSightMessage(call, result);
        break;

      case "engine:createVoiceMessage":
        createVoiceMessage(call, result);
        break;

      case "engine:createReferenceMessage":
        createReferenceMessage(call, result);
        break;

      case "engine:createGIFMessage":
        createGIFMessage(call, result);
        break;

      case "engine:createCustomMessage":
        createCustomMessage(call, result);
        break;

      case "engine:createLocationMessage":
        createLocationMessage(call, result);
        break;

      case "engine:sendMessage":
        sendMessage(call, result);
        break;

      case "engine:sendMediaMessage":
        sendMediaMessage(call, result);
        break;

      case "engine:cancelSendingMediaMessage":
        cancelSendingMediaMessage(call, result);
        break;

      case "engine:downloadMediaMessage":
        downloadMediaMessage(call, result);
        break;

      case "engine:cancelDownloadingMediaMessage":
        cancelDownloadingMediaMessage(call, result);
        break;

      case "engine:loadConversation":
        loadConversation(call, result);
        break;

      case "engine:loadConversations":
        loadConversations(call, result);
        break;

      case "engine:removeConversation":
        removeConversation(call, result);
        break;

      case "engine:removeConversations":
        removeConversations(call, result);
        break;

      case "engine:loadUnreadCount":
        loadUnreadCount(call, result);
        break;

      case "engine:loadTotalUnreadCount":
        loadTotalUnreadCount(call, result);
        break;

      case "engine:loadUnreadMentionedCount":
        loadUnreadMentionedCount(call, result);
        break;

      case "engine:loadUltraGroupAllUnreadCount":
        loadUltraGroupAllUnreadCount(call, result);
        break;

      case "engine:loadUltraGroupAllUnreadMentionedCount":
        loadUltraGroupAllUnreadMentionedCount(call, result);
        break;

      case "engine:loadUltraGroupUnreadCount":
        loadUltraGroupUnreadCount(call, result);
        break;

      case "engine:loadUltraGroupUnreadMentionedCount":
        loadUltraGroupUnreadMentionedCount(call, result);
        break;

      case "engine:loadUnreadCountByConversationTypes":
        loadUnreadCountByConversationTypes(call, result);
        break;

      case "engine:clearUnreadCount":
        clearUnreadCount(call, result);
        break;

      case "engine:saveDraftMessage":
        saveDraftMessage(call, result);
        break;

      case "engine:loadDraftMessage":
        loadDraftMessage(call, result);
        break;

      case "engine:clearDraftMessage":
        clearDraftMessage(call, result);
        break;

      case "engine:loadBlockedConversations":
        loadBlockedConversations(call, result);
        break;

      case "engine:changeConversationTopStatus":
        changeConversationTopStatus(call, result);
        break;

      case "engine:loadConversationTopStatus":
        loadConversationTopStatus(call, result);
        break;

      case "engine:syncConversationReadStatus":
        syncConversationReadStatus(call, result);
        break;

      case "engine:sendTypingStatus":
        sendTypingStatus(call, result);
        break;

      case "engine:loadMessages":
        loadMessages(call, result);
        break;

      case "engine:loadFirstUnreadMessage":
        loadFirstUnreadMessage(call, result);
        break;

      case "engine:loadUnreadMentionedMessages":
        loadUnreadMentionedMessages(call, result);
        break;

      case "engine:insertMessage":
        insertMessage(call, result);
        break;

      case "engine:insertMessages":
        insertMessages(call, result);
        break;

      case "engine:clearMessages":
        clearMessages(call, result);
        break;

      case "engine:deleteLocalMessages":
        deleteLocalMessages(call, result);
        break;

      case "engine:deleteMessages":
        deleteMessages(call, result);
        break;

      case "engine:recallMessage":
        recallMessage(call, result);
        break;

      case "engine:sendPrivateReadReceiptMessage":
        sendPrivateReadReceiptMessage(call, result);
        break;

      case "engine:sendGroupReadReceiptRequest":
        sendGroupReadReceiptRequest(call, result);
        break;

      case "engine:sendGroupReadReceiptResponse":
        sendGroupReadReceiptResponse(call, result);
        break;

      case "engine:updateMessageExpansion":
        updateMessageExpansion(call, result);
        break;

      case "engine:removeMessageExpansionForKeys":
        removeMessageExpansionForKeys(call, result);
        break;

      case "engine:changeMessageSentStatus":
        changeMessageSentStatus(call, result);
        break;

      case "engine:changeMessageReceiveStatus":
        changeMessageReceiveStatus(call, result);
        break;

      case "engine:joinChatRoom":
        joinChatRoom(call, result);
        break;

      case "engine:leaveChatRoom":
        leaveChatRoom(call, result);
        break;

      case "engine:loadChatRoomMessages":
        loadChatRoomMessages(call, result);
        break;

      case "engine:addChatRoomEntry":
        addChatRoomEntry(call, result);
        break;

      case "engine:addChatRoomEntries":
        addChatRoomEntries(call, result);
        break;

      case "engine:loadChatRoomEntry":
        loadChatRoomEntry(call, result);
        break;

      case "engine:loadAllChatRoomEntries":
        loadAllChatRoomEntries(call, result);
        break;

      case "engine:removeChatRoomEntry":
        removeChatRoomEntry(call, result);
        break;

      case "engine:removeChatRoomEntries":
        removeChatRoomEntries(call, result);
        break;

      case "engine:addToBlacklist":
        addToBlacklist(call, result);
        break;

      case "engine:removeFromBlacklist":
        removeFromBlacklist(call, result);
        break;

      case "engine:loadBlacklistStatus":
        loadBlacklistStatus(call, result);
        break;

      case "engine:loadBlacklist":
        loadBlacklist(call, result);
        break;

      case "engine:searchMessages":
        searchMessages(call, result);
        break;

      case "engine:searchMessagesByTimeRange":
        searchMessagesByTimeRange(call, result);
        break;

      case "engine:searchMessagesByUserId":
        searchMessagesByUserId(call, result);
        break;

      case "engine:searchConversations":
        searchConversations(call, result);
        break;

      case "engine:changeNotificationQuietHours":
        changeNotificationQuietHours(call, result);
        break;

      case "engine:removeNotificationQuietHours":
        removeNotificationQuietHours(call, result);
        break;

      case "engine:loadNotificationQuietHours":
        loadNotificationQuietHours(call, result);
        break;

      case "engine:changeConversationNotificationLevel":
        changeConversationNotificationLevel(call, result);
        break;

      case "engine:loadConversationNotificationLevel":
        loadConversationNotificationLevel(call, result);
        break;

      case "engine:changeConversationTypeNotificationLevel":
        changeConversationTypeNotificationLevel(call, result);
        break;

      case "engine:loadConversationTypeNotificationLevel":
        loadConversationTypeNotificationLevel(call, result);
        break;

      case "engine:changeUltraGroupDefaultNotificationLevel":
        changeUltraGroupDefaultNotificationLevel(call, result);
        break;

      case "engine:loadUltraGroupDefaultNotificationLevel":
        loadUltraGroupDefaultNotificationLevel(call, result);
        break;

      case "engine:changeUltraGroupChannelDefaultNotificationLevel":
        changeUltraGroupChannelDefaultNotificationLevel(call, result);
        break;

      case "engine:loadUltraGroupChannelDefaultNotificationLevel":
        loadUltraGroupChannelDefaultNotificationLevel(call, result);
        break;

      case "engine:changePushContentShowStatus":
        changePushContentShowStatus(call, result);
        break;

      case "engine:changePushLanguage":
        changePushLanguage(call, result);
        break;

      case "engine:changePushReceiveStatus":
        changePushReceiveStatus(call, result);
        break;

      case "engine:sendGroupMessageToDesignatedUsers":
        sendGroupMessageToDesignatedUsers(call, result);
        break;

      case "engine:loadMessageCount":
        loadMessageCount(call, result);
        break;

      case "engine:loadTopConversations":
        loadTopConversations(call, result);
        break;

      case "engine:syncUltraGroupReadStatus":
        syncUltraGroupReadStatus(call, result);
        break;

      case "engine:loadConversationsForAllChannel":
        loadConversationsForAllChannel(call, result);
        break;

      case "engine:modifyUltraGroupMessage":
        modifyUltraGroupMessage(call, result);
        break;

      case "engine:recallUltraGroupMessage":
        recallUltraGroupMessage(call, result);
        break;

      case "engine:clearUltraGroupMessages":
        clearUltraGroupMessages(call, result);
        break;

      case "engine:sendUltraGroupTypingStatus":
        sendUltraGroupTypingStatus(call, result);
        break;

      case "engine:clearUltraGroupMessagesForAllChannel":
        clearUltraGroupMessagesForAllChannel(call, result);
        break;

      case "engine:loadBatchRemoteUltraGroupMessages":
        loadBatchRemoteUltraGroupMessages(call, result);
        break;

      case "engine:updateUltraGroupMessageExpansion":
        updateUltraGroupMessageExpansion(call, result);
        break;

      case "engine:removeUltraGroupMessageExpansion":
        removeUltraGroupMessageExpansion(call, result);
        break;

      case "engine:changeLogLevel":
        changeLogLevel(call, result);
        break;
    }
  }

  private void getMessageByUId(@NonNull MethodCall call, @NonNull Result result) {
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      engine.getMessageByUId(
          messageUId,
          new IGetMessageCallback() {
            @Override
            public void onSuccess(RCIMIWMessage message) {
              RCIMWrapperMainThreadPoster.success(
                  result, RCIMIWPlatformConverter.convertMessage(message));
            }

            @Override
            public void onError(int i) {
              RCIMWrapperMainThreadPoster.success(null);
            }
          });
    }
  }

  private void getMessageById(@NonNull MethodCall call, @NonNull Result result) {
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();

      engine.getMessageById(
          messageId,
          new IGetMessageCallback() {
            @Override
            public void onSuccess(RCIMIWMessage message) {
              RCIMWrapperMainThreadPoster.success(
                  result, RCIMIWPlatformConverter.convertMessage(message));
            }

            @Override
            public void onError(int code) {
              RCIMWrapperMainThreadPoster.success(null);
            }
          });
    }
  }

  private void destroy(@NonNull MethodCall call, @NonNull Result result) {
    if (engine != null) {
      engine.destroy();
    }
    engine = null;
    RCIMWrapperMainThreadPoster.success(result);
  }

  private void connect(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String token = (String) call.argument("token");
      int timeout = ((Number) call.argument("timeout")).intValue();

      code = engine.connect(token, timeout);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void disconnect(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      Boolean receivePush = (Boolean) call.argument("receivePush");

      code = engine.disconnect(receivePush);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void createTextMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWTextMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String text = (String) call.argument("text");

      res = engine.createTextMessage(type, targetId, channelId, text);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createImageMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWImageMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String path = (String) call.argument("path");

      res = engine.createImageMessage(type, targetId, channelId, path);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createFileMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWFileMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String path = (String) call.argument("path");

      res = engine.createFileMessage(type, targetId, channelId, path);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createSightMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWSightMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String path = (String) call.argument("path");
      int duration = ((Number) call.argument("duration")).intValue();

      res = engine.createSightMessage(type, targetId, channelId, path, duration);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createVoiceMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWVoiceMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String path = (String) call.argument("path");
      int duration = ((Number) call.argument("duration")).intValue();

      res = engine.createVoiceMessage(type, targetId, channelId, path, duration);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createReferenceMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWReferenceMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      RCIMIWMessage referenceMessage =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("referenceMessage"));
      String text = (String) call.argument("text");

      res = engine.createReferenceMessage(type, targetId, channelId, referenceMessage, text);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createGIFMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWGIFMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String path = (String) call.argument("path");

      res = engine.createGIFMessage(type, targetId, channelId, path);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createCustomMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWCustomMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      RCIMIWCustomMessagePolicy policy =
          RCIMWrapperArgumentAdapter.toRCIMIWCustomMessagePolicy(call.argument("policy"));
      String messageIdentifier = (String) call.argument("messageIdentifier");
      Map<String, String> fields = (Map<String, String>) call.argument("fields");

      res =
          engine.createCustomMessage(type, targetId, channelId, policy, messageIdentifier, fields);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createLocationMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWLocationMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      double longitude = (double) call.argument("longitude");
      double latitude = (double) call.argument("latitude");
      String poiName = (String) call.argument("poiName");
      String thumbnailPath = (String) call.argument("thumbnailPath");

      res =
          engine.createLocationMessage(
              type, targetId, channelId, longitude, latitude, poiName, thumbnailPath);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void sendMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.sendMessage(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.sendMediaMessage(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void cancelSendingMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.cancelSendingMediaMessage(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void downloadMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.downloadMediaMessage(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void cancelDownloadingMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.cancelDownloadingMediaMessage(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadConversation(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadConversation(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      long startTime = ((Number) call.argument("startTime")).longValue();
      int count = ((Number) call.argument("count")).intValue();

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.loadConversations(conversationTypes_str, channelId, startTime, count);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeConversation(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.removeConversation(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.removeConversations(conversationTypes_str, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadUnreadCount(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadTotalUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String channelId = (String) call.argument("channelId");

      code = engine.loadTotalUnreadCount(channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUnreadMentionedCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadUnreadMentionedCount(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUltraGroupAllUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {

      code = engine.loadUltraGroupAllUnreadCount();
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUltraGroupAllUnreadMentionedCount(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {

      code = engine.loadUltraGroupAllUnreadMentionedCount();
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUltraGroupUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");

      code = engine.loadUltraGroupUnreadCount(targetId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUltraGroupUnreadMentionedCount(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");

      code = engine.loadUltraGroupUnreadMentionedCount(targetId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUnreadCountByConversationTypes(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      Boolean contain = (Boolean) call.argument("contain");

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.loadUnreadCountByConversationTypes(conversationTypes_str, channelId, contain);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();

      code = engine.clearUnreadCount(type, targetId, channelId, timestamp);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void saveDraftMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String draft = (String) call.argument("draft");

      code = engine.saveDraftMessage(type, targetId, channelId, draft);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadDraftMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadDraftMessage(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearDraftMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.clearDraftMessage(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadBlockedConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.loadBlockedConversations(conversationTypes_str, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeConversationTopStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      Boolean top = (Boolean) call.argument("top");

      code = engine.changeConversationTopStatus(type, targetId, channelId, top);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadConversationTopStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadConversationTopStatus(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void syncConversationReadStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();

      code = engine.syncConversationReadStatus(type, targetId, channelId, timestamp);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendTypingStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String currentType = (String) call.argument("currentType");

      code = engine.sendTypingStatus(type, targetId, channelId, currentType);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long sentTime = ((Number) call.argument("sentTime")).longValue();
      RCIMIWTimeOrder order = RCIMWrapperArgumentAdapter.toRCIMIWTimeOrder(call.argument("order"));
      RCIMIWMessageOperationPolicy policy =
          RCIMWrapperArgumentAdapter.toRCIMIWMessageOperationPolicy(call.argument("policy"));
      int count = ((Number) call.argument("count")).intValue();

      code = engine.loadMessages(type, targetId, channelId, sentTime, order, policy, count);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadFirstUnreadMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadFirstUnreadMessage(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUnreadMentionedMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadUnreadMentionedMessages(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void insertMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.insertMessage(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void insertMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<HashMap<String, Object>> messages = call.argument("messages");

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.insertMessages(messages_str);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      RCIMIWMessageOperationPolicy policy =
          RCIMWrapperArgumentAdapter.toRCIMIWMessageOperationPolicy(call.argument("policy"));

      code = engine.clearMessages(type, targetId, channelId, timestamp, policy);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void deleteLocalMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<HashMap<String, Object>> messages = call.argument("messages");

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.deleteLocalMessages(messages_str);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void deleteMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      List<HashMap<String, Object>> messages = call.argument("messages");

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.deleteMessages(type, targetId, channelId, messages_str);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void recallMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.recallMessage(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendPrivateReadReceiptMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();

      code = engine.sendPrivateReadReceiptMessage(targetId, channelId, timestamp);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendGroupReadReceiptRequest(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.sendGroupReadReceiptRequest(message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendGroupReadReceiptResponse(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      List<HashMap<String, Object>> messages = call.argument("messages");

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.sendGroupReadReceiptResponse(targetId, channelId, messages_str);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateMessageExpansion(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      Map<String, String> expansion = (Map<String, String>) call.argument("expansion");

      code = engine.updateMessageExpansion(messageUId, expansion);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeMessageExpansionForKeys(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      List<String> keys = call.argument("keys");

      code = engine.removeMessageExpansionForKeys(messageUId, keys);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeMessageSentStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      RCIMIWSentStatus sentStatus =
          RCIMWrapperArgumentAdapter.toRCIMIWSentStatus(call.argument("sentStatus"));

      code = engine.changeMessageSentStatus(messageId, sentStatus);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeMessageReceiveStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      RCIMIWReceivedStatus receivedStatus =
          RCIMWrapperArgumentAdapter.toRCIMIWReceivedStatus(call.argument("receivedStatus"));

      code = engine.changeMessageReceiveStatus(messageId, receivedStatus);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void joinChatRoom(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      int messageCount = ((Number) call.argument("messageCount")).intValue();
      Boolean autoCreate = (Boolean) call.argument("autoCreate");

      code = engine.joinChatRoom(targetId, messageCount, autoCreate);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void leaveChatRoom(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");

      code = engine.leaveChatRoom(targetId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadChatRoomMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      RCIMIWTimeOrder order = RCIMWrapperArgumentAdapter.toRCIMIWTimeOrder(call.argument("order"));
      int count = ((Number) call.argument("count")).intValue();

      code = engine.loadChatRoomMessages(targetId, timestamp, order, count);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void addChatRoomEntry(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String key = (String) call.argument("key");
      String value = (String) call.argument("value");
      Boolean deleteWhenLeft = (Boolean) call.argument("deleteWhenLeft");
      Boolean overwrite = (Boolean) call.argument("overwrite");

      code = engine.addChatRoomEntry(targetId, key, value, deleteWhenLeft, overwrite);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void addChatRoomEntries(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      Map<String, String> entries = (Map<String, String>) call.argument("entries");
      Boolean deleteWhenLeft = (Boolean) call.argument("deleteWhenLeft");
      Boolean overwrite = (Boolean) call.argument("overwrite");

      code = engine.addChatRoomEntries(targetId, entries, deleteWhenLeft, overwrite);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadChatRoomEntry(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String key = (String) call.argument("key");

      code = engine.loadChatRoomEntry(targetId, key);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadAllChatRoomEntries(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");

      code = engine.loadAllChatRoomEntries(targetId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeChatRoomEntry(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String key = (String) call.argument("key");
      Boolean force = (Boolean) call.argument("force");

      code = engine.removeChatRoomEntry(targetId, key, force);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeChatRoomEntries(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      List<String> keys = call.argument("keys");
      Boolean force = (Boolean) call.argument("force");

      code = engine.removeChatRoomEntries(targetId, keys, force);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void addToBlacklist(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String userId = (String) call.argument("userId");

      code = engine.addToBlacklist(userId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeFromBlacklist(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String userId = (String) call.argument("userId");

      code = engine.removeFromBlacklist(userId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadBlacklistStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String userId = (String) call.argument("userId");

      code = engine.loadBlacklistStatus(userId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadBlacklist(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {

      code = engine.loadBlacklist();
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void searchMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String keyword = (String) call.argument("keyword");
      long startTime = ((Number) call.argument("startTime")).longValue();
      int count = ((Number) call.argument("count")).intValue();

      code = engine.searchMessages(type, targetId, channelId, keyword, startTime, count);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void searchMessagesByTimeRange(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String keyword = (String) call.argument("keyword");
      long startTime = ((Number) call.argument("startTime")).longValue();
      long endTime = ((Number) call.argument("endTime")).longValue();
      int offset = ((Number) call.argument("offset")).intValue();
      int count = ((Number) call.argument("count")).intValue();

      code =
          engine.searchMessagesByTimeRange(
              type, targetId, channelId, keyword, startTime, endTime, offset, count);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void searchMessagesByUserId(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String userId = (String) call.argument("userId");
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long startTime = ((Number) call.argument("startTime")).longValue();
      int count = ((Number) call.argument("count")).intValue();

      code = engine.searchMessagesByUserId(userId, type, targetId, channelId, startTime, count);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void searchConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      List<Number> messageTypes = call.argument("messageTypes");
      String keyword = (String) call.argument("keyword");

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      List messageTypes_str = new ArrayList();
      for (Number element : messageTypes) {
        messageTypes_str.add(RCIMWrapperArgumentAdapter.toRCIMIWMessageType((Integer) element));
      }

      code =
          engine.searchConversations(conversationTypes_str, channelId, messageTypes_str, keyword);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeNotificationQuietHours(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String startTime = (String) call.argument("startTime");
      int spanMins = ((Number) call.argument("spanMins")).intValue();
      RCIMIWPushNotificationQuietHoursLevel level =
          RCIMWrapperArgumentAdapter.toRCIMIWPushNotificationQuietHoursLevel(
              call.argument("level"));

      code = engine.changeNotificationQuietHours(startTime, spanMins, level);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeNotificationQuietHours(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {

      code = engine.removeNotificationQuietHours();
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadNotificationQuietHours(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {

      code = engine.loadNotificationQuietHours();
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeConversationNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      RCIMIWPushNotificationLevel level =
          RCIMWrapperArgumentAdapter.toRCIMIWPushNotificationLevel(call.argument("level"));

      code = engine.changeConversationNotificationLevel(type, targetId, channelId, level);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadConversationNotificationLevel(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadConversationNotificationLevel(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeConversationTypeNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      RCIMIWPushNotificationLevel level =
          RCIMWrapperArgumentAdapter.toRCIMIWPushNotificationLevel(call.argument("level"));

      code = engine.changeConversationTypeNotificationLevel(type, level);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadConversationTypeNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));

      code = engine.loadConversationTypeNotificationLevel(type);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeUltraGroupDefaultNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      RCIMIWPushNotificationLevel level =
          RCIMWrapperArgumentAdapter.toRCIMIWPushNotificationLevel(call.argument("level"));

      code = engine.changeUltraGroupDefaultNotificationLevel(targetId, level);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUltraGroupDefaultNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");

      code = engine.loadUltraGroupDefaultNotificationLevel(targetId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeUltraGroupChannelDefaultNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      RCIMIWPushNotificationLevel level =
          RCIMWrapperArgumentAdapter.toRCIMIWPushNotificationLevel(call.argument("level"));

      code = engine.changeUltraGroupChannelDefaultNotificationLevel(targetId, channelId, level);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadUltraGroupChannelDefaultNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadUltraGroupChannelDefaultNotificationLevel(targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changePushContentShowStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      Boolean showContent = (Boolean) call.argument("showContent");

      code = engine.changePushContentShowStatus(showContent);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changePushLanguage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String language = (String) call.argument("language");

      code = engine.changePushLanguage(language);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changePushReceiveStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      Boolean receive = (Boolean) call.argument("receive");

      code = engine.changePushReceiveStatus(receive);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendGroupMessageToDesignatedUsers(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));
      List<String> userIds = call.argument("userIds");

      code = engine.sendGroupMessageToDesignatedUsers(message, userIds);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadMessageCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");

      code = engine.loadMessageCount(type, targetId, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadTopConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.loadTopConversations(conversationTypes_str, channelId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void syncUltraGroupReadStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();

      code = engine.syncUltraGroupReadStatus(targetId, channelId, timestamp);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadConversationsForAllChannel(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");

      code = engine.loadConversationsForAllChannel(type, targetId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void modifyUltraGroupMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));

      code = engine.modifyUltraGroupMessage(messageUId, message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void recallUltraGroupMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));
      Boolean deleteRemote = (Boolean) call.argument("deleteRemote");

      code = engine.recallUltraGroupMessage(message, deleteRemote);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearUltraGroupMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      RCIMIWMessageOperationPolicy policy =
          RCIMWrapperArgumentAdapter.toRCIMIWMessageOperationPolicy(call.argument("policy"));

      code = engine.clearUltraGroupMessages(targetId, channelId, timestamp, policy);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendUltraGroupTypingStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      RCIMIWUltraGroupTypingStatus typingStatus =
          RCIMWrapperArgumentAdapter.toRCIMIWUltraGroupTypingStatus(call.argument("typingStatus"));

      code = engine.sendUltraGroupTypingStatus(targetId, channelId, typingStatus);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearUltraGroupMessagesForAllChannel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();

      code = engine.clearUltraGroupMessagesForAllChannel(targetId, timestamp);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadBatchRemoteUltraGroupMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<HashMap<String, Object>> messages = call.argument("messages");

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.loadBatchRemoteUltraGroupMessages(messages_str);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateUltraGroupMessageExpansion(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      Map<String, String> expansion = (Map<String, String>) call.argument("expansion");

      code = engine.updateUltraGroupMessageExpansion(messageUId, expansion);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeUltraGroupMessageExpansion(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      List<String> keys = call.argument("keys");

      code = engine.removeUltraGroupMessageExpansion(messageUId, keys);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeLogLevel(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWLogLevel level = RCIMWrapperArgumentAdapter.toRCIMIWLogLevel(call.argument("level"));

      code = engine.changeLogLevel(level);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  class RCIMIWListenerImpl extends RCIMIWListener {

    @Override
    public void onMessageReceived(
        RCIMIWMessage message, int left, boolean offline, boolean hasPackage) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));
      arguments.put("left", left);
      arguments.put("offline", offline);
      arguments.put("hasPackage", hasPackage);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageReceived", arguments);
            }
          });
    }

    @Override
    public void onConnectionStatusChanged(RCIMIWConnectionStatus status) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("status", status.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConnectionStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onConversationTopStatusSynced(
        RCIMIWConversationType type, String targetId, String channelId, boolean top) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("top", top);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationTopStatusSynced", arguments);
            }
          });
    }

    @Override
    public void onRemoteMessageRecalled(RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onRemoteMessageRecalled", arguments);
            }
          });
    }

    @Override
    public void onPrivateReadReceiptReceived(String targetId, String channelId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onPrivateReadReceiptReceived", arguments);
            }
          });
    }

    @Override
    public void onRemoteMessageExpansionUpdated(
        Map<String, String> expansion, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("expansion", expansion);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onRemoteMessageExpansionUpdated", arguments);
            }
          });
    }

    @Override
    public void onRemoteMessageExpansionForKeyRemoved(RCIMIWMessage message, List<String> keys) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));
      arguments.put("keys", keys);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onRemoteMessageExpansionForKeyRemoved", arguments);
            }
          });
    }

    @Override
    public void onChatRoomMemberChanged(String targetId, List<RCIMIWChatRoomMemberAction> actions) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List actions_str = new ArrayList();

      if (actions != null) {
        for (RCIMIWChatRoomMemberAction element : actions) {
          actions_str.add(RCIMIWPlatformConverter.convertChatRoomMemberAction(element));
        }
      }

      arguments.put("targetId", targetId);
      arguments.put("actions", actions_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomMemberChanged", arguments);
            }
          });
    }

    @Override
    public void onTypingStatusChanged(
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        List<RCIMIWTypingStatus> userTypingStatus) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List userTypingStatus_str = new ArrayList();

      if (userTypingStatus != null) {
        for (RCIMIWTypingStatus element : userTypingStatus) {
          userTypingStatus_str.add(RCIMIWPlatformConverter.convertTypingStatus(element));
        }
      }

      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("userTypingStatus", userTypingStatus_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onTypingStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onConversationReadStatusSyncMessageReceived(
        RCIMIWConversationType type, String targetId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationReadStatusSyncMessageReceived", arguments);
            }
          });
    }

    @Override
    public void onChatRoomEntriesSynced(String roomId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("roomId", roomId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomEntriesSynced", arguments);
            }
          });
    }

    @Override
    public void onChatRoomEntriesChanged(
        RCIMIWChatRoomEntriesOperationType operationType,
        String roomId,
        Map<String, String> entries) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("operationType", operationType.ordinal());
      arguments.put("roomId", roomId);
      arguments.put("entries", entries);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomEntriesChanged", arguments);
            }
          });
    }

    @Override
    public void onRemoteUltraGroupMessageExpansionUpdated(List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onRemoteUltraGroupMessageExpansionUpdated", arguments);
            }
          });
    }

    @Override
    public void onRemoteUltraGroupMessageModified(List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onRemoteUltraGroupMessageModified", arguments);
            }
          });
    }

    @Override
    public void onRemoteUltraGroupMessageRecalled(List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onRemoteUltraGroupMessageRecalled", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupReadTimeReceived(String targetId, String channelId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupReadTimeReceived", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupTypingStatusChanged(List<RCIMIWUltraGroupTypingStatusInfo> info) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List info_str = new ArrayList();

      if (info != null) {
        for (RCIMIWUltraGroupTypingStatusInfo element : info) {
          info_str.add(RCIMIWPlatformConverter.convertUltraGroupTypingStatusInfo(element));
        }
      }

      arguments.put("info", info_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupTypingStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onMessageBlocked(RCIMIWBlockedMessageInfo info) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("info", RCIMIWPlatformConverter.convertBlockedMessageInfo(info));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageBlocked", arguments);
            }
          });
    }

    @Override
    public void onChatRoomStatusChanged(String targetId, RCIMIWChatRoomStatus status) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("targetId", targetId);
      arguments.put("status", status.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onGroupMessageReadReceiptRequestReceived(String targetId, String messageUId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("targetId", targetId);
      arguments.put("messageUId", messageUId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupMessageReadReceiptRequestReceived", arguments);
            }
          });
    }

    @Override
    public void onGroupMessageReadReceiptResponseReceived(
        String targetId, String messageUId, Map<String, Long> respondUserIds) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("targetId", targetId);
      arguments.put("messageUId", messageUId);
      arguments.put("respondUserIds", respondUserIds);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupMessageReadReceiptResponseReceived", arguments);
            }
          });
    }

    @Override
    public void onConnected(int code, String userId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("userId", userId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConnected", arguments);
            }
          });
    }

    @Override
    public void onDatabaseOpened(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onDatabaseOpened", arguments);
            }
          });
    }

    @Override
    public void onConversationLoaded(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        RCIMIWConversation conversation) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("conversation", RCIMIWPlatformConverter.convertConversation(conversation));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationLoaded", arguments);
            }
          });
    }

    @Override
    public void onConversationsLoaded(
        int code,
        List<RCIMIWConversationType> conversationTypes,
        String channelId,
        long startTime,
        int count,
        List<RCIMIWConversation> conversations) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List conversationTypes_str = new ArrayList();

      if (conversationTypes != null) {
        for (RCIMIWConversationType element : conversationTypes) {
          conversationTypes_str.add(element.ordinal());
        }
      }

      List conversations_str = new ArrayList();

      if (conversations != null) {
        for (RCIMIWConversation element : conversations) {
          conversations_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("code", code);
      arguments.put("conversationTypes", conversationTypes_str);
      arguments.put("channelId", channelId);
      arguments.put("startTime", startTime);
      arguments.put("count", count);
      arguments.put("conversations", conversations_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationsLoaded", arguments);
            }
          });
    }

    @Override
    public void onConversationRemoved(
        int code, RCIMIWConversationType type, String targetId, String channelId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationRemoved", arguments);
            }
          });
    }

    @Override
    public void onConversationsRemoved(
        int code, List<RCIMIWConversationType> conversationTypes, String channelId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List conversationTypes_str = new ArrayList();

      if (conversationTypes != null) {
        for (RCIMIWConversationType element : conversationTypes) {
          conversationTypes_str.add(element.ordinal());
        }
      }

      arguments.put("code", code);
      arguments.put("conversationTypes", conversationTypes_str);
      arguments.put("channelId", channelId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationsRemoved", arguments);
            }
          });
    }

    @Override
    public void onTotalUnreadCountLoaded(int code, String channelId, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("channelId", channelId);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onTotalUnreadCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onUnreadCountLoaded(
        int code, RCIMIWConversationType type, String targetId, String channelId, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUnreadCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onUnreadCountByConversationTypesLoaded(
        int code,
        List<RCIMIWConversationType> conversationTypes,
        String channelId,
        boolean contain,
        int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List conversationTypes_str = new ArrayList();

      if (conversationTypes != null) {
        for (RCIMIWConversationType element : conversationTypes) {
          conversationTypes_str.add(element.ordinal());
        }
      }

      arguments.put("code", code);
      arguments.put("conversationTypes", conversationTypes_str);
      arguments.put("channelId", channelId);
      arguments.put("contain", contain);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUnreadCountByConversationTypesLoaded", arguments);
            }
          });
    }

    @Override
    public void onUnreadMentionedCountLoaded(
        int code, RCIMIWConversationType type, String targetId, String channelId, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUnreadMentionedCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupAllUnreadCountLoaded(int code, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupAllUnreadCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupAllUnreadMentionedCountLoaded(int code, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupAllUnreadMentionedCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onUnreadCountCleared(
        int code, RCIMIWConversationType type, String targetId, String channelId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUnreadCountCleared", arguments);
            }
          });
    }

    @Override
    public void onDraftMessageSaved(
        int code, RCIMIWConversationType type, String targetId, String channelId, String draft) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("draft", draft);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onDraftMessageSaved", arguments);
            }
          });
    }

    @Override
    public void onDraftMessageCleared(
        int code, RCIMIWConversationType type, String targetId, String channelId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onDraftMessageCleared", arguments);
            }
          });
    }

    @Override
    public void onDraftMessageLoaded(
        int code, RCIMIWConversationType type, String targetId, String channelId, String draft) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("draft", draft);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onDraftMessageLoaded", arguments);
            }
          });
    }

    @Override
    public void onBlockedConversationsLoaded(
        int code,
        List<RCIMIWConversationType> conversationTypes,
        String channelId,
        List<RCIMIWConversation> conversations) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List conversationTypes_str = new ArrayList();

      if (conversationTypes != null) {
        for (RCIMIWConversationType element : conversationTypes) {
          conversationTypes_str.add(element.ordinal());
        }
      }

      List conversations_str = new ArrayList();

      if (conversations != null) {
        for (RCIMIWConversation element : conversations) {
          conversations_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("code", code);
      arguments.put("conversationTypes", conversationTypes_str);
      arguments.put("channelId", channelId);
      arguments.put("conversations", conversations_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onBlockedConversationsLoaded", arguments);
            }
          });
    }

    @Override
    public void onConversationTopStatusChanged(
        int code, RCIMIWConversationType type, String targetId, String channelId, boolean top) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("top", top);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationTopStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onConversationTopStatusLoaded(
        int code, RCIMIWConversationType type, String targetId, String channelId, boolean top) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("top", top);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationTopStatusLoaded", arguments);
            }
          });
    }

    @Override
    public void onConversationReadStatusSynced(
        int code, RCIMIWConversationType type, String targetId, String channelId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationReadStatusSynced", arguments);
            }
          });
    }

    @Override
    public void onMessageAttached(RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageAttached", arguments);
            }
          });
    }

    @Override
    public void onMessageSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageSent", arguments);
            }
          });
    }

    @Override
    public void onMediaMessageAttached(RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMediaMessageAttached", arguments);
            }
          });
    }

    @Override
    public void onMediaMessageSending(RCIMIWMediaMessage message, int progress) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));
      arguments.put("progress", progress);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMediaMessageSending", arguments);
            }
          });
    }

    @Override
    public void onSendingMediaMessageCanceled(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onSendingMediaMessageCanceled", arguments);
            }
          });
    }

    @Override
    public void onMediaMessageSent(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMediaMessageSent", arguments);
            }
          });
    }

    @Override
    public void onMediaMessageDownloading(RCIMIWMediaMessage message, int progress) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));
      arguments.put("progress", progress);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMediaMessageDownloading", arguments);
            }
          });
    }

    @Override
    public void onMediaMessageDownloaded(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMediaMessageDownloaded", arguments);
            }
          });
    }

    @Override
    public void onDownloadingMediaMessageCanceled(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onDownloadingMediaMessageCanceled", arguments);
            }
          });
    }

    @Override
    public void onMessagesLoaded(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        long sentTime,
        RCIMIWTimeOrder order,
        List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("sentTime", sentTime);
      arguments.put("order", order.ordinal());
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessagesLoaded", arguments);
            }
          });
    }

    @Override
    public void onUnreadMentionedMessagesLoaded(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUnreadMentionedMessagesLoaded", arguments);
            }
          });
    }

    @Override
    public void onFirstUnreadMessageLoaded(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onFirstUnreadMessageLoaded", arguments);
            }
          });
    }

    @Override
    public void onMessageInserted(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageInserted", arguments);
            }
          });
    }

    @Override
    public void onMessagesInserted(int code, List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessagesInserted", arguments);
            }
          });
    }

    @Override
    public void onMessageCleared(
        int code, RCIMIWConversationType type, String targetId, String channelId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageCleared", arguments);
            }
          });
    }

    @Override
    public void onLocalMessagesDeleted(int code, List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onLocalMessagesDeleted", arguments);
            }
          });
    }

    @Override
    public void onMessagesDeleted(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessagesDeleted", arguments);
            }
          });
    }

    @Override
    public void onMessageRecalled(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageRecalled", arguments);
            }
          });
    }

    @Override
    public void onPrivateReadReceiptMessageSent(
        int code, String targetId, String channelId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onPrivateReadReceiptMessageSent", arguments);
            }
          });
    }

    @Override
    public void onMessageExpansionUpdated(
        int code, String messageUId, Map<String, String> expansion) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("messageUId", messageUId);
      arguments.put("expansion", expansion);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageExpansionUpdated", arguments);
            }
          });
    }

    @Override
    public void onMessageExpansionForKeysRemoved(int code, String messageUId, List<String> keys) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("messageUId", messageUId);
      arguments.put("keys", keys);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageExpansionForKeysRemoved", arguments);
            }
          });
    }

    @Override
    public void onMessageReceiveStatusChanged(int code, long messageId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("messageId", messageId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageReceiveStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onMessageSentStatusChanged(int code, long messageId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("messageId", messageId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageSentStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onChatRoomJoined(int code, String targetId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomJoined", arguments);
            }
          });
    }

    @Override
    public void onChatRoomJoining(String targetId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("targetId", targetId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomJoining", arguments);
            }
          });
    }

    @Override
    public void onChatRoomLeft(int code, String targetId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomLeft", arguments);
            }
          });
    }

    @Override
    public void onChatRoomMessagesLoaded(
        int code, String targetId, List<RCIMIWMessage> messages, long syncTime) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("messages", messages_str);
      arguments.put("syncTime", syncTime);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomMessagesLoaded", arguments);
            }
          });
    }

    @Override
    public void onChatRoomEntryAdded(int code, String targetId, String key) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("key", key);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomEntryAdded", arguments);
            }
          });
    }

    @Override
    public void onChatRoomEntriesAdded(
        int code, String targetId, Map<String, String> entries, Map<String, Integer> errorEntries) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("entries", entries);
      arguments.put("errorEntries", errorEntries);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomEntriesAdded", arguments);
            }
          });
    }

    @Override
    public void onChatRoomEntryLoaded(int code, String targetId, Map<String, String> entry) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("entry", entry);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomEntryLoaded", arguments);
            }
          });
    }

    @Override
    public void onAllChatRoomEntriesLoaded(int code, String targetId, Map<String, String> entries) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("entries", entries);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onAllChatRoomEntriesLoaded", arguments);
            }
          });
    }

    @Override
    public void onChatRoomEntryRemoved(int code, String targetId, String key) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("key", key);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomEntryRemoved", arguments);
            }
          });
    }

    @Override
    public void onChatRoomEntriesRemoved(int code, String targetId, List<String> keys) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("keys", keys);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomEntriesRemoved", arguments);
            }
          });
    }

    @Override
    public void onBlacklistAdded(int code, String userId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("userId", userId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onBlacklistAdded", arguments);
            }
          });
    }

    @Override
    public void onBlacklistRemoved(int code, String userId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("userId", userId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onBlacklistRemoved", arguments);
            }
          });
    }

    @Override
    public void onBlacklistStatusLoaded(int code, String userId, RCIMIWBlacklistStatus status) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("userId", userId);
      arguments.put("status", status.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onBlacklistStatusLoaded", arguments);
            }
          });
    }

    @Override
    public void onBlacklistLoaded(int code, List<String> userIds) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("userIds", userIds);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onBlacklistLoaded", arguments);
            }
          });
    }

    @Override
    public void onMessagesSearched(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        String keyword,
        long startTime,
        int count,
        List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("keyword", keyword);
      arguments.put("startTime", startTime);
      arguments.put("count", count);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessagesSearched", arguments);
            }
          });
    }

    @Override
    public void onMessagesSearchedByTimeRange(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        String keyword,
        long startTime,
        long endTime,
        int offset,
        int count,
        List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("keyword", keyword);
      arguments.put("startTime", startTime);
      arguments.put("endTime", endTime);
      arguments.put("offset", offset);
      arguments.put("count", count);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessagesSearchedByTimeRange", arguments);
            }
          });
    }

    @Override
    public void onMessagesSearchedByUserId(
        int code,
        String userId,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        long startTime,
        int count,
        List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("userId", userId);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("startTime", startTime);
      arguments.put("count", count);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessagesSearchedByUserId", arguments);
            }
          });
    }

    @Override
    public void onConversationsSearched(
        int code,
        List<RCIMIWConversationType> conversationTypes,
        String channelId,
        List<RCIMIWMessageType> messageTypes,
        String keyword,
        List<RCIMIWSearchConversationResult> conversations) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List conversationTypes_str = new ArrayList();

      if (conversationTypes != null) {
        for (RCIMIWConversationType element : conversationTypes) {
          conversationTypes_str.add(element.ordinal());
        }
      }

      List messageTypes_str = new ArrayList();

      if (messageTypes != null) {
        for (RCIMIWMessageType element : messageTypes) {
          messageTypes_str.add(element.ordinal());
        }
      }

      List conversations_str = new ArrayList();

      if (conversations != null) {
        for (RCIMIWSearchConversationResult element : conversations) {
          conversations_str.add(RCIMIWPlatformConverter.convertSearchConversationResult(element));
        }
      }

      arguments.put("code", code);
      arguments.put("conversationTypes", conversationTypes_str);
      arguments.put("channelId", channelId);
      arguments.put("messageTypes", messageTypes_str);
      arguments.put("keyword", keyword);
      arguments.put("conversations", conversations_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationsSearched", arguments);
            }
          });
    }

    @Override
    public void onGroupReadReceiptRequestSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupReadReceiptRequestSent", arguments);
            }
          });
    }

    @Override
    public void onGroupReadReceiptResponseSent(
        int code, String targetId, String channelId, List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupReadReceiptResponseSent", arguments);
            }
          });
    }

    @Override
    public void onNotificationQuietHoursChanged(
        int code, String startTime, int spanMins, RCIMIWPushNotificationQuietHoursLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("startTime", startTime);
      arguments.put("spanMins", spanMins);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onNotificationQuietHoursChanged", arguments);
            }
          });
    }

    @Override
    public void onNotificationQuietHoursRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onNotificationQuietHoursRemoved", arguments);
            }
          });
    }

    @Override
    public void onNotificationQuietHoursLoaded(
        int code, String startTime, int spanMins, RCIMIWPushNotificationQuietHoursLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("startTime", startTime);
      arguments.put("spanMins", spanMins);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onNotificationQuietHoursLoaded", arguments);
            }
          });
    }

    @Override
    public void onConversationNotificationLevelChanged(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationNotificationLevelChanged", arguments);
            }
          });
    }

    @Override
    public void onConversationNotificationLevelLoaded(
        int code,
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationNotificationLevelLoaded", arguments);
            }
          });
    }

    @Override
    public void onConversationTypeNotificationLevelChanged(
        int code, RCIMIWConversationType type, RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationTypeNotificationLevelChanged", arguments);
            }
          });
    }

    @Override
    public void onConversationTypeNotificationLevelLoaded(
        int code, RCIMIWConversationType type, RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationTypeNotificationLevelLoaded", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupDefaultNotificationLevelChanged(
        int code, String targetId, RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupDefaultNotificationLevelChanged", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupDefaultNotificationLevelLoaded(
        int code, String targetId, RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupDefaultNotificationLevelLoaded", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupChannelDefaultNotificationLevelChanged(
        int code, String targetId, String channelId, RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine:onUltraGroupChannelDefaultNotificationLevelChanged", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupChannelDefaultNotificationLevelLoaded(
        int code, String targetId, String channelId, RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine:onUltraGroupChannelDefaultNotificationLevelLoaded", arguments);
            }
          });
    }

    @Override
    public void onPushContentShowStatusChanged(int code, boolean showContent) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("showContent", showContent);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onPushContentShowStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onPushLanguageChanged(int code, String language) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("language", language);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onPushLanguageChanged", arguments);
            }
          });
    }

    @Override
    public void onPushReceiveStatusChanged(int code, boolean receive) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("receive", receive);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onPushReceiveStatusChanged", arguments);
            }
          });
    }

    @Override
    public void onMessageCountLoaded(
        int code, RCIMIWConversationType type, String targetId, String channelId, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onMessageCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onTopConversationsLoaded(
        int code,
        List<RCIMIWConversationType> conversationTypes,
        String channelId,
        List<RCIMIWConversation> conversations) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List conversationTypes_str = new ArrayList();

      if (conversationTypes != null) {
        for (RCIMIWConversationType element : conversationTypes) {
          conversationTypes_str.add(element.ordinal());
        }
      }

      List conversations_str = new ArrayList();

      if (conversations != null) {
        for (RCIMIWConversation element : conversations) {
          conversations_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("code", code);
      arguments.put("conversationTypes", conversationTypes_str);
      arguments.put("channelId", channelId);
      arguments.put("conversations", conversations_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onTopConversationsLoaded", arguments);
            }
          });
    }

    @Override
    public void onGroupMessageToDesignatedUsersAttached(RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupMessageToDesignatedUsersAttached", arguments);
            }
          });
    }

    @Override
    public void onGroupMessageToDesignatedUsersSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupMessageToDesignatedUsersSent", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupReadStatusSynced(
        int code, String targetId, String channelId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupReadStatusSynced", arguments);
            }
          });
    }

    @Override
    public void onConversationsLoadedForAllChannel(
        int code,
        RCIMIWConversationType type,
        String targetId,
        List<RCIMIWConversation> conversations) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List conversations_str = new ArrayList();

      if (conversations != null) {
        for (RCIMIWConversation element : conversations) {
          conversations_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("code", code);
      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("conversations", conversations_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationsLoadedForAllChannel", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupUnreadMentionedCountLoaded(int code, String targetId, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupUnreadMentionedCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupUnreadCountLoaded(int code, String targetId, int count) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("count", count);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupUnreadCountLoaded", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupMessageModified(int code, String messageUId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("messageUId", messageUId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupMessageModified", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupMessageRecalled(int code, RCIMIWMessage message, boolean deleteRemote) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));
      arguments.put("deleteRemote", deleteRemote);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupMessageRecalled", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupMessagesCleared(
        int code,
        String targetId,
        String channelId,
        long timestamp,
        RCIMIWMessageOperationPolicy policy) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("timestamp", timestamp);
      arguments.put("policy", policy.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupMessagesCleared", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupMessagesClearedForAllChannel(
        int code, String targetId, long timestamp) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("timestamp", timestamp);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupMessagesClearedForAllChannel", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupTypingStatusSent(
        int code, String targetId, String channelId, RCIMIWUltraGroupTypingStatus typingStatus) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("typingStatus", typingStatus.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupTypingStatusSent", arguments);
            }
          });
    }

    @Override
    public void onBatchRemoteUltraGroupMessagesLoaded(
        int code, List<RCIMIWMessage> matchedMessages, List<RCIMIWMessage> notMatchedMessages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List matchedMessages_str = new ArrayList();

      if (matchedMessages != null) {
        for (RCIMIWMessage element : matchedMessages) {
          matchedMessages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      List notMatchedMessages_str = new ArrayList();

      if (notMatchedMessages != null) {
        for (RCIMIWMessage element : notMatchedMessages) {
          notMatchedMessages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("code", code);
      arguments.put("matchedMessages", matchedMessages_str);
      arguments.put("notMatchedMessages", notMatchedMessages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onBatchRemoteUltraGroupMessagesLoaded", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupMessageExpansionUpdated(
        int code, Map<String, String> expansion, String messageUId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("expansion", expansion);
      arguments.put("messageUId", messageUId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupMessageExpansionUpdated", arguments);
            }
          });
    }

    @Override
    public void onUltraGroupMessageExpansionRemoved(
        int code, String messageUId, List<String> keys) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("messageUId", messageUId);
      arguments.put("keys", keys);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupMessageExpansionRemoved", arguments);
            }
          });
    }
  }
}
