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

String _generateTimeStamp() {
  DateTime now = DateTime.now();
  return "${now.hour.toString().padLeft(2, '0')}时${now.minute.toString().padLeft(2, '0')}分${now.second.toString().padLeft(2, '0')}秒";
}

Future initEngine(Map arg) async {
  if (IMEngineManager().engine == null) {
    arg['appkey'] = arg['appkey'] ?? AccountInfo.appKey;
    if (arg['appkey'] == null) {
      RCIWToast.showToast("appkey 为空");
      return;
    }

    RCIMIWEngineOptions options = RCIMIWEngineOptions.create();
    if (arg['naviServer'] == '1') {
      arg['naviServer'] = AccountInfo.naviServer1;
    }
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

    if (arg['areaCode'] != null) {
      RCIMIWAreaCode code = RCIMIWAreaCode.values[int.parse(arg['areaCode'])];
      options.areaCode = code;
    }

    RCIMIWCompressOptions compressOptions = RCIMIWCompressOptions.create();
    if (arg['originalImageQuality'] != null) {
      compressOptions.originalImageQuality = int.parse(
        arg['originalImageQuality'],
      );
    }
    if (arg['originalImageMaxSize'] != null) {
      compressOptions.originalImageMaxSize = int.parse(
        arg['originalImageMaxSize'],
      );
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
      compressOptions.sightCompressHeight = int.parse(
        arg['sightCompressHeight'],
      );
    }
    if (arg['locationThumbnailQuality'] != null) {
      compressOptions.locationThumbnailQuality = int.parse(
        arg['locationThumbnailQuality'],
      );
    }
    if (arg['locationThumbnailHeight'] != null) {
      compressOptions.locationThumbnailHeight = int.parse(
        arg['locationThumbnailHeight'],
      );
    }
    if (arg['locationThumbnailWidth'] != null) {
      compressOptions.locationThumbnailWidth = int.parse(
        arg['locationThumbnailWidth'],
      );
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
    String timeStr = _generateTimeStamp();
    Map<String, String> eventResult = {};
    eventResult["listener"] = "initEngine";
    eventResult["timestamp"] = timeStr;
    eventResult["code"] = "0";
    bus.emit("rong_im_listener", eventResult);
  } else {
    RCIWToast.showToast("引擎已存在");
    Map<String, String> eventResult = {};
    eventResult["listener"] = "initEngine";
    String timeStr = _generateTimeStamp();
    eventResult["timestamp"] = timeStr;
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
    String timeStr = _generateTimeStamp();
    eventResult["timestamp"] = timeStr;
    eventResult["code"] = "0";
    eventResult["errorMsg"] = "引擎已销毁";
    bus.emit("rong_im_listener", eventResult);
  } else {
    RCIWToast.showToast("引擎还未初始化");
    Map<String, String> eventResult = {};
    eventResult["listener"] = "destroy";
    String timeStr = _generateTimeStamp();
    eventResult["timestamp"] = timeStr;
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
    String timeStr = _generateTimeStamp();
    arg["timestamp"] = timeStr;
    arg["code"] = "0";
    bus.emit("rong_im_listener", arg);
  } else {
    RCIWToast.showToast("引擎还未初始化");
    Map<String, String> arg = {};
    arg["listener"] = "setListener";
    String timeStr = _generateTimeStamp();
    arg["timestamp"] = timeStr;
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
  RCIMIWTextMessage? textMessage = await IMEngineManager()
      .engine
      ?.createTextMessage(conversationType, targetId, channelId, text);

  if (textMessage == null) {
    RCIWToast.showToast("消息创建失败");
    return;
  }

  String categoryVivo = arg['categoryVivo'] ?? "";
  RCIMIWVIVOPushType pushTypeVIVO =
      RCIMIWVIVOPushType.values[int.parse(arg['pushTypeVIVO'] ?? "0")];
  RCIMIWAndroidPushOptions androidPushOptions = RCIMIWAndroidPushOptions.create(
    categoryVivo: categoryVivo,
    pushTypeVIVO: pushTypeVIVO,
  );
  textMessage.pushOptions = RCIMIWMessagePushOptions.create(
    disableNotification: false,
    pushContent: arg['pushContent'],
    pushData: arg['pushData'],
    androidPushOptions: androidPushOptions,
  );

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
    Map<String, dynamic> expansionMap = jsonDecode(arg['extra']);
    textMessage.expansion = expansionMap;
  }

  if (arg['canIncludeExpansion'] != null) {
    textMessage.canIncludeExpansion =
        arg['canIncludeExpansion'] == 0 ? false : true;
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
    RCIMIWFileMessage? msg = await IMEngineManager().engine?.createFileMessage(
          type,
          targetId,
          channelId,
          files[0].path,
        );
    _sendMessage(msg, useCallback);
  }
}

connect(Map arg) async {
  // 如果为 arg['token'] 1 , 使用 AccountInfo.token1
  // 如果为 arg['token'] 2 , 使用 AccountInfo.token2
  // 如果为 arg['token'] 3 , 使用 AccountInfo.token3
  if (arg['token'] == "1") {
    arg['token'] = AccountInfo.token1;
  } else if (arg['token'] == "2") {
    arg['token'] = AccountInfo.token2;
  } else if (arg['token'] == "3") {
    arg['token'] = AccountInfo.token3;
  }

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
        Map<String, String> arg = {};
        arg["listener"] = "connect-onDatabaseOpened";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
      onConnected: (int? code, String? userId) {
        Map<String, String> arg = {};
        arg["listener"] = "connect-onConnected";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["userId"] = userId ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.connect(
        token,
        timeout,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "connect";
  String timeStr = _generateTimeStamp();
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
                  RCIMIWVoiceMessage? msg =
                      await IMEngineManager().engine?.createVoiceMessage(
                            type,
                            targetId,
                            channelId,
                            path,
                            duration!,
                          );
                  _sendMessage(msg, useCallback);
                }
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
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
  List<File>? files = await RCIWMediaUlits.pickFiles(
    allowedExtensions: ["gif"],
  );
  if (files != null) {
    RCIMIWGIFMessage? msg = await IMEngineManager().engine?.createGIFMessage(
          type,
          targetId,
          channelId,
          files[0].path,
        );
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

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String name = arg['name'];
  String data = arg['data'];

  String channelId = arg['channelId'] ?? "";
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  RCIMDCommandMessage msg = RCIMDCommandMessage(type, targetId, name, data);
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

Future sendNativeCustomMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['messageIdentifier'] == null) {
    RCIWToast.showToast("messageIdentifier 为空");
    return;
  }

  if (arg["fields"] == null) {
    RCIWToast.showToast("fields 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String messageIdentifier = arg['messageIdentifier'];
  String fields = arg['fields'];

  List searchWords = (arg["searchWords"] ?? "").split(",");
  // 将 JSON 字符串解析为 Map
  Map<String, dynamic> fieldsMap = jsonDecode(fields);
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWNativeCustomMessage? msg =
      await IMEngineManager().engine?.createNativeCustomMessage(
            type,
            targetId,
            channelId,
            messageIdentifier,
            fieldsMap,
          );
  msg?.searchableWords = searchWords.cast<String>();
  _sendMessage(msg, useCallback);
}

sendNativeCustomMediaMessage(Map arg) async {
  if (arg['type'] == null) {
    RCIWToast.showToast("type 为空");
    return;
  }

  if (arg['targetId'] == null) {
    RCIWToast.showToast("targetId 为空");
    return;
  }

  if (arg['messageIdentifier'] == null) {
    RCIWToast.showToast("messageIdentifier 为空");
    return;
  }

  if (arg["fields"] == null) {
    RCIWToast.showToast("fields 为空");
    return;
  }

  RCIMIWConversationType type =
      RCIMIWConversationType.values[int.parse(arg['type'])];
  String targetId = arg['targetId'];
  String? channelId = arg['channelId'];
  String messageIdentifier = arg['messageIdentifier'];

  String fields = arg['fields'];
  List searchWords = (arg["searchWords"] ?? "").split(",");
  // 将 JSON 字符串解析为 Map
  Map<String, dynamic> fieldsMap = jsonDecode(fields);
  int useCallback = int.parse(arg['use_cb'] ?? "1");
  BuildContext context = arg['context'];
  List<File>? files = await RCIWMediaUlits.pickFiles();
  if (files != null) {
    RCIMIWNativeCustomMediaMessage? msg =
        await IMEngineManager().engine?.createNativeCustomMediaMessage(
              type,
              targetId,
              channelId,
              messageIdentifier,
              files[0].path,
              fieldsMap,
            );
    msg?.searchableWords = searchWords.cast<String>();
    _sendMessage(msg, useCallback);
  }
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

  RCIMIWCustomMessage? msg =
      await IMEngineManager().engine?.createCustomMessage(
            type,
            targetId,
            channelId,
            policy,
            messageIdentifier,
            fields,
          );
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
  }
  int? code = -1;
  Map<String, String> resultCode = {};
  if (message is RCIMIWMediaMessage) {
    RCIMIWSendMediaMessageListener? listener;
    if (useCallback == 1) {
      listener = RCIMIWSendMediaMessageListener(
        onMediaMessageSaved: (message) {
          Map<String, String> arg = {};
          arg["listener"] = "sendMediaMessage-onMediaMessageSaved";
          String timeStr = _generateTimeStamp();
          arg["timestamp"] = timeStr;
          arg["message"] = formatJson(message?.toJson());

          bus.emit("rong_im_listener", arg);
        },
        onMediaMessageSending: (message, progress) {
          Map<String, String> arg = {};
          arg["listener"] = "sendMediaMessage-onMediaMessageSending";
          String timeStr = _generateTimeStamp();
          arg["timestamp"] = timeStr;
          arg["progress"] = progress.toString();
          arg["message"] = formatJson(message?.toJson());

          bus.emit("rong_im_listener", arg);
        },
        onMediaMessageSent: (code, message) {
          Map<String, String> arg = {};
          arg["listener"] = "sendMediaMessage-onMediaMessageSent";
          String timeStr = _generateTimeStamp();
          arg["timestamp"] = timeStr;
          arg["code"] = code.toString();
          arg["message"] = formatJson(message?.toJson());

          bus.emit("rong_im_listener", arg);
        },
        onSendingMediaMessageCanceled: (message) {
          Map<String, String> arg = {};
          arg["listener"] = "sendMediaMessage-onSendingMediaMessageCanceled";
          String timeStr = _generateTimeStamp();
          arg["timestamp"] = timeStr;
          arg["message"] = formatJson(message?.toJson());

          bus.emit("rong_im_listener", arg);
        },
      );
    }
    code = await IMEngineManager().engine?.sendMediaMessage(
          message,
          listener: listener,
        );
    resultCode["listener"] = "sendMediaMessage";
  } else {
    RCIMIWSendMessageCallback? callback;
    if (useCallback == 1) {
      callback = RCIMIWSendMessageCallback(
        onMessageSaved: (message) {
          Map<String, String> arg = {};
          arg["listener"] = "sendMessage-onMessageSaved";
          String timeStr = _generateTimeStamp();
          arg["timestamp"] = timeStr;
          arg["message"] = formatJson(message?.toJson());

          bus.emit("rong_im_listener", arg);
        },
        onMessageSent: (code, message) {
          Map<String, String> arg = {};
          arg["listener"] = "sendMessage-onMessageSent";
          String timeStr = _generateTimeStamp();
          arg["timestamp"] = timeStr;
          arg["code"] = code.toString();
          arg["message"] = formatJson(message?.toJson());

          bus.emit("rong_im_listener", arg);
        },
      );
    }
    code = await IMEngineManager().engine?.sendMessage(
          message,
          callback: callback,
        );
    resultCode["listener"] = "sendMessage";
  }
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
      onCancelSendingMediaMessageCalled: (
        int? code,
        RCIMIWMediaMessage? message,
      ) {
        Map<String, String> arg = {};
        arg["listener"] =
            "cancelSendingMediaMessage-onCancelSendingMediaMessageCalled";
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  IMEngineManager().engine?.cancelSendingMediaMessage(
        message,
        callback: callback,
      );
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
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["progress"] = progress.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onDownloadingMediaMessageCanceled: (message) {
        Map<String, String> arg = {};
        arg["listener"] =
            "downloadMediaMessage-onDownloadingMediaMessageCanceled";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onMediaMessageDownloaded: (code, message) {
        Map<String, String> arg = {};
        arg["listener"] = "downloadMediaMessage-onMediaMessageDownloaded";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.downloadMediaMessage(
        message,
        listener: listener,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "downloadMediaMessage";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.cancelDownloadingMediaMessage(
        message,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "cancelDownloadingMediaMessage";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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

  RCIMIWTextMessage? textMessage = await IMEngineManager()
      .engine
      ?.createTextMessage(conversationType, targetId, channelId, "这是一条插入的消息");

  textMessage!.direction = RCIMIWMessageDirection.receive;
  textMessage!.receivedStatus = RCIMIWReceivedStatus.unread;

  IRCIMIWInsertMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWInsertMessageCallback(
      onMessageInserted: (code, message) {
        Map<String, String> arg = {};
        arg["listener"] = "insertMessage-onMessageInserted";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.insertMessage(
        textMessage!,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessage";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
    callback = IRCIMIWInsertMessagesCallback(
      onMessagesInserted: (code, messages) {
        List messagesJson = [];
        if (messages != null) {
          for (var temp in messages) {
            messagesJson.add(formatJson(temp.toJson()) + "\n");
          }
        }
        Map<String, String> arg = {};
        arg["listener"] = "insertMessages-onMessagesInserted";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["messages"] = messagesJson.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.insertMessages([
    textMessage!,
    textMessage1!,
  ], callback: callback);

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["message"] = messagesJson.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.deleteLocalMessages(
        messages,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
    callback = IRCIMIWDeleteMessagesCallback(
      onMessagesDeleted: (code, messages) {
        List messagesJson = [];
        if (messages != null) {
          for (var temp in messages) {
            messagesJson.add(formatJson(temp.toJson()) + "\n");
          }
        }
        Map<String, String> arg = {};
        arg["listener"] = "deleteMessages-onMessagesDeleted";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["message"] = messagesJson.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.deleteMessages(
        type,
        targetId,
        channelId,
        messages,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "deleteMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
    callback = IRCIMIWRecallMessageCallback(
      onMessageRecalled: (code, message) {
        Map<String, String> arg = {};
        arg["listener"] = "recallMessage-onMessageRecalled";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.recallMessage(
        message,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
      },
    );
  }
  int? code = await IMEngineManager().engine?.sendGroupReadReceiptRequest(
        message,
        callback: callback,
      );

  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
      },
    );
  }
  int? code = await IMEngineManager().engine?.sendGroupReadReceiptResponse(
        targetId,
        channelId,
        messages,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onMessageSent: (code, message) {
        Map<String, String> arg = {};
        arg["listener"] = "sendGroupMessageToDesignatedUsers-onMessageSent";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["message"] = formatJson(message?.toJson());

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.sendGroupMessageToDesignatedUsers(
        textMessage!,
        userIds,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "insertMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
  RCIMIWMessage? textMessage =
      await IMEngineManager().engine?.createTextMessage(
            RCIMIWConversationType.ultraGroup,
            message.targetId!,
            message.channelId,
            "这个是超级群修改消息的内容",
          );
  IRCIMIWModifyUltraGroupMessageCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWModifyUltraGroupMessageCallback(
      onUltraGroupMessageModified: (code) {
        Map<String, String> arg = {};
        arg["listener"] = "modifyUltraGroupMessage-onUltraGroupMessageModified";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.modifyUltraGroupMessage(
        messageUId,
        textMessage!,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "modifyUltraGroupMessage";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
    callback = IRCIMIWGetBatchRemoteUltraGroupMessagesCallback(
      onError: (code) {
        Map<String, String> arg = {};
        arg["listener"] = "getBatchRemoteUltraGroupMessages-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
      onSuccess: (matchedMessages, notMatchedMessages) {
        List matchedMessagesJson = [];
        List noMatchedMessagesJson = [];
        if (matchedMessages != null) {
          for (var temp in matchedMessages) {
            matchedMessagesJson.add(formatJson(temp.toJson()) + "\n");
          }
        }
        if (notMatchedMessages != null) {
          for (var temp in notMatchedMessages) {
            noMatchedMessagesJson.add(formatJson(temp.toJson()) + "\n");
          }
        }
        Map<String, String> arg = {};
        arg["listener"] = "getBatchRemoteUltraGroupMessages-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["matchedMessages"] = matchedMessagesJson.toString();
        arg["notMatchedMessages"] = noMatchedMessagesJson.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.getBatchRemoteUltraGroupMessages(
        messages,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "loadBatchRemoteUltraGroupMessages";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }
  int? code = await IMEngineManager().engine?.recallUltraGroupMessage(
        message,
        deleteRemote,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "recallUltraGroupMessage";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
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
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
  resultCode["message"] = formatJson(message?.toJson());
  bus.emit("rong_im_listener", resultCode);
}

Future<RCIMIWMessage?> _getMessageById(int messageId) async {
  Completer<RCIMIWMessage?> completer = Completer();
  IRCIMIWGetMessageCallback callback = IRCIMIWGetMessageCallback(
    onSuccess: (RCIMIWMessage? t) {
      completer.complete(t);
    },
    onError: (int? code) {
      log('getMessageById onError:${code ?? -1}');
      completer.complete(null);
    },
  );
  int code = await IMEngineManager().engine?.getMessageById(
            messageId,
            callback: callback,
          ) ??
      -1;
  log('getMessageById invoke error: $code');
  return completer.future;
}

Future<RCIMIWMessage?> _getMessageByUId(String messageUId) async {
  Completer<RCIMIWMessage?> completer = Completer();
  IRCIMIWGetMessageCallback callback = IRCIMIWGetMessageCallback(
    onSuccess: (RCIMIWMessage? t) {
      completer.complete(t);
    },
    onError: (int? code) {
      log('getMessageById onError:${code ?? -1}');
      completer.complete(null);
    },
  );
  int code = await IMEngineManager().engine?.getMessageByUId(
            messageUId,
            callback: callback,
          ) ??
      -1;
  log('getMessageByUId invoke error: $code');
  return completer.future;
}

Future getConnectionStatus() async {
  int? code = (await IMEngineManager().engine?.getConnectionStatus())?.index;
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getConnectionStatus";
  String timeStr = _generateTimeStamp();
  resultCode["timestamp"] = timeStr;
  resultCode["code"] = (code ?? -1).toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

Future createGroup(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String groupName = arg['groupName'] ?? "";
  String portraitUri = arg['portraitUri'] ?? "";
  String introduction = arg['introduction'] ?? "";
  String notice = arg['notice'] ?? "";
  String extProfile = arg['extProfile'] ?? "{}";
  // 将 JSON 字符串解析为 Map
  Map<String, dynamic> extProfileMap = {};
  try {
    extProfileMap = jsonDecode(extProfile);
  } catch (e) {
    RCIWToast.showToast("extProfile 解析失败，请检查格式");
    return;
  }

  RCIMIWGroupJoinPermission? joinPermission = arg['joinPermission'] != null
      ? RCIMIWGroupJoinPermission.values[int.parse(arg['joinPermission'])]
      : null;
  RCIMIWGroupOperationPermission? removeMemberPermission =
      arg['removeMemberPermission'] != null
          ? RCIMIWGroupOperationPermission.values[int.parse(
              arg['removeMemberPermission'],
            )]
          : null;
  RCIMIWGroupOperationPermission? invitePermission =
      arg['invitePermission'] != null
          ? RCIMIWGroupOperationPermission.values[int.parse(
              arg['invitePermission'],
            )]
          : null;
  RCIMIWGroupInviteHandlePermission? inviteHandlePermission =
      arg['inviteHandlePermission'] != null
          ? RCIMIWGroupInviteHandlePermission.values[int.parse(
              arg['inviteHandlePermission'],
            )]
          : null;
  RCIMIWGroupOperationPermission? groupInfoEditPermission =
      arg['groupInfoEditPermission'] != null
          ? RCIMIWGroupOperationPermission.values[int.parse(
              arg['groupInfoEditPermission'],
            )]
          : null;
  RCIMIWGroupMemberInfoEditPermission? memberInfoEditPermission =
      arg['memberInfoEditPermission'] != null
          ? RCIMIWGroupMemberInfoEditPermission.values[int.parse(
              arg['memberInfoEditPermission'],
            )]
          : null;

  RCIMIWGroupInfo groupInfo = RCIMIWGroupInfo.create(
    groupId: groupId,
    groupName: groupName,
    portraitUri: portraitUri,
    introduction: introduction,
    notice: notice,
    extProfile: extProfileMap,
    joinPermission: joinPermission,
    removeMemberPermission: removeMemberPermission,
    invitePermission: invitePermission,
    inviteHandlePermission: inviteHandlePermission,
    groupInfoEditPermission: groupInfoEditPermission,
    memberInfoEditPermission: memberInfoEditPermission,
  );

  List<String> inviteeUserIds;
  if (arg["inviteeUserIds"] != null) {
    inviteeUserIds = (arg["inviteeUserIds"]).split(",");
  } else {
    inviteeUserIds = [];
  }
  IRCIMIWCreateGroupCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWCreateGroupCallback(
      onSuccess: (int? processCode) {
        Map<String, String> arg = {};
        arg["listener"] = "createGroup-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["processCode"] = processCode.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? errorCode, String? errorInfo) {
        Map<String, String> arg = {};
        arg["listener"] = "createGroup-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["errorCode"] = errorCode.toString();
        arg["errorInfo"] = errorInfo ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.createGroup(
        groupInfo,
        inviteeUserIds,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "createGroup";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

Future updateGroupInfo(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String groupName = arg['groupName'] ?? "";
  String portraitUri = arg['portraitUri'] ?? "";
  String introduction = arg['introduction'] ?? "";
  String notice = arg['notice'] ?? "";
  String extProfile = arg['extProfile'] ?? "{}";
  // 将 JSON 字符串解析为 Map
  Map<String, dynamic> extProfileMap = {};
  try {
    extProfileMap = jsonDecode(extProfile);
  } catch (e) {
    RCIWToast.showToast("extProfile 解析失败，请检查格式");
    return;
  }

  RCIMIWGroupJoinPermission? joinPermission = arg['joinPermission'] != null
      ? RCIMIWGroupJoinPermission.values[int.parse(arg['joinPermission'])]
      : null;
  RCIMIWGroupOperationPermission? removeMemberPermission =
      arg['removeMemberPermission'] != null
          ? RCIMIWGroupOperationPermission.values[int.parse(
              arg['removeMemberPermission'],
            )]
          : null;
  RCIMIWGroupOperationPermission? invitePermission =
      arg['invitePermission'] != null
          ? RCIMIWGroupOperationPermission.values[int.parse(
              arg['invitePermission'],
            )]
          : null;
  RCIMIWGroupInviteHandlePermission? inviteHandlePermission =
      arg['inviteHandlePermission'] != null
          ? RCIMIWGroupInviteHandlePermission.values[int.parse(
              arg['inviteHandlePermission'],
            )]
          : null;
  RCIMIWGroupOperationPermission? groupInfoEditPermission =
      arg['groupInfoEditPermission'] != null
          ? RCIMIWGroupOperationPermission.values[int.parse(
              arg['groupInfoEditPermission'],
            )]
          : null;
  RCIMIWGroupMemberInfoEditPermission? memberInfoEditPermission =
      arg['memberInfoEditPermission'] != null
          ? RCIMIWGroupMemberInfoEditPermission.values[int.parse(
              arg['memberInfoEditPermission'],
            )]
          : null;

  RCIMIWGroupInfo groupInfo = RCIMIWGroupInfo.create(
    groupId: groupId,
    groupName: groupName,
    portraitUri: portraitUri,
    introduction: introduction,
    notice: notice,
    extProfile: extProfileMap,
    joinPermission: joinPermission,
    removeMemberPermission: removeMemberPermission,
    invitePermission: invitePermission,
    inviteHandlePermission: inviteHandlePermission,
    groupInfoEditPermission: groupInfoEditPermission,
    memberInfoEditPermission: memberInfoEditPermission,
  );
  IRCIMIWGroupInfoUpdatedCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGroupInfoUpdatedCallback(
      onGroupInfoUpdated: (int? code, String? errorInfo) {
        Map<String, String> arg = {};
        arg["listener"] = "updateGroupInfo-onGroupInfoUpdated";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();
        arg["errorInfo"] = errorInfo ?? "";

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.updateGroupInfo(
        groupInfo,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "updateGroupInfo";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

Future kickGroupMembers(Map arg) async {
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

  bool removeMuteStatus = (arg['removeMuteStatus'] ?? 1) == 1;
  bool removeWhiteList = (arg['removeWhiteList'] ?? 1) == 1;
  bool removeFollow = (arg['removeFollow'] ?? 1) == 1;

  RCIMIWQuitGroupConfig config = RCIMIWQuitGroupConfig.create(
    removeMuteStatus: removeMuteStatus,
    removeWhiteList: removeWhiteList,
    removeFollow: removeFollow,
  );
  IRCIMIWKickGroupMembersCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWKickGroupMembersCallback(
      onCompleted: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "kickGroupMembers-onCompleted";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.kickGroupMembers(
        groupId,
        userIds,
        config,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "kickGroupMembers";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

quitGroup(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  bool removeMuteStatus = (arg['removeMuteStatus'] ?? 1) == 1;
  bool removeWhiteList = (arg['removeWhiteList'] ?? 1) == 1;
  bool removeFollow = (arg['removeFollow'] ?? 1) == 1;

  RCIMIWQuitGroupConfig config = RCIMIWQuitGroupConfig.create(
    removeMuteStatus: removeMuteStatus,
    removeWhiteList: removeWhiteList,
    removeFollow: removeFollow,
  );
  IRCIMIWQuitGroupCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWQuitGroupCallback(
      onCompleted: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "quitGroup-onCompleted";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.quitGroup(
        groupId,
        config,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "quitGroup";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

transferGroupOwner(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['newOwnerId'] == null) {
    RCIWToast.showToast("newOwnerId 为空");
    return;
  }

  if (arg['quitGroup'] == null) {
    RCIWToast.showToast("quitGroup 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String newOwnerId = arg['newOwnerId'];
  int quitGroupInt = int.parse(arg['quitGroup']);
  bool quitGroup = quitGroupInt == 0 ? false : true;
  bool removeMuteStatus = (arg['removeMuteStatus'] ?? 1) == 1;
  bool removeWhiteList = (arg['removeWhiteList'] ?? 1) == 1;
  bool removeFollow = (arg['removeFollow'] ?? 1) == 1;

  RCIMIWQuitGroupConfig config = RCIMIWQuitGroupConfig.create(
    removeMuteStatus: removeMuteStatus,
    removeWhiteList: removeWhiteList,
    removeFollow: removeFollow,
  );
  IRCIMIWTransferGroupOwnerCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWTransferGroupOwnerCallback(
      onCompleted: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "transferGroupOwner-onCompleted";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.transferGroupOwner(
        groupId,
        newOwnerId,
        quitGroup,
        config,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "transferGroupOwner";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

getGroupMembersByRole(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['role'] == null) {
    RCIWToast.showToast("role 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  RCIMIWGroupMemberRole role =
      RCIMIWGroupMemberRole.values[int.parse(arg['role'])];

  String pageToken = arg['pageToken'] ?? "";
  int count = int.parse(arg['count'] ?? "10");
  bool order = (arg['order'] ?? 0) == 1;
  RCIMIWPagingQueryOption option = RCIMIWPagingQueryOption.create(
    pageToken: pageToken,
    count: count,
    order: order,
  );

  IRCIMIWGetGroupMembersByRoleCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetGroupMembersByRoleCallback(
      onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) {
        Map<String, String> arg = {};
        arg["listener"] = "getGroupMembersByRole-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["t"] = formatJson(t?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "getGroupMembersByRole-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getGroupMembersByRole(
        groupId,
        role,
        option,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getGroupMembersByRole";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

getJoinedGroupsByRole(Map arg) async {
  if (arg['role'] == null) {
    RCIWToast.showToast("role 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  RCIMIWGroupMemberRole role =
      RCIMIWGroupMemberRole.values[int.parse(arg['role'])];

  String pageToken = arg['pageToken'] ?? "";
  int count = int.parse(arg['count'] ?? "10");
  bool order = (arg['order'] ?? 0) == 1;
  RCIMIWPagingQueryOption option = RCIMIWPagingQueryOption.create(
    pageToken: pageToken,
    count: count,
    order: order,
  );

  IRCIMIWGetJoinedGroupsByRoleCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetJoinedGroupsByRoleCallback(
      onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) {
        Map<String, String> arg = {};
        arg["listener"] = "getJoinedGroupsByRole-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["t"] = formatJson(t?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "getJoinedGroupsByRole-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getJoinedGroupsByRole(
        role,
        option,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getJoinedGroupsByRole";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

searchJoinedGroups(Map arg) async {
  if (arg['groupName'] == null) {
    RCIWToast.showToast("groupName 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupName = arg['groupName'];

  String pageToken = arg['pageToken'] ?? "";
  int count = int.parse(arg['count'] ?? "10");
  bool order = (arg['order'] ?? 0) == 1;
  RCIMIWPagingQueryOption option = RCIMIWPagingQueryOption.create(
    pageToken: pageToken,
    count: count,
    order: order,
  );

  IRCIMIWSearchJoinedGroupsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchJoinedGroupsCallback(
      onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t) {
        Map<String, String> arg = {};
        arg["listener"] = "searchJoinedGroups-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["t"] = formatJson(t?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "searchJoinedGroups-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchJoinedGroups(
        groupName,
        option,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchJoinedGroups";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

searchGroupMembers(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['name'] == null) {
    RCIWToast.showToast("name 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String name = arg['name'];

  String pageToken = arg['pageToken'] ?? "";
  int count = int.parse(arg['count'] ?? "10");
  bool order = (arg['order'] ?? 0) == 1;
  RCIMIWPagingQueryOption option = RCIMIWPagingQueryOption.create(
    pageToken: pageToken,
    count: count,
    order: order,
  );

  IRCIMIWSearchGroupMembersCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSearchGroupMembersCallback(
      onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t) {
        Map<String, String> arg = {};
        arg["listener"] = "searchGroupMembers-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["t"] = formatJson(t?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "searchGroupMembers-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.searchGroupMembers(
        groupId,
        name,
        option,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "searchGroupMembers";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

getGroupApplications(Map arg) async {
  if (arg['directions'] == null) {
    RCIWToast.showToast("directions 为空");
    return;
  }

  if (arg['status'] == null) {
    RCIWToast.showToast("status 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String pageToken = arg['pageToken'] ?? "";
  int count = int.parse(arg['count'] ?? "10");
  bool order = (arg['order'] ?? 0) == 1;
  RCIMIWPagingQueryOption option = RCIMIWPagingQueryOption.create(
    pageToken: pageToken,
    count: count,
    order: order,
  );

  List directions = (arg["directions"]).split(",");
  List<RCIMIWGroupApplicationDirection> directionsInt = [];
  for (var element in directions) {
    directionsInt.add(
      RCIMIWGroupApplicationDirection.values[int.parse(element)],
    );
  }

  List status = (arg["status"]).split(",");
  List<RCIMIWGroupApplicationStatus> statusInt = [];
  for (var element in status) {
    statusInt.add(RCIMIWGroupApplicationStatus.values[int.parse(element)]);
  }
  IRCIMIWGetGroupApplicationsCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWGetGroupApplicationsCallback(
      onSuccess: (RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo>? t) {
        Map<String, String> arg = {};
        arg["listener"] = "getGroupApplications-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["t"] = formatJson(t?.toJson());

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "getGroupApplications-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.getGroupApplications(
        option,
        directionsInt,
        statusInt,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "getGroupApplications";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

acceptGroupApplication(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['applicantId'] == null) {
    RCIWToast.showToast("applicantId 为空");
    return;
  }
  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String inviterId = arg['inviterId'] ?? "";
  String applicantId = arg['applicantId'];
  IRCIMIWAcceptGroupApplicationCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWAcceptGroupApplicationCallback(
      onSuccess: (int? t) {
        Map<String, String> arg = {};
        arg["listener"] = "acceptGroupApplication-onSuccess";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["t"] = t.toString();

        bus.emit("rong_im_listener", arg);
      },
      onError: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "acceptGroupApplication-onError";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.acceptGroupApplication(
        groupId,
        inviterId,
        applicantId,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "acceptGroupApplication";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}

setGroupMemberInfo(Map arg) async {
  if (arg['groupId'] == null) {
    RCIWToast.showToast("groupId 为空");
    return;
  }

  if (arg['userId'] == null) {
    RCIWToast.showToast("userId 为空");
    return;
  }

  int useCallback = int.parse(arg['use_cb'] ?? "1");

  String groupId = arg['groupId'];
  String userId = arg['userId'];
  String nickname = arg['nickname'] ?? "";
  String extra = arg['extra'] ?? "";
  IRCIMIWSetGroupMemberInfoCallback? callback;
  if (useCallback == 1) {
    callback = IRCIMIWSetGroupMemberInfoCallback(
      onCompleted: (int? code) {
        Map<String, String> arg = {};
        arg["listener"] = "setGroupMemberInfo-onCompleted";
        String timeStr = _generateTimeStamp();
        arg["timestamp"] = timeStr;
        arg["code"] = code.toString();

        bus.emit("rong_im_listener", arg);
      },
    );
  }

  int? code = await IMEngineManager().engine?.setGroupMemberInfo(
        groupId,
        userId,
        nickname,
        extra,
        callback: callback,
      );
  Map<String, String> resultCode = {};
  resultCode["listener"] = "setGroupMemberInfo";
  resultCode["code"] = (code ?? -1).toString();

  if (arg['context'] != null) {
    arg.remove('context');
  }
  resultCode['arg'] = arg.toString();

  if (IMEngineManager().engine == null) {
    resultCode["errorMsg"] = "引擎未初始化";
  }
  bus.emit("rong_im_listener", resultCode);
}
