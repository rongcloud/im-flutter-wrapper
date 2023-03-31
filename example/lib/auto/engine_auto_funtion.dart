import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin_example/auto/im_engine.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/Toast.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';
import '../im_interface/function/engine_function.dart';

// auto
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
    callback = RCIMIWConnectCallback(onDatabaseOpened: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "connect-onDatabaseOpened";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    }, onConnected: (int? code, String? userId) {
      Map<String, String> arg = {};
      arg["listener"] = "connect-onConnected";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.connect(token, timeout, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "connect";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "disconnect";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversation";
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
    callback = IRCIMIWGetConversationCallback(onSuccess: (RCIMIWConversation? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversation-onSuccess";
      arg["t"] = formatJson(t?.toJson());

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversation-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getConversation(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversation";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversations";
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
    callback = IRCIMIWGetConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "getConversations-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversations-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.getConversations(conversationTypesInt, channelId, startTime, count, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversations";
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
    callback = IRCIMIWRemoveConversationCallback(onConversationRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "removeConversation-onConversationRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.removeConversation(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeConversation";
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
    callback = IRCIMIWRemoveConversationsCallback(onConversationsRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "removeConversations-onConversationsRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.removeConversations(conversationTypesInt, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeConversations";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadCount";
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
    callback = IRCIMIWGetUnreadCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUnreadCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUnreadCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUnreadCount(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadCount";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadTotalUnreadCount";
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
    callback = IRCIMIWGetTotalUnreadCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getTotalUnreadCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getTotalUnreadCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getTotalUnreadCount(channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getTotalUnreadCount";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadMentionedCount";
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
    callback = IRCIMIWGetUnreadMentionedCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUnreadMentionedCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUnreadMentionedCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUnreadMentionedCount(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadMentionedCount";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupAllUnreadCount";
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
    callback = IRCIMIWGetUltraGroupAllUnreadCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupAllUnreadCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupAllUnreadCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUltraGroupAllUnreadCount(callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupAllUnreadCount";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupAllUnreadMentionedCount";
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
    callback = IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupAllUnreadMentionedCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupAllUnreadMentionedCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUltraGroupAllUnreadMentionedCount(callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupAllUnreadMentionedCount";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupUnreadCount";
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
    callback = IRCIMIWGetUltraGroupUnreadCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupUnreadCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupUnreadCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUltraGroupUnreadCount(targetId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupUnreadCount";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupUnreadMentionedCount";
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
    callback = IRCIMIWGetUltraGroupUnreadMentionedCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupUnreadMentionedCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupUnreadMentionedCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUltraGroupUnreadMentionedCount(targetId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupUnreadMentionedCount";
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
  int? code =
      await IMEngineManager().engine?.loadUnreadCountByConversationTypes(conversationTypesInt, channelId, contain);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadCountByConversationTypes";
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
    callback = IRCIMIWGetUnreadCountByConversationTypesCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUnreadCountByConversationTypes-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUnreadCountByConversationTypes-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.getUnreadCountByConversationTypes(conversationTypesInt, channelId, contain, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadCountByConversationTypes";
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
    callback = IRCIMIWClearUnreadCountCallback(onUnreadCountCleared: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "clearUnreadCount-onUnreadCountCleared";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.clearUnreadCount(type, targetId, channelId, timestamp, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUnreadCount";
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
    callback = IRCIMIWSaveDraftMessageCallback(onDraftMessageSaved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "saveDraftMessage-onDraftMessageSaved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.saveDraftMessage(type, targetId, channelId, draft, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "saveDraftMessage";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadDraftMessage";
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
    callback = IRCIMIWGetDraftMessageCallback(onSuccess: (String? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getDraftMessage-onSuccess";
      arg["t"] = t ?? "";

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getDraftMessage-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getDraftMessage(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getDraftMessage";
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
    callback = IRCIMIWClearDraftMessageCallback(onDraftMessageCleared: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "clearDraftMessage-onDraftMessageCleared";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.clearDraftMessage(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearDraftMessage";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlockedConversations";
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
    callback = IRCIMIWGetBlockedConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "getBlockedConversations-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getBlockedConversations-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.getBlockedConversations(conversationTypesInt, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBlockedConversations";
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
    callback = IRCIMIWChangeConversationTopStatusCallback(onConversationTopStatusChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changeConversationTopStatus-onConversationTopStatusChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.changeConversationTopStatus(type, targetId, channelId, top, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTopStatus";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationTopStatus";
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
    callback = IRCIMIWGetConversationTopStatusCallback(onSuccess: (bool? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversationTopStatus-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversationTopStatus-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getConversationTopStatus(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationTopStatus";
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
    callback = IRCIMIWSyncConversationReadStatusCallback(onConversationReadStatusSynced: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "syncConversationReadStatus-onConversationReadStatusSynced";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.syncConversationReadStatus(type, targetId, channelId, timestamp, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "syncConversationReadStatus";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendTypingStatus";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadMessages";
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
    callback = IRCIMIWGetMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "getMessages-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getMessages-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.getMessages(type, targetId, channelId, sentTime, order, policy, count, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMessages";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadFirstUnreadMessage";
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
    callback = IRCIMIWGetFirstUnreadMessageCallback(onSuccess: (RCIMIWMessage? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getFirstUnreadMessage-onSuccess";
      arg["t"] = formatJson(t?.toJson());

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getFirstUnreadMessage-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getFirstUnreadMessage(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getFirstUnreadMessage";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUnreadMentionedMessages";
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
    callback = IRCIMIWGetUnreadMentionedMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "getUnreadMentionedMessages-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUnreadMentionedMessages-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUnreadMentionedMessages(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUnreadMentionedMessages";
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
    callback = IRCIMIWClearMessagesCallback(onMessagesCleared: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "clearMessages-onMessagesCleared";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.clearMessages(type, targetId, channelId, timestamp, policy, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearMessages";
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
    callback = IRCIMIWSendPrivateReadReceiptMessageCallback(onPrivateReadReceiptMessageSent: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "sendPrivateReadReceiptMessage-onPrivateReadReceiptMessageSent";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.sendPrivateReadReceiptMessage(targetId, channelId, timestamp, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendPrivateReadReceiptMessage";
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
    callback = IRCIMIWUpdateMessageExpansionCallback(onMessageExpansionUpdated: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "updateMessageExpansion-onMessageExpansionUpdated";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.updateMessageExpansion(messageUId, expansion, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateMessageExpansion";
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
    callback = IRCIMIWRemoveMessageExpansionForKeysCallback(onMessageExpansionForKeysRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "removeMessageExpansionForKeys-onMessageExpansionForKeysRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.removeMessageExpansionForKeys(messageUId, keys, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeMessageExpansionForKeys";
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
    callback = IRCIMIWChangeMessageSentStatusCallback(onMessageSentStatusChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changeMessageSentStatus-onMessageSentStatusChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.changeMessageSentStatus(messageId, sentStatus, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeMessageSentStatus";
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
    callback = IRCIMIWChangeMessageReceivedStatusCallback(onMessageReceiveStatusChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changeMessageReceiveStatus-onMessageReceiveStatusChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.changeMessageReceiveStatus(messageId, receivedStatus, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeMessageReceiveStatus";
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
    callback = IRCIMIWJoinChatRoomCallback(onChatRoomJoined: (int? code, String? targetId) {
      Map<String, String> arg = {};
      arg["listener"] = "joinChatRoom-onChatRoomJoined";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.joinChatRoom(targetId, messageCount, autoCreate, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "joinChatRoom";
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
    callback = IRCIMIWLeaveChatRoomCallback(onChatRoomLeft: (int? code, String? targetId) {
      Map<String, String> arg = {};
      arg["listener"] = "leaveChatRoom-onChatRoomLeft";
      arg["code"] = code.toString();
      arg["targetId"] = targetId ?? "";

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.leaveChatRoom(targetId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "leaveChatRoom";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomMessages";
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
    callback = IRCIMIWGetChatRoomMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "getChatRoomMessages-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getChatRoomMessages-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.getChatRoomMessages(targetId, timestamp, order, count, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getChatRoomMessages";
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
    callback = IRCIMIWAddChatRoomEntryCallback(onChatRoomEntryAdded: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "addChatRoomEntry-onChatRoomEntryAdded";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.addChatRoomEntry(targetId, key, value, deleteWhenLeft, overwrite, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addChatRoomEntry";
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
    callback = IRCIMIWAddChatRoomEntriesCallback(onChatRoomEntriesAdded: (int? code, Map? errors) {
      Map<String, String> arg = {};
      arg["listener"] = "addChatRoomEntries-onChatRoomEntriesAdded";
      arg["code"] = code.toString();
      arg["errors"] = errors.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.addChatRoomEntries(targetId, entries, deleteWhenLeft, overwrite, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addChatRoomEntries";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomEntry";
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
    callback = IRCIMIWGetChatRoomEntryCallback(onSuccess: (Map? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getChatRoomEntry-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getChatRoomEntry-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getChatRoomEntry(targetId, key, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getChatRoomEntry";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadChatRoomAllEntries";
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
    callback = IRCIMIWGetChatRoomAllEntriesCallback(onSuccess: (Map? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getChatRoomAllEntries-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getChatRoomAllEntries-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getChatRoomAllEntries(targetId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getChatRoomAllEntries";
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
    callback = IRCIMIWRemoveChatRoomEntryCallback(onChatRoomEntryRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "removeChatRoomEntry-onChatRoomEntryRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.removeChatRoomEntry(targetId, key, force, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeChatRoomEntry";
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
    callback = IRCIMIWRemoveChatRoomEntriesCallback(onChatRoomEntriesRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "removeChatRoomEntries-onChatRoomEntriesRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.removeChatRoomEntries(targetId, keys, force, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeChatRoomEntries";
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
    callback = IRCIMIWAddToBlacklistCallback(onBlacklistAdded: (int? code, String? userId) {
      Map<String, String> arg = {};
      arg["listener"] = "addToBlacklist-onBlacklistAdded";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.addToBlacklist(userId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "addToBlacklist";
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
    callback = IRCIMIWRemoveFromBlacklistCallback(onBlacklistRemoved: (int? code, String? userId) {
      Map<String, String> arg = {};
      arg["listener"] = "removeFromBlacklist-onBlacklistRemoved";
      arg["code"] = code.toString();
      arg["userId"] = userId ?? "";

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.removeFromBlacklist(userId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeFromBlacklist";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlacklistStatus";
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
    callback = IRCIMIWGetBlacklistStatusCallback(onSuccess: (RCIMIWBlacklistStatus? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getBlacklistStatus-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getBlacklistStatus-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getBlacklistStatus(userId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBlacklistStatus";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBlacklist";
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
    callback = IRCIMIWGetBlacklistCallback(onSuccess: (List<String>? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getBlacklist-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getBlacklist-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getBlacklist(callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBlacklist";
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
    callback = IRCIMIWSearchMessagesCallback(onSuccess: (List<RCIMIWMessage>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "searchMessages-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "searchMessages-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.searchMessages(type, targetId, channelId, keyword, startTime, count, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessages";
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
    callback = IRCIMIWSearchMessagesByTimeRangeCallback(onSuccess: (List<RCIMIWMessage>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "searchMessagesByTimeRange-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "searchMessagesByTimeRange-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.searchMessagesByTimeRange(
      type, targetId, channelId, keyword, startTime, endTime, offset, count,
      callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessagesByTimeRange";
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
    callback = IRCIMIWSearchMessagesByUserIdCallback(onSuccess: (List<RCIMIWMessage>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "searchMessagesByUserId-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "searchMessagesByUserId-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.searchMessagesByUserId(userId, type, targetId, channelId, startTime, count, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchMessagesByUserId";
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
    callback = IRCIMIWSearchConversationsCallback(onSuccess: (List<RCIMIWSearchConversationResult>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "searchConversations-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "searchConversations-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.searchConversations(conversationTypesInt, channelId, messageTypesInt, keyword, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchConversations";
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
    callback = IRCIMIWChangeNotificationQuietHoursCallback(onNotificationQuietHoursChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changeNotificationQuietHours-onNotificationQuietHoursChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.changeNotificationQuietHours(startTime, spanMinutes, level, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeNotificationQuietHours";
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
    callback = IRCIMIWRemoveNotificationQuietHoursCallback(onNotificationQuietHoursRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "removeNotificationQuietHours-onNotificationQuietHoursRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.removeNotificationQuietHours(callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeNotificationQuietHours";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadNotificationQuietHours";
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
      Map<String, String> arg = {};
      arg["listener"] = "getNotificationQuietHours-onSuccess";
      arg["startTime"] = startTime ?? "";
      arg["spanMinutes"] = spanMinutes.toString();
      arg["level"] = level.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getNotificationQuietHours-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getNotificationQuietHours(callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getNotificationQuietHours";
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
    callback = IRCIMIWChangeConversationNotificationLevelCallback(onConversationNotificationLevelChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changeConversationNotificationLevel-onConversationNotificationLevelChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.changeConversationNotificationLevel(type, targetId, channelId, level, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationNotificationLevel";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationNotificationLevel";
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
    callback = IRCIMIWGetConversationNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversationNotificationLevel-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversationNotificationLevel-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.getConversationNotificationLevel(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationNotificationLevel";
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
    callback =
        IRCIMIWChangeConversationTypeNotificationLevelCallback(onConversationTypeNotificationLevelChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changeConversationTypeNotificationLevel-onConversationTypeNotificationLevelChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.changeConversationTypeNotificationLevel(type, level, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeConversationTypeNotificationLevel";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationTypeNotificationLevel";
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
    callback = IRCIMIWGetConversationTypeNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversationTypeNotificationLevel-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversationTypeNotificationLevel-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getConversationTypeNotificationLevel(type, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationTypeNotificationLevel";
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
      Map<String, String> arg = {};
      arg["listener"] = "changeUltraGroupDefaultNotificationLevel-onUltraGroupDefaultNotificationLevelChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.changeUltraGroupDefaultNotificationLevel(targetId, level, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeUltraGroupDefaultNotificationLevel";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupDefaultNotificationLevel";
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
    callback = IRCIMIWGetUltraGroupDefaultNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupDefaultNotificationLevel-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupDefaultNotificationLevel-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getUltraGroupDefaultNotificationLevel(targetId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupDefaultNotificationLevel";
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
      Map<String, String> arg = {};
      arg["listener"] =
          "changeUltraGroupChannelDefaultNotificationLevel-onUltraGroupChannelDefaultNotificationLevelChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.changeUltraGroupChannelDefaultNotificationLevel(targetId, channelId, level, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeUltraGroupChannelDefaultNotificationLevel";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadUltraGroupChannelDefaultNotificationLevel";
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
    callback = IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback(onSuccess: (RCIMIWPushNotificationLevel? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupChannelDefaultNotificationLevel-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getUltraGroupChannelDefaultNotificationLevel-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.getUltraGroupChannelDefaultNotificationLevel(targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getUltraGroupChannelDefaultNotificationLevel";
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
    callback = IRCIMIWChangePushContentShowStatusCallback(onPushContentShowStatusChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changePushContentShowStatus-onPushContentShowStatusChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.changePushContentShowStatus(showContent, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushContentShowStatus";
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
    callback = IRCIMIWChangePushLanguageCallback(onPushLanguageChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changePushLanguage-onPushLanguageChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.changePushLanguage(language, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushLanguage";
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
    callback = IRCIMIWChangePushReceiveStatusCallback(onPushReceiveStatusChanged: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "changePushReceiveStatus-onPushReceiveStatusChanged";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.changePushReceiveStatus(receive, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changePushReceiveStatus";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadMessageCount";
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
    callback = IRCIMIWGetMessageCountCallback(onSuccess: (int? t) {
      Map<String, String> arg = {};
      arg["listener"] = "getMessageCount-onSuccess";
      arg["t"] = t.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getMessageCount-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getMessageCount(type, targetId, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMessageCount";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadTopConversations";
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
    callback = IRCIMIWGetTopConversationsCallback(onSuccess: (List<RCIMIWConversation>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "getTopConversations-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getTopConversations-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getTopConversations(conversationTypesInt, channelId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getTopConversations";
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
    callback = IRCIMIWSyncUltraGroupReadStatusCallback(onUltraGroupReadStatusSynced: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "syncUltraGroupReadStatus-onUltraGroupReadStatusSynced";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.syncUltraGroupReadStatus(targetId, channelId, timestamp, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "syncUltraGroupReadStatus";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadConversationsForAllChannel";
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
    callback = IRCIMIWGetConversationsForAllChannelCallback(onSuccess: (List<RCIMIWConversation>? t) {
      List tJson = [];
      if (t != null) {
        for (var temp in t) {
          tJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "getConversationsForAllChannel-onSuccess";
      arg["t"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getConversationsForAllChannel-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getConversationsForAllChannel(type, targetId, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConversationsForAllChannel";
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
    callback = IRCIMIWClearUltraGroupMessagesCallback(onUltraGroupMessagesCleared: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "clearUltraGroupMessages-onUltraGroupMessagesCleared";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.clearUltraGroupMessages(targetId, channelId, timestamp, policy, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUltraGroupMessages";
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
    callback = IRCIMIWSendUltraGroupTypingStatusCallback(onUltraGroupTypingStatusSent: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "sendUltraGroupTypingStatus-onUltraGroupTypingStatusSent";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.sendUltraGroupTypingStatus(targetId, channelId, typingStatus, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendUltraGroupTypingStatus";
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
    callback =
        IRCIMIWClearUltraGroupMessagesForAllChannelCallback(onUltraGroupMessagesClearedForAllChannel: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "clearUltraGroupMessagesForAllChannel-onUltraGroupMessagesClearedForAllChannel";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.clearUltraGroupMessagesForAllChannel(targetId, timestamp, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUltraGroupMessagesForAllChannel";
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

      Map<String, String> arg = {};
      arg["listener"] = "getBatchRemoteUltraGroupMessages-onSuccess";
      arg["matchedMessages"] = matchedMessagesJson.toString();
      arg["notMatchedMessages"] = notMatchedMessagesJson.toString();

      bus.emit("rong_im_listener", arg);
    }, onError: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "getBatchRemoteUltraGroupMessages-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.getBatchRemoteUltraGroupMessages(messages, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBatchRemoteUltraGroupMessages";
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
    callback = IRCIMIWUpdateUltraGroupMessageExpansionCallback(onUltraGroupMessageExpansionUpdated: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "updateUltraGroupMessageExpansion-onUltraGroupMessageExpansionUpdated";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.updateUltraGroupMessageExpansion(messageUId, expansion, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateUltraGroupMessageExpansion";
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
    callback =
        IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback(onUltraGroupMessageExpansionForKeysRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "removeUltraGroupMessageExpansionForKeys-onUltraGroupMessageExpansionForKeysRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code =
      await IMEngineManager().engine?.removeUltraGroupMessageExpansionForKeys(messageUId, keys, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeUltraGroupMessageExpansionForKeys";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "changeLogLevel";
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
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getDeltaTime";
  resultCode["code"] = (code ?? -1).toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}
