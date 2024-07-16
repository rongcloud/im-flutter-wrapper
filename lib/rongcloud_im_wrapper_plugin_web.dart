import 'dart:developer';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;
import 'src/web/rongcloud_im_wrapper_js.dart';
import 'src/rongcloud_im_wrapper_platform_interface.dart';
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'src/web/rongcloud_im_wrapper_utils.dart';
import 'package:rongcloud_im_wrapper_plugin/src/rongcloud_im_converter.dart';

@Deprecated('当前版本不支持 Web 端，请使用其他平台')
class RCIMWrapperPluginWeb extends RCIMWrapperPlatform {
  RCIMWrapperPluginWeb();

  static void registerWith(Registrar registrar) {
    RCIMWrapperPlatform.instance = RCIMWrapperPluginWeb();
  }

  @override
  Future<void> create(String appKey, RCIMIWEngineOptions options) async {
    RCIMIWEngineWeb.create(appKey, options);
    _setListener();
  }

  @override
  Future<void> destroy() async {
    RCIMIWEngineWeb.imEngine!.destroy();
  }

  @override
  Future<int> connect(String token, int timeout,
      {RCIMIWConnectCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (userId) {
        log('userId: $userId');
        callback.onConnected(0, userId);
      }, onError: (code) {
        callback.onConnected(code, null);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.connect(token, callbackJS);
  }

  @override
  Future<int> disconnect(bool receivePush) async {
    return RCIMIWEngineWeb.imEngine!.disconnect();
  }

  @override
  Future<RCIMIWTextMessage?> createTextMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String text,
  ) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!
        .createTextMessage(type.index, targetId, channelId, text);

    return RCIMIWTextMessage.fromJson(jsToDart(jsMessage));
  }

  @override
  Future<RCIMIWVoiceMessage?> createVoiceMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path, int duration) async {
    log('createVoiceMessage() not supported on the web, please use #createVoiceMessageForWeb#');
    return null;
  }

  @override
  Future<RCIMIWImageMessage?> createImageMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path) async {
    log('createImageMessage() not supported on the web, please use #createImageMessageForWeb#');
    return null;
  }

  @override
  Future<RCIMIWFileMessage?> createFileMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path) async {
    log('createFileMessage() not supported on the web, please use #createFileMessageForWeb#');
    return null;
  }

  @override
  Future<RCIMIWSightMessage?> createSightMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path, int duration) async {
    log('createSightMessage() not supported on the web, please use #createSightMessageForWeb#');
    return null;
  }

  @override
  Future<RCIMIWGIFMessage?> createGIFMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path) async {
    log('createGIFMessage() not supported on the web, please use #createGIFMessageForWeb#');
    return null;
  }

  @override
  Future<RCIMIWLocationMessage?> createLocationMessage(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      double longitude,
      double latitude,
      String poiName,
      String? thumbnailPath) async {
    log('createLocationMessage() not supported on the web, please use #createLocationMessageForWeb#');
    return null;
  }

  @override
  Future<RCIMIWVoiceMessage> createVoiceMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      dynamic file) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!
        .createVoiceMessage(type.index, targetId, channelId, file);

    RCIMIWVoiceMessage dMessage =
        RCIMIWVoiceMessage.fromJson(jsToDart(jsMessage));
    dMessage.file = file;
    return dMessage;
  }

  @override
  Future<RCIMIWImageMessage> createImageMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      dynamic file) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!
        .createImageMessage(type.index, targetId, channelId, file);

    RCIMIWImageMessage dMessage =
        RCIMIWImageMessage.fromJson(jsToDart(jsMessage));
    dMessage.file = file;
    return dMessage;
  }

  @override
  Future<RCIMIWFileMessage> createFileMessageForWeb(RCIMIWConversationType type,
      String targetId, String? channelId, dynamic file) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!
        .createFileMessage(type.index, targetId, channelId, file);

    RCIMIWFileMessage dMessage =
        RCIMIWFileMessage.fromJson(jsToDart(jsMessage));
    dMessage.file = file;
    return dMessage;
  }

  @override
  Future<RCIMIWSightMessage> createSightMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      dynamic file) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!
        .createSightMessage(type.index, targetId, channelId, file);

    RCIMIWSightMessage dMessage =
        RCIMIWSightMessage.fromJson(jsToDart(jsMessage));
    dMessage.file = file;
    return dMessage;
  }

  @override
  Future<RCIMIWGIFMessage> createGIFMessageForWeb(RCIMIWConversationType type,
      String targetId, String? channelId, dynamic file) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!
        .createGIFMessage(type.index, targetId, channelId, file);

    RCIMIWGIFMessage dMessage = RCIMIWGIFMessage.fromJson(jsToDart(jsMessage));
    dMessage.file = file;
    return dMessage;
  }

  @override
  Future<RCIMIWReferenceMessage> createReferenceMessage(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      RCIMIWMessage referenceMessage,
      String text) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!.createReferenceMessage(
        type.index, targetId, channelId, _toJsMessage(referenceMessage), text);
    return RCIMIWReferenceMessage.fromJson(jsToDart(jsMessage));
  }

  @override
  Future<RCIMIWCustomMessage?> createCustomMessage(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      RCIMIWCustomMessagePolicy policy,
      String messageIdentifier,
      Map fields) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!.createCustomMessage(type.index,
        targetId, channelId, policy.index, messageIdentifier, toJSMap(fields));
    return RCIMIWCustomMessage.fromJson(jsToDart(jsMessage));
  }

  @override
  Future<RCIMIWLocationMessage> createLocationMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      double longitude,
      double latitude,
      String poiName,
      String thumbnailBase64) async {
    var jsMessage = RCIMIWEngineWeb.imEngine!.createLocationMessage(type.index,
        targetId, channelId, longitude, latitude, poiName, thumbnailBase64);
    RCIMIWLocationMessage dMessage =
        RCIMIWLocationMessage.fromJson(jsToDart(jsMessage));
    dMessage.thumbnailBase64 = thumbnailBase64;
    return dMessage;
  }

  @override
  Future<int> sendMessage(RCIMIWMessage message,
      {RCIMIWSendMessageCallback? callback}) async {
    var jsMessage = _toJsMessage(message);
    if (jsMessage == null) return -1;
    RCIMIWCallbackJS? jsCallback;
    if (callback != null) {
      jsCallback = RCIMIWCallbackWeb(onSuccess: (message) {
        log('sendMessage onSuccess');
        callback.onMessageSent.call(0, _messageFromJS(message));
      }, onError: (code) {
        log('sendMessage onError: $code');
        callback.onMessageSent.call(code, null);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.sendMessage(jsMessage, jsCallback);
  }

  @override
  Future<int> sendMediaMessage(RCIMIWMediaMessage message,
      {RCIMIWSendMediaMessageListener? listener}) async {
    var jsMessage = _toJsMessage(message);
    if (jsMessage == null) return -1;
    RCIMIWSendMediaMessageCallbackJS? callbackJS;
    if (listener != null) {
      callbackJS = RCIMIWSendMediaMessageCallbackWeb(
          onMediaMessageSending: (jsMessage, progress) {
            RCIMIWMediaMessage m =
                _messageFromJS(jsMessage) as RCIMIWMediaMessage;
            listener.onMediaMessageSending?.call(m, progress);
          },
          onMediaMessageSent: RCIMIWCallbackWeb(onSuccess: (jsMessage) {
            RCIMIWMediaMessage m =
                _messageFromJS(jsMessage) as RCIMIWMediaMessage;
            listener.onMediaMessageSent(0, m);
          }, onError: (code) {
            listener.onMediaMessageSent(code, null);
          })).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.sendMediaMessage(jsMessage, callbackJS);
  }

  @override
  Future<int> cancelSendingMediaMessage(RCIMIWMediaMessage message,
      {IRCIMIWCancelSendingMediaMessageCallback? callback}) async {
    log('cancelSendingMediaMessage() not supported on the web');
    return -1;
  }

  @override
  Future<int> downloadMediaMessage(RCIMIWMediaMessage message,
      {RCIMIWDownloadMediaMessageListener? listener}) async {
    log('downloadMediaMessage() not supported on the web');
    return -1;
  }

  @override
  Future<int> cancelDownloadingMediaMessage(RCIMIWMediaMessage message,
      {IRCIMIWCancelDownloadingMediaMessageCallback? callback}) async {
    log('cancelDownloadingMediaMessage() not supported on the web');
    return -1;
  }

  // -------- conversation -------- //

  @override
  Future<int> loadConversation(
      RCIMIWConversationType type, String targetId, String? channelId) {
    return getConversation(type, targetId, channelId);
  }

  @override
  Future<int> getConversation(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetConversationCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess((RCIMIWConversation.fromJson(jsToDart(data))));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadConversation(type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> loadConversations(List<RCIMIWConversationType> conversationTypes,
      String? channelId, int startTime, int count) {
    return getConversations(conversationTypes, channelId, startTime, count);
  }

  @override
  Future<int> getConversations(List<RCIMIWConversationType> conversationTypes,
      String? channelId, int startTime, int count,
      {IRCIMIWGetConversationsCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (conversations) {
        var result = jsToDart(conversations);
        if (result is List) {
          List<RCIMIWConversation> dartConversations =
              result.map((e) => RCIMIWConversation.fromJson(e)).toList();
          callback.onSuccess(dartConversations);
        }
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.loadConversations(
        _toJSConversationTypes(conversationTypes),
        channelId,
        startTime,
        count,
        callbackJS);
  }

  @override
  Future<int> removeConversation(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWRemoveConversationCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onConversationRemoved(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onConversationRemoved(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .removeConversation(type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> removeConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId,
      {IRCIMIWRemoveConversationsCallback? callback}) async {
    log('removeConversations() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadUnreadCount(
      RCIMIWConversationType type, String targetId, String? channelId) {
    return getUnreadCount(type, targetId, channelId);
  }

  @override
  Future<int> getUnreadCount(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetUnreadCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadUnreadCount(type.index, targetId, channelId, callbackJS);
  }

  // web 端不支持 channelId ，传递 channelId 会返回参数错误
  @override
  Future<int> loadTotalUnreadCount(String? channelId) {
    return getTotalUnreadCount(channelId);
  }

  @override
  Future<int> getTotalUnreadCount(String? channelId,
      {IRCIMIWGetTotalUnreadCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadTotalUnreadCount(channelId, callbackJS);
  }

  @override
  Future<int> loadUnreadMentionedCount(
      RCIMIWConversationType type, String targetId, String? channelId) {
    return getUnreadMentionedCount(type, targetId, channelId);
  }

  @override
  Future<int> getUnreadMentionedCount(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetUnreadMentionedCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadUnreadMentionedCount(type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> loadUltraGroupAllUnreadCount() {
    return getUltraGroupAllUnreadCount();
  }

  @override
  Future<int> getUltraGroupAllUnreadCount(
      {IRCIMIWGetUltraGroupAllUnreadCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.loadUltraGroupAllUnreadCount(callbackJS);
  }

  @override
  Future<int> loadUltraGroupAllUnreadMentionedCount() {
    return getUltraGroupAllUnreadMentionedCount();
  }

  @override
  Future<int> getUltraGroupAllUnreadMentionedCount(
      {IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadUltraGroupAllUnreadMentionedCount(callbackJS);
  }

  @override
  Future<int> loadUltraGroupUnreadCount(String targetId) {
    return getUltraGroupUnreadCount(targetId);
  }

  @override
  Future<int> getUltraGroupUnreadCount(String targetId,
      {IRCIMIWGetUltraGroupUnreadCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadUltraGroupUnreadCount(targetId, callbackJS);
  }

  @override
  Future<int> loadUltraGroupUnreadMentionedCount(String targetId) {
    return getUltraGroupUnreadMentionedCount(targetId);
  }

  @override
  Future<int> getUltraGroupUnreadMentionedCount(String targetId,
      {IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadUltraGroupUnreadMentionedCount(targetId, callbackJS);
  }

  // web 端不支持 channelId ，传递 channelId 会返回参数错误
  @override
  Future<int> loadUnreadCountByConversationTypes(
      List<RCIMIWConversationType> conversationTypes,
      String? channelId,
      bool contain) {
    return getUnreadCountByConversationTypes(
        conversationTypes, channelId, contain);
  }

  @override
  Future<int> getUnreadCountByConversationTypes(
      List<RCIMIWConversationType> conversationTypes,
      String? channelId,
      bool contain,
      {IRCIMIWGetUnreadCountByConversationTypesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.loadUnreadCountByConversationTypes(
        _toJSConversationTypes(conversationTypes),
        channelId,
        contain,
        callbackJS);
  }

  // web端 timestamp 参数不生效
  @override
  Future<int> clearUnreadCount(RCIMIWConversationType type, String targetId,
      String? channelId, int timestamp,
      {IRCIMIWClearUnreadCountCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUnreadCountCleared(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUnreadCountCleared(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .clearUnreadCount(type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> saveDraftMessage(RCIMIWConversationType type, String targetId,
      String? channelId, String draft,
      {IRCIMIWSaveDraftMessageCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onDraftMessageSaved(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onDraftMessageSaved(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .saveDraftMessage(type.index, targetId, channelId, draft, callbackJS);
  }

  @override
  Future<int> loadDraftMessage(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetDraftMessageCallback? callback}) {
    return getDraftMessage(type, targetId, channelId);
  }

  @override
  Future<int> getDraftMessage(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetDraftMessageCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadDraftMessage(type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> clearDraftMessage(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWClearDraftMessageCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onDraftMessageCleared(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onDraftMessageCleared(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .clearDraftMessage(type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> loadBlockedConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId) {
    return getBlockedConversations(conversationTypes, channelId);
  }

  @override
  Future<int> getBlockedConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId,
      {IRCIMIWGetBlockedConversationsCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(_conversationsFromJS(data));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.loadBlockedConversations(
        _toJSConversationTypes(conversationTypes), channelId, callbackJS);
  }

  // web 端不支持设置超级群的会话置顶
  @override
  Future<int> changeConversationTopStatus(
      RCIMIWConversationType type, String targetId, String? channelId, bool top,
      {IRCIMIWChangeConversationTopStatusCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onConversationTopStatusChanged(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onConversationTopStatusChanged(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.changeConversationTopStatus(
        type.index, targetId, channelId, top, callbackJS);
  }

  @override
  Future<int> loadConversationTopStatus(
      RCIMIWConversationType type, String targetId, String? channelId) {
    return getConversationTopStatus(type, targetId, channelId);
  }

  @override
  Future<int> getConversationTopStatus(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetConversationTopStatusCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(data);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadConversationTopStatus(type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> syncConversationReadStatus(RCIMIWConversationType type,
      String targetId, String? channelId, int timestamp,
      {IRCIMIWSyncConversationReadStatusCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onConversationReadStatusSynced(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onConversationReadStatusSynced(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.syncConversationReadStatus(
        type.index, targetId, channelId, timestamp, callbackJS);
  }

  @override
  Future<int> sendTypingStatus(RCIMIWConversationType type, String targetId,
      String? channelId, String currentType) async {
    return RCIMIWEngineWeb.imEngine!
        .sendTypingStatus(type.index, targetId, channelId, currentType);
  }

  // policy 只支持传 remote
  @override
  Future<int> loadMessages(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      int sentTime,
      RCIMIWTimeOrder order,
      RCIMIWMessageOperationPolicy policy,
      int count) {
    return getMessages(
        type, targetId, channelId, sentTime, order, policy, count);
  }

  @override
  Future<int> getMessages(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      int sentTime,
      RCIMIWTimeOrder order,
      RCIMIWMessageOperationPolicy policy,
      int count,
      {IRCIMIWGetMessagesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(_messagesFromJS(data));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.loadMessages(type.index, targetId,
        channelId, sentTime, order.index, policy.index, count, callbackJS);
  }

  @override
  Future<int> getMessageById(int messageId,
      {IRCIMIWGetMessageCallback? callback}) async {
    log('getMessageById() not supported on the web');
    return -1;
  }

  @override
  Future<int> getMessageByUId(String messageUId,
      {IRCIMIWGetMessageCallback? callback}) async {
    log('getMessageByUId() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadFirstUnreadMessage(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    log('loadFirstUnreadMessage() not supported on the web');
    return -1;
  }

  @override
  Future<int> getFirstUnreadMessage(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetFirstUnreadMessageCallback? callback}) async {
    log('getFirstUnreadMessage() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadUnreadMentionedMessages(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    log('loadUnreadMentionedMessages() not supported on the web');
    return -1;
  }

  @override
  Future<int> getUnreadMentionedMessages(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetUnreadMentionedMessagesCallback? callback}) async {
    log('getUnreadMentionedMessages() not supported on the web');
    return -1;
  }

  @override
  Future<int> insertMessage(RCIMIWMessage message,
      {IRCIMIWInsertMessageCallback? callback}) async {
    log('insertMessage() not supported on the web');
    return -1;
  }

  @override
  Future<int> insertMessages(List<RCIMIWMessage> messages,
      {IRCIMIWInsertMessagesCallback? callback}) async {
    log('insertMessages() not supported on the web');
    return -1;
  }

  // policy 只支持传 remote
  @override
  Future<int> clearMessages(RCIMIWConversationType type, String targetId,
      String? channelId, int timestamp, RCIMIWMessageOperationPolicy policy,
      {IRCIMIWClearMessagesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onMessagesCleared(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onMessagesCleared(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.clearMessages(
        type.index, targetId, channelId, timestamp, policy.index, callbackJS);
  }

  @override
  Future<int> deleteLocalMessages(List<RCIMIWMessage> messages,
      {IRCIMIWDeleteLocalMessagesCallback? callback}) async {
    log('deleteLocalMessages() not supported on the web');
    return -1;
  }

  @override
  Future<int> deleteMessages(RCIMIWConversationType type, String targetId,
      String? channelId, List<RCIMIWMessage> messages,
      {IRCIMIWDeleteMessagesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onMessagesDeleted(RCIMIWErrorCode.success.index, messages);
      }, onError: (code) {
        callback.onMessagesDeleted(code, null);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.deleteMessages(
        type.index, targetId, channelId, _toJsMessages(messages), callbackJS);
  }

  @override
  Future<int> recallMessage(RCIMIWMessage message,
      {IRCIMIWRecallMessageCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onMessageRecalled(
            RCIMIWErrorCode.success.index, _messageFromJS(data));
      }, onError: (code) {
        callback.onMessageRecalled(code, null);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .recallMessage(_toJsMessage(message), callbackJS);
  }

  @override
  Future<int> sendPrivateReadReceiptMessage(
      String targetId, String? channelId, int timestamp,
      {IRCIMIWSendPrivateReadReceiptMessageCallback? callback}) async {
    log('sendPrivateReadReceiptMessage() not supported on the web');
    return -1;
  }

  // web 端 messageUId 为必填字段
  @override
  Future<int> sendPrivateReadReceiptMessageForWeb(
      String targetId, String? channelId, int timestamp, String messageUId,
      {IRCIMIWSendPrivateReadReceiptMessageCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onPrivateReadReceiptMessageSent(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onPrivateReadReceiptMessageSent(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.sendPrivateReadReceiptMessage(
        targetId, channelId, timestamp, messageUId, callbackJS);
  }

  @override
  Future<int> sendGroupReadReceiptRequest(RCIMIWMessage message,
      {IRCIMIWSendGroupReadReceiptRequestCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onGroupReadReceiptRequestSent(
            RCIMIWErrorCode.success.index, message);
      }, onError: (code) {
        callback.onGroupReadReceiptRequestSent(code, null);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .sendGroupReadReceiptRequest(_toJsMessage(message), callbackJS);
  }

  @override
  Future<int> sendGroupReadReceiptResponse(
      String targetId, String? channelId, List<RCIMIWMessage> messages,
      {IRCIMIWSendGroupReadReceiptResponseCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onGroupReadReceiptResponseSent(
            RCIMIWErrorCode.success.index, messages);
      }, onError: (code) {
        callback.onGroupReadReceiptResponseSent(code, null);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.sendGroupReadReceiptResponse(
        targetId, channelId, _toJsMessages(messages), callbackJS);
  }

  @override
  Future<int> updateMessageExpansion(String messageUId, Map expansion,
      {IRCIMIWUpdateMessageExpansionCallback? callback}) async {
    log('updateMessageExpansion() not supported on the web');
    return -1;
  }

  @override
  Future<int> updateMessageExpansionForWeb(RCIMIWMessage message, Map expansion,
      {IRCIMIWUpdateMessageExpansionCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onMessageExpansionUpdated(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onMessageExpansionUpdated(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.updateMessageExpansion(
        _toJsMessage(message), toJSMap(expansion), callbackJS);
  }

  @override
  Future<int> removeMessageExpansionForKeys(
      String messageUId, List<String> keys,
      {IRCIMIWRemoveMessageExpansionForKeysCallback? callback}) async {
    log('removeMessageExpansionForKeys() not supported on the web');
    return -1;
  }

  @override
  Future<int> removeMessageExpansionForKeysForWeb(
      RCIMIWMessage message, List<String> keys,
      {IRCIMIWRemoveMessageExpansionForKeysCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback
            .onMessageExpansionForKeysRemoved(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onMessageExpansionForKeysRemoved(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .removeMessageExpansionForKeys(_toJsMessage(message), keys, callbackJS);
  }

  @override
  Future<int> changeMessageSentStatus(
      int messageId, RCIMIWSentStatus sentStatus,
      {IRCIMIWChangeMessageSentStatusCallback? callback}) async {
    log('changeMessageSentStatus() not supported on the web');
    return -1;
  }

  @override
  Future<int> changeMessageReceiveStatus(
      int messageId, RCIMIWReceivedStatus receivedStatus,
      {IRCIMIWChangeMessageReceivedStatusCallback? callback}) async {
    log('changeMessageReceiveStatus() not supported on the web');
    return -1;
  }

  @override
  Future<int> joinChatRoom(String targetId, int messageCount, bool autoCreate,
      {IRCIMIWJoinChatRoomCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onChatRoomJoined(RCIMIWErrorCode.success.index, targetId);
      }, onError: (code) {
        callback.onChatRoomJoined(code, targetId);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .joinChatRoom(targetId, messageCount, autoCreate, callbackJS);
  }

  @override
  Future<int> leaveChatRoom(String targetId,
      {IRCIMIWLeaveChatRoomCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onChatRoomLeft(RCIMIWErrorCode.success.index, targetId);
      }, onError: (code) {
        callback.onChatRoomLeft(code, targetId);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.leaveChatRoom(targetId, callbackJS);
  }

  @override
  Future<int> loadChatRoomMessages(
      String targetId, int timestamp, RCIMIWTimeOrder order, int count) {
    return getChatRoomMessages(targetId, timestamp, order, count);
  }

  @override
  Future<int> getChatRoomMessages(
      String targetId, int timestamp, RCIMIWTimeOrder order, int count,
      {IRCIMIWGetChatRoomMessagesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(_messagesFromJS(data));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.loadChatRoomMessages(
        targetId, timestamp, order.index, count, callbackJS);
  }

  @override
  Future<int> addChatRoomEntry(String targetId, String key, String value,
      bool deleteWhenLeft, bool overwrite,
      {IRCIMIWAddChatRoomEntryCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onChatRoomEntryAdded(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onChatRoomEntryAdded(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.addChatRoomEntry(
        targetId, key, value, deleteWhenLeft, overwrite, callbackJS);
  }

  @override
  Future<int> addChatRoomEntries(
      String targetId, Map entries, bool deleteWhenLeft, bool overwrite,
      {IRCIMIWAddChatRoomEntriesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      // 这里 web 端 onError 有两个参数，所以直接用了 callBackJS 初始化
      callbackJS = RCIMIWCallbackJS()
        ..onSuccess = allowInterop(() {
          callback.onChatRoomEntriesAdded(RCIMIWErrorCode.success.index, null);
        })
        ..onError = allowInterop((code, errorMap) {
          callback.onChatRoomEntriesAdded(code, jsMapToDart(errorMap));
        });
    }
    return RCIMIWEngineWeb.imEngine!.addChatRoomEntries(
        targetId, toJSMap(entries), deleteWhenLeft, overwrite, callbackJS);
  }

  @override
  Future<int> loadChatRoomEntry(String targetId, String key) {
    return getChatRoomEntry(targetId, key);
  }

  @override
  Future<int> getChatRoomEntry(String targetId, String key,
      {IRCIMIWGetChatRoomEntryCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(jsMapToDart(data));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadChatRoomEntry(targetId, key, callbackJS);
  }

  @override
  Future<int> loadChatRoomAllEntries(String targetId) {
    return getChatRoomAllEntries(targetId);
  }

  @override
  Future<int> getChatRoomAllEntries(String targetId,
      {IRCIMIWGetChatRoomAllEntriesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(jsMapToDart(data));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadAllChatRoomEntries(targetId, callbackJS);
  }

  @override
  Future<int> removeChatRoomEntry(String targetId, String key, bool force,
      {IRCIMIWRemoveChatRoomEntryCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onChatRoomEntryRemoved(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onChatRoomEntryRemoved(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .removeChatRoomEntry(targetId, key, force, callbackJS);
  }

  @override
  Future<int> removeChatRoomEntries(
      String targetId, List<String> keys, bool force,
      {IRCIMIWRemoveChatRoomEntriesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onChatRoomEntriesRemoved(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onChatRoomEntriesRemoved(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .removeChatRoomEntries(targetId, keys, force, callbackJS);
  }

  @override
  Future<int> addToBlacklist(String userId,
      {IRCIMIWAddToBlacklistCallback? callback}) async {
    log('addToBlacklist() not supported on the web');
    return -1;
  }

  @override
  Future<int> removeFromBlacklist(String userId,
      {IRCIMIWRemoveFromBlacklistCallback? callback}) async {
    log('removeFromBlacklist() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadBlacklistStatus(
    String userId,
  ) async {
    log('loadBlacklistStatus() not supported on the web');
    return -1;
  }

  @override
  Future<int> getBlacklistStatus(String userId,
      {IRCIMIWGetBlacklistStatusCallback? callback}) async {
    log('getBlacklistStatus() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadBlacklist() async {
    log('loadBlacklist() not supported on the web');
    return -1;
  }

  @override
  Future<int> getBlacklist({IRCIMIWGetBlacklistCallback? callback}) async {
    log('getBlacklist() not supported on the web');
    return -1;
  }

  @override
  Future<int> searchMessages(RCIMIWConversationType type, String targetId,
      String? channelId, String keyword, int startTime, int count,
      {IRCIMIWSearchMessagesCallback? callback}) async {
    log('searchMessages() not supported on the web');
    return -1;
  }

  @override
  Future<int> searchMessagesByTimeRange(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      String keyword,
      int startTime,
      int endTime,
      int offset,
      int count,
      {IRCIMIWSearchMessagesByTimeRangeCallback? callback}) async {
    log('searchMessagesByTimeRange() not supported on the web');
    return -1;
  }

  @override
  Future<int> searchMessagesByUserId(String userId, RCIMIWConversationType type,
      String targetId, String? channelId, int startTime, int count,
      {IRCIMIWSearchMessagesByUserIdCallback? callback}) async {
    log('searchMessagesByUserId() not supported on the web');
    return -1;
  }

  @override
  Future<int> searchConversations(
      List<RCIMIWConversationType> conversationTypes,
      String? channelId,
      List<RCIMIWMessageType> messageTypes,
      String keyword,
      {IRCIMIWSearchConversationsCallback? callback}) async {
    log('searchConversations() not supported on the web');
    return -1;
  }

  @override
  Future<int> changeNotificationQuietHours(String startTime, int spanMins,
      RCIMIWPushNotificationQuietHoursLevel level,
      {IRCIMIWChangeNotificationQuietHoursCallback? callback}) async {
    log('changeNotificationQuietHours() not supported on the web');
    return -1;
  }

  @override
  Future<int> removeNotificationQuietHours(
      {IRCIMIWRemoveNotificationQuietHoursCallback? callback}) async {
    log('removeNotificationQuietHours() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadNotificationQuietHours() async {
    log('loadNotificationQuietHours() not supported on the web');
    return -1;
  }

  @override
  Future<int> getNotificationQuietHours(
      {IRCIMIWGetNotificationQuietHoursCallback? callback}) async {
    log('getNotificationQuietHours() not supported on the web');
    return -1;
  }

  @override
  Future<int> changeConversationNotificationLevel(RCIMIWConversationType type,
      String targetId, String? channelId, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeConversationNotificationLevelCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onConversationNotificationLevelChanged(
            RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onConversationNotificationLevelChanged(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.changeConversationNotificationLevel(
        type.index, targetId, channelId, level.index, callbackJS);
  }

  @override
  Future<int> loadConversationNotificationLevel(
      RCIMIWConversationType type, String targetId, String? channelId) {
    return getConversationNotificationLevel(type, targetId, channelId);
  }

  @override
  Future<int> getConversationNotificationLevel(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetConversationNotificationLevelCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(RCIMIWPushNotificationLevel.values[data]);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.loadConversationNotificationLevel(
        type.index, targetId, channelId, callbackJS);
  }

  @override
  Future<int> changeConversationTypeNotificationLevel(
      RCIMIWConversationType type, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeConversationTypeNotificationLevelCallback?
          callback}) async {
    log('changeConversationTypeNotificationLevel() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadConversationTypeNotificationLevel(
    RCIMIWConversationType type,
  ) async {
    log('loadConversationTypeNotificationLevel() not supported on the web');
    return -1;
  }

  @override
  Future<int> getConversationTypeNotificationLevel(RCIMIWConversationType type,
      {IRCIMIWGetConversationTypeNotificationLevelCallback? callback}) async {
    log('getConversationTypeNotificationLevel() not supported on the web');
    return -1;
  }

  @override
  Future<int> changeUltraGroupDefaultNotificationLevel(
      String targetId, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback?
          callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUltraGroupDefaultNotificationLevelChanged(
            RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupDefaultNotificationLevelChanged(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.changeUltraGroupDefaultNotificationLevel(
        targetId, level.index, callbackJS);
  }

  @override
  Future<int> loadUltraGroupDefaultNotificationLevel(String targetId) {
    return getUltraGroupDefaultNotificationLevel(targetId);
  }

  @override
  Future<int> getUltraGroupDefaultNotificationLevel(String targetId,
      {IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(RCIMIWPushNotificationLevel.values[data]);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadUltraGroupDefaultNotificationLevel(targetId, callbackJS);
  }

  @override
  Future<int> changeUltraGroupChannelDefaultNotificationLevel(
      String targetId, String? channelId, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback?
          callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUltraGroupChannelDefaultNotificationLevelChanged(
            RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupChannelDefaultNotificationLevelChanged(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .changeUltraGroupChannelDefaultNotificationLevel(
            targetId, channelId, level.index, callbackJS);
  }

  @override
  Future<int> loadUltraGroupChannelDefaultNotificationLevel(
      String targetId, String? channelId) {
    return getUltraGroupChannelDefaultNotificationLevel(targetId, channelId);
  }

  @override
  Future<int> getUltraGroupChannelDefaultNotificationLevel(
      String targetId, String? channelId,
      {IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback?
          callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(RCIMIWPushNotificationLevel.values[data]);
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadUltraGroupChannelDefaultNotificationLevel(
            targetId, channelId, callbackJS);
  }

  @override
  Future<int> changePushContentShowStatus(bool showContent,
      {IRCIMIWChangePushContentShowStatusCallback? callback}) async {
    log('changePushContentShowStatus() not supported on the web');
    return -1;
  }

  @override
  Future<int> changePushLanguage(String language,
      {IRCIMIWChangePushLanguageCallback? callback}) async {
    log('changePushLanguage() not supported on the web');
    return -1;
  }

  @override
  Future<int> changePushReceiveStatus(bool receive,
      {IRCIMIWChangePushReceiveStatusCallback? callback}) async {
    log('changePushReceiveStatus() not supported on the web');
    return -1;
  }

  @override
  Future<int> sendGroupMessageToDesignatedUsers(
      RCIMIWMessage message, List<String> userIds,
      {RCIMIWSendGroupMessageToDesignatedUsersCallback? callback}) async {
    var jsMessage = _convertMessageToJS(message);
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onMessageSent(
            RCIMIWErrorCode.success.index, _messageFromJS(data));
      }, onError: (code) {
        callback.onMessageSent(code, null);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .sendGroupMessageToDesignatedUsers(jsMessage, userIds, callbackJS);
  }

  @override
  Future<int> loadMessageCount(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    log('loadMessageCount() not supported on the web');
    return -1;
  }

  @override
  Future<int> getMessageCount(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetMessageCountCallback? callback}) async {
    log('getMessageCount() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadTopConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId) {
    return getTopConversations(conversationTypes, channelId);
  }

  @override
  Future<int> getTopConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId,
      {IRCIMIWGetTopConversationsCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(_conversationsFromJS(data));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    var jsTypes = _toJSConversationTypes(conversationTypes);
    return RCIMIWEngineWeb.imEngine!
        .loadTopConversations(jsTypes, channelId, callbackJS);
  }

  // Web 端 timestamp 参数无效
  @override
  Future<int> syncUltraGroupReadStatus(
      String targetId, String? channelId, int timestamp,
      {IRCIMIWSyncUltraGroupReadStatusCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUltraGroupReadStatusSynced(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupReadStatusSynced(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .syncUltraGroupReadStatus(targetId, channelId, callbackJS);
  }

  @override
  Future<int> loadConversationsForAllChannel(
    RCIMIWConversationType type,
    String targetId,
  ) {
    return getConversationsForAllChannel(type, targetId);
  }

  @override
  Future<int> getConversationsForAllChannel(
      RCIMIWConversationType type, String targetId,
      {IRCIMIWGetConversationsForAllChannelCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackWeb(onSuccess: (data) {
        callback.onSuccess(_conversationsFromJS(data));
      }, onError: (code) {
        callback.onError(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!
        .loadConversationListForAllChannel(type.index, targetId, callbackJS);
  }

  @override
  Future<int> modifyUltraGroupMessageForWeb(
      RCIMIWMessage originalMessage, RCIMIWMessage newMessage,
      {IRCIMIWModifyUltraGroupMessageCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUltraGroupMessageModified(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupMessageModified(code);
      }).toJS();
    }
    var jsOriginalMessage = _convertMessageToJS(originalMessage);
    var jsNewMessage = _convertMessageToJS(newMessage);
    return RCIMIWEngineWeb.imEngine!
        .modifyUltraGroupMessage(jsOriginalMessage, jsNewMessage, callbackJS);
  }

  @override
  Future<int> modifyUltraGroupMessage(String messageUId, RCIMIWMessage message,
      {IRCIMIWModifyUltraGroupMessageCallback? callback}) async {
    log('modifyUltraGroupMessage() not supported on the web, please use modifyUltraGroupMessageForWeb()');
    return -1;
  }

  @override
  Future<int> recallUltraGroupMessage(RCIMIWMessage message, bool deleteRemote,
      {IRCIMIWRecallUltraGroupMessageCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUltraGroupMessageRecalled(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupMessageRecalled(code);
      }).toJS();
    }
    var jsMessage = _convertMessageToJS(message);
    return RCIMIWEngineWeb.imEngine!
        .recallUltraGroupMessage(jsMessage, deleteRemote, callbackJS);
  }

  @override
  Future<int> clearUltraGroupMessages(String targetId, String? channelId,
      int timestamp, RCIMIWMessageOperationPolicy policy,
      {IRCIMIWClearUltraGroupMessagesCallback? callback}) async {
    IRCIMIWClearMessagesCallback cb =
        IRCIMIWClearMessagesCallback(onMessagesCleared: (int? code) {
      callback?.onUltraGroupMessagesCleared(code);
    });
    return clearMessages(RCIMIWConversationType.ultraGroup, targetId, channelId,
        timestamp, RCIMIWMessageOperationPolicy.remote,
        callback: cb);
  }

  @override
  Future<int> sendUltraGroupTypingStatus(String targetId, String? channelId,
      RCIMIWUltraGroupTypingStatus typingStatus,
      {IRCIMIWSendUltraGroupTypingStatusCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUltraGroupTypingStatusSent(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupTypingStatusSent(code);
      }).toJS();
    }
    return RCIMIWEngineWeb.imEngine!.sendUltraGroupTypingStatus(
        targetId, channelId, typingStatus.index, callbackJS);
  }

  @override
  Future<int> clearUltraGroupMessagesForAllChannel(
      String targetId, int timestamp,
      {IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback}) async {
    log('clearUltraGroupMessagesForAllChannel() not supported on the web');
    return -1;
  }

  @override
  Future<int> loadBatchRemoteUltraGroupMessages(List<RCIMIWMessage> messages) {
    return getBatchRemoteUltraGroupMessages(messages);
  }

  @override
  Future<int> getBatchRemoteUltraGroupMessages(List<RCIMIWMessage> messages,
      {IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWCallbackJS()
        ..onSuccess = allowInterop((matched, noMatched) {
          callback.onSuccess(
              _messagesFromJS(matched), _messagesFromJS(noMatched));
        })
        ..onError = allowInterop((code) {
          callback.onError(code);
        });
    }
    var jsMessages = _toJsMessages(messages);
    return RCIMIWEngineWeb.imEngine!
        .loadBatchRemoteUltraGroupMessages(jsMessages, callbackJS);
  }

  @override
  Future<int> updateUltraGroupMessageExpansion(String messageUId, Map expansion,
      {IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback}) async {
    log('updateUltraGroupMessageExpansion() not supported on the web, please use updateUltraGroupMessageExpansionForWeb()');
    return -1;
  }

  // web 端 messageUId 无效， 需要传 message
  @override
  Future<int> updateUltraGroupMessageExpansionForWeb(
      RCIMIWMessage message, Map expansion,
      {IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback
            .onUltraGroupMessageExpansionUpdated(RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupMessageExpansionUpdated(code);
      }).toJS();
    }
    var jsMessages = _toJsMessage(message);
    return RCIMIWEngineWeb.imEngine!.updateUltraGroupMessageExpansion(
        jsMessages, toJSMap(expansion), callbackJS);
  }

  @override
  Future<int> removeUltraGroupMessageExpansionForKeys(
      String messageUId, List<String> keys,
      {IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback?
          callback}) async {
    log('removeUltraGroupMessageExpansionForKeys() not supported on the web, please use removeUltraGroupMessageExpansionForKeysForWeb()');
    return -1;
  }

  // web 端 messageUId 无效， 需要传 message
  @override
  Future<int> removeUltraGroupMessageExpansionForKeysForWeb(
      RCIMIWMessage message, List<String> keys,
      {IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback?
          callback}) async {
    RCIMIWCallbackJS? callbackJS;
    if (callback != null) {
      callbackJS = RCIMIWVoidCallbackWeb(onSuccess: () {
        callback.onUltraGroupMessageExpansionForKeysRemoved(
            RCIMIWErrorCode.success.index);
      }, onError: (code) {
        callback.onUltraGroupMessageExpansionForKeysRemoved(code);
      }).toJS();
    }
    var jsMessages = _toJsMessage(message);
    return RCIMIWEngineWeb.imEngine!
        .removeUltraGroupMessageExpansion(jsMessages, keys, callbackJS);
  }

  @override
  Future<int> changeLogLevel(RCIMIWLogLevel level) async {
    log('changeLogLevel() not supported on the web');
    return -1;
  }

  @override
  Future<int> getDeltaTime() async {
    return RCIMIWEngineWeb.imEngine!.getDeltaTime();
  }

  _setListener() {
    RCIMIWListenerJS listenerJS = RCIMIWListenerJS()
      // 远端事件监听
      ..onMessageReceived = allowInterop((message, left, offline, hasPackage) {
        RCIMIWMessage dMessage = _messageFromJS(message);
        engine!.onMessageReceived?.call(dMessage, left, offline, hasPackage);
      })
      ..onConnectionStatusChanged = allowInterop((status) {
        engine!.onConnectionStatusChanged
            ?.call(RCIMIWConnectionStatus.values[status]);
      })
      ..onConversationTopStatusSynced =
          allowInterop((type, targetId, channelId, top) {
        engine!.onConversationTopStatusSynced?.call(
            RCIMIWConversationType.values[type], targetId, channelId, top);
      })
      ..onRemoteMessageRecalled = allowInterop((message) {
        RCIMIWMessage dMessage = _messageFromJS(message);
        engine!.onRemoteMessageRecalled?.call(dMessage);
      })
      ..onPrivateReadReceiptReceived =
          allowInterop((targetId, channelId, timestamp) {
        engine!.onPrivateReadReceiptReceived
            ?.call(targetId, channelId, timestamp);
      })
      ..onRemoteMessageExpansionUpdated = allowInterop((expansion, messageUId) {
        Map<String, String> dExpansion =
            Map<String, String>.from(jsToDart(expansion));
        engine!.onRemoteMessageExpansionUpdatedForWeb
            ?.call(dExpansion, messageUId);
      })
      ..onRemoteMessageExpansionForKeyRemoved =
          allowInterop((messageUId, keys) {
        List<String> dKeys = jsToDart(keys);
        engine!.onRemoteMessageExpansionForKeyRemovedForWeb
            ?.call(messageUId, dKeys);
      })
      ..onChatRoomMemberChanged = allowInterop((targetId, actions) {
        List<RCIMIWChatRoomMemberAction> a = <RCIMIWChatRoomMemberAction>[];
        for (var action in actions) {
          a.add(RCIMIWChatRoomMemberAction.fromJson(jsToDart(action)));
        }
        engine!.onChatRoomMemberChanged?.call(targetId, a);
      })
      ..onTypingStatusChanged =
          allowInterop((type, targetId, channelId, userTypingStatus) {
        List<RCIMIWTypingStatus> dUserTypingStatus;
        if (userTypingStatus is Iterable) {
          dUserTypingStatus = userTypingStatus
              .map((e) => RCIMIWTypingStatus.fromJson(jsToDart(e)))
              .toList();
          engine!.onTypingStatusChanged?.call(_conversationTypeFromJS(type),
              targetId, channelId, dUserTypingStatus);
        }
      })
      ..onConversationReadStatusSyncMessageReceived =
          allowInterop((type, targetId, timestamp) {
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onConversationReadStatusSyncMessageReceived
            ?.call(dType, targetId, timestamp);
      })
      ..onChatRoomEntriesChanged =
          allowInterop((operationType, roomId, entries) {
        RCIMIWChatRoomEntriesOperationType dType =
            RCIMIWChatRoomEntriesOperationType.values[operationType];
        Map<String, String> e = Map<String, String>.from(jsMapToDart(entries));
        engine!.onChatRoomEntriesChanged?.call(dType, roomId, e);
      })
      ..onRemoteUltraGroupMessageExpansionUpdated = allowInterop((messages) {
        List<RCIMIWMessage> dMessages = _messagesFromJS(messages);
        engine!.onRemoteUltraGroupMessageExpansionUpdated?.call(dMessages);
      })
      ..onRemoteUltraGroupMessageModified = allowInterop((messages) {
        List<RCIMIWMessage> dMessages = _messagesFromJS(messages);
        engine!.onRemoteUltraGroupMessageModified?.call(dMessages);
      })
      ..onRemoteUltraGroupMessageRecalled = allowInterop((messages) {
        List<RCIMIWMessage> dMessages = _messagesFromJS(messages);
        engine!.onRemoteUltraGroupMessageRecalled?.call(dMessages);
      })
      ..onUltraGroupReadTimeReceived =
          allowInterop((targetId, channelId, timestamp) {
        engine!.onUltraGroupReadTimeReceived
            ?.call(targetId, channelId, timestamp);
      })
      ..onUltraGroupTypingStatusChanged = allowInterop((info) {
        List<RCIMIWUltraGroupTypingStatusInfo> dInfos = (jsToDart(info) as List)
            .map((e) => RCIMIWUltraGroupTypingStatusInfo.fromJson(e))
            .toList();
        engine!.onUltraGroupTypingStatusChanged?.call(dInfos);
      })
      ..onMessageBlocked = allowInterop((info) {
        RCIMIWBlockedMessageInfo dInfo =
            RCIMIWBlockedMessageInfo.fromJson(jsToDart(info));
        engine!.onMessageBlocked?.call(dInfo);
      })
      ..onChatRoomStatusChanged = allowInterop((targetId, status) {
        engine!.onChatRoomStatusChanged
            ?.call(targetId, RCIMIWChatRoomStatus.values[status]);
      })
      ..onGroupMessageReadReceiptRequestReceived =
          allowInterop((targetId, messageUId) {
        engine!.onGroupMessageReadReceiptRequestReceived
            ?.call(targetId, messageUId);
      })
      ..onGroupMessageReadReceiptResponseReceived =
          allowInterop((targetId, messageUId, respondUserIds) {
        Map<String, int> dRespondUserIds =
            Map<String, int>.from(jsMapToDart(respondUserIds));
        engine!.onGroupMessageReadReceiptResponseReceived
            ?.call(targetId, messageUId, dRespondUserIds);
      })
      ..onUltraGroupEnable = allowInterop((conversations) {
        // engine 暂未抛出此回调
      })
      // 本地调用接口触发的回调
      ..onConnected = allowInterop((code, userId) {
        log('flutter for web -> onConnected');
        engine!.onConnected?.call(code, userId);
      })
      // ..onDatabaseOpened = allowInterop((code) {
      //   log('flutter for web -> onDatabaseOpened');
      //   engine!.onDatabaseOpened?.call(code);
      // })
      ..onConversationsUpdate = allowInterop((conversations) {
        log('flutter for web -> onConversationsUpdate');
        List<RCIMIWConversation> dConversations =
            _conversationsFromJS(conversations);
        engine!.onConversationsUpdateForWeb?.call(dConversations);
      })
      ..onConversationLoaded =
          allowInterop((code, type, targetId, channelId, conversation) {
        log('flutter for web -> onConversationLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        RCIMIWConversation dConversation = _conversationFromJS(conversation);
        engine!.onConversationLoaded
            ?.call(code, dType, targetId, channelId, dConversation);
      })
      ..onConversationsLoaded = allowInterop((code, conversationTypes,
          channelId, startTime, count, conversations) {
        log('flutter for web -> onConversationsLoaded');
        List<RCIMIWConversationType> dConversationTypes =
            _conversationTypesFromJS(conversationTypes);
        List<RCIMIWConversation> dConversations =
            _conversationsFromJS(conversations);
        engine!.onConversationsLoaded?.call(code, dConversationTypes, channelId,
            startTime, count, dConversations);
      })
      ..onConversationRemoved = allowInterop((code, type, targetId, channelId) {
        log('flutter for web -> onConversationRemoved');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onConversationRemoved?.call(code, dType, targetId, channelId);
      })
      ..onConversationsRemoved = allowInterop((code, types, channelId) {
        log('flutter for web -> onConversationsRemoved');
        List<RCIMIWConversationType> dTypes = _conversationTypesFromJS(types);
        engine!.onConversationsRemoved?.call(code, dTypes, channelId);
      })
      ..onTotalUnreadCountLoaded = allowInterop((code, channelId, count) {
        log('flutter for web -> onTotalUnreadCountLoaded');
        engine!.onTotalUnreadCountLoaded?.call(code, channelId, count);
      })
      ..onUnreadCountLoaded =
          allowInterop((code, type, targetId, channelId, count) {
        log('flutter for web -> onUnreadCountLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onUnreadCountLoaded
            ?.call(code, dType, targetId, channelId, count);
      })
      ..onUnreadCountByConversationTypesLoaded =
          allowInterop((code, types, channelId, contain, count) {
        log('flutter for web -> onUnreadCountByConversationTypesLoaded');
        List<RCIMIWConversationType> dTypes = _conversationTypesFromJS(types);
        engine!.onUnreadCountByConversationTypesLoaded
            ?.call(code, dTypes, channelId, contain, count);
      })
      ..onUnreadMentionedCountLoaded =
          allowInterop((code, type, targetId, channelId, count) {
        log('flutter for web -> onUnreadMentionedCountLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onUnreadMentionedCountLoaded
            ?.call(code, dType, targetId, channelId, count);
      })
      ..onUltraGroupAllUnreadCountLoaded = allowInterop((code, count) {
        log('flutter for web -> onUltraGroupAllUnreadCountLoaded');
        engine!.onUltraGroupAllUnreadCountLoaded?.call(code, count);
      })
      ..onUltraGroupAllUnreadMentionedCountLoaded = allowInterop((code, count) {
        log('flutter for web -> onUltraGroupAllUnreadMentionedCountLoaded');
        engine!.onUltraGroupAllUnreadMentionedCountLoaded?.call(code, count);
      })
      ..onUnreadCountCleared = allowInterop((code, type, targetId, channelId) {
        log('flutter for web -> onUnreadCountCleared');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onUnreadCountCleared
            ?.call(code, dType, targetId, channelId, -1);
      })
      ..onDraftMessageSaved =
          allowInterop((code, type, targetId, channelId, draft) {
        log('flutter for web -> onDraftMessageSaved');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onDraftMessageSaved
            ?.call(code, dType, targetId, channelId, draft);
      })
      ..onDraftMessageCleared = allowInterop((code, type, targetId, channelId) {
        log('flutter for web -> onDraftMessageCleared');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onDraftMessageCleared?.call(code, dType, targetId, channelId);
      })
      ..onDraftMessageLoaded =
          allowInterop((code, type, targetId, channelId, draft) {
        log('flutter for web -> onDraftMessageLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onDraftMessageLoaded
            ?.call(code, dType, targetId, channelId, draft);
      })
      ..onBlockedConversationsLoaded =
          allowInterop((code, types, channelId, conversations) {
        log('flutter for web -> onBlockedConversationsLoaded');
        List<RCIMIWConversation> dConversations =
            _conversationsFromJS(conversations);
        engine!.onBlockedConversationsLoaded?.call(
            code, _conversationTypesFromJS(types), channelId, dConversations);
      })
      ..onConversationTopStatusChanged =
          allowInterop((code, type, targetId, channelId, top) {
        log('flutter for web -> onConversationTopStatusChanged');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onConversationTopStatusChanged
            ?.call(code, dType, targetId, channelId, top);
      })
      ..onConversationTopStatusLoaded =
          allowInterop((code, type, targetId, channelId, top) {
        log('flutter for web -> onConversationTopStatusLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onConversationTopStatusLoaded
            ?.call(code, dType, targetId, channelId, top);
      })
      ..onConversationReadStatusSynced =
          allowInterop((code, type, targetId, channelId, timestamp) {
        log('flutter for web -> onConversationReadStatusSynced');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onConversationReadStatusSynced
            ?.call(code, dType, targetId, channelId, timestamp);
      })
      ..onMessageSent = allowInterop((code, message) {
        log('flutter for web -> onMessageSent');
        RCIMIWMessage dMessaage = _messageFromJS(message);
        engine!.onMessageSent?.call(code, dMessaage);
      })
      ..onMediaMessageSending = allowInterop((message, progress) {
        log('flutter for web -> onMediaMessageSending');
        RCIMIWMediaMessage dMessage =
            _messageFromJS(message) as RCIMIWMediaMessage;
        engine!.onMediaMessageSending?.call(dMessage, progress);
      })
      ..onMediaMessageSent = allowInterop((code, message) {
        log('flutter for web -> onMediaMessageSent');
        RCIMIWMediaMessage dMessage =
            _messageFromJS(message) as RCIMIWMediaMessage;
        engine!.onMediaMessageSent?.call(code, dMessage);
      })
      ..onMessagesLoaded = allowInterop(
          (code, type, targetId, channelId, sentTime, order, messages) {
        log('flutter for web -> onMessagesLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        List<RCIMIWMessage> dMessages = _messagesFromJS(messages);
        RCIMIWTimeOrder dOrder = RCIMIWTimeOrder.values[order];
        engine!.onMessagesLoaded?.call(
            code, dType, targetId, channelId, sentTime, dOrder, dMessages);
      })
      ..onMessageCleared =
          allowInterop((code, type, targetId, channelId, timestamp) {
        log('flutter for web -> onMessageCleared');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        engine!.onMessagesCleared
            ?.call(code, dType, targetId, channelId, timestamp);
      })
      ..onMessagesDeleted =
          allowInterop((code, type, targetId, channelId, messages) {
        log('flutter for web -> onMessagesDeleted');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        List<RCIMIWMessage> dMessages = _messagesFromJS(messages);
        engine!.onMessagesDeleted
            ?.call(code, dType, targetId, channelId, dMessages);
      })
      ..onMessageRecalled = allowInterop((code, message) {
        log('flutter for web -> onMessageRecalled');
        RCIMIWMessage dMessage = _messageFromJS(message);
        engine!.onMessageRecalled?.call(code, dMessage);
      })
      ..onPrivateReadReceiptMessageSent =
          allowInterop((code, targetId, channelId, timestamp, messageUId) {
        log('flutter for web -> onPrivateReadReceiptMessageSent');
        engine!.onPrivateReadReceiptMessageSent
            ?.call(code, targetId, channelId, timestamp);
      })
      ..onMessageExpansionUpdated = allowInterop((code, messageUId, expansion) {
        log('flutter for web -> onMessageExpansionUpdated');
        Map<String, String> dExpansion =
            Map<String, String>.from(jsMapToDart(expansion));
        engine!.onMessageExpansionUpdated?.call(code, messageUId, dExpansion);
      })
      ..onMessageExpansionForKeysRemoved =
          allowInterop((code, messageUId, keys) {
        log('flutter for web -> onMessageExpansionForKeysRemoved');
        List<String> dKeys = jsToDart(keys);
        engine!.onMessageExpansionForKeysRemoved?.call(code, messageUId, dKeys);
      })
      ..onChatRoomJoined = allowInterop((code, targetId) {
        log('flutter for web -> onChatRoomJoined');
        engine!.onChatRoomJoined?.call(code, targetId);
      })
      ..onChatRoomJoining = allowInterop((targetId) {
        log('flutter for web -> onChatRoomJoining');
        engine!.onChatRoomJoining?.call(targetId);
      })
      ..onChatRoomLeft = allowInterop((code, targetId) {
        log('flutter for web -> onChatRoomLeft');
        engine!.onChatRoomLeft?.call(code, targetId);
      })
      ..onChatRoomMessagesLoaded =
          allowInterop((code, targetId, messages, syncTime) {
        log('flutter for web -> onChatRoomMessagesLoaded');
        List<RCIMIWMessage> dMessages = _messagesFromJS(messages);
        engine!.onChatRoomMessagesLoaded
            ?.call(code, targetId, dMessages, syncTime);
      })
      ..onChatRoomEntryAdded = allowInterop((code, targetId, key) {
        log('flutter for web -> onChatRoomEntryAdded');
        engine!.onChatRoomEntryAdded?.call(code, targetId, key);
      })
      ..onChatRoomEntriesAdded =
          allowInterop((code, targetId, entries, errorEntries) {
        log('flutter for web -> onChatRoomEntriesAdded');
        Map<String, String> dEntries =
            Map<String, String>.from(jsMapToDart(entries));
        Map<String, int> dErrorEntries =
            Map<String, int>.from(jsMapToDart(errorEntries));
        engine!.onChatRoomEntriesAdded
            ?.call(code, targetId, dEntries, dErrorEntries);
      })
      ..onChatRoomEntryLoaded = allowInterop((code, targetId, entry) {
        log('flutter for web -> onChatRoomEntryLoaded');
        Map<String, String> dEntry =
            Map<String, String>.from(jsMapToDart(entry));
        engine!.onChatRoomEntryLoaded?.call(code, targetId, dEntry);
      })
      ..onAllChatRoomEntriesLoaded = allowInterop((code, targetId, entries) {
        log('flutter for web -> onAllChatRoomEntriesLoaded');
        Map<String, String> dEntries =
            Map<String, String>.from(jsMapToDart(entries));
        engine!.onChatRoomAllEntriesLoaded?.call(code, targetId, dEntries);
      })
      ..onChatRoomEntryRemoved = allowInterop((code, targetId, key) {
        log('flutter for web -> onChatRoomEntryRemoved');
        engine!.onChatRoomEntryRemoved?.call(code, targetId, key);
      })
      ..onChatRoomEntriesRemoved = allowInterop((code, targetId, keys) {
        log('flutter for web -> onChatRoomEntriesRemoved');
        List<String> dKeys = jsToDart(keys);
        engine!.onChatRoomEntriesRemoved?.call(code, targetId, dKeys);
      })
      ..onGroupReadReceiptRequestSent = allowInterop((code, message) {
        log('flutter for web -> onGroupReadReceiptRequestSent');
        RCIMIWMessage dMessage = _messageFromJS(message);
        engine!.onGroupReadReceiptRequestSent?.call(code, dMessage);
      })
      ..onGroupReadReceiptResponseSent =
          allowInterop((code, targetId, channelId, messages) {
        log('flutter for web -> onGroupReadReceiptResponseSent');
        List<RCIMIWMessage> dMessages = _messagesFromJS(messages);
        engine!.onGroupReadReceiptResponseSent
            ?.call(code, targetId, channelId, dMessages);
      })
      ..onConversationNotificationLevelChanged =
          allowInterop((code, type, targetId, channelId, level) {
        log('flutter for web -> onConversationNotificationLevelChanged');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onConversationNotificationLevelChanged
            ?.call(code, dType, targetId, channelId, dLevel);
      })
      ..onConversationNotificationLevelLoaded =
          allowInterop((code, type, targetId, channelId, level) {
        log('flutter for web -> onConversationNotificationLevelLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onConversationNotificationLevelLoaded
            ?.call(code, dType, targetId, channelId, dLevel);
      })
      ..onConversationTypeNotificationLevelChanged =
          allowInterop((code, type, level) {
        log('flutter for web -> onConversationTypeNotificationLevelChanged');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onConversationTypeNotificationLevelChanged
            ?.call(code, dType, dLevel);
      })
      ..onConversationTypeNotificationLevelLoaded =
          allowInterop((code, type, level) {
        log('flutter for web -> onConversationTypeNotificationLevelLoaded');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onConversationTypeNotificationLevelLoaded
            ?.call(code, dType, dLevel);
      })
      ..onUltraGroupDefaultNotificationLevelChanged =
          allowInterop((code, targetId, level) {
        log('flutter for web -> onUltraGroupDefaultNotificationLevelChanged');
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onUltraGroupDefaultNotificationLevelChanged
            ?.call(code, targetId, dLevel);
      })
      ..onUltraGroupDefaultNotificationLevelLoaded =
          allowInterop((code, targetId, level) {
        log('flutter for web -> onUltraGroupDefaultNotificationLevelLoaded');
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onUltraGroupDefaultNotificationLevelLoaded
            ?.call(code, targetId, dLevel);
      })
      ..onUltraGroupChannelDefaultNotificationLevelChanged =
          allowInterop((code, targetId, channelId, level) {
        log('flutter for web -> onUltraGroupChannelDefaultNotificationLevelChanged');
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onUltraGroupChannelDefaultNotificationLevelChanged
            ?.call(code, targetId, channelId, dLevel);
      })
      ..onUltraGroupChannelDefaultNotificationLevelLoaded =
          allowInterop((code, targetId, channelId, level) {
        log('flutter for web -> onUltraGroupChannelDefaultNotificationLevelLoaded');
        RCIMIWPushNotificationLevel dLevel =
            _pushNotificationLevelFromJS(level);
        engine!.onUltraGroupChannelDefaultNotificationLevelLoaded
            ?.call(code, targetId, channelId, dLevel);
      })
      ..onTopConversationsLoaded =
          allowInterop((code, conversationTypes, channelId, conversations) {
        log('flutter for web -> onTopConversationsLoaded');
        List<RCIMIWConversationType> dConversationTypes =
            _conversationTypesFromJS(conversationTypes);
        List<RCIMIWConversation> dConversations =
            _conversationsFromJS(conversations);
        engine!.onTopConversationsLoaded
            ?.call(code, dConversationTypes, channelId, dConversations);
      })
      ..onGroupMessageToDesignatedUsersAttached = allowInterop((message) {
        log('flutter for web -> onGroupMessageToDesignatedUsersAttached');
        RCIMIWMessage dMessage = _messageFromJS(message);
        engine!.onGroupMessageToDesignatedUsersAttached?.call(dMessage);
      })
      ..onGroupMessageToDesignatedUsersSent = allowInterop((code, message) {
        log('flutter for web -> onGroupMessageToDesignatedUsersSent');
        RCIMIWMessage dMessage = _messageFromJS(message);
        engine!.onGroupMessageToDesignatedUsersSent?.call(code, dMessage);
      })
      ..onUltraGroupReadStatusSynced =
          allowInterop((code, targetId, channelId) {
        log('flutter for web -> onUltraGroupReadStatusSynced');
        engine!.onUltraGroupReadStatusSynced
            ?.call(code, targetId, channelId, -1);
      })
      ..onConversationsLoadedForAllChannel =
          allowInterop((code, type, targetId, conversations) {
        log('flutter for web -> onConversationsLoadedForAllChannel');
        RCIMIWConversationType dType = _conversationTypeFromJS(type);
        List<RCIMIWConversation> dConversations =
            _conversationsFromJS(conversations);
        engine!.onConversationsLoadedForAllChannel
            ?.call(code, dType, targetId, dConversations);
      })
      ..onUltraGroupUnreadMentionedCountLoaded =
          allowInterop((code, targetId, count) {
        log('flutter for web -> onUltraGroupUnreadMentionedCountLoaded');
        engine!.onUltraGroupUnreadMentionedCountLoaded
            ?.call(code, targetId, count);
      })
      ..onUltraGroupUnreadCountLoaded = allowInterop((code, targetId, count) {
        log('flutter for web -> onUltraGroupUnreadCountLoaded');
        engine!.onUltraGroupUnreadCountLoaded?.call(code, targetId, count);
      })
      ..onUltraGroupMessageModified = allowInterop((code, messageUId) {
        log('flutter for web -> onUltraGroupMessageModified');
        engine!.onUltraGroupMessageModified?.call(code, messageUId);
      })
      ..onUltraGroupMessageRecalled =
          allowInterop((code, message, deleteRemote) {
        log('flutter for web -> onUltraGroupMessageRecalled');
        RCIMIWMessage dMessage = _messageFromJS(message);
        engine!.onUltraGroupMessageRecalled?.call(code, dMessage, deleteRemote);
      })
      ..onUltraGroupTypingStatusSent =
          allowInterop((code, targetId, channelId, typingStatus) {
        log('flutter for web -> onUltraGroupTypingStatusSent');
        RCIMIWUltraGroupTypingStatus dTypingStatus =
            RCIMIWUltraGroupTypingStatus.values[typingStatus];
        engine!.onUltraGroupTypingStatusSent
            ?.call(code, targetId, channelId, dTypingStatus);
      })
      ..onBatchRemoteUltraGroupMessagesLoaded =
          allowInterop((code, matchedMessages, notMatchedMessages) {
        log('flutter for web -> onBatchRemoteUltraGroupMessagesLoaded');
        List<RCIMIWMessage> dMatchedMessages = _messagesFromJS(matchedMessages);
        List<RCIMIWMessage> dNotMatchedMessages =
            _messagesFromJS(notMatchedMessages);
        engine!.onBatchRemoteUltraGroupMessagesLoaded
            ?.call(code, dMatchedMessages, dNotMatchedMessages);
      })
      ..onUltraGroupMessageExpansionUpdated =
          allowInterop((code, expansion, messageUId) {
        log('flutter for web -> onUltraGroupMessageExpansionUpdated');
        Map<String, String> dExpansion =
            Map<String, String>.from(jsToDart(expansion));
        engine!.onUltraGroupMessageExpansionUpdated
            ?.call(code, dExpansion, messageUId);
      })
      ..onUltraGroupMessageExpansionRemoved =
          allowInterop((code, messageUId, keys) {
        log('flutter for web -> onUltraGroupMessageExpansionRemoved');
        List<String> dKeys = jsToDart(keys);
        engine!.onUltraGroupMessageExpansionForKeysRemoved
            ?.call(code, messageUId, dKeys);
      });
    // 将监听设置给 web 端
    RCIMIWEngineWeb.imEngine?.setListener(listenerJS);
  }

  // ---------- 工具方法 ------------- //

  List<int> _toJSConversationTypes(
      List<RCIMIWConversationType> conversationTypes) {
    return conversationTypes.map((e) => e.index).toList();
  }

  dynamic _toJsMessage(RCIMIWMessage? message) {
    if (message == null) return null;
    return _convertMessageToJS(message);
  }

  dynamic _toJsMessages(List<RCIMIWMessage> messages) {
    return messages.map(_toJsMessage).toList();
  }

  RCIMIWMessage _messageFromJS(dynamic message) {
    Map<String, dynamic> dMessage = jsToDart(message);
    return RCIMConverter.convertMessage(dMessage);
  }

  List<RCIMIWMessage> _messagesFromJS(dynamic messages) {
    return (messages as List).map(_messageFromJS).toList();
  }

  RCIMIWConversationType _conversationTypeFromJS(dynamic type) {
    return RCIMIWConversationType.values[type];
  }

  List<RCIMIWConversationType> _conversationTypesFromJS(dynamic types) {
    return (types as List).map(_conversationTypeFromJS).toList();
  }

  RCIMIWConversation _conversationFromJS(dynamic conversation) {
    return RCIMIWConversation.fromJson(jsToDart(conversation));
  }

  List<RCIMIWConversation> _conversationsFromJS(dynamic conversations) {
    return (conversations as List).map(_conversationFromJS).toList();
  }

  RCIMIWPushNotificationLevel _pushNotificationLevelFromJS(level) {
    return RCIMIWPushNotificationLevel.values[level];
  }

  RCIMIWMessageJS? _convertMessageToJS(RCIMIWMessage message) {
    RCIMIWMessageType? messageType = message.messageType;
    if (messageType == null) {
      log('message is invalid');
      return null;
    }

    Map<String, dynamic> json = message.toJson();
    dynamic jsObject = dartToJS(json);

    final RCIMIWUserInfo? userInfo = message.userInfo;
    if (userInfo != null) {
      RCIMIWUserInfoJS userInfoJS =
          RCIMIWUserInfoJS(dartToJS(userInfo.toJson()));
      js_util.setProperty(jsObject, 'userInfo', userInfoJS);
    }

    final RCIMIWMentionedInfo? mentionedInfo = message.mentionedInfo;
    if (mentionedInfo != null) {
      RCIMIWMentionedInfoJS mentionedInfoJS =
          RCIMIWMentionedInfoJS(dartToJS(mentionedInfo.toJson()));
      js_util.setProperty(jsObject, 'mentionedInfo', mentionedInfoJS);
    }

    final RCIMIWMessagePushOptions? pushOptions = message.pushOptions;
    if (pushOptions != null) {
      RCIMIWMessagePushOptionsJS pushOptionsJS =
          RCIMIWMessagePushOptionsJS(dartToJS(pushOptions.toJson()));
      if (pushOptions.iOSPushOptions != null) {
        RCIMIWIOSPushOptionsJS iOSPushOptions = RCIMIWIOSPushOptionsJS(
            dartToJS(pushOptions.iOSPushOptions?.toJson()));
        pushOptionsJS.iOSPushOptions = iOSPushOptions;
      }
      if (pushOptions.androidPushOptions != null) {
        RCIMIWAndroidPushOptionsJS androidPushOptions =
            RCIMIWAndroidPushOptionsJS(
                dartToJS(pushOptions.androidPushOptions?.toJson()));
        pushOptionsJS.androidPushOptions = androidPushOptions;
      }
      js_util.setProperty(jsObject, 'pushOptions', pushOptionsJS);
    }

    final Map? expansion = message.expansion;
    if (expansion != null) {
      js_util.setProperty(jsObject, 'expansion', toJSMap(expansion));
    }

    final RCIMIWGroupReadReceiptInfo? readReceiptInfo =
        message.groupReadReceiptInfo;
    if (readReceiptInfo != null) {
      RCIMIWGroupReadReceiptInfoJS readReceiptInfoJS =
          RCIMIWGroupReadReceiptInfoJS(dartToJS(readReceiptInfo.toJson()));
      readReceiptInfoJS.respondUserIds =
          toJSMap(readReceiptInfo.respondUserIds);
      js_util.setProperty(jsObject, 'groupReadReceiptInfo', readReceiptInfoJS);
    }

    if (message is RCIMIWMediaMessage) {
      js_util.setProperty(jsObject, 'file', message.file);
    }

    // 创建一个新的 jsMessage, 发送的时候传给 js 侧。
    if (message is RCIMIWTextMessage) {
      return RCIMIWTextMessageJS(jsObject);
    }
    if (message is RCIMIWVoiceMessage) {
      return RCIMIWVoiceMessageJS(jsObject);
    }
    if (message is RCIMIWImageMessage) {
      return RCIMIWImageMessageJS(jsObject);
    }
    if (message is RCIMIWFileMessage) {
      return RCIMIWFileMessageJS(jsObject);
    }
    if (message is RCIMIWSightMessage) {
      return RCIMIWSightMessageJS(jsObject);
    }
    if (message is RCIMIWGIFMessage) {
      return RCIMIWGIFMessageJS(jsObject);
    }
    if (message is RCIMIWReferenceMessage) {
      // 转换 referenceMessage 为 js 中的 message
      RCIMIWReferenceMessage m = message;
      final RCIMIWMessage? referenceMessage = m.referenceMessage;
      RCIMIWMessageJS referenceMessageJS = _toJsMessage(referenceMessage);
      js_util.setProperty(jsObject, 'referenceMessage', referenceMessageJS);
      return RCIMIWReferenceMessageJS(jsObject);
    }
    if (message is RCIMIWLocationMessage) {
      js_util.setProperty(
          jsObject, 'thumbnailBase64String', message.thumbnailBase64);
      return RCIMIWLocationMessageJS(jsObject);
    }
    if (message is RCIMIWCustomMessage) {
      js_util.setProperty(jsObject, 'fields', toJSMap(message.fields));
      return RCIMIWCustomMessageJS(jsObject);
    }
    if (message is RCIMIWUnknownMessage) {
      return RCIMIWUnknownMessageJS(jsObject);
    }
    log('message is error');
    return null;
  }
}
