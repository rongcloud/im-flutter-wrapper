import 'dart:convert';
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';

class IMEngineManager {
  static late final IMEngineManager _instance = IMEngineManager._internal();
  RCIMIWEngine? engine;
  IMEngineManager._internal();
  factory IMEngineManager() => _instance;

  setEngineListener() {
    engine?.onMessageReceived = (
      RCIMIWMessage? message,
      int? left,
      bool? offline,
      bool? hasPackage,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageReceived";
      arg["message"] = formatJson(message?.toJson());
      arg["left"] = left.toString();
      arg["offline"] = offline.toString();
      arg["hasPackage"] = hasPackage.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConnectionStatusChanged = (
      RCIMIWConnectionStatus? status,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConnectionStatusChanged";
      arg["status"] = status.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationTopStatusSynced = (
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      bool? top,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationTopStatusSynced";
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["top"] = top.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onRemoteMessageRecalled = (
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onRemoteMessageRecalled";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onPrivateReadReceiptReceived = (
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onPrivateReadReceiptReceived";
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onRemoteMessageExpansionUpdated = (
      Map? expansion,
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onRemoteMessageExpansionUpdated";
      arg["expansion"] = expansion.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onRemoteMessageExpansionForKeyRemoved = (
      RCIMIWMessage? message,
      List<String>? keys,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onRemoteMessageExpansionForKeyRemoved";
      arg["message"] = formatJson(message?.toJson());
      arg["keys"] = keys.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomMemberChanged = (
      String? targetId,
      List<RCIMIWChatRoomMemberAction>? actions,
    ) {
      List actionsJson = [];
      if (actions != null) {
        for (var temp in actions) {
          actionsJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomMemberChanged";
      arg["targetId"] = targetId ?? "";
      arg["actions"] = actionsJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onTypingStatusChanged = (
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      List<RCIMIWTypingStatus>? userTypingStatus,
    ) {
      List userTypingStatusJson = [];
      if (userTypingStatus != null) {
        for (var temp in userTypingStatus) {
          userTypingStatusJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onTypingStatusChanged";
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["userTypingStatus"] = userTypingStatusJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationReadStatusSyncMessageReceived = (
      RCIMIWConversationType? type,
      String? targetId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationReadStatusSyncMessageReceived";
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomEntriesSynced = (
      String? roomId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntriesSynced";
      arg["roomId"] = roomId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomEntriesChanged = (
      RCIMIWChatRoomEntriesOperationType? operationType,
      String? roomId,
      Map? entries,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntriesChanged";
      arg["operationType"] = operationType.toString();
      arg["roomId"] = roomId ?? "";
      arg["entries"] = entries.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onRemoteUltraGroupMessageExpansionUpdated = (
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onRemoteUltraGroupMessageExpansionUpdated";
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onRemoteUltraGroupMessageModified = (
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onRemoteUltraGroupMessageModified";
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onRemoteUltraGroupMessageRecalled = (
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onRemoteUltraGroupMessageRecalled";
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupReadTimeReceived = (
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupReadTimeReceived";
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupTypingStatusChanged = (
      List<RCIMIWUltraGroupTypingStatusInfo>? info,
    ) {
      List infoJson = [];
      if (info != null) {
        for (var temp in info) {
          infoJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupTypingStatusChanged";
      arg["info"] = infoJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageBlocked = (
      RCIMIWBlockedMessageInfo? info,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageBlocked";
      arg["info"] = formatJson(info?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomStatusChanged = (
      String? targetId,
      RCIMIWChatRoomStatus? status,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomStatusChanged";
      arg["targetId"] = targetId ?? "";
      arg["status"] = status.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onGroupMessageReadReceiptRequestReceived = (
      String? targetId,
      String? messageUId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onGroupMessageReadReceiptRequestReceived";
      arg["targetId"] = targetId ?? "";
      arg["messageUId"] = messageUId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onGroupMessageReadReceiptResponseReceived = (
      String? targetId,
      String? messageUId,
      Map? respondUserIds,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onGroupMessageReadReceiptResponseReceived";
      arg["targetId"] = targetId ?? "";
      arg["messageUId"] = messageUId ?? "";
      arg["respondUserIds"] = respondUserIds.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConnected = (
      int? code,
      String? userId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConnected";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onDatabaseOpened = (
      int? code,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onDatabaseOpened";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      RCIMIWConversation? conversation,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["conversation"] = formatJson(conversation?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationsLoaded = (
      int? code,
      List<RCIMIWConversationType>? conversationTypes,
      String? channelId,
      int? startTime,
      int? count,
      List<RCIMIWConversation>? conversations,
    ) {
      List conversationsJson = [];
      if (conversations != null) {
        for (var temp in conversations) {
          conversationsJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onConversationsLoaded";
      arg["code"] = code.toString();
      arg["conversationTypes"] = conversationTypes.toString();
      arg["channelId"] = channelId ?? "";
      arg["startTime"] = startTime.toString();
      arg["count"] = count.toString();
      arg["conversations"] = conversationsJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationRemoved = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationRemoved";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationsRemoved = (
      int? code,
      List<RCIMIWConversationType>? conversationTypes,
      String? channelId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationsRemoved";
      arg["code"] = code.toString();
      arg["conversationTypes"] = conversationTypes.toString();
      arg["channelId"] = channelId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onTotalUnreadCountLoaded = (
      int? code,
      String? channelId,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onTotalUnreadCountLoaded";
      arg["code"] = code.toString();
      arg["channelId"] = channelId ?? "";
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUnreadCountLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUnreadCountLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUnreadCountByConversationTypesLoaded = (
      int? code,
      List<RCIMIWConversationType>? conversationTypes,
      String? channelId,
      bool? contain,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUnreadCountByConversationTypesLoaded";
      arg["code"] = code.toString();
      arg["conversationTypes"] = conversationTypes.toString();
      arg["channelId"] = channelId ?? "";
      arg["contain"] = contain.toString();
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUnreadMentionedCountLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUnreadMentionedCountLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupAllUnreadCountLoaded = (
      int? code,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupAllUnreadCountLoaded";
      arg["code"] = code.toString();
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupAllUnreadMentionedCountLoaded = (
      int? code,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupAllUnreadMentionedCountLoaded";
      arg["code"] = code.toString();
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUnreadCountCleared = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUnreadCountCleared";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onDraftMessageSaved = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      String? draft,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onDraftMessageSaved";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["draft"] = draft ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onDraftMessageCleared = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onDraftMessageCleared";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onDraftMessageLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      String? draft,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onDraftMessageLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["draft"] = draft ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onBlockedConversationsLoaded = (
      int? code,
      List<RCIMIWConversationType>? conversationTypes,
      String? channelId,
      List<RCIMIWConversation>? conversations,
    ) {
      List conversationsJson = [];
      if (conversations != null) {
        for (var temp in conversations) {
          conversationsJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onBlockedConversationsLoaded";
      arg["code"] = code.toString();
      arg["conversationTypes"] = conversationTypes.toString();
      arg["channelId"] = channelId ?? "";
      arg["conversations"] = conversationsJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationTopStatusChanged = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      bool? top,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationTopStatusChanged";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["top"] = top.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationTopStatusLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      bool? top,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationTopStatusLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["top"] = top.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationReadStatusSynced = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationReadStatusSynced";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageAttached = (
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageAttached";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageSent = (
      int? code,
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageSent";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMediaMessageAttached = (
      RCIMIWMediaMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMediaMessageAttached";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMediaMessageSending = (
      RCIMIWMediaMessage? message,
      int? progress,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMediaMessageSending";
      arg["message"] = formatJson(message?.toJson());
      arg["progress"] = progress.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onSendingMediaMessageCanceled = (
      int? code,
      RCIMIWMediaMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onSendingMediaMessageCanceled";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMediaMessageSent = (
      int? code,
      RCIMIWMediaMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMediaMessageSent";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMediaMessageDownloading = (
      RCIMIWMediaMessage? message,
      int? progress,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMediaMessageDownloading";
      arg["message"] = formatJson(message?.toJson());
      arg["progress"] = progress.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMediaMessageDownloaded = (
      int? code,
      RCIMIWMediaMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMediaMessageDownloaded";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onDownloadingMediaMessageCanceled = (
      int? code,
      RCIMIWMediaMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onDownloadingMediaMessageCanceled";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessagesLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? sentTime,
      RCIMIWTimeOrder? order,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onMessagesLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["sentTime"] = sentTime.toString();
      arg["order"] = order.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUnreadMentionedMessagesLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onUnreadMentionedMessagesLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onFirstUnreadMessageLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onFirstUnreadMessageLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageInserted = (
      int? code,
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageInserted";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessagesInserted = (
      int? code,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onMessagesInserted";
      arg["code"] = code.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageCleared = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageCleared";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onLocalMessagesDeleted = (
      int? code,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onLocalMessagesDeleted";
      arg["code"] = code.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessagesDeleted = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onMessagesDeleted";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageRecalled = (
      int? code,
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageRecalled";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onPrivateReadReceiptMessageSent = (
      int? code,
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onPrivateReadReceiptMessageSent";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageExpansionUpdated = (
      int? code,
      String? messageUId,
      Map? expansion,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageExpansionUpdated";
      arg["code"] = code.toString();
      arg["messageUId"] = messageUId ?? "";
      arg["expansion"] = expansion.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageExpansionForKeysRemoved = (
      int? code,
      String? messageUId,
      List<String>? keys,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageExpansionForKeysRemoved";
      arg["code"] = code.toString();
      arg["messageUId"] = messageUId ?? "";
      arg["keys"] = keys.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageReceiveStatusChanged = (
      int? code,
      int? messageId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageReceiveStatusChanged";
      arg["code"] = code.toString();
      arg["messageId"] = messageId.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageSentStatusChanged = (
      int? code,
      int? messageId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageSentStatusChanged";
      arg["code"] = code.toString();
      arg["messageId"] = messageId.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomJoined = (
      int? code,
      String? targetId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomJoined";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomJoining = (
      String? targetId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomJoining";
      arg["targetId"] = targetId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomLeft = (
      int? code,
      String? targetId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomLeft";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomMessagesLoaded = (
      int? code,
      String? targetId,
      List<RCIMIWMessage>? messages,
      int? syncTime,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomMessagesLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["messages"] = messagesJson.toString();
      arg["syncTime"] = syncTime.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomEntryAdded = (
      int? code,
      String? targetId,
      String? key,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntryAdded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["key"] = key ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomEntriesAdded = (
      int? code,
      String? targetId,
      Map? entries,
      Map? errorEntries,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntriesAdded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["entries"] = entries.toString();
      arg["errorEntries"] = errorEntries.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomEntryLoaded = (
      int? code,
      String? targetId,
      Map? entry,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntryLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["entry"] = entry.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onAllChatRoomEntriesLoaded = (
      int? code,
      String? targetId,
      Map? entries,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onAllChatRoomEntriesLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["entries"] = entries.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomEntryRemoved = (
      int? code,
      String? targetId,
      String? key,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntryRemoved";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["key"] = key ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onChatRoomEntriesRemoved = (
      int? code,
      String? targetId,
      List<String>? keys,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntriesRemoved";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["keys"] = keys.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onBlacklistAdded = (
      int? code,
      String? userId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onBlacklistAdded";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onBlacklistRemoved = (
      int? code,
      String? userId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onBlacklistRemoved";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onBlacklistStatusLoaded = (
      int? code,
      String? userId,
      RCIMIWBlacklistStatus? status,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onBlacklistStatusLoaded";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";
      arg["status"] = status.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onBlacklistLoaded = (
      int? code,
      List<String>? userIds,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onBlacklistLoaded";
      arg["code"] = code.toString();
      arg["userIds"] = userIds.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessagesSearched = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      String? keyword,
      int? startTime,
      int? count,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onMessagesSearched";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["keyword"] = keyword ?? "";
      arg["startTime"] = startTime.toString();
      arg["count"] = count.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessagesSearchedByTimeRange = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      String? keyword,
      int? startTime,
      int? endTime,
      int? offset,
      int? count,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onMessagesSearchedByTimeRange";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["keyword"] = keyword ?? "";
      arg["startTime"] = startTime.toString();
      arg["endTime"] = endTime.toString();
      arg["offset"] = offset.toString();
      arg["count"] = count.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessagesSearchedByUserId = (
      int? code,
      String? userId,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? startTime,
      int? count,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onMessagesSearchedByUserId";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["startTime"] = startTime.toString();
      arg["count"] = count.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationsSearched = (
      int? code,
      List<RCIMIWConversationType>? conversationTypes,
      String? channelId,
      List<RCIMIWMessageType>? messageTypes,
      String? keyword,
      List<RCIMIWSearchConversationResult>? conversations,
    ) {
      List conversationsJson = [];
      if (conversations != null) {
        for (var temp in conversations) {
          conversationsJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onConversationsSearched";
      arg["code"] = code.toString();
      arg["conversationTypes"] = conversationTypes.toString();
      arg["channelId"] = channelId ?? "";
      arg["messageTypes"] = messageTypes.toString();
      arg["keyword"] = keyword ?? "";
      arg["conversations"] = conversationsJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onGroupReadReceiptRequestSent = (
      int? code,
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onGroupReadReceiptRequestSent";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onGroupReadReceiptResponseSent = (
      int? code,
      String? targetId,
      String? channelId,
      List<RCIMIWMessage>? messages,
    ) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onGroupReadReceiptResponseSent";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onNotificationQuietHoursChanged = (
      int? code,
      String? startTime,
      int? spanMins,
      RCIMIWPushNotificationQuietHoursLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onNotificationQuietHoursChanged";
      arg["code"] = code.toString();
      arg["startTime"] = startTime ?? "";
      arg["spanMins"] = spanMins.toString();
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onNotificationQuietHoursRemoved = (
      int? code,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onNotificationQuietHoursRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onNotificationQuietHoursLoaded = (
      int? code,
      String? startTime,
      int? spanMins,
      RCIMIWPushNotificationQuietHoursLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onNotificationQuietHoursLoaded";
      arg["code"] = code.toString();
      arg["startTime"] = startTime ?? "";
      arg["spanMins"] = spanMins.toString();
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationNotificationLevelChanged = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationNotificationLevelChanged";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationNotificationLevelLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationNotificationLevelLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationTypeNotificationLevelChanged = (
      int? code,
      RCIMIWConversationType? type,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationTypeNotificationLevelChanged";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationTypeNotificationLevelLoaded = (
      int? code,
      RCIMIWConversationType? type,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConversationTypeNotificationLevelLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupDefaultNotificationLevelChanged = (
      int? code,
      String? targetId,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupDefaultNotificationLevelChanged";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupDefaultNotificationLevelLoaded = (
      int? code,
      String? targetId,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupDefaultNotificationLevelLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupChannelDefaultNotificationLevelChanged = (
      int? code,
      String? targetId,
      String? channelId,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupChannelDefaultNotificationLevelChanged";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupChannelDefaultNotificationLevelLoaded = (
      int? code,
      String? targetId,
      String? channelId,
      RCIMIWPushNotificationLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupChannelDefaultNotificationLevelLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onPushContentShowStatusChanged = (
      int? code,
      bool? showContent,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onPushContentShowStatusChanged";
      arg["code"] = code.toString();
      arg["showContent"] = showContent.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onPushLanguageChanged = (
      int? code,
      String? language,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onPushLanguageChanged";
      arg["code"] = code.toString();
      arg["language"] = language ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onPushReceiveStatusChanged = (
      int? code,
      bool? receive,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onPushReceiveStatusChanged";
      arg["code"] = code.toString();
      arg["receive"] = receive.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onMessageCountLoaded = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageCountLoaded";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onTopConversationsLoaded = (
      int? code,
      List<RCIMIWConversationType>? conversationTypes,
      String? channelId,
      List<RCIMIWConversation>? conversations,
    ) {
      List conversationsJson = [];
      if (conversations != null) {
        for (var temp in conversations) {
          conversationsJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onTopConversationsLoaded";
      arg["code"] = code.toString();
      arg["conversationTypes"] = conversationTypes.toString();
      arg["channelId"] = channelId ?? "";
      arg["conversations"] = conversationsJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onGroupMessageToDesignatedUsersAttached = (
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onGroupMessageToDesignatedUsersAttached";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onGroupMessageToDesignatedUsersSent = (
      int? code,
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onGroupMessageToDesignatedUsersSent";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupReadStatusSynced = (
      int? code,
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupReadStatusSynced";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onConversationsLoadedForAllChannel = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      List<RCIMIWConversation>? conversations,
    ) {
      List conversationsJson = [];
      if (conversations != null) {
        for (var temp in conversations) {
          conversationsJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onConversationsLoadedForAllChannel";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["conversations"] = conversationsJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupUnreadMentionedCountLoaded = (
      int? code,
      String? targetId,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupUnreadMentionedCountLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupUnreadCountLoaded = (
      int? code,
      String? targetId,
      int? count,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupUnreadCountLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["count"] = count.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupMessageModified = (
      int? code,
      String? messageUId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupMessageModified";
      arg["code"] = code.toString();
      arg["messageUId"] = messageUId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupMessageRecalled = (
      int? code,
      RCIMIWMessage? message,
      bool? deleteRemote,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupMessageRecalled";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());
      arg["deleteRemote"] = deleteRemote.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupMessagesCleared = (
      int? code,
      String? targetId,
      String? channelId,
      int? timestamp,
      RCIMIWMessageOperationPolicy? policy,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupMessagesCleared";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();
      arg["policy"] = policy.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupMessagesClearedForAllChannel = (
      int? code,
      String? targetId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupMessagesClearedForAllChannel";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupTypingStatusSent = (
      int? code,
      String? targetId,
      String? channelId,
      RCIMIWUltraGroupTypingStatus? typingStatus,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupTypingStatusSent";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["typingStatus"] = typingStatus.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onBatchRemoteUltraGroupMessagesLoaded = (
      int? code,
      List<RCIMIWMessage>? matchedMessages,
      List<RCIMIWMessage>? notMatchedMessages,
    ) {
      List matchedMessagesJson = [];
      if (matchedMessages != null) {
        for (var temp in matchedMessages) {
          matchedMessagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      List notMatchedMessagesJson = [];
      if (notMatchedMessages != null) {
        for (var temp in notMatchedMessages) {
          notMatchedMessagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "onBatchRemoteUltraGroupMessagesLoaded";
      arg["code"] = code.toString();
      arg["matchedMessages"] = matchedMessagesJson.toString();
      arg["notMatchedMessages"] = notMatchedMessagesJson.toString();

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupMessageExpansionUpdated = (
      int? code,
      Map? expansion,
      String? messageUId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupMessageExpansionUpdated";
      arg["code"] = code.toString();
      arg["expansion"] = expansion.toString();
      arg["messageUId"] = messageUId ?? "";

      bus.emit("rong_im_listener", arg);
    };

    engine?.onUltraGroupMessageExpansionRemoved = (
      int? code,
      String? messageUId,
      List<String>? keys,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupMessageExpansionRemoved";
      arg["code"] = code.toString();
      arg["messageUId"] = messageUId ?? "";
      arg["keys"] = keys.toString();

      bus.emit("rong_im_listener", arg);
    };
  }

  String formatJson(jsonObject) {
    if (jsonObject == null) {
      return "";
    }
    const JsonEncoder encoder = JsonEncoder.withIndent('    ');
    return encoder.convert(jsonObject);
  }
}
