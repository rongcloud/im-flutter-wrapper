package cn.rongcloud.im.wrapper.flutter;

import android.annotation.SuppressLint;
import android.content.Context;
import androidx.annotation.NonNull;
import cn.rongcloud.im.wrapper.RCIMIWEngine;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddChatRoomEntriesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddChatRoomEntryCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddToBlacklistCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWCancelDownloadingMediaMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWCancelSendingMediaMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeConversationNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeConversationTopStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeConversationTypeNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeMessageReceivedStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeMessageSentStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeNotificationQuietHoursCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangePushContentShowStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangePushLanguageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangePushReceiveStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearDraftMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearUltraGroupMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearUltraGroupMessagesForAllChannelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWConnectCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWDeleteLocalMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWDeleteMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetBatchRemoteUltraGroupMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetBlacklistCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetBlacklistStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetBlockedConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetChatRoomAllEntriesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetChatRoomEntryCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetChatRoomMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationTopStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationTypeNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationsForAllChannelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetDraftMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetFirstUnreadMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMessageCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetNotificationQuietHoursCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetTopConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetTotalUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupAllUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupUnreadMentionedCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadCountByConversationTypesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadMentionedCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadMentionedMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWInsertMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWInsertMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWJoinChatRoomCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWLeaveChatRoomCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWModifyUltraGroupMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRecallMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRecallUltraGroupMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveChatRoomEntriesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveChatRoomEntryCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveConversationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveFromBlacklistCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveMessageExpansionForKeysCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveNotificationQuietHoursCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSaveDraftMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchMessagesByTimeRangeCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchMessagesByUserIdCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendGroupMessageToDesignatedUsersCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendGroupReadReceiptRequestCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendGroupReadReceiptResponseCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendPrivateReadReceiptMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendUltraGroupTypingStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSyncConversationReadStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSyncUltraGroupReadStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateMessageExpansionCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateUltraGroupMessageExpansionCallback;
import cn.rongcloud.im.wrapper.callback.RCIMIWConnectCallback;
import cn.rongcloud.im.wrapper.callback.RCIMIWSendGroupMessageToDesignatedUsersCallback;
import cn.rongcloud.im.wrapper.callback.RCIMIWSendMessageCallback;
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
import cn.rongcloud.im.wrapper.listener.IRCIMIWDownloadMediaMessageListener;
import cn.rongcloud.im.wrapper.listener.IRCIMIWSendMediaMessageListener;
import cn.rongcloud.im.wrapper.listener.RCIMIWDownloadMediaMessageListener;
import cn.rongcloud.im.wrapper.listener.RCIMIWListener;
import cn.rongcloud.im.wrapper.listener.RCIMIWSendMediaMessageListener;
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
import io.rong.imlib.model.MessageContent;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class RCIMWrapperEngine implements MethodCallHandler {

  private Context context;
  private FlutterAssets assets;
  private MethodChannel channel;

  private RCIMIWEngine engine = null;

  public List<Class<? extends MessageContent>> messageContentClassList;

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
        engine.registerCustomMessage(messageContentClassList);
        RCIMWrapperMainThreadPoster.success(result);
        break;
      case "engine:destroy":
        destroy(call, result);
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

      case "engine:getConversation":
        getConversation(call, result);
        break;

      case "engine:loadConversations":
        loadConversations(call, result);
        break;

      case "engine:getConversations":
        getConversations(call, result);
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

      case "engine:getUnreadCount":
        getUnreadCount(call, result);
        break;

      case "engine:loadTotalUnreadCount":
        loadTotalUnreadCount(call, result);
        break;

      case "engine:getTotalUnreadCount":
        getTotalUnreadCount(call, result);
        break;

      case "engine:loadUnreadMentionedCount":
        loadUnreadMentionedCount(call, result);
        break;

      case "engine:getUnreadMentionedCount":
        getUnreadMentionedCount(call, result);
        break;

      case "engine:loadUltraGroupAllUnreadCount":
        loadUltraGroupAllUnreadCount(call, result);
        break;

      case "engine:getUltraGroupAllUnreadCount":
        getUltraGroupAllUnreadCount(call, result);
        break;

      case "engine:loadUltraGroupAllUnreadMentionedCount":
        loadUltraGroupAllUnreadMentionedCount(call, result);
        break;

      case "engine:getUltraGroupAllUnreadMentionedCount":
        getUltraGroupAllUnreadMentionedCount(call, result);
        break;

      case "engine:loadUltraGroupUnreadCount":
        loadUltraGroupUnreadCount(call, result);
        break;

      case "engine:getUltraGroupUnreadCount":
        getUltraGroupUnreadCount(call, result);
        break;

      case "engine:loadUltraGroupUnreadMentionedCount":
        loadUltraGroupUnreadMentionedCount(call, result);
        break;

      case "engine:getUltraGroupUnreadMentionedCount":
        getUltraGroupUnreadMentionedCount(call, result);
        break;

      case "engine:loadUnreadCountByConversationTypes":
        loadUnreadCountByConversationTypes(call, result);
        break;

      case "engine:getUnreadCountByConversationTypes":
        getUnreadCountByConversationTypes(call, result);
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

      case "engine:getDraftMessage":
        getDraftMessage(call, result);
        break;

      case "engine:clearDraftMessage":
        clearDraftMessage(call, result);
        break;

      case "engine:loadBlockedConversations":
        loadBlockedConversations(call, result);
        break;

      case "engine:getBlockedConversations":
        getBlockedConversations(call, result);
        break;

      case "engine:changeConversationTopStatus":
        changeConversationTopStatus(call, result);
        break;

      case "engine:loadConversationTopStatus":
        loadConversationTopStatus(call, result);
        break;

      case "engine:getConversationTopStatus":
        getConversationTopStatus(call, result);
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

      case "engine:getMessages":
        getMessages(call, result);
        break;

      case "engine:getMessageById":
        getMessageById(call, result);
        break;

      case "engine:getMessageByUId":
        getMessageByUId(call, result);
        break;

      case "engine:loadFirstUnreadMessage":
        loadFirstUnreadMessage(call, result);
        break;

      case "engine:getFirstUnreadMessage":
        getFirstUnreadMessage(call, result);
        break;

      case "engine:loadUnreadMentionedMessages":
        loadUnreadMentionedMessages(call, result);
        break;

      case "engine:getUnreadMentionedMessages":
        getUnreadMentionedMessages(call, result);
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

      case "engine:getChatRoomMessages":
        getChatRoomMessages(call, result);
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

      case "engine:getChatRoomEntry":
        getChatRoomEntry(call, result);
        break;

      case "engine:loadChatRoomAllEntries":
        loadChatRoomAllEntries(call, result);
        break;

      case "engine:getChatRoomAllEntries":
        getChatRoomAllEntries(call, result);
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

      case "engine:getBlacklistStatus":
        getBlacklistStatus(call, result);
        break;

      case "engine:loadBlacklist":
        loadBlacklist(call, result);
        break;

      case "engine:getBlacklist":
        getBlacklist(call, result);
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

      case "engine:getNotificationQuietHours":
        getNotificationQuietHours(call, result);
        break;

      case "engine:changeConversationNotificationLevel":
        changeConversationNotificationLevel(call, result);
        break;

      case "engine:loadConversationNotificationLevel":
        loadConversationNotificationLevel(call, result);
        break;

      case "engine:getConversationNotificationLevel":
        getConversationNotificationLevel(call, result);
        break;

      case "engine:changeConversationTypeNotificationLevel":
        changeConversationTypeNotificationLevel(call, result);
        break;

      case "engine:loadConversationTypeNotificationLevel":
        loadConversationTypeNotificationLevel(call, result);
        break;

      case "engine:getConversationTypeNotificationLevel":
        getConversationTypeNotificationLevel(call, result);
        break;

      case "engine:changeUltraGroupDefaultNotificationLevel":
        changeUltraGroupDefaultNotificationLevel(call, result);
        break;

      case "engine:loadUltraGroupDefaultNotificationLevel":
        loadUltraGroupDefaultNotificationLevel(call, result);
        break;

      case "engine:getUltraGroupDefaultNotificationLevel":
        getUltraGroupDefaultNotificationLevel(call, result);
        break;

      case "engine:changeUltraGroupChannelDefaultNotificationLevel":
        changeUltraGroupChannelDefaultNotificationLevel(call, result);
        break;

      case "engine:loadUltraGroupChannelDefaultNotificationLevel":
        loadUltraGroupChannelDefaultNotificationLevel(call, result);
        break;

      case "engine:getUltraGroupChannelDefaultNotificationLevel":
        getUltraGroupChannelDefaultNotificationLevel(call, result);
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

      case "engine:getMessageCount":
        getMessageCount(call, result);
        break;

      case "engine:loadTopConversations":
        loadTopConversations(call, result);
        break;

      case "engine:getTopConversations":
        getTopConversations(call, result);
        break;

      case "engine:syncUltraGroupReadStatus":
        syncUltraGroupReadStatus(call, result);
        break;

      case "engine:loadConversationsForAllChannel":
        loadConversationsForAllChannel(call, result);
        break;

      case "engine:getConversationsForAllChannel":
        getConversationsForAllChannel(call, result);
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

      case "engine:getBatchRemoteUltraGroupMessages":
        getBatchRemoteUltraGroupMessages(call, result);
        break;

      case "engine:updateUltraGroupMessageExpansion":
        updateUltraGroupMessageExpansion(call, result);
        break;

      case "engine:removeUltraGroupMessageExpansionForKeys":
        removeUltraGroupMessageExpansionForKeys(call, result);
        break;

      case "engine:changeLogLevel":
        changeLogLevel(call, result);
        break;

      case "engine:getDeltaTime":
        getDeltaTime(call, result);
        break;
    }
  }

  public void registerCustomMessage(
      final List<Class<? extends MessageContent>> messageContentClassList) {
    if (engine != null) {
      android.util.Log.d("TAG", "registerCustomMessage: ok");
      engine.registerCustomMessage(messageContentClassList);
    } else {
      android.util.Log.d("TAG", "registerCustomMessage: engine is null");
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      RCIMIWConnectCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new RCIMIWConnectCallbackImpl(cb_handler);
      }

      code = engine.connect(token, timeout, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      RCIMIWSendMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new RCIMIWSendMessageCallbackImpl(cb_handler);
      }

      code = engine.sendMessage(message, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      RCIMIWSendMediaMessageListenerImpl listener = null;
      if (cb_handler != -1) {
        listener = new RCIMIWSendMediaMessageListenerImpl(cb_handler);
      }

      code = engine.sendMediaMessage(message, listener);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void cancelSendingMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWCancelSendingMediaMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWCancelSendingMediaMessageCallbackImpl(cb_handler);
      }

      code = engine.cancelSendingMediaMessage(message, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void downloadMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      RCIMIWDownloadMediaMessageListenerImpl listener = null;
      if (cb_handler != -1) {
        listener = new RCIMIWDownloadMediaMessageListenerImpl(cb_handler);
      }

      code = engine.downloadMediaMessage(message, listener);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void cancelDownloadingMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMediaMessage message =
          RCIMIWPlatformConverter.convertMediaMessage(
              (HashMap<String, Object>) call.argument("message"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWCancelDownloadingMediaMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWCancelDownloadingMediaMessageCallbackImpl(cb_handler);
      }

      code = engine.cancelDownloadingMediaMessage(message, callback);
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

  private void getConversation(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationCallbackImpl(cb_handler);
      }

      code = engine.getConversation(type, targetId, channelId, callback);
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

  private void getConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      long startTime = ((Number) call.argument("startTime")).longValue();
      int count = ((Number) call.argument("count")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationsCallbackImpl(cb_handler);
      }

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.getConversations(conversationTypes_str, channelId, startTime, count, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveConversationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveConversationCallbackImpl(cb_handler);
      }

      code = engine.removeConversation(type, targetId, channelId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveConversationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveConversationsCallbackImpl(cb_handler);
      }

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.removeConversations(conversationTypes_str, channelId, callback);
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

  private void getUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUnreadCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUnreadCountCallbackImpl(cb_handler);
      }

      code = engine.getUnreadCount(type, targetId, channelId, callback);
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

  private void getTotalUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetTotalUnreadCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetTotalUnreadCountCallbackImpl(cb_handler);
      }

      code = engine.getTotalUnreadCount(channelId, callback);
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

  private void getUnreadMentionedCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUnreadMentionedCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUnreadMentionedCountCallbackImpl(cb_handler);
      }

      code = engine.getUnreadMentionedCount(type, targetId, channelId, callback);
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

  private void getUltraGroupAllUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUltraGroupAllUnreadCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUltraGroupAllUnreadCountCallbackImpl(cb_handler);
      }

      code = engine.getUltraGroupAllUnreadCount(callback);
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

  private void getUltraGroupAllUnreadMentionedCount(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUltraGroupAllUnreadMentionedCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUltraGroupAllUnreadMentionedCountCallbackImpl(cb_handler);
      }

      code = engine.getUltraGroupAllUnreadMentionedCount(callback);
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

  private void getUltraGroupUnreadCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUltraGroupUnreadCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUltraGroupUnreadCountCallbackImpl(cb_handler);
      }

      code = engine.getUltraGroupUnreadCount(targetId, callback);
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

  private void getUltraGroupUnreadMentionedCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUltraGroupUnreadMentionedCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUltraGroupUnreadMentionedCountCallbackImpl(cb_handler);
      }

      code = engine.getUltraGroupUnreadMentionedCount(targetId, callback);
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

  private void getUnreadCountByConversationTypes(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      Boolean contain = (Boolean) call.argument("contain");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUnreadCountByConversationTypesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUnreadCountByConversationTypesCallbackImpl(cb_handler);
      }

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code =
          engine.getUnreadCountByConversationTypes(
              conversationTypes_str, channelId, contain, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWClearUnreadCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWClearUnreadCountCallbackImpl(cb_handler);
      }

      code = engine.clearUnreadCount(type, targetId, channelId, timestamp, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSaveDraftMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSaveDraftMessageCallbackImpl(cb_handler);
      }

      code = engine.saveDraftMessage(type, targetId, channelId, draft, callback);
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

  private void getDraftMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetDraftMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetDraftMessageCallbackImpl(cb_handler);
      }

      code = engine.getDraftMessage(type, targetId, channelId, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWClearDraftMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWClearDraftMessageCallbackImpl(cb_handler);
      }

      code = engine.clearDraftMessage(type, targetId, channelId, callback);
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

  private void getBlockedConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetBlockedConversationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetBlockedConversationsCallbackImpl(cb_handler);
      }

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.getBlockedConversations(conversationTypes_str, channelId, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeConversationTopStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeConversationTopStatusCallbackImpl(cb_handler);
      }

      code = engine.changeConversationTopStatus(type, targetId, channelId, top, callback);
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

  private void getConversationTopStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationTopStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationTopStatusCallbackImpl(cb_handler);
      }

      code = engine.getConversationTopStatus(type, targetId, channelId, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSyncConversationReadStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSyncConversationReadStatusCallbackImpl(cb_handler);
      }

      code = engine.syncConversationReadStatus(type, targetId, channelId, timestamp, callback);
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

  private void getMessages(@NonNull MethodCall call, @NonNull Result result) {
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMessagesCallbackImpl(cb_handler);
      }

      code =
          engine.getMessages(type, targetId, channelId, sentTime, order, policy, count, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getMessageById(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMessageCallbackImpl(cb_handler);
      }

      code = engine.getMessageById(messageId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getMessageByUId(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMessageCallbackImpl(cb_handler);
      }

      code = engine.getMessageByUId(messageUId, callback);
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

  private void getFirstUnreadMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetFirstUnreadMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetFirstUnreadMessageCallbackImpl(cb_handler);
      }

      code = engine.getFirstUnreadMessage(type, targetId, channelId, callback);
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

  private void getUnreadMentionedMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUnreadMentionedMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUnreadMentionedMessagesCallbackImpl(cb_handler);
      }

      code = engine.getUnreadMentionedMessages(type, targetId, channelId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void insertMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWInsertMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWInsertMessageCallbackImpl(cb_handler);
      }

      code = engine.insertMessage(message, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void insertMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<HashMap<String, Object>> messages = call.argument("messages");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWInsertMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWInsertMessagesCallbackImpl(cb_handler);
      }

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.insertMessages(messages_str, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWClearMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWClearMessagesCallbackImpl(cb_handler);
      }

      code = engine.clearMessages(type, targetId, channelId, timestamp, policy, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void deleteLocalMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<HashMap<String, Object>> messages = call.argument("messages");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWDeleteLocalMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWDeleteLocalMessagesCallbackImpl(cb_handler);
      }

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.deleteLocalMessages(messages_str, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWDeleteMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWDeleteMessagesCallbackImpl(cb_handler);
      }

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.deleteMessages(type, targetId, channelId, messages_str, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void recallMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRecallMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRecallMessageCallbackImpl(cb_handler);
      }

      code = engine.recallMessage(message, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendPrivateReadReceiptMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSendPrivateReadReceiptMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSendPrivateReadReceiptMessageCallbackImpl(cb_handler);
      }

      code = engine.sendPrivateReadReceiptMessage(targetId, channelId, timestamp, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendGroupReadReceiptRequest(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWMessage message =
          RCIMIWPlatformConverter.convertMessage(
              (HashMap<String, Object>) call.argument("message"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSendGroupReadReceiptRequestCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSendGroupReadReceiptRequestCallbackImpl(cb_handler);
      }

      code = engine.sendGroupReadReceiptRequest(message, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void sendGroupReadReceiptResponse(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      List<HashMap<String, Object>> messages = call.argument("messages");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSendGroupReadReceiptResponseCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSendGroupReadReceiptResponseCallbackImpl(cb_handler);
      }

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.sendGroupReadReceiptResponse(targetId, channelId, messages_str, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateMessageExpansion(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      Map<String, String> expansion = (Map<String, String>) call.argument("expansion");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWUpdateMessageExpansionCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWUpdateMessageExpansionCallbackImpl(cb_handler);
      }

      code = engine.updateMessageExpansion(messageUId, expansion, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeMessageExpansionForKeys(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      List<String> keys = call.argument("keys");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveMessageExpansionForKeysCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveMessageExpansionForKeysCallbackImpl(cb_handler);
      }

      code = engine.removeMessageExpansionForKeys(messageUId, keys, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeMessageSentStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      RCIMIWSentStatus sentStatus =
          RCIMWrapperArgumentAdapter.toRCIMIWSentStatus(call.argument("sentStatus"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeMessageSentStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeMessageSentStatusCallbackImpl(cb_handler);
      }

      code = engine.changeMessageSentStatus(messageId, sentStatus, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeMessageReceiveStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      RCIMIWReceivedStatus receivedStatus =
          RCIMWrapperArgumentAdapter.toRCIMIWReceivedStatus(call.argument("receivedStatus"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeMessageReceivedStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeMessageReceivedStatusCallbackImpl(cb_handler);
      }

      code = engine.changeMessageReceiveStatus(messageId, receivedStatus, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void joinChatRoom(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      int messageCount = ((Number) call.argument("messageCount")).intValue();
      Boolean autoCreate = (Boolean) call.argument("autoCreate");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWJoinChatRoomCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWJoinChatRoomCallbackImpl(cb_handler);
      }

      code = engine.joinChatRoom(targetId, messageCount, autoCreate, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void leaveChatRoom(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWLeaveChatRoomCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWLeaveChatRoomCallbackImpl(cb_handler);
      }

      code = engine.leaveChatRoom(targetId, callback);
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

  private void getChatRoomMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      RCIMIWTimeOrder order = RCIMWrapperArgumentAdapter.toRCIMIWTimeOrder(call.argument("order"));
      int count = ((Number) call.argument("count")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetChatRoomMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetChatRoomMessagesCallbackImpl(cb_handler);
      }

      code = engine.getChatRoomMessages(targetId, timestamp, order, count, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAddChatRoomEntryCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAddChatRoomEntryCallbackImpl(cb_handler);
      }

      code = engine.addChatRoomEntry(targetId, key, value, deleteWhenLeft, overwrite, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAddChatRoomEntriesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAddChatRoomEntriesCallbackImpl(cb_handler);
      }

      code = engine.addChatRoomEntries(targetId, entries, deleteWhenLeft, overwrite, callback);
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

  private void getChatRoomEntry(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String key = (String) call.argument("key");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetChatRoomEntryCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetChatRoomEntryCallbackImpl(cb_handler);
      }

      code = engine.getChatRoomEntry(targetId, key, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void loadChatRoomAllEntries(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");

      code = engine.loadChatRoomAllEntries(targetId);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getChatRoomAllEntries(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetChatRoomAllEntriesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetChatRoomAllEntriesCallbackImpl(cb_handler);
      }

      code = engine.getChatRoomAllEntries(targetId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeChatRoomEntry(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String key = (String) call.argument("key");
      Boolean force = (Boolean) call.argument("force");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveChatRoomEntryCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveChatRoomEntryCallbackImpl(cb_handler);
      }

      code = engine.removeChatRoomEntry(targetId, key, force, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeChatRoomEntries(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      List<String> keys = call.argument("keys");
      Boolean force = (Boolean) call.argument("force");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveChatRoomEntriesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveChatRoomEntriesCallbackImpl(cb_handler);
      }

      code = engine.removeChatRoomEntries(targetId, keys, force, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void addToBlacklist(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String userId = (String) call.argument("userId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAddToBlacklistCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAddToBlacklistCallbackImpl(cb_handler);
      }

      code = engine.addToBlacklist(userId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeFromBlacklist(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String userId = (String) call.argument("userId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveFromBlacklistCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveFromBlacklistCallbackImpl(cb_handler);
      }

      code = engine.removeFromBlacklist(userId, callback);
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

  private void getBlacklistStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String userId = (String) call.argument("userId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetBlacklistStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetBlacklistStatusCallbackImpl(cb_handler);
      }

      code = engine.getBlacklistStatus(userId, callback);
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

  private void getBlacklist(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetBlacklistCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetBlacklistCallbackImpl(cb_handler);
      }

      code = engine.getBlacklist(callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchMessagesCallbackImpl(cb_handler);
      }

      code = engine.searchMessages(type, targetId, channelId, keyword, startTime, count, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchMessagesByTimeRangeCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchMessagesByTimeRangeCallbackImpl(cb_handler);
      }

      code =
          engine.searchMessagesByTimeRange(
              type, targetId, channelId, keyword, startTime, endTime, offset, count, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchMessagesByUserIdCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchMessagesByUserIdCallbackImpl(cb_handler);
      }

      code =
          engine.searchMessagesByUserId(
              userId, type, targetId, channelId, startTime, count, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchConversationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchConversationsCallbackImpl(cb_handler);
      }

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
          engine.searchConversations(
              conversationTypes_str, channelId, messageTypes_str, keyword, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeNotificationQuietHours(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String startTime = (String) call.argument("startTime");
      int spanMinutes = ((Number) call.argument("spanMinutes")).intValue();
      RCIMIWPushNotificationQuietHoursLevel level =
          RCIMWrapperArgumentAdapter.toRCIMIWPushNotificationQuietHoursLevel(
              call.argument("level"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeNotificationQuietHoursCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeNotificationQuietHoursCallbackImpl(cb_handler);
      }

      code = engine.changeNotificationQuietHours(startTime, spanMinutes, level, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeNotificationQuietHours(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveNotificationQuietHoursCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveNotificationQuietHoursCallbackImpl(cb_handler);
      }

      code = engine.removeNotificationQuietHours(callback);
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

  private void getNotificationQuietHours(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetNotificationQuietHoursCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetNotificationQuietHoursCallbackImpl(cb_handler);
      }

      code = engine.getNotificationQuietHours(callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeConversationNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeConversationNotificationLevelCallbackImpl(cb_handler);
      }

      code = engine.changeConversationNotificationLevel(type, targetId, channelId, level, callback);
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

  private void getConversationNotificationLevel(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationNotificationLevelCallbackImpl(cb_handler);
      }

      code = engine.getConversationNotificationLevel(type, targetId, channelId, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeConversationTypeNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeConversationTypeNotificationLevelCallbackImpl(cb_handler);
      }

      code = engine.changeConversationTypeNotificationLevel(type, level, callback);
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

  private void getConversationTypeNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationTypeNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationTypeNotificationLevelCallbackImpl(cb_handler);
      }

      code = engine.getConversationTypeNotificationLevel(type, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeUltraGroupDefaultNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeUltraGroupDefaultNotificationLevelCallbackImpl(cb_handler);
      }

      code = engine.changeUltraGroupDefaultNotificationLevel(targetId, level, callback);
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

  private void getUltraGroupDefaultNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUltraGroupDefaultNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUltraGroupDefaultNotificationLevelCallbackImpl(cb_handler);
      }

      code = engine.getUltraGroupDefaultNotificationLevel(targetId, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback =
            new IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallbackImpl(cb_handler);
      }

      code =
          engine.changeUltraGroupChannelDefaultNotificationLevel(
              targetId, channelId, level, callback);
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

  private void getUltraGroupChannelDefaultNotificationLevel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallbackImpl(cb_handler);
      }

      code = engine.getUltraGroupChannelDefaultNotificationLevel(targetId, channelId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changePushContentShowStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      Boolean showContent = (Boolean) call.argument("showContent");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangePushContentShowStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangePushContentShowStatusCallbackImpl(cb_handler);
      }

      code = engine.changePushContentShowStatus(showContent, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changePushLanguage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String language = (String) call.argument("language");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangePushLanguageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangePushLanguageCallbackImpl(cb_handler);
      }

      code = engine.changePushLanguage(language, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changePushReceiveStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      Boolean receive = (Boolean) call.argument("receive");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangePushReceiveStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangePushReceiveStatusCallbackImpl(cb_handler);
      }

      code = engine.changePushReceiveStatus(receive, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      RCIMIWSendGroupMessageToDesignatedUsersCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new RCIMIWSendGroupMessageToDesignatedUsersCallbackImpl(cb_handler);
      }

      code = engine.sendGroupMessageToDesignatedUsers(message, userIds, callback);
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

  private void getMessageCount(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMessageCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMessageCountCallbackImpl(cb_handler);
      }

      code = engine.getMessageCount(type, targetId, channelId, callback);
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

  private void getTopConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetTopConversationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetTopConversationsCallbackImpl(cb_handler);
      }

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.getTopConversations(conversationTypes_str, channelId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void syncUltraGroupReadStatus(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSyncUltraGroupReadStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSyncUltraGroupReadStatusCallbackImpl(cb_handler);
      }

      code = engine.syncUltraGroupReadStatus(targetId, channelId, timestamp, callback);
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

  private void getConversationsForAllChannel(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationsForAllChannelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationsForAllChannelCallbackImpl(cb_handler);
      }

      code = engine.getConversationsForAllChannel(type, targetId, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWModifyUltraGroupMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWModifyUltraGroupMessageCallbackImpl(cb_handler);
      }

      code = engine.modifyUltraGroupMessage(messageUId, message, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRecallUltraGroupMessageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRecallUltraGroupMessageCallbackImpl(cb_handler);
      }

      code = engine.recallUltraGroupMessage(message, deleteRemote, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWClearUltraGroupMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWClearUltraGroupMessagesCallbackImpl(cb_handler);
      }

      code = engine.clearUltraGroupMessages(targetId, channelId, timestamp, policy, callback);
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
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSendUltraGroupTypingStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSendUltraGroupTypingStatusCallbackImpl(cb_handler);
      }

      code = engine.sendUltraGroupTypingStatus(targetId, channelId, typingStatus, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearUltraGroupMessagesForAllChannel(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String targetId = (String) call.argument("targetId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWClearUltraGroupMessagesForAllChannelCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWClearUltraGroupMessagesForAllChannelCallbackImpl(cb_handler);
      }

      code = engine.clearUltraGroupMessagesForAllChannel(targetId, timestamp, callback);
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

  private void getBatchRemoteUltraGroupMessages(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<HashMap<String, Object>> messages = call.argument("messages");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetBatchRemoteUltraGroupMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetBatchRemoteUltraGroupMessagesCallbackImpl(cb_handler);
      }

      List messages_str = new ArrayList();
      for (HashMap<String, Object> element : messages) {
        messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
      }

      code = engine.getBatchRemoteUltraGroupMessages(messages_str, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateUltraGroupMessageExpansion(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      Map<String, String> expansion = (Map<String, String>) call.argument("expansion");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWUpdateUltraGroupMessageExpansionCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWUpdateUltraGroupMessageExpansionCallbackImpl(cb_handler);
      }

      code = engine.updateUltraGroupMessageExpansion(messageUId, expansion, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeUltraGroupMessageExpansionForKeys(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      List<String> keys = call.argument("keys");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallbackImpl(cb_handler);
      }

      code = engine.removeUltraGroupMessageExpansionForKeys(messageUId, keys, callback);
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

  private void getDeltaTime(@NonNull MethodCall call, @NonNull Result result) {
    long code = 0;
    if (engine != null) {

      code = engine.getDeltaTime();
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
    public void onConversationNotificationLevelSynced(
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        RCIMIWPushNotificationLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationNotificationLevelSynced", arguments);
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
    public void onUltraGroupConversationsSynced() {
      final HashMap<String, Object> arguments = new HashMap<>();

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupConversationsSynced", arguments);
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
    public void onMessagesCleared(
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
              channel.invokeMethod("engine:onMessagesCleared", arguments);
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
    public void onChatRoomAllEntriesLoaded(int code, String targetId, Map<String, String> entries) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("targetId", targetId);
      arguments.put("entries", entries);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomAllEntriesLoaded", arguments);
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
        int code, String startTime, int spanMinutes, RCIMIWPushNotificationQuietHoursLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("startTime", startTime);
      arguments.put("spanMinutes", spanMinutes);
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
        int code, String startTime, int spanMinutes, RCIMIWPushNotificationQuietHoursLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("startTime", startTime);
      arguments.put("spanMinutes", spanMinutes);
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
    public void onUltraGroupMessageExpansionForKeysRemoved(
        int code, String messageUId, List<String> keys) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("code", code);
      arguments.put("messageUId", messageUId);
      arguments.put("keys", keys);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onUltraGroupMessageExpansionForKeysRemoved", arguments);
            }
          });
    }
  }

  class IRCIMIWConnectCallbackImpl implements IRCIMIWConnectCallback {
    private int cb_handler = -1;

    IRCIMIWConnectCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConnected(int code, String userId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("userId", userId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWConnectCallback_onConnected", arguments);
            }
          });
    }

    @Override
    public void onDatabaseOpened(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWConnectCallback_onDatabaseOpened", arguments);
            }
          });
    }
  }

  class IRCIMIWSendMessageCallbackImpl implements IRCIMIWSendMessageCallback {
    private int cb_handler = -1;

    IRCIMIWSendMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageSaved(RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendMessageCallback_onMessageSaved", arguments);
            }
          });
    }

    @Override
    public void onMessageSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWSendMessageCallback_onMessageSent", arguments);
            }
          });
    }
  }

  class IRCIMIWSendMediaMessageListenerImpl implements IRCIMIWSendMediaMessageListener {
    private int cb_handler = -1;

    IRCIMIWSendMediaMessageListenerImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMediaMessageSaved(RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSaved", arguments);
            }
          });
    }

    @Override
    public void onMediaMessageSending(RCIMIWMediaMessage message, int progress) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));
      arguments.put("progress", progress);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSending", arguments);
            }
          });
    }

    @Override
    public void onSendingMediaMessageCanceled(RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendMediaMessageListener_onSendingMediaMessageCanceled",
                  arguments);
            }
          });
    }

    @Override
    public void onMediaMessageSent(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSent", arguments);
            }
          });
    }
  }

  class IRCIMIWCancelSendingMediaMessageCallbackImpl
      implements IRCIMIWCancelSendingMediaMessageCallback {
    private int cb_handler = -1;

    IRCIMIWCancelSendingMediaMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCancelSendingMediaMessageCalled(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWCancelSendingMediaMessageCallback_onCancelSendingMediaMessageCalled",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWDownloadMediaMessageListenerImpl implements IRCIMIWDownloadMediaMessageListener {
    private int cb_handler = -1;

    IRCIMIWDownloadMediaMessageListenerImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMediaMessageDownloading(RCIMIWMediaMessage message, int progress) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));
      arguments.put("progress", progress);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWDownloadMediaMessageListener_onMediaMessageDownloading",
                  arguments);
            }
          });
    }

    @Override
    public void onDownloadingMediaMessageCanceled(RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWDownloadMediaMessageListener_onDownloadingMediaMessageCanceled",
                  arguments);
            }
          });
    }

    @Override
    public void onMediaMessageDownloaded(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWDownloadMediaMessageListener_onMediaMessageDownloaded",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWCancelDownloadingMediaMessageCallbackImpl
      implements IRCIMIWCancelDownloadingMediaMessageCallback {
    private int cb_handler = -1;

    IRCIMIWCancelDownloadingMediaMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCancelDownloadingMediaMessageCalled(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWCancelDownloadingMediaMessageCallback_onCancelDownloadingMediaMessageCalled",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetConversationCallbackImpl implements IRCIMIWGetConversationCallback {
    private int cb_handler = -1;

    IRCIMIWGetConversationCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWConversation t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertConversation(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetConversationCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetConversationCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetConversationsCallbackImpl implements IRCIMIWGetConversationsCallback {
    private int cb_handler = -1;

    IRCIMIWGetConversationsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWConversation> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWConversation element : t) {
          t_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationsCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetConversationsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveConversationCallbackImpl implements IRCIMIWRemoveConversationCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveConversationCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveConversationCallback_onConversationRemoved", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveConversationsCallbackImpl implements IRCIMIWRemoveConversationsCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveConversationsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationsRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveConversationsCallback_onConversationsRemoved", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUnreadCountCallbackImpl implements IRCIMIWGetUnreadCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetUnreadCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetUnreadCountCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetUnreadCountCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetTotalUnreadCountCallbackImpl implements IRCIMIWGetTotalUnreadCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetTotalUnreadCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetTotalUnreadCountCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetTotalUnreadCountCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUnreadMentionedCountCallbackImpl
      implements IRCIMIWGetUnreadMentionedCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetUnreadMentionedCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUltraGroupAllUnreadCountCallbackImpl
      implements IRCIMIWGetUltraGroupAllUnreadCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetUltraGroupAllUnreadCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUltraGroupAllUnreadMentionedCountCallbackImpl
      implements IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetUltraGroupAllUnreadMentionedCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onSuccess",
                  arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onError",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetUltraGroupUnreadCountCallbackImpl
      implements IRCIMIWGetUltraGroupUnreadCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetUltraGroupUnreadCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUltraGroupUnreadMentionedCountCallbackImpl
      implements IRCIMIWGetUltraGroupUnreadMentionedCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetUltraGroupUnreadMentionedCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onSuccess",
                  arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUnreadCountByConversationTypesCallbackImpl
      implements IRCIMIWGetUnreadCountByConversationTypesCallback {
    private int cb_handler = -1;

    IRCIMIWGetUnreadCountByConversationTypesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onSuccess",
                  arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWClearUnreadCountCallbackImpl implements IRCIMIWClearUnreadCountCallback {
    private int cb_handler = -1;

    IRCIMIWClearUnreadCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUnreadCountCleared(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWClearUnreadCountCallback_onUnreadCountCleared", arguments);
            }
          });
    }
  }

  class IRCIMIWSaveDraftMessageCallbackImpl implements IRCIMIWSaveDraftMessageCallback {
    private int cb_handler = -1;

    IRCIMIWSaveDraftMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onDraftMessageSaved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSaveDraftMessageCallback_onDraftMessageSaved", arguments);
            }
          });
    }
  }

  class IRCIMIWGetDraftMessageCallbackImpl implements IRCIMIWGetDraftMessageCallback {
    private int cb_handler = -1;

    IRCIMIWGetDraftMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(String t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetDraftMessageCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetDraftMessageCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWClearDraftMessageCallbackImpl implements IRCIMIWClearDraftMessageCallback {
    private int cb_handler = -1;

    IRCIMIWClearDraftMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onDraftMessageCleared(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWClearDraftMessageCallback_onDraftMessageCleared", arguments);
            }
          });
    }
  }

  class IRCIMIWGetBlockedConversationsCallbackImpl
      implements IRCIMIWGetBlockedConversationsCallback {
    private int cb_handler = -1;

    IRCIMIWGetBlockedConversationsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWConversation> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWConversation element : t) {
          t_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetBlockedConversationsCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetBlockedConversationsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWChangeConversationTopStatusCallbackImpl
      implements IRCIMIWChangeConversationTopStatusCallback {
    private int cb_handler = -1;

    IRCIMIWChangeConversationTopStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationTopStatusChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeConversationTopStatusCallback_onConversationTopStatusChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetConversationTopStatusCallbackImpl
      implements IRCIMIWGetConversationTopStatusCallback {
    private int cb_handler = -1;

    IRCIMIWGetConversationTopStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Boolean t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationTopStatusCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationTopStatusCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSyncConversationReadStatusCallbackImpl
      implements IRCIMIWSyncConversationReadStatusCallback {
    private int cb_handler = -1;

    IRCIMIWSyncConversationReadStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationReadStatusSynced(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSyncConversationReadStatusCallback_onConversationReadStatusSynced",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetMessagesCallbackImpl implements IRCIMIWGetMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWGetMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWMessage> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWMessage element : t) {
          t_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetMessagesCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetMessagesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetMessageCallbackImpl implements IRCIMIWGetMessageCallback {
    private int cb_handler = -1;

    IRCIMIWGetMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWMessage t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertMessage(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetMessageCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetMessageCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetFirstUnreadMessageCallbackImpl implements IRCIMIWGetFirstUnreadMessageCallback {
    private int cb_handler = -1;

    IRCIMIWGetFirstUnreadMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWMessage t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertMessage(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUnreadMentionedMessagesCallbackImpl
      implements IRCIMIWGetUnreadMentionedMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWGetUnreadMentionedMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWMessage> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWMessage element : t) {
          t_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWInsertMessageCallbackImpl implements IRCIMIWInsertMessageCallback {
    private int cb_handler = -1;

    IRCIMIWInsertMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageInserted(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWInsertMessageCallback_onMessageInserted", arguments);
            }
          });
    }
  }

  class IRCIMIWInsertMessagesCallbackImpl implements IRCIMIWInsertMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWInsertMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
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

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWInsertMessagesCallback_onMessagesInserted", arguments);
            }
          });
    }
  }

  class IRCIMIWClearMessagesCallbackImpl implements IRCIMIWClearMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWClearMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessagesCleared(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWClearMessagesCallback_onMessagesCleared", arguments);
            }
          });
    }
  }

  class IRCIMIWDeleteLocalMessagesCallbackImpl implements IRCIMIWDeleteLocalMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWDeleteLocalMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
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

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWDeleteLocalMessagesCallback_onLocalMessagesDeleted", arguments);
            }
          });
    }
  }

  class IRCIMIWDeleteMessagesCallbackImpl implements IRCIMIWDeleteMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWDeleteMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessagesDeleted(int code, List<RCIMIWMessage> messages) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List messages_str = new ArrayList();

      if (messages != null) {
        for (RCIMIWMessage element : messages) {
          messages_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("messages", messages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWDeleteMessagesCallback_onMessagesDeleted", arguments);
            }
          });
    }
  }

  class IRCIMIWRecallMessageCallbackImpl implements IRCIMIWRecallMessageCallback {
    private int cb_handler = -1;

    IRCIMIWRecallMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageRecalled(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRecallMessageCallback_onMessageRecalled", arguments);
            }
          });
    }
  }

  class IRCIMIWSendPrivateReadReceiptMessageCallbackImpl
      implements IRCIMIWSendPrivateReadReceiptMessageCallback {
    private int cb_handler = -1;

    IRCIMIWSendPrivateReadReceiptMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onPrivateReadReceiptMessageSent(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendPrivateReadReceiptMessageCallback_onPrivateReadReceiptMessageSent",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWSendGroupReadReceiptRequestCallbackImpl
      implements IRCIMIWSendGroupReadReceiptRequestCallback {
    private int cb_handler = -1;

    IRCIMIWSendGroupReadReceiptRequestCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onGroupReadReceiptRequestSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendGroupReadReceiptRequestCallback_onGroupReadReceiptRequestSent",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWSendGroupReadReceiptResponseCallbackImpl
      implements IRCIMIWSendGroupReadReceiptResponseCallback {
    private int cb_handler = -1;

    IRCIMIWSendGroupReadReceiptResponseCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onGroupReadReceiptResponseSent(int code, List<RCIMIWMessage> message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List message_str = new ArrayList();

      if (message != null) {
        for (RCIMIWMessage element : message) {
          message_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", message_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendGroupReadReceiptResponseCallback_onGroupReadReceiptResponseSent",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWUpdateMessageExpansionCallbackImpl implements IRCIMIWUpdateMessageExpansionCallback {
    private int cb_handler = -1;

    IRCIMIWUpdateMessageExpansionCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageExpansionUpdated(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateMessageExpansionCallback_onMessageExpansionUpdated",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveMessageExpansionForKeysCallbackImpl
      implements IRCIMIWRemoveMessageExpansionForKeysCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveMessageExpansionForKeysCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageExpansionForKeysRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveMessageExpansionForKeysCallback_onMessageExpansionForKeysRemoved",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWChangeMessageSentStatusCallbackImpl
      implements IRCIMIWChangeMessageSentStatusCallback {
    private int cb_handler = -1;

    IRCIMIWChangeMessageSentStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageSentStatusChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeMessageSentStatusCallback_onMessageSentStatusChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWChangeMessageReceivedStatusCallbackImpl
      implements IRCIMIWChangeMessageReceivedStatusCallback {
    private int cb_handler = -1;

    IRCIMIWChangeMessageReceivedStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageReceiveStatusChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeMessageReceivedStatusCallback_onMessageReceiveStatusChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWJoinChatRoomCallbackImpl implements IRCIMIWJoinChatRoomCallback {
    private int cb_handler = -1;

    IRCIMIWJoinChatRoomCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onChatRoomJoined(int code, String targetId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("targetId", targetId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWJoinChatRoomCallback_onChatRoomJoined", arguments);
            }
          });
    }
  }

  class IRCIMIWLeaveChatRoomCallbackImpl implements IRCIMIWLeaveChatRoomCallback {
    private int cb_handler = -1;

    IRCIMIWLeaveChatRoomCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onChatRoomLeft(int code, String targetId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("targetId", targetId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWLeaveChatRoomCallback_onChatRoomLeft", arguments);
            }
          });
    }
  }

  class IRCIMIWGetChatRoomMessagesCallbackImpl implements IRCIMIWGetChatRoomMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWGetChatRoomMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWMessage> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWMessage element : t) {
          t_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetChatRoomMessagesCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetChatRoomMessagesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWAddChatRoomEntryCallbackImpl implements IRCIMIWAddChatRoomEntryCallback {
    private int cb_handler = -1;

    IRCIMIWAddChatRoomEntryCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onChatRoomEntryAdded(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWAddChatRoomEntryCallback_onChatRoomEntryAdded", arguments);
            }
          });
    }
  }

  class IRCIMIWAddChatRoomEntriesCallbackImpl implements IRCIMIWAddChatRoomEntriesCallback {
    private int cb_handler = -1;

    IRCIMIWAddChatRoomEntriesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onChatRoomEntriesAdded(int code, Map<String, Integer> errors) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("errors", errors);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWAddChatRoomEntriesCallback_onChatRoomEntriesAdded", arguments);
            }
          });
    }
  }

  class IRCIMIWGetChatRoomEntryCallbackImpl implements IRCIMIWGetChatRoomEntryCallback {
    private int cb_handler = -1;

    IRCIMIWGetChatRoomEntryCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Map<String, String> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetChatRoomEntryCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetChatRoomEntryCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetChatRoomAllEntriesCallbackImpl implements IRCIMIWGetChatRoomAllEntriesCallback {
    private int cb_handler = -1;

    IRCIMIWGetChatRoomAllEntriesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Map<String, String> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveChatRoomEntryCallbackImpl implements IRCIMIWRemoveChatRoomEntryCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveChatRoomEntryCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onChatRoomEntryRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveChatRoomEntryCallback_onChatRoomEntryRemoved", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveChatRoomEntriesCallbackImpl implements IRCIMIWRemoveChatRoomEntriesCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveChatRoomEntriesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onChatRoomEntriesRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveChatRoomEntriesCallback_onChatRoomEntriesRemoved",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWAddToBlacklistCallbackImpl implements IRCIMIWAddToBlacklistCallback {
    private int cb_handler = -1;

    IRCIMIWAddToBlacklistCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onBlacklistAdded(int code, String userId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("userId", userId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWAddToBlacklistCallback_onBlacklistAdded", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveFromBlacklistCallbackImpl implements IRCIMIWRemoveFromBlacklistCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveFromBlacklistCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onBlacklistRemoved(int code, String userId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("userId", userId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveFromBlacklistCallback_onBlacklistRemoved", arguments);
            }
          });
    }
  }

  class IRCIMIWGetBlacklistStatusCallbackImpl implements IRCIMIWGetBlacklistStatusCallback {
    private int cb_handler = -1;

    IRCIMIWGetBlacklistStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWBlacklistStatus t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetBlacklistStatusCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetBlacklistStatusCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetBlacklistCallbackImpl implements IRCIMIWGetBlacklistCallback {
    private int cb_handler = -1;

    IRCIMIWGetBlacklistCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<String> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetBlacklistCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetBlacklistCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSearchMessagesCallbackImpl implements IRCIMIWSearchMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWSearchMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWMessage> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWMessage element : t) {
          t_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWSearchMessagesCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWSearchMessagesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSearchMessagesByTimeRangeCallbackImpl
      implements IRCIMIWSearchMessagesByTimeRangeCallback {
    private int cb_handler = -1;

    IRCIMIWSearchMessagesByTimeRangeCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWMessage> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWMessage element : t) {
          t_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSearchMessagesByUserIdCallbackImpl implements IRCIMIWSearchMessagesByUserIdCallback {
    private int cb_handler = -1;

    IRCIMIWSearchMessagesByUserIdCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWMessage> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWMessage element : t) {
          t_str.add(RCIMIWPlatformConverter.convertMessage(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSearchConversationsCallbackImpl implements IRCIMIWSearchConversationsCallback {
    private int cb_handler = -1;

    IRCIMIWSearchConversationsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWSearchConversationResult> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWSearchConversationResult element : t) {
          t_str.add(RCIMIWPlatformConverter.convertSearchConversationResult(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchConversationsCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchConversationsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWChangeNotificationQuietHoursCallbackImpl
      implements IRCIMIWChangeNotificationQuietHoursCallback {
    private int cb_handler = -1;

    IRCIMIWChangeNotificationQuietHoursCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onNotificationQuietHoursChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeNotificationQuietHoursCallback_onNotificationQuietHoursChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveNotificationQuietHoursCallbackImpl
      implements IRCIMIWRemoveNotificationQuietHoursCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveNotificationQuietHoursCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onNotificationQuietHoursRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveNotificationQuietHoursCallback_onNotificationQuietHoursRemoved",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetNotificationQuietHoursCallbackImpl
      implements IRCIMIWGetNotificationQuietHoursCallback {
    private int cb_handler = -1;

    IRCIMIWGetNotificationQuietHoursCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(
        String startTime, int spanMinutes, RCIMIWPushNotificationQuietHoursLevel level) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("startTime", startTime);
      arguments.put("spanMinutes", spanMinutes);
      arguments.put("level", level.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWChangeConversationNotificationLevelCallbackImpl
      implements IRCIMIWChangeConversationNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWChangeConversationNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationNotificationLevelChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeConversationNotificationLevelCallback_onConversationNotificationLevelChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetConversationNotificationLevelCallbackImpl
      implements IRCIMIWGetConversationNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWGetConversationNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPushNotificationLevel t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWChangeConversationTypeNotificationLevelCallbackImpl
      implements IRCIMIWChangeConversationTypeNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWChangeConversationTypeNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationTypeNotificationLevelChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeConversationTypeNotificationLevelCallback_onConversationTypeNotificationLevelChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetConversationTypeNotificationLevelCallbackImpl
      implements IRCIMIWGetConversationTypeNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWGetConversationTypeNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPushNotificationLevel t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onSuccess",
                  arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onError",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWChangeUltraGroupDefaultNotificationLevelCallbackImpl
      implements IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWChangeUltraGroupDefaultNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupDefaultNotificationLevelChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback_onUltraGroupDefaultNotificationLevelChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetUltraGroupDefaultNotificationLevelCallbackImpl
      implements IRCIMIWGetUltraGroupDefaultNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWGetUltraGroupDefaultNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPushNotificationLevel t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onSuccess",
                  arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onError",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallbackImpl
      implements IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupChannelDefaultNotificationLevelChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback_onUltraGroupChannelDefaultNotificationLevelChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallbackImpl
      implements IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback {
    private int cb_handler = -1;

    IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPushNotificationLevel t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onSuccess",
                  arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onError",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWChangePushContentShowStatusCallbackImpl
      implements IRCIMIWChangePushContentShowStatusCallback {
    private int cb_handler = -1;

    IRCIMIWChangePushContentShowStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onPushContentShowStatusChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangePushContentShowStatusCallback_onPushContentShowStatusChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWChangePushLanguageCallbackImpl implements IRCIMIWChangePushLanguageCallback {
    private int cb_handler = -1;

    IRCIMIWChangePushLanguageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onPushLanguageChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangePushLanguageCallback_onPushLanguageChanged", arguments);
            }
          });
    }
  }

  class IRCIMIWChangePushReceiveStatusCallbackImpl
      implements IRCIMIWChangePushReceiveStatusCallback {
    private int cb_handler = -1;

    IRCIMIWChangePushReceiveStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onPushReceiveStatusChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangePushReceiveStatusCallback_onPushReceiveStatusChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWSendGroupMessageToDesignatedUsersCallbackImpl
      implements IRCIMIWSendGroupMessageToDesignatedUsersCallback {
    private int cb_handler = -1;

    IRCIMIWSendGroupMessageToDesignatedUsersCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageSaved(RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSaved",
                  arguments);
            }
          });
    }

    @Override
    public void onMessageSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSent",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetMessageCountCallbackImpl implements IRCIMIWGetMessageCountCallback {
    private int cb_handler = -1;

    IRCIMIWGetMessageCountCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(Integer t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetMessageCountCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetMessageCountCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetTopConversationsCallbackImpl implements IRCIMIWGetTopConversationsCallback {
    private int cb_handler = -1;

    IRCIMIWGetTopConversationsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWConversation> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWConversation element : t) {
          t_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetTopConversationsCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetTopConversationsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSyncUltraGroupReadStatusCallbackImpl
      implements IRCIMIWSyncUltraGroupReadStatusCallback {
    private int cb_handler = -1;

    IRCIMIWSyncUltraGroupReadStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupReadStatusSynced(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSyncUltraGroupReadStatusCallback_onUltraGroupReadStatusSynced",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetConversationsForAllChannelCallbackImpl
      implements IRCIMIWGetConversationsForAllChannelCallback {
    private int cb_handler = -1;

    IRCIMIWGetConversationsForAllChannelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWConversation> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWConversation element : t) {
          t_str.add(RCIMIWPlatformConverter.convertConversation(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWModifyUltraGroupMessageCallbackImpl
      implements IRCIMIWModifyUltraGroupMessageCallback {
    private int cb_handler = -1;

    IRCIMIWModifyUltraGroupMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupMessageModified(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWModifyUltraGroupMessageCallback_onUltraGroupMessageModified",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWRecallUltraGroupMessageCallbackImpl
      implements IRCIMIWRecallUltraGroupMessageCallback {
    private int cb_handler = -1;

    IRCIMIWRecallUltraGroupMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupMessageRecalled(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRecallUltraGroupMessageCallback_onUltraGroupMessageRecalled",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWClearUltraGroupMessagesCallbackImpl
      implements IRCIMIWClearUltraGroupMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWClearUltraGroupMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupMessagesCleared(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWClearUltraGroupMessagesCallback_onUltraGroupMessagesCleared",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWSendUltraGroupTypingStatusCallbackImpl
      implements IRCIMIWSendUltraGroupTypingStatusCallback {
    private int cb_handler = -1;

    IRCIMIWSendUltraGroupTypingStatusCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupTypingStatusSent(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSendUltraGroupTypingStatusCallback_onUltraGroupTypingStatusSent",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWClearUltraGroupMessagesForAllChannelCallbackImpl
      implements IRCIMIWClearUltraGroupMessagesForAllChannelCallback {
    private int cb_handler = -1;

    IRCIMIWClearUltraGroupMessagesForAllChannelCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupMessagesClearedForAllChannel(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWClearUltraGroupMessagesForAllChannelCallback_onUltraGroupMessagesClearedForAllChannel",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetBatchRemoteUltraGroupMessagesCallbackImpl
      implements IRCIMIWGetBatchRemoteUltraGroupMessagesCallback {
    private int cb_handler = -1;

    IRCIMIWGetBatchRemoteUltraGroupMessagesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(
        List<RCIMIWMessage> matchedMessages, List<RCIMIWMessage> notMatchedMessages) {
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

      arguments.put("cb_handler", cb_handler);
      arguments.put("matchedMessages", matchedMessages_str);
      arguments.put("notMatchedMessages", notMatchedMessages_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWUpdateUltraGroupMessageExpansionCallbackImpl
      implements IRCIMIWUpdateUltraGroupMessageExpansionCallback {
    private int cb_handler = -1;

    IRCIMIWUpdateUltraGroupMessageExpansionCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupMessageExpansionUpdated(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateUltraGroupMessageExpansionCallback_onUltraGroupMessageExpansionUpdated",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallbackImpl
      implements IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onUltraGroupMessageExpansionForKeysRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback_onUltraGroupMessageExpansionForKeysRemoved",
                  arguments);
            }
          });
    }
  }

  class RCIMIWConnectCallbackImpl extends RCIMIWConnectCallback {
    private int cb_handler = -1;

    RCIMIWConnectCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onDatabaseOpened(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:RCIMIWConnectCallback_onDatabaseOpened", arguments);
            }
          });
    }

    @Override
    public void onConnected(int code, String userId) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("userId", userId);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:RCIMIWConnectCallback_onConnected", arguments);
            }
          });
    }
  }

  class RCIMIWSendMessageCallbackImpl extends RCIMIWSendMessageCallback {
    private int cb_handler = -1;

    RCIMIWSendMessageCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageSaved(RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:RCIMIWSendMessageCallback_onMessageSaved", arguments);
            }
          });
    }

    @Override
    public void onMessageSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:RCIMIWSendMessageCallback_onMessageSent", arguments);
            }
          });
    }
  }

  class RCIMIWSendMediaMessageListenerImpl extends RCIMIWSendMediaMessageListener {
    private int cb_handler = -1;

    RCIMIWSendMediaMessageListenerImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMediaMessageSaved(RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSaved", arguments);
            }
          });
    }

    @Override
    public void onMediaMessageSending(RCIMIWMediaMessage message, int progress) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));
      arguments.put("progress", progress);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSending", arguments);
            }
          });
    }

    @Override
    public void onSendingMediaMessageCanceled(RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWSendMediaMessageListener_onSendingMediaMessageCanceled",
                  arguments);
            }
          });
    }

    @Override
    public void onMediaMessageSent(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSent", arguments);
            }
          });
    }
  }

  class RCIMIWDownloadMediaMessageListenerImpl extends RCIMIWDownloadMediaMessageListener {
    private int cb_handler = -1;

    RCIMIWDownloadMediaMessageListenerImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMediaMessageDownloading(RCIMIWMediaMessage message, int progress) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));
      arguments.put("progress", progress);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloading",
                  arguments);
            }
          });
    }

    @Override
    public void onDownloadingMediaMessageCanceled(RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWDownloadMediaMessageListener_onDownloadingMediaMessageCanceled",
                  arguments);
            }
          });
    }

    @Override
    public void onMediaMessageDownloaded(int code, RCIMIWMediaMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMediaMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloaded",
                  arguments);
            }
          });
    }
  }

  class RCIMIWSendGroupMessageToDesignatedUsersCallbackImpl
      extends RCIMIWSendGroupMessageToDesignatedUsersCallback {
    private int cb_handler = -1;

    RCIMIWSendGroupMessageToDesignatedUsersCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageSaved(RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSaved",
                  arguments);
            }
          });
    }

    @Override
    public void onMessageSent(int code, RCIMIWMessage message) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("message", RCIMIWPlatformConverter.convertMessage(message));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSent",
                  arguments);
            }
          });
    }
  }
}
