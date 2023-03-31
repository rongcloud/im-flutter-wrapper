// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

@JS('RCWebIMWrapper')
library web_im_wrapper;

import 'package:js/js_util.dart' as js_util;
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:js/js.dart';
import 'package:rongcloud_im_wrapper_plugin/src/web/rongcloud_im_wrapper_utils.dart';

@JS('RCIMIWEngine')
class RCIMIWEngineJS {
  external static dynamic create(appKey, options);
  external destroy();
  external setListener(listener);
  external connect(token, callback);
  external disconnect();

  external createTextMessage(conversationType, targetId, channelId, text);
  external createImageMessage(
      conversationType, targetId, channelId, inputElement);
  external createFileMessage(
      conversationType, targetId, channelId, inputElement);
  external createSightMessage(
      conversationType, targetId, channelId, inputElement);
  external createVoiceMessage(
      conversationType, targetId, channelId, inputElement);
  external createGIFMessage(
      conversationType, targetId, channelId, inputElement);
  external createReferenceMessage(
      conversationType, targetId, channelId, referenceMessage, text);
  external createCustomMessage(
      conversationType, targetId, channelId, policy, messageIdentifier, fields);
  external createLocationMessage(conversationType, targetId, channelId,
      longitude, latitude, poiName, thumbnailBase64);

  external sendMessage(message, callback);
  external sendMediaMessage(message, callback);

  /// 会话相关
  external loadConversation(conversationType, targetId, channelId, callback);
  external loadConversations(
      conversationTypes, channelId, startTime, count, callback);
  external removeConversation(conversationType, targetId, channelId, callback);

  // 未读数
  external loadUnreadCount(conversationType, targetId, channelId, callback);
  external loadTotalUnreadCount(channelId, callback);
  external loadUnreadMentionedCount(
      conversationType, targetId, channelId, callback);
  external loadUltraGroupAllUnreadCount(callback);
  external loadUltraGroupAllUnreadMentionedCount(callback);
  external loadUltraGroupUnreadCount(targetId, callback);
  external loadUltraGroupUnreadMentionedCount(targetId, callback);
  external loadUnreadCountByConversationTypes(
      conversationTypes, channelId, contain, callback);
  external clearUnreadCount(conversationType, targetId, channelId, callback);

  // 草稿
  external saveDraftMessage(
      conversationType, targetId, channelId, draft, callback);
  external loadDraftMessage(conversationType, targetId, channelId, callback);
  external clearDraftMessage(conversationType, targetId, channelId, callback);

  external loadBlockedConversations(conversationTypes, channelId, callback);
  external changeConversationTopStatus(
      conversationType, targetId, channelId, top, callback);
  external loadConversationTopStatus(
      conversationType, targetId, channelId, callback);
  external syncConversationReadStatus(
      conversationType, targetId, channelId, timestamp, callback);
  external sendTypingStatus(conversationType, targetId, channelId, currentType);

  external loadMessages(conversationType, targetId, channelId, sentTime, order,
      policy, count, callback);
  external clearMessages(
      conversationType, targetId, channelId, timestamp, policy, callback);
  external deleteMessages(
      conversationType, targetId, channelId, messages, callback);
  external recallMessage(message, callback);

  external sendPrivateReadReceiptMessage(
      targetId, channelId, timestamp, messageUId, callback);

  external sendGroupReadReceiptRequest(message, callback);
  external sendGroupReadReceiptResponse(
      targetId, channelId, messages, callback);

  external updateMessageExpansion(message, expansion, callback);
  external removeMessageExpansionForKeys(message, keys, callback);

  /// 聊天室
  external joinChatRoom(targetId, messageCount, autoCreate, callback);
  external leaveChatRoom(targetId, callback);
  external loadChatRoomMessages(targetId, timestamp, order, count, callback);
  external addChatRoomEntry(
      targetId, key, value, deleteWhenLeft, overwrite, callback);
  external addChatRoomEntries(
      targetId, entries, deleteWhenLeft, overwrite, callback);
  external loadChatRoomEntry(targetId, key, callback);
  external int loadAllChatRoomEntries(targetId, callback);
  external removeChatRoomEntry(targetId, key, force, callback);
  external removeChatRoomEntries(targetId, keys, force, callback);

  external changeConversationNotificationLevel(
      conversationType, targetId, channelId, level, callback);
  external loadConversationNotificationLevel(
      conversationType, targetId, channelId, callback);

  external changeUltraGroupDefaultNotificationLevel(targetId, level, callback);
  external loadUltraGroupDefaultNotificationLevel(targetId, callback);

  external changeUltraGroupChannelDefaultNotificationLevel(
      targetId, channelId, level, callback);
  external loadUltraGroupChannelDefaultNotificationLevel(
      targetId, channelId, callback);

  external sendGroupMessageToDesignatedUsers(message, userIds, callback);

  external loadTopConversations(conversationTypes, channelId, callback);

  external syncUltraGroupReadStatus(targetId, channelId, callback);

  external loadConversationListForAllChannel(
      conversationType, targetId, callback);

  external modifyUltraGroupMessage(messageUId, message, callback);
  external recallUltraGroupMessage(message, deleteRemote, callback);

  external sendUltraGroupTypingStatus(
      targetId, channelId, typingStatus, callback);
  external loadBatchRemoteUltraGroupMessages(messages, callback);

  external updateUltraGroupMessageExpansion(message, expansion, callback);
  external removeUltraGroupMessageExpansion(message, keys, callback);

  external getDeltaTime();
}

@JS('RCIMIWMessage')
class RCIMIWMessageJS {
  external setUserInfo(RCIMIWUserInfoJS userInfo);
  external setMentionedInfo(RCIMIWMentionedInfoJS mentionedInfo);
  external setPushOptions(RCIMIWMessagePushOptionsJS pushOptions);
  external setExpansion(JSMap expansion);
  external setExtra(String extra);
}

@JS('RCIMIWMediaMessage')
class RCIMIWMediaMessageJS extends RCIMIWMessageJS {}

@JS('RCIMIWTextMessage')
class RCIMIWTextMessageJS extends RCIMIWMessageJS {
  external factory RCIMIWTextMessageJS(options);
}

@JS('RCIMIWVoiceMessage')
class RCIMIWVoiceMessageJS extends RCIMIWMediaMessageJS {
  external factory RCIMIWVoiceMessageJS(options);
}

@JS('RCIMIWImageMessage')
class RCIMIWImageMessageJS extends RCIMIWMediaMessageJS {
  external factory RCIMIWImageMessageJS(options);
}

@JS('RCIMIWFileMessage')
class RCIMIWFileMessageJS extends RCIMIWMediaMessageJS {
  external factory RCIMIWFileMessageJS(options);
}

@JS('RCIMIWSightMessage')
class RCIMIWSightMessageJS extends RCIMIWMediaMessageJS {
  external factory RCIMIWSightMessageJS(options);
}

@JS('RCIMIWGIFMessage')
class RCIMIWGIFMessageJS extends RCIMIWMediaMessageJS {
  external factory RCIMIWGIFMessageJS(options);
}

@JS('RCIMIWReferenceMessage')
class RCIMIWReferenceMessageJS extends RCIMIWMessageJS {
  external factory RCIMIWReferenceMessageJS(options);
}

@JS('RCIMIWLocationMessage')
class RCIMIWLocationMessageJS extends RCIMIWMessageJS {
  external factory RCIMIWLocationMessageJS(options);
}

@JS('RCIMIWCustomMessage')
class RCIMIWCustomMessageJS extends RCIMIWMessageJS {
  external factory RCIMIWCustomMessageJS(options);
}

@JS('RCIMIWUnknownMessage')
class RCIMIWUnknownMessageJS extends RCIMIWMessageJS {
  external factory RCIMIWUnknownMessageJS(options);
}

@JS('RCIMIWEngineOptions')
class RCIMIWEngineOptionsJS {
  external static dynamic create(options);
}

@JS('RCIMIWCompressOptions')
class RCIMIWCompressOptionsJS {
  external factory RCIMIWCompressOptionsJS(options);
}

@JS('RCIMIWGroupReadReceiptInfo')
class RCIMIWGroupReadReceiptInfoJS {
  external factory RCIMIWGroupReadReceiptInfoJS(info);

  external set respondUserIds(JSMap? respondUserIds);
}

@JS('RCIMIWUserInfo')
class RCIMIWUserInfoJS {
  external factory RCIMIWUserInfoJS(info);
}

@JS('RCIMIWMentionedInfo')
class RCIMIWMentionedInfoJS {
  external factory RCIMIWMentionedInfoJS(info);
}

@JS('RCIMIWMessagePushOptions')
class RCIMIWMessagePushOptionsJS {
  external factory RCIMIWMessagePushOptionsJS(dynamic options);
  external set androidPushOptions(RCIMIWAndroidPushOptionsJS options);
  external set iOSPushOptions(RCIMIWIOSPushOptionsJS options);
}

@JS('RCIMIWAndroidPushOptions')
class RCIMIWAndroidPushOptionsJS {
  external factory RCIMIWAndroidPushOptionsJS(dynamic options);
}

@JS('RCIMIWIOSPushOptions')
class RCIMIWIOSPushOptionsJS {
  external factory RCIMIWIOSPushOptionsJS(dynamic options);
}

@anonymous
@JS()
class RCIMIWCallbackJS {
  external dynamic get onSuccess;
  external set onSuccess(dynamic func);

  external dynamic get onError;
  external set onError(dynamic func);
}

class RCIMIWVoidCallbackWeb {
  RCIMIWVoidCallbackWeb({required this.onSuccess, required this.onError});

  final Function() onSuccess;
  final Function(int code) onError;

  RCIMIWCallbackJS toJS() {
    var callbackJS = RCIMIWCallbackJS();
    callbackJS.onSuccess = allowInterop(onSuccess);
    callbackJS.onError = allowInterop(onError);
    return callbackJS;
  }
}

class RCIMIWCallbackWeb {
  RCIMIWCallbackWeb({required this.onSuccess, required this.onError});

  final Function(dynamic data) onSuccess;
  final Function(int code) onError;

  RCIMIWCallbackJS toJS() {
    var callbackJS = RCIMIWCallbackJS();
    callbackJS.onSuccess = allowInterop(onSuccess);
    callbackJS.onError = allowInterop(onError);
    return callbackJS;
  }
}

@anonymous
@JS()
class RCIMIWSendMediaMessageCallbackJS {
  external dynamic get onMediaMessageSending;
  external set onMediaMessageSending(dynamic func);

  external dynamic get onMediaMessageSent;
  external set onMediaMessageSent(dynamic func);
}

class RCIMIWSendMediaMessageCallbackWeb {
  RCIMIWSendMediaMessageCallbackWeb(
      {required this.onMediaMessageSending, required this.onMediaMessageSent});

  final Function(dynamic message, int progress) onMediaMessageSending;
  final RCIMIWCallbackWeb onMediaMessageSent;

  RCIMIWSendMediaMessageCallbackJS toJS() {
    var webCallback = RCIMIWSendMediaMessageCallbackJS();
    webCallback.onMediaMessageSending = allowInterop(onMediaMessageSending);
    webCallback.onMediaMessageSent = onMediaMessageSent.toJS();
    return webCallback;
  }
}

@anonymous
@JS()
class RCIMIWListenerJS {
  external dynamic get onMessageReceived;
  external set onMessageReceived(dynamic func);

  external dynamic get onConnectionStatusChanged;
  external set onConnectionStatusChanged(dynamic func);

  external dynamic get onConversationTopStatusSynced;
  external set onConversationTopStatusSynced(dynamic func);

  external dynamic get onRemoteMessageRecalled;
  external set onRemoteMessageRecalled(dynamic func);

  external dynamic get onPrivateReadReceiptReceived;
  external set onPrivateReadReceiptReceived(dynamic func);

  external dynamic get onRemoteMessageExpansionUpdated;
  external set onRemoteMessageExpansionUpdated(dynamic func);

  external dynamic get onRemoteMessageExpansionForKeyRemoved;
  external set onRemoteMessageExpansionForKeyRemoved(dynamic func);

  external dynamic get onChatRoomMemberChanged;
  external set onChatRoomMemberChanged(dynamic func);

  external dynamic get onTypingStatusChanged;
  external set onTypingStatusChanged(dynamic func);

  external dynamic get onConversationReadStatusSyncMessageReceived;
  external set onConversationReadStatusSyncMessageReceived(dynamic func);

  external dynamic get onChatRoomEntriesChanged;
  external set onChatRoomEntriesChanged(dynamic func);

  external dynamic get onRemoteUltraGroupMessageExpansionUpdated;
  external set onRemoteUltraGroupMessageExpansionUpdated(dynamic func);

  external dynamic get onRemoteUltraGroupMessageModified;
  external set onRemoteUltraGroupMessageModified(dynamic func);

  external dynamic get onRemoteUltraGroupMessageRecalled;
  external set onRemoteUltraGroupMessageRecalled(dynamic func);

  external dynamic get onUltraGroupReadTimeReceived;
  external set onUltraGroupReadTimeReceived(dynamic func);

  external dynamic get onUltraGroupTypingStatusChanged;
  external set onUltraGroupTypingStatusChanged(dynamic func);

  external dynamic get onMessageBlocked;
  external set onMessageBlocked(dynamic func);

  external dynamic get onChatRoomStatusChanged;
  external set onChatRoomStatusChanged(dynamic func);

  external dynamic get onGroupMessageReadReceiptRequestReceived;
  external set onGroupMessageReadReceiptRequestReceived(dynamic func);

  external dynamic get onGroupMessageReadReceiptResponseReceived;
  external set onGroupMessageReadReceiptResponseReceived(dynamic func);

  external dynamic get onUltraGroupEnable;
  external set onUltraGroupEnable(dynamic func);

  external dynamic get onConnected;
  external set onConnected(dynamic func);

  // external dynamic get onDatabaseOpened;
  // external set onDatabaseOpened(dynamic func);

  external dynamic get onConversationsUpdate;
  external set onConversationsUpdate(dynamic func);

  external dynamic get onConversationLoaded;
  external set onConversationLoaded(dynamic func);

  external dynamic get onConversationsLoaded;
  external set onConversationsLoaded(dynamic func);

  external dynamic get onConversationRemoved;
  external set onConversationRemoved(dynamic func);

  external dynamic get onConversationsRemoved;
  external set onConversationsRemoved(dynamic func);

  external dynamic get onTotalUnreadCountLoaded;
  external set onTotalUnreadCountLoaded(dynamic func);

  external dynamic get onUnreadCountLoaded;
  external set onUnreadCountLoaded(dynamic func);

  external dynamic get onUnreadCountByConversationTypesLoaded;
  external set onUnreadCountByConversationTypesLoaded(dynamic func);

  external dynamic get onUnreadMentionedCountLoaded;
  external set onUnreadMentionedCountLoaded(dynamic func);

  external dynamic get onUltraGroupAllUnreadCountLoaded;
  external set onUltraGroupAllUnreadCountLoaded(dynamic func);

  external dynamic get onUltraGroupAllUnreadMentionedCountLoaded;
  external set onUltraGroupAllUnreadMentionedCountLoaded(dynamic func);

  external dynamic get onUnreadCountCleared;
  external set onUnreadCountCleared(dynamic func);

  external dynamic get onDraftMessageSaved;
  external set onDraftMessageSaved(dynamic func);

  external dynamic get onDraftMessageCleared;
  external set onDraftMessageCleared(dynamic func);

  external dynamic get onDraftMessageLoaded;
  external set onDraftMessageLoaded(dynamic func);

  external dynamic get onBlockedConversationsLoaded;
  external set onBlockedConversationsLoaded(dynamic func);

  external dynamic get onConversationTopStatusChanged;
  external set onConversationTopStatusChanged(dynamic func);

  external dynamic get onConversationTopStatusLoaded;
  external set onConversationTopStatusLoaded(dynamic func);

  external dynamic get onConversationReadStatusSynced;
  external set onConversationReadStatusSynced(dynamic func);

  // external dynamic get onMessageAttached;
  // external set onMessageAttached(dynamic func);

  external dynamic get onMessageSent;
  external set onMessageSent(dynamic func);

  // external dynamic get onMediaMessageAttached;
  // external set onMediaMessageAttached(dynamic func);

  external dynamic get onMediaMessageSending;
  external set onMediaMessageSending(dynamic func);

  // external dynamic get onSendingMediaMessageCanceled;
  // external set onSendingMediaMessageCanceled(dynamic func);

  external dynamic get onMediaMessageSent;
  external set onMediaMessageSent(dynamic func);

  // external dynamic get onMediaMessageDownloading;
  // external set onMediaMessageDownloading(dynamic func);

  // external dynamic get onMediaMessageDownloaded;
  // external set onMediaMessageDownloaded(dynamic func);

  // external dynamic get onDownloadingMediaMessageCanceled;
  // external set onDownloadingMediaMessageCanceled(dynamic func);

  external dynamic get onMessagesLoaded;
  external set onMessagesLoaded(dynamic func);

  // external dynamic get onUnreadMentionedMessagesLoaded;
  // external set onUnreadMentionedMessagesLoaded(dynamic func);

  // external dynamic get onFirstUnreadMessageLoaded;
  // external set onFirstUnreadMessageLoaded(dynamic func);

  // external dynamic get onMessageInserted;
  // external set onMessageInserted(dynamic func);

  // external dynamic get onMessagesInserted;
  // external set onMessagesInserted(dynamic func);

  external dynamic get onMessageCleared;
  external set onMessageCleared(dynamic func);

  // external dynamic get onLocalMessagesDeleted;
  // external set onLocalMessagesDeleted(dynamic func);

  external dynamic get onMessagesDeleted;
  external set onMessagesDeleted(dynamic func);

  external dynamic get onMessageRecalled;
  external set onMessageRecalled(dynamic func);

  external dynamic get onPrivateReadReceiptMessageSent;
  external set onPrivateReadReceiptMessageSent(dynamic func);

  external dynamic get onMessageExpansionUpdated;
  external set onMessageExpansionUpdated(dynamic func);

  external dynamic get onMessageExpansionForKeysRemoved;
  external set onMessageExpansionForKeysRemoved(dynamic func);

  // external dynamic get onMessageReceiveStatusChanged;
  // external set onMessageReceiveStatusChanged(dynamic func);

  // external dynamic get onMessageSentStatusChanged;
  // external set onMessageSentStatusChanged(dynamic func);

  external dynamic get onChatRoomJoined;
  external set onChatRoomJoined(dynamic func);

  external dynamic get onChatRoomJoining;
  external set onChatRoomJoining(dynamic func);

  external dynamic get onChatRoomLeft;
  external set onChatRoomLeft(dynamic func);

  external dynamic get onChatRoomMessagesLoaded;
  external set onChatRoomMessagesLoaded(dynamic func);

  external dynamic get onChatRoomEntryAdded;
  external set onChatRoomEntryAdded(dynamic func);

  external dynamic get onChatRoomEntriesAdded;
  external set onChatRoomEntriesAdded(dynamic func);

  external dynamic get onChatRoomEntryLoaded;
  external set onChatRoomEntryLoaded(dynamic func);

  external dynamic get onAllChatRoomEntriesLoaded;
  external set onAllChatRoomEntriesLoaded(dynamic func);

  external dynamic get onChatRoomEntryRemoved;
  external set onChatRoomEntryRemoved(dynamic func);

  external dynamic get onChatRoomEntriesRemoved;
  external set onChatRoomEntriesRemoved(dynamic func);

  // external dynamic get onBlacklistAdded;
  // external set onBlacklistAdded(dynamic func);

  // external dynamic get onBlacklistRemoved;
  // external set onBlacklistRemoved(dynamic func);

  // external dynamic get onBlacklistStatusLoaded;
  // external set onBlacklistStatusLoaded(dynamic func);

  // external dynamic get onBlacklistLoaded;
  // external set onBlacklistLoaded(dynamic func);

  // external dynamic get onMessagesSearched;
  // external set onMessagesSearched(dynamic func);

  // external dynamic get onMessagesSearchedByTimeRange;
  // external set onMessagesSearchedByTimeRange(dynamic func);

  // external dynamic get onMessagesSearchedByUserId;
  // external set onMessagesSearchedByUserId(dynamic func);

  // external dynamic get onConversationsSearched;
  // external set onConversationsSearched(dynamic func);

  external dynamic get onGroupReadReceiptRequestSent;
  external set onGroupReadReceiptRequestSent(dynamic func);

  external dynamic get onGroupReadReceiptResponseSent;
  external set onGroupReadReceiptResponseSent(dynamic func);

  // external dynamic get onNotificationQuietHoursChanged;
  // external set onNotificationQuietHoursChanged(dynamic func);

  // external dynamic get onNotificationQuietHoursRemoved;
  // external set onNotificationQuietHoursRemoved(dynamic func);

  // external dynamic get onNotificationQuietHoursLoaded;
  // external set onNotificationQuietHoursLoaded(dynamic func);

  external dynamic get onConversationNotificationLevelChanged;
  external set onConversationNotificationLevelChanged(dynamic func);

  external dynamic get onConversationNotificationLevelLoaded;
  external set onConversationNotificationLevelLoaded(dynamic func);

  external dynamic get onConversationTypeNotificationLevelChanged;
  external set onConversationTypeNotificationLevelChanged(dynamic func);

  external dynamic get onConversationTypeNotificationLevelLoaded;
  external set onConversationTypeNotificationLevelLoaded(dynamic func);

  external dynamic get onUltraGroupDefaultNotificationLevelChanged;
  external set onUltraGroupDefaultNotificationLevelChanged(dynamic func);

  external dynamic get onUltraGroupDefaultNotificationLevelLoaded;
  external set onUltraGroupDefaultNotificationLevelLoaded(dynamic func);

  external dynamic get onUltraGroupChannelDefaultNotificationLevelChanged;
  external set onUltraGroupChannelDefaultNotificationLevelChanged(dynamic func);

  external dynamic get onUltraGroupChannelDefaultNotificationLevelLoaded;
  external set onUltraGroupChannelDefaultNotificationLevelLoaded(dynamic func);

  // external dynamic get onPushContentShowStatusChanged;
  // external set onPushContentShowStatusChanged(dynamic func);

  // external dynamic get onPushLanguageChanged;
  // external set onPushLanguageChanged(dynamic func);

  // external dynamic get onPushReceiveStatusChanged;
  // external set onPushReceiveStatusChanged(dynamic func);

  // external dynamic get onMessageCountLoaded;
  // external set onMessageCountLoaded(dynamic func);

  external dynamic get onTopConversationsLoaded;
  external set onTopConversationsLoaded(dynamic func);

  external dynamic get onGroupMessageToDesignatedUsersAttached;
  external set onGroupMessageToDesignatedUsersAttached(dynamic func);

  external dynamic get onGroupMessageToDesignatedUsersSent;
  external set onGroupMessageToDesignatedUsersSent(dynamic func);

  external dynamic get onUltraGroupReadStatusSynced;
  external set onUltraGroupReadStatusSynced(dynamic func);

  external dynamic get onConversationsLoadedForAllChannel;
  external set onConversationsLoadedForAllChannel(dynamic func);

  external dynamic get onUltraGroupUnreadMentionedCountLoaded;
  external set onUltraGroupUnreadMentionedCountLoaded(dynamic func);

  external dynamic get onUltraGroupUnreadCountLoaded;
  external set onUltraGroupUnreadCountLoaded(dynamic func);

  external dynamic get onUltraGroupMessageModified;
  external set onUltraGroupMessageModified(dynamic func);

  external dynamic get onUltraGroupMessageRecalled;
  external set onUltraGroupMessageRecalled(dynamic func);

  // external dynamic get onUltraGroupMessagesCleared;
  // external set onUltraGroupMessagesCleared(dynamic func);

  // external dynamic get onUltraGroupMessagesClearedForAllChannel;
  // external set onUltraGroupMessagesClearedForAllChannel(dynamic func);

  external dynamic get onUltraGroupTypingStatusSent;
  external set onUltraGroupTypingStatusSent(dynamic func);

  external dynamic get onBatchRemoteUltraGroupMessagesLoaded;
  external set onBatchRemoteUltraGroupMessagesLoaded(dynamic func);

  external dynamic get onUltraGroupMessageExpansionUpdated;
  external set onUltraGroupMessageExpansionUpdated(dynamic func);

  external dynamic get onUltraGroupMessageExpansionRemoved;
  external set onUltraGroupMessageExpansionRemoved(dynamic func);
}

class RCIMIWEngineWeb {
  // create 出来的 js engine 对象，用来调用实例方法
  static RCIMIWEngineJS? imEngine;

  static create(String appKey, RCIMIWEngineOptions options) {
    imEngine = RCIMIWEngineJS.create(appKey, toJSEngineOptions(options));
  }

  destroy() {
    imEngine?.destroy();
    imEngine = null;
  }

  static RCIMIWEngineOptionsJS toJSEngineOptions(RCIMIWEngineOptions options) {
    var jsObject = dartToJS(options.toJson());
    RCIMIWCompressOptionsJS compressOptionsJS =
        RCIMIWCompressOptionsJS(dartToJS(options.compressOptions?.toJson()));
    js_util.setProperty(jsObject, 'compressOptions', compressOptionsJS);
    RCIMIWEngineOptionsJS jsOptions = RCIMIWEngineOptionsJS.create(jsObject);
    return jsOptions;
  }
}
