import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin_example/auto/im_engine.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/Toast.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';

// auto

connect(Map arg) async {
  if (arg['token'] == null) {
    RCIWToast.showToast("token 为空");
    return;
  }

  if (arg['timeout'] == null) {
    RCIWToast.showToast("timeout 为空");
    return;
  }

  String token = arg['token'];
  int timeout = int.parse(arg['timeout']);
  int? code = await IMEngineManager().engine?.connect(
        token,
        timeout,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "connect";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

disconnect(Map arg) async {
  if (arg['receivePush'] == null) {
    RCIWToast.showToast("receivePush 为空");
    return;
  }

  int receivePushInt = int.parse(arg['receivePush']);
  bool receivePush = receivePushInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.disconnect(
        receivePush,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "disconnect";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

cancelSendingMediaMessage(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  RCIMIWMediaMessage message = arg['message'];
  int? code = await IMEngineManager().engine?.cancelSendingMediaMessage(
        message,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "cancelSendingMediaMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

downloadMediaMessage(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  RCIMIWMediaMessage message = arg['message'];
  int? code = await IMEngineManager().engine?.downloadMediaMessage(
        message,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "downloadMediaMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

cancelDownloadingMediaMessage(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  RCIMIWMediaMessage message = arg['message'];
  int? code = await IMEngineManager().engine?.cancelDownloadingMediaMessage(
        message,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "cancelDownloadingMediaMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadConversation(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadConversation(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversation";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  if (arg['startTime'] == null) {
    RCIWToast.showToast("startTime 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  int? code = await IMEngineManager().engine?.loadConversations(
        conversationTypesInt,
        channelId,
        startTime,
        count,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversations";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeConversation(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.removeConversation(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeConversation";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.removeConversations(
        conversationTypesInt,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeConversations";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUnreadCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadUnreadCount(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadTotalUnreadCount(Map arg) async {
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadTotalUnreadCount(
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadTotalUnreadCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUnreadMentionedCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadUnreadMentionedCount(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadMentionedCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUltraGroupAllUnreadCount() async {
  int? code = await IMEngineManager().engine?.loadUltraGroupAllUnreadCount();
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupAllUnreadCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUltraGroupAllUnreadMentionedCount() async {
  int? code =
      await IMEngineManager().engine?.loadUltraGroupAllUnreadMentionedCount();
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupAllUnreadMentionedCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUltraGroupUnreadCount(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadUltraGroupUnreadCount(
        targetId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupUnreadCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUltraGroupUnreadMentionedCount(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code =
      await IMEngineManager().engine?.loadUltraGroupUnreadMentionedCount(
            targetId,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupUnreadMentionedCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUnreadCountByConversationTypes(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  if (arg['contain'] == null) {
    RCIWToast.showToast("contain 为空");
    return;
  }

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int containInt = int.parse(arg['contain']);
  bool contain = containInt == 0 ? false : true;
  int? code =
      await IMEngineManager().engine?.loadUnreadCountByConversationTypes(
            conversationTypesInt,
            channelId,
            contain,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadCountByConversationTypes";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

clearUnreadCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  int? code = await IMEngineManager().engine?.clearUnreadCount(
        type,
        targetId,
        channelId,
        timestamp,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUnreadCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

saveDraftMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['draft'] == null) {
    RCIWToast.showToast("draft 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String draft = arg['draft'];
  int? code = await IMEngineManager().engine?.saveDraftMessage(
        type,
        targetId,
        channelId,
        draft,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "saveDraftMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadDraftMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadDraftMessage(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadDraftMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

clearDraftMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.clearDraftMessage(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearDraftMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadBlockedConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadBlockedConversations(
        conversationTypesInt,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlockedConversations";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeConversationTopStatus(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['top'] == null) {
    RCIWToast.showToast("top 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int topInt = int.parse(arg['top']);
  bool top = topInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.changeConversationTopStatus(
        type,
        targetId,
        channelId,
        top,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTopStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadConversationTopStatus(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadConversationTopStatus(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationTopStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

syncConversationReadStatus(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  int? code = await IMEngineManager().engine?.syncConversationReadStatus(
        type,
        targetId,
        channelId,
        timestamp,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "syncConversationReadStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendTypingStatus(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['currentType'] == null) {
    RCIWToast.showToast("currentType 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String currentType = arg['currentType'];
  int? code = await IMEngineManager().engine?.sendTypingStatus(
        type,
        targetId,
        channelId,
        currentType,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendTypingStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['sentTime'] == null) {
    RCIWToast.showToast("sentTime 为空");
    return;
  }

  if (arg['order'] == null) {
    RCIWToast.showToast("order 为空");
    return;
  }

  if (arg['policy'] == null) {
    RCIWToast.showToast("policy 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int sentTime = int.parse(arg['sentTime']);
  RCIMIWTimeOrder order = RCIMIWTimeOrder.values[int.parse(arg['order'])];
  RCIMIWMessageOperationPolicy policy =
      RCIMIWMessageOperationPolicy.values[int.parse(arg['policy'])];
  int count = int.parse(arg['count']);
  int? code = await IMEngineManager().engine?.loadMessages(
        type,
        targetId,
        channelId,
        sentTime,
        order,
        policy,
        count,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadFirstUnreadMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadFirstUnreadMessage(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadFirstUnreadMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUnreadMentionedMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadUnreadMentionedMessages(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadMentionedMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

insertMessage(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  RCIMIWMessage message = arg['message'];
  int? code = await IMEngineManager().engine?.insertMessage(
        message,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

insertMessages(Map arg) async {
  if (arg['messages'] == null) {
    RCIWToast.showToast("messages 为空");
    return;
  }

  List<RCIMIWMessage> messages = arg['messages'];
  int? code = await IMEngineManager().engine?.insertMessages(
        messages,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

clearMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  if (arg['policy'] == null) {
    RCIWToast.showToast("policy 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  RCIMIWMessageOperationPolicy policy =
      RCIMIWMessageOperationPolicy.values[int.parse(arg['policy'])];
  int? code = await IMEngineManager().engine?.clearMessages(
        type,
        targetId,
        channelId,
        timestamp,
        policy,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

deleteLocalMessages(Map arg) async {
  if (arg['messages'] == null) {
    RCIWToast.showToast("messages 为空");
    return;
  }

  List<RCIMIWMessage> messages = arg['messages'];
  int? code = await IMEngineManager().engine?.deleteLocalMessages(
        messages,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "deleteLocalMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

deleteMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['messages'] == null) {
    RCIWToast.showToast("messages 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  List<RCIMIWMessage> messages = arg['messages'];
  int? code = await IMEngineManager().engine?.deleteMessages(
        type,
        targetId,
        channelId,
        messages,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "deleteMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

recallMessage(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  RCIMIWMessage message = arg['message'];
  int? code = await IMEngineManager().engine?.recallMessage(
        message,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "recallMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendPrivateReadReceiptMessage(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  int? code = await IMEngineManager().engine?.sendPrivateReadReceiptMessage(
        targetId,
        channelId,
        timestamp,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendPrivateReadReceiptMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendGroupReadReceiptRequest(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  RCIMIWMessage message = arg['message'];
  int? code = await IMEngineManager().engine?.sendGroupReadReceiptRequest(
        message,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendGroupReadReceiptRequest";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendGroupReadReceiptResponse(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['messages'] == null) {
    RCIWToast.showToast("messages 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  List<RCIMIWMessage> messages = arg['messages'];
  int? code = await IMEngineManager().engine?.sendGroupReadReceiptResponse(
        targetId,
        channelId,
        messages,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendGroupReadReceiptResponse";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

updateMessageExpansion(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg["keys"] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }
  if (arg["values"] == null) {
    RCIWToast.showToast("values 为空");
    return;
  }

  String messageUId = arg['messageUId'];
  Map expansion = {};
  List keys = (arg["keys"]).split(",");
  List values = (arg["values"]).split(",");
  for (var i = 0; i < keys.length; i++) {
    expansion[keys[i]] = values[i];
  }

  int? code = await IMEngineManager().engine?.updateMessageExpansion(
        messageUId,
        expansion,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateMessageExpansion";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeMessageExpansionForKeys(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg['keys'] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }

  String messageUId = arg['messageUId'];
  List<String> keys = (arg["keys"]).split(",");
  int? code = await IMEngineManager().engine?.removeMessageExpansionForKeys(
        messageUId,
        keys,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeMessageExpansionForKeys";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeMessageSentStatus(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['sentStatus'] == null) {
    RCIWToast.showToast("sentStatus 为空");
    return;
  }

  int messageId = int.parse(arg['messageId']);
  RCIMIWSentStatus sentStatus =
      RCIMIWSentStatus.values[int.parse(arg['sentStatus'])];
  int? code = await IMEngineManager().engine?.changeMessageSentStatus(
        messageId,
        sentStatus,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeMessageSentStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeMessageReceiveStatus(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['receivedStatus'] == null) {
    RCIWToast.showToast("receivedStatus 为空");
    return;
  }

  int messageId = int.parse(arg['messageId']);
  RCIMIWReceivedStatus receivedStatus =
      RCIMIWReceivedStatus.values[int.parse(arg['receivedStatus'])];
  int? code = await IMEngineManager().engine?.changeMessageReceiveStatus(
        messageId,
        receivedStatus,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeMessageReceiveStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

joinChatRoom(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['messageCount'] == null) {
    RCIWToast.showToast("messageCount 为空");
    return;
  }

  if (arg['autoCreate'] == null) {
    RCIWToast.showToast("autoCreate 为空");
    return;
  }

  String targetId = arg['targetId'];
  int messageCount = int.parse(arg['messageCount']);
  int autoCreateInt = int.parse(arg['autoCreate']);
  bool autoCreate = autoCreateInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.joinChatRoom(
        targetId,
        messageCount,
        autoCreate,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "joinChatRoom";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

leaveChatRoom(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.leaveChatRoom(
        targetId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "leaveChatRoom";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadChatRoomMessages(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  if (arg['order'] == null) {
    RCIWToast.showToast("order 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }

  String targetId = arg['targetId'];
  int timestamp = int.parse(arg['timestamp']);
  RCIMIWTimeOrder order = RCIMIWTimeOrder.values[int.parse(arg['order'])];
  int count = int.parse(arg['count']);
  int? code = await IMEngineManager().engine?.loadChatRoomMessages(
        targetId,
        timestamp,
        order,
        count,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

addChatRoomEntry(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['key'] == null) {
    RCIWToast.showToast("key 为空");
    return;
  }

  if (arg['value'] == null) {
    RCIWToast.showToast("value 为空");
    return;
  }

  if (arg['deleteWhenLeft'] == null) {
    RCIWToast.showToast("deleteWhenLeft 为空");
    return;
  }

  if (arg['overwrite'] == null) {
    RCIWToast.showToast("overwrite 为空");
    return;
  }

  String targetId = arg['targetId'];
  String key = arg['key'];
  String value = arg['value'];
  int deleteWhenLeftInt = int.parse(arg['deleteWhenLeft']);
  bool deleteWhenLeft = deleteWhenLeftInt == 0 ? false : true;
  int overwriteInt = int.parse(arg['overwrite']);
  bool overwrite = overwriteInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.addChatRoomEntry(
        targetId,
        key,
        value,
        deleteWhenLeft,
        overwrite,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addChatRoomEntry";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

addChatRoomEntries(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg["keys"] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }
  if (arg["values"] == null) {
    RCIWToast.showToast("values 为空");
    return;
  }

  if (arg['deleteWhenLeft'] == null) {
    RCIWToast.showToast("deleteWhenLeft 为空");
    return;
  }

  if (arg['overwrite'] == null) {
    RCIWToast.showToast("overwrite 为空");
    return;
  }

  String targetId = arg['targetId'];
  Map entries = {};
  List keys = (arg["keys"]).split(",");
  List values = (arg["values"]).split(",");
  for (var i = 0; i < keys.length; i++) {
    entries[keys[i]] = values[i];
  }
  int deleteWhenLeftInt = int.parse(arg['deleteWhenLeft']);
  bool deleteWhenLeft = deleteWhenLeftInt == 0 ? false : true;
  int overwriteInt = int.parse(arg['overwrite']);
  bool overwrite = overwriteInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.addChatRoomEntries(
        targetId,
        entries,
        deleteWhenLeft,
        overwrite,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addChatRoomEntries";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadChatRoomEntry(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['key'] == null) {
    RCIWToast.showToast("key 为空");
    return;
  }

  String targetId = arg['targetId'];
  String key = arg['key'];
  int? code = await IMEngineManager().engine?.loadChatRoomEntry(
        targetId,
        key,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomEntry";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadAllChatRoomEntries(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadAllChatRoomEntries(
        targetId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadAllChatRoomEntries";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeChatRoomEntry(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['key'] == null) {
    RCIWToast.showToast("key 为空");
    return;
  }

  if (arg['force'] == null) {
    RCIWToast.showToast("force 为空");
    return;
  }

  String targetId = arg['targetId'];
  String key = arg['key'];
  int forceInt = int.parse(arg['force']);
  bool force = forceInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.removeChatRoomEntry(
        targetId,
        key,
        force,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeChatRoomEntry";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeChatRoomEntries(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['keys'] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }

  if (arg['force'] == null) {
    RCIWToast.showToast("force 为空");
    return;
  }

  String targetId = arg['targetId'];
  List<String> keys = (arg["keys"]).split(",");
  int forceInt = int.parse(arg['force']);
  bool force = forceInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.removeChatRoomEntries(
        targetId,
        keys,
        force,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeChatRoomEntries";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

addToBlacklist(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }

  String userId = arg['userId'];
  int? code = await IMEngineManager().engine?.addToBlacklist(
        userId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addToBlacklist";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeFromBlacklist(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }

  String userId = arg['userId'];
  int? code = await IMEngineManager().engine?.removeFromBlacklist(
        userId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeFromBlacklist";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadBlacklistStatus(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }

  String userId = arg['userId'];
  int? code = await IMEngineManager().engine?.loadBlacklistStatus(
        userId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlacklistStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadBlacklist() async {
  int? code = await IMEngineManager().engine?.loadBlacklist();
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlacklist";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

searchMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['keyword'] == null) {
    RCIWToast.showToast("keyword 为空");
    return;
  }

  if (arg['startTime'] == null) {
    RCIWToast.showToast("startTime 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String keyword = arg['keyword'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  int? code = await IMEngineManager().engine?.searchMessages(
        type,
        targetId,
        channelId,
        keyword,
        startTime,
        count,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

searchMessagesByTimeRange(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['keyword'] == null) {
    RCIWToast.showToast("keyword 为空");
    return;
  }

  if (arg['startTime'] == null) {
    RCIWToast.showToast("startTime 为空");
    return;
  }

  if (arg['endTime'] == null) {
    RCIWToast.showToast("endTime 为空");
    return;
  }

  if (arg['offset'] == null) {
    RCIWToast.showToast("offset 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String keyword = arg['keyword'];
  int startTime = int.parse(arg['startTime']);
  int endTime = int.parse(arg['endTime']);
  int offset = int.parse(arg['offset']);
  int count = int.parse(arg['count']);
  int? code = await IMEngineManager().engine?.searchMessagesByTimeRange(
        type,
        targetId,
        channelId,
        keyword,
        startTime,
        endTime,
        offset,
        count,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessagesByTimeRange";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

searchMessagesByUserId(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }

  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['startTime'] == null) {
    RCIWToast.showToast("startTime 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }

  String userId = arg['userId'];
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  int? code = await IMEngineManager().engine?.searchMessagesByUserId(
        userId,
        type,
        targetId,
        channelId,
        startTime,
        count,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessagesByUserId";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

searchConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  if (arg['messageTypes'] == null) {
    RCIWToast.showToast("messageTypes 为空");
    return;
  }

  if (arg['keyword'] == null) {
    RCIWToast.showToast("keyword 为空");
    return;
  }

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  List messageTypes = (arg["messageTypes"]).split(",");
  List<RCIMIWMessageType> messageTypesInt = [];
  for (var element in messageTypes) {
    messageTypesInt.add(RCIMIWMessageType.values[int.parse(element)]);
  }
  String keyword = arg['keyword'];
  int? code = await IMEngineManager().engine?.searchConversations(
        conversationTypesInt,
        channelId,
        messageTypesInt,
        keyword,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchConversations";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeNotificationQuietHours(Map arg) async {
  if (arg['startTime'] == null) {
    RCIWToast.showToast("startTime 为空");
    return;
  }

  if (arg['spanMins'] == null) {
    RCIWToast.showToast("spanMins 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }

  String startTime = arg['startTime'];
  int spanMins = int.parse(arg['spanMins']);
  RCIMIWPushNotificationQuietHoursLevel level =
      RCIMIWPushNotificationQuietHoursLevel.values[int.parse(arg['level'])];
  int? code = await IMEngineManager().engine?.changeNotificationQuietHours(
        startTime,
        spanMins,
        level,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeNotificationQuietHours";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeNotificationQuietHours() async {
  int? code = await IMEngineManager().engine?.removeNotificationQuietHours();
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeNotificationQuietHours";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadNotificationQuietHours() async {
  int? code = await IMEngineManager().engine?.loadNotificationQuietHours();
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadNotificationQuietHours";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeConversationNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  RCIMIWPushNotificationLevel level =
      RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  int? code =
      await IMEngineManager().engine?.changeConversationNotificationLevel(
            type,
            targetId,
            channelId,
            level,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadConversationNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadConversationNotificationLevel(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeConversationTypeNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  RCIMIWPushNotificationLevel level =
      RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  int? code =
      await IMEngineManager().engine?.changeConversationTypeNotificationLevel(
            type,
            level,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTypeNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadConversationTypeNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  int? code =
      await IMEngineManager().engine?.loadConversationTypeNotificationLevel(
            type,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationTypeNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeUltraGroupDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }

  String targetId = arg['targetId'];
  RCIMIWPushNotificationLevel level =
      RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  int? code =
      await IMEngineManager().engine?.changeUltraGroupDefaultNotificationLevel(
            targetId,
            level,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeUltraGroupDefaultNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUltraGroupDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code =
      await IMEngineManager().engine?.loadUltraGroupDefaultNotificationLevel(
            targetId,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupDefaultNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeUltraGroupChannelDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  RCIMIWPushNotificationLevel level =
      RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  int? code = await IMEngineManager()
      .engine
      ?.changeUltraGroupChannelDefaultNotificationLevel(
        targetId,
        channelId,
        level,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeUltraGroupChannelDefaultNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadUltraGroupChannelDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager()
      .engine
      ?.loadUltraGroupChannelDefaultNotificationLevel(
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupChannelDefaultNotificationLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changePushContentShowStatus(Map arg) async {
  if (arg['showContent'] == null) {
    RCIWToast.showToast("showContent 为空");
    return;
  }

  int showContentInt = int.parse(arg['showContent']);
  bool showContent = showContentInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.changePushContentShowStatus(
        showContent,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushContentShowStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changePushLanguage(Map arg) async {
  if (arg['language'] == null) {
    RCIWToast.showToast("language 为空");
    return;
  }

  String language = arg['language'];
  int? code = await IMEngineManager().engine?.changePushLanguage(
        language,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushLanguage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changePushReceiveStatus(Map arg) async {
  if (arg['receive'] == null) {
    RCIWToast.showToast("receive 为空");
    return;
  }

  int receiveInt = int.parse(arg['receive']);
  bool receive = receiveInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.changePushReceiveStatus(
        receive,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushReceiveStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendGroupMessageToDesignatedUsers(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }

  RCIMIWMessage message = arg['message'];
  List<String> userIds = (arg["userIds"]).split(",");
  int? code = await IMEngineManager().engine?.sendGroupMessageToDesignatedUsers(
        message,
        userIds,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendGroupMessageToDesignatedUsers";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadMessageCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadMessageCount(
        type,
        targetId,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadMessageCount";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadTopConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadTopConversations(
        conversationTypesInt,
        channelId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadTopConversations";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

syncUltraGroupReadStatus(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  int? code = await IMEngineManager().engine?.syncUltraGroupReadStatus(
        targetId,
        channelId,
        timestamp,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "syncUltraGroupReadStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadConversationsForAllChannel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadConversationsForAllChannel(
        type,
        targetId,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationsForAllChannel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

modifyUltraGroupMessage(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  String messageUId = arg['messageUId'];
  RCIMIWMessage message = arg['message'];
  int? code = await IMEngineManager().engine?.modifyUltraGroupMessage(
        messageUId,
        message,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "modifyUltraGroupMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

recallUltraGroupMessage(Map arg) async {
  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  if (arg['deleteRemote'] == null) {
    RCIWToast.showToast("deleteRemote 为空");
    return;
  }

  RCIMIWMessage message = arg['message'];
  int deleteRemoteInt = int.parse(arg['deleteRemote']);
  bool deleteRemote = deleteRemoteInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.recallUltraGroupMessage(
        message,
        deleteRemote,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "recallUltraGroupMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

clearUltraGroupMessages(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  if (arg['policy'] == null) {
    RCIWToast.showToast("policy 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  RCIMIWMessageOperationPolicy policy =
      RCIMIWMessageOperationPolicy.values[int.parse(arg['policy'])];
  int? code = await IMEngineManager().engine?.clearUltraGroupMessages(
        targetId,
        channelId,
        timestamp,
        policy,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUltraGroupMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendUltraGroupTypingStatus(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['typingStatus'] == null) {
    RCIWToast.showToast("typingStatus 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  RCIMIWUltraGroupTypingStatus typingStatus =
      RCIMIWUltraGroupTypingStatus.values[int.parse(arg['typingStatus'])];
  int? code = await IMEngineManager().engine?.sendUltraGroupTypingStatus(
        targetId,
        channelId,
        typingStatus,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendUltraGroupTypingStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

clearUltraGroupMessagesForAllChannel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  String targetId = arg['targetId'];
  int timestamp = int.parse(arg['timestamp']);
  int? code =
      await IMEngineManager().engine?.clearUltraGroupMessagesForAllChannel(
            targetId,
            timestamp,
          );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUltraGroupMessagesForAllChannel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

loadBatchRemoteUltraGroupMessages(Map arg) async {
  if (arg['messages'] == null) {
    RCIWToast.showToast("messages 为空");
    return;
  }

  List<RCIMIWMessage> messages = arg['messages'];
  int? code = await IMEngineManager().engine?.loadBatchRemoteUltraGroupMessages(
        messages,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBatchRemoteUltraGroupMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

updateUltraGroupMessageExpansion(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg["keys"] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }
  if (arg["values"] == null) {
    RCIWToast.showToast("values 为空");
    return;
  }

  String messageUId = arg['messageUId'];
  Map expansion = {};
  List keys = (arg["keys"]).split(",");
  List values = (arg["values"]).split(",");
  for (var i = 0; i < keys.length; i++) {
    expansion[keys[i]] = values[i];
  }

  int? code = await IMEngineManager().engine?.updateUltraGroupMessageExpansion(
        messageUId,
        expansion,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateUltraGroupMessageExpansion";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeUltraGroupMessageExpansion(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg['keys'] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }

  String messageUId = arg['messageUId'];
  List<String> keys = (arg["keys"]).split(",");
  int? code = await IMEngineManager().engine?.removeUltraGroupMessageExpansion(
        messageUId,
        keys,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeUltraGroupMessageExpansion";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

changeLogLevel(Map arg) async {
  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }

  RCIMIWLogLevel level = RCIMIWLogLevel.values[int.parse(arg['level'])];
  int? code = await IMEngineManager().engine?.changeLogLevel(
        level,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeLogLevel";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}
