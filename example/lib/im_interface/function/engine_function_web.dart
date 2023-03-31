import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:universal_html/html.dart' as html;
import 'package:image_picker/image_picker.dart';
import 'package:rongcloud_im_wrapper_plugin_example/app_data.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/Toast.dart';
import 'package:flutter/material.dart';
import 'package:rongcloud_im_wrapper_plugin_example/media/rong_media_web.dart';

import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin_example/auto/im_engine.dart';

initEngine(Map arg) async {
  if (IMEngineManager().engine == null) {
    arg['appkey'] = arg['appkey'] ?? AccountInfo.appKey;
    if (arg['appkey'] == null) {
      RCIWToast.showToast("appkey 为空");
      return;
    }

    RCIMIWEngineOptions options = RCIMIWEngineOptions.create();
    if (arg['naviServer'] != null) {
      options.naviServer = arg['naviServer'];
    }
    if (arg['fileServer'] != null) {
      options.fileServer = arg['fileServer'];
    }
    if (arg['statisticServer'] != null) {
      options.statisticServer = arg['statisticServer'];
    }
    if (arg['kickReconnectDevice'] != null) {
      bool kickReconnectDevice = arg['kickReconnectDevice'] == 0 ? false : true;
      options.kickReconnectDevice = kickReconnectDevice;
    }
    RCIMIWCompressOptions compressOptions = RCIMIWCompressOptions.create();
    if (arg['originalImageQuality'] != null) {
      compressOptions.originalImageQuality =
          int.parse(arg['originalImageQuality']);
    }
    if (arg['originalImageMaxSize'] != null) {
      compressOptions.originalImageMaxSize =
          int.parse(arg['originalImageMaxSize']);
    }
    if (arg['originalImageSize'] != null) {
      compressOptions.originalImageSize = int.parse(arg['originalImageSize']);
    }
    if (arg['thumbnailQuality'] != null) {
      compressOptions.thumbnailQuality = int.parse(arg['thumbnailQuality']);
    }
    if (arg['thumbnailMaxSize'] != null) {
      compressOptions.thumbnailMaxSize = int.parse(arg['thumbnailMaxSize']);
    }
    if (arg['thumbnailMinSize'] != null) {
      compressOptions.thumbnailMinSize = int.parse(arg['thumbnailMinSize']);
    }
    if (arg['sightCompressWidth'] != null) {
      compressOptions.sightCompressWidth = int.parse(arg['sightCompressWidth']);
    }
    if (arg['sightCompressHeight'] != null) {
      compressOptions.sightCompressHeight =
          int.parse(arg['sightCompressHeight']);
    }
    if (arg['locationThumbnailQuality'] != null) {
      compressOptions.locationThumbnailQuality =
          int.parse(arg['locationThumbnailQuality']);
    }
    if (arg['locationThumbnailHeight'] != null) {
      compressOptions.locationThumbnailHeight =
          int.parse(arg['locationThumbnailHeight']);
    }
    if (arg['locationThumbnailWidth'] != null) {
      compressOptions.locationThumbnailWidth =
          int.parse(arg['locationThumbnailWidth']);
    }

    RCIMIWPushOptions pushOptions = RCIMIWPushOptions.create(
      idMI: AndroidPushInfo.idMI,
      appKeyMI: AndroidPushInfo.appKeyMI,
      appIdMeizu: AndroidPushInfo.appIdMeizu,
      appKeyMeizu: AndroidPushInfo.appKeyMeizu,
      appKeyOPPO: AndroidPushInfo.appKeyOPPO,
      appSecretOPPO: AndroidPushInfo.appSecretOPPO,
      enableHWPush: true,
      enableFCM: false,
      enableVIVOPush: true,
    );
    options.pushOptions = pushOptions;
    options.compressOptions = compressOptions;
    String appkey = arg['appkey'];
    RCIMIWEngine e = await RCIMIWEngine.create(appkey, options);
    RCIWToast.showToast("引擎初始化成功");
    IMEngineManager().engine = e;
    Map<String, String> eventResult = {};
    eventResult["listener"] = "initEngine";
    eventResult["code"] = "0";
    bus.emit("rong_im_listener", eventResult);
  } else {
    RCIWToast.showToast("引擎已存在");
    Map<String, String> eventResult = {};
    eventResult["listener"] = "initEngine";
    eventResult["code"] = "-1";
    eventResult["errorMsg"] = "引擎已存在";
    bus.emit("rong_im_listener", eventResult);
  }
}

destroy() {
  if (IMEngineManager().engine != null) {
    IMEngineManager().engine?.destroy();
    IMEngineManager().engine = null;
    RCIWToast.showToast("引擎已销毁");
    Map<String, String> eventResult = {};
    eventResult["listener"] = "destroy";
    eventResult["code"] = "0";
    eventResult["errorMsg"] = "引擎已销毁";
    bus.emit("rong_im_listener", eventResult);
  } else {
    RCIWToast.showToast("引擎还未初始化");
    Map<String, String> eventResult = {};
    eventResult["listener"] = "destroy";
    eventResult["code"] = "-1";
    eventResult["errorMsg"] = "引擎还未初始化";
    bus.emit("rong_im_listener", eventResult);
  }
}

setListener() {
  if (IMEngineManager().engine != null) {
    IMEngineManager().setEngineListener();
    IMEngineManager().engine?.onConversationsUpdateForWeb = (conversations) {
      List tJson = [];
      for (var temp in conversations) {
        tJson.add(formatJson(temp.toJson()) + "\n");
      }
      Map<String, String> arg = {};
      arg["listener"] = "onConversationsUpdateForWeb";
      arg["conversations"] = tJson.toString();

      bus.emit("rong_im_listener", arg);
    };
    IMEngineManager().engine?.onRemoteMessageExpansionUpdatedForWeb =
        (Map? expansion, String? messageUId) {
      Map<String, String> arg = {};
      arg["listener"] = "onRemoteMessageExpansionUpdatedForWeb";
      arg["expansion"] = expansion.toString();
      arg["messageUId"] = messageUId ?? '';

      bus.emit("rong_im_listener", arg);
    };
    IMEngineManager().engine?.onRemoteMessageExpansionForKeyRemovedForWeb =
        (String? messageUId, List<String>? keys) {
      Map<String, String> arg = {};
      arg["listener"] = "onRemoteMessageExpansionForKeyRemovedForWeb";
      arg["messageUId"] = messageUId ?? '';
      arg["keys"] = keys.toString();

      bus.emit("rong_im_listener", arg);
    };
    Map<String, String> arg = {};
    arg["listener"] = "setListener";
    arg["code"] = "0";
    bus.emit("rong_im_listener", arg);
  } else {
    RCIWToast.showToast("引擎还未初始化");
    Map<String, String> arg = {};
    arg["listener"] = "setListener";
    arg["code"] = "-1";
    arg["errorMsg"] = "引擎还未初始化";
    bus.emit("rong_im_listener", arg);
  }
}

disconnect(Map arg) async {
  int? code = await IMEngineManager().engine?.disconnect(false);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "disconnect";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendImageMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  bool original =
      arg['original'] == null ? false : int.parse(arg['original']) == 1;
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  BuildContext context = arg['context'];
  RCIWMediaUlits.showImagePicker(context, (XFile? file) async {
    if (file != null) {
      // Uint8List fileBytes = await file.readAsBytes();
      // String base64 = base64Encode(fileBytes);

      RCIMIWImageMessage? message = await IMEngineManager()
          .engine
          ?.createImageMessageForWeb(
              type, targetId, channelId, _getImagePickerFile());
      message?.original = original;
      _sendMessage(message, useCallback: useCallback);
    }
  });
}

sendFileMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  FilePickerResult? result = await RCIWMediaUlits.pickFiles();
  if (result != null) {
    RCIMIWFileMessage? msg = await IMEngineManager()
        .engine
        ?.createFileMessageForWeb(
            type, targetId, channelId, _getFilePickerFile());
    _sendMessage(msg, useCallback: useCallback);
  }
}

sendSightMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  BuildContext context = arg['context'];
  RCIWMediaUlits.showVideoPicker(context, (path) async {
    RCIMIWSightMessage? sightMsg =
        await IMEngineManager().engine?.createSightMessageForWeb(
              type,
              targetId,
              channelId,
              _getImagePickerFile(),
            );
    _sendMessage(sightMsg, useCallback: useCallback);
  });
}

sendVoiceMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  FilePickerResult? files =
      await RCIWMediaUlits.pickFiles(allowedExtensions: ["aac"]);
  if (files != null) {
    RCIMIWVoiceMessage? msg = await IMEngineManager()
        .engine
        ?.createVoiceMessageForWeb(
            type, targetId, channelId, _getFilePickerFile());
    _sendMessage(msg, useCallback: useCallback);
  }
  // BuildContext context = arg['context'];
  // showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Center(
  //           child: RecordView(
  //         onPressed: () {
  //           RCIWMediaUlits.startRecordAudio();
  //         },
  //         onCanceled: () {
  //           Navigator.of(context).pop();
  //           RCIWMediaUlits.stopRecordAudio((path, duration) async {});
  //           RCIWToast.showToast("录音被取消");
  //         },
  //         onFinished: () {
  //           RCIWMediaUlits.stopRecordAudio((path, duration) async {
  //             if (path != null && (duration ?? 0) > 0) {
  //               RCIMIWVoiceMessage? msg = await IMEngineManager()
  //                   .engine
  //                   ?.createVoiceMessageForWeb(
  //                       type, targetId, channelId, _getImagePickerFile());
  //               _sendMessage(msg);
  //             }
  //           });
  //           Navigator.of(context).pop();
  //         },
  //       ));
  //     });
}

sendGIFMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  FilePickerResult? files =
      await RCIWMediaUlits.pickFiles(allowedExtensions: ["gif"]);
  if (files != null) {
    RCIMIWGIFMessage? msg = await IMEngineManager()
        .engine
        ?.createGIFMessageForWeb(
            type, targetId, channelId, _getFilePickerFile());
    _sendMessage(msg, useCallback: useCallback);
  }
}

sendLocationMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['longitude'] == null) {
    RCIWToast.showToast("longitude 为空");
    return;
  }
  if (arg['latitude'] == null) {
    RCIWToast.showToast("latitude 为空");
    return;
  }

  if (arg['poiName'] == null) {
    RCIWToast.showToast("poiName 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String longitude = arg['longitude'];
  String latitude = arg['latitude'];
  String poiName = arg['poiName'];
  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  BuildContext context = arg['context'];
  RCIWMediaUlits.showImagePicker(context, (XFile? file) async {
    if (file == null) {
      RCIWToast.showToast("图片文件为空");
      return;
    }
    Uint8List bytes = await file.readAsBytes();
    RCIMIWLocationMessage? message = await IMEngineManager()
        .engine
        ?.createLocationMessageForWeb(
            type,
            targetId,
            channelId,
            double.parse(longitude),
            double.parse(latitude),
            poiName,
            base64Encode(bytes));
    _sendMessage(message, useCallback: useCallback);
  });
}

sendReferenceMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }
  if (arg['text'] == null) {
    RCIWToast.showToast("text 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];

  String channelId = arg['channelId'] ?? "";
  String messageUId = arg['messageUId'];
  String text = arg['text'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWMessage? message =
      await _getMessageByUId(type, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }

  RCIMIWReferenceMessage? referenceMsg = await IMEngineManager()
      .engine
      ?.createReferenceMessage(type, targetId, channelId, message, text);
  _sendMessage(referenceMsg, useCallback: useCallback);
}

updateMessageExpansion(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
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
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  String messageUId = arg['messageUId'];
  Map expansion = {};
  List keys = (arg["keys"]).split(",");
  List values = (arg["values"]).split(",");
  for (var i = 0; i < keys.length; i++) {
    expansion[keys[i]] = values[i];
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWUpdateMessageExpansionCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateMessageExpansionCallback(
        onMessageExpansionUpdated: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "updateMessageExpansion-onMessageExpansionUpdated";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  RCIMIWMessage? message =
      await _getMessageByUId(type, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  int? code = await IMEngineManager()
      .engine
      ?.updateMessageExpansionForWeb(message, expansion, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateMessageExpansion";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeMessageExpansionForKeys(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }
  if (arg['keys'] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  String messageUId = arg['messageUId'];
  List<String> keys = (arg["keys"]).split(",");
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWMessage? message =
      await _getMessageByUId(type, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }

  IRCIMIWRemoveMessageExpansionForKeysCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveMessageExpansionForKeysCallback(
        onMessageExpansionForKeysRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] =
          "removeMessageExpansionForKeys-onMessageExpansionForKeysRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.removeMessageExpansionForKeysForWeb(message, keys, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeMessageExpansionForKeys";
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
  if (arg['messageUIds'] == null) {
    RCIWToast.showToast("messageUIds 为空");
    return;
  }
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  List messageUIds = (arg["messageUIds"]).split(",");
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<RCIMIWMessage> messages = [];
  for (var messageUId in messageUIds) {
    RCIMIWMessage? msg =
        await _getMessageByUId(type, targetId, channelId, messageUId);
    if (msg != null) {
      messages.add(msg);
    } else {
      RCIWToast.showToast("未查询到消息 messageUId:" + messageUId);
    }
  }

  IRCIMIWDeleteMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWDeleteMessagesCallback(
        onMessagesDeleted: (int? code, List<RCIMIWMessage>? messages) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] = "deleteMessages-onMessagesDeleted";
      arg["code"] = code.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.deleteMessages(type, targetId, channelId, messages, callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "deleteMessages";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

recallMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  String messageUId = arg['messageUId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWMessage? message =
      await _getMessageByUId(type, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }

  IRCIMIWRecallMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRecallMessageCallback(
        onMessageRecalled: (int? code, RCIMIWMessage? message) {
      Map<String, String> arg = {};
      arg["listener"] = "recallMessage-onMessageRecalled";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.recallMessage(message, callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "recallMessage";
  resultCode["code"] = (code ?? -1).toString();
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

  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  int timestamp = int.parse(arg['timestamp']);
  String messageUId = arg['messageUId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWSendPrivateReadReceiptMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSendPrivateReadReceiptMessageCallback(
        onPrivateReadReceiptMessageSent: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] =
          "sendPrivateReadReceiptMessage-onPrivateReadReceiptMessageSent";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.sendPrivateReadReceiptMessageForWeb(
          targetId, channelId, timestamp, messageUId,
          callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendPrivateReadReceiptMessageForWeb";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

sendGroupReadReceiptRequest(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }
  RCIMIWConversationType type = RCIMIWConversationType.group;
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String messageUId = arg['messageUId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWMessage? message =
      await _getMessageByUId(type, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }

  IRCIMIWSendGroupReadReceiptRequestCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSendGroupReadReceiptRequestCallback(
        onGroupReadReceiptRequestSent: (int? code, RCIMIWMessage? message) {
      Map<String, String> arg = {};
      arg["listener"] =
          "sendGroupReadReceiptRequest-onGroupReadReceiptRequestSent";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.sendGroupReadReceiptRequest(message, callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendGroupReadReceiptRequest";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

sendGroupReadReceiptResponse(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUIds'] == null) {
    RCIWToast.showToast("messageUIds 为空");
    return;
  }
  RCIMIWConversationType type = RCIMIWConversationType.group;
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  List messageUIds = (arg["messageUIds"]).split(",");
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<RCIMIWMessage> messages = [];
  for (var messageUId in messageUIds) {
    RCIMIWMessage? msg =
        await _getMessageByUId(type, targetId, channelId, messageUId);
    if (msg != null) {
      messages.add(msg);
    } else {
      RCIWToast.showToast("未查询到消息 messageUId:" + messageUId);
    }
  }

  IRCIMIWSendGroupReadReceiptResponseCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSendGroupReadReceiptResponseCallback(
        onGroupReadReceiptResponseSent:
            (int? code, List<RCIMIWMessage>? message) {
      List messageJson = [];
      if (message != null) {
        for (var temp in message) {
          messageJson.add(formatJson(temp.toJson()) + "\n");
        }
      }

      Map<String, String> arg = {};
      arg["listener"] =
          "sendGroupReadReceiptResponse-onGroupReadReceiptResponseSent";
      arg["code"] = code.toString();
      arg["message"] = messageJson.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.sendGroupReadReceiptResponse(
      targetId, channelId, messages,
      callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "sendGroupReadReceiptResponse";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

sendGroupMessageToDesignatedUsers(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['userIds'] == null) {
    RCIWToast.showToast("userIds 为空");
    return;
  }

  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWTextMessage? textMessage =
      await IMEngineManager().engine?.createTextMessage(
            RCIMIWConversationType.group,
            targetId,
            channelId,
            "这是一条群定向消息",
          );

  List<String> userIds = (arg["userIds"]).split(",");

  RCIMIWSendGroupMessageToDesignatedUsersCallback? callback;
  if (useCallback == 1) {
    callback = RCIMIWSendGroupMessageToDesignatedUsersCallback(
        onMessageSaved: (RCIMIWMessage? message) {
      Map<String, String> arg = {};
      arg["listener"] = "sendGroupMessageToDesignatedUsers-onMessageSaved";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    }, onMessageSent: (int? code, RCIMIWMessage? message) {
      Map<String, String> arg = {};
      arg["listener"] = "sendGroupMessageToDesignatedUsers-onMessageSent";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.sendGroupMessageToDesignatedUsers(
      textMessage!, userIds,
      callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

modifyUltraGroupMessage(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }
  RCIMIWConversationType type = RCIMIWConversationType.ultraGroup;
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String messageUId = arg['messageUId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWMessage? message =
      await _getMessageByUId(type, targetId, channelId, messageUId);
  if (message == null) {
    Map<String, String> resultCode = {};
    resultCode["listener"] = "modifyUltraGroupMessage";

    if (IMEngineManager().engine == null) {
      resultCode["errorMsg"] = "引擎未初始化";
      resultCode["code"] = (-1).toString();
    } else {
      resultCode["errorMsg"] = "messageUId 消息不存在";
      resultCode["code"] = (-1).toString();
    }
    bus.emit("rong_im_listener", resultCode);
    return;
  }
  RCIMIWMessage? textMessage = await IMEngineManager()
      .engine
      ?.createTextMessage(
          type, message.targetId!, message.channelId, "这个是超级群修改消息的内容");

  IRCIMIWModifyUltraGroupMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWModifyUltraGroupMessageCallback(
        onUltraGroupMessageModified: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "modifyUltraGroupMessage-onUltraGroupMessageModified";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.modifyUltraGroupMessageForWeb(
      message, textMessage!,
      callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "modifyUltraGroupMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

getBatchRemoteUltraGroupMessages(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUIds'] == null) {
    RCIWToast.showToast("messageUIds 为空");
    return;
  }
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  List<String> messageUIds = (arg["messageUIds"] ?? "").split(",");
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  List<RCIMIWMessage> messages = [];
  for (var messageUId in messageUIds) {
    RCIMIWMessage? message = await _getMessageByUId(
        RCIMIWConversationType.ultraGroup, targetId, channelId, messageUId);
    if (message == null) {
      RCIWToast.showToast(messageUId + " 不存在");
      break;
    }
    messages.add(message);
  }

  IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetBatchRemoteUltraGroupMessagesCallback(onSuccess:
        (List<RCIMIWMessage>? matchedMessages,
            List<RCIMIWMessage>? notMatchedMessages) {
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

  int? code = await IMEngineManager().engine?.getBatchRemoteUltraGroupMessages(
        messages,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "getBatchRemoteUltraGroupMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

recallUltraGroupMessage(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg['deleteRemote'] == null) {
    RCIWToast.showToast("deleteRemote 为空");
    return;
  }

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String messageUId = arg['messageUId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWMessage? message = await _getMessageByUId(
      RCIMIWConversationType.ultraGroup, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  int deleteRemoteInt = int.parse(arg['deleteRemote']);
  bool deleteRemote = deleteRemoteInt == 0 ? false : true;

  IRCIMIWRecallUltraGroupMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRecallUltraGroupMessageCallback(
        onUltraGroupMessageRecalled: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "recallUltraGroupMessage-onUltraGroupMessageRecalled";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager()
      .engine
      ?.recallUltraGroupMessage(message, deleteRemote, callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "recallUltraGroupMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

updateUltraGroupMessageExpansion(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
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
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String messageUId = arg['messageUId'];
  Map expansion = {};
  List keys = (arg["keys"]).split(",");
  List values = (arg["values"]).split(",");
  for (var i = 0; i < keys.length; i++) {
    expansion[keys[i]] = values[i];
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWUpdateUltraGroupMessageExpansionCallback(
        onUltraGroupMessageExpansionUpdated: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] =
          "updateUltraGroupMessageExpansion-onUltraGroupMessageExpansionUpdated";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  RCIMIWMessage? message = await _getMessageByUId(
      RCIMIWConversationType.ultraGroup, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }

  int? code =
      await IMEngineManager().engine?.updateUltraGroupMessageExpansionForWeb(
            message,
            expansion,
            callback: callback,
          );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateUltraGroupMessageExpansion";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

removeUltraGroupMessageExpansionForKeys(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  if (arg['keys'] == null) {
    RCIWToast.showToast("keys 为空");
    return;
  }
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String messageUId = arg['messageUId'];
  List<String> keys = (arg["keys"]).split(",");
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback(
        onUltraGroupMessageExpansionForKeysRemoved: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] =
          "removeUltraGroupMessageExpansionForKeys-onUltraGroupMessageExpansionForKeysRemoved";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  RCIMIWMessage? message = await _getMessageByUId(
      RCIMIWConversationType.ultraGroup, targetId, channelId, messageUId);
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }

  int? code = await IMEngineManager()
      .engine
      ?.removeUltraGroupMessageExpansionForKeysForWeb(
        message,
        keys,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "removeUltraGroupMessageExpansionForKeys";
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

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  // web 上 timestamp 参数无效，所以随便固定写一个值
  int timestamp = 0;
  IRCIMIWClearUnreadCountCallback? callback;
  if (useCallback == 1) {
    callback =
        IRCIMIWClearUnreadCountCallback(onUnreadCountCleared: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "clearUnreadCount-onUnreadCountCleared";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.clearUnreadCount(
      type, targetId, channelId, timestamp,
      callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "clearUnreadCount";
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

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  // web 端 timestamp 参数无效，所以可以随便设置一个值
  int timestamp = 0;
  IRCIMIWSyncUltraGroupReadStatusCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSyncUltraGroupReadStatusCallback(
        onUltraGroupReadStatusSynced: (int? code) {
      Map<String, String> arg = {};
      arg["listener"] = "syncUltraGroupReadStatus-onUltraGroupReadStatusSynced";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }

  int? code = await IMEngineManager().engine?.syncUltraGroupReadStatus(
      targetId, channelId, timestamp,
      callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "syncUltraGroupReadStatus";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

// 工具方法

String formatJson(jsonObject) {
  if (jsonObject == null) {
    return "";
  }
  const JsonEncoder encoder = JsonEncoder.withIndent('    ');
  return encoder.convert(jsonObject);
}

_sendMessage(RCIMIWMessage? message, {int useCallback = 0}) async {
  if (message == null) {
    RCIWToast.showToast("message 不合法");
    return;
  }

  if (message.conversationType == RCIMIWConversationType.chatroom ||
      message.conversationType == RCIMIWConversationType.system) {
    message.expansion = null;
  } else {
    message.expansion = {'flutter': 'web'};
  }
  int? code = -1;
  Map<String, String> resultCode = {};
  if (message is RCIMIWMediaMessage) {
    RCIMIWSendMediaMessageListener? listener;
    if (useCallback == 1) {
      listener = RCIMIWSendMediaMessageListener(onMediaMessageSaved: (message) {
        Map<String, String> arg = {};
        arg["listener"] = "sendMediaMessage-onMediaMessageSaved";
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      }, onMediaMessageSending: (message, progress) {
        Map<String, String> arg = {};
        arg["listener"] = "sendMediaMessage-onMediaMessageSending";
        arg["progress"] = progress.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      }, onMediaMessageSent: (code, message) {
        Map<String, String> arg = {};
        arg["listener"] = "sendMediaMessage-onMediaMessageSent";
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      }, onSendingMediaMessageCanceled: (message) {
        Map<String, String> arg = {};
        arg["listener"] = "sendMediaMessage-onSendingMediaMessageCanceled";
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      });
    }
    code = await IMEngineManager()
        .engine
        ?.sendMediaMessage(message, listener: listener);
    resultCode["listener"] = "sendMediaMessage";
  } else {
    RCIMIWSendMessageCallback? callback;
    if (useCallback == 1) {
      callback = RCIMIWSendMessageCallback(onMessageSaved: (message) {
        Map<String, String> arg = {};
        arg["listener"] = "sendMessage-onMessageSaved";
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      }, onMessageSent: (code, message) {
        Map<String, String> arg = {};
        arg["listener"] = "sendMessage-onMessageSent";
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      });
    }
    code = await IMEngineManager()
        .engine
        ?.sendMessage(message, callback: callback);
    resultCode["listener"] = "sendMessage";
  }
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future<RCIMIWMessage?> _getMessageByUId(RCIMIWConversationType conversationType,
    String targetId, String? channelId, String messageUId) async {
  Completer<RCIMIWMessage?> completer = Completer();
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  IRCIMIWGetMessagesCallback callback =
      IRCIMIWGetMessagesCallback(onSuccess: (List<RCIMIWMessage>? messages) {
    List<RCIMIWMessage?> result =
        messages?.where((e) => e.messageUId == messageUId).toList() ?? [];
    if (result.isNotEmpty) {
      completer.complete(result[0]);
    }
  }, onError: (int? code) {
    log('getMessages error:$code');
    completer.complete(null);
  });
  int code = await IMEngineManager().engine?.getMessages(
          conversationType,
          targetId,
          channelId,
          timestamp,
          RCIMIWTimeOrder.before,
          RCIMIWMessageOperationPolicy.remote,
          20,
          callback: callback) ??
      -1;
  if (code != 0) {
    log('_getMessageByUIdForWeb call error: $code');
    completer.complete(null);
  }
  return completer.future;
}

_getImagePickerFile() {
  return _getFile('__image_picker_web-file-input');
}

_getFilePickerFile() {
  return _getFile('__file_picker_web-file-input');
}

_getFile(String elementId) {
  var input = html.document.getElementById(elementId)?.querySelector('input');
  html.File? file;
  if (input is html.InputElement) {
    file = input.files?.first;
  }
  return file;
}
