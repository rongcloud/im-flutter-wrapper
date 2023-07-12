import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rongcloud_im_wrapper_plugin_example/app_data.dart';
import 'package:rongcloud_im_wrapper_plugin_example/custom_message/command_message.dart';
import 'package:rongcloud_im_wrapper_plugin_example/custom_message/poke_message.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/Toast.dart';
import 'package:flutter/material.dart';
import 'package:rongcloud_im_wrapper_plugin_example/media/rong_media.dart';

import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin_example/auto/im_engine.dart';
import 'package:rongcloud_im_wrapper_plugin_example/toast/record_view.dart';

Future initEngine(Map arg) async {
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
    if (arg['enablePush'] != null) {
      bool enablePush = arg['enablePush'] == 0 ? false : true;
      options.enablePush = enablePush;
    }
    if (arg['enableIPC'] != null) {
      bool enableIPC = arg['enableIPC'] == 0 ? false : true;
      options.enableIPC = enableIPC;
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
    e.registerCustomMessage('ST:PokeMsg', (json) {
      RCIMDPokeMessage pokeMsg = RCIMDPokeMessage.fromJson(json);
      // 此处 'content' 不可修改
      pokeMsg.decode(json['content']);
      return pokeMsg;
    });
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

/*
//fun_destroy_call
await engine?.destroy();
//fun_destroy_call
 */
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

Future sendTextMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['text'] == null) {
    RCIWToast.showToast("text 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWConversationType conversationType =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  String text = arg['text'];
  RCIMIWTextMessage? textMessage =
      await IMEngineManager().engine?.createTextMessage(
            conversationType,
            targetId,
            channelId,
            text,
          );

  if (textMessage == null) {
    RCIWToast.showToast("消息创建失败");
    return;
  }

  String categoryVivo = arg['categoryVivo'] ?? "";
  RCIMIWVIVOPushType pushTypeVIVO = RCIMIWVIVOPushType.values[int.parse(arg['pushTypeVIVO'] ?? "0")];
  RCIMIWAndroidPushOptions androidPushOptions = RCIMIWAndroidPushOptions.create(categoryVivo: categoryVivo, pushTypeVIVO: pushTypeVIVO);
  textMessage.pushOptions = RCIMIWMessagePushOptions.create(disableNotification: false, pushContent: arg['pushContent'], pushData: arg['pushData'], androidPushOptions: androidPushOptions);

  if (arg['Mentioned'] != null) {
    RCIMIWMentionedType mentionedType =
        RCIMIWMentionedType.values[int.parse(arg['Mentioned'])];

    List<String>? users;
    if (arg["MentionedUser"] != null) {
      users = arg["MentionedUser"].split(",");
    }
    textMessage.mentionedInfo = RCIMIWMentionedInfo.create(
      type: mentionedType,
      userIdList: users,
      mentionedContent: arg['MentionedText'],
    );
  }

  if (arg['extra'] != null) {
    textMessage.extra = arg['extra'];
  }

  RCIMIWUserInfo? userInfo;

  if (arg['userId'] != null) {
    userInfo = RCIMIWUserInfo.create();
    userInfo.userId = arg['userId'];
  }

  if (arg['name'] != null && userInfo != null) {
    userInfo.name = arg['name'];
  }

  if (arg['portrait'] != null && userInfo != null) {
    userInfo.portrait = arg['portrait'];
  }

  if (arg['alias'] != null && userInfo != null) {
    userInfo.alias = arg['alias'];
  }

  if (arg['userinfo_extra'] != null && userInfo != null) {
    userInfo.extra = arg['userinfo_extra'];
  }

  textMessage.userInfo = userInfo;
  _sendMessage(textMessage, useCallback);
}

Future sendImageMessage(Map arg) async {
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
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  bool original =
      arg['original'] == null ? false : int.parse(arg['original']) == 1;

  BuildContext context = arg['context'];
  RCIWMediaUlits.showImagePicker(context, (XFile? file) async {
    if (file != null) {
      Uint8List fileBytes = await file.readAsBytes();
      String base64 = base64Encode(fileBytes);
    }

    RCIMIWImageMessage? message = await IMEngineManager()
        .engine
        ?.createImageMessage(type, targetId, channelId, file?.path ?? '');
    message?.original = original;
    _sendMessage(message, useCallback);
  });
}

Future sendFileMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  List<File>? files = await RCIWMediaUlits.pickFiles();
  if (files != null) {
    RCIMIWFileMessage? msg = await IMEngineManager()
        .engine
        ?.createFileMessage(type, targetId, channelId, files[0].path);
    _sendMessage(msg, useCallback);
  }
}

Future sendSightMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  BuildContext context = arg['context'];
  RCIWMediaUlits.showVideoPicker(context, (path) async {
    RCIMIWSightMessage? sightMsg = await IMEngineManager()
        .engine
        ?.createSightMessage(type, targetId, channelId, "file://" + path, 10);
    _sendMessage(sightMsg, useCallback);
  });
}

Future sendVoiceMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  BuildContext context = arg['context'];
  var status = await Permission.microphone.request();
  if (status.isGranted) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: RecordView(
            onPressed: () {
              RCIWMediaUlits.startRecordAudio();
            },
            onCanceled: () {
              Navigator.of(context).pop();
              RCIWMediaUlits.stopRecordAudio((path, duration) async {});
              RCIWToast.showToast("录音被取消");
            },
            onFinished: () {
              RCIWMediaUlits.stopRecordAudio((path, duration) async {
                if (path != null && (duration ?? 0) > 0) {
                  RCIMIWVoiceMessage? msg = await IMEngineManager()
                      .engine
                      ?.createVoiceMessage(
                          type, targetId, channelId, path, duration!);
                  _sendMessage(msg, useCallback);
                }
              });
              Navigator.of(context).pop();
            },
          ));
        });
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

Future sendReferenceMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['text'] == null) {
    RCIWToast.showToast("text 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];

  String channelId = arg['channelId'] ?? "";
  String messageId = arg['messageId'];
  String text = arg['text'];

  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }

  RCIMIWReferenceMessage? referenceMsg = await IMEngineManager()
      .engine
      ?.createReferenceMessage(type, targetId, channelId, message, text);
  _sendMessage(referenceMsg, useCallback);
}

Future sendGIFMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  List<File>? files =
      await RCIWMediaUlits.pickFiles(allowedExtensions: ["gif"]);
  if (files != null) {
    RCIMIWGIFMessage? msg = await IMEngineManager()
        .engine
        ?.createGIFMessage(type, targetId, channelId, files[0].path);
    _sendMessage(msg, useCallback);
  }
}

Future sendCommandMessage(Map arg) async {
if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['name'] == null) {
    RCIWToast.showToast("name 为空");
    return;
  }
  if (arg['data'] == null) {
    RCIWToast.showToast("data 为空");
    return;
  }

  RCIMIWConversationType type = RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String name = arg['name'];
  String data = arg['data'];


  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMDCommandMessage msg = RCIMDCommandMessage(type, targetId, "name", "data");
  _sendMessage(msg, useCallback);
}

Future sendLocationMessage(Map arg) async {
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
    RCIMIWLocationMessage? message =
        await IMEngineManager().engine?.createLocationMessage(
              type,
              targetId,
              channelId,
              double.parse(longitude),
              double.parse(latitude),
              poiName,
              file?.path ?? '',
            );
    _sendMessage(message, useCallback);
  });
}

Future sendUserCustomMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  String content = arg['content'] ?? "来自跨平台的祝福~";

  RCIMDPokeMessage msg = RCIMDPokeMessage(type, targetId, content);
  _sendMessage(msg, useCallback);
}

Future sendCustomMessage(Map arg) async {
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
  String channelId = arg['channelId'] ?? "";
  RCIMIWCustomMessagePolicy policy =
      RCIMIWCustomMessagePolicy.values[int.parse(arg['policy'])];
  String messageIdentifier = arg['messageIdentifier'] ?? "";
  List keys = (arg["keys"] ?? "").split(",");
  List values = (arg["values"] ?? "").split(",");
  Map fields = {};
  for (var i = 0; i < keys.length; i++) {
    fields[keys[i]] = values[i];
  }

  RCIMIWCustomMessage? msg = await IMEngineManager()
      .engine
      ?.createCustomMessage(
          type, targetId, channelId, policy, messageIdentifier, fields);
  _sendMessage(msg, useCallback);
}

_sendMessage(RCIMIWMessage? message, int useCallback) async {
  if (message == null) {
    RCIWToast.showToast("message 不合法");
    return;
  }

  if (message.conversationType == RCIMIWConversationType.chatroom ||
      message.conversationType == RCIMIWConversationType.system) {
    message.expansion = null;
  } else {
    message.expansion = {};
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

Future cancelSendingMediaMessage(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }
  String messageId = arg['messageId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  if (message is! RCIMIWMediaMessage) {
    RCIWToast.showToast("当前消息不是媒体消息");
    return;
  }
  IRCIMIWCancelSendingMediaMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWCancelSendingMediaMessageCallback(
        onCancelSendingMediaMessageCalled:
            (int? code, RCIMIWMediaMessage? message) {
      Map<String, String> arg = {};
      arg["listener"] =
          "cancelSendingMediaMessage-onCancelSendingMediaMessageCalled";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    });
  }
  IMEngineManager()
      .engine
      ?.cancelSendingMediaMessage(message, callback: callback);
}

Future downloadMediaMessage(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }
  String messageId = arg['messageId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  if (message is! RCIMIWMediaMessage) {
    RCIWToast.showToast("当前消息不是媒体消息");
    return;
  }
  RCIMIWDownloadMediaMessageListener? listener;
  if (useCallback == 1) {
    listener = RCIMIWDownloadMediaMessageListener(
        onMediaMessageDownloading: (message, progress) {
      Map<String, String> arg = {};
      arg["listener"] = "downloadMediaMessage-onMediaMessageDownloading";
      arg["progress"] = progress.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    }, onDownloadingMediaMessageCanceled: (message) {
      Map<String, String> arg = {};
      arg["listener"] =
          "downloadMediaMessage-onDownloadingMediaMessageCanceled";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    }, onMediaMessageDownloaded: (code, message) {
      Map<String, String> arg = {};
      arg["listener"] = "downloadMediaMessage-onMediaMessageDownloaded";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager()
      .engine
      ?.downloadMediaMessage(message, listener: listener);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "downloadMediaMessage";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future cancelDownloadingMediaMessage(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }
  String messageId = arg['messageId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  if (message is! RCIMIWMediaMessage) {
    RCIWToast.showToast("当前消息不是媒体消息");
    return;
  }
  IRCIMIWCancelDownloadingMediaMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWCancelDownloadingMediaMessageCallback(
        onCancelDownloadingMediaMessageCalled: (code, message) {
      Map<String, String> arg = {};
      arg["listener"] =
          "cancelDownloadingMediaMessage-onCancelDownloadingMediaMessageCalled";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager()
      .engine
      ?.cancelDownloadingMediaMessage(message, callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "cancelDownloadingMediaMessage";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future insertMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWConversationType conversationType =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";

  RCIMIWTextMessage? textMessage =
      await IMEngineManager().engine?.createTextMessage(
            conversationType,
            targetId,
            channelId,
            "这是一条插入的消息",
          );

  textMessage!.direction = RCIMIWMessageDirection.receive;
  textMessage!.receivedStatus = RCIMIWReceivedStatus.unread;

  IRCIMIWInsertMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWInsertMessageCallback(onMessageInserted: (code, message) {
      Map<String, String> arg = {};
      arg["listener"] = "insertMessage-onMessageInserted";
      arg["code"] = code.toString();
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager()
      .engine
      ?.insertMessage(textMessage!, callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessage";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future insertMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWConversationType conversationType =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";

  RCIMIWTextMessage? textMessage =
      await IMEngineManager().engine?.createTextMessage(
            conversationType,
            targetId,
            channelId,
            "这是一条插入的消息-01",
          );
  RCIMIWTextMessage? textMessage1 =
      await IMEngineManager().engine?.createTextMessage(
            conversationType,
            targetId,
            channelId,
            "这是一条插入的消息-02",
          );

  IRCIMIWInsertMessagesCallback? callback;
  if (useCallback == 1) {
    callback =
        IRCIMIWInsertMessagesCallback(onMessagesInserted: (code, messages) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }
      Map<String, String> arg = {};
      arg["listener"] = "insertMessages-onMessagesInserted";
      arg["code"] = code.toString();
      arg["messages"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager()
      .engine
      ?.insertMessages([textMessage!, textMessage1!], callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future deleteLocalMessages(Map arg) async {
  if (arg['messageIds'] == null) {
    RCIWToast.showToast("messageIds 为空");
    return;
  }
  List messageIds = (arg["messageIds"]).split(",");
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  List<RCIMIWMessage> messages = [];
  for (var messageId in messageIds) {
    RCIMIWMessage? msg = await _getMessageById(int.parse(messageId));
    if (msg != null) {
      messages.add(msg);
    } else {
      RCIWToast.showToast("未查询到消息 messageId:" + messageId);
    }
  }

  IRCIMIWDeleteLocalMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWDeleteLocalMessagesCallback(
        onLocalMessagesDeleted: (code, messages) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }
      Map<String, String> arg = {};
      arg["listener"] = "deleteLocalMessages-onLocalMessagesDeleted";
      arg["code"] = code.toString();
      arg["message"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager()
      .engine
      ?.deleteLocalMessages(messages, callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future deleteMessages(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageIds'] == null) {
    RCIWToast.showToast("messageIds 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  List messageIds = (arg["messageIds"]).split(",");
  List<RCIMIWMessage> messages = [];
  for (var messageId in messageIds) {
    RCIMIWMessage? msg = await _getMessageById(int.parse(messageId));
    if (msg != null) {
      messages.add(msg);
    } else {
      RCIWToast.showToast("未查询到消息 messageId:" + messageId);
    }
  }
  IRCIMIWDeleteMessagesCallback? callback;
  if (useCallback == 1) {
    callback =
        IRCIMIWDeleteMessagesCallback(onMessagesDeleted: (code, messages) {
      List messagesJson = [];
      if (messages != null) {
        for (var temp in messages) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }
      Map<String, String> arg = {};
      arg["listener"] = "deleteMessages-onMessagesDeleted";
      arg["code"] = code.toString();
      arg["message"] = messagesJson.toString();

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

Future recallMessage(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }
  String messageId = arg['messageId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  IRCIMIWRecallMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRecallMessageCallback(onMessageRecalled: (code, message) {
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
  resultCode["listener"] = "insertMessages";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future sendGroupReadReceiptRequest(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }
  String messageId = arg['messageId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  IRCIMIWSendGroupReadReceiptRequestCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSendGroupReadReceiptRequestCallback(
        onGroupReadReceiptRequestSent: (code, message) {
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
  resultCode["listener"] = "insertMessages";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future sendGroupReadReceiptResponse(Map arg) async {
  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }
  if (arg['messageIds'] == null) {
    RCIWToast.showToast("messageIds 为空");
    return;
  }

  String targetId = arg['targetId'];
  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  List messageIds = (arg["messageIds"]).split(",");
  List<RCIMIWMessage> messages = [];
  for (var messageId in messageIds) {
    RCIMIWMessage? msg = await _getMessageById(int.parse(messageId));
    if (msg != null) {
      messages.add(msg);
    } else {
      RCIWToast.showToast("未查询到消息 messageId:" + messageId);
    }
  }
  IRCIMIWSendGroupReadReceiptResponseCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSendGroupReadReceiptResponseCallback(
        onGroupReadReceiptResponseSent: (code, message) {
      List messagesJson = [];
      if (message != null) {
        for (var temp in message) {
          messagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }
      Map<String, String> arg = {};
      arg["listener"] =
          "sendGroupReadReceiptResponse-onGroupReadReceiptResponseSent";
      arg["code"] = code.toString();
      arg["message"] = messagesJson.toString();

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager().engine?.sendGroupReadReceiptResponse(
      targetId, channelId, messages,
      callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  resultCode["code"] = (code ?? -1).toString();
  bus.emit("rong_im_listener", resultCode);
}

Future sendGroupMessageToDesignatedUsers(Map arg) async {
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
        onMessageSaved: (message) {
      Map<String, String> arg = {};
      arg["listener"] = "sendGroupMessageToDesignatedUsers-onMessageSaved";
      arg["message"] = formatJson(message?.toJson());

      bus.emit("rong_im_listener", arg);
    }, onMessageSent: (code, message) {
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

Future modifyUltraGroupMessage(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  String messageUId = arg['messageUId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWMessage? message = await _getMessageByUId(messageUId);
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
      ?.createTextMessage(RCIMIWConversationType.ultraGroup, message.targetId!,
          message.channelId, "这个是超级群修改消息的内容");
  IRCIMIWModifyUltraGroupMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWModifyUltraGroupMessageCallback(
        onUltraGroupMessageModified: (code) {
      Map<String, String> arg = {};
      arg["listener"] = "modifyUltraGroupMessage-onUltraGroupMessageModified";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager()
      .engine
      ?.modifyUltraGroupMessage(messageUId, textMessage!, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "modifyUltraGroupMessage";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

Future loadBatchRemoteUltraGroupMessages(Map arg) async {
  if (arg['messageIds'] == null) {
    RCIWToast.showToast("messageIds 为空");
    return;
  }
  List messageIds = (arg["messageIds"] ?? "").split(",");
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  List<RCIMIWMessage> messages = [];
  for (var element in messageIds) {
    RCIMIWMessage? message = await _getMessageById(int.parse(element));
    if (message == null) {
      RCIWToast.showToast(element + " 不存在");
      break;
    }
    messages.add(message);
  }
  IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetBatchRemoteUltraGroupMessagesCallback(onError: (code) {
      Map<String, String> arg = {};
      arg["listener"] = "getBatchRemoteUltraGroupMessages-onError";
      arg["code"] = code.toString();

      bus.emit("rong_im_listener", arg);
    }, onSuccess: (matchedMessages, notMatchedMessages) {
      List matchedMessagesJson = [];
      List noMatchedMessagesJson = [];
      if (matchedMessages != null) {
        for (var temp in matchedMessages) {
          matchedMessagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }
      if (notMatchedMessages != null) {
        for (var temp in notMatchedMessages) {
          matchedMessagesJson.add(formatJson(temp.toJson()) + "\n");
        }
      }
      Map<String, String> arg = {};
      arg["listener"] = "getBatchRemoteUltraGroupMessages-onSuccess";
      arg["matchedMessages"] = matchedMessages.toString();
      arg["notMatchedMessages"] = noMatchedMessagesJson.toString();

      bus.emit("rong_im_listener", arg);
    });
  }
  int? code = await IMEngineManager()
      .engine
      ?.getBatchRemoteUltraGroupMessages(messages, callback: callback);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBatchRemoteUltraGroupMessages";
  resultCode["code"] = (code ?? -1).toString();
  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

Future recallUltraGroupMessage(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  if (arg['deleteRemote'] == null) {
    RCIWToast.showToast("deleteRemote 为空");
    return;
  }

  String messageId = arg['messageId'];
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  if (message == null) {
    RCIWToast.showToast("未查询到引用的message");
    return;
  }
  int deleteRemoteInt = int.parse(arg['deleteRemote']);
  bool deleteRemote = deleteRemoteInt == 0 ? false : true;
  IRCIMIWRecallUltraGroupMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWRecallUltraGroupMessageCallback(
        onUltraGroupMessageRecalled: (code) {
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

String formatJson(jsonObject) {
  if (jsonObject == null) {
    return "";
  }
  const JsonEncoder encoder = JsonEncoder.withIndent('    ');
  return encoder.convert(jsonObject);
}

Future getMessageById(Map arg) async {
  if (arg['messageId'] == null) {
    RCIWToast.showToast("messageId 为空");
    return;
  }

  String messageId = arg['messageId'];
  RCIMIWMessage? message = await _getMessageById(int.parse(messageId));
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMessageById";
  resultCode["message"] = formatJson(message?.toJson());
  bus.emit("rong_im_listener", resultCode);
}

Future getMessageByUId(Map arg) async {
  if (arg['messageUId'] == null) {
    RCIWToast.showToast("messageUId 为空");
    return;
  }

  String messageUId = arg['messageUId'];
  RCIMIWMessage? message = await _getMessageByUId(messageUId);
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getMessageByUId";
  resultCode["message"] = formatJson(message?.toJson());
  bus.emit("rong_im_listener", resultCode);
}

Future<RCIMIWMessage?> _getMessageById(int messageId) async {
  Completer<RCIMIWMessage?> completer = Completer();
  IRCIMIWGetMessageCallback callback =
      IRCIMIWGetMessageCallback(onSuccess: (RCIMIWMessage? t) {
    completer.complete(t);
  }, onError: (int? code) {
    log('getMessageById onError:${code ?? -1}');
    completer.complete(null);
  });
  int code = await IMEngineManager()
          .engine
          ?.getMessageById(messageId, callback: callback) ??
      -1;
  log('getMessageById invoke error: $code');
  return completer.future;
}

Future<RCIMIWMessage?> _getMessageByUId(String messageUId) async {
  Completer<RCIMIWMessage?> completer = Completer();
  IRCIMIWGetMessageCallback callback =
      IRCIMIWGetMessageCallback(onSuccess: (RCIMIWMessage? t) {
    completer.complete(t);
  }, onError: (int? code) {
    log('getMessageById onError:${code ?? -1}');
    completer.complete(null);
  });
  int code = await IMEngineManager()
          .engine
          ?.getMessageByUId(messageUId, callback: callback) ??
      -1;
  log('getMessageByUId invoke error: $code');
  return completer.future;
}
