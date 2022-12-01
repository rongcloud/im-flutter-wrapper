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
/*
//callback_onMessageReceived_call
engine?.onMessageReceived = (RCIMIWMessage? message,int? left,bool? offline,bool? hasPackage,) {
    //...
};
//callback_onMessageReceived_call
*/

    engine?.onConnectionStatusChanged = (
      RCIMIWConnectionStatus? status,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onConnectionStatusChanged";
      arg["status"] = status.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onConnectionStatusChanged_call
engine?.onConnectionStatusChanged = (RCIMIWConnectionStatus? status,) {
    //...
};
//callback_onConnectionStatusChanged_call
*/

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
/*
//callback_onConversationTopStatusSynced_call
engine?.onConversationTopStatusSynced = (RCIMIWConversationType? type,String? targetId,String? channelId,bool? top,) {
    //...
};
//callback_onConversationTopStatusSynced_call
*/

    engine?.onRemoteMessageRecalled = (
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onRemoteMessageRecalled";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onRemoteMessageRecalled_call
engine?.onRemoteMessageRecalled = (RCIMIWMessage? message,) {
    //...
};
//callback_onRemoteMessageRecalled_call
*/

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
/*
//callback_onPrivateReadReceiptReceived_call
engine?.onPrivateReadReceiptReceived = (String? targetId,String? channelId,int? timestamp,) {
    //...
};
//callback_onPrivateReadReceiptReceived_call
*/

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
/*
//callback_onRemoteMessageExpansionUpdated_call
engine?.onRemoteMessageExpansionUpdated = (Map? expansion,RCIMIWMessage? message,) {
    //...
};
//callback_onRemoteMessageExpansionUpdated_call
*/

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
/*
//callback_onRemoteMessageExpansionForKeyRemoved_call
engine?.onRemoteMessageExpansionForKeyRemoved = (RCIMIWMessage? message,List<String>? keys,) {
    //...
};
//callback_onRemoteMessageExpansionForKeyRemoved_call
*/

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
/*
//callback_onChatRoomMemberChanged_call
engine?.onChatRoomMemberChanged = (String? targetId,List<RCIMIWChatRoomMemberAction>? actions,) {
    //...
};
//callback_onChatRoomMemberChanged_call
*/

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
/*
//callback_onTypingStatusChanged_call
engine?.onTypingStatusChanged = (RCIMIWConversationType? type,String? targetId,String? channelId,List<RCIMIWTypingStatus>? userTypingStatus,) {
    //...
};
//callback_onTypingStatusChanged_call
*/

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
/*
//callback_onConversationReadStatusSyncMessageReceived_call
engine?.onConversationReadStatusSyncMessageReceived = (RCIMIWConversationType? type,String? targetId,int? timestamp,) {
    //...
};
//callback_onConversationReadStatusSyncMessageReceived_call
*/

    engine?.onChatRoomEntriesSynced = (
      String? roomId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomEntriesSynced";
      arg["roomId"] = roomId ?? "";

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onChatRoomEntriesSynced_call
engine?.onChatRoomEntriesSynced = (String? roomId,) {
    //...
};
//callback_onChatRoomEntriesSynced_call
*/

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
/*
//callback_onChatRoomEntriesChanged_call
engine?.onChatRoomEntriesChanged = (RCIMIWChatRoomEntriesOperationType? operationType,String? roomId,Map? entries,) {
    //...
};
//callback_onChatRoomEntriesChanged_call
*/

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
/*
//callback_onRemoteUltraGroupMessageExpansionUpdated_call
engine?.onRemoteUltraGroupMessageExpansionUpdated = (List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onRemoteUltraGroupMessageExpansionUpdated_call
*/

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
/*
//callback_onRemoteUltraGroupMessageModified_call
engine?.onRemoteUltraGroupMessageModified = (List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onRemoteUltraGroupMessageModified_call
*/

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
/*
//callback_onRemoteUltraGroupMessageRecalled_call
engine?.onRemoteUltraGroupMessageRecalled = (List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onRemoteUltraGroupMessageRecalled_call
*/

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
/*
//callback_onUltraGroupReadTimeReceived_call
engine?.onUltraGroupReadTimeReceived = (String? targetId,String? channelId,int? timestamp,) {
    //...
};
//callback_onUltraGroupReadTimeReceived_call
*/

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
/*
//callback_onUltraGroupTypingStatusChanged_call
engine?.onUltraGroupTypingStatusChanged = (List<RCIMIWUltraGroupTypingStatusInfo>? info,) {
    //...
};
//callback_onUltraGroupTypingStatusChanged_call
*/

    engine?.onMessageBlocked = (
      RCIMIWBlockedMessageInfo? info,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageBlocked";
      arg["info"] = formatJson(info?.toJson());

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onMessageBlocked_call
engine?.onMessageBlocked = (RCIMIWBlockedMessageInfo? info,) {
    //...
};
//callback_onMessageBlocked_call
*/

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
/*
//callback_onChatRoomStatusChanged_call
engine?.onChatRoomStatusChanged = (String? targetId,RCIMIWChatRoomStatus? status,) {
    //...
};
//callback_onChatRoomStatusChanged_call
*/

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
/*
//callback_onGroupMessageReadReceiptRequestReceived_call
engine?.onGroupMessageReadReceiptRequestReceived = (String? targetId,String? messageUId,) {
    //...
};
//callback_onGroupMessageReadReceiptRequestReceived_call
*/

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
/*
//callback_onGroupMessageReadReceiptResponseReceived_call
engine?.onGroupMessageReadReceiptResponseReceived = (String? targetId,String? messageUId,Map? respondUserIds,) {
    //...
};
//callback_onGroupMessageReadReceiptResponseReceived_call
*/

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
/*
//callback_onConnected_call
engine?.onConnected = (int? code,String? userId,) {
    //...
};
//callback_onConnected_call
*/

    engine?.onDatabaseOpened = (
      int? code,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onDatabaseOpened";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onDatabaseOpened_call
engine?.onDatabaseOpened = (int? code,) {
    //...
};
//callback_onDatabaseOpened_call
*/

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
/*
//callback_onConversationLoaded_call
engine?.onConversationLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,RCIMIWConversation? conversation,) {
    //...
};
//callback_onConversationLoaded_call
*/

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
/*
//callback_onConversationsLoaded_call
engine?.onConversationsLoaded = (int? code,List<RCIMIWConversationType>? conversationTypes,String? channelId,int? startTime,int? count,List<RCIMIWConversation>? conversations,) {
    //...
};
//callback_onConversationsLoaded_call
*/

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
/*
//callback_onConversationRemoved_call
engine?.onConversationRemoved = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,) {
    //...
};
//callback_onConversationRemoved_call
*/

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
/*
//callback_onConversationsRemoved_call
engine?.onConversationsRemoved = (int? code,List<RCIMIWConversationType>? conversationTypes,String? channelId,) {
    //...
};
//callback_onConversationsRemoved_call
*/

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
/*
//callback_onTotalUnreadCountLoaded_call
engine?.onTotalUnreadCountLoaded = (int? code,String? channelId,int? count,) {
    //...
};
//callback_onTotalUnreadCountLoaded_call
*/

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
/*
//callback_onUnreadCountLoaded_call
engine?.onUnreadCountLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,int? count,) {
    //...
};
//callback_onUnreadCountLoaded_call
*/

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
/*
//callback_onUnreadCountByConversationTypesLoaded_call
engine?.onUnreadCountByConversationTypesLoaded = (int? code,List<RCIMIWConversationType>? conversationTypes,String? channelId,bool? contain,int? count,) {
    //...
};
//callback_onUnreadCountByConversationTypesLoaded_call
*/

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
/*
//callback_onUnreadMentionedCountLoaded_call
engine?.onUnreadMentionedCountLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,int? count,) {
    //...
};
//callback_onUnreadMentionedCountLoaded_call
*/

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
/*
//callback_onUltraGroupAllUnreadCountLoaded_call
engine?.onUltraGroupAllUnreadCountLoaded = (int? code,int? count,) {
    //...
};
//callback_onUltraGroupAllUnreadCountLoaded_call
*/

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
/*
//callback_onUltraGroupAllUnreadMentionedCountLoaded_call
engine?.onUltraGroupAllUnreadMentionedCountLoaded = (int? code,int? count,) {
    //...
};
//callback_onUltraGroupAllUnreadMentionedCountLoaded_call
*/

    engine?.onUltraGroupConversationsSynced = () {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupConversationsSynced";

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onUltraGroupConversationsSynced_call
engine?.onUltraGroupConversationsSynced = () {
    //...
};
//callback_onUltraGroupConversationsSynced_call
*/

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
/*
//callback_onUnreadCountCleared_call
engine?.onUnreadCountCleared = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,int? timestamp,) {
    //...
};
//callback_onUnreadCountCleared_call
*/

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
/*
//callback_onDraftMessageSaved_call
engine?.onDraftMessageSaved = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,String? draft,) {
    //...
};
//callback_onDraftMessageSaved_call
*/

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
/*
//callback_onDraftMessageCleared_call
engine?.onDraftMessageCleared = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,) {
    //...
};
//callback_onDraftMessageCleared_call
*/

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
/*
//callback_onDraftMessageLoaded_call
engine?.onDraftMessageLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,String? draft,) {
    //...
};
//callback_onDraftMessageLoaded_call
*/

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
/*
//callback_onBlockedConversationsLoaded_call
engine?.onBlockedConversationsLoaded = (int? code,List<RCIMIWConversationType>? conversationTypes,String? channelId,List<RCIMIWConversation>? conversations,) {
    //...
};
//callback_onBlockedConversationsLoaded_call
*/

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
/*
//callback_onConversationTopStatusChanged_call
engine?.onConversationTopStatusChanged = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,bool? top,) {
    //...
};
//callback_onConversationTopStatusChanged_call
*/

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
/*
//callback_onConversationTopStatusLoaded_call
engine?.onConversationTopStatusLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,bool? top,) {
    //...
};
//callback_onConversationTopStatusLoaded_call
*/

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
/*
//callback_onConversationReadStatusSynced_call
engine?.onConversationReadStatusSynced = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,int? timestamp,) {
    //...
};
//callback_onConversationReadStatusSynced_call
*/

    engine?.onMessageAttached = (
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessageAttached";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onMessageAttached_call
engine?.onMessageAttached = (RCIMIWMessage? message,) {
    //...
};
//callback_onMessageAttached_call
*/

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
/*
//callback_onMessageSent_call
engine?.onMessageSent = (int? code,RCIMIWMessage? message,) {
    //...
};
//callback_onMessageSent_call
*/

    engine?.onMediaMessageAttached = (
      RCIMIWMediaMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMediaMessageAttached";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onMediaMessageAttached_call
engine?.onMediaMessageAttached = (RCIMIWMediaMessage? message,) {
    //...
};
//callback_onMediaMessageAttached_call
*/

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
/*
//callback_onMediaMessageSending_call
engine?.onMediaMessageSending = (RCIMIWMediaMessage? message,int? progress,) {
    //...
};
//callback_onMediaMessageSending_call
*/

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
/*
//callback_onSendingMediaMessageCanceled_call
engine?.onSendingMediaMessageCanceled = (int? code,RCIMIWMediaMessage? message,) {
    //...
};
//callback_onSendingMediaMessageCanceled_call
*/

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
/*
//callback_onMediaMessageSent_call
engine?.onMediaMessageSent = (int? code,RCIMIWMediaMessage? message,) {
    //...
};
//callback_onMediaMessageSent_call
*/

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
/*
//callback_onMediaMessageDownloading_call
engine?.onMediaMessageDownloading = (RCIMIWMediaMessage? message,int? progress,) {
    //...
};
//callback_onMediaMessageDownloading_call
*/

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
/*
//callback_onMediaMessageDownloaded_call
engine?.onMediaMessageDownloaded = (int? code,RCIMIWMediaMessage? message,) {
    //...
};
//callback_onMediaMessageDownloaded_call
*/

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
/*
//callback_onDownloadingMediaMessageCanceled_call
engine?.onDownloadingMediaMessageCanceled = (int? code,RCIMIWMediaMessage? message,) {
    //...
};
//callback_onDownloadingMediaMessageCanceled_call
*/

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
/*
//callback_onMessagesLoaded_call
engine?.onMessagesLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,int? sentTime,RCIMIWTimeOrder? order,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onMessagesLoaded_call
*/

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
/*
//callback_onUnreadMentionedMessagesLoaded_call
engine?.onUnreadMentionedMessagesLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onUnreadMentionedMessagesLoaded_call
*/

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
/*
//callback_onFirstUnreadMessageLoaded_call
engine?.onFirstUnreadMessageLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,RCIMIWMessage? message,) {
    //...
};
//callback_onFirstUnreadMessageLoaded_call
*/

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
/*
//callback_onMessageInserted_call
engine?.onMessageInserted = (int? code,RCIMIWMessage? message,) {
    //...
};
//callback_onMessageInserted_call
*/

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
/*
//callback_onMessagesInserted_call
engine?.onMessagesInserted = (int? code,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onMessagesInserted_call
*/

    engine?.onMessagesCleared = (
      int? code,
      RCIMIWConversationType? type,
      String? targetId,
      String? channelId,
      int? timestamp,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onMessagesCleared";
      arg["code"] = code.toString();
      arg["type"] = type.toString();
      arg["targetId"] = targetId ?? "";
      arg["channelId"] = channelId ?? "";
      arg["timestamp"] = timestamp.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onMessagesCleared_call
engine?.onMessagesCleared = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,int? timestamp,) {
    //...
};
//callback_onMessagesCleared_call
*/

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
/*
//callback_onLocalMessagesDeleted_call
engine?.onLocalMessagesDeleted = (int? code,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onLocalMessagesDeleted_call
*/

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
/*
//callback_onMessagesDeleted_call
engine?.onMessagesDeleted = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onMessagesDeleted_call
*/

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
/*
//callback_onMessageRecalled_call
engine?.onMessageRecalled = (int? code,RCIMIWMessage? message,) {
    //...
};
//callback_onMessageRecalled_call
*/

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
/*
//callback_onPrivateReadReceiptMessageSent_call
engine?.onPrivateReadReceiptMessageSent = (int? code,String? targetId,String? channelId,int? timestamp,) {
    //...
};
//callback_onPrivateReadReceiptMessageSent_call
*/

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
/*
//callback_onMessageExpansionUpdated_call
engine?.onMessageExpansionUpdated = (int? code,String? messageUId,Map? expansion,) {
    //...
};
//callback_onMessageExpansionUpdated_call
*/

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
/*
//callback_onMessageExpansionForKeysRemoved_call
engine?.onMessageExpansionForKeysRemoved = (int? code,String? messageUId,List<String>? keys,) {
    //...
};
//callback_onMessageExpansionForKeysRemoved_call
*/

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
/*
//callback_onMessageReceiveStatusChanged_call
engine?.onMessageReceiveStatusChanged = (int? code,int? messageId,) {
    //...
};
//callback_onMessageReceiveStatusChanged_call
*/

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
/*
//callback_onMessageSentStatusChanged_call
engine?.onMessageSentStatusChanged = (int? code,int? messageId,) {
    //...
};
//callback_onMessageSentStatusChanged_call
*/

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
/*
//callback_onChatRoomJoined_call
engine?.onChatRoomJoined = (int? code,String? targetId,) {
    //...
};
//callback_onChatRoomJoined_call
*/

    engine?.onChatRoomJoining = (
      String? targetId,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomJoining";
      arg["targetId"] = targetId ?? "";

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onChatRoomJoining_call
engine?.onChatRoomJoining = (String? targetId,) {
    //...
};
//callback_onChatRoomJoining_call
*/

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
/*
//callback_onChatRoomLeft_call
engine?.onChatRoomLeft = (int? code,String? targetId,) {
    //...
};
//callback_onChatRoomLeft_call
*/

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
/*
//callback_onChatRoomMessagesLoaded_call
engine?.onChatRoomMessagesLoaded = (int? code,String? targetId,List<RCIMIWMessage>? messages,int? syncTime,) {
    //...
};
//callback_onChatRoomMessagesLoaded_call
*/

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
/*
//callback_onChatRoomEntryAdded_call
engine?.onChatRoomEntryAdded = (int? code,String? targetId,String? key,) {
    //...
};
//callback_onChatRoomEntryAdded_call
*/

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
/*
//callback_onChatRoomEntriesAdded_call
engine?.onChatRoomEntriesAdded = (int? code,String? targetId,Map? entries,Map? errorEntries,) {
    //...
};
//callback_onChatRoomEntriesAdded_call
*/

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
/*
//callback_onChatRoomEntryLoaded_call
engine?.onChatRoomEntryLoaded = (int? code,String? targetId,Map? entry,) {
    //...
};
//callback_onChatRoomEntryLoaded_call
*/

    engine?.onChatRoomAllEntriesLoaded = (
      int? code,
      String? targetId,
      Map? entries,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onChatRoomAllEntriesLoaded";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";
      arg["entries"] = entries.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onChatRoomAllEntriesLoaded_call
engine?.onChatRoomAllEntriesLoaded = (int? code,String? targetId,Map? entries,) {
    //...
};
//callback_onChatRoomAllEntriesLoaded_call
*/

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
/*
//callback_onChatRoomEntryRemoved_call
engine?.onChatRoomEntryRemoved = (int? code,String? targetId,String? key,) {
    //...
};
//callback_onChatRoomEntryRemoved_call
*/

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
/*
//callback_onChatRoomEntriesRemoved_call
engine?.onChatRoomEntriesRemoved = (int? code,String? targetId,List<String>? keys,) {
    //...
};
//callback_onChatRoomEntriesRemoved_call
*/

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
/*
//callback_onBlacklistAdded_call
engine?.onBlacklistAdded = (int? code,String? userId,) {
    //...
};
//callback_onBlacklistAdded_call
*/

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
/*
//callback_onBlacklistRemoved_call
engine?.onBlacklistRemoved = (int? code,String? userId,) {
    //...
};
//callback_onBlacklistRemoved_call
*/

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
/*
//callback_onBlacklistStatusLoaded_call
engine?.onBlacklistStatusLoaded = (int? code,String? userId,RCIMIWBlacklistStatus? status,) {
    //...
};
//callback_onBlacklistStatusLoaded_call
*/

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
/*
//callback_onBlacklistLoaded_call
engine?.onBlacklistLoaded = (int? code,List<String>? userIds,) {
    //...
};
//callback_onBlacklistLoaded_call
*/

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
/*
//callback_onMessagesSearched_call
engine?.onMessagesSearched = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,String? keyword,int? startTime,int? count,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onMessagesSearched_call
*/

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
/*
//callback_onMessagesSearchedByTimeRange_call
engine?.onMessagesSearchedByTimeRange = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,String? keyword,int? startTime,int? endTime,int? offset,int? count,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onMessagesSearchedByTimeRange_call
*/

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
/*
//callback_onMessagesSearchedByUserId_call
engine?.onMessagesSearchedByUserId = (int? code,String? userId,RCIMIWConversationType? type,String? targetId,String? channelId,int? startTime,int? count,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onMessagesSearchedByUserId_call
*/

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
/*
//callback_onConversationsSearched_call
engine?.onConversationsSearched = (int? code,List<RCIMIWConversationType>? conversationTypes,String? channelId,List<RCIMIWMessageType>? messageTypes,String? keyword,List<RCIMIWSearchConversationResult>? conversations,) {
    //...
};
//callback_onConversationsSearched_call
*/

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
/*
//callback_onGroupReadReceiptRequestSent_call
engine?.onGroupReadReceiptRequestSent = (int? code,RCIMIWMessage? message,) {
    //...
};
//callback_onGroupReadReceiptRequestSent_call
*/

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
/*
//callback_onGroupReadReceiptResponseSent_call
engine?.onGroupReadReceiptResponseSent = (int? code,String? targetId,String? channelId,List<RCIMIWMessage>? messages,) {
    //...
};
//callback_onGroupReadReceiptResponseSent_call
*/

    engine?.onNotificationQuietHoursChanged = (
      int? code,
      String? startTime,
      int? spanMinutes,
      RCIMIWPushNotificationQuietHoursLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onNotificationQuietHoursChanged";
      arg["code"] = code.toString();
      arg["startTime"] = startTime ?? "";
      arg["spanMinutes"] = spanMinutes.toString();
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onNotificationQuietHoursChanged_call
engine?.onNotificationQuietHoursChanged = (int? code,String? startTime,int? spanMinutes,RCIMIWPushNotificationQuietHoursLevel? level,) {
    //...
};
//callback_onNotificationQuietHoursChanged_call
*/

    engine?.onNotificationQuietHoursRemoved = (
      int? code,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onNotificationQuietHoursRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onNotificationQuietHoursRemoved_call
engine?.onNotificationQuietHoursRemoved = (int? code,) {
    //...
};
//callback_onNotificationQuietHoursRemoved_call
*/

    engine?.onNotificationQuietHoursLoaded = (
      int? code,
      String? startTime,
      int? spanMinutes,
      RCIMIWPushNotificationQuietHoursLevel? level,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onNotificationQuietHoursLoaded";
      arg["code"] = code.toString();
      arg["startTime"] = startTime ?? "";
      arg["spanMinutes"] = spanMinutes.toString();
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onNotificationQuietHoursLoaded_call
engine?.onNotificationQuietHoursLoaded = (int? code,String? startTime,int? spanMinutes,RCIMIWPushNotificationQuietHoursLevel? level,) {
    //...
};
//callback_onNotificationQuietHoursLoaded_call
*/

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
/*
//callback_onConversationNotificationLevelChanged_call
engine?.onConversationNotificationLevelChanged = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onConversationNotificationLevelChanged_call
*/

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
/*
//callback_onConversationNotificationLevelLoaded_call
engine?.onConversationNotificationLevelLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onConversationNotificationLevelLoaded_call
*/

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
/*
//callback_onConversationTypeNotificationLevelChanged_call
engine?.onConversationTypeNotificationLevelChanged = (int? code,RCIMIWConversationType? type,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onConversationTypeNotificationLevelChanged_call
*/

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
/*
//callback_onConversationTypeNotificationLevelLoaded_call
engine?.onConversationTypeNotificationLevelLoaded = (int? code,RCIMIWConversationType? type,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onConversationTypeNotificationLevelLoaded_call
*/

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
/*
//callback_onUltraGroupDefaultNotificationLevelChanged_call
engine?.onUltraGroupDefaultNotificationLevelChanged = (int? code,String? targetId,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onUltraGroupDefaultNotificationLevelChanged_call
*/

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
/*
//callback_onUltraGroupDefaultNotificationLevelLoaded_call
engine?.onUltraGroupDefaultNotificationLevelLoaded = (int? code,String? targetId,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onUltraGroupDefaultNotificationLevelLoaded_call
*/

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
/*
//callback_onUltraGroupChannelDefaultNotificationLevelChanged_call
engine?.onUltraGroupChannelDefaultNotificationLevelChanged = (int? code,String? targetId,String? channelId,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onUltraGroupChannelDefaultNotificationLevelChanged_call
*/

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
/*
//callback_onUltraGroupChannelDefaultNotificationLevelLoaded_call
engine?.onUltraGroupChannelDefaultNotificationLevelLoaded = (int? code,String? targetId,String? channelId,RCIMIWPushNotificationLevel? level,) {
    //...
};
//callback_onUltraGroupChannelDefaultNotificationLevelLoaded_call
*/

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
/*
//callback_onPushContentShowStatusChanged_call
engine?.onPushContentShowStatusChanged = (int? code,bool? showContent,) {
    //...
};
//callback_onPushContentShowStatusChanged_call
*/

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
/*
//callback_onPushLanguageChanged_call
engine?.onPushLanguageChanged = (int? code,String? language,) {
    //...
};
//callback_onPushLanguageChanged_call
*/

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
/*
//callback_onPushReceiveStatusChanged_call
engine?.onPushReceiveStatusChanged = (int? code,bool? receive,) {
    //...
};
//callback_onPushReceiveStatusChanged_call
*/

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
/*
//callback_onMessageCountLoaded_call
engine?.onMessageCountLoaded = (int? code,RCIMIWConversationType? type,String? targetId,String? channelId,int? count,) {
    //...
};
//callback_onMessageCountLoaded_call
*/

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
/*
//callback_onTopConversationsLoaded_call
engine?.onTopConversationsLoaded = (int? code,List<RCIMIWConversationType>? conversationTypes,String? channelId,List<RCIMIWConversation>? conversations,) {
    //...
};
//callback_onTopConversationsLoaded_call
*/

    engine?.onGroupMessageToDesignatedUsersAttached = (
      RCIMIWMessage? message,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onGroupMessageToDesignatedUsersAttached";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onGroupMessageToDesignatedUsersAttached_call
engine?.onGroupMessageToDesignatedUsersAttached = (RCIMIWMessage? message,) {
    //...
};
//callback_onGroupMessageToDesignatedUsersAttached_call
*/

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
/*
//callback_onGroupMessageToDesignatedUsersSent_call
engine?.onGroupMessageToDesignatedUsersSent = (int? code,RCIMIWMessage? message,) {
    //...
};
//callback_onGroupMessageToDesignatedUsersSent_call
*/

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
/*
//callback_onUltraGroupReadStatusSynced_call
engine?.onUltraGroupReadStatusSynced = (int? code,String? targetId,String? channelId,int? timestamp,) {
    //...
};
//callback_onUltraGroupReadStatusSynced_call
*/

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
/*
//callback_onConversationsLoadedForAllChannel_call
engine?.onConversationsLoadedForAllChannel = (int? code,RCIMIWConversationType? type,String? targetId,List<RCIMIWConversation>? conversations,) {
    //...
};
//callback_onConversationsLoadedForAllChannel_call
*/

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
/*
//callback_onUltraGroupUnreadMentionedCountLoaded_call
engine?.onUltraGroupUnreadMentionedCountLoaded = (int? code,String? targetId,int? count,) {
    //...
};
//callback_onUltraGroupUnreadMentionedCountLoaded_call
*/

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
/*
//callback_onUltraGroupUnreadCountLoaded_call
engine?.onUltraGroupUnreadCountLoaded = (int? code,String? targetId,int? count,) {
    //...
};
//callback_onUltraGroupUnreadCountLoaded_call
*/

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
/*
//callback_onUltraGroupMessageModified_call
engine?.onUltraGroupMessageModified = (int? code,String? messageUId,) {
    //...
};
//callback_onUltraGroupMessageModified_call
*/

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
/*
//callback_onUltraGroupMessageRecalled_call
engine?.onUltraGroupMessageRecalled = (int? code,RCIMIWMessage? message,bool? deleteRemote,) {
    //...
};
//callback_onUltraGroupMessageRecalled_call
*/

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
/*
//callback_onUltraGroupMessagesCleared_call
engine?.onUltraGroupMessagesCleared = (int? code,String? targetId,String? channelId,int? timestamp,RCIMIWMessageOperationPolicy? policy,) {
    //...
};
//callback_onUltraGroupMessagesCleared_call
*/

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
/*
//callback_onUltraGroupMessagesClearedForAllChannel_call
engine?.onUltraGroupMessagesClearedForAllChannel = (int? code,String? targetId,int? timestamp,) {
    //...
};
//callback_onUltraGroupMessagesClearedForAllChannel_call
*/

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
/*
//callback_onUltraGroupTypingStatusSent_call
engine?.onUltraGroupTypingStatusSent = (int? code,String? targetId,String? channelId,RCIMIWUltraGroupTypingStatus? typingStatus,) {
    //...
};
//callback_onUltraGroupTypingStatusSent_call
*/

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
/*
//callback_onBatchRemoteUltraGroupMessagesLoaded_call
engine?.onBatchRemoteUltraGroupMessagesLoaded = (int? code,List<RCIMIWMessage>? matchedMessages,List<RCIMIWMessage>? notMatchedMessages,) {
    //...
};
//callback_onBatchRemoteUltraGroupMessagesLoaded_call
*/

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
/*
//callback_onUltraGroupMessageExpansionUpdated_call
engine?.onUltraGroupMessageExpansionUpdated = (int? code,Map? expansion,String? messageUId,) {
    //...
};
//callback_onUltraGroupMessageExpansionUpdated_call
*/

    engine?.onUltraGroupMessageExpansionForKeysRemoved = (
      int? code,
      String? messageUId,
      List<String>? keys,
    ) {
      Map<String, String> arg = {};
      arg["listener"] = "onUltraGroupMessageExpansionForKeysRemoved";
      arg["code"] = code.toString();
      arg["messageUId"] = messageUId ?? "";
      arg["keys"] = keys.toString();

      bus.emit("rong_im_listener", arg);
    };
/*
//callback_onUltraGroupMessageExpansionForKeysRemoved_call
engine?.onUltraGroupMessageExpansionForKeysRemoved = (int? code,String? messageUId,List<String>? keys,) {
    //...
};
//callback_onUltraGroupMessageExpansionForKeysRemoved_call
*/
  }

  String formatJson(jsonObject) {
    if (jsonObject == null) {
      return "";
    }
    const JsonEncoder encoder = JsonEncoder.withIndent('    ');
    return encoder.convert(jsonObject);
  }
}
