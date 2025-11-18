import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

class IRCIMIWConnectCallback {
  IRCIMIWConnectCallback({required this.onConnected, required this.onDatabaseOpened});

  /// [ZH]
  /// ---
  /// 连接回调
  /// @param code 连接状态码
  /// @param userId 用户ID
  /// ---
  /// [EN]
  /// ---
  /// Connection Callback
  /// @param code Connection status code
  /// @param userId User ID
  /// ---
  Function(int? code, String? userId) onConnected;

  /// [ZH]
  /// ---
  /// 数据库打开回调
  /// @param code 连接状态码
  /// ---
  /// [EN]
  /// ---
  /// Database Open Callback
  /// @param code Indicates the connection status code.
  /// ---
  Function(int? code) onDatabaseOpened;
}

class IRCIMIWSendMessageCallback {
  IRCIMIWSendMessageCallback({required this.onMessageSaved, required this.onMessageSent});

  /// [ZH]
  /// ---
  /// 消息保存到本地数据库的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for saving messages to the local database
  /// @param message The message
  /// ---
  Function(RCIMIWMessage? message) onMessageSaved;

  /// [ZH]
  /// ---
  /// 消息发送成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback triggered when a message is sent successfully
  /// @param code Status code
  /// @param message Message
  /// ---
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}

class IRCIMIWSendMediaMessageListener {
  IRCIMIWSendMediaMessageListener({
    required this.onMediaMessageSaved,
    required this.onMediaMessageSending,
    required this.onSendingMediaMessageCanceled,
    required this.onMediaMessageSent,
  });

  /// [ZH]
  /// ---
  /// 消息保存到本地数据库的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for saving messages to the local database
  /// @param message The message
  /// ---
  Function(RCIMIWMediaMessage? message) onMediaMessageSaved;

  /// [ZH]
  /// ---
  /// 消息发送中的回调
  /// @param message 消息
  /// @param progress 进度
  /// ---
  /// [EN]
  /// ---
  /// Callback for sending messages
  /// @param message The message
  /// @param progress The progress
  /// ---
  Function(RCIMIWMediaMessage? message, int? progress) onMediaMessageSending;

  /// [ZH]
  /// ---
  /// 取消发送消息的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for canceling message sending
  /// @param message The message
  /// ---
  Function(RCIMIWMediaMessage? message) onSendingMediaMessageCanceled;

  /// [ZH]
  /// ---
  /// 消息发送成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for successful message sending
  /// @param code Status code
  /// @param message Message
  /// ---
  Function(int? code, RCIMIWMediaMessage? message) onMediaMessageSent;
}

class IRCIMIWCancelSendingMediaMessageCallback {
  IRCIMIWCancelSendingMediaMessageCallback({required this.onCancelSendingMediaMessageCalled});

  Function(int? code, RCIMIWMediaMessage? message) onCancelSendingMediaMessageCalled;
}

class IRCIMIWDownloadMediaMessageListener {
  IRCIMIWDownloadMediaMessageListener({
    required this.onMediaMessageDownloading,
    required this.onDownloadingMediaMessageCanceled,
    required this.onMediaMessageDownloaded,
  });

  /// [ZH]
  /// ---
  /// 消息下载中的回调
  /// @param message 消息
  /// @param progress 进度
  /// ---
  /// [EN]
  /// ---
  /// Callback for downloading messages
  /// @param message The message
  /// @param progress The progress
  /// ---
  Function(RCIMIWMediaMessage? message, int? progress) onMediaMessageDownloading;

  /// [ZH]
  /// ---
  /// 取消下载消息的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for canceling message downloading
  /// @param message The message
  /// ---
  Function(RCIMIWMediaMessage? message) onDownloadingMediaMessageCanceled;

  /// [ZH]
  /// ---
  /// 消息下载成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for successful message downloading
  /// @param code Status code
  /// @param message The message
  /// ---
  Function(int? code, RCIMIWMediaMessage? message) onMediaMessageDownloaded;
}

class IRCIMIWCancelDownloadingMediaMessageCallback {
  IRCIMIWCancelDownloadingMediaMessageCallback({required this.onCancelDownloadingMediaMessageCalled});

  Function(int? code, RCIMIWMediaMessage? message) onCancelDownloadingMediaMessageCalled;
}

class IRCIMIWGetConversationCallback {
  IRCIMIWGetConversationCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWConversation? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWObjectCallback<T> {
  IRCIMIWObjectCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(T? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetConversationsCallback {
  IRCIMIWGetConversationsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWConversation>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUnreadConversationsCallback {
  IRCIMIWGetUnreadConversationsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWConversation>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWRemoveConversationCallback {
  IRCIMIWRemoveConversationCallback({required this.onConversationRemoved});

  Function(int? code) onConversationRemoved;
}

class IRCIMIWRemoveConversationsCallback {
  IRCIMIWRemoveConversationsCallback({required this.onConversationsRemoved});

  Function(int? code) onConversationsRemoved;
}

class IRCIMIWGetUnreadCountCallback {
  IRCIMIWGetUnreadCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetTotalUnreadCountCallback {
  IRCIMIWGetTotalUnreadCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUnreadMentionedCountCallback {
  IRCIMIWGetUnreadMentionedCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupAllUnreadCountCallback {
  IRCIMIWGetUltraGroupAllUnreadCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback {
  IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupUnreadCountCallback {
  IRCIMIWGetUltraGroupUnreadCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupUnreadMentionedCountCallback {
  IRCIMIWGetUltraGroupUnreadMentionedCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUnreadCountByConversationTypesCallback {
  IRCIMIWGetUnreadCountByConversationTypesCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUnreadCountByLevelsCallback {
  IRCIMIWGetUnreadCountByLevelsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWClearUnreadCountCallback {
  IRCIMIWClearUnreadCountCallback({required this.onUnreadCountCleared});

  Function(int? code) onUnreadCountCleared;
}

class IRCIMIWSaveDraftMessageCallback {
  IRCIMIWSaveDraftMessageCallback({required this.onDraftMessageSaved});

  Function(int? code) onDraftMessageSaved;
}

class IRCIMIWGetDraftMessageCallback {
  IRCIMIWGetDraftMessageCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(String? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWClearDraftMessageCallback {
  IRCIMIWClearDraftMessageCallback({required this.onDraftMessageCleared});

  Function(int? code) onDraftMessageCleared;
}

class IRCIMIWGetBlockedConversationsCallback {
  IRCIMIWGetBlockedConversationsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWConversation>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWChangeConversationTopStatusCallback {
  IRCIMIWChangeConversationTopStatusCallback({required this.onConversationTopStatusChanged});

  Function(int? code) onConversationTopStatusChanged;
}

class IRCIMIWGetConversationTopStatusCallback {
  IRCIMIWGetConversationTopStatusCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(bool? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSyncConversationReadStatusCallback {
  IRCIMIWSyncConversationReadStatusCallback({required this.onConversationReadStatusSynced});

  Function(int? code) onConversationReadStatusSynced;
}

class IRCIMIWGetMessagesCallback {
  IRCIMIWGetMessagesCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetMessageCallback {
  IRCIMIWGetMessageCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWMessage? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetMessagesAroundTimeCallback {
  IRCIMIWGetMessagesAroundTimeCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetFirstUnreadMessageCallback {
  IRCIMIWGetFirstUnreadMessageCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWMessage? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetUnreadMentionedMessagesCallback {
  IRCIMIWGetUnreadMentionedMessagesCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWInsertMessageCallback {
  IRCIMIWInsertMessageCallback({required this.onMessageInserted});

  Function(int? code, RCIMIWMessage? message) onMessageInserted;
}

class IRCIMIWInsertMessagesCallback {
  IRCIMIWInsertMessagesCallback({required this.onMessagesInserted});

  Function(int? code, List<RCIMIWMessage>? messages) onMessagesInserted;
}

class IRCIMIWClearMessagesCallback {
  IRCIMIWClearMessagesCallback({required this.onMessagesCleared});

  Function(int? code) onMessagesCleared;
}

class IRCIMIWDeleteLocalMessagesCallback {
  IRCIMIWDeleteLocalMessagesCallback({required this.onLocalMessagesDeleted});

  Function(int? code, List<RCIMIWMessage>? messages) onLocalMessagesDeleted;
}

class IRCIMIWDeleteLocalMessageByIdsCallback {
  IRCIMIWDeleteLocalMessageByIdsCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWCompletionCallback {
  IRCIMIWCompletionCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWDeleteMessagesCallback {
  IRCIMIWDeleteMessagesCallback({required this.onMessagesDeleted});

  Function(int? code, List<RCIMIWMessage>? messages) onMessagesDeleted;
}

class IRCIMIWRecallMessageCallback {
  IRCIMIWRecallMessageCallback({required this.onMessageRecalled});

  Function(int? code, RCIMIWMessage? message) onMessageRecalled;
}

class IRCIMIWSendPrivateReadReceiptMessageCallback {
  IRCIMIWSendPrivateReadReceiptMessageCallback({required this.onPrivateReadReceiptMessageSent});

  Function(int? code) onPrivateReadReceiptMessageSent;
}

class IRCIMIWSendGroupReadReceiptRequestCallback {
  IRCIMIWSendGroupReadReceiptRequestCallback({required this.onGroupReadReceiptRequestSent});

  Function(int? code, RCIMIWMessage? message) onGroupReadReceiptRequestSent;
}

class IRCIMIWSendGroupReadReceiptResponseCallback {
  IRCIMIWSendGroupReadReceiptResponseCallback({required this.onGroupReadReceiptResponseSent});

  Function(int? code, List<RCIMIWMessage>? message) onGroupReadReceiptResponseSent;
}

class IRCIMIWUpdateMessageExpansionCallback {
  IRCIMIWUpdateMessageExpansionCallback({required this.onMessageExpansionUpdated});

  Function(int? code) onMessageExpansionUpdated;
}

class IRCIMIWRemoveMessageExpansionForKeysCallback {
  IRCIMIWRemoveMessageExpansionForKeysCallback({required this.onMessageExpansionForKeysRemoved});

  Function(int? code) onMessageExpansionForKeysRemoved;
}

class IRCIMIWChangeMessageSentStatusCallback {
  IRCIMIWChangeMessageSentStatusCallback({required this.onMessageSentStatusChanged});

  Function(int? code) onMessageSentStatusChanged;
}

class IRCIMIWChangeMessageReceivedStatusCallback {
  IRCIMIWChangeMessageReceivedStatusCallback({required this.onMessageReceiveStatusChanged});

  Function(int? code) onMessageReceiveStatusChanged;
}

class IRCIMIWChangeMessageReceivedStatusInfoCallback {
  IRCIMIWChangeMessageReceivedStatusInfoCallback({required this.onMessageReceiveStatusInfoChanged});

  Function(int? code) onMessageReceiveStatusInfoChanged;
}

class IRCIMIWUpdateMessageLocalExtraCallback {
  IRCIMIWUpdateMessageLocalExtraCallback({required this.onMessageLocalExtraUpdated});

  Function(int? code) onMessageLocalExtraUpdated;
}

class IRCIMIWJoinChatRoomCallback {
  IRCIMIWJoinChatRoomCallback({required this.onChatRoomJoined});

  Function(int? code, String? targetId) onChatRoomJoined;
}

class IRCIMIWLeaveChatRoomCallback {
  IRCIMIWLeaveChatRoomCallback({required this.onChatRoomLeft});

  Function(int? code, String? targetId) onChatRoomLeft;
}

class IRCIMIWGetChatRoomMessagesCallback {
  IRCIMIWGetChatRoomMessagesCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWAddChatRoomEntryCallback {
  IRCIMIWAddChatRoomEntryCallback({required this.onChatRoomEntryAdded});

  Function(int? code) onChatRoomEntryAdded;
}

class IRCIMIWAddChatRoomEntriesCallback {
  IRCIMIWAddChatRoomEntriesCallback({required this.onChatRoomEntriesAdded});

  Function(int? code, Map? errors) onChatRoomEntriesAdded;
}

class IRCIMIWGetChatRoomEntryCallback {
  IRCIMIWGetChatRoomEntryCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(Map? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetChatRoomAllEntriesCallback {
  IRCIMIWGetChatRoomAllEntriesCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(Map? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWRemoveChatRoomEntryCallback {
  IRCIMIWRemoveChatRoomEntryCallback({required this.onChatRoomEntryRemoved});

  Function(int? code) onChatRoomEntryRemoved;
}

class IRCIMIWRemoveChatRoomEntriesCallback {
  IRCIMIWRemoveChatRoomEntriesCallback({required this.onChatRoomEntriesRemoved});

  Function(int? code) onChatRoomEntriesRemoved;
}

class IRCIMIWAddToBlacklistCallback {
  IRCIMIWAddToBlacklistCallback({required this.onBlacklistAdded});

  Function(int? code, String? userId) onBlacklistAdded;
}

class IRCIMIWRemoveFromBlacklistCallback {
  IRCIMIWRemoveFromBlacklistCallback({required this.onBlacklistRemoved});

  Function(int? code, String? userId) onBlacklistRemoved;
}

class IRCIMIWGetBlacklistStatusCallback {
  IRCIMIWGetBlacklistStatusCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWBlacklistStatus? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetBlacklistCallback {
  IRCIMIWGetBlacklistCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<String>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesCallback {
  IRCIMIWSearchMessagesCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesByTimeRangeCallback {
  IRCIMIWSearchMessagesByTimeRangeCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesByUserIdCallback {
  IRCIMIWSearchMessagesByUserIdCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesByMessageTypesCallback {
  IRCIMIWSearchMessagesByMessageTypesCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWMessage>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSearchConversationsCallback {
  IRCIMIWSearchConversationsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWSearchConversationResult>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWChangeNotificationQuietHoursCallback {
  IRCIMIWChangeNotificationQuietHoursCallback({required this.onNotificationQuietHoursChanged});

  Function(int? code) onNotificationQuietHoursChanged;
}

class IRCIMIWRemoveNotificationQuietHoursCallback {
  IRCIMIWRemoveNotificationQuietHoursCallback({required this.onNotificationQuietHoursRemoved});

  Function(int? code) onNotificationQuietHoursRemoved;
}

class IRCIMIWGetNotificationQuietHoursCallback {
  IRCIMIWGetNotificationQuietHoursCallback({required this.onSuccess, required this.onError});

  Function(String? startTime, int? spanMinutes, RCIMIWPushNotificationQuietHoursLevel? level) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWChangeConversationNotificationLevelCallback {
  IRCIMIWChangeConversationNotificationLevelCallback({required this.onConversationNotificationLevelChanged});

  Function(int? code) onConversationNotificationLevelChanged;
}

class IRCIMIWGetConversationNotificationLevelCallback {
  IRCIMIWGetConversationNotificationLevelCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPushNotificationLevel? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWChangeConversationTypeNotificationLevelCallback {
  IRCIMIWChangeConversationTypeNotificationLevelCallback({required this.onConversationTypeNotificationLevelChanged});

  Function(int? code) onConversationTypeNotificationLevelChanged;
}

class IRCIMIWGetConversationTypeNotificationLevelCallback {
  IRCIMIWGetConversationTypeNotificationLevelCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPushNotificationLevel? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback {
  IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback({required this.onUltraGroupDefaultNotificationLevelChanged});

  Function(int? code) onUltraGroupDefaultNotificationLevelChanged;
}

class IRCIMIWGetUltraGroupDefaultNotificationLevelCallback {
  IRCIMIWGetUltraGroupDefaultNotificationLevelCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPushNotificationLevel? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback {
  IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback({
    required this.onUltraGroupChannelDefaultNotificationLevelChanged,
  });

  Function(int? code) onUltraGroupChannelDefaultNotificationLevelChanged;
}

class IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback {
  IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPushNotificationLevel? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWChangePushContentShowStatusCallback {
  IRCIMIWChangePushContentShowStatusCallback({required this.onPushContentShowStatusChanged});

  Function(int? code) onPushContentShowStatusChanged;
}

class IRCIMIWChangePushLanguageCallback {
  IRCIMIWChangePushLanguageCallback({required this.onPushLanguageChanged});

  Function(int? code) onPushLanguageChanged;
}

class IRCIMIWChangePushReceiveStatusCallback {
  IRCIMIWChangePushReceiveStatusCallback({required this.onPushReceiveStatusChanged});

  Function(int? code) onPushReceiveStatusChanged;
}

class IRCIMIWSendGroupMessageToDesignatedUsersCallback {
  IRCIMIWSendGroupMessageToDesignatedUsersCallback({required this.onMessageSaved, required this.onMessageSent});

  /// [ZH]
  /// ---
  /// 消息保存到本地数据库的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for saving messages to the local database
  /// @param message The message
  /// ---
  Function(RCIMIWMessage? message) onMessageSaved;

  /// [ZH]
  /// ---
  /// 消息发送成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback triggered when a message is sent successfully
  /// @param code Status code
  /// @param message Message
  /// ---
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}

class IRCIMIWGetMessageCountCallback {
  IRCIMIWGetMessageCountCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetTopConversationsCallback {
  IRCIMIWGetTopConversationsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWConversation>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSyncUltraGroupReadStatusCallback {
  IRCIMIWSyncUltraGroupReadStatusCallback({required this.onUltraGroupReadStatusSynced});

  Function(int? code) onUltraGroupReadStatusSynced;
}

class IRCIMIWGetConversationsForAllChannelCallback {
  IRCIMIWGetConversationsForAllChannelCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWConversation>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWModifyUltraGroupMessageCallback {
  IRCIMIWModifyUltraGroupMessageCallback({required this.onUltraGroupMessageModified});

  Function(int? code) onUltraGroupMessageModified;
}

class IRCIMIWRecallUltraGroupMessageCallback {
  IRCIMIWRecallUltraGroupMessageCallback({required this.onUltraGroupMessageRecalled});

  Function(int? code) onUltraGroupMessageRecalled;
}

class IRCIMIWClearUltraGroupMessagesCallback {
  IRCIMIWClearUltraGroupMessagesCallback({required this.onUltraGroupMessagesCleared});

  Function(int? code) onUltraGroupMessagesCleared;
}

class IRCIMIWSendUltraGroupTypingStatusCallback {
  IRCIMIWSendUltraGroupTypingStatusCallback({required this.onUltraGroupTypingStatusSent});

  Function(int? code) onUltraGroupTypingStatusSent;
}

class IRCIMIWClearUltraGroupMessagesForAllChannelCallback {
  IRCIMIWClearUltraGroupMessagesForAllChannelCallback({required this.onUltraGroupMessagesClearedForAllChannel});

  Function(int? code) onUltraGroupMessagesClearedForAllChannel;
}

class IRCIMIWGetBatchRemoteUltraGroupMessagesCallback {
  IRCIMIWGetBatchRemoteUltraGroupMessagesCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? matchedMessages, List<RCIMIWMessage>? notMatchedMessages) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWUpdateUltraGroupMessageExpansionCallback {
  IRCIMIWUpdateUltraGroupMessageExpansionCallback({required this.onUltraGroupMessageExpansionUpdated});

  Function(int? code) onUltraGroupMessageExpansionUpdated;
}

class IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback {
  IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback({required this.onUltraGroupMessageExpansionForKeysRemoved});

  Function(int? code) onUltraGroupMessageExpansionForKeysRemoved;
}

class IRCIMIWCreateTagCallback {
  IRCIMIWCreateTagCallback({required this.onTagCreated});

  Function(int? code) onTagCreated;
}

class IRCIMIWRemoveTagCallback {
  IRCIMIWRemoveTagCallback({required this.onTagRemoved});

  Function(int? code) onTagRemoved;
}

class IRCIMIWUpdateTagNameByIdCallback {
  IRCIMIWUpdateTagNameByIdCallback({required this.onTagNameByIdUpdated});

  Function(int? code) onTagNameByIdUpdated;
}

class IRCIMIWGetTagsCallback {
  IRCIMIWGetTagsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWTagInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWAddConversationToTagCallback {
  IRCIMIWAddConversationToTagCallback({required this.onConversationToTagAdded});

  Function(int? code) onConversationToTagAdded;
}

class IRCIMIWRemoveConversationFromTagCallback {
  IRCIMIWRemoveConversationFromTagCallback({required this.onConversationFromTagRemoved});

  Function(int? code) onConversationFromTagRemoved;
}

class IRCIMIWRemoveTagsFromConversationCallback {
  IRCIMIWRemoveTagsFromConversationCallback({required this.onTagsFromConversationRemoved});

  Function(int? code) onTagsFromConversationRemoved;
}

class IRCIMIWGetTagsFromConversationCallback {
  IRCIMIWGetTagsFromConversationCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWConversationTagInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWChangeConversationTopStatusInTagCallback {
  IRCIMIWChangeConversationTopStatusInTagCallback({required this.onConversationTopStatusInTagChanged});

  Function(int? code) onConversationTopStatusInTagChanged;
}

class IRCIMIWGetConversationTopStatusInTagCallback {
  IRCIMIWGetConversationTopStatusInTagCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(bool? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWClearMessagesUnreadStatusByTagCallback {
  IRCIMIWClearMessagesUnreadStatusByTagCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(bool? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWClearConversationsByTagCallback {
  IRCIMIWClearConversationsByTagCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(bool? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWCreateGroupCallback {
  IRCIMIWCreateGroupCallback({required this.onSuccess, required this.onError});

  Function(int? processCode) onSuccess;

  /// [ZH]
  /// ---
  /// 当失败时被调用。
  /// @param errorCode 错误码，用于失败的原因。
  /// @param errorInfo 与错误代码相关联的额外信息。
  /// ---
  /// [EN]
  /// ---
  /// Called when operation fails
  /// @param errorCode Code indicating failure reason
  /// @param errorInfo Additional error details
  /// ---
  Function(int? errorCode, String? errorInfo) onError;
}

class IRCIMIWGroupInfoUpdatedCallback {
  IRCIMIWGroupInfoUpdatedCallback({required this.onGroupInfoUpdated});

  Function(int? code, String? errorInfo) onGroupInfoUpdated;
}

class IRCIMIWGetGroupsInfoCallback {
  IRCIMIWGetGroupsInfoCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWGroupInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWKickGroupMembersCallback {
  IRCIMIWKickGroupMembersCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWJoinGroupCallback {
  IRCIMIWJoinGroupCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWQuitGroupCallback {
  IRCIMIWQuitGroupCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWDismissGroupCallback {
  IRCIMIWDismissGroupCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWTransferGroupOwnerCallback {
  IRCIMIWTransferGroupOwnerCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWGetGroupMembersCallback {
  IRCIMIWGetGroupMembersCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWGroupMemberInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetGroupMembersByRoleCallback {
  IRCIMIWGetGroupMembersByRoleCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetJoinedGroupsByRoleCallback {
  IRCIMIWGetJoinedGroupsByRoleCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetJoinedGroupsCallback {
  IRCIMIWGetJoinedGroupsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWGroupInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSetGroupRemarkCallback {
  IRCIMIWSetGroupRemarkCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWSetGroupMemberInfoCallback {
  IRCIMIWSetGroupMemberInfoCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWSearchJoinedGroupsCallback {
  IRCIMIWSearchJoinedGroupsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSearchGroupMembersCallback {
  IRCIMIWSearchGroupMembersCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWAddGroupManagersCallback {
  IRCIMIWAddGroupManagersCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWRemoveGroupManagersCallback {
  IRCIMIWRemoveGroupManagersCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWInviteUsersToGroupCallback {
  IRCIMIWInviteUsersToGroupCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWAcceptGroupInviteCallback {
  IRCIMIWAcceptGroupInviteCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWRefuseGroupInviteCallback {
  IRCIMIWRefuseGroupInviteCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWAcceptGroupApplicationCallback {
  IRCIMIWAcceptGroupApplicationCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(int? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWRefuseGroupApplicationCallback {
  IRCIMIWRefuseGroupApplicationCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWGetGroupApplicationsCallback {
  IRCIMIWGetGroupApplicationsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWAddGroupFollowsCallback {
  IRCIMIWAddGroupFollowsCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWRemoveGroupFollowsCallback {
  IRCIMIWRemoveGroupFollowsCallback({required this.onCompleted});

  /// [ZH]
  /// ---
  /// 接口调用结果，code 非 0 时为失败
  /// ---
  /// [EN]
  /// ---
  /// API call result. Non-zero code means failure
  /// ---
  Function(int? code) onCompleted;
}

class IRCIMIWGetGroupFollowsCallback {
  IRCIMIWGetGroupFollowsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWFollowInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWTranslateResponseCallback {
  IRCIMIWTranslateResponseCallback({required this.onTranslateResponse});

  Function(int? code) onTranslateResponse;
}

class IRCIMIWTranslateGetLanguageCallback {
  IRCIMIWTranslateGetLanguageCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(String? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetAutoTranslateEnabledCallback {
  IRCIMIWGetAutoTranslateEnabledCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(bool? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWUpdateMyUserProfileVisibilityCallback {
  IRCIMIWUpdateMyUserProfileVisibilityCallback({required this.onSuccess, required this.onError});

  Function() onSuccess;
  Function(int? errorCode) onError;
}

class IRCIMIWGetMyUserProfileVisibilityCallback {
  IRCIMIWGetMyUserProfileVisibilityCallback({required this.onSuccess, required this.onError});

  Function(int? visibility) onSuccess;
  Function(int? errorCode) onError;
}

class IRCIMIWUpdateMyUserProfileCallback {
  IRCIMIWUpdateMyUserProfileCallback({required this.onSuccess, required this.onError});

  Function() onSuccess;
  Function(int? errorCode, List<String>? errorKeys) onError;
}

class IRCIMIWGetMyUserProfileCallback {
  IRCIMIWGetMyUserProfileCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWUserProfile? userProfile) onSuccess;
  Function(int? errorCode) onError;
}

class IRCIMIWGetUserProfilesCallback {
  IRCIMIWGetUserProfilesCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWUserProfile>? userProfiles) onSuccess;
  Function(int? errorCode) onError;
}

class IRCIMIWSearchUserProfileByUniqueIdCallback {
  IRCIMIWSearchUserProfileByUniqueIdCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWUserProfile? userProfile) onSuccess;
  Function(int? errorCode) onError;
}

class IRCIMIWSubscribeEventCallback {
  IRCIMIWSubscribeEventCallback({required this.onSuccess, required this.onError});

  Function() onSuccess;
  Function(int? code, List<String>? failedUserIds) onError;
}

class IRCIMIWQuerySubscribeEventCallback {
  IRCIMIWQuerySubscribeEventCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWSubscribeInfoEvent>? events) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWOperationCallback {
  IRCIMIWOperationCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 操作成功回调
  /// ---
  /// [EN]
  /// ---
  /// Operation succeeded callback
  /// ---
  Function() onSuccess;

  /// [ZH]
  /// ---
  /// 操作失败回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Operation failed callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWAddFriendCallback {
  IRCIMIWAddFriendCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 添加请求的处理码
  /// - processCode 添加请求的处理码
  /// ---
  /// [EN]
  /// ---
  /// Process code returned by add friend request
  /// - processCode Process code returned by add friend request
  /// ---
  Function(int? processCode) onSuccess;

  /// [ZH]
  /// ---
  /// 错误码
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error code
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSetFriendInfoCallback {
  IRCIMIWSetFriendInfoCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 操作成功
  /// ---
  /// [EN]
  /// ---
  /// Operation succeeded
  /// ---
  Function() onSuccess;

  /// [ZH]
  /// ---
  /// 操作失败及失败键列表
  /// - code 错误码
  /// - errorKeys 失败的键列表
  /// ---
  /// [EN]
  /// ---
  /// Operation failed with error code and keys
  /// - code Error code
  /// - errorKeys Keys that failed to update
  /// ---
  Function(int? code, List<String>? errorKeys) onError;
}

class IRCIMIWCheckFriendsRelationCallback {
  IRCIMIWCheckFriendsRelationCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWFriendRelationInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetFriendsCallback {
  IRCIMIWGetFriendsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWFriendInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetFriendApplicationsCallback {
  IRCIMIWGetFriendApplicationsCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWPagingQueryResult<RCIMIWFriendApplicationInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetFriendsInfoCallback {
  IRCIMIWGetFriendsInfoCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWFriendInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWSearchFriendsInfoCallback {
  IRCIMIWSearchFriendsInfoCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(List<RCIMIWFriendInfo>? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class IRCIMIWGetFriendAllowTypeCallback {
  IRCIMIWGetFriendAllowTypeCallback({required this.onSuccess, required this.onError});

  /// [ZH]
  /// ---
  /// 成功回调
  /// - t 返回对象
  /// ---
  /// [EN]
  /// ---
  /// Success callback
  /// - t Returned object
  /// ---
  Function(RCIMIWFriendAllowType? t) onSuccess;

  /// [ZH]
  /// ---
  /// 错误回调
  /// - code 错误码
  /// ---
  /// [EN]
  /// ---
  /// Error callback
  /// - code Error code
  /// ---
  Function(int? code) onError;
}

class RCIMIWConnectCallback {
  RCIMIWConnectCallback({this.onDatabaseOpened, required this.onConnected});

  /// [ZH]
  /// ---
  /// 数据库打开回调
  /// @param code 连接状态码
  /// ---
  /// [EN]
  /// ---
  /// Database Open Callback
  /// @param code Indicates the connection status code.
  /// ---
  Function(int? code)? onDatabaseOpened;

  /// [ZH]
  /// ---
  /// 连接回调
  /// @param code 连接状态码
  /// @param userId 用户ID
  /// ---
  /// [EN]
  /// ---
  /// Connection Callback
  /// @param code Connection status code
  /// @param userId User ID
  /// ---
  Function(int? code, String? userId) onConnected;
}

class RCIMIWSendMessageCallback {
  RCIMIWSendMessageCallback({this.onMessageSaved, required this.onMessageSent});

  /// [ZH]
  /// ---
  /// 消息保存到本地数据库的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for saving messages to the local database
  /// @param message The message
  /// ---
  Function(RCIMIWMessage? message)? onMessageSaved;

  /// [ZH]
  /// ---
  /// 消息发送成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback triggered when a message is sent successfully
  /// @param code Status code
  /// @param message Message
  /// ---
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}

class RCIMIWSendMediaMessageListener {
  RCIMIWSendMediaMessageListener({
    this.onMediaMessageSaved,
    this.onMediaMessageSending,
    this.onSendingMediaMessageCanceled,
    required this.onMediaMessageSent,
  });

  /// [ZH]
  /// ---
  /// 消息保存到本地数据库的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for saving messages to the local database
  /// @param message The message
  /// ---
  Function(RCIMIWMediaMessage? message)? onMediaMessageSaved;

  /// [ZH]
  /// ---
  /// 消息发送中的回调
  /// @param message 消息
  /// @param progress 进度
  /// ---
  /// [EN]
  /// ---
  /// Callback for sending messages
  /// @param message The message
  /// @param progress The progress
  /// ---
  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageSending;

  /// [ZH]
  /// ---
  /// 取消发送消息的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for canceling message sending
  /// @param message The message
  /// ---
  Function(RCIMIWMediaMessage? message)? onSendingMediaMessageCanceled;

  /// [ZH]
  /// ---
  /// 消息发送成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for successful message sending
  /// @param code Status code
  /// @param message Message
  /// ---
  Function(int? code, RCIMIWMediaMessage? message) onMediaMessageSent;
}

class RCIMIWDownloadMediaMessageListener {
  RCIMIWDownloadMediaMessageListener({
    this.onMediaMessageDownloading,
    this.onDownloadingMediaMessageCanceled,
    required this.onMediaMessageDownloaded,
  });

  /// [ZH]
  /// ---
  /// 消息下载中的回调
  /// @param message 消息
  /// @param progress 进度
  /// ---
  /// [EN]
  /// ---
  /// Callback for downloading messages
  /// @param message The message
  /// @param progress The progress
  /// ---
  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageDownloading;

  /// [ZH]
  /// ---
  /// 取消下载消息的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for canceling message downloading
  /// @param message The message
  /// ---
  Function(RCIMIWMediaMessage? message)? onDownloadingMediaMessageCanceled;

  /// [ZH]
  /// ---
  /// 消息下载成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for successful message downloading
  /// @param code Status code
  /// @param message The message
  /// ---
  Function(int? code, RCIMIWMediaMessage? message) onMediaMessageDownloaded;
}

class RCIMIWSendGroupMessageToDesignatedUsersCallback {
  RCIMIWSendGroupMessageToDesignatedUsersCallback({this.onMessageSaved, required this.onMessageSent});

  /// [ZH]
  /// ---
  /// 消息保存到本地数据库的回调
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for saving messages to the local database
  /// @param message The message
  /// ---
  Function(RCIMIWMessage? message)? onMessageSaved;

  /// [ZH]
  /// ---
  /// 消息发送成功的回调
  /// @param code 状态码
  /// @param message 消息
  /// ---
  /// [EN]
  /// ---
  /// Callback triggered when a message is sent successfully
  /// @param code Status code
  /// @param message Message
  /// ---
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}
