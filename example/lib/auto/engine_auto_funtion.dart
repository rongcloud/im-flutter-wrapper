import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin_example/auto/im_engine.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/Toast.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';
import '../im_interface/function/engine_function.dart';

// auto
/*
//fun_registerNativeCustomMessage_call
int? ret = await engine?.registerNativeCustomMessage(messageIdentifier, persistentFlag);
//fun_registerNativeCustomMessage_call
*/

registerNativeCustomMessage(Map arg) async {
  if (arg['messageIdentifier'] == null) {
    RCIWToast.showToast("messageIdentifier 为空");
    return;
  }

  if (arg['persistentFlag'] == null) {
    RCIWToast.showToast("persistentFlag 为空");
    return;
  }

  String messageIdentifier = arg['messageIdentifier'];
  RCIMIWNativeCustomMessagePersistentFlag persistentFlag =
      RCIMIWNativeCustomMessagePersistentFlag.values[int.parse(arg['persistentFlag'])];
  int? code = await IMEngineManager().engine?.registerNativeCustomMessage(messageIdentifier, persistentFlag);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "registerNativeCustomMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_registerNativeCustomMediaMessage_call
int? ret = await engine?.registerNativeCustomMediaMessage(messageIdentifier, persistentFlag);
//fun_registerNativeCustomMediaMessage_call
*/

registerNativeCustomMediaMessage(Map arg) async {
  if (arg['messageIdentifier'] == null) {
    RCIWToast.showToast("messageIdentifier 为空");
    return;
  }

  if (arg['persistentFlag'] == null) {
    RCIWToast.showToast("persistentFlag 为空");
    return;
  }

  String messageIdentifier = arg['messageIdentifier'];
  RCIMIWNativeCustomMessagePersistentFlag persistentFlag =
      RCIMIWNativeCustomMessagePersistentFlag.values[int.parse(arg['persistentFlag'])];
  int? code = await IMEngineManager().engine?.registerNativeCustomMediaMessage(messageIdentifier, persistentFlag);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "registerNativeCustomMediaMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_connect_call
RCIMIWConnectCallback? callback = RCIMIWConnectCallback(onDatabaseOpened: (int? code) {
    //...
}, onConnected: (int? code, String? userId) {
    //...
});

int? ret = await engine?.connect(token, timeout, callback:callback);
//fun_connect_call
*/

connect(Map arg) async {
  if (arg['token'] == null) {
    RCIWToast.showToast("token 为空");
    return;
  }

  if (arg['timeout'] == null) {
    RCIWToast.showToast("timeout 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String token = arg['token'];
  int timeout = int.parse(arg['timeout']);
  RCIMIWConnectCallback? callback;
  if (useCallback == 1) {
    callback = RCIMIWConnectCallback(
      onDatabaseOpened: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "connect-onDatabaseOpened";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
      onConnected: (int? code, String? userId) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "connect-onConnected";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["userId"] = userId ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.connect(token, timeout, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "connect";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_disconnect_call
int? ret = await engine?.disconnect(receivePush);
//fun_disconnect_call
*/

disconnect(Map arg) async {
  if (arg['receivePush'] == null) {
    RCIWToast.showToast("receivePush 为空");
    return;
  }

  int receivePushInt = int.parse(arg['receivePush']);
  bool receivePush = receivePushInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.disconnect(receivePush);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "disconnect";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConnectionStatus_call
RCIMIWConnectionStatus? ret = await engine?.getConnectionStatus();
//fun_getConnectionStatus_call
*/
/*
//fun_createTextMessage_call
RCIMIWTextMessage? ret = await engine?.createTextMessage(type, targetId, channelId, text);
//fun_createTextMessage_call
*/
/*
//fun_createImageMessage_call
RCIMIWImageMessage? ret = await engine?.createImageMessage(type, targetId, channelId, path);
//fun_createImageMessage_call
*/
/*
//fun_createFileMessage_call
RCIMIWFileMessage? ret = await engine?.createFileMessage(type, targetId, channelId, path);
//fun_createFileMessage_call
*/
/*
//fun_createSightMessage_call
RCIMIWSightMessage? ret = await engine?.createSightMessage(type, targetId, channelId, path, duration);
//fun_createSightMessage_call
*/
/*
//fun_createVoiceMessage_call
RCIMIWVoiceMessage? ret = await engine?.createVoiceMessage(type, targetId, channelId, path, duration);
//fun_createVoiceMessage_call
*/
/*
//fun_createReferenceMessage_call
RCIMIWReferenceMessage? ret = await engine?.createReferenceMessage(type, targetId, channelId, referenceMessage, text);
//fun_createReferenceMessage_call
*/
/*
//fun_createGIFMessage_call
RCIMIWGIFMessage? ret = await engine?.createGIFMessage(type, targetId, channelId, path);
//fun_createGIFMessage_call
*/
/*
//fun_createCustomMessage_call
RCIMIWCustomMessage? ret = await engine?.createCustomMessage(type, targetId, channelId, policy, messageIdentifier, fields);
//fun_createCustomMessage_call
*/
/*
//fun_createLocationMessage_call
RCIMIWLocationMessage? ret = await engine?.createLocationMessage(type, targetId, channelId, longitude, latitude, poiName, thumbnailPath);
//fun_createLocationMessage_call
*/
/*
//fun_createNativeCustomMessage_call
RCIMIWNativeCustomMessage? ret = await engine?.createNativeCustomMessage(type, targetId, channelId, messageIdentifier, fields);
//fun_createNativeCustomMessage_call
*/
/*
//fun_createNativeCustomMediaMessage_call
RCIMIWNativeCustomMediaMessage? ret = await engine?.createNativeCustomMediaMessage(type, targetId, channelId, messageIdentifier, path, fields);
//fun_createNativeCustomMediaMessage_call
*/
/*
//fun_sendMessage_call
RCIMIWSendMessageCallback? callback = RCIMIWSendMessageCallback(onMessageSaved: (RCIMIWMessage? message) {
    //...
}, onMessageSent: (int? code, RCIMIWMessage? message) {
    //...
});

int? ret = await engine?.sendMessage(message, callback:callback);
//fun_sendMessage_call
*/
/*
//fun_sendMediaMessage_call
RCIMIWSendMediaMessageListener? listener = RCIMIWSendMediaMessageListener(onMediaMessageSaved: (RCIMIWMediaMessage? message) {
    //...
}, onMediaMessageSending: (RCIMIWMediaMessage? message, int? progress) {
    //...
}, onSendingMediaMessageCanceled: (RCIMIWMediaMessage? message) {
    //...
}, onMediaMessageSent: (int? code, RCIMIWMediaMessage? message) {
    //...
});

int? ret = await engine?.sendMediaMessage(message, listener:listener);
//fun_sendMediaMessage_call
*/
/*
//fun_cancelSendingMediaMessage_call
IRCIMIWCancelSendingMediaMessageCallback? callback = IRCIMIWCancelSendingMediaMessageCallback(onCancelSendingMediaMessageCalled: (int? code, RCIMIWMediaMessage? message) {
    //...
});

int? ret = await engine?.cancelSendingMediaMessage(message, callback:callback);
//fun_cancelSendingMediaMessage_call
*/
/*
//fun_downloadMediaMessage_call
RCIMIWDownloadMediaMessageListener? listener = RCIMIWDownloadMediaMessageListener(onMediaMessageDownloading: (RCIMIWMediaMessage? message, int? progress) {
    //...
}, onDownloadingMediaMessageCanceled: (RCIMIWMediaMessage? message) {
    //...
}, onMediaMessageDownloaded: (int? code, RCIMIWMediaMessage? message) {
    //...
});

int? ret = await engine?.downloadMediaMessage(message, listener:listener);
//fun_downloadMediaMessage_call
*/
/*
//fun_cancelDownloadingMediaMessage_call
IRCIMIWCancelDownloadingMediaMessageCallback? callback = IRCIMIWCancelDownloadingMediaMessageCallback(onCancelDownloadingMediaMessageCalled: (int? code, RCIMIWMediaMessage? message) {
    //...
});

int? ret = await engine?.cancelDownloadingMediaMessage(message, callback:callback);
//fun_cancelDownloadingMediaMessage_call
*/
/*
//fun_loadConversation_call
int? ret = await engine?.loadConversation(type, targetId, channelId);
//fun_loadConversation_call
*/

loadConversation(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadConversation(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversation";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversation_call
IRCIMIWGetConversationCallback? callback = IRCIMIWGetConversationCallback(onSuccess: (RCIMIWConversation? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversation(type, targetId, channelId, callback:callback);
//fun_getConversation_call
*/

getConversation(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetConversationCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationCallback(
      onSuccess: (RCIMIWConversation? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversation-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = formatJson(t?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversation-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversation(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversation";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadConversations_call
int? ret = await engine?.loadConversations(conversationTypesInt, channelId, startTime, count);
//fun_loadConversations_call
*/

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
  int? code = await IMEngineManager().engine?.loadConversations(conversationTypesInt, channelId, startTime, count);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversations_call
IRCIMIWGetConversationsCallback? callback = IRCIMIWGetConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversations(conversationTypesInt, channelId, startTime, count, callback:callback);
//fun_getConversations_call
*/

getConversations(Map arg) async {
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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  IRCIMIWGetConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationsCallback(
      onSuccess: (List<RCIMIWConversation>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversations-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversations-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversations(
    conversationTypesInt,
    channelId,
    startTime,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversationsWithPriority_call
IRCIMIWGetConversationsCallback? callback = IRCIMIWGetConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversationsWithPriority(conversationTypesInt, channelId, startTime, count, topPriority, callback:callback);
//fun_getConversationsWithPriority_call
*/

getConversationsWithPriority(Map arg) async {
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

  if (arg['topPriority'] == null) {
    RCIWToast.showToast("topPriority 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  int topPriorityInt = int.parse(arg['topPriority']);
  bool topPriority = topPriorityInt == 0 ? false : true;
  IRCIMIWGetConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationsCallback(
      onSuccess: (List<RCIMIWConversation>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationsWithPriority-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationsWithPriority-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversationsWithPriority(
    conversationTypesInt,
    channelId,
    startTime,
    count,
    topPriority,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationsWithPriority";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUnreadConversations_call
IRCIMIWGetUnreadConversationsCallback? callback = IRCIMIWGetUnreadConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUnreadConversations(conversationTypesInt, callback:callback);
//fun_getUnreadConversations_call
*/

getUnreadConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  IRCIMIWGetUnreadConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUnreadConversationsCallback(
      onSuccess: (List<RCIMIWConversation>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadConversations-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadConversations-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUnreadConversations(conversationTypesInt, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeConversation_call
IRCIMIWRemoveConversationCallback? callback = IRCIMIWRemoveConversationCallback(onConversationRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeConversation(type, targetId, channelId, callback:callback);
//fun_removeConversation_call
*/

removeConversation(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWRemoveConversationCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveConversationCallback(
      onConversationRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeConversation-onConversationRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeConversation(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeConversation";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeConversations_call
IRCIMIWRemoveConversationsCallback? callback = IRCIMIWRemoveConversationsCallback(onConversationsRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeConversations(conversationTypesInt, channelId, callback:callback);
//fun_removeConversations_call
*/

removeConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  IRCIMIWRemoveConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveConversationsCallback(
      onConversationsRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeConversations-onConversationsRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeConversations(conversationTypesInt, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUnreadCount_call
int? ret = await engine?.loadUnreadCount(type, targetId, channelId);
//fun_loadUnreadCount_call
*/

loadUnreadCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadUnreadCount(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUnreadCount_call
IRCIMIWGetUnreadCountCallback? callback = IRCIMIWGetUnreadCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUnreadCount(type, targetId, channelId, callback:callback);
//fun_getUnreadCount_call
*/

getUnreadCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetUnreadCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUnreadCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUnreadCount(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadTotalUnreadCount_call
int? ret = await engine?.loadTotalUnreadCount(channelId);
//fun_loadTotalUnreadCount_call
*/

loadTotalUnreadCount(Map arg) async {
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadTotalUnreadCount(channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadTotalUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getTotalUnreadCount_call
IRCIMIWGetTotalUnreadCountCallback? callback = IRCIMIWGetTotalUnreadCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getTotalUnreadCount(channelId, callback:callback);
//fun_getTotalUnreadCount_call
*/

getTotalUnreadCount(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String? channelId = arg['channelId'];
  IRCIMIWGetTotalUnreadCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetTotalUnreadCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTotalUnreadCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTotalUnreadCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getTotalUnreadCount(channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getTotalUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUnreadMentionedCount_call
int? ret = await engine?.loadUnreadMentionedCount(type, targetId, channelId);
//fun_loadUnreadMentionedCount_call
*/

loadUnreadMentionedCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadUnreadMentionedCount(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadMentionedCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUnreadMentionedCount_call
IRCIMIWGetUnreadMentionedCountCallback? callback = IRCIMIWGetUnreadMentionedCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUnreadMentionedCount(type, targetId, channelId, callback:callback);
//fun_getUnreadMentionedCount_call
*/

getUnreadMentionedCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetUnreadMentionedCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUnreadMentionedCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadMentionedCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadMentionedCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUnreadMentionedCount(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadMentionedCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUltraGroupAllUnreadCount_call
int? ret = await engine?.loadUltraGroupAllUnreadCount();
//fun_loadUltraGroupAllUnreadCount_call
*/

loadUltraGroupAllUnreadCount() async {
  int? code = await IMEngineManager().engine?.loadUltraGroupAllUnreadCount();
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupAllUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUltraGroupAllUnreadCount_call
IRCIMIWGetUltraGroupAllUnreadCountCallback? callback = IRCIMIWGetUltraGroupAllUnreadCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUltraGroupAllUnreadCount(callback:callback);
//fun_getUltraGroupAllUnreadCount_call
*/

getUltraGroupAllUnreadCount(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetUltraGroupAllUnreadCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUltraGroupAllUnreadCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupAllUnreadCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupAllUnreadCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUltraGroupAllUnreadCount(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupAllUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUltraGroupAllUnreadMentionedCount_call
int? ret = await engine?.loadUltraGroupAllUnreadMentionedCount();
//fun_loadUltraGroupAllUnreadMentionedCount_call
*/

loadUltraGroupAllUnreadMentionedCount() async {
  int? code = await IMEngineManager().engine?.loadUltraGroupAllUnreadMentionedCount();
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupAllUnreadMentionedCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUltraGroupAllUnreadMentionedCount_call
IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback = IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUltraGroupAllUnreadMentionedCount(callback:callback);
//fun_getUltraGroupAllUnreadMentionedCount_call
*/

getUltraGroupAllUnreadMentionedCount(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupAllUnreadMentionedCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupAllUnreadMentionedCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUltraGroupAllUnreadMentionedCount(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupAllUnreadMentionedCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUltraGroupUnreadCount_call
int? ret = await engine?.loadUltraGroupUnreadCount(targetId);
//fun_loadUltraGroupUnreadCount_call
*/

loadUltraGroupUnreadCount(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadUltraGroupUnreadCount(targetId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUltraGroupUnreadCount_call
IRCIMIWGetUltraGroupUnreadCountCallback? callback = IRCIMIWGetUltraGroupUnreadCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUltraGroupUnreadCount(targetId, callback:callback);
//fun_getUltraGroupUnreadCount_call
*/

getUltraGroupUnreadCount(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  IRCIMIWGetUltraGroupUnreadCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUltraGroupUnreadCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupUnreadCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupUnreadCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUltraGroupUnreadCount(targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUltraGroupUnreadMentionedCount_call
int? ret = await engine?.loadUltraGroupUnreadMentionedCount(targetId);
//fun_loadUltraGroupUnreadMentionedCount_call
*/

loadUltraGroupUnreadMentionedCount(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadUltraGroupUnreadMentionedCount(targetId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupUnreadMentionedCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUltraGroupUnreadMentionedCount_call
IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback = IRCIMIWGetUltraGroupUnreadMentionedCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUltraGroupUnreadMentionedCount(targetId, callback:callback);
//fun_getUltraGroupUnreadMentionedCount_call
*/

getUltraGroupUnreadMentionedCount(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUltraGroupUnreadMentionedCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupUnreadMentionedCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupUnreadMentionedCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUltraGroupUnreadMentionedCount(targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupUnreadMentionedCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUnreadCountByConversationTypes_call
int? ret = await engine?.loadUnreadCountByConversationTypes(conversationTypesInt, channelId, contain);
//fun_loadUnreadCountByConversationTypes_call
*/

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
  int? code = await IMEngineManager().engine?.loadUnreadCountByConversationTypes(
    conversationTypesInt,
    channelId,
    contain,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadCountByConversationTypes";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUnreadCountByConversationTypes_call
IRCIMIWGetUnreadCountByConversationTypesCallback? callback = IRCIMIWGetUnreadCountByConversationTypesCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUnreadCountByConversationTypes(conversationTypesInt, channelId, contain, callback:callback);
//fun_getUnreadCountByConversationTypes_call
*/

getUnreadCountByConversationTypes(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  if (arg['contain'] == null) {
    RCIWToast.showToast("contain 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  int containInt = int.parse(arg['contain']);
  bool contain = containInt == 0 ? false : true;
  IRCIMIWGetUnreadCountByConversationTypesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUnreadCountByConversationTypesCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCountByConversationTypes-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCountByConversationTypes-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUnreadCountByConversationTypes(
    conversationTypesInt,
    channelId,
    contain,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadCountByConversationTypes";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUnreadCountByLevels_call
IRCIMIWGetUnreadCountByLevelsCallback? callback = IRCIMIWGetUnreadCountByLevelsCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUnreadCountByLevels(conversationTypesInt, levelsInt, callback:callback);
//fun_getUnreadCountByLevels_call
*/

getUnreadCountByLevels(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }

  if (arg['levels'] == null) {
    RCIWToast.showToast("levels 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }

  List levels = (arg["levels"]).split(",");
  List<RCIMIWPushNotificationLevel> levelsInt = [];
  for (var element in levels) {
    levelsInt.add(RCIMIWPushNotificationLevel.values[int.parse(element)]);
  }
  IRCIMIWGetUnreadCountByLevelsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUnreadCountByLevelsCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCountByLevels-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCountByLevels-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUnreadCountByLevels(
    conversationTypesInt,
    levelsInt,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadCountByLevels";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_clearUnreadCount_call
IRCIMIWClearUnreadCountCallback? callback = IRCIMIWClearUnreadCountCallback(onUnreadCountCleared: (int? code) {
    //...
});

int? ret = await engine?.clearUnreadCount(type, targetId, channelId, timestamp, callback:callback);
//fun_clearUnreadCount_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  IRCIMIWClearUnreadCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWClearUnreadCountCallback(
      onUnreadCountCleared: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearUnreadCount-onUnreadCountCleared";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.clearUnreadCount(
    type,
    targetId,
    channelId,
    timestamp,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUnreadCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_saveDraftMessage_call
IRCIMIWSaveDraftMessageCallback? callback = IRCIMIWSaveDraftMessageCallback(onDraftMessageSaved: (int? code) {
    //...
});

int? ret = await engine?.saveDraftMessage(type, targetId, channelId, draft, callback:callback);
//fun_saveDraftMessage_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String draft = arg['draft'];
  IRCIMIWSaveDraftMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSaveDraftMessageCallback(
      onDraftMessageSaved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "saveDraftMessage-onDraftMessageSaved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.saveDraftMessage(type, targetId, channelId, draft, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "saveDraftMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadDraftMessage_call
int? ret = await engine?.loadDraftMessage(type, targetId, channelId);
//fun_loadDraftMessage_call
*/

loadDraftMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadDraftMessage(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadDraftMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getDraftMessage_call
IRCIMIWGetDraftMessageCallback? callback = IRCIMIWGetDraftMessageCallback(onSuccess: (String? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getDraftMessage(type, targetId, channelId, callback:callback);
//fun_getDraftMessage_call
*/

getDraftMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetDraftMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetDraftMessageCallback(
      onSuccess: (String? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getDraftMessage-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t ?? "";

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getDraftMessage-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getDraftMessage(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getDraftMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_clearDraftMessage_call
IRCIMIWClearDraftMessageCallback? callback = IRCIMIWClearDraftMessageCallback(onDraftMessageCleared: (int? code) {
    //...
});

int? ret = await engine?.clearDraftMessage(type, targetId, channelId, callback:callback);
//fun_clearDraftMessage_call
*/

clearDraftMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWClearDraftMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWClearDraftMessageCallback(
      onDraftMessageCleared: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearDraftMessage-onDraftMessageCleared";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.clearDraftMessage(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearDraftMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadBlockedConversations_call
int? ret = await engine?.loadBlockedConversations(conversationTypesInt, channelId);
//fun_loadBlockedConversations_call
*/

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
  int? code = await IMEngineManager().engine?.loadBlockedConversations(conversationTypesInt, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlockedConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getBlockedConversations_call
IRCIMIWGetBlockedConversationsCallback? callback = IRCIMIWGetBlockedConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getBlockedConversations(conversationTypesInt, channelId, callback:callback);
//fun_getBlockedConversations_call
*/

getBlockedConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  IRCIMIWGetBlockedConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetBlockedConversationsCallback(
      onSuccess: (List<RCIMIWConversation>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBlockedConversations-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBlockedConversations-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getBlockedConversations(
    conversationTypesInt,
    channelId,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBlockedConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeConversationTopStatus_call
IRCIMIWChangeConversationTopStatusCallback? callback = IRCIMIWChangeConversationTopStatusCallback(onConversationTopStatusChanged: (int? code) {
    //...
});

int? ret = await engine?.changeConversationTopStatus(type, targetId, channelId, top, callback:callback);
//fun_changeConversationTopStatus_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int topInt = int.parse(arg['top']);
  bool top = topInt == 0 ? false : true;
  IRCIMIWChangeConversationTopStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeConversationTopStatusCallback(
      onConversationTopStatusChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeConversationTopStatus-onConversationTopStatusChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeConversationTopStatus(
    type,
    targetId,
    channelId,
    top,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTopStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeConversationTopStatusWithUpdateTme_call
IRCIMIWChangeConversationTopStatusCallback? callback = IRCIMIWChangeConversationTopStatusCallback(onConversationTopStatusChanged: (int? code) {
    //...
});

int? ret = await engine?.changeConversationTopStatusWithUpdateTme(type, targetId, channelId, top, updateOperationTime, callback:callback);
//fun_changeConversationTopStatusWithUpdateTme_call
*/

changeConversationTopStatusWithUpdateTme(Map arg) async {
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

  if (arg['updateOperationTime'] == null) {
    RCIWToast.showToast("updateOperationTime 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int topInt = int.parse(arg['top']);
  bool top = topInt == 0 ? false : true;
  int updateOperationTimeInt = int.parse(arg['updateOperationTime']);
  bool updateOperationTime = updateOperationTimeInt == 0 ? false : true;
  IRCIMIWChangeConversationTopStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeConversationTopStatusCallback(
      onConversationTopStatusChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeConversationTopStatusWithUpdateTme-onConversationTopStatusChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeConversationTopStatusWithUpdateTme(
    type,
    targetId,
    channelId,
    top,
    updateOperationTime,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTopStatusWithUpdateTme";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadConversationTopStatus_call
int? ret = await engine?.loadConversationTopStatus(type, targetId, channelId);
//fun_loadConversationTopStatus_call
*/

loadConversationTopStatus(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadConversationTopStatus(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationTopStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversationTopStatus_call
IRCIMIWGetConversationTopStatusCallback? callback = IRCIMIWGetConversationTopStatusCallback(onSuccess: (bool? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversationTopStatus(type, targetId, channelId, callback:callback);
//fun_getConversationTopStatus_call
*/

getConversationTopStatus(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetConversationTopStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationTopStatusCallback(
      onSuccess: (bool? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationTopStatus-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationTopStatus-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversationTopStatus(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationTopStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_syncConversationReadStatus_call
IRCIMIWSyncConversationReadStatusCallback? callback = IRCIMIWSyncConversationReadStatusCallback(onConversationReadStatusSynced: (int? code) {
    //...
});

int? ret = await engine?.syncConversationReadStatus(type, targetId, channelId, timestamp, callback:callback);
//fun_syncConversationReadStatus_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  IRCIMIWSyncConversationReadStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSyncConversationReadStatusCallback(
      onConversationReadStatusSynced: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "syncConversationReadStatus-onConversationReadStatusSynced";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.syncConversationReadStatus(
    type,
    targetId,
    channelId,
    timestamp,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "syncConversationReadStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_sendTypingStatus_call
int? ret = await engine?.sendTypingStatus(type, targetId, channelId, currentType);
//fun_sendTypingStatus_call
*/

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

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String currentType = arg['currentType'];
  int? code = await IMEngineManager().engine?.sendTypingStatus(type, targetId, channelId, currentType);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendTypingStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadMessages_call
int? ret = await engine?.loadMessages(type, targetId, channelId, sentTime, order, policy, count);
//fun_loadMessages_call
*/

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

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int sentTime = int.parse(arg['sentTime']);
  RCIMIWTimeOrder order = RCIMIWTimeOrder.values[int.parse(arg['order'])];
  RCIMIWMessageOperationPolicy policy = RCIMIWMessageOperationPolicy.values[int.parse(arg['policy'])];
  int count = int.parse(arg['count']);
  int? code = await IMEngineManager().engine?.loadMessages(type, targetId, channelId, sentTime, order, policy, count);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getMessages_call
IRCIMIWGetMessagesCallback? callback = IRCIMIWGetMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getMessages(type, targetId, channelId, sentTime, order, policy, count, callback:callback);
//fun_getMessages_call
*/

getMessages(Map arg) async {
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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int sentTime = int.parse(arg['sentTime']);
  RCIMIWTimeOrder order = RCIMIWTimeOrder.values[int.parse(arg['order'])];
  RCIMIWMessageOperationPolicy policy = RCIMIWMessageOperationPolicy.values[int.parse(arg['policy'])];
  int count = int.parse(arg['count']);
  IRCIMIWGetMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetMessagesCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMessages-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMessages-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getMessages(
    type,
    targetId,
    channelId,
    sentTime,
    order,
    policy,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getMessageById_call
IRCIMIWGetMessageCallback? callback = IRCIMIWGetMessageCallback(onSuccess: (RCIMIWMessage? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getMessageById(messageId, callback:callback);
//fun_getMessageById_call
*/
/*
//fun_getMessageByUId_call
IRCIMIWGetMessageCallback? callback = IRCIMIWGetMessageCallback(onSuccess: (RCIMIWMessage? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getMessageByUId(messageUId, callback:callback);
//fun_getMessageByUId_call
*/
/*
//fun_getMessagesAroundTime_call
IRCIMIWGetMessagesAroundTimeCallback? callback = IRCIMIWGetMessagesAroundTimeCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getMessagesAroundTime(type, targetId, channelId, sentTime, beforeCount, afterCount, callback:callback);
//fun_getMessagesAroundTime_call
*/

getMessagesAroundTime(Map arg) async {
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

  if (arg['beforeCount'] == null) {
    RCIWToast.showToast("beforeCount 为空");
    return;
  }

  if (arg['afterCount'] == null) {
    RCIWToast.showToast("afterCount 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int sentTime = int.parse(arg['sentTime']);
  int beforeCount = int.parse(arg['beforeCount']);
  int afterCount = int.parse(arg['afterCount']);
  IRCIMIWGetMessagesAroundTimeCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetMessagesAroundTimeCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMessagesAroundTime-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMessagesAroundTime-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getMessagesAroundTime(
    type,
    targetId,
    channelId,
    sentTime,
    beforeCount,
    afterCount,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMessagesAroundTime";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getLocalMessagesByMessageTypes_call
IRCIMIWGetMessagesCallback? callback = IRCIMIWGetMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getLocalMessagesByMessageTypes(type, targetId, channelId, messageTypesInt, sentTime, order, count, callback:callback);
//fun_getLocalMessagesByMessageTypes_call
*/

getLocalMessagesByMessageTypes(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['messageTypes'] == null) {
    RCIWToast.showToast("messageTypes 为空");
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

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  List messageTypes = (arg["messageTypes"]).split(",");
  List<RCIMIWMessageType> messageTypesInt = [];
  for (var element in messageTypes) {
    messageTypesInt.add(RCIMIWMessageType.values[int.parse(element)]);
  }
  int sentTime = int.parse(arg['sentTime']);
  RCIMIWTimeOrder order = RCIMIWTimeOrder.values[int.parse(arg['order'])];
  int count = int.parse(arg['count']);
  IRCIMIWGetMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetMessagesCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getLocalMessagesByMessageTypes-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getLocalMessagesByMessageTypes-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getLocalMessagesByMessageTypes(
    type,
    targetId,
    channelId,
    messageTypesInt,
    sentTime,
    order,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getLocalMessagesByMessageTypes";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadFirstUnreadMessage_call
int? ret = await engine?.loadFirstUnreadMessage(type, targetId, channelId);
//fun_loadFirstUnreadMessage_call
*/

loadFirstUnreadMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadFirstUnreadMessage(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadFirstUnreadMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getFirstUnreadMessage_call
IRCIMIWGetFirstUnreadMessageCallback? callback = IRCIMIWGetFirstUnreadMessageCallback(onSuccess: (RCIMIWMessage? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getFirstUnreadMessage(type, targetId, channelId, callback:callback);
//fun_getFirstUnreadMessage_call
*/

getFirstUnreadMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetFirstUnreadMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetFirstUnreadMessageCallback(
      onSuccess: (RCIMIWMessage? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getFirstUnreadMessage-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = formatJson(t?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getFirstUnreadMessage-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getFirstUnreadMessage(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getFirstUnreadMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUnreadMentionedMessages_call
int? ret = await engine?.loadUnreadMentionedMessages(type, targetId, channelId);
//fun_loadUnreadMentionedMessages_call
*/

loadUnreadMentionedMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadUnreadMentionedMessages(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadMentionedMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUnreadMentionedMessages_call
IRCIMIWGetUnreadMentionedMessagesCallback? callback = IRCIMIWGetUnreadMentionedMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUnreadMentionedMessages(type, targetId, channelId, callback:callback);
//fun_getUnreadMentionedMessages_call
*/

getUnreadMentionedMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetUnreadMentionedMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUnreadMentionedMessagesCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadMentionedMessages-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadMentionedMessages-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUnreadMentionedMessages(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadMentionedMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_insertMessage_call
IRCIMIWInsertMessageCallback? callback = IRCIMIWInsertMessageCallback(onMessageInserted: (int? code, RCIMIWMessage? message) {
    //...
});

int? ret = await engine?.insertMessage(message, callback:callback);
//fun_insertMessage_call
*/
/*
//fun_insertMessages_call
IRCIMIWInsertMessagesCallback? callback = IRCIMIWInsertMessagesCallback(onMessagesInserted: (int? code, List<RCIMIWMessage>? messages) {
    //...
});

int? ret = await engine?.insertMessages(messages, callback:callback);
//fun_insertMessages_call
*/
/*
//fun_clearMessages_call
IRCIMIWClearMessagesCallback? callback = IRCIMIWClearMessagesCallback(onMessagesCleared: (int? code) {
    //...
});

int? ret = await engine?.clearMessages(type, targetId, channelId, timestamp, policy, callback:callback);
//fun_clearMessages_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  RCIMIWMessageOperationPolicy policy = RCIMIWMessageOperationPolicy.values[int.parse(arg['policy'])];
  IRCIMIWClearMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWClearMessagesCallback(
      onMessagesCleared: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearMessages-onMessagesCleared";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.clearMessages(
    type,
    targetId,
    channelId,
    timestamp,
    policy,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_deleteLocalMessages_call
IRCIMIWDeleteLocalMessagesCallback? callback = IRCIMIWDeleteLocalMessagesCallback(onLocalMessagesDeleted: (int? code, List<RCIMIWMessage>? messages) {
    //...
});

int? ret = await engine?.deleteLocalMessages(messages, callback:callback);
//fun_deleteLocalMessages_call
*/
/*
//fun_deleteLocalMessageByIds_call
IRCIMIWDeleteLocalMessageByIdsCallback? callback = IRCIMIWDeleteLocalMessageByIdsCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.deleteLocalMessageByIds(messageIds, callback:callback);
//fun_deleteLocalMessageByIds_call
*/

deleteLocalMessageByIds(Map arg) async {
  if (arg['messageIds'] == null) {
    RCIWToast.showToast("messageIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<int> messageIds = (arg["messageIds"]).split(",");
  IRCIMIWDeleteLocalMessageByIdsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWDeleteLocalMessageByIdsCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "deleteLocalMessageByIds-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.deleteLocalMessageByIds(messageIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "deleteLocalMessageByIds";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_deleteMessages_call
IRCIMIWDeleteMessagesCallback? callback = IRCIMIWDeleteMessagesCallback(onMessagesDeleted: (int? code, List<RCIMIWMessage>? messages) {
    //...
});

int? ret = await engine?.deleteMessages(type, targetId, channelId, messages, callback:callback);
//fun_deleteMessages_call
*/
/*
//fun_recallMessage_call
IRCIMIWRecallMessageCallback? callback = IRCIMIWRecallMessageCallback(onMessageRecalled: (int? code, RCIMIWMessage? message) {
    //...
});

int? ret = await engine?.recallMessage(message, callback:callback);
//fun_recallMessage_call
*/
/*
//fun_sendPrivateReadReceiptMessage_call
IRCIMIWSendPrivateReadReceiptMessageCallback? callback = IRCIMIWSendPrivateReadReceiptMessageCallback(onPrivateReadReceiptMessageSent: (int? code) {
    //...
});

int? ret = await engine?.sendPrivateReadReceiptMessage(targetId, channelId, timestamp, callback:callback);
//fun_sendPrivateReadReceiptMessage_call
*/

sendPrivateReadReceiptMessage(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  IRCIMIWSendPrivateReadReceiptMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSendPrivateReadReceiptMessageCallback(
      onPrivateReadReceiptMessageSent: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "sendPrivateReadReceiptMessage-onPrivateReadReceiptMessageSent";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.sendPrivateReadReceiptMessage(
    targetId,
    channelId,
    timestamp,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendPrivateReadReceiptMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_sendGroupReadReceiptRequest_call
IRCIMIWSendGroupReadReceiptRequestCallback? callback = IRCIMIWSendGroupReadReceiptRequestCallback(onGroupReadReceiptRequestSent: (int? code, RCIMIWMessage? message) {
    //...
});

int? ret = await engine?.sendGroupReadReceiptRequest(message, callback:callback);
//fun_sendGroupReadReceiptRequest_call
*/
/*
//fun_sendGroupReadReceiptResponse_call
IRCIMIWSendGroupReadReceiptResponseCallback? callback = IRCIMIWSendGroupReadReceiptResponseCallback(onGroupReadReceiptResponseSent: (int? code, List<RCIMIWMessage>? message) {
    //...
});

int? ret = await engine?.sendGroupReadReceiptResponse(targetId, channelId, messages, callback:callback);
//fun_sendGroupReadReceiptResponse_call
*/
/*
//fun_updateMessageExpansion_call
IRCIMIWUpdateMessageExpansionCallback? callback = IRCIMIWUpdateMessageExpansionCallback(onMessageExpansionUpdated: (int? code) {
    //...
});

int? ret = await engine?.updateMessageExpansion(messageUId, expansion, callback:callback);
//fun_updateMessageExpansion_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String messageUId = arg['messageUId'];
  Map expansion = {};
  List keys = (arg["keys"]).split(",");
  List values = (arg["values"]).split(",");
  for (var i = 0; i < keys.length; i++) {
    expansion[keys[i]] = values[i];
  }
  IRCIMIWUpdateMessageExpansionCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateMessageExpansionCallback(
      onMessageExpansionUpdated: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateMessageExpansion-onMessageExpansionUpdated";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.updateMessageExpansion(messageUId, expansion, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateMessageExpansion";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeMessageExpansionForKeys_call
IRCIMIWRemoveMessageExpansionForKeysCallback? callback = IRCIMIWRemoveMessageExpansionForKeysCallback(onMessageExpansionForKeysRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeMessageExpansionForKeys(messageUId, keys, callback:callback);
//fun_removeMessageExpansionForKeys_call
*/

removeMessageExpansionForKeys(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg['keys'] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String messageUId = arg['messageUId'];
  List<String> keys = (arg["keys"]).split(",");
  IRCIMIWRemoveMessageExpansionForKeysCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveMessageExpansionForKeysCallback(
      onMessageExpansionForKeysRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeMessageExpansionForKeys-onMessageExpansionForKeysRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeMessageExpansionForKeys(messageUId, keys, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeMessageExpansionForKeys";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeMessageSentStatus_call
IRCIMIWChangeMessageSentStatusCallback? callback = IRCIMIWChangeMessageSentStatusCallback(onMessageSentStatusChanged: (int? code) {
    //...
});

int? ret = await engine?.changeMessageSentStatus(messageId, sentStatus, callback:callback);
//fun_changeMessageSentStatus_call
*/

changeMessageSentStatus(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['sentStatus'] == null) {
    RCIWToast.showToast("sentStatus 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  int messageId = int.parse(arg['messageId']);
  RCIMIWSentStatus sentStatus = RCIMIWSentStatus.values[int.parse(arg['sentStatus'])];
  IRCIMIWChangeMessageSentStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeMessageSentStatusCallback(
      onMessageSentStatusChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeMessageSentStatus-onMessageSentStatusChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeMessageSentStatus(messageId, sentStatus, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeMessageSentStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeMessageReceiveStatus_call
IRCIMIWChangeMessageReceivedStatusCallback? callback = IRCIMIWChangeMessageReceivedStatusCallback(onMessageReceiveStatusChanged: (int? code) {
    //...
});

int? ret = await engine?.changeMessageReceiveStatus(messageId, receivedStatus, callback:callback);
//fun_changeMessageReceiveStatus_call
*/

changeMessageReceiveStatus(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['receivedStatus'] == null) {
    RCIWToast.showToast("receivedStatus 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  int messageId = int.parse(arg['messageId']);
  RCIMIWReceivedStatus receivedStatus = RCIMIWReceivedStatus.values[int.parse(arg['receivedStatus'])];
  IRCIMIWChangeMessageReceivedStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeMessageReceivedStatusCallback(
      onMessageReceiveStatusChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeMessageReceiveStatus-onMessageReceiveStatusChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeMessageReceiveStatus(messageId, receivedStatus, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeMessageReceiveStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeMessageReceiveStatusInfo_call
IRCIMIWChangeMessageReceivedStatusInfoCallback? callback = IRCIMIWChangeMessageReceivedStatusInfoCallback(onMessageReceiveStatusInfoChanged: (int? code) {
    //...
});

int? ret = await engine?.changeMessageReceiveStatusInfo(messageId, receivedStatusInfo, callback:callback);
//fun_changeMessageReceiveStatusInfo_call
*/

changeMessageReceiveStatusInfo(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['receivedStatusInfo'] == null) {
    RCIWToast.showToast("receivedStatusInfo 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  int messageId = int.parse(arg['messageId']);
  RCIMIWReceivedStatusInfo receivedStatusInfo = arg['receivedStatusInfo'];
  IRCIMIWChangeMessageReceivedStatusInfoCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeMessageReceivedStatusInfoCallback(
      onMessageReceiveStatusInfoChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeMessageReceiveStatusInfo-onMessageReceiveStatusInfoChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeMessageReceiveStatusInfo(
    messageId,
    receivedStatusInfo,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeMessageReceiveStatusInfo";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_updateMessageLocalExtra_call
IRCIMIWUpdateMessageLocalExtraCallback? callback = IRCIMIWUpdateMessageLocalExtraCallback(onMessageLocalExtraUpdated: (int? code) {
    //...
});

int? ret = await engine?.updateMessageLocalExtra(messageId, extra, callback:callback);
//fun_updateMessageLocalExtra_call
*/

updateMessageLocalExtra(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['extra'] == null) {
    RCIWToast.showToast("extra 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  int messageId = int.parse(arg['messageId']);
  String extra = arg['extra'];
  IRCIMIWUpdateMessageLocalExtraCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateMessageLocalExtraCallback(
      onMessageLocalExtraUpdated: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateMessageLocalExtra-onMessageLocalExtraUpdated";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.updateMessageLocalExtra(messageId, extra, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateMessageLocalExtra";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_joinChatRoom_call
IRCIMIWJoinChatRoomCallback? callback = IRCIMIWJoinChatRoomCallback(onChatRoomJoined: (int? code, String? targetId) {
    //...
});

int? ret = await engine?.joinChatRoom(targetId, messageCount, autoCreate, callback:callback);
//fun_joinChatRoom_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  int messageCount = int.parse(arg['messageCount']);
  int autoCreateInt = int.parse(arg['autoCreate']);
  bool autoCreate = autoCreateInt == 0 ? false : true;
  IRCIMIWJoinChatRoomCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWJoinChatRoomCallback(
      onChatRoomJoined: (int? code, String? targetId) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "joinChatRoom-onChatRoomJoined";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["targetId"] = targetId ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.joinChatRoom(targetId, messageCount, autoCreate, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "joinChatRoom";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_leaveChatRoom_call
IRCIMIWLeaveChatRoomCallback? callback = IRCIMIWLeaveChatRoomCallback(onChatRoomLeft: (int? code, String? targetId) {
    //...
});

int? ret = await engine?.leaveChatRoom(targetId, callback:callback);
//fun_leaveChatRoom_call
*/

leaveChatRoom(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  IRCIMIWLeaveChatRoomCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWLeaveChatRoomCallback(
      onChatRoomLeft: (int? code, String? targetId) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "leaveChatRoom-onChatRoomLeft";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["targetId"] = targetId ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.leaveChatRoom(targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "leaveChatRoom";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadChatRoomMessages_call
int? ret = await engine?.loadChatRoomMessages(targetId, timestamp, order, count);
//fun_loadChatRoomMessages_call
*/

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
  int? code = await IMEngineManager().engine?.loadChatRoomMessages(targetId, timestamp, order, count);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getChatRoomMessages_call
IRCIMIWGetChatRoomMessagesCallback? callback = IRCIMIWGetChatRoomMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getChatRoomMessages(targetId, timestamp, order, count, callback:callback);
//fun_getChatRoomMessages_call
*/

getChatRoomMessages(Map arg) async {
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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  int timestamp = int.parse(arg['timestamp']);
  RCIMIWTimeOrder order = RCIMIWTimeOrder.values[int.parse(arg['order'])];
  int count = int.parse(arg['count']);
  IRCIMIWGetChatRoomMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetChatRoomMessagesCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getChatRoomMessages-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getChatRoomMessages-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getChatRoomMessages(
    targetId,
    timestamp,
    order,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getChatRoomMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_addChatRoomEntry_call
IRCIMIWAddChatRoomEntryCallback? callback = IRCIMIWAddChatRoomEntryCallback(onChatRoomEntryAdded: (int? code) {
    //...
});

int? ret = await engine?.addChatRoomEntry(targetId, key, value, deleteWhenLeft, overwrite, callback:callback);
//fun_addChatRoomEntry_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String key = arg['key'];
  String value = arg['value'];
  int deleteWhenLeftInt = int.parse(arg['deleteWhenLeft']);
  bool deleteWhenLeft = deleteWhenLeftInt == 0 ? false : true;
  int overwriteInt = int.parse(arg['overwrite']);
  bool overwrite = overwriteInt == 0 ? false : true;
  IRCIMIWAddChatRoomEntryCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAddChatRoomEntryCallback(
      onChatRoomEntryAdded: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "addChatRoomEntry-onChatRoomEntryAdded";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.addChatRoomEntry(
    targetId,
    key,
    value,
    deleteWhenLeft,
    overwrite,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addChatRoomEntry";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_addChatRoomEntries_call
IRCIMIWAddChatRoomEntriesCallback? callback = IRCIMIWAddChatRoomEntriesCallback(onChatRoomEntriesAdded: (int? code, Map? errors) {
    //...
});

int? ret = await engine?.addChatRoomEntries(targetId, entries, deleteWhenLeft, overwrite, callback:callback);
//fun_addChatRoomEntries_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

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
  IRCIMIWAddChatRoomEntriesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAddChatRoomEntriesCallback(
      onChatRoomEntriesAdded: (int? code, Map? errors) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "addChatRoomEntries-onChatRoomEntriesAdded";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["errors"] = errors.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.addChatRoomEntries(
    targetId,
    entries,
    deleteWhenLeft,
    overwrite,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addChatRoomEntries";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadChatRoomEntry_call
int? ret = await engine?.loadChatRoomEntry(targetId, key);
//fun_loadChatRoomEntry_call
*/

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
  int? code = await IMEngineManager().engine?.loadChatRoomEntry(targetId, key);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomEntry";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getChatRoomEntry_call
IRCIMIWGetChatRoomEntryCallback? callback = IRCIMIWGetChatRoomEntryCallback(onSuccess: (Map? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getChatRoomEntry(targetId, key, callback:callback);
//fun_getChatRoomEntry_call
*/

getChatRoomEntry(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['key'] == null) {
    RCIWToast.showToast("key 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String key = arg['key'];
  IRCIMIWGetChatRoomEntryCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetChatRoomEntryCallback(
      onSuccess: (Map? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getChatRoomEntry-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getChatRoomEntry-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getChatRoomEntry(targetId, key, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getChatRoomEntry";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadChatRoomAllEntries_call
int? ret = await engine?.loadChatRoomAllEntries(targetId);
//fun_loadChatRoomAllEntries_call
*/

loadChatRoomAllEntries(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadChatRoomAllEntries(targetId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomAllEntries";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getChatRoomAllEntries_call
IRCIMIWGetChatRoomAllEntriesCallback? callback = IRCIMIWGetChatRoomAllEntriesCallback(onSuccess: (Map? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getChatRoomAllEntries(targetId, callback:callback);
//fun_getChatRoomAllEntries_call
*/

getChatRoomAllEntries(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  IRCIMIWGetChatRoomAllEntriesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetChatRoomAllEntriesCallback(
      onSuccess: (Map? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getChatRoomAllEntries-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getChatRoomAllEntries-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getChatRoomAllEntries(targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getChatRoomAllEntries";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeChatRoomEntry_call
IRCIMIWRemoveChatRoomEntryCallback? callback = IRCIMIWRemoveChatRoomEntryCallback(onChatRoomEntryRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeChatRoomEntry(targetId, key, force, callback:callback);
//fun_removeChatRoomEntry_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String key = arg['key'];
  int forceInt = int.parse(arg['force']);
  bool force = forceInt == 0 ? false : true;
  IRCIMIWRemoveChatRoomEntryCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveChatRoomEntryCallback(
      onChatRoomEntryRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeChatRoomEntry-onChatRoomEntryRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeChatRoomEntry(targetId, key, force, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeChatRoomEntry";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeChatRoomEntries_call
IRCIMIWRemoveChatRoomEntriesCallback? callback = IRCIMIWRemoveChatRoomEntriesCallback(onChatRoomEntriesRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeChatRoomEntries(targetId, keys, force, callback:callback);
//fun_removeChatRoomEntries_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  List<String> keys = (arg["keys"]).split(",");
  int forceInt = int.parse(arg['force']);
  bool force = forceInt == 0 ? false : true;
  IRCIMIWRemoveChatRoomEntriesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveChatRoomEntriesCallback(
      onChatRoomEntriesRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeChatRoomEntries-onChatRoomEntriesRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeChatRoomEntries(targetId, keys, force, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeChatRoomEntries";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_addToBlacklist_call
IRCIMIWAddToBlacklistCallback? callback = IRCIMIWAddToBlacklistCallback(onBlacklistAdded: (int? code, String? userId) {
    //...
});

int? ret = await engine?.addToBlacklist(userId, callback:callback);
//fun_addToBlacklist_call
*/

addToBlacklist(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String userId = arg['userId'];
  IRCIMIWAddToBlacklistCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAddToBlacklistCallback(
      onBlacklistAdded: (int? code, String? userId) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "addToBlacklist-onBlacklistAdded";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["userId"] = userId ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.addToBlacklist(userId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addToBlacklist";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeFromBlacklist_call
IRCIMIWRemoveFromBlacklistCallback? callback = IRCIMIWRemoveFromBlacklistCallback(onBlacklistRemoved: (int? code, String? userId) {
    //...
});

int? ret = await engine?.removeFromBlacklist(userId, callback:callback);
//fun_removeFromBlacklist_call
*/

removeFromBlacklist(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String userId = arg['userId'];
  IRCIMIWRemoveFromBlacklistCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveFromBlacklistCallback(
      onBlacklistRemoved: (int? code, String? userId) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeFromBlacklist-onBlacklistRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["userId"] = userId ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeFromBlacklist(userId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeFromBlacklist";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadBlacklistStatus_call
int? ret = await engine?.loadBlacklistStatus(userId);
//fun_loadBlacklistStatus_call
*/

loadBlacklistStatus(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }

  String userId = arg['userId'];
  int? code = await IMEngineManager().engine?.loadBlacklistStatus(userId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlacklistStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getBlacklistStatus_call
IRCIMIWGetBlacklistStatusCallback? callback = IRCIMIWGetBlacklistStatusCallback(onSuccess: (RCIMIWBlacklistStatus? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getBlacklistStatus(userId, callback:callback);
//fun_getBlacklistStatus_call
*/

getBlacklistStatus(Map arg) async {
  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String userId = arg['userId'];
  IRCIMIWGetBlacklistStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetBlacklistStatusCallback(
      onSuccess: (RCIMIWBlacklistStatus? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBlacklistStatus-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBlacklistStatus-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getBlacklistStatus(userId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBlacklistStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadBlacklist_call
int? ret = await engine?.loadBlacklist();
//fun_loadBlacklist_call
*/

loadBlacklist() async {
  int? code = await IMEngineManager().engine?.loadBlacklist();
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlacklist";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getBlacklist_call
IRCIMIWGetBlacklistCallback? callback = IRCIMIWGetBlacklistCallback(onSuccess: (List<String>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getBlacklist(callback:callback);
//fun_getBlacklist_call
*/

getBlacklist(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetBlacklistCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetBlacklistCallback(
      onSuccess: (List<String>? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBlacklist-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBlacklist-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getBlacklist(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBlacklist";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_searchMessages_call
IRCIMIWSearchMessagesCallback? callback = IRCIMIWSearchMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.searchMessages(type, targetId, channelId, keyword, startTime, count, callback:callback);
//fun_searchMessages_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String keyword = arg['keyword'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  IRCIMIWSearchMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchMessagesCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessages-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessages-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchMessages(
    type,
    targetId,
    channelId,
    keyword,
    startTime,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_searchMessagesByTimeRange_call
IRCIMIWSearchMessagesByTimeRangeCallback? callback = IRCIMIWSearchMessagesByTimeRangeCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.searchMessagesByTimeRange(type, targetId, channelId, keyword, startTime, endTime, offset, count, callback:callback);
//fun_searchMessagesByTimeRange_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String keyword = arg['keyword'];
  int startTime = int.parse(arg['startTime']);
  int endTime = int.parse(arg['endTime']);
  int offset = int.parse(arg['offset']);
  int count = int.parse(arg['count']);
  IRCIMIWSearchMessagesByTimeRangeCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchMessagesByTimeRangeCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessagesByTimeRange-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessagesByTimeRange-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchMessagesByTimeRange(
    type,
    targetId,
    channelId,
    keyword,
    startTime,
    endTime,
    offset,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessagesByTimeRange";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_searchMessagesByUserId_call
IRCIMIWSearchMessagesByUserIdCallback? callback = IRCIMIWSearchMessagesByUserIdCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.searchMessagesByUserId(userId, type, targetId, channelId, startTime, count, callback:callback);
//fun_searchMessagesByUserId_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String userId = arg['userId'];
  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  IRCIMIWSearchMessagesByUserIdCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchMessagesByUserIdCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessagesByUserId-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessagesByUserId-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchMessagesByUserId(
    userId,
    type,
    targetId,
    channelId,
    startTime,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessagesByUserId";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_searchMessagesByMessageTypes_call
IRCIMIWSearchMessagesByMessageTypesCallback? callback = IRCIMIWSearchMessagesByMessageTypesCallback(onSuccess: (List<RCIMIWMessage>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.searchMessagesByMessageTypes(type, targetId, channelId, messageTypesInt, keyword, startTime, count, callback:callback);
//fun_searchMessagesByMessageTypes_call
*/

searchMessagesByMessageTypes(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
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

  if (arg['startTime'] == null) {
    RCIWToast.showToast("startTime 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  List messageTypes = (arg["messageTypes"]).split(",");
  List<RCIMIWMessageType> messageTypesInt = [];
  for (var element in messageTypes) {
    messageTypesInt.add(RCIMIWMessageType.values[int.parse(element)]);
  }
  String keyword = arg['keyword'];
  int startTime = int.parse(arg['startTime']);
  int count = int.parse(arg['count']);
  IRCIMIWSearchMessagesByMessageTypesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchMessagesByMessageTypesCallback(
      onSuccess: (List<RCIMIWMessage>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessagesByMessageTypes-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchMessagesByMessageTypes-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchMessagesByMessageTypes(
    type,
    targetId,
    channelId,
    messageTypesInt,
    keyword,
    startTime,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessagesByMessageTypes";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_searchConversations_call
IRCIMIWSearchConversationsCallback? callback = IRCIMIWSearchConversationsCallback(onSuccess: (List<RCIMIWSearchConversationResult>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.searchConversations(conversationTypesInt, channelId, messageTypesInt, keyword, callback:callback);
//fun_searchConversations_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

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
  IRCIMIWSearchConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchConversationsCallback(
      onSuccess: (List<RCIMIWSearchConversationResult>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchConversations-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchConversations-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchConversations(
    conversationTypesInt,
    channelId,
    messageTypesInt,
    keyword,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeNotificationQuietHours_call
IRCIMIWChangeNotificationQuietHoursCallback? callback = IRCIMIWChangeNotificationQuietHoursCallback(onNotificationQuietHoursChanged: (int? code) {
    //...
});

int? ret = await engine?.changeNotificationQuietHours(startTime, spanMinutes, level, callback:callback);
//fun_changeNotificationQuietHours_call
*/

changeNotificationQuietHours(Map arg) async {
  if (arg['startTime'] == null) {
    RCIWToast.showToast("startTime 为空");
    return;
  }

  if (arg['spanMinutes'] == null) {
    RCIWToast.showToast("spanMinutes 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String startTime = arg['startTime'];
  int spanMinutes = int.parse(arg['spanMinutes']);
  RCIMIWPushNotificationQuietHoursLevel level = RCIMIWPushNotificationQuietHoursLevel.values[int.parse(arg['level'])];
  IRCIMIWChangeNotificationQuietHoursCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeNotificationQuietHoursCallback(
      onNotificationQuietHoursChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeNotificationQuietHours-onNotificationQuietHoursChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeNotificationQuietHours(
    startTime,
    spanMinutes,
    level,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeNotificationQuietHours";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeNotificationQuietHours_call
IRCIMIWRemoveNotificationQuietHoursCallback? callback = IRCIMIWRemoveNotificationQuietHoursCallback(onNotificationQuietHoursRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeNotificationQuietHours(callback:callback);
//fun_removeNotificationQuietHours_call
*/

removeNotificationQuietHours(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWRemoveNotificationQuietHoursCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveNotificationQuietHoursCallback(
      onNotificationQuietHoursRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeNotificationQuietHours-onNotificationQuietHoursRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeNotificationQuietHours(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeNotificationQuietHours";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadNotificationQuietHours_call
int? ret = await engine?.loadNotificationQuietHours();
//fun_loadNotificationQuietHours_call
*/

loadNotificationQuietHours() async {
  int? code = await IMEngineManager().engine?.loadNotificationQuietHours();
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadNotificationQuietHours";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getNotificationQuietHours_call
IRCIMIWGetNotificationQuietHoursCallback? callback = IRCIMIWGetNotificationQuietHoursCallback(onSuccess: (String? startTime, int? spanMinutes, RCIMIWPushNotificationQuietHoursLevel? level) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getNotificationQuietHours(callback:callback);
//fun_getNotificationQuietHours_call
*/

getNotificationQuietHours(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetNotificationQuietHoursCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetNotificationQuietHoursCallback(
      onSuccess: (String? startTime, int? spanMinutes, RCIMIWPushNotificationQuietHoursLevel? level) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getNotificationQuietHours-onSuccess";
        arg["timestamp"] = timeStr;
        arg["startTime"] = startTime ?? "";
        arg["spanMinutes"] = spanMinutes.toString();
        arg["level"] = level.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getNotificationQuietHours-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getNotificationQuietHours(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getNotificationQuietHours";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeConversationNotificationLevel_call
IRCIMIWChangeConversationNotificationLevelCallback? callback = IRCIMIWChangeConversationNotificationLevelCallback(onConversationNotificationLevelChanged: (int? code) {
    //...
});

int? ret = await engine?.changeConversationNotificationLevel(type, targetId, channelId, level, callback:callback);
//fun_changeConversationNotificationLevel_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  RCIMIWPushNotificationLevel level = RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  IRCIMIWChangeConversationNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeConversationNotificationLevelCallback(
      onConversationNotificationLevelChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeConversationNotificationLevel-onConversationNotificationLevelChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeConversationNotificationLevel(
    type,
    targetId,
    channelId,
    level,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadConversationNotificationLevel_call
int? ret = await engine?.loadConversationNotificationLevel(type, targetId, channelId);
//fun_loadConversationNotificationLevel_call
*/

loadConversationNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadConversationNotificationLevel(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversationNotificationLevel_call
IRCIMIWGetConversationNotificationLevelCallback? callback = IRCIMIWGetConversationNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversationNotificationLevel(type, targetId, channelId, callback:callback);
//fun_getConversationNotificationLevel_call
*/

getConversationNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetConversationNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationNotificationLevelCallback(
      onSuccess: (RCIMIWPushNotificationLevel? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationNotificationLevel-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationNotificationLevel-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversationNotificationLevel(
    type,
    targetId,
    channelId,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeConversationTypeNotificationLevel_call
IRCIMIWChangeConversationTypeNotificationLevelCallback? callback = IRCIMIWChangeConversationTypeNotificationLevelCallback(onConversationTypeNotificationLevelChanged: (int? code) {
    //...
});

int? ret = await engine?.changeConversationTypeNotificationLevel(type, level, callback:callback);
//fun_changeConversationTypeNotificationLevel_call
*/

changeConversationTypeNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  RCIMIWPushNotificationLevel level = RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  IRCIMIWChangeConversationTypeNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeConversationTypeNotificationLevelCallback(
      onConversationTypeNotificationLevelChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeConversationTypeNotificationLevel-onConversationTypeNotificationLevelChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeConversationTypeNotificationLevel(type, level, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTypeNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadConversationTypeNotificationLevel_call
int? ret = await engine?.loadConversationTypeNotificationLevel(type);
//fun_loadConversationTypeNotificationLevel_call
*/

loadConversationTypeNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  int? code = await IMEngineManager().engine?.loadConversationTypeNotificationLevel(type);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationTypeNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversationTypeNotificationLevel_call
IRCIMIWGetConversationTypeNotificationLevelCallback? callback = IRCIMIWGetConversationTypeNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversationTypeNotificationLevel(type, callback:callback);
//fun_getConversationTypeNotificationLevel_call
*/

getConversationTypeNotificationLevel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  IRCIMIWGetConversationTypeNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationTypeNotificationLevelCallback(
      onSuccess: (RCIMIWPushNotificationLevel? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationTypeNotificationLevel-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationTypeNotificationLevel-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversationTypeNotificationLevel(type, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationTypeNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeUltraGroupDefaultNotificationLevel_call
IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback? callback = IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback(onUltraGroupDefaultNotificationLevelChanged: (int? code) {
    //...
});

int? ret = await engine?.changeUltraGroupDefaultNotificationLevel(targetId, level, callback:callback);
//fun_changeUltraGroupDefaultNotificationLevel_call
*/

changeUltraGroupDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  RCIMIWPushNotificationLevel level = RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback(
      onUltraGroupDefaultNotificationLevelChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeUltraGroupDefaultNotificationLevel-onUltraGroupDefaultNotificationLevelChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeUltraGroupDefaultNotificationLevel(
    targetId,
    level,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeUltraGroupDefaultNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUltraGroupDefaultNotificationLevel_call
int? ret = await engine?.loadUltraGroupDefaultNotificationLevel(targetId);
//fun_loadUltraGroupDefaultNotificationLevel_call
*/

loadUltraGroupDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadUltraGroupDefaultNotificationLevel(targetId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupDefaultNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUltraGroupDefaultNotificationLevel_call
IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback = IRCIMIWGetUltraGroupDefaultNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUltraGroupDefaultNotificationLevel(targetId, callback:callback);
//fun_getUltraGroupDefaultNotificationLevel_call
*/

getUltraGroupDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUltraGroupDefaultNotificationLevelCallback(
      onSuccess: (RCIMIWPushNotificationLevel? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupDefaultNotificationLevel-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupDefaultNotificationLevel-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUltraGroupDefaultNotificationLevel(targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupDefaultNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeUltraGroupChannelDefaultNotificationLevel_call
IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback? callback = IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback(onUltraGroupChannelDefaultNotificationLevelChanged: (int? code) {
    //...
});

int? ret = await engine?.changeUltraGroupChannelDefaultNotificationLevel(targetId, channelId, level, callback:callback);
//fun_changeUltraGroupChannelDefaultNotificationLevel_call
*/

changeUltraGroupChannelDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  RCIMIWPushNotificationLevel level = RCIMIWPushNotificationLevel.values[int.parse(arg['level'])];
  IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback(
      onUltraGroupChannelDefaultNotificationLevelChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] =
            "changeUltraGroupChannelDefaultNotificationLevel-onUltraGroupChannelDefaultNotificationLevelChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeUltraGroupChannelDefaultNotificationLevel(
    targetId,
    channelId,
    level,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeUltraGroupChannelDefaultNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadUltraGroupChannelDefaultNotificationLevel_call
int? ret = await engine?.loadUltraGroupChannelDefaultNotificationLevel(targetId, channelId);
//fun_loadUltraGroupChannelDefaultNotificationLevel_call
*/

loadUltraGroupChannelDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadUltraGroupChannelDefaultNotificationLevel(targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupChannelDefaultNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUltraGroupChannelDefaultNotificationLevel_call
IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback? callback = IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUltraGroupChannelDefaultNotificationLevel(targetId, channelId, callback:callback);
//fun_getUltraGroupChannelDefaultNotificationLevel_call
*/

getUltraGroupChannelDefaultNotificationLevel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback(
      onSuccess: (RCIMIWPushNotificationLevel? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupChannelDefaultNotificationLevel-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUltraGroupChannelDefaultNotificationLevel-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUltraGroupChannelDefaultNotificationLevel(
    targetId,
    channelId,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupChannelDefaultNotificationLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changePushContentShowStatus_call
IRCIMIWChangePushContentShowStatusCallback? callback = IRCIMIWChangePushContentShowStatusCallback(onPushContentShowStatusChanged: (int? code) {
    //...
});

int? ret = await engine?.changePushContentShowStatus(showContent, callback:callback);
//fun_changePushContentShowStatus_call
*/

changePushContentShowStatus(Map arg) async {
  if (arg['showContent'] == null) {
    RCIWToast.showToast("showContent 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  int showContentInt = int.parse(arg['showContent']);
  bool showContent = showContentInt == 0 ? false : true;
  IRCIMIWChangePushContentShowStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangePushContentShowStatusCallback(
      onPushContentShowStatusChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changePushContentShowStatus-onPushContentShowStatusChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changePushContentShowStatus(showContent, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushContentShowStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changePushLanguage_call
IRCIMIWChangePushLanguageCallback? callback = IRCIMIWChangePushLanguageCallback(onPushLanguageChanged: (int? code) {
    //...
});

int? ret = await engine?.changePushLanguage(language, callback:callback);
//fun_changePushLanguage_call
*/

changePushLanguage(Map arg) async {
  if (arg['language'] == null) {
    RCIWToast.showToast("language 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String language = arg['language'];
  IRCIMIWChangePushLanguageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangePushLanguageCallback(
      onPushLanguageChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changePushLanguage-onPushLanguageChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changePushLanguage(language, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushLanguage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changePushReceiveStatus_call
IRCIMIWChangePushReceiveStatusCallback? callback = IRCIMIWChangePushReceiveStatusCallback(onPushReceiveStatusChanged: (int? code) {
    //...
});

int? ret = await engine?.changePushReceiveStatus(receive, callback:callback);
//fun_changePushReceiveStatus_call
*/

changePushReceiveStatus(Map arg) async {
  if (arg['receive'] == null) {
    RCIWToast.showToast("receive 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  int receiveInt = int.parse(arg['receive']);
  bool receive = receiveInt == 0 ? false : true;
  IRCIMIWChangePushReceiveStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangePushReceiveStatusCallback(
      onPushReceiveStatusChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changePushReceiveStatus-onPushReceiveStatusChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changePushReceiveStatus(receive, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushReceiveStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_sendGroupMessageToDesignatedUsers_call
RCIMIWSendGroupMessageToDesignatedUsersCallback? callback = RCIMIWSendGroupMessageToDesignatedUsersCallback(onMessageSaved: (RCIMIWMessage? message) {
    //...
}, onMessageSent: (int? code, RCIMIWMessage? message) {
    //...
});

int? ret = await engine?.sendGroupMessageToDesignatedUsers(message, userIds, callback:callback);
//fun_sendGroupMessageToDesignatedUsers_call
*/
/*
//fun_loadMessageCount_call
int? ret = await engine?.loadMessageCount(type, targetId, channelId);
//fun_loadMessageCount_call
*/

loadMessageCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int? code = await IMEngineManager().engine?.loadMessageCount(type, targetId, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadMessageCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getMessageCount_call
IRCIMIWGetMessageCountCallback? callback = IRCIMIWGetMessageCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getMessageCount(type, targetId, channelId, callback:callback);
//fun_getMessageCount_call
*/

getMessageCount(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  IRCIMIWGetMessageCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetMessageCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMessageCount-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMessageCount-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getMessageCount(type, targetId, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMessageCount";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadTopConversations_call
int? ret = await engine?.loadTopConversations(conversationTypesInt, channelId);
//fun_loadTopConversations_call
*/

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
  int? code = await IMEngineManager().engine?.loadTopConversations(conversationTypesInt, channelId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadTopConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getTopConversations_call
IRCIMIWGetTopConversationsCallback? callback = IRCIMIWGetTopConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getTopConversations(conversationTypesInt, channelId, callback:callback);
//fun_getTopConversations_call
*/

getTopConversations(Map arg) async {
  if (arg['conversationTypes'] == null) {
    RCIWToast.showToast("conversationTypes 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List conversationTypes = (arg["conversationTypes"]).split(",");
  List<RCIMIWConversationType> conversationTypesInt = [];
  for (var element in conversationTypes) {
    conversationTypesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  String? channelId = arg['channelId'];
  IRCIMIWGetTopConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetTopConversationsCallback(
      onSuccess: (List<RCIMIWConversation>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTopConversations-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTopConversations-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getTopConversations(conversationTypesInt, channelId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getTopConversations";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_syncUltraGroupReadStatus_call
IRCIMIWSyncUltraGroupReadStatusCallback? callback = IRCIMIWSyncUltraGroupReadStatusCallback(onUltraGroupReadStatusSynced: (int? code) {
    //...
});

int? ret = await engine?.syncUltraGroupReadStatus(targetId, channelId, timestamp, callback:callback);
//fun_syncUltraGroupReadStatus_call
*/

syncUltraGroupReadStatus(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  IRCIMIWSyncUltraGroupReadStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSyncUltraGroupReadStatusCallback(
      onUltraGroupReadStatusSynced: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "syncUltraGroupReadStatus-onUltraGroupReadStatusSynced";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.syncUltraGroupReadStatus(
    targetId,
    channelId,
    timestamp,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "syncUltraGroupReadStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadConversationsForAllChannel_call
int? ret = await engine?.loadConversationsForAllChannel(type, targetId);
//fun_loadConversationsForAllChannel_call
*/

loadConversationsForAllChannel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  int? code = await IMEngineManager().engine?.loadConversationsForAllChannel(type, targetId);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationsForAllChannel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversationsForAllChannel_call
IRCIMIWGetConversationsForAllChannelCallback? callback = IRCIMIWGetConversationsForAllChannelCallback(onSuccess: (List<RCIMIWConversation>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversationsForAllChannel(type, targetId, callback:callback);
//fun_getConversationsForAllChannel_call
*/

getConversationsForAllChannel(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  IRCIMIWGetConversationsForAllChannelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationsForAllChannelCallback(
      onSuccess: (List<RCIMIWConversation>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationsForAllChannel-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationsForAllChannel-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversationsForAllChannel(type, targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationsForAllChannel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_modifyUltraGroupMessage_call
IRCIMIWModifyUltraGroupMessageCallback? callback = IRCIMIWModifyUltraGroupMessageCallback(onUltraGroupMessageModified: (int? code) {
    //...
});

int? ret = await engine?.modifyUltraGroupMessage(messageUId, message, callback:callback);
//fun_modifyUltraGroupMessage_call
*/
/*
//fun_recallUltraGroupMessage_call
IRCIMIWRecallUltraGroupMessageCallback? callback = IRCIMIWRecallUltraGroupMessageCallback(onUltraGroupMessageRecalled: (int? code) {
    //...
});

int? ret = await engine?.recallUltraGroupMessage(message, deleteRemote, callback:callback);
//fun_recallUltraGroupMessage_call
*/
/*
//fun_clearUltraGroupMessages_call
IRCIMIWClearUltraGroupMessagesCallback? callback = IRCIMIWClearUltraGroupMessagesCallback(onUltraGroupMessagesCleared: (int? code) {
    //...
});

int? ret = await engine?.clearUltraGroupMessages(targetId, channelId, timestamp, policy, callback:callback);
//fun_clearUltraGroupMessages_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  RCIMIWMessageOperationPolicy policy = RCIMIWMessageOperationPolicy.values[int.parse(arg['policy'])];
  IRCIMIWClearUltraGroupMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWClearUltraGroupMessagesCallback(
      onUltraGroupMessagesCleared: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearUltraGroupMessages-onUltraGroupMessagesCleared";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.clearUltraGroupMessages(
    targetId,
    channelId,
    timestamp,
    policy,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUltraGroupMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_sendUltraGroupTypingStatus_call
IRCIMIWSendUltraGroupTypingStatusCallback? callback = IRCIMIWSendUltraGroupTypingStatusCallback(onUltraGroupTypingStatusSent: (int? code) {
    //...
});

int? ret = await engine?.sendUltraGroupTypingStatus(targetId, channelId, typingStatus, callback:callback);
//fun_sendUltraGroupTypingStatus_call
*/

sendUltraGroupTypingStatus(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['typingStatus'] == null) {
    RCIWToast.showToast("typingStatus 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  RCIMIWUltraGroupTypingStatus typingStatus = RCIMIWUltraGroupTypingStatus.values[int.parse(arg['typingStatus'])];
  IRCIMIWSendUltraGroupTypingStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSendUltraGroupTypingStatusCallback(
      onUltraGroupTypingStatusSent: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "sendUltraGroupTypingStatus-onUltraGroupTypingStatusSent";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.sendUltraGroupTypingStatus(
    targetId,
    channelId,
    typingStatus,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendUltraGroupTypingStatus";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_clearUltraGroupMessagesForAllChannel_call
IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback = IRCIMIWClearUltraGroupMessagesForAllChannelCallback(onUltraGroupMessagesClearedForAllChannel: (int? code) {
    //...
});

int? ret = await engine?.clearUltraGroupMessagesForAllChannel(targetId, timestamp, callback:callback);
//fun_clearUltraGroupMessagesForAllChannel_call
*/

clearUltraGroupMessagesForAllChannel(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  int timestamp = int.parse(arg['timestamp']);
  IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWClearUltraGroupMessagesForAllChannelCallback(
      onUltraGroupMessagesClearedForAllChannel: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearUltraGroupMessagesForAllChannel-onUltraGroupMessagesClearedForAllChannel";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.clearUltraGroupMessagesForAllChannel(
    targetId,
    timestamp,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUltraGroupMessagesForAllChannel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_loadBatchRemoteUltraGroupMessages_call
int? ret = await engine?.loadBatchRemoteUltraGroupMessages(messages);
//fun_loadBatchRemoteUltraGroupMessages_call
*/
/*
//fun_getBatchRemoteUltraGroupMessages_call
IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback = IRCIMIWGetBatchRemoteUltraGroupMessagesCallback(onSuccess: (List<RCIMIWMessage>? matchedMessages, List<RCIMIWMessage>? notMatchedMessages) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getBatchRemoteUltraGroupMessages(messages, callback:callback);
//fun_getBatchRemoteUltraGroupMessages_call
*/

getBatchRemoteUltraGroupMessages(Map arg) async {
  if (arg['messages'] == null) {
    RCIWToast.showToast("messages 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<RCIMIWMessage> messages = arg['messages'];
  IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetBatchRemoteUltraGroupMessagesCallback(
      onSuccess: (List<RCIMIWMessage>? matchedMessages, List<RCIMIWMessage>? notMatchedMessages) {
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

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBatchRemoteUltraGroupMessages-onSuccess";
        arg["timestamp"] = timeStr;
        arg["matchedMessages"] = matchedMessagesJson.toString();
        arg["notMatchedMessages"] = notMatchedMessagesJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getBatchRemoteUltraGroupMessages-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getBatchRemoteUltraGroupMessages(messages, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBatchRemoteUltraGroupMessages";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_updateUltraGroupMessageExpansion_call
IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback = IRCIMIWUpdateUltraGroupMessageExpansionCallback(onUltraGroupMessageExpansionUpdated: (int? code) {
    //...
});

int? ret = await engine?.updateUltraGroupMessageExpansion(messageUId, expansion, callback:callback);
//fun_updateUltraGroupMessageExpansion_call
*/

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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String messageUId = arg['messageUId'];
  Map expansion = {};
  List keys = (arg["keys"]).split(",");
  List values = (arg["values"]).split(",");
  for (var i = 0; i < keys.length; i++) {
    expansion[keys[i]] = values[i];
  }
  IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateUltraGroupMessageExpansionCallback(
      onUltraGroupMessageExpansionUpdated: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateUltraGroupMessageExpansion-onUltraGroupMessageExpansionUpdated";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.updateUltraGroupMessageExpansion(
    messageUId,
    expansion,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateUltraGroupMessageExpansion";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeUltraGroupMessageExpansionForKeys_call
IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback = IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback(onUltraGroupMessageExpansionForKeysRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeUltraGroupMessageExpansionForKeys(messageUId, keys, callback:callback);
//fun_removeUltraGroupMessageExpansionForKeys_call
*/

removeUltraGroupMessageExpansionForKeys(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg['keys'] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String messageUId = arg['messageUId'];
  List<String> keys = (arg["keys"]).split(",");
  IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback(
      onUltraGroupMessageExpansionForKeysRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeUltraGroupMessageExpansionForKeys-onUltraGroupMessageExpansionForKeysRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeUltraGroupMessageExpansionForKeys(
    messageUId,
    keys,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeUltraGroupMessageExpansionForKeys";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeLogLevel_call
int? ret = await engine?.changeLogLevel(level);
//fun_changeLogLevel_call
*/

changeLogLevel(Map arg) async {
  if (arg['level'] == null) {
    RCIWToast.showToast("level 为空");
    return;
  }

  RCIMIWLogLevel level = RCIMIWLogLevel.values[int.parse(arg['level'])];
  int? code = await IMEngineManager().engine?.changeLogLevel(level);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeLogLevel";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getDeltaTime_call
int? ret = await engine?.getDeltaTime();
//fun_getDeltaTime_call
*/

getDeltaTime() async {
  int? code = await IMEngineManager().engine?.getDeltaTime();
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getDeltaTime";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_createTag_call
IRCIMIWCreateTagCallback? callback = IRCIMIWCreateTagCallback(onTagCreated: (int? code) {
    //...
});

int? ret = await engine?.createTag(tagId, tagName, callback:callback);
//fun_createTag_call
*/

createTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
    return;
  }

  if (arg['tagName'] == null) {
    RCIWToast.showToast("tagName 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  String tagName = arg['tagName'];
  IRCIMIWCreateTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWCreateTagCallback(
      onTagCreated: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "createTag-onTagCreated";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.createTag(tagId, tagName, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "createTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeTag_call
IRCIMIWRemoveTagCallback? callback = IRCIMIWRemoveTagCallback(onTagRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeTag(tagId, callback:callback);
//fun_removeTag_call
*/

removeTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  IRCIMIWRemoveTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveTagCallback(
      onTagRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeTag-onTagRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeTag(tagId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_updateTagNameById_call
IRCIMIWUpdateTagNameByIdCallback? callback = IRCIMIWUpdateTagNameByIdCallback(onTagNameByIdUpdated: (int? code) {
    //...
});

int? ret = await engine?.updateTagNameById(tagId, newName, callback:callback);
//fun_updateTagNameById_call
*/

updateTagNameById(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
    return;
  }

  if (arg['newName'] == null) {
    RCIWToast.showToast("newName 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  String newName = arg['newName'];
  IRCIMIWUpdateTagNameByIdCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateTagNameByIdCallback(
      onTagNameByIdUpdated: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateTagNameById-onTagNameByIdUpdated";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.updateTagNameById(tagId, newName, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateTagNameById";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getTags_call
IRCIMIWGetTagsCallback? callback = IRCIMIWGetTagsCallback(onSuccess: (List<RCIMIWTagInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getTags(callback:callback);
//fun_getTags_call
*/

getTags(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetTagsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetTagsCallback(
      onSuccess: (List<RCIMIWTagInfo>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTags-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTags-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getTags(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getTags";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_addConversationToTag_call
IRCIMIWAddConversationToTagCallback? callback = IRCIMIWAddConversationToTagCallback(onConversationToTagAdded: (int? code) {
    //...
});

int? ret = await engine?.addConversationToTag(tagId, type, targetId, callback:callback);
//fun_addConversationToTag_call
*/

addConversationToTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  IRCIMIWAddConversationToTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAddConversationToTagCallback(
      onConversationToTagAdded: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "addConversationToTag-onConversationToTagAdded";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.addConversationToTag(tagId, type, targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addConversationToTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeConversationFromTag_call
IRCIMIWRemoveConversationFromTagCallback? callback = IRCIMIWRemoveConversationFromTagCallback(onConversationFromTagRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeConversationFromTag(tagId, type, targetId, callback:callback);
//fun_removeConversationFromTag_call
*/

removeConversationFromTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  IRCIMIWRemoveConversationFromTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveConversationFromTagCallback(
      onConversationFromTagRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeConversationFromTag-onConversationFromTagRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeConversationFromTag(tagId, type, targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeConversationFromTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeTagsFromConversation_call
IRCIMIWRemoveTagsFromConversationCallback? callback = IRCIMIWRemoveTagsFromConversationCallback(onTagsFromConversationRemoved: (int? code) {
    //...
});

int? ret = await engine?.removeTagsFromConversation(type, targetId, tagIds, callback:callback);
//fun_removeTagsFromConversation_call
*/

removeTagsFromConversation(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['tagIds'] == null) {
    RCIWToast.showToast("tagIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  List<String> tagIds = (arg["tagIds"]).split(",");
  IRCIMIWRemoveTagsFromConversationCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveTagsFromConversationCallback(
      onTagsFromConversationRemoved: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeTagsFromConversation-onTagsFromConversationRemoved";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeTagsFromConversation(type, targetId, tagIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeTagsFromConversation";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getTagsFromConversation_call
IRCIMIWGetTagsFromConversationCallback? callback = IRCIMIWGetTagsFromConversationCallback(onSuccess: (List<RCIMIWConversationTagInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getTagsFromConversation(type, targetId, callback:callback);
//fun_getTagsFromConversation_call
*/

getTagsFromConversation(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  IRCIMIWGetTagsFromConversationCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetTagsFromConversationCallback(
      onSuccess: (List<RCIMIWConversationTagInfo>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTagsFromConversation-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTagsFromConversation-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getTagsFromConversation(type, targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getTagsFromConversation";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversationsFromTagByPage_call
IRCIMIWGetConversationsCallback? callback = IRCIMIWGetConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversationsFromTagByPage(tagId, timestamp, count, callback:callback);
//fun_getConversationsFromTagByPage_call
*/

getConversationsFromTagByPage(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
    return;
  }

  if (arg['timestamp'] == null) {
    RCIWToast.showToast("timestamp 为空");
    return;
  }

  if (arg['count'] == null) {
    RCIWToast.showToast("count 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  int timestamp = int.parse(arg['timestamp']);
  int count = int.parse(arg['count']);
  IRCIMIWGetConversationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationsCallback(
      onSuccess: (List<RCIMIWConversation>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationsFromTagByPage-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationsFromTagByPage-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversationsFromTagByPage(
    tagId,
    timestamp,
    count,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationsFromTagByPage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUnreadCountByTag_call
IRCIMIWGetUnreadCountCallback? callback = IRCIMIWGetUnreadCountCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getUnreadCountByTag(tagId, contain, callback:callback);
//fun_getUnreadCountByTag_call
*/

getUnreadCountByTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
    return;
  }

  if (arg['contain'] == null) {
    RCIWToast.showToast("contain 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  int containInt = int.parse(arg['contain']);
  bool contain = containInt == 0 ? false : true;
  IRCIMIWGetUnreadCountCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUnreadCountCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCountByTag-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUnreadCountByTag-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUnreadCountByTag(tagId, contain, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadCountByTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_changeConversationTopStatusInTag_call
IRCIMIWChangeConversationTopStatusInTagCallback? callback = IRCIMIWChangeConversationTopStatusInTagCallback(onConversationTopStatusInTagChanged: (int? code) {
    //...
});

int? ret = await engine?.changeConversationTopStatusInTag(tagId, type, targetId, top, callback:callback);
//fun_changeConversationTopStatusInTag_call
*/

changeConversationTopStatusInTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
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

  if (arg['top'] == null) {
    RCIWToast.showToast("top 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  int topInt = int.parse(arg['top']);
  bool top = topInt == 0 ? false : true;
  IRCIMIWChangeConversationTopStatusInTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWChangeConversationTopStatusInTagCallback(
      onConversationTopStatusInTagChanged: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "changeConversationTopStatusInTag-onConversationTopStatusInTagChanged";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.changeConversationTopStatusInTag(
    tagId,
    type,
    targetId,
    top,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTopStatusInTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getConversationTopStatusInTag_call
IRCIMIWGetConversationTopStatusInTagCallback? callback = IRCIMIWGetConversationTopStatusInTagCallback(onSuccess: (bool? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getConversationTopStatusInTag(tagId, type, targetId, callback:callback);
//fun_getConversationTopStatusInTag_call
*/

getConversationTopStatusInTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
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
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  IRCIMIWGetConversationTopStatusInTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetConversationTopStatusInTagCallback(
      onSuccess: (bool? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationTopStatusInTag-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getConversationTopStatusInTag-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getConversationTopStatusInTag(tagId, type, targetId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationTopStatusInTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_clearMessagesUnreadStatusByTag_call
IRCIMIWClearMessagesUnreadStatusByTagCallback? callback = IRCIMIWClearMessagesUnreadStatusByTagCallback(onSuccess: (bool? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.clearMessagesUnreadStatusByTag(tagId, callback:callback);
//fun_clearMessagesUnreadStatusByTag_call
*/

clearMessagesUnreadStatusByTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  IRCIMIWClearMessagesUnreadStatusByTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWClearMessagesUnreadStatusByTagCallback(
      onSuccess: (bool? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearMessagesUnreadStatusByTag-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearMessagesUnreadStatusByTag-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.clearMessagesUnreadStatusByTag(tagId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearMessagesUnreadStatusByTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_clearConversationsByTag_call
IRCIMIWClearConversationsByTagCallback? callback = IRCIMIWClearConversationsByTagCallback(onSuccess: (bool? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.clearConversationsByTag(tagId, deleteMessage, callback:callback);
//fun_clearConversationsByTag_call
*/

clearConversationsByTag(Map arg) async {
  if (arg['tagId'] == null) {
    RCIWToast.showToast("tagId 为空");
    return;
  }

  if (arg['deleteMessage'] == null) {
    RCIWToast.showToast("deleteMessage 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String tagId = arg['tagId'];
  int deleteMessageInt = int.parse(arg['deleteMessage']);
  bool deleteMessage = deleteMessageInt == 0 ? false : true;
  IRCIMIWClearConversationsByTagCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWClearConversationsByTagCallback(
      onSuccess: (bool? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearConversationsByTag-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "clearConversationsByTag-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.clearConversationsByTag(tagId, deleteMessage, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearConversationsByTag";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_setModuleName_call
int? ret = await engine?.setModuleName(moduleName, version);
//fun_setModuleName_call
*/

setModuleName(Map arg) async {
  if (arg['moduleName'] == null) {
    RCIWToast.showToast("moduleName 为空");
    return;
  }

  if (arg['version'] == null) {
    RCIWToast.showToast("version 为空");
    return;
  }

  String moduleName = arg['moduleName'];
  String version = arg['version'];
  int? code = await IMEngineManager().engine?.setModuleName(moduleName, version);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "setModuleName";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_writeLog_call
int? ret = await engine?.writeLog(method, callMethod, codeValue, message);
//fun_writeLog_call
*/

writeLog(Map arg) async {
  if (arg['method'] == null) {
    RCIWToast.showToast("method 为空");
    return;
  }

  if (arg['callMethod'] == null) {
    RCIWToast.showToast("callMethod 为空");
    return;
  }

  if (arg['codeValue'] == null) {
    RCIWToast.showToast("codeValue 为空");
    return;
  }

  if (arg['message'] == null) {
    RCIWToast.showToast("message 为空");
    return;
  }

  String method = arg['method'];
  String callMethod = arg['callMethod'];
  int codeValue = int.parse(arg['codeValue']);
  String message = arg['message'];
  int? code = await IMEngineManager().engine?.writeLog(method, callMethod, codeValue, message);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "writeLog";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_createGroup_call
IRCIMIWCreateGroupCallback? callback = IRCIMIWCreateGroupCallback(onSuccess: (int? processCode) {
    //...
}, onError: (int? errorCode, String? errorInfo) {
    //...
});

int? ret = await engine?.createGroup(groupInfo, inviteeUserIds, callback:callback);
//fun_createGroup_call
*/
/*
//fun_updateGroupInfo_call
IRCIMIWGroupInfoUpdatedCallback? callback = IRCIMIWGroupInfoUpdatedCallback(onGroupInfoUpdated: (int? code, String? errorInfo) {
    //...
});

int? ret = await engine?.updateGroupInfo(groupInfo, callback:callback);
//fun_updateGroupInfo_call
*/
/*
//fun_getGroupsInfo_call
IRCIMIWGetGroupsInfoCallback? callback = IRCIMIWGetGroupsInfoCallback(onSuccess: (List<RCIMIWGroupInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getGroupsInfo(groupIds, callback:callback);
//fun_getGroupsInfo_call
*/

getGroupsInfo(Map arg) async {
  if (arg['groupIds'] == null) {
    RCIWToast.showToast("groupIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<String> groupIds = (arg["groupIds"]).split(",");
  IRCIMIWGetGroupsInfoCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetGroupsInfoCallback(
      onSuccess: (List<RCIMIWGroupInfo>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getGroupsInfo-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getGroupsInfo-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getGroupsInfo(groupIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getGroupsInfo";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_kickGroupMembers_call
IRCIMIWKickGroupMembersCallback? callback = IRCIMIWKickGroupMembersCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.kickGroupMembers(groupId, userIds, config, callback:callback);
//fun_kickGroupMembers_call
*/
/*
//fun_joinGroup_call
IRCIMIWJoinGroupCallback? callback = IRCIMIWJoinGroupCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.joinGroup(groupId, callback:callback);
//fun_joinGroup_call
*/

joinGroup(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  IRCIMIWJoinGroupCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWJoinGroupCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "joinGroup-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "joinGroup-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.joinGroup(groupId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "joinGroup";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_quitGroup_call
IRCIMIWQuitGroupCallback? callback = IRCIMIWQuitGroupCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.quitGroup(groupId, config, callback:callback);
//fun_quitGroup_call
*/
/*
//fun_dismissGroup_call
IRCIMIWDismissGroupCallback? callback = IRCIMIWDismissGroupCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.dismissGroup(groupId, callback:callback);
//fun_dismissGroup_call
*/

dismissGroup(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  IRCIMIWDismissGroupCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWDismissGroupCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "dismissGroup-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.dismissGroup(groupId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "dismissGroup";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_transferGroupOwner_call
IRCIMIWTransferGroupOwnerCallback? callback = IRCIMIWTransferGroupOwnerCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.transferGroupOwner(groupId, newOwnerId, quitGroup, config, callback:callback);
//fun_transferGroupOwner_call
*/
/*
//fun_getGroupMembers_call
IRCIMIWGetGroupMembersCallback? callback = IRCIMIWGetGroupMembersCallback(onSuccess: (List<RCIMIWGroupMemberInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getGroupMembers(groupId, userIds, callback:callback);
//fun_getGroupMembers_call
*/

getGroupMembers(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  List<String> userIds = (arg["userIds"]).split(",");
  IRCIMIWGetGroupMembersCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetGroupMembersCallback(
      onSuccess: (List<RCIMIWGroupMemberInfo>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getGroupMembers-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getGroupMembers-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getGroupMembers(groupId, userIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getGroupMembers";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getGroupMembersByRole_call
IRCIMIWGetGroupMembersByRoleCallback? callback = IRCIMIWGetGroupMembersByRoleCallback(onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getGroupMembersByRole(groupId, role, option, callback:callback);
//fun_getGroupMembersByRole_call
*/
/*
//fun_getJoinedGroupsByRole_call
IRCIMIWGetJoinedGroupsByRoleCallback? callback = IRCIMIWGetJoinedGroupsByRoleCallback(onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getJoinedGroupsByRole(role, option, callback:callback);
//fun_getJoinedGroupsByRole_call
*/
/*
//fun_getJoinedGroups_call
IRCIMIWGetJoinedGroupsCallback? callback = IRCIMIWGetJoinedGroupsCallback(onSuccess: (List<RCIMIWGroupInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getJoinedGroups(groupIds, callback:callback);
//fun_getJoinedGroups_call
*/

getJoinedGroups(Map arg) async {
  if (arg['groupIds'] == null) {
    RCIWToast.showToast("groupIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<String> groupIds = (arg["groupIds"]).split(",");
  IRCIMIWGetJoinedGroupsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetJoinedGroupsCallback(
      onSuccess: (List<RCIMIWGroupInfo>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getJoinedGroups-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getJoinedGroups-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getJoinedGroups(groupIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getJoinedGroups";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_setGroupRemark_call
IRCIMIWSetGroupRemarkCallback? callback = IRCIMIWSetGroupRemarkCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.setGroupRemark(groupId, remark, callback:callback);
//fun_setGroupRemark_call
*/

setGroupRemark(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['remark'] == null) {
    RCIWToast.showToast("remark 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String remark = arg['remark'];
  IRCIMIWSetGroupRemarkCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSetGroupRemarkCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "setGroupRemark-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.setGroupRemark(groupId, remark, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "setGroupRemark";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_setGroupMemberInfo_call
IRCIMIWSetGroupMemberInfoCallback? callback = IRCIMIWSetGroupMemberInfoCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.setGroupMemberInfo(groupId, userId, nickname, extra, callback:callback);
//fun_setGroupMemberInfo_call
*/
/*
//fun_searchJoinedGroups_call
IRCIMIWSearchJoinedGroupsCallback? callback = IRCIMIWSearchJoinedGroupsCallback(onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.searchJoinedGroups(groupName, option, callback:callback);
//fun_searchJoinedGroups_call
*/
/*
//fun_searchGroupMembers_call
IRCIMIWSearchGroupMembersCallback? callback = IRCIMIWSearchGroupMembersCallback(onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.searchGroupMembers(groupId, name, option, callback:callback);
//fun_searchGroupMembers_call
*/
/*
//fun_addGroupManagers_call
IRCIMIWAddGroupManagersCallback? callback = IRCIMIWAddGroupManagersCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.addGroupManagers(groupId, userIds, callback:callback);
//fun_addGroupManagers_call
*/

addGroupManagers(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  List<String> userIds = (arg["userIds"]).split(",");
  IRCIMIWAddGroupManagersCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAddGroupManagersCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "addGroupManagers-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.addGroupManagers(groupId, userIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addGroupManagers";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeGroupManagers_call
IRCIMIWRemoveGroupManagersCallback? callback = IRCIMIWRemoveGroupManagersCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.removeGroupManagers(groupId, userIds, callback:callback);
//fun_removeGroupManagers_call
*/

removeGroupManagers(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  List<String> userIds = (arg["userIds"]).split(",");
  IRCIMIWRemoveGroupManagersCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveGroupManagersCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeGroupManagers-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeGroupManagers(groupId, userIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeGroupManagers";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_inviteUsersToGroup_call
IRCIMIWInviteUsersToGroupCallback? callback = IRCIMIWInviteUsersToGroupCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.inviteUsersToGroup(groupId, userIds, callback:callback);
//fun_inviteUsersToGroup_call
*/

inviteUsersToGroup(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  List<String> userIds = (arg["userIds"]).split(",");
  IRCIMIWInviteUsersToGroupCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWInviteUsersToGroupCallback(
      onSuccess: (int? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "inviteUsersToGroup-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "inviteUsersToGroup-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.inviteUsersToGroup(groupId, userIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "inviteUsersToGroup";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_acceptGroupInvite_call
IRCIMIWAcceptGroupInviteCallback? callback = IRCIMIWAcceptGroupInviteCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.acceptGroupInvite(groupId, inviterId, callback:callback);
//fun_acceptGroupInvite_call
*/

acceptGroupInvite(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['inviterId'] == null) {
    RCIWToast.showToast("inviterId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String inviterId = arg['inviterId'];
  IRCIMIWAcceptGroupInviteCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAcceptGroupInviteCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "acceptGroupInvite-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.acceptGroupInvite(groupId, inviterId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "acceptGroupInvite";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_refuseGroupInvite_call
IRCIMIWRefuseGroupInviteCallback? callback = IRCIMIWRefuseGroupInviteCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.refuseGroupInvite(groupId, inviterId, reason, callback:callback);
//fun_refuseGroupInvite_call
*/

refuseGroupInvite(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['inviterId'] == null) {
    RCIWToast.showToast("inviterId 为空");
    return;
  }

  if (arg['reason'] == null) {
    RCIWToast.showToast("reason 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String inviterId = arg['inviterId'];
  String reason = arg['reason'];
  IRCIMIWRefuseGroupInviteCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRefuseGroupInviteCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "refuseGroupInvite-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.refuseGroupInvite(groupId, inviterId, reason, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "refuseGroupInvite";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_acceptGroupApplication_call
IRCIMIWAcceptGroupApplicationCallback? callback = IRCIMIWAcceptGroupApplicationCallback(onSuccess: (int? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.acceptGroupApplication(groupId, inviterId, applicantId, callback:callback);
//fun_acceptGroupApplication_call
*/
/*
//fun_refuseGroupApplication_call
IRCIMIWRefuseGroupApplicationCallback? callback = IRCIMIWRefuseGroupApplicationCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.refuseGroupApplication(groupId, inviterId, applicantId, reason, callback:callback);
//fun_refuseGroupApplication_call
*/

refuseGroupApplication(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['inviterId'] == null) {
    RCIWToast.showToast("inviterId 为空");
    return;
  }

  if (arg['applicantId'] == null) {
    RCIWToast.showToast("applicantId 为空");
    return;
  }

  if (arg['reason'] == null) {
    RCIWToast.showToast("reason 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String inviterId = arg['inviterId'];
  String applicantId = arg['applicantId'];
  String reason = arg['reason'];
  IRCIMIWRefuseGroupApplicationCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRefuseGroupApplicationCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "refuseGroupApplication-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.refuseGroupApplication(
    groupId,
    inviterId,
    applicantId,
    reason,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "refuseGroupApplication";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getGroupApplications_call
IRCIMIWGetGroupApplicationsCallback? callback = IRCIMIWGetGroupApplicationsCallback(onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getGroupApplications(option, directionsInt, statusInt, callback:callback);
//fun_getGroupApplications_call
*/
/*
//fun_addGroupFollows_call
IRCIMIWAddGroupFollowsCallback? callback = IRCIMIWAddGroupFollowsCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.addGroupFollows(groupId, userIds, callback:callback);
//fun_addGroupFollows_call
*/

addGroupFollows(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  List<String> userIds = (arg["userIds"]).split(",");
  IRCIMIWAddGroupFollowsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAddGroupFollowsCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "addGroupFollows-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.addGroupFollows(groupId, userIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addGroupFollows";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_removeGroupFollows_call
IRCIMIWRemoveGroupFollowsCallback? callback = IRCIMIWRemoveGroupFollowsCallback(onCompleted: (int? code) {
    //...
});

int? ret = await engine?.removeGroupFollows(groupId, userIds, callback:callback);
//fun_removeGroupFollows_call
*/

removeGroupFollows(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  List<String> userIds = (arg["userIds"]).split(",");
  IRCIMIWRemoveGroupFollowsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveGroupFollowsCallback(
      onCompleted: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "removeGroupFollows-onCompleted";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.removeGroupFollows(groupId, userIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeGroupFollows";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getGroupFollows_call
IRCIMIWGetGroupFollowsCallback? callback = IRCIMIWGetGroupFollowsCallback(onSuccess: (List<RCIMIWFollowInfo>? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getGroupFollows(groupId, callback:callback);
//fun_getGroupFollows_call
*/

getGroupFollows(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  IRCIMIWGetGroupFollowsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetGroupFollowsCallback(
      onSuccess: (List<RCIMIWFollowInfo>? t) {
        List tJson = [];
        if (t != null) {
          for (var temp in t) {
            tJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getGroupFollows-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = tJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getGroupFollows-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getGroupFollows(groupId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getGroupFollows";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_setCheckChatRoomDuplicateMessage_call
int? ret = await engine?.setCheckChatRoomDuplicateMessage(enableCheck);
//fun_setCheckChatRoomDuplicateMessage_call
*/

setCheckChatRoomDuplicateMessage(Map arg) async {
  if (arg['enableCheck'] == null) {
    RCIWToast.showToast("enableCheck 为空");
    return;
  }

  int enableCheckInt = int.parse(arg['enableCheck']);
  bool enableCheck = enableCheckInt == 0 ? false : true;
  int? code = await IMEngineManager().engine?.setCheckChatRoomDuplicateMessage(enableCheck);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "setCheckChatRoomDuplicateMessage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_translateMessagesWithParams_call
IRCIMIWTranslateResponseCallback? callback = IRCIMIWTranslateResponseCallback(onTranslateResponse: (int? code) {
    //...
});

int? ret = await engine?.translateMessagesWithParams(params, callback:callback);
//fun_translateMessagesWithParams_call
*/
/*
//fun_translateTextsWithParams_call
IRCIMIWTranslateResponseCallback? callback = IRCIMIWTranslateResponseCallback(onTranslateResponse: (int? code) {
    //...
});

int? ret = await engine?.translateTextsWithParams(params, callback:callback);
//fun_translateTextsWithParams_call
*/
/*
//fun_setTranslationLanguage_call
IRCIMIWTranslateResponseCallback? callback = IRCIMIWTranslateResponseCallback(onTranslateResponse: (int? code) {
    //...
});

int? ret = await engine?.setTranslationLanguage(language, callback:callback);
//fun_setTranslationLanguage_call
*/

setTranslationLanguage(Map arg) async {
  if (arg['language'] == null) {
    RCIWToast.showToast("language 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String language = arg['language'];
  IRCIMIWTranslateResponseCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWTranslateResponseCallback(
      onTranslateResponse: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "setTranslationLanguage-onTranslateResponse";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.setTranslationLanguage(language, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "setTranslationLanguage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getTranslationLanguage_call
IRCIMIWTranslateGetLanguageCallback? callback = IRCIMIWTranslateGetLanguageCallback(onSuccess: (String? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getTranslationLanguage(callback:callback);
//fun_getTranslationLanguage_call
*/

getTranslationLanguage(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWTranslateGetLanguageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWTranslateGetLanguageCallback(
      onSuccess: (String? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTranslationLanguage-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t ?? "";

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getTranslationLanguage-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getTranslationLanguage(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getTranslationLanguage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_setAutoTranslateEnable_call
IRCIMIWTranslateResponseCallback? callback = IRCIMIWTranslateResponseCallback(onTranslateResponse: (int? code) {
    //...
});

int? ret = await engine?.setAutoTranslateEnable(isEnable, callback:callback);
//fun_setAutoTranslateEnable_call
*/

setAutoTranslateEnable(Map arg) async {
  if (arg['isEnable'] == null) {
    RCIWToast.showToast("isEnable 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  int isEnableInt = int.parse(arg['isEnable']);
  bool isEnable = isEnableInt == 0 ? false : true;
  IRCIMIWTranslateResponseCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWTranslateResponseCallback(
      onTranslateResponse: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "setAutoTranslateEnable-onTranslateResponse";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.setAutoTranslateEnable(isEnable, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "setAutoTranslateEnable";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getAutoTranslateEnabled_call
IRCIMIWGetAutoTranslateEnabledCallback? callback = IRCIMIWGetAutoTranslateEnabledCallback(onSuccess: (bool? t) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.getAutoTranslateEnabled(callback:callback);
//fun_getAutoTranslateEnabled_call
*/

getAutoTranslateEnabled(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetAutoTranslateEnabledCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetAutoTranslateEnabledCallback(
      onSuccess: (bool? t) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getAutoTranslateEnabled-onSuccess";
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getAutoTranslateEnabled-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getAutoTranslateEnabled(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getAutoTranslateEnabled";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_batchSetConversationTranslateStrategy_call
IRCIMIWTranslateResponseCallback? callback = IRCIMIWTranslateResponseCallback(onTranslateResponse: (int? code) {
    //...
});

int? ret = await engine?.batchSetConversationTranslateStrategy(typesInt, targetIds, channelIds, strategy, callback:callback);
//fun_batchSetConversationTranslateStrategy_call
*/

batchSetConversationTranslateStrategy(Map arg) async {
  if (arg['types'] == null) {
    RCIWToast.showToast("types 为空");
    return;
  }

  if (arg['targetIds'] == null) {
    RCIWToast.showToast("targetIds 为空");
    return;
  }

  if (arg['channelIds'] == null) {
    RCIWToast.showToast("channelIds 为空");
    return;
  }

  if (arg['strategy'] == null) {
    RCIWToast.showToast("strategy 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List types = (arg["types"]).split(",");
  List<RCIMIWConversationType> typesInt = [];
  for (var element in types) {
    typesInt.add(RCIMIWConversationType.values[int.parse(element)]);
  }
  List<String> targetIds = (arg["targetIds"]).split(",");
  List<String> channelIds = (arg["channelIds"]).split(",");
  RCIMIWTranslateStrategy strategy = RCIMIWTranslateStrategy.values[int.parse(arg['strategy'])];
  IRCIMIWTranslateResponseCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWTranslateResponseCallback(
      onTranslateResponse: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "batchSetConversationTranslateStrategy-onTranslateResponse";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.batchSetConversationTranslateStrategy(
    typesInt,
    targetIds,
    channelIds,
    strategy,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "batchSetConversationTranslateStrategy";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_calculateTextMD5_call
String? ret = await engine?.calculateTextMD5(text);
//fun_calculateTextMD5_call
*/

calculateTextMD5(Map arg) async {
  if (arg['text'] == null) {
    RCIWToast.showToast("text 为空");
    return;
  }

  String text = arg['text'];
  String? code = await IMEngineManager().engine?.calculateTextMD5(text);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "calculateTextMD5";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? "").toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_updateMyUserProfileVisibility_call
IRCIMIWUpdateMyUserProfileVisibilityCallback? callback = IRCIMIWUpdateMyUserProfileVisibilityCallback(onSuccess: () {
    //...
}, onError: (int? errorCode) {
    //...
});

int? ret = await engine?.updateMyUserProfileVisibility(visibility, callback:callback);
//fun_updateMyUserProfileVisibility_call
*/

updateMyUserProfileVisibility(Map arg) async {
  if (arg['visibility'] == null) {
    RCIWToast.showToast("visibility 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWUserProfileVisibility visibility = RCIMIWUserProfileVisibility.values[int.parse(arg['visibility'])];
  IRCIMIWUpdateMyUserProfileVisibilityCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateMyUserProfileVisibilityCallback(
      onSuccess: () {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateMyUserProfileVisibility-onSuccess";
        arg["timestamp"] = timeStr;

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? errorCode) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateMyUserProfileVisibility-onError";
        arg["timestamp"] = timeStr;
        arg["errorCode"] = errorCode.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.updateMyUserProfileVisibility(visibility, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateMyUserProfileVisibility";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getMyUserProfileVisibility_call
IRCIMIWGetMyUserProfileVisibilityCallback? callback = IRCIMIWGetMyUserProfileVisibilityCallback(onSuccess: (int? visibility) {
    //...
}, onError: (int? errorCode) {
    //...
});

int? ret = await engine?.getMyUserProfileVisibility(callback:callback);
//fun_getMyUserProfileVisibility_call
*/

getMyUserProfileVisibility(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetMyUserProfileVisibilityCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetMyUserProfileVisibilityCallback(
      onSuccess: (int? visibility) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMyUserProfileVisibility-onSuccess";
        arg["timestamp"] = timeStr;
        arg["visibility"] = visibility.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? errorCode) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMyUserProfileVisibility-onError";
        arg["timestamp"] = timeStr;
        arg["errorCode"] = errorCode.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getMyUserProfileVisibility(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMyUserProfileVisibility";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_updateMyUserProfile_call
IRCIMIWUpdateMyUserProfileCallback? callback = IRCIMIWUpdateMyUserProfileCallback(onSuccess: () {
    //...
}, onError: (int? errorCode, List<String>? errorKeys) {
    //...
});

int? ret = await engine?.updateMyUserProfile(profile, callback:callback);
//fun_updateMyUserProfile_call
*/

updateMyUserProfile(Map arg) async {
  if (arg['profile'] == null) {
    RCIWToast.showToast("profile 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWUserProfile profile = arg['profile'];
  IRCIMIWUpdateMyUserProfileCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateMyUserProfileCallback(
      onSuccess: () {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateMyUserProfile-onSuccess";
        arg["timestamp"] = timeStr;

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? errorCode, List<String>? errorKeys) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "updateMyUserProfile-onError";
        arg["timestamp"] = timeStr;
        arg["errorCode"] = errorCode.toString();
        arg["errorKeys"] = errorKeys.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.updateMyUserProfile(profile, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateMyUserProfile";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getMyUserProfile_call
IRCIMIWGetMyUserProfileCallback? callback = IRCIMIWGetMyUserProfileCallback(onSuccess: (RCIMIWUserProfile? userProfile) {
    //...
}, onError: (int? errorCode) {
    //...
});

int? ret = await engine?.getMyUserProfile(callback:callback);
//fun_getMyUserProfile_call
*/

getMyUserProfile(Map arg) async {
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWGetMyUserProfileCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetMyUserProfileCallback(
      onSuccess: (RCIMIWUserProfile? userProfile) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMyUserProfile-onSuccess";
        arg["timestamp"] = timeStr;
        arg["userProfile"] = formatJson(userProfile?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? errorCode) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getMyUserProfile-onError";
        arg["timestamp"] = timeStr;
        arg["errorCode"] = errorCode.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getMyUserProfile(callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMyUserProfile";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_getUserProfiles_call
IRCIMIWGetUserProfilesCallback? callback = IRCIMIWGetUserProfilesCallback(onSuccess: (List<RCIMIWUserProfile>? userProfiles) {
    //...
}, onError: (int? errorCode) {
    //...
});

int? ret = await engine?.getUserProfiles(userIds, callback:callback);
//fun_getUserProfiles_call
*/

getUserProfiles(Map arg) async {
  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<String> userIds = (arg["userIds"]).split(",");
  IRCIMIWGetUserProfilesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetUserProfilesCallback(
      onSuccess: (List<RCIMIWUserProfile>? userProfiles) {
        List userProfilesJson = [];
        if (userProfiles != null) {
          for (var temp in userProfiles) {
            userProfilesJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUserProfiles-onSuccess";
        arg["timestamp"] = timeStr;
        arg["userProfiles"] = userProfilesJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? errorCode) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "getUserProfiles-onError";
        arg["timestamp"] = timeStr;
        arg["errorCode"] = errorCode.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getUserProfiles(userIds, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUserProfiles";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_searchUserProfileByUniqueId_call
IRCIMIWSearchUserProfileByUniqueIdCallback? callback = IRCIMIWSearchUserProfileByUniqueIdCallback(onSuccess: (RCIMIWUserProfile? userProfile) {
    //...
}, onError: (int? errorCode) {
    //...
});

int? ret = await engine?.searchUserProfileByUniqueId(uniqueId, callback:callback);
//fun_searchUserProfileByUniqueId_call
*/

searchUserProfileByUniqueId(Map arg) async {
  if (arg['uniqueId'] == null) {
    RCIWToast.showToast("uniqueId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String uniqueId = arg['uniqueId'];
  IRCIMIWSearchUserProfileByUniqueIdCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchUserProfileByUniqueIdCallback(
      onSuccess: (RCIMIWUserProfile? userProfile) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchUserProfileByUniqueId-onSuccess";
        arg["timestamp"] = timeStr;
        arg["userProfile"] = formatJson(userProfile?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? errorCode) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "searchUserProfileByUniqueId-onError";
        arg["timestamp"] = timeStr;
        arg["errorCode"] = errorCode.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchUserProfileByUniqueId(uniqueId, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchUserProfileByUniqueId";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_subscribeEvent_call
IRCIMIWSubscribeEventCallback? callback = IRCIMIWSubscribeEventCallback(onSuccess: () {
    //...
}, onError: (int? code, List<String>? failedUserIds) {
    //...
});

int? ret = await engine?.subscribeEvent(request, callback:callback);
//fun_subscribeEvent_call
*/

subscribeEvent(Map arg) async {
  if (arg['request'] == null) {
    RCIWToast.showToast("request 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWSubscribeEventRequest request = arg['request'];
  IRCIMIWSubscribeEventCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSubscribeEventCallback(
      onSuccess: () {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "subscribeEvent-onSuccess";
        arg["timestamp"] = timeStr;

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code, List<String>? failedUserIds) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "subscribeEvent-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["failedUserIds"] = failedUserIds.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.subscribeEvent(request, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "subscribeEvent";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_unSubscribeEvent_call
IRCIMIWSubscribeEventCallback? callback = IRCIMIWSubscribeEventCallback(onSuccess: () {
    //...
}, onError: (int? code, List<String>? failedUserIds) {
    //...
});

int? ret = await engine?.unSubscribeEvent(request, callback:callback);
//fun_unSubscribeEvent_call
*/

unSubscribeEvent(Map arg) async {
  if (arg['request'] == null) {
    RCIWToast.showToast("request 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWSubscribeEventRequest request = arg['request'];
  IRCIMIWSubscribeEventCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSubscribeEventCallback(
      onSuccess: () {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "unSubscribeEvent-onSuccess";
        arg["timestamp"] = timeStr;

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code, List<String>? failedUserIds) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "unSubscribeEvent-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["failedUserIds"] = failedUserIds.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.unSubscribeEvent(request, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "unSubscribeEvent";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_querySubscribeEvent_call
IRCIMIWQuerySubscribeEventCallback? callback = IRCIMIWQuerySubscribeEventCallback(onSuccess: (List<RCIMIWSubscribeInfoEvent>? events) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.querySubscribeEvent(request, callback:callback);
//fun_querySubscribeEvent_call
*/

querySubscribeEvent(Map arg) async {
  if (arg['request'] == null) {
    RCIWToast.showToast("request 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWSubscribeEventRequest request = arg['request'];
  IRCIMIWQuerySubscribeEventCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWQuerySubscribeEventCallback(
      onSuccess: (List<RCIMIWSubscribeInfoEvent>? events) {
        List eventsJson = [];
        if (events != null) {
          for (var temp in events) {
            eventsJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "querySubscribeEvent-onSuccess";
        arg["timestamp"] = timeStr;
        arg["events"] = eventsJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "querySubscribeEvent-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.querySubscribeEvent(request, callback: callback);
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "querySubscribeEvent";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

/*
//fun_querySubscribeEventByPage_call
IRCIMIWQuerySubscribeEventCallback? callback = IRCIMIWQuerySubscribeEventCallback(onSuccess: (List<RCIMIWSubscribeInfoEvent>? events) {
    //...
}, onError: (int? code) {
    //...
});

int? ret = await engine?.querySubscribeEventByPage(request, pageSize, startIndex, callback:callback);
//fun_querySubscribeEventByPage_call
*/

querySubscribeEventByPage(Map arg) async {
  if (arg['request'] == null) {
    RCIWToast.showToast("request 为空");
    return;
  }

  if (arg['pageSize'] == null) {
    RCIWToast.showToast("pageSize 为空");
    return;
  }

  if (arg['startIndex'] == null) {
    RCIWToast.showToast("startIndex 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWSubscribeEventRequest request = arg['request'];
  int pageSize = int.parse(arg['pageSize']);
  int startIndex = int.parse(arg['startIndex']);
  IRCIMIWQuerySubscribeEventCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWQuerySubscribeEventCallback(
      onSuccess: (List<RCIMIWSubscribeInfoEvent>? events) {
        List eventsJson = [];
        if (events != null) {
          for (var temp in events) {
            eventsJson.add(formatJson(temp.toJson()) + "\n");
          }
        }

        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "querySubscribeEventByPage-onSuccess";
        arg["timestamp"] = timeStr;
        arg["events"] = eventsJson.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        DateTime now = DateTime.now();
        String timeStr =
            "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
        Map<String, String> arg = {};
        arg["listener"] = "querySubscribeEventByPage-onError";
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.querySubscribeEventByPage(
    request,
    pageSize,
    startIndex,
    callback: callback,
  );
  DateTime now = DateTime.now();
  String timeStr =
      "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
  Map<String, String> resultCode = {};
  resultCode["listener"] = "querySubscribeEventByPage";
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}
