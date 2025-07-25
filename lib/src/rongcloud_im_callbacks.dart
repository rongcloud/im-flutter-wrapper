import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

class IRCIMIWConnectCallback {
  IRCIMIWConnectCallback({required this.onConnected, required this.onDatabaseOpened});

  Function(int? code, String? userId) onConnected;
  Function(int? code) onDatabaseOpened;
}

class IRCIMIWSendMessageCallback {
  IRCIMIWSendMessageCallback({required this.onMessageSaved, required this.onMessageSent});

  Function(RCIMIWMessage? message) onMessageSaved;
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}

class IRCIMIWSendMediaMessageListener {
  IRCIMIWSendMediaMessageListener({
    required this.onMediaMessageSaved,
    required this.onMediaMessageSending,
    required this.onSendingMediaMessageCanceled,
    required this.onMediaMessageSent,
  });

  Function(RCIMIWMediaMessage? message) onMediaMessageSaved;
  Function(RCIMIWMediaMessage? message, int? progress) onMediaMessageSending;
  Function(RCIMIWMediaMessage? message) onSendingMediaMessageCanceled;
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

  Function(RCIMIWMediaMessage? message, int? progress) onMediaMessageDownloading;
  Function(RCIMIWMediaMessage? message) onDownloadingMediaMessageCanceled;
  Function(int? code, RCIMIWMediaMessage? message) onMediaMessageDownloaded;
}

class IRCIMIWCancelDownloadingMediaMessageCallback {
  IRCIMIWCancelDownloadingMediaMessageCallback({required this.onCancelDownloadingMediaMessageCalled});

  Function(int? code, RCIMIWMediaMessage? message) onCancelDownloadingMediaMessageCalled;
}

class IRCIMIWGetConversationCallback {
  IRCIMIWGetConversationCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWConversation? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWObjectCallback<T> {
  IRCIMIWObjectCallback({required this.onSuccess, required this.onError});

  Function(T? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetConversationsCallback {
  IRCIMIWGetConversationsCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWConversation>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUnreadConversationsCallback {
  IRCIMIWGetUnreadConversationsCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWConversation>? t) onSuccess;
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

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetTotalUnreadCountCallback {
  IRCIMIWGetTotalUnreadCountCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUnreadMentionedCountCallback {
  IRCIMIWGetUnreadMentionedCountCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupAllUnreadCountCallback {
  IRCIMIWGetUltraGroupAllUnreadCountCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback {
  IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupUnreadCountCallback {
  IRCIMIWGetUltraGroupUnreadCountCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUltraGroupUnreadMentionedCountCallback {
  IRCIMIWGetUltraGroupUnreadMentionedCountCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUnreadCountByConversationTypesCallback {
  IRCIMIWGetUnreadCountByConversationTypesCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUnreadCountByLevelsCallback {
  IRCIMIWGetUnreadCountByLevelsCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
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

  Function(String? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWClearDraftMessageCallback {
  IRCIMIWClearDraftMessageCallback({required this.onDraftMessageCleared});

  Function(int? code) onDraftMessageCleared;
}

class IRCIMIWGetBlockedConversationsCallback {
  IRCIMIWGetBlockedConversationsCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWConversation>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWChangeConversationTopStatusCallback {
  IRCIMIWChangeConversationTopStatusCallback({required this.onConversationTopStatusChanged});

  Function(int? code) onConversationTopStatusChanged;
}

class IRCIMIWGetConversationTopStatusCallback {
  IRCIMIWGetConversationTopStatusCallback({required this.onSuccess, required this.onError});

  Function(bool? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSyncConversationReadStatusCallback {
  IRCIMIWSyncConversationReadStatusCallback({required this.onConversationReadStatusSynced});

  Function(int? code) onConversationReadStatusSynced;
}

class IRCIMIWGetMessagesCallback {
  IRCIMIWGetMessagesCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetMessageCallback {
  IRCIMIWGetMessageCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWMessage? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetMessagesAroundTimeCallback {
  IRCIMIWGetMessagesAroundTimeCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetFirstUnreadMessageCallback {
  IRCIMIWGetFirstUnreadMessageCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWMessage? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetUnreadMentionedMessagesCallback {
  IRCIMIWGetUnreadMentionedMessagesCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? t) onSuccess;
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

  Function(int? code) onCompleted;
}

class IRCIMIWCompletionCallback {
  IRCIMIWCompletionCallback({required this.onCompleted});

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

  Function(List<RCIMIWMessage>? t) onSuccess;
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

  Function(Map? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetChatRoomAllEntriesCallback {
  IRCIMIWGetChatRoomAllEntriesCallback({required this.onSuccess, required this.onError});

  Function(Map? t) onSuccess;
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

  Function(RCIMIWBlacklistStatus? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetBlacklistCallback {
  IRCIMIWGetBlacklistCallback({required this.onSuccess, required this.onError});

  Function(List<String>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesCallback {
  IRCIMIWSearchMessagesCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesByTimeRangeCallback {
  IRCIMIWSearchMessagesByTimeRangeCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesByUserIdCallback {
  IRCIMIWSearchMessagesByUserIdCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSearchMessagesByMessageTypesCallback {
  IRCIMIWSearchMessagesByMessageTypesCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWMessage>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSearchConversationsCallback {
  IRCIMIWSearchConversationsCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWSearchConversationResult>? t) onSuccess;
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

  Function(RCIMIWPushNotificationLevel? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWChangeConversationTypeNotificationLevelCallback {
  IRCIMIWChangeConversationTypeNotificationLevelCallback({required this.onConversationTypeNotificationLevelChanged});

  Function(int? code) onConversationTypeNotificationLevelChanged;
}

class IRCIMIWGetConversationTypeNotificationLevelCallback {
  IRCIMIWGetConversationTypeNotificationLevelCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWPushNotificationLevel? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback {
  IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback({required this.onUltraGroupDefaultNotificationLevelChanged});

  Function(int? code) onUltraGroupDefaultNotificationLevelChanged;
}

class IRCIMIWGetUltraGroupDefaultNotificationLevelCallback {
  IRCIMIWGetUltraGroupDefaultNotificationLevelCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWPushNotificationLevel? t) onSuccess;
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

  Function(RCIMIWPushNotificationLevel? t) onSuccess;
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

  Function(RCIMIWMessage? message) onMessageSaved;
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}

class IRCIMIWGetMessageCountCallback {
  IRCIMIWGetMessageCountCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetTopConversationsCallback {
  IRCIMIWGetTopConversationsCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWConversation>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSyncUltraGroupReadStatusCallback {
  IRCIMIWSyncUltraGroupReadStatusCallback({required this.onUltraGroupReadStatusSynced});

  Function(int? code) onUltraGroupReadStatusSynced;
}

class IRCIMIWGetConversationsForAllChannelCallback {
  IRCIMIWGetConversationsForAllChannelCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWConversation>? t) onSuccess;
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

  Function(List<RCIMIWTagInfo>? t) onSuccess;
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

  Function(List<RCIMIWConversationTagInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWChangeConversationTopStatusInTagCallback {
  IRCIMIWChangeConversationTopStatusInTagCallback({required this.onConversationTopStatusInTagChanged});

  Function(int? code) onConversationTopStatusInTagChanged;
}

class IRCIMIWGetConversationTopStatusInTagCallback {
  IRCIMIWGetConversationTopStatusInTagCallback({required this.onSuccess, required this.onError});

  Function(bool? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWClearMessagesUnreadStatusByTagCallback {
  IRCIMIWClearMessagesUnreadStatusByTagCallback({required this.onSuccess, required this.onError});

  Function(bool? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWClearConversationsByTagCallback {
  IRCIMIWClearConversationsByTagCallback({required this.onSuccess, required this.onError});

  Function(bool? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWCreateGroupCallback {
  IRCIMIWCreateGroupCallback({required this.onSuccess, required this.onError});

  Function(int? processCode) onSuccess;
  Function(int? errorCode, String? errorInfo) onError;
}

class IRCIMIWGroupInfoUpdatedCallback {
  IRCIMIWGroupInfoUpdatedCallback({required this.onGroupInfoUpdated});

  Function(int? code, String? errorInfo) onGroupInfoUpdated;
}

class IRCIMIWGetGroupsInfoCallback {
  IRCIMIWGetGroupsInfoCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWGroupInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWKickGroupMembersCallback {
  IRCIMIWKickGroupMembersCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWJoinGroupCallback {
  IRCIMIWJoinGroupCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWQuitGroupCallback {
  IRCIMIWQuitGroupCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWDismissGroupCallback {
  IRCIMIWDismissGroupCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWTransferGroupOwnerCallback {
  IRCIMIWTransferGroupOwnerCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWGetGroupMembersCallback {
  IRCIMIWGetGroupMembersCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWGroupMemberInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetGroupMembersByRoleCallback {
  IRCIMIWGetGroupMembersByRoleCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetJoinedGroupsByRoleCallback {
  IRCIMIWGetJoinedGroupsByRoleCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetJoinedGroupsCallback {
  IRCIMIWGetJoinedGroupsCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWGroupInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSetGroupRemarkCallback {
  IRCIMIWSetGroupRemarkCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWSetGroupMemberInfoCallback {
  IRCIMIWSetGroupMemberInfoCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWSearchJoinedGroupsCallback {
  IRCIMIWSearchJoinedGroupsCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWSearchGroupMembersCallback {
  IRCIMIWSearchGroupMembersCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWAddGroupManagersCallback {
  IRCIMIWAddGroupManagersCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWRemoveGroupManagersCallback {
  IRCIMIWRemoveGroupManagersCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWInviteUsersToGroupCallback {
  IRCIMIWInviteUsersToGroupCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWAcceptGroupInviteCallback {
  IRCIMIWAcceptGroupInviteCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWRefuseGroupInviteCallback {
  IRCIMIWRefuseGroupInviteCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWAcceptGroupApplicationCallback {
  IRCIMIWAcceptGroupApplicationCallback({required this.onSuccess, required this.onError});

  Function(int? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWRefuseGroupApplicationCallback {
  IRCIMIWRefuseGroupApplicationCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWGetGroupApplicationsCallback {
  IRCIMIWGetGroupApplicationsCallback({required this.onSuccess, required this.onError});

  Function(RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWAddGroupFollowsCallback {
  IRCIMIWAddGroupFollowsCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWRemoveGroupFollowsCallback {
  IRCIMIWRemoveGroupFollowsCallback({required this.onCompleted});

  Function(int? code) onCompleted;
}

class IRCIMIWGetGroupFollowsCallback {
  IRCIMIWGetGroupFollowsCallback({required this.onSuccess, required this.onError});

  Function(List<RCIMIWFollowInfo>? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWTranslateResponseCallback {
  IRCIMIWTranslateResponseCallback({required this.onTranslateResponse});

  Function(int? code) onTranslateResponse;
}

class IRCIMIWTranslateGetLanguageCallback {
  IRCIMIWTranslateGetLanguageCallback({required this.onSuccess, required this.onError});

  Function(String? t) onSuccess;
  Function(int? code) onError;
}

class IRCIMIWGetAutoTranslateEnabledCallback {
  IRCIMIWGetAutoTranslateEnabledCallback({required this.onSuccess, required this.onError});

  Function(bool? t) onSuccess;
  Function(int? code) onError;
}

class RCIMIWConnectCallback {
  RCIMIWConnectCallback({this.onDatabaseOpened, required this.onConnected});

  Function(int? code)? onDatabaseOpened;
  Function(int? code, String? userId) onConnected;
}

class RCIMIWSendMessageCallback {
  RCIMIWSendMessageCallback({this.onMessageSaved, required this.onMessageSent});

  Function(RCIMIWMessage? message)? onMessageSaved;
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}

class RCIMIWSendMediaMessageListener {
  RCIMIWSendMediaMessageListener({
    this.onMediaMessageSaved,
    this.onMediaMessageSending,
    this.onSendingMediaMessageCanceled,
    required this.onMediaMessageSent,
  });

  Function(RCIMIWMediaMessage? message)? onMediaMessageSaved;
  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageSending;
  Function(RCIMIWMediaMessage? message)? onSendingMediaMessageCanceled;
  Function(int? code, RCIMIWMediaMessage? message) onMediaMessageSent;
}

class RCIMIWDownloadMediaMessageListener {
  RCIMIWDownloadMediaMessageListener({
    this.onMediaMessageDownloading,
    this.onDownloadingMediaMessageCanceled,
    required this.onMediaMessageDownloaded,
  });

  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageDownloading;
  Function(RCIMIWMediaMessage? message)? onDownloadingMediaMessageCanceled;
  Function(int? code, RCIMIWMediaMessage? message) onMediaMessageDownloaded;
}

class RCIMIWSendGroupMessageToDesignatedUsersCallback {
  RCIMIWSendGroupMessageToDesignatedUsersCallback({this.onMessageSaved, required this.onMessageSent});

  Function(RCIMIWMessage? message)? onMessageSaved;
  Function(int? code, RCIMIWMessage? message) onMessageSent;
}
