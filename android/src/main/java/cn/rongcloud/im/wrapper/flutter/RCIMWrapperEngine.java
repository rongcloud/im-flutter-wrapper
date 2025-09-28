package cn.rongcloud.im.wrapper.flutter;

import android.annotation.SuppressLint;
import android.content.Context;
import androidx.annotation.NonNull;
import cn.rongcloud.im.wrapper.RCIMIWEngine;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAcceptGroupApplicationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAcceptGroupInviteCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddChatRoomEntriesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddChatRoomEntryCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddConversationToTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddGroupFollowsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddGroupManagersCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWAddToBlacklistCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWCancelDownloadingMediaMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWCancelSendingMediaMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeConversationNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeConversationTopStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeConversationTopStatusInTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeConversationTypeNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeMessageReceivedStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeMessageReceivedStatusInfoCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeMessageSentStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeNotificationQuietHoursCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangePushContentShowStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangePushLanguageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangePushReceiveStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearConversationsByTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearDraftMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearMessagesUnreadStatusByTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearUltraGroupMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearUltraGroupMessagesForAllChannelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWClearUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWCompletionCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWConnectCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWCreateGroupCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWCreateTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWDeleteLocalMessageByIdsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWDeleteLocalMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWDeleteMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWDismissGroupCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetAutoTranslateEnabledCallback;
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
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationTopStatusInTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationTypeNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetConversationsForAllChannelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetDraftMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetFirstUnreadMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetGroupApplicationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetGroupFollowsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetGroupMembersByRoleCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetGroupMembersCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetGroupsInfoCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetJoinedGroupsByRoleCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetJoinedGroupsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMessageCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMessagesAroundTimeCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMyUserProfileCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetMyUserProfileVisibilityCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetNotificationQuietHoursCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetTagsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetTagsFromConversationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetTopConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetTotalUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupAllUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupDefaultNotificationLevelCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUltraGroupUnreadMentionedCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadCountByConversationTypesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadCountByLevelsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadMentionedCountCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUnreadMentionedMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGetUserProfilesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWGroupInfoUpdatedCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWInsertMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWInsertMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWInviteUsersToGroupCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWJoinChatRoomCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWJoinGroupCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWKickGroupMembersCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWLeaveChatRoomCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWModifyUltraGroupMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWOperationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWQuerySubscribeEventCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWQuitGroupCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRecallMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRecallUltraGroupMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRefuseGroupApplicationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRefuseGroupInviteCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveChatRoomEntriesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveChatRoomEntryCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveConversationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveConversationFromTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveFromBlacklistCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveGroupFollowsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveGroupManagersCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveMessageExpansionForKeysCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveNotificationQuietHoursCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveTagCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveTagsFromConversationCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSaveDraftMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchConversationsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchGroupMembersCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchJoinedGroupsCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchMessagesByMessageTypesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchMessagesByTimeRangeCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchMessagesByUserIdCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchMessagesCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSearchUserProfileByUniqueIdCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendGroupMessageToDesignatedUsersCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendGroupReadReceiptRequestCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendGroupReadReceiptResponseCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendPrivateReadReceiptMessageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSendUltraGroupTypingStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSetGroupMemberInfoCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSetGroupRemarkCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSubscribeEventCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSyncConversationReadStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWSyncUltraGroupReadStatusCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWTransferGroupOwnerCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWTranslateGetLanguageCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWTranslateResponseCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateMessageExpansionCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateMessageLocalExtraCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateMyUserProfileCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateMyUserProfileVisibilityCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateTagNameByIdCallback;
import cn.rongcloud.im.wrapper.callback.IRCIMIWUpdateUltraGroupMessageExpansionCallback;
import cn.rongcloud.im.wrapper.callback.RCIMIWConnectCallback;
import cn.rongcloud.im.wrapper.callback.RCIMIWSendGroupMessageToDesignatedUsersCallback;
import cn.rongcloud.im.wrapper.callback.RCIMIWSendMessageCallback;
import cn.rongcloud.im.wrapper.chatroom.RCIMIWChatRoomMemberAction;
import cn.rongcloud.im.wrapper.chatroom.RCIMIWChatRoomMemberBanEvent;
import cn.rongcloud.im.wrapper.chatroom.RCIMIWChatRoomMemberBlockEvent;
import cn.rongcloud.im.wrapper.chatroom.RCIMIWChatRoomSyncEvent;
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
import cn.rongcloud.im.wrapper.constants.RCIMIWNativeCustomMessagePersistentFlag;
import cn.rongcloud.im.wrapper.constants.RCIMIWPushNotificationLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWPushNotificationQuietHoursLevel;
import cn.rongcloud.im.wrapper.constants.RCIMIWReceivedStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWSentStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWTimeOrder;
import cn.rongcloud.im.wrapper.constants.RCIMIWTranslateStrategy;
import cn.rongcloud.im.wrapper.constants.RCIMIWTypingStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWUltraGroupTypingStatus;
import cn.rongcloud.im.wrapper.constants.RCIMIWUltraGroupTypingStatusInfo;
import cn.rongcloud.im.wrapper.conversation.RCIMIWConversation;
import cn.rongcloud.im.wrapper.conversation.RCIMIWConversationTagInfo;
import cn.rongcloud.im.wrapper.conversation.RCIMIWSearchConversationResult;
import cn.rongcloud.im.wrapper.conversation.RCIMIWTagInfo;
import cn.rongcloud.im.wrapper.group.RCIMIWFollowInfo;
import cn.rongcloud.im.wrapper.group.RCIMIWGroupApplicationInfo;
import cn.rongcloud.im.wrapper.group.RCIMIWGroupInfo;
import cn.rongcloud.im.wrapper.group.RCIMIWGroupMemberInfo;
import cn.rongcloud.im.wrapper.group.RCIMIWPagingQueryOption;
import cn.rongcloud.im.wrapper.group.RCIMIWPagingQueryResult;
import cn.rongcloud.im.wrapper.group.RCIMIWQuitGroupConfig;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupMemberRole;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupOperation;
import cn.rongcloud.im.wrapper.group.constants.RCIMIWGroupOperationType;
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
import cn.rongcloud.im.wrapper.messages.RCIMIWNativeCustomMediaMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWNativeCustomMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWReceivedStatusInfo;
import cn.rongcloud.im.wrapper.messages.RCIMIWReferenceMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWSightMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWTextMessage;
import cn.rongcloud.im.wrapper.messages.RCIMIWVoiceMessage;
import cn.rongcloud.im.wrapper.options.RCIMIWEngineOptions;
import cn.rongcloud.im.wrapper.platform.RCIMIWPlatformConverter;
import cn.rongcloud.im.wrapper.settings.RCIMIWAppSettings;
import cn.rongcloud.im.wrapper.speechtotext.RCIMIWSpeechToTextInfo;
import cn.rongcloud.im.wrapper.subscribeevent.RCIMIWSubscribeEvent;
import cn.rongcloud.im.wrapper.subscribeevent.RCIMIWSubscribeEventRequest;
import cn.rongcloud.im.wrapper.subscribeevent.RCIMIWSubscribeInfoEvent;
import cn.rongcloud.im.wrapper.subscribeevent.RCIMIWSubscribeType;
import cn.rongcloud.im.wrapper.translate.RCIMIWTranslateItem;
import cn.rongcloud.im.wrapper.translate.RCIMIWTranslateMessagesParams;
import cn.rongcloud.im.wrapper.translate.RCIMIWTranslateTextParams;
import cn.rongcloud.im.wrapper.userprofile.RCIMIWUserProfile;
import cn.rongcloud.im.wrapper.userprofile.RCIMIWUserProfileVisibility;
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

  public List<Class<? extends MessageContent>> messageContentClassList = new ArrayList<>();

  //  public static RCIMWrapperEngine getInstance() {
  //    return SingletonHolder.instance;
  //  }

  public RCIMWrapperEngine() {}

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

      case "engine:registerNativeCustomMessage":
        registerNativeCustomMessage(call, result);
        break;

      case "engine:registerNativeCustomMediaMessage":
        registerNativeCustomMediaMessage(call, result);
        break;

      case "engine:connect":
        connect(call, result);
        break;

      case "engine:disconnect":
        disconnect(call, result);
        break;

      case "engine:getConnectionStatus":
        getConnectionStatus(call, result);
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

      case "engine:createNativeCustomMessage":
        createNativeCustomMessage(call, result);
        break;

      case "engine:createNativeCustomMediaMessage":
        createNativeCustomMediaMessage(call, result);
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

      case "engine:getConversationsWithPriority":
        getConversationsWithPriority(call, result);
        break;

      case "engine:getUnreadConversations":
        getUnreadConversations(call, result);
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

      case "engine:getUnreadCountByLevels":
        getUnreadCountByLevels(call, result);
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

      case "engine:changeConversationTopStatusWithUpdateTme":
        changeConversationTopStatusWithUpdateTme(call, result);
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

      case "engine:getMessagesAroundTime":
        getMessagesAroundTime(call, result);
        break;

      case "engine:getLocalMessagesByMessageTypes":
        getLocalMessagesByMessageTypes(call, result);
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

      case "engine:deleteLocalMessageByIds":
        deleteLocalMessageByIds(call, result);
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

      case "engine:changeMessageReceiveStatusInfo":
        changeMessageReceiveStatusInfo(call, result);
        break;

      case "engine:updateMessageLocalExtra":
        updateMessageLocalExtra(call, result);
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

      case "engine:searchMessagesByMessageTypes":
        searchMessagesByMessageTypes(call, result);
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

      case "engine:getAppSettings":
        getAppSettings(call, result);
        break;

      case "engine:createTag":
        createTag(call, result);
        break;

      case "engine:removeTag":
        removeTag(call, result);
        break;

      case "engine:updateTagNameById":
        updateTagNameById(call, result);
        break;

      case "engine:getTags":
        getTags(call, result);
        break;

      case "engine:addConversationToTag":
        addConversationToTag(call, result);
        break;

      case "engine:removeConversationFromTag":
        removeConversationFromTag(call, result);
        break;

      case "engine:removeTagsFromConversation":
        removeTagsFromConversation(call, result);
        break;

      case "engine:getTagsFromConversation":
        getTagsFromConversation(call, result);
        break;

      case "engine:getConversationsFromTagByPage":
        getConversationsFromTagByPage(call, result);
        break;

      case "engine:getUnreadCountByTag":
        getUnreadCountByTag(call, result);
        break;

      case "engine:changeConversationTopStatusInTag":
        changeConversationTopStatusInTag(call, result);
        break;

      case "engine:getConversationTopStatusInTag":
        getConversationTopStatusInTag(call, result);
        break;

      case "engine:clearMessagesUnreadStatusByTag":
        clearMessagesUnreadStatusByTag(call, result);
        break;

      case "engine:clearConversationsByTag":
        clearConversationsByTag(call, result);
        break;

      case "engine:setModuleName":
        setModuleName(call, result);
        break;

      case "engine:writeLog":
        writeLog(call, result);
        break;

      case "engine:createGroup":
        createGroup(call, result);
        break;

      case "engine:updateGroupInfo":
        updateGroupInfo(call, result);
        break;

      case "engine:getGroupsInfo":
        getGroupsInfo(call, result);
        break;

      case "engine:kickGroupMembers":
        kickGroupMembers(call, result);
        break;

      case "engine:joinGroup":
        joinGroup(call, result);
        break;

      case "engine:quitGroup":
        quitGroup(call, result);
        break;

      case "engine:dismissGroup":
        dismissGroup(call, result);
        break;

      case "engine:transferGroupOwner":
        transferGroupOwner(call, result);
        break;

      case "engine:getGroupMembers":
        getGroupMembers(call, result);
        break;

      case "engine:getGroupMembersByRole":
        getGroupMembersByRole(call, result);
        break;

      case "engine:getJoinedGroupsByRole":
        getJoinedGroupsByRole(call, result);
        break;

      case "engine:getJoinedGroups":
        getJoinedGroups(call, result);
        break;

      case "engine:setGroupRemark":
        setGroupRemark(call, result);
        break;

      case "engine:setGroupMemberInfo":
        setGroupMemberInfo(call, result);
        break;

      case "engine:searchJoinedGroups":
        searchJoinedGroups(call, result);
        break;

      case "engine:searchGroupMembers":
        searchGroupMembers(call, result);
        break;

      case "engine:addGroupManagers":
        addGroupManagers(call, result);
        break;

      case "engine:removeGroupManagers":
        removeGroupManagers(call, result);
        break;

      case "engine:inviteUsersToGroup":
        inviteUsersToGroup(call, result);
        break;

      case "engine:acceptGroupInvite":
        acceptGroupInvite(call, result);
        break;

      case "engine:refuseGroupInvite":
        refuseGroupInvite(call, result);
        break;

      case "engine:acceptGroupApplication":
        acceptGroupApplication(call, result);
        break;

      case "engine:refuseGroupApplication":
        refuseGroupApplication(call, result);
        break;

      case "engine:getGroupApplications":
        getGroupApplications(call, result);
        break;

      case "engine:addGroupFollows":
        addGroupFollows(call, result);
        break;

      case "engine:removeGroupFollows":
        removeGroupFollows(call, result);
        break;

      case "engine:getGroupFollows":
        getGroupFollows(call, result);
        break;

      case "engine:setCheckChatRoomDuplicateMessage":
        setCheckChatRoomDuplicateMessage(call, result);
        break;

      case "engine:translateMessagesWithParams":
        translateMessagesWithParams(call, result);
        break;

      case "engine:translateTextsWithParams":
        translateTextsWithParams(call, result);
        break;

      case "engine:setTranslationLanguage":
        setTranslationLanguage(call, result);
        break;

      case "engine:getTranslationLanguage":
        getTranslationLanguage(call, result);
        break;

      case "engine:setAutoTranslateEnable":
        setAutoTranslateEnable(call, result);
        break;

      case "engine:getAutoTranslateEnabled":
        getAutoTranslateEnabled(call, result);
        break;

      case "engine:batchSetConversationTranslateStrategy":
        batchSetConversationTranslateStrategy(call, result);
        break;

      case "engine:calculateTextMD5":
        calculateTextMD5(call, result);
        break;

      case "engine:updateMyUserProfileVisibility":
        updateMyUserProfileVisibility(call, result);
        break;

      case "engine:getMyUserProfileVisibility":
        getMyUserProfileVisibility(call, result);
        break;

      case "engine:updateMyUserProfile":
        updateMyUserProfile(call, result);
        break;

      case "engine:getMyUserProfile":
        getMyUserProfile(call, result);
        break;

      case "engine:getUserProfiles":
        getUserProfiles(call, result);
        break;

      case "engine:searchUserProfileByUniqueId":
        searchUserProfileByUniqueId(call, result);
        break;

      case "engine:subscribeEvent":
        subscribeEvent(call, result);
        break;

      case "engine:unSubscribeEvent":
        unSubscribeEvent(call, result);
        break;

      case "engine:querySubscribeEvent":
        querySubscribeEvent(call, result);
        break;

      case "engine:querySubscribeEventByPage":
        querySubscribeEventByPage(call, result);
        break;

      case "engine:requestSpeechToTextForMessage":
        requestSpeechToTextForMessage(call, result);
        break;

      case "engine:setMessageSpeechToTextVisible":
        setMessageSpeechToTextVisible(call, result);
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

  private void registerNativeCustomMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageIdentifier = (String) call.argument("messageIdentifier");
      RCIMIWNativeCustomMessagePersistentFlag persistentFlag =
          RCIMWrapperArgumentAdapter.toRCIMIWNativeCustomMessagePersistentFlag(
              call.argument("persistentFlag"));

      code = engine.registerNativeCustomMessage(messageIdentifier, persistentFlag);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void registerNativeCustomMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageIdentifier = (String) call.argument("messageIdentifier");
      RCIMIWNativeCustomMessagePersistentFlag persistentFlag =
          RCIMWrapperArgumentAdapter.toRCIMIWNativeCustomMessagePersistentFlag(
              call.argument("persistentFlag"));

      code = engine.registerNativeCustomMediaMessage(messageIdentifier, persistentFlag);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
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

  private void getConnectionStatus(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWConnectionStatus res = null;
    if (engine != null) {

      res = engine.getConnectionStatus();
    }
    RCIMWrapperMainThreadPoster.success(result, res.ordinal());
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

  private void createNativeCustomMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWNativeCustomMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String messageIdentifier = (String) call.argument("messageIdentifier");
      Map<String, Object> fields = (Map<String, Object>) call.argument("fields");

      res = engine.createNativeCustomMessage(type, targetId, channelId, messageIdentifier, fields);
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertMessage(res));
  }

  private void createNativeCustomMediaMessage(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWNativeCustomMediaMessage res = null;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      String messageIdentifier = (String) call.argument("messageIdentifier");
      String path = (String) call.argument("path");
      Map<String, Object> fields = (Map<String, Object>) call.argument("fields");

      res =
          engine.createNativeCustomMediaMessage(
              type, targetId, channelId, messageIdentifier, path, fields);
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

  private void getConversationsWithPriority(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      String channelId = (String) call.argument("channelId");
      long startTime = ((Number) call.argument("startTime")).longValue();
      int count = ((Number) call.argument("count")).intValue();
      Boolean topPriority = (Boolean) call.argument("topPriority");
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

      code =
          engine.getConversationsWithPriority(
              conversationTypes_str, channelId, startTime, count, topPriority, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getUnreadConversations(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUnreadConversationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUnreadConversationsCallbackImpl(cb_handler);
      }

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code = engine.getUnreadConversations(conversationTypes_str, callback);
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

  private void getUnreadCountByLevels(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> conversationTypes = call.argument("conversationTypes");
      List<Number> levels = call.argument("levels");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUnreadCountByLevelsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUnreadCountByLevelsCallbackImpl(cb_handler);
      }

      List conversationTypes_str = new ArrayList();
      for (Number element : conversationTypes) {
        conversationTypes_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      List levels_str = new ArrayList();
      for (Number element : levels) {
        levels_str.add(RCIMWrapperArgumentAdapter.toRCIMIWPushNotificationLevel((Integer) element));
      }

      code = engine.getUnreadCountByLevels(conversationTypes_str, levels_str, callback);
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

  private void changeConversationTopStatusWithUpdateTme(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      Boolean top = (Boolean) call.argument("top");
      Boolean updateOperationTime = (Boolean) call.argument("updateOperationTime");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeConversationTopStatusCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeConversationTopStatusCallbackImpl(cb_handler);
      }

      code =
          engine.changeConversationTopStatusWithUpdateTme(
              type, targetId, channelId, top, updateOperationTime, callback);
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

  private void getMessagesAroundTime(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      long sentTime = ((Number) call.argument("sentTime")).longValue();
      int beforeCount = ((Number) call.argument("beforeCount")).intValue();
      int afterCount = ((Number) call.argument("afterCount")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMessagesAroundTimeCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMessagesAroundTimeCallbackImpl(cb_handler);
      }

      code =
          engine.getMessagesAroundTime(
              type, targetId, channelId, sentTime, beforeCount, afterCount, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getLocalMessagesByMessageTypes(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      List<Number> messageTypes = call.argument("messageTypes");
      long sentTime = ((Number) call.argument("sentTime")).longValue();
      RCIMIWTimeOrder order = RCIMWrapperArgumentAdapter.toRCIMIWTimeOrder(call.argument("order"));
      int count = ((Number) call.argument("count")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMessagesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMessagesCallbackImpl(cb_handler);
      }

      List messageTypes_str = new ArrayList();
      for (Number element : messageTypes) {
        messageTypes_str.add(RCIMWrapperArgumentAdapter.toRCIMIWMessageType((Integer) element));
      }

      code =
          engine.getLocalMessagesByMessageTypes(
              type, targetId, channelId, messageTypes_str, sentTime, order, count, callback);
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

  private void deleteLocalMessageByIds(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Integer> messageIds = call.argument("messageIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWDeleteLocalMessageByIdsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWDeleteLocalMessageByIdsCallbackImpl(cb_handler);
      }

      code = engine.deleteLocalMessageByIds(messageIds, callback);
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

  private void changeMessageReceiveStatusInfo(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      RCIMIWReceivedStatusInfo receivedStatusInfo =
          RCIMIWPlatformConverter.convertReceivedStatusInfo(
              (HashMap<String, Object>) call.argument("receivedStatusInfo"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeMessageReceivedStatusInfoCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeMessageReceivedStatusInfoCallbackImpl(cb_handler);
      }

      code = engine.changeMessageReceiveStatusInfo(messageId, receivedStatusInfo, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateMessageLocalExtra(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      String extra = (String) call.argument("extra");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWUpdateMessageLocalExtraCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWUpdateMessageLocalExtraCallbackImpl(cb_handler);
      }

      code = engine.updateMessageLocalExtra(messageId, extra, callback);
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

  private void searchMessagesByMessageTypes(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      String channelId = (String) call.argument("channelId");
      List<Number> messageTypes = call.argument("messageTypes");
      String keyword = (String) call.argument("keyword");
      long startTime = ((Number) call.argument("startTime")).longValue();
      int count = ((Number) call.argument("count")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchMessagesByMessageTypesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchMessagesByMessageTypesCallbackImpl(cb_handler);
      }

      List messageTypes_str = new ArrayList();
      for (Number element : messageTypes) {
        messageTypes_str.add(RCIMWrapperArgumentAdapter.toRCIMIWMessageType((Integer) element));
      }

      code =
          engine.searchMessagesByMessageTypes(
              type, targetId, channelId, messageTypes_str, keyword, startTime, count, callback);
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
    long code = 0L;
    if (engine != null) {

      code = engine.getDeltaTime();
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getAppSettings(@NonNull MethodCall call, @NonNull Result result) {
    RCIMIWAppSettings res = null;
    if (engine != null) {

      res = engine.getAppSettings();
    }
    RCIMWrapperMainThreadPoster.success(result, RCIMIWPlatformConverter.convertAppSettings(res));
  }

  private void createTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      String tagName = (String) call.argument("tagName");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWCreateTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWCreateTagCallbackImpl(cb_handler);
      }

      code = engine.createTag(tagId, tagName, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveTagCallbackImpl(cb_handler);
      }

      code = engine.removeTag(tagId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateTagNameById(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      String newName = (String) call.argument("newName");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWUpdateTagNameByIdCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWUpdateTagNameByIdCallbackImpl(cb_handler);
      }

      code = engine.updateTagNameById(tagId, newName, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getTags(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetTagsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetTagsCallbackImpl(cb_handler);
      }

      code = engine.getTags(callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void addConversationToTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAddConversationToTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAddConversationToTagCallbackImpl(cb_handler);
      }

      code = engine.addConversationToTag(tagId, type, targetId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeConversationFromTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveConversationFromTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveConversationFromTagCallbackImpl(cb_handler);
      }

      code = engine.removeConversationFromTag(tagId, type, targetId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeTagsFromConversation(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      List<String> tagIds = call.argument("tagIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveTagsFromConversationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveTagsFromConversationCallbackImpl(cb_handler);
      }

      code = engine.removeTagsFromConversation(type, targetId, tagIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getTagsFromConversation(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetTagsFromConversationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetTagsFromConversationCallbackImpl(cb_handler);
      }

      code = engine.getTagsFromConversation(type, targetId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getConversationsFromTagByPage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      long timestamp = ((Number) call.argument("timestamp")).longValue();
      int count = ((Number) call.argument("count")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationsCallbackImpl(cb_handler);
      }

      code = engine.getConversationsFromTagByPage(tagId, timestamp, count, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getUnreadCountByTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      Boolean contain = (Boolean) call.argument("contain");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUnreadCountCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUnreadCountCallbackImpl(cb_handler);
      }

      code = engine.getUnreadCountByTag(tagId, contain, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void changeConversationTopStatusInTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      Boolean top = (Boolean) call.argument("top");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWChangeConversationTopStatusInTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWChangeConversationTopStatusInTagCallbackImpl(cb_handler);
      }

      code = engine.changeConversationTopStatusInTag(tagId, type, targetId, top, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getConversationTopStatusInTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      RCIMIWConversationType type =
          RCIMWrapperArgumentAdapter.toRCIMIWConversationType(call.argument("type"));
      String targetId = (String) call.argument("targetId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetConversationTopStatusInTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetConversationTopStatusInTagCallbackImpl(cb_handler);
      }

      code = engine.getConversationTopStatusInTag(tagId, type, targetId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearMessagesUnreadStatusByTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWClearMessagesUnreadStatusByTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWClearMessagesUnreadStatusByTagCallbackImpl(cb_handler);
      }

      code = engine.clearMessagesUnreadStatusByTag(tagId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void clearConversationsByTag(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String tagId = (String) call.argument("tagId");
      Boolean deleteMessage = (Boolean) call.argument("deleteMessage");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWClearConversationsByTagCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWClearConversationsByTagCallbackImpl(cb_handler);
      }

      code = engine.clearConversationsByTag(tagId, deleteMessage, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void setModuleName(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String moduleName = (String) call.argument("moduleName");
      String version = (String) call.argument("version");

      code = engine.setModuleName(moduleName, version);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void writeLog(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String method = (String) call.argument("method");
      String callMethod = (String) call.argument("callMethod");
      int codeValue = ((Number) call.argument("codeValue")).intValue();
      String message = (String) call.argument("message");

      code = engine.writeLog(method, callMethod, codeValue, message);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void createGroup(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWGroupInfo groupInfo =
          RCIMIWPlatformConverter.convertGroupInfo(
              (HashMap<String, Object>) call.argument("groupInfo"));
      List<String> inviteeUserIds = call.argument("inviteeUserIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWCreateGroupCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWCreateGroupCallbackImpl(cb_handler);
      }

      code = engine.createGroup(groupInfo, inviteeUserIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateGroupInfo(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWGroupInfo groupInfo =
          RCIMIWPlatformConverter.convertGroupInfo(
              (HashMap<String, Object>) call.argument("groupInfo"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGroupInfoUpdatedCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGroupInfoUpdatedCallbackImpl(cb_handler);
      }

      code = engine.updateGroupInfo(groupInfo, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getGroupsInfo(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<String> groupIds = call.argument("groupIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetGroupsInfoCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetGroupsInfoCallbackImpl(cb_handler);
      }

      code = engine.getGroupsInfo(groupIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void kickGroupMembers(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      List<String> userIds = call.argument("userIds");
      RCIMIWQuitGroupConfig config =
          RCIMIWPlatformConverter.convertQuitGroupConfig(
              (HashMap<String, Object>) call.argument("config"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWKickGroupMembersCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWKickGroupMembersCallbackImpl(cb_handler);
      }

      code = engine.kickGroupMembers(groupId, userIds, config, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void joinGroup(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWJoinGroupCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWJoinGroupCallbackImpl(cb_handler);
      }

      code = engine.joinGroup(groupId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void quitGroup(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      RCIMIWQuitGroupConfig config =
          RCIMIWPlatformConverter.convertQuitGroupConfig(
              (HashMap<String, Object>) call.argument("config"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWQuitGroupCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWQuitGroupCallbackImpl(cb_handler);
      }

      code = engine.quitGroup(groupId, config, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void dismissGroup(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWDismissGroupCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWDismissGroupCallbackImpl(cb_handler);
      }

      code = engine.dismissGroup(groupId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void transferGroupOwner(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String newOwnerId = (String) call.argument("newOwnerId");
      Boolean quitGroup = (Boolean) call.argument("quitGroup");
      RCIMIWQuitGroupConfig config =
          RCIMIWPlatformConverter.convertQuitGroupConfig(
              (HashMap<String, Object>) call.argument("config"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWTransferGroupOwnerCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWTransferGroupOwnerCallbackImpl(cb_handler);
      }

      code = engine.transferGroupOwner(groupId, newOwnerId, quitGroup, config, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getGroupMembers(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      List<String> userIds = call.argument("userIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetGroupMembersCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetGroupMembersCallbackImpl(cb_handler);
      }

      code = engine.getGroupMembers(groupId, userIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getGroupMembersByRole(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      RCIMIWGroupMemberRole role =
          RCIMWrapperArgumentAdapter.toRCIMIWGroupMemberRole(call.argument("role"));
      RCIMIWPagingQueryOption option =
          RCIMIWPlatformConverter.convertPagingQueryOption(
              (HashMap<String, Object>) call.argument("option"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetGroupMembersByRoleCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetGroupMembersByRoleCallbackImpl(cb_handler);
      }

      code = engine.getGroupMembersByRole(groupId, role, option, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getJoinedGroupsByRole(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWGroupMemberRole role =
          RCIMWrapperArgumentAdapter.toRCIMIWGroupMemberRole(call.argument("role"));
      RCIMIWPagingQueryOption option =
          RCIMIWPlatformConverter.convertPagingQueryOption(
              (HashMap<String, Object>) call.argument("option"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetJoinedGroupsByRoleCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetJoinedGroupsByRoleCallbackImpl(cb_handler);
      }

      code = engine.getJoinedGroupsByRole(role, option, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getJoinedGroups(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<String> groupIds = call.argument("groupIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetJoinedGroupsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetJoinedGroupsCallbackImpl(cb_handler);
      }

      code = engine.getJoinedGroups(groupIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void setGroupRemark(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String remark = (String) call.argument("remark");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSetGroupRemarkCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSetGroupRemarkCallbackImpl(cb_handler);
      }

      code = engine.setGroupRemark(groupId, remark, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void setGroupMemberInfo(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String userId = (String) call.argument("userId");
      String nickname = (String) call.argument("nickname");
      String extra = (String) call.argument("extra");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSetGroupMemberInfoCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSetGroupMemberInfoCallbackImpl(cb_handler);
      }

      code = engine.setGroupMemberInfo(groupId, userId, nickname, extra, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void searchJoinedGroups(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupName = (String) call.argument("groupName");
      RCIMIWPagingQueryOption option =
          RCIMIWPlatformConverter.convertPagingQueryOption(
              (HashMap<String, Object>) call.argument("option"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchJoinedGroupsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchJoinedGroupsCallbackImpl(cb_handler);
      }

      code = engine.searchJoinedGroups(groupName, option, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void searchGroupMembers(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String name = (String) call.argument("name");
      RCIMIWPagingQueryOption option =
          RCIMIWPlatformConverter.convertPagingQueryOption(
              (HashMap<String, Object>) call.argument("option"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchGroupMembersCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchGroupMembersCallbackImpl(cb_handler);
      }

      code = engine.searchGroupMembers(groupId, name, option, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void addGroupManagers(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      List<String> userIds = call.argument("userIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAddGroupManagersCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAddGroupManagersCallbackImpl(cb_handler);
      }

      code = engine.addGroupManagers(groupId, userIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeGroupManagers(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      List<String> userIds = call.argument("userIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveGroupManagersCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveGroupManagersCallbackImpl(cb_handler);
      }

      code = engine.removeGroupManagers(groupId, userIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void inviteUsersToGroup(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      List<String> userIds = call.argument("userIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWInviteUsersToGroupCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWInviteUsersToGroupCallbackImpl(cb_handler);
      }

      code = engine.inviteUsersToGroup(groupId, userIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void acceptGroupInvite(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String inviterId = (String) call.argument("inviterId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAcceptGroupInviteCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAcceptGroupInviteCallbackImpl(cb_handler);
      }

      code = engine.acceptGroupInvite(groupId, inviterId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void refuseGroupInvite(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String inviterId = (String) call.argument("inviterId");
      String reason = (String) call.argument("reason");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRefuseGroupInviteCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRefuseGroupInviteCallbackImpl(cb_handler);
      }

      code = engine.refuseGroupInvite(groupId, inviterId, reason, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void acceptGroupApplication(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String inviterId = (String) call.argument("inviterId");
      String applicantId = (String) call.argument("applicantId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAcceptGroupApplicationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAcceptGroupApplicationCallbackImpl(cb_handler);
      }

      code = engine.acceptGroupApplication(groupId, inviterId, applicantId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void refuseGroupApplication(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      String inviterId = (String) call.argument("inviterId");
      String applicantId = (String) call.argument("applicantId");
      String reason = (String) call.argument("reason");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRefuseGroupApplicationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRefuseGroupApplicationCallbackImpl(cb_handler);
      }

      code = engine.refuseGroupApplication(groupId, inviterId, applicantId, reason, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getGroupApplications(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWPagingQueryOption option =
          RCIMIWPlatformConverter.convertPagingQueryOption(
              (HashMap<String, Object>) call.argument("option"));
      List<Number> directions = call.argument("directions");
      List<Number> status = call.argument("status");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetGroupApplicationsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetGroupApplicationsCallbackImpl(cb_handler);
      }

      List directions_str = new ArrayList();
      for (Number element : directions) {
        directions_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWGroupApplicationDirection((Integer) element));
      }

      List status_str = new ArrayList();
      for (Number element : status) {
        status_str.add(
            RCIMWrapperArgumentAdapter.toRCIMIWGroupApplicationStatus((Integer) element));
      }

      code = engine.getGroupApplications(option, directions_str, status_str, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void addGroupFollows(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      List<String> userIds = call.argument("userIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWAddGroupFollowsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWAddGroupFollowsCallbackImpl(cb_handler);
      }

      code = engine.addGroupFollows(groupId, userIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void removeGroupFollows(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      List<String> userIds = call.argument("userIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWRemoveGroupFollowsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWRemoveGroupFollowsCallbackImpl(cb_handler);
      }

      code = engine.removeGroupFollows(groupId, userIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getGroupFollows(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String groupId = (String) call.argument("groupId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetGroupFollowsCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetGroupFollowsCallbackImpl(cb_handler);
      }

      code = engine.getGroupFollows(groupId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void setCheckChatRoomDuplicateMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      Boolean enableCheck = (Boolean) call.argument("enableCheck");

      code = engine.setCheckChatRoomDuplicateMessage(enableCheck);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void translateMessagesWithParams(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWTranslateMessagesParams params =
          RCIMIWPlatformConverter.convertTranslateMessagesParams(
              (HashMap<String, Object>) call.argument("params"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWTranslateResponseCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWTranslateResponseCallbackImpl(cb_handler);
      }

      code = engine.translateMessagesWithParams(params, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void translateTextsWithParams(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWTranslateTextParams params =
          RCIMIWPlatformConverter.convertTranslateTextParams(
              (HashMap<String, Object>) call.argument("params"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWTranslateResponseCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWTranslateResponseCallbackImpl(cb_handler);
      }

      code = engine.translateTextsWithParams(params, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void setTranslationLanguage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String language = (String) call.argument("language");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWTranslateResponseCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWTranslateResponseCallbackImpl(cb_handler);
      }

      code = engine.setTranslationLanguage(language, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getTranslationLanguage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWTranslateGetLanguageCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWTranslateGetLanguageCallbackImpl(cb_handler);
      }

      code = engine.getTranslationLanguage(callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void setAutoTranslateEnable(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      Boolean isEnable = (Boolean) call.argument("isEnable");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWTranslateResponseCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWTranslateResponseCallbackImpl(cb_handler);
      }

      code = engine.setAutoTranslateEnable(isEnable, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getAutoTranslateEnabled(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetAutoTranslateEnabledCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetAutoTranslateEnabledCallbackImpl(cb_handler);
      }

      code = engine.getAutoTranslateEnabled(callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void batchSetConversationTranslateStrategy(
      @NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<Number> types = call.argument("types");
      List<String> targetIds = call.argument("targetIds");
      List<String> channelIds = call.argument("channelIds");
      RCIMIWTranslateStrategy strategy =
          RCIMWrapperArgumentAdapter.toRCIMIWTranslateStrategy(call.argument("strategy"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWTranslateResponseCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWTranslateResponseCallbackImpl(cb_handler);
      }

      List types_str = new ArrayList();
      for (Number element : types) {
        types_str.add(RCIMWrapperArgumentAdapter.toRCIMIWConversationType((Integer) element));
      }

      code =
          engine.batchSetConversationTranslateStrategy(
              types_str, targetIds, channelIds, strategy, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void calculateTextMD5(@NonNull MethodCall call, @NonNull Result result) {
    String code = "";
    if (engine != null) {
      String text = (String) call.argument("text");

      code = engine.calculateTextMD5(text);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateMyUserProfileVisibility(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWUserProfileVisibility visibility =
          RCIMWrapperArgumentAdapter.toRCIMIWUserProfileVisibility(call.argument("visibility"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWUpdateMyUserProfileVisibilityCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWUpdateMyUserProfileVisibilityCallbackImpl(cb_handler);
      }

      code = engine.updateMyUserProfileVisibility(visibility, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getMyUserProfileVisibility(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMyUserProfileVisibilityCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMyUserProfileVisibilityCallbackImpl(cb_handler);
      }

      code = engine.getMyUserProfileVisibility(callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void updateMyUserProfile(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWUserProfile profile =
          RCIMIWPlatformConverter.convertUserProfile(
              (HashMap<String, Object>) call.argument("profile"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWUpdateMyUserProfileCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWUpdateMyUserProfileCallbackImpl(cb_handler);
      }

      code = engine.updateMyUserProfile(profile, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getMyUserProfile(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetMyUserProfileCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetMyUserProfileCallbackImpl(cb_handler);
      }

      code = engine.getMyUserProfile(callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void getUserProfiles(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      List<String> userIds = call.argument("userIds");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWGetUserProfilesCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWGetUserProfilesCallbackImpl(cb_handler);
      }

      code = engine.getUserProfiles(userIds, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void searchUserProfileByUniqueId(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String uniqueId = (String) call.argument("uniqueId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSearchUserProfileByUniqueIdCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSearchUserProfileByUniqueIdCallbackImpl(cb_handler);
      }

      code = engine.searchUserProfileByUniqueId(uniqueId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void subscribeEvent(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWSubscribeEventRequest request =
          RCIMIWPlatformConverter.convertSubscribeEventRequest(
              (HashMap<String, Object>) call.argument("request"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSubscribeEventCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSubscribeEventCallbackImpl(cb_handler);
      }

      code = engine.subscribeEvent(request, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void unSubscribeEvent(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWSubscribeEventRequest request =
          RCIMIWPlatformConverter.convertSubscribeEventRequest(
              (HashMap<String, Object>) call.argument("request"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWSubscribeEventCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWSubscribeEventCallbackImpl(cb_handler);
      }

      code = engine.unSubscribeEvent(request, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void querySubscribeEvent(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWSubscribeEventRequest request =
          RCIMIWPlatformConverter.convertSubscribeEventRequest(
              (HashMap<String, Object>) call.argument("request"));
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWQuerySubscribeEventCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWQuerySubscribeEventCallbackImpl(cb_handler);
      }

      code = engine.querySubscribeEvent(request, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void querySubscribeEventByPage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      RCIMIWSubscribeEventRequest request =
          RCIMIWPlatformConverter.convertSubscribeEventRequest(
              (HashMap<String, Object>) call.argument("request"));
      int pageSize = ((Number) call.argument("pageSize")).intValue();
      int startIndex = ((Number) call.argument("startIndex")).intValue();
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWQuerySubscribeEventCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWQuerySubscribeEventCallbackImpl(cb_handler);
      }

      code = engine.querySubscribeEventByPage(request, pageSize, startIndex, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void requestSpeechToTextForMessage(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      String messageUId = (String) call.argument("messageUId");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWOperationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWOperationCallbackImpl(cb_handler);
      }

      code = engine.requestSpeechToTextForMessage(messageUId, callback);
    }
    RCIMWrapperMainThreadPoster.success(result, code);
  }

  private void setMessageSpeechToTextVisible(@NonNull MethodCall call, @NonNull Result result) {
    int code = -1;
    if (engine != null) {
      int messageId = ((Number) call.argument("messageId")).intValue();
      Boolean visible = (Boolean) call.argument("visible");
      int cb_handler = ((Number) call.argument("cb_handler")).intValue();
      IRCIMIWOperationCallbackImpl callback = null;
      if (cb_handler != -1) {
        callback = new IRCIMIWOperationCallbackImpl(cb_handler);
      }

      code = engine.setMessageSpeechToTextVisible(messageId, visible, callback);
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
    public void onOfflineMessageSyncCompleted() {
      final HashMap<String, Object> arguments = new HashMap<>();

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onOfflineMessageSyncCompleted", arguments);
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
    public void onConversationTranslationStrategySynced(
        RCIMIWConversationType type,
        String targetId,
        String channelId,
        RCIMIWTranslateStrategy strategy) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("type", type.ordinal());
      arguments.put("targetId", targetId);
      arguments.put("channelId", channelId);
      arguments.put("strategy", strategy.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onConversationTranslationStrategySynced", arguments);
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
    public void onSpeechToTextCompleted(RCIMIWSpeechToTextInfo info, String messageUId, int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("info", RCIMIWPlatformConverter.convertSpeechToTextInfo(info));
      arguments.put("messageUId", messageUId);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onSpeechToTextCompleted", arguments);
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

    @Override
    public void onGroupOperation(
        String groupId,
        RCIMIWGroupMemberInfo operatorInfo,
        RCIMIWGroupInfo groupInfo,
        RCIMIWGroupOperation operation,
        List<RCIMIWGroupMemberInfo> memberInfos,
        long operationTime) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List memberInfos_str = new ArrayList();

      if (memberInfos != null) {
        for (RCIMIWGroupMemberInfo element : memberInfos) {
          memberInfos_str.add(RCIMIWPlatformConverter.convertGroupMemberInfo(element));
        }
      }

      arguments.put("groupId", groupId);
      arguments.put("operatorInfo", RCIMIWPlatformConverter.convertGroupMemberInfo(operatorInfo));
      arguments.put("groupInfo", RCIMIWPlatformConverter.convertGroupInfo(groupInfo));
      arguments.put("operation", operation.ordinal());
      arguments.put("memberInfos", memberInfos_str);
      arguments.put("operationTime", operationTime);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupOperation", arguments);
            }
          });
    }

    @Override
    public void onGroupInfoChanged(
        RCIMIWGroupMemberInfo operatorInfo,
        RCIMIWGroupInfo fullGroupInfo,
        RCIMIWGroupInfo changedGroupInfo,
        long operationTime) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("operatorInfo", RCIMIWPlatformConverter.convertGroupMemberInfo(operatorInfo));
      arguments.put("fullGroupInfo", RCIMIWPlatformConverter.convertGroupInfo(fullGroupInfo));
      arguments.put("changedGroupInfo", RCIMIWPlatformConverter.convertGroupInfo(changedGroupInfo));
      arguments.put("operationTime", operationTime);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupInfoChanged", arguments);
            }
          });
    }

    @Override
    public void onGroupMemberInfoChanged(
        String groupId,
        RCIMIWGroupMemberInfo operatorInfo,
        RCIMIWGroupMemberInfo memberInfo,
        long operationTime) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("groupId", groupId);
      arguments.put("operatorInfo", RCIMIWPlatformConverter.convertGroupMemberInfo(operatorInfo));
      arguments.put("memberInfo", RCIMIWPlatformConverter.convertGroupMemberInfo(memberInfo));
      arguments.put("operationTime", operationTime);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupMemberInfoChanged", arguments);
            }
          });
    }

    @Override
    public void onGroupApplicationEvent(RCIMIWGroupApplicationInfo info) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("info", RCIMIWPlatformConverter.convertGroupApplicationInfo(info));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupApplicationEvent", arguments);
            }
          });
    }

    @Override
    public void onGroupRemarkChangedSync(
        String groupId,
        RCIMIWGroupOperationType operationType,
        String groupRemark,
        long operationTime) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("groupId", groupId);
      arguments.put("operationType", operationType.ordinal());
      arguments.put("groupRemark", groupRemark);
      arguments.put("operationTime", operationTime);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupRemarkChangedSync", arguments);
            }
          });
    }

    @Override
    public void onGroupFollowsChangedSync(
        String groupId,
        RCIMIWGroupOperationType operationType,
        List<String> userIds,
        long operationTime) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("groupId", groupId);
      arguments.put("operationType", operationType.ordinal());
      arguments.put("userIds", userIds);
      arguments.put("operationTime", operationTime);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onGroupFollowsChangedSync", arguments);
            }
          });
    }

    @Override
    public void onChatRoomNotifyMultiLoginSync(RCIMIWChatRoomSyncEvent event) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("event", RCIMIWPlatformConverter.convertChatRoomSyncEvent(event));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomNotifyMultiLoginSync", arguments);
            }
          });
    }

    @Override
    public void onChatRoomNotifyBlock(RCIMIWChatRoomMemberBlockEvent event) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("event", RCIMIWPlatformConverter.convertChatRoomMemberBlockEvent(event));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomNotifyBlock", arguments);
            }
          });
    }

    @Override
    public void onChatRoomNotifyBan(RCIMIWChatRoomMemberBanEvent event) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("event", RCIMIWPlatformConverter.convertChatRoomMemberBanEvent(event));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onChatRoomNotifyBan", arguments);
            }
          });
    }

    @Override
    public void onTranslationDidFinished(List<RCIMIWTranslateItem> items) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List items_str = new ArrayList();

      if (items != null) {
        for (RCIMIWTranslateItem element : items) {
          items_str.add(RCIMIWPlatformConverter.convertTranslateItem(element));
        }
      }

      arguments.put("items", items_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onTranslationDidFinished", arguments);
            }
          });
    }

    @Override
    public void onTranslationLanguageDidChange(String language) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("language", language);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onTranslationLanguageDidChange", arguments);
            }
          });
    }

    @Override
    public void onAutoTranslateStateDidChange(boolean isEnable) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("isEnable", isEnable);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onAutoTranslateStateDidChange", arguments);
            }
          });
    }

    @Override
    public void onEventChange(List<RCIMIWSubscribeInfoEvent> subscribeEvents) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List subscribeEvents_str = new ArrayList();

      if (subscribeEvents != null) {
        for (RCIMIWSubscribeInfoEvent element : subscribeEvents) {
          subscribeEvents_str.add(RCIMIWPlatformConverter.convertSubscribeInfoEvent(element));
        }
      }

      arguments.put("subscribeEvents", subscribeEvents_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onEventChange", arguments);
            }
          });
    }

    @Override
    public void onSubscriptionSyncCompleted(RCIMIWSubscribeType type) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("type", type.ordinal());

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onSubscriptionSyncCompleted", arguments);
            }
          });
    }

    @Override
    public void onSubscriptionChangedOnOtherDevices(List<RCIMIWSubscribeEvent> subscribeEvents) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List subscribeEvents_str = new ArrayList();

      if (subscribeEvents != null) {
        for (RCIMIWSubscribeEvent element : subscribeEvents) {
          subscribeEvents_str.add(RCIMIWPlatformConverter.convertSubscribeEvent(element));
        }
      }

      arguments.put("subscribeEvents", subscribeEvents_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine:onSubscriptionChangedOnOtherDevices", arguments);
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

  class IRCIMIWGetUnreadConversationsCallbackImpl implements IRCIMIWGetUnreadConversationsCallback {
    private int cb_handler = -1;

    IRCIMIWGetUnreadConversationsCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWGetUnreadConversationsCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetUnreadConversationsCallback_onError", arguments);
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

  class IRCIMIWGetUnreadCountByLevelsCallbackImpl implements IRCIMIWGetUnreadCountByLevelsCallback {
    private int cb_handler = -1;

    IRCIMIWGetUnreadCountByLevelsCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onError", arguments);
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

  class IRCIMIWGetMessagesAroundTimeCallbackImpl implements IRCIMIWGetMessagesAroundTimeCallback {
    private int cb_handler = -1;

    IRCIMIWGetMessagesAroundTimeCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onError", arguments);
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

  class IRCIMIWDeleteLocalMessageByIdsCallbackImpl
      implements IRCIMIWDeleteLocalMessageByIdsCallback {
    private int cb_handler = -1;

    IRCIMIWDeleteLocalMessageByIdsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWDeleteLocalMessageByIdsCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWCompletionCallbackImpl implements IRCIMIWCompletionCallback {
    private int cb_handler = -1;

    IRCIMIWCompletionCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWCompletionCallback_onCompleted", arguments);
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

  class IRCIMIWChangeMessageReceivedStatusInfoCallbackImpl
      implements IRCIMIWChangeMessageReceivedStatusInfoCallback {
    private int cb_handler = -1;

    IRCIMIWChangeMessageReceivedStatusInfoCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageReceiveStatusInfoChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeMessageReceivedStatusInfoCallback_onMessageReceiveStatusInfoChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWUpdateMessageLocalExtraCallbackImpl
      implements IRCIMIWUpdateMessageLocalExtraCallback {
    private int cb_handler = -1;

    IRCIMIWUpdateMessageLocalExtraCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onMessageLocalExtraUpdated(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateMessageLocalExtraCallback_onMessageLocalExtraUpdated",
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

  class IRCIMIWSearchMessagesByMessageTypesCallbackImpl
      implements IRCIMIWSearchMessagesByMessageTypesCallback {
    private int cb_handler = -1;

    IRCIMIWSearchMessagesByMessageTypesCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onError", arguments);
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

  class IRCIMIWCreateTagCallbackImpl implements IRCIMIWCreateTagCallback {
    private int cb_handler = -1;

    IRCIMIWCreateTagCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onTagCreated(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWCreateTagCallback_onTagCreated", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveTagCallbackImpl implements IRCIMIWRemoveTagCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveTagCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onTagRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWRemoveTagCallback_onTagRemoved", arguments);
            }
          });
    }
  }

  class IRCIMIWUpdateTagNameByIdCallbackImpl implements IRCIMIWUpdateTagNameByIdCallback {
    private int cb_handler = -1;

    IRCIMIWUpdateTagNameByIdCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onTagNameByIdUpdated(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateTagNameByIdCallback_onTagNameByIdUpdated", arguments);
            }
          });
    }
  }

  class IRCIMIWGetTagsCallbackImpl implements IRCIMIWGetTagsCallback {
    private int cb_handler = -1;

    IRCIMIWGetTagsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWTagInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWTagInfo element : t) {
          t_str.add(RCIMIWPlatformConverter.convertTagInfo(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetTagsCallback_onSuccess", arguments);
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
              channel.invokeMethod("engine_cb:IRCIMIWGetTagsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWAddConversationToTagCallbackImpl implements IRCIMIWAddConversationToTagCallback {
    private int cb_handler = -1;

    IRCIMIWAddConversationToTagCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationToTagAdded(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWAddConversationToTagCallback_onConversationToTagAdded",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveConversationFromTagCallbackImpl
      implements IRCIMIWRemoveConversationFromTagCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveConversationFromTagCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationFromTagRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveConversationFromTagCallback_onConversationFromTagRemoved",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveTagsFromConversationCallbackImpl
      implements IRCIMIWRemoveTagsFromConversationCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveTagsFromConversationCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onTagsFromConversationRemoved(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveTagsFromConversationCallback_onTagsFromConversationRemoved",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetTagsFromConversationCallbackImpl
      implements IRCIMIWGetTagsFromConversationCallback {
    private int cb_handler = -1;

    IRCIMIWGetTagsFromConversationCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWConversationTagInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWConversationTagInfo element : t) {
          t_str.add(RCIMIWPlatformConverter.convertConversationTagInfo(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetTagsFromConversationCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetTagsFromConversationCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWChangeConversationTopStatusInTagCallbackImpl
      implements IRCIMIWChangeConversationTopStatusInTagCallback {
    private int cb_handler = -1;

    IRCIMIWChangeConversationTopStatusInTagCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onConversationTopStatusInTagChanged(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWChangeConversationTopStatusInTagCallback_onConversationTopStatusInTagChanged",
                  arguments);
            }
          });
    }
  }

  class IRCIMIWGetConversationTopStatusInTagCallbackImpl
      implements IRCIMIWGetConversationTopStatusInTagCallback {
    private int cb_handler = -1;

    IRCIMIWGetConversationTopStatusInTagCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWClearMessagesUnreadStatusByTagCallbackImpl
      implements IRCIMIWClearMessagesUnreadStatusByTagCallback {
    private int cb_handler = -1;

    IRCIMIWClearMessagesUnreadStatusByTagCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWClearConversationsByTagCallbackImpl
      implements IRCIMIWClearConversationsByTagCallback {
    private int cb_handler = -1;

    IRCIMIWClearConversationsByTagCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWClearConversationsByTagCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWClearConversationsByTagCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWCreateGroupCallbackImpl implements IRCIMIWCreateGroupCallback {
    private int cb_handler = -1;

    IRCIMIWCreateGroupCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(int processCode) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("processCode", processCode);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWCreateGroupCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int errorCode, String errorInfo) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("errorCode", errorCode);
      arguments.put("errorInfo", errorInfo);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWCreateGroupCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGroupInfoUpdatedCallbackImpl implements IRCIMIWGroupInfoUpdatedCallback {
    private int cb_handler = -1;

    IRCIMIWGroupInfoUpdatedCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onGroupInfoUpdated(int code, String errorInfo) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("errorInfo", errorInfo);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGroupInfoUpdatedCallback_onGroupInfoUpdated", arguments);
            }
          });
    }
  }

  class IRCIMIWGetGroupsInfoCallbackImpl implements IRCIMIWGetGroupsInfoCallback {
    private int cb_handler = -1;

    IRCIMIWGetGroupsInfoCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWGroupInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWGroupInfo element : t) {
          t_str.add(RCIMIWPlatformConverter.convertGroupInfo(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetGroupsInfoCallback_onSuccess", arguments);
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
              channel.invokeMethod("engine_cb:IRCIMIWGetGroupsInfoCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWKickGroupMembersCallbackImpl implements IRCIMIWKickGroupMembersCallback {
    private int cb_handler = -1;

    IRCIMIWKickGroupMembersCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWKickGroupMembersCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWJoinGroupCallbackImpl implements IRCIMIWJoinGroupCallback {
    private int cb_handler = -1;

    IRCIMIWJoinGroupCallbackImpl(int cb_handler) {
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
              channel.invokeMethod("engine_cb:IRCIMIWJoinGroupCallback_onSuccess", arguments);
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
              channel.invokeMethod("engine_cb:IRCIMIWJoinGroupCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWQuitGroupCallbackImpl implements IRCIMIWQuitGroupCallback {
    private int cb_handler = -1;

    IRCIMIWQuitGroupCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWQuitGroupCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWDismissGroupCallbackImpl implements IRCIMIWDismissGroupCallback {
    private int cb_handler = -1;

    IRCIMIWDismissGroupCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWDismissGroupCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWTransferGroupOwnerCallbackImpl implements IRCIMIWTransferGroupOwnerCallback {
    private int cb_handler = -1;

    IRCIMIWTransferGroupOwnerCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWTransferGroupOwnerCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWGetGroupMembersCallbackImpl implements IRCIMIWGetGroupMembersCallback {
    private int cb_handler = -1;

    IRCIMIWGetGroupMembersCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWGroupMemberInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWGroupMemberInfo element : t) {
          t_str.add(RCIMIWPlatformConverter.convertGroupMemberInfo(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetGroupMembersCallback_onSuccess", arguments);
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
              channel.invokeMethod("engine_cb:IRCIMIWGetGroupMembersCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetGroupMembersByRoleCallbackImpl implements IRCIMIWGetGroupMembersByRoleCallback {
    private int cb_handler = -1;

    IRCIMIWGetGroupMembersByRoleCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertPagingQueryResult(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetJoinedGroupsByRoleCallbackImpl implements IRCIMIWGetJoinedGroupsByRoleCallback {
    private int cb_handler = -1;

    IRCIMIWGetJoinedGroupsByRoleCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPagingQueryResult<RCIMIWGroupInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertPagingQueryResult(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetJoinedGroupsCallbackImpl implements IRCIMIWGetJoinedGroupsCallback {
    private int cb_handler = -1;

    IRCIMIWGetJoinedGroupsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWGroupInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWGroupInfo element : t) {
          t_str.add(RCIMIWPlatformConverter.convertGroupInfo(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetJoinedGroupsCallback_onSuccess", arguments);
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
              channel.invokeMethod("engine_cb:IRCIMIWGetJoinedGroupsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSetGroupRemarkCallbackImpl implements IRCIMIWSetGroupRemarkCallback {
    private int cb_handler = -1;

    IRCIMIWSetGroupRemarkCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSetGroupRemarkCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWSetGroupMemberInfoCallbackImpl implements IRCIMIWSetGroupMemberInfoCallback {
    private int cb_handler = -1;

    IRCIMIWSetGroupMemberInfoCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSetGroupMemberInfoCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWSearchJoinedGroupsCallbackImpl implements IRCIMIWSearchJoinedGroupsCallback {
    private int cb_handler = -1;

    IRCIMIWSearchJoinedGroupsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPagingQueryResult<RCIMIWGroupInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertPagingQueryResult(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchJoinedGroupsCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWSearchJoinedGroupsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSearchGroupMembersCallbackImpl implements IRCIMIWSearchGroupMembersCallback {
    private int cb_handler = -1;

    IRCIMIWSearchGroupMembersCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertPagingQueryResult(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchGroupMembersCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWSearchGroupMembersCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWAddGroupManagersCallbackImpl implements IRCIMIWAddGroupManagersCallback {
    private int cb_handler = -1;

    IRCIMIWAddGroupManagersCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWAddGroupManagersCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveGroupManagersCallbackImpl implements IRCIMIWRemoveGroupManagersCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveGroupManagersCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveGroupManagersCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWInviteUsersToGroupCallbackImpl implements IRCIMIWInviteUsersToGroupCallback {
    private int cb_handler = -1;

    IRCIMIWInviteUsersToGroupCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWInviteUsersToGroupCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWInviteUsersToGroupCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWAcceptGroupInviteCallbackImpl implements IRCIMIWAcceptGroupInviteCallback {
    private int cb_handler = -1;

    IRCIMIWAcceptGroupInviteCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWAcceptGroupInviteCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWRefuseGroupInviteCallbackImpl implements IRCIMIWRefuseGroupInviteCallback {
    private int cb_handler = -1;

    IRCIMIWRefuseGroupInviteCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRefuseGroupInviteCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWAcceptGroupApplicationCallbackImpl implements IRCIMIWAcceptGroupApplicationCallback {
    private int cb_handler = -1;

    IRCIMIWAcceptGroupApplicationCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWAcceptGroupApplicationCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWAcceptGroupApplicationCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWRefuseGroupApplicationCallbackImpl implements IRCIMIWRefuseGroupApplicationCallback {
    private int cb_handler = -1;

    IRCIMIWRefuseGroupApplicationCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRefuseGroupApplicationCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWGetGroupApplicationsCallbackImpl implements IRCIMIWGetGroupApplicationsCallback {
    private int cb_handler = -1;

    IRCIMIWGetGroupApplicationsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", RCIMIWPlatformConverter.convertPagingQueryResult(t));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetGroupApplicationsCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetGroupApplicationsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWAddGroupFollowsCallbackImpl implements IRCIMIWAddGroupFollowsCallback {
    private int cb_handler = -1;

    IRCIMIWAddGroupFollowsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWAddGroupFollowsCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWRemoveGroupFollowsCallbackImpl implements IRCIMIWRemoveGroupFollowsCallback {
    private int cb_handler = -1;

    IRCIMIWRemoveGroupFollowsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onCompleted(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWRemoveGroupFollowsCallback_onCompleted", arguments);
            }
          });
    }
  }

  class IRCIMIWGetGroupFollowsCallbackImpl implements IRCIMIWGetGroupFollowsCallback {
    private int cb_handler = -1;

    IRCIMIWGetGroupFollowsCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWFollowInfo> t) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List t_str = new ArrayList();

      if (t != null) {
        for (RCIMIWFollowInfo element : t) {
          t_str.add(RCIMIWPlatformConverter.convertFollowInfo(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("t", t_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetGroupFollowsCallback_onSuccess", arguments);
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
              channel.invokeMethod("engine_cb:IRCIMIWGetGroupFollowsCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWTranslateResponseCallbackImpl implements IRCIMIWTranslateResponseCallback {
    private int cb_handler = -1;

    IRCIMIWTranslateResponseCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onTranslateResponse(int code) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse", arguments);
            }
          });
    }
  }

  class IRCIMIWTranslateGetLanguageCallbackImpl implements IRCIMIWTranslateGetLanguageCallback {
    private int cb_handler = -1;

    IRCIMIWTranslateGetLanguageCallbackImpl(int cb_handler) {
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
              channel.invokeMethod(
                  "engine_cb:IRCIMIWTranslateGetLanguageCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWTranslateGetLanguageCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetAutoTranslateEnabledCallbackImpl
      implements IRCIMIWGetAutoTranslateEnabledCallback {
    private int cb_handler = -1;

    IRCIMIWGetAutoTranslateEnabledCallbackImpl(int cb_handler) {
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
                  "engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWUpdateMyUserProfileVisibilityCallbackImpl
      implements IRCIMIWUpdateMyUserProfileVisibilityCallback {
    private int cb_handler = -1;

    IRCIMIWUpdateMyUserProfileVisibilityCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess() {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int errorCode) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("errorCode", errorCode);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetMyUserProfileVisibilityCallbackImpl
      implements IRCIMIWGetMyUserProfileVisibilityCallback {
    private int cb_handler = -1;

    IRCIMIWGetMyUserProfileVisibilityCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(int visibility) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("visibility", visibility);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int errorCode) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("errorCode", errorCode);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWUpdateMyUserProfileCallbackImpl implements IRCIMIWUpdateMyUserProfileCallback {
    private int cb_handler = -1;

    IRCIMIWUpdateMyUserProfileCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess() {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateMyUserProfileCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int errorCode, List<String> errorKeys) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("errorCode", errorCode);
      arguments.put("errorKeys", errorKeys);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWUpdateMyUserProfileCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetMyUserProfileCallbackImpl implements IRCIMIWGetMyUserProfileCallback {
    private int cb_handler = -1;

    IRCIMIWGetMyUserProfileCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWUserProfile userProfile) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("userProfile", RCIMIWPlatformConverter.convertUserProfile(userProfile));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWGetMyUserProfileCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int errorCode) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("errorCode", errorCode);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetMyUserProfileCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWGetUserProfilesCallbackImpl implements IRCIMIWGetUserProfilesCallback {
    private int cb_handler = -1;

    IRCIMIWGetUserProfilesCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWUserProfile> userProfiles) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List userProfiles_str = new ArrayList();

      if (userProfiles != null) {
        for (RCIMIWUserProfile element : userProfiles) {
          userProfiles_str.add(RCIMIWPlatformConverter.convertUserProfile(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("userProfiles", userProfiles_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetUserProfilesCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int errorCode) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("errorCode", errorCode);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWGetUserProfilesCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSearchUserProfileByUniqueIdCallbackImpl
      implements IRCIMIWSearchUserProfileByUniqueIdCallback {
    private int cb_handler = -1;

    IRCIMIWSearchUserProfileByUniqueIdCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(RCIMIWUserProfile userProfile) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("userProfile", RCIMIWPlatformConverter.convertUserProfile(userProfile));

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int errorCode) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("errorCode", errorCode);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWSubscribeEventCallbackImpl implements IRCIMIWSubscribeEventCallback {
    private int cb_handler = -1;

    IRCIMIWSubscribeEventCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess() {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWSubscribeEventCallback_onSuccess", arguments);
            }
          });
    }

    @Override
    public void onError(int code, List<String> failedUserIds) {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      arguments.put("code", code);
      arguments.put("failedUserIds", failedUserIds);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWSubscribeEventCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWQuerySubscribeEventCallbackImpl implements IRCIMIWQuerySubscribeEventCallback {
    private int cb_handler = -1;

    IRCIMIWQuerySubscribeEventCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess(List<RCIMIWSubscribeInfoEvent> events) {
      final HashMap<String, Object> arguments = new HashMap<>();

      List events_str = new ArrayList();

      if (events != null) {
        for (RCIMIWSubscribeInfoEvent element : events) {
          events_str.add(RCIMIWPlatformConverter.convertSubscribeInfoEvent(element));
        }
      }

      arguments.put("cb_handler", cb_handler);
      arguments.put("events", events_str);

      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod(
                  "engine_cb:IRCIMIWQuerySubscribeEventCallback_onSuccess", arguments);
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
                  "engine_cb:IRCIMIWQuerySubscribeEventCallback_onError", arguments);
            }
          });
    }
  }

  class IRCIMIWOperationCallbackImpl implements IRCIMIWOperationCallback {
    private int cb_handler = -1;

    IRCIMIWOperationCallbackImpl(int cb_handler) {
      this.cb_handler = cb_handler;
    }

    @Override
    public void onSuccess() {
      final HashMap<String, Object> arguments = new HashMap<>();

      arguments.put("cb_handler", cb_handler);
      RCIMWrapperMainThreadPoster.post(
          new Runnable() {
            @Override
            public void run() {
              channel.invokeMethod("engine_cb:IRCIMIWOperationCallback_onSuccess", arguments);
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
              channel.invokeMethod("engine_cb:IRCIMIWOperationCallback_onError", arguments);
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
