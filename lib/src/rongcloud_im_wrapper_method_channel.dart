import 'dart:developer';

import 'package:flutter/services.dart';
import 'rongcloud_im_wrapper_platform_interface.dart';
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin/src/rongcloud_im_converter.dart';

class RCIMWrapperMethodChannel extends RCIMWrapperPlatform {
  final MethodChannel _channel;

  RCIMWrapperMethodChannel() : _channel = const MethodChannel('cn.rongcloud.im.flutter/RCIMIWEngine') {
    _channel.setMethodCallHandler(_handler);
  }

  static final Map _callbacks = {};

  static int _seqId = 0;

  static int getSeqId() {
    _seqId++;
    return _seqId;
  }

  static int addCallback(dynamic cb) {
    if (cb != null) {
      int timestamp = getSeqId();
      _callbacks[timestamp] = cb;
      return timestamp;
    } else {
      return -1;
    }
  }

  static T? getCallback<T>(int timestamp) {
    return _callbacks[timestamp];
  }

  static T? takeCallback<T>(int timestamp) {
    T? cb = _callbacks[timestamp];
    if (cb != null) {
      _callbacks.remove(timestamp);
    }
    return cb;
  }

  @override
  Future<void> create(String appKey, RCIMIWEngineOptions options) async {
    Map<String, dynamic> arguments = {"appKey": appKey, "options": options.toJson()};
    await _channel.invokeMethod('engine:create', arguments);
  }

  @override
  Future<void> destroy() async {
    await _channel.invokeMethod('engine:destroy');
  }

  @override
  Future<int> registerNativeCustomMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    Map<String, dynamic> arguments = {"messageIdentifier": messageIdentifier, "persistentFlag": persistentFlag.index};
    log("[RC:Flutter] engine:registerNativeCustomMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:registerNativeCustomMessage', arguments);
    return result;
  }

  @override
  Future<int> registerNativeCustomMediaMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    Map<String, dynamic> arguments = {"messageIdentifier": messageIdentifier, "persistentFlag": persistentFlag.index};
    log("[RC:Flutter] engine:registerNativeCustomMediaMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:registerNativeCustomMediaMessage', arguments);
    return result;
  }

  @override
  Future<int> connect(String token, int timeout, {RCIMIWConnectCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"token": token, "timeout": timeout, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:connect arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:connect', arguments);
    return result;
  }

  @override
  Future<int> disconnect(bool receivePush) async {
    Map<String, dynamic> arguments = {"receivePush": receivePush};
    log("[RC:Flutter] engine:disconnect arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:disconnect', arguments);
    return result;
  }

  @override
  Future<RCIMIWConnectionStatus> getConnectionStatus() async {
    log("[RC:Flutter] engine:getConnectionStatus");
    int result = await _channel.invokeMethod('engine:getConnectionStatus');
    return RCIMIWConnectionStatus.values[result];
  }

  @override
  Future<RCIMIWTextMessage?> createTextMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String text,
  ) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId, "text": text};
    log("[RC:Flutter] engine:createTextMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createTextMessage', arguments);
    return RCIMIWTextMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWImageMessage?> createImageMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId, "path": path};
    log("[RC:Flutter] engine:createImageMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createImageMessage', arguments);
    return RCIMIWImageMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWFileMessage?> createFileMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId, "path": path};
    log("[RC:Flutter] engine:createFileMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createFileMessage', arguments);
    return RCIMIWFileMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWSightMessage?> createSightMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "path": path,
      "duration": duration,
    };
    log("[RC:Flutter] engine:createSightMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createSightMessage', arguments);
    return RCIMIWSightMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWVoiceMessage?> createVoiceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "path": path,
      "duration": duration,
    };
    log("[RC:Flutter] engine:createVoiceMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createVoiceMessage', arguments);
    return RCIMIWVoiceMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWReferenceMessage?> createReferenceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWMessage referenceMessage,
    String text,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "referenceMessage": referenceMessage.toJson(),
      "text": text,
    };
    log("[RC:Flutter] engine:createReferenceMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createReferenceMessage', arguments);
    return RCIMIWReferenceMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWGIFMessage?> createGIFMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId, "path": path};
    log("[RC:Flutter] engine:createGIFMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createGIFMessage', arguments);
    return RCIMIWGIFMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWCustomMessage?> createCustomMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWCustomMessagePolicy policy,
    String messageIdentifier,
    Map fields,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "policy": policy.index,
      "messageIdentifier": messageIdentifier,
      "fields": fields,
    };
    log("[RC:Flutter] engine:createCustomMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createCustomMessage', arguments);
    return RCIMIWCustomMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWLocationMessage?> createLocationMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    double longitude,
    double latitude,
    String poiName,
    String thumbnailPath,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "longitude": longitude,
      "latitude": latitude,
      "poiName": poiName,
      "thumbnailPath": thumbnailPath,
    };
    log("[RC:Flutter] engine:createLocationMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createLocationMessage', arguments);
    return RCIMIWLocationMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWNativeCustomMessage?> createNativeCustomMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String messageIdentifier,
    Map fields,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "messageIdentifier": messageIdentifier,
      "fields": fields,
    };
    log("[RC:Flutter] engine:createNativeCustomMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createNativeCustomMessage', arguments);
    return RCIMIWNativeCustomMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<RCIMIWNativeCustomMediaMessage?> createNativeCustomMediaMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String messageIdentifier,
    String path,
    Map fields,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "messageIdentifier": messageIdentifier,
      "path": path,
      "fields": fields,
    };
    log("[RC:Flutter] engine:createNativeCustomMediaMessage arguments: " + arguments.toString());
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:createNativeCustomMediaMessage', arguments);
    return RCIMIWNativeCustomMediaMessage.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<int> sendMessage(RCIMIWMessage message, {RCIMIWSendMessageCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:sendMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendMessage', arguments);
    return result;
  }

  @override
  Future<int> sendMediaMessage(RCIMIWMediaMessage message, {RCIMIWSendMediaMessageListener? listener}) async {
    int rongcloudHandler = addCallback(listener);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:sendMediaMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendMediaMessage', arguments);
    return result;
  }

  @override
  Future<int> cancelSendingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelSendingMediaMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:cancelSendingMediaMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:cancelSendingMediaMessage', arguments);
    return result;
  }

  @override
  Future<int> downloadMediaMessage(RCIMIWMediaMessage message, {RCIMIWDownloadMediaMessageListener? listener}) async {
    int rongcloudHandler = addCallback(listener);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:downloadMediaMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:downloadMediaMessage', arguments);
    return result;
  }

  @override
  Future<int> cancelDownloadingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelDownloadingMediaMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:cancelDownloadingMediaMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:cancelDownloadingMediaMessage', arguments);
    return result;
  }

  @override
  Future<int> loadConversation(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadConversation arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadConversation', arguments);
    return result;
  }

  @override
  Future<int> getConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getConversation arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversation', arguments);
    return result;
  }

  @override
  Future<int> loadConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count,
  ) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "startTime": startTime,
      "count": count,
    };
    log("[RC:Flutter] engine:loadConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadConversations', arguments);
    return result;
  }

  @override
  Future<int> getConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "startTime": startTime,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversations', arguments);
    return result;
  }

  @override
  Future<int> getConversationsWithPriority(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count,
    bool topPriority, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "startTime": startTime,
      "count": count,
      "topPriority": topPriority,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getConversationsWithPriority arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversationsWithPriority', arguments);
    return result;
  }

  @override
  Future<int> getUnreadConversations(
    List<RCIMIWConversationType> conversationTypes, {
    IRCIMIWGetUnreadConversationsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"conversationTypes": conversationTypesStr, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUnreadConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUnreadConversations', arguments);
    return result;
  }

  @override
  Future<int> removeConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWRemoveConversationCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:removeConversation arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeConversation', arguments);
    return result;
  }

  @override
  Future<int> removeConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWRemoveConversationsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:removeConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeConversations', arguments);
    return result;
  }

  @override
  Future<int> loadUnreadCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> getUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadCountCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> loadTotalUnreadCount(String? channelId) async {
    Map<String, dynamic> arguments = {"channelId": channelId};
    log("[RC:Flutter] engine:loadTotalUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadTotalUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> getTotalUnreadCount(String? channelId, {IRCIMIWGetTotalUnreadCountCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"channelId": channelId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getTotalUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getTotalUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> loadUnreadMentionedCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadUnreadMentionedCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUnreadMentionedCount', arguments);
    return result;
  }

  @override
  Future<int> getUnreadMentionedCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedCountCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getUnreadMentionedCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUnreadMentionedCount', arguments);
    return result;
  }

  @override
  Future<int> loadUltraGroupAllUnreadCount() async {
    log("[RC:Flutter] engine:loadUltraGroupAllUnreadCount");
    int result = await _channel.invokeMethod('engine:loadUltraGroupAllUnreadCount');
    return result;
  }

  @override
  Future<int> getUltraGroupAllUnreadCount({IRCIMIWGetUltraGroupAllUnreadCountCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUltraGroupAllUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUltraGroupAllUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> loadUltraGroupAllUnreadMentionedCount() async {
    log("[RC:Flutter] engine:loadUltraGroupAllUnreadMentionedCount");
    int result = await _channel.invokeMethod('engine:loadUltraGroupAllUnreadMentionedCount');
    return result;
  }

  @override
  Future<int> getUltraGroupAllUnreadMentionedCount({
    IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUltraGroupAllUnreadMentionedCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUltraGroupAllUnreadMentionedCount', arguments);
    return result;
  }

  @override
  Future<int> loadUltraGroupUnreadCount(String targetId) async {
    Map<String, dynamic> arguments = {"targetId": targetId};
    log("[RC:Flutter] engine:loadUltraGroupUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUltraGroupUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> getUltraGroupUnreadCount(String targetId, {IRCIMIWGetUltraGroupUnreadCountCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUltraGroupUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUltraGroupUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> loadUltraGroupUnreadMentionedCount(String targetId) async {
    Map<String, dynamic> arguments = {"targetId": targetId};
    log("[RC:Flutter] engine:loadUltraGroupUnreadMentionedCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUltraGroupUnreadMentionedCount', arguments);
    return result;
  }

  @override
  Future<int> getUltraGroupUnreadMentionedCount(
    String targetId, {
    IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUltraGroupUnreadMentionedCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUltraGroupUnreadMentionedCount', arguments);
    return result;
  }

  @override
  Future<int> loadUnreadCountByConversationTypes(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    bool contain,
  ) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "contain": contain,
    };
    log("[RC:Flutter] engine:loadUnreadCountByConversationTypes arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUnreadCountByConversationTypes', arguments);
    return result;
  }

  @override
  Future<int> getUnreadCountByConversationTypes(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    bool contain, {
    IRCIMIWGetUnreadCountByConversationTypesCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "contain": contain,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getUnreadCountByConversationTypes arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUnreadCountByConversationTypes', arguments);
    return result;
  }

  @override
  Future<int> getUnreadCountByLevels(
    List<RCIMIWConversationType> conversationTypes,
    List<RCIMIWPushNotificationLevel> levels, {
    IRCIMIWGetUnreadCountByLevelsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    List levelsStr = [];
    for (var element in levels) {
      levelsStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "levels": levelsStr,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getUnreadCountByLevels arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUnreadCountByLevels', arguments);
    return result;
  }

  @override
  Future<int> clearUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWClearUnreadCountCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:clearUnreadCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearUnreadCount', arguments);
    return result;
  }

  @override
  Future<int> saveDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String draft, {
    IRCIMIWSaveDraftMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "draft": draft,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:saveDraftMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:saveDraftMessage', arguments);
    return result;
  }

  @override
  Future<int> loadDraftMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadDraftMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadDraftMessage', arguments);
    return result;
  }

  @override
  Future<int> getDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetDraftMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getDraftMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getDraftMessage', arguments);
    return result;
  }

  @override
  Future<int> clearDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWClearDraftMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:clearDraftMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearDraftMessage', arguments);
    return result;
  }

  @override
  Future<int> loadBlockedConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {"conversationTypes": conversationTypesStr, "channelId": channelId};
    log("[RC:Flutter] engine:loadBlockedConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadBlockedConversations', arguments);
    return result;
  }

  @override
  Future<int> getBlockedConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetBlockedConversationsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getBlockedConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getBlockedConversations', arguments);
    return result;
  }

  @override
  Future<int> changeConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    bool top, {
    IRCIMIWChangeConversationTopStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "top": top,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeConversationTopStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeConversationTopStatus', arguments);
    return result;
  }

  @override
  Future<int> changeConversationTopStatusWithUpdateTme(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    bool top,
    bool updateOperationTime, {
    IRCIMIWChangeConversationTopStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "top": top,
      "updateOperationTime": updateOperationTime,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeConversationTopStatusWithUpdateTme arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeConversationTopStatusWithUpdateTme', arguments);
    return result;
  }

  @override
  Future<int> loadConversationTopStatus(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadConversationTopStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadConversationTopStatus', arguments);
    return result;
  }

  @override
  Future<int> getConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationTopStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getConversationTopStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversationTopStatus', arguments);
    return result;
  }

  @override
  Future<int> syncConversationReadStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSyncConversationReadStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:syncConversationReadStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:syncConversationReadStatus', arguments);
    return result;
  }

  @override
  Future<int> sendTypingStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String currentType,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "currentType": currentType,
    };
    log("[RC:Flutter] engine:sendTypingStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendTypingStatus', arguments);
    return result;
  }

  @override
  Future<int> loadMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int sentTime,
    RCIMIWTimeOrder order,
    RCIMIWMessageOperationPolicy policy,
    int count,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "sentTime": sentTime,
      "order": order.index,
      "policy": policy.index,
      "count": count,
    };
    log("[RC:Flutter] engine:loadMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadMessages', arguments);
    return result;
  }

  @override
  Future<int> getMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int sentTime,
    RCIMIWTimeOrder order,
    RCIMIWMessageOperationPolicy policy,
    int count, {
    IRCIMIWGetMessagesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "sentTime": sentTime,
      "order": order.index,
      "policy": policy.index,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getMessages', arguments);
    return result;
  }

  @override
  Future<int> getMessageById(int messageId, {IRCIMIWGetMessageCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageId": messageId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getMessageById arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getMessageById', arguments);
    return result;
  }

  @override
  Future<int> getMessageByUId(String messageUId, {IRCIMIWGetMessageCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageUId": messageUId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getMessageByUId arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getMessageByUId', arguments);
    return result;
  }

  @override
  Future<int> getMessagesAroundTime(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int sentTime,
    int beforeCount,
    int afterCount, {
    IRCIMIWGetMessagesAroundTimeCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "sentTime": sentTime,
      "beforeCount": beforeCount,
      "afterCount": afterCount,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getMessagesAroundTime arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getMessagesAroundTime', arguments);
    return result;
  }

  @override
  Future<int> getLocalMessagesByMessageTypes(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    List<RCIMIWMessageType> messageTypes,
    int sentTime,
    RCIMIWTimeOrder order,
    int count, {
    IRCIMIWGetMessagesCallback? callback,
  }) async {
    List messageTypesStr = [];
    for (var element in messageTypes) {
      messageTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "messageTypes": messageTypesStr,
      "sentTime": sentTime,
      "order": order.index,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getLocalMessagesByMessageTypes arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getLocalMessagesByMessageTypes', arguments);
    return result;
  }

  @override
  Future<int> loadFirstUnreadMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadFirstUnreadMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadFirstUnreadMessage', arguments);
    return result;
  }

  @override
  Future<int> getFirstUnreadMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetFirstUnreadMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getFirstUnreadMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getFirstUnreadMessage', arguments);
    return result;
  }

  @override
  Future<int> loadUnreadMentionedMessages(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadUnreadMentionedMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUnreadMentionedMessages', arguments);
    return result;
  }

  @override
  Future<int> getUnreadMentionedMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedMessagesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getUnreadMentionedMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUnreadMentionedMessages', arguments);
    return result;
  }

  @override
  Future<int> insertMessage(RCIMIWMessage message, {IRCIMIWInsertMessageCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:insertMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:insertMessage', arguments);
    return result;
  }

  @override
  Future<int> insertMessages(List<RCIMIWMessage> messages, {IRCIMIWInsertMessagesCallback? callback}) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messages": messagesStr, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:insertMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:insertMessages', arguments);
    return result;
  }

  @override
  Future<int> clearMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy, {
    IRCIMIWClearMessagesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "policy": policy.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:clearMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearMessages', arguments);
    return result;
  }

  @override
  Future<int> deleteLocalMessages(List<RCIMIWMessage> messages, {IRCIMIWDeleteLocalMessagesCallback? callback}) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messages": messagesStr, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:deleteLocalMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:deleteLocalMessages', arguments);
    return result;
  }

  @override
  Future<int> deleteLocalMessageByIds(List<int> messageIds, {IRCIMIWDeleteLocalMessageByIdsCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageIds": messageIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:deleteLocalMessageByIds arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:deleteLocalMessageByIds', arguments);
    return result;
  }

  @override
  Future<int> deleteMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWDeleteMessagesCallback? callback,
  }) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "messages": messagesStr,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:deleteMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:deleteMessages', arguments);
    return result;
  }

  @override
  Future<int> recallMessage(RCIMIWMessage message, {IRCIMIWRecallMessageCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:recallMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:recallMessage', arguments);
    return result;
  }

  @override
  Future<int> sendPrivateReadReceiptMessage(
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSendPrivateReadReceiptMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:sendPrivateReadReceiptMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendPrivateReadReceiptMessage', arguments);
    return result;
  }

  @override
  Future<int> sendGroupReadReceiptRequest(
    RCIMIWMessage message, {
    IRCIMIWSendGroupReadReceiptRequestCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"message": message.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:sendGroupReadReceiptRequest arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendGroupReadReceiptRequest', arguments);
    return result;
  }

  @override
  Future<int> sendGroupReadReceiptResponse(
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWSendGroupReadReceiptResponseCallback? callback,
  }) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "messages": messagesStr,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:sendGroupReadReceiptResponse arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendGroupReadReceiptResponse', arguments);
    return result;
  }

  @override
  Future<int> updateMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateMessageExpansionCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageUId": messageUId, "expansion": expansion, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:updateMessageExpansion arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:updateMessageExpansion', arguments);
    return result;
  }

  @override
  Future<int> removeMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveMessageExpansionForKeysCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageUId": messageUId, "keys": keys, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeMessageExpansionForKeys arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeMessageExpansionForKeys', arguments);
    return result;
  }

  @override
  Future<int> changeMessageSentStatus(
    int messageId,
    RCIMIWSentStatus sentStatus, {
    IRCIMIWChangeMessageSentStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "messageId": messageId,
      "sentStatus": sentStatus.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeMessageSentStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeMessageSentStatus', arguments);
    return result;
  }

  @override
  Future<int> changeMessageReceiveStatus(
    int messageId,
    RCIMIWReceivedStatus receivedStatus, {
    IRCIMIWChangeMessageReceivedStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "messageId": messageId,
      "receivedStatus": receivedStatus.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeMessageReceiveStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeMessageReceiveStatus', arguments);
    return result;
  }

  @override
  Future<int> changeMessageReceiveStatusInfo(
    int messageId,
    RCIMIWReceivedStatusInfo receivedStatusInfo, {
    IRCIMIWChangeMessageReceivedStatusInfoCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "messageId": messageId,
      "receivedStatusInfo": receivedStatusInfo.toJson(),
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeMessageReceiveStatusInfo arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeMessageReceiveStatusInfo', arguments);
    return result;
  }

  @override
  Future<int> updateMessageLocalExtra(
    int messageId,
    String extra, {
    IRCIMIWUpdateMessageLocalExtraCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageId": messageId, "extra": extra, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:updateMessageLocalExtra arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:updateMessageLocalExtra', arguments);
    return result;
  }

  @override
  Future<int> joinChatRoom(
    String targetId,
    int messageCount,
    bool autoCreate, {
    IRCIMIWJoinChatRoomCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "messageCount": messageCount,
      "autoCreate": autoCreate,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:joinChatRoom arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:joinChatRoom', arguments);
    return result;
  }

  @override
  Future<int> leaveChatRoom(String targetId, {IRCIMIWLeaveChatRoomCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:leaveChatRoom arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:leaveChatRoom', arguments);
    return result;
  }

  @override
  Future<int> loadChatRoomMessages(String targetId, int timestamp, RCIMIWTimeOrder order, int count) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "timestamp": timestamp,
      "order": order.index,
      "count": count,
    };
    log("[RC:Flutter] engine:loadChatRoomMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadChatRoomMessages', arguments);
    return result;
  }

  @override
  Future<int> getChatRoomMessages(
    String targetId,
    int timestamp,
    RCIMIWTimeOrder order,
    int count, {
    IRCIMIWGetChatRoomMessagesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "timestamp": timestamp,
      "order": order.index,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getChatRoomMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getChatRoomMessages', arguments);
    return result;
  }

  @override
  Future<int> addChatRoomEntry(
    String targetId,
    String key,
    String value,
    bool deleteWhenLeft,
    bool overwrite, {
    IRCIMIWAddChatRoomEntryCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "key": key,
      "value": value,
      "deleteWhenLeft": deleteWhenLeft,
      "overwrite": overwrite,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:addChatRoomEntry arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:addChatRoomEntry', arguments);
    return result;
  }

  @override
  Future<int> addChatRoomEntries(
    String targetId,
    Map entries,
    bool deleteWhenLeft,
    bool overwrite, {
    IRCIMIWAddChatRoomEntriesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "entries": entries,
      "deleteWhenLeft": deleteWhenLeft,
      "overwrite": overwrite,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:addChatRoomEntries arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:addChatRoomEntries', arguments);
    return result;
  }

  @override
  Future<int> loadChatRoomEntry(String targetId, String key) async {
    Map<String, dynamic> arguments = {"targetId": targetId, "key": key};
    log("[RC:Flutter] engine:loadChatRoomEntry arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadChatRoomEntry', arguments);
    return result;
  }

  @override
  Future<int> getChatRoomEntry(String targetId, String key, {IRCIMIWGetChatRoomEntryCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "key": key, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getChatRoomEntry arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getChatRoomEntry', arguments);
    return result;
  }

  @override
  Future<int> loadChatRoomAllEntries(String targetId) async {
    Map<String, dynamic> arguments = {"targetId": targetId};
    log("[RC:Flutter] engine:loadChatRoomAllEntries arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadChatRoomAllEntries', arguments);
    return result;
  }

  @override
  Future<int> getChatRoomAllEntries(String targetId, {IRCIMIWGetChatRoomAllEntriesCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getChatRoomAllEntries arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getChatRoomAllEntries', arguments);
    return result;
  }

  @override
  Future<int> removeChatRoomEntry(
    String targetId,
    String key,
    bool force, {
    IRCIMIWRemoveChatRoomEntryCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "key": key, "force": force, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeChatRoomEntry arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeChatRoomEntry', arguments);
    return result;
  }

  @override
  Future<int> removeChatRoomEntries(
    String targetId,
    List<String> keys,
    bool force, {
    IRCIMIWRemoveChatRoomEntriesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "keys": keys,
      "force": force,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:removeChatRoomEntries arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeChatRoomEntries', arguments);
    return result;
  }

  @override
  Future<int> addToBlacklist(String userId, {IRCIMIWAddToBlacklistCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"userId": userId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:addToBlacklist arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:addToBlacklist', arguments);
    return result;
  }

  @override
  Future<int> removeFromBlacklist(String userId, {IRCIMIWRemoveFromBlacklistCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"userId": userId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeFromBlacklist arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeFromBlacklist', arguments);
    return result;
  }

  @override
  Future<int> loadBlacklistStatus(String userId) async {
    Map<String, dynamic> arguments = {"userId": userId};
    log("[RC:Flutter] engine:loadBlacklistStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadBlacklistStatus', arguments);
    return result;
  }

  @override
  Future<int> getBlacklistStatus(String userId, {IRCIMIWGetBlacklistStatusCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"userId": userId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getBlacklistStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getBlacklistStatus', arguments);
    return result;
  }

  @override
  Future<int> loadBlacklist() async {
    log("[RC:Flutter] engine:loadBlacklist");
    int result = await _channel.invokeMethod('engine:loadBlacklist');
    return result;
  }

  @override
  Future<int> getBlacklist({IRCIMIWGetBlacklistCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getBlacklist arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getBlacklist', arguments);
    return result;
  }

  @override
  Future<int> searchMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String keyword,
    int startTime,
    int count, {
    IRCIMIWSearchMessagesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "keyword": keyword,
      "startTime": startTime,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:searchMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchMessages', arguments);
    return result;
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
    int count, {
    IRCIMIWSearchMessagesByTimeRangeCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "keyword": keyword,
      "startTime": startTime,
      "endTime": endTime,
      "offset": offset,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:searchMessagesByTimeRange arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchMessagesByTimeRange', arguments);
    return result;
  }

  @override
  Future<int> searchMessagesByUserId(
    String userId,
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int startTime,
    int count, {
    IRCIMIWSearchMessagesByUserIdCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "userId": userId,
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "startTime": startTime,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:searchMessagesByUserId arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchMessagesByUserId', arguments);
    return result;
  }

  @override
  Future<int> searchMessagesByMessageTypes(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    List<RCIMIWMessageType> messageTypes,
    String keyword,
    int startTime,
    int count, {
    IRCIMIWSearchMessagesByMessageTypesCallback? callback,
  }) async {
    List messageTypesStr = [];
    for (var element in messageTypes) {
      messageTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "messageTypes": messageTypesStr,
      "keyword": keyword,
      "startTime": startTime,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:searchMessagesByMessageTypes arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchMessagesByMessageTypes', arguments);
    return result;
  }

  @override
  Future<int> searchConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    List<RCIMIWMessageType> messageTypes,
    String keyword, {
    IRCIMIWSearchConversationsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    List messageTypesStr = [];
    for (var element in messageTypes) {
      messageTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "messageTypes": messageTypesStr,
      "keyword": keyword,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:searchConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchConversations', arguments);
    return result;
  }

  @override
  Future<int> changeNotificationQuietHours(
    String startTime,
    int spanMinutes,
    RCIMIWPushNotificationQuietHoursLevel level, {
    IRCIMIWChangeNotificationQuietHoursCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "startTime": startTime,
      "spanMinutes": spanMinutes,
      "level": level.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeNotificationQuietHours arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeNotificationQuietHours', arguments);
    return result;
  }

  @override
  Future<int> removeNotificationQuietHours({IRCIMIWRemoveNotificationQuietHoursCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeNotificationQuietHours arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeNotificationQuietHours', arguments);
    return result;
  }

  @override
  Future<int> loadNotificationQuietHours() async {
    log("[RC:Flutter] engine:loadNotificationQuietHours");
    int result = await _channel.invokeMethod('engine:loadNotificationQuietHours');
    return result;
  }

  @override
  Future<int> getNotificationQuietHours({IRCIMIWGetNotificationQuietHoursCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getNotificationQuietHours arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getNotificationQuietHours', arguments);
    return result;
  }

  @override
  Future<int> changeConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeConversationNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "level": level.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeConversationNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeConversationNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> loadConversationNotificationLevel(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadConversationNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadConversationNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> getConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getConversationNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversationNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> changeConversationTypeNotificationLevel(
    RCIMIWConversationType type,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeConversationTypeNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"type": type.index, "level": level.index, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:changeConversationTypeNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeConversationTypeNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> loadConversationTypeNotificationLevel(RCIMIWConversationType type) async {
    Map<String, dynamic> arguments = {"type": type.index};
    log("[RC:Flutter] engine:loadConversationTypeNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadConversationTypeNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> getConversationTypeNotificationLevel(
    RCIMIWConversationType type, {
    IRCIMIWGetConversationTypeNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"type": type.index, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getConversationTypeNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversationTypeNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> changeUltraGroupDefaultNotificationLevel(
    String targetId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "level": level.index, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:changeUltraGroupDefaultNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeUltraGroupDefaultNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> loadUltraGroupDefaultNotificationLevel(String targetId) async {
    Map<String, dynamic> arguments = {"targetId": targetId};
    log("[RC:Flutter] engine:loadUltraGroupDefaultNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUltraGroupDefaultNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> getUltraGroupDefaultNotificationLevel(
    String targetId, {
    IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUltraGroupDefaultNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUltraGroupDefaultNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> changeUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "level": level.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeUltraGroupChannelDefaultNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeUltraGroupChannelDefaultNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> loadUltraGroupChannelDefaultNotificationLevel(String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadUltraGroupChannelDefaultNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadUltraGroupChannelDefaultNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> getUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId, {
    IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "channelId": channelId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUltraGroupChannelDefaultNotificationLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUltraGroupChannelDefaultNotificationLevel', arguments);
    return result;
  }

  @override
  Future<int> changePushContentShowStatus(
    bool showContent, {
    IRCIMIWChangePushContentShowStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"showContent": showContent, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:changePushContentShowStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changePushContentShowStatus', arguments);
    return result;
  }

  @override
  Future<int> changePushLanguage(String language, {IRCIMIWChangePushLanguageCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"language": language, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:changePushLanguage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changePushLanguage', arguments);
    return result;
  }

  @override
  Future<int> changePushReceiveStatus(bool receive, {IRCIMIWChangePushReceiveStatusCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"receive": receive, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:changePushReceiveStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changePushReceiveStatus', arguments);
    return result;
  }

  @override
  Future<int> sendGroupMessageToDesignatedUsers(
    RCIMIWMessage message,
    List<String> userIds, {
    RCIMIWSendGroupMessageToDesignatedUsersCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"message": message.toJson(), "userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:sendGroupMessageToDesignatedUsers arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendGroupMessageToDesignatedUsers', arguments);
    return result;
  }

  @override
  Future<int> loadMessageCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "channelId": channelId};
    log("[RC:Flutter] engine:loadMessageCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadMessageCount', arguments);
    return result;
  }

  @override
  Future<int> getMessageCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetMessageCountCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getMessageCount arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getMessageCount', arguments);
    return result;
  }

  @override
  Future<int> loadTopConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {"conversationTypes": conversationTypesStr, "channelId": channelId};
    log("[RC:Flutter] engine:loadTopConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadTopConversations', arguments);
    return result;
  }

  @override
  Future<int> getTopConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetTopConversationsCallback? callback,
  }) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getTopConversations arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getTopConversations', arguments);
    return result;
  }

  @override
  Future<int> syncUltraGroupReadStatus(
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSyncUltraGroupReadStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:syncUltraGroupReadStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:syncUltraGroupReadStatus', arguments);
    return result;
  }

  @override
  Future<int> loadConversationsForAllChannel(RCIMIWConversationType type, String targetId) async {
    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId};
    log("[RC:Flutter] engine:loadConversationsForAllChannel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadConversationsForAllChannel', arguments);
    return result;
  }

  @override
  Future<int> getConversationsForAllChannel(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationsForAllChannelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getConversationsForAllChannel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversationsForAllChannel', arguments);
    return result;
  }

  @override
  Future<int> modifyUltraGroupMessage(
    String messageUId,
    RCIMIWMessage message, {
    IRCIMIWModifyUltraGroupMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "messageUId": messageUId,
      "message": message.toJson(),
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:modifyUltraGroupMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:modifyUltraGroupMessage', arguments);
    return result;
  }

  @override
  Future<int> recallUltraGroupMessage(
    RCIMIWMessage message,
    bool deleteRemote, {
    IRCIMIWRecallUltraGroupMessageCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "message": message.toJson(),
      "deleteRemote": deleteRemote,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:recallUltraGroupMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:recallUltraGroupMessage', arguments);
    return result;
  }

  @override
  Future<int> clearUltraGroupMessages(
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy, {
    IRCIMIWClearUltraGroupMessagesCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "policy": policy.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:clearUltraGroupMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearUltraGroupMessages', arguments);
    return result;
  }

  @override
  Future<int> sendUltraGroupTypingStatus(
    String targetId,
    String? channelId,
    RCIMIWUltraGroupTypingStatus typingStatus, {
    IRCIMIWSendUltraGroupTypingStatusCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "typingStatus": typingStatus.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:sendUltraGroupTypingStatus arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendUltraGroupTypingStatus', arguments);
    return result;
  }

  @override
  Future<int> clearUltraGroupMessagesForAllChannel(
    String targetId,
    int timestamp, {
    IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"targetId": targetId, "timestamp": timestamp, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:clearUltraGroupMessagesForAllChannel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearUltraGroupMessagesForAllChannel', arguments);
    return result;
  }

  @override
  Future<int> loadBatchRemoteUltraGroupMessages(List<RCIMIWMessage> messages) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }

    Map<String, dynamic> arguments = {"messages": messagesStr};
    log("[RC:Flutter] engine:loadBatchRemoteUltraGroupMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadBatchRemoteUltraGroupMessages', arguments);
    return result;
  }

  @override
  Future<int> getBatchRemoteUltraGroupMessages(
    List<RCIMIWMessage> messages, {
    IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback,
  }) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messages": messagesStr, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getBatchRemoteUltraGroupMessages arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getBatchRemoteUltraGroupMessages', arguments);
    return result;
  }

  @override
  Future<int> updateUltraGroupMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageUId": messageUId, "expansion": expansion, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:updateUltraGroupMessageExpansion arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:updateUltraGroupMessageExpansion', arguments);
    return result;
  }

  @override
  Future<int> removeUltraGroupMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageUId": messageUId, "keys": keys, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeUltraGroupMessageExpansionForKeys arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeUltraGroupMessageExpansionForKeys', arguments);
    return result;
  }

  @override
  Future<int> changeLogLevel(RCIMIWLogLevel level) async {
    Map<String, dynamic> arguments = {"level": level.index};
    log("[RC:Flutter] engine:changeLogLevel arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeLogLevel', arguments);
    return result;
  }

  @override
  Future<int> getDeltaTime() async {
    log("[RC:Flutter] engine:getDeltaTime");
    int result = await _channel.invokeMethod('engine:getDeltaTime');
    return result;
  }

  @override
  Future<RCIMIWAppSettings?> getAppSettings() async {
    log("[RC:Flutter] engine:getAppSettings");
    Map<dynamic, dynamic> result = await _channel.invokeMethod('engine:getAppSettings');
    return RCIMIWAppSettings.fromJson(Map<String, dynamic>.from(result));
  }

  @override
  Future<int> createTag(String tagId, String tagName, {IRCIMIWCreateTagCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"tagId": tagId, "tagName": tagName, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:createTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:createTag', arguments);
    return result;
  }

  @override
  Future<int> removeTag(String tagId, {IRCIMIWRemoveTagCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"tagId": tagId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeTag', arguments);
    return result;
  }

  @override
  Future<int> updateTagNameById(String tagId, String newName, {IRCIMIWUpdateTagNameByIdCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"tagId": tagId, "newName": newName, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:updateTagNameById arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:updateTagNameById', arguments);
    return result;
  }

  @override
  Future<int> getTags({IRCIMIWGetTagsCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getTags arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getTags', arguments);
    return result;
  }

  @override
  Future<int> addConversationToTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWAddConversationToTagCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "tagId": tagId,
      "type": type.index,
      "targetId": targetId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:addConversationToTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:addConversationToTag', arguments);
    return result;
  }

  @override
  Future<int> removeConversationFromTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWRemoveConversationFromTagCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "tagId": tagId,
      "type": type.index,
      "targetId": targetId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:removeConversationFromTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeConversationFromTag', arguments);
    return result;
  }

  @override
  Future<int> removeTagsFromConversation(
    RCIMIWConversationType type,
    String targetId,
    List<String> tagIds, {
    IRCIMIWRemoveTagsFromConversationCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "tagIds": tagIds,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:removeTagsFromConversation arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeTagsFromConversation', arguments);
    return result;
  }

  @override
  Future<int> getTagsFromConversation(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetTagsFromConversationCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"type": type.index, "targetId": targetId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getTagsFromConversation arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getTagsFromConversation', arguments);
    return result;
  }

  @override
  Future<int> getConversationsFromTagByPage(
    String tagId,
    int timestamp,
    int count, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "tagId": tagId,
      "timestamp": timestamp,
      "count": count,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getConversationsFromTagByPage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversationsFromTagByPage', arguments);
    return result;
  }

  @override
  Future<int> getUnreadCountByTag(String tagId, bool contain, {IRCIMIWGetUnreadCountCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"tagId": tagId, "contain": contain, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUnreadCountByTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUnreadCountByTag', arguments);
    return result;
  }

  @override
  Future<int> changeConversationTopStatusInTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId,
    bool top, {
    IRCIMIWChangeConversationTopStatusInTagCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "tagId": tagId,
      "type": type.index,
      "targetId": targetId,
      "top": top,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:changeConversationTopStatusInTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:changeConversationTopStatusInTag', arguments);
    return result;
  }

  @override
  Future<int> getConversationTopStatusInTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationTopStatusInTagCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "tagId": tagId,
      "type": type.index,
      "targetId": targetId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getConversationTopStatusInTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getConversationTopStatusInTag', arguments);
    return result;
  }

  @override
  Future<int> clearMessagesUnreadStatusByTag(
    String tagId, {
    IRCIMIWClearMessagesUnreadStatusByTagCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"tagId": tagId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:clearMessagesUnreadStatusByTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearMessagesUnreadStatusByTag', arguments);
    return result;
  }

  @override
  Future<int> clearConversationsByTag(
    String tagId,
    bool deleteMessage, {
    IRCIMIWClearConversationsByTagCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"tagId": tagId, "deleteMessage": deleteMessage, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:clearConversationsByTag arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearConversationsByTag', arguments);
    return result;
  }

  @override
  Future<int> setModuleName(String moduleName, String version) async {
    Map<String, dynamic> arguments = {"moduleName": moduleName, "version": version};
    log("[RC:Flutter] engine:setModuleName arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:setModuleName', arguments);
    return result;
  }

  @override
  Future<int> writeLog(String method, String callMethod, int codeValue, String message) async {
    Map<String, dynamic> arguments = {
      "method": method,
      "callMethod": callMethod,
      "codeValue": codeValue,
      "message": message,
    };
    log("[RC:Flutter] engine:writeLog arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:writeLog', arguments);
    return result;
  }

  @override
  Future<int> createGroup(
    RCIMIWGroupInfo groupInfo,
    List<String> inviteeUserIds, {
    IRCIMIWCreateGroupCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupInfo": groupInfo.toJson(),
      "inviteeUserIds": inviteeUserIds,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:createGroup arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:createGroup', arguments);
    return result;
  }

  @override
  Future<int> updateGroupInfo(RCIMIWGroupInfo groupInfo, {IRCIMIWGroupInfoUpdatedCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupInfo": groupInfo.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:updateGroupInfo arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:updateGroupInfo', arguments);
    return result;
  }

  @override
  Future<int> getGroupsInfo(List<String> groupIds, {IRCIMIWGetGroupsInfoCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupIds": groupIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getGroupsInfo arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getGroupsInfo', arguments);
    return result;
  }

  @override
  Future<int> kickGroupMembers(
    String groupId,
    List<String> userIds,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWKickGroupMembersCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "userIds": userIds,
      "config": config.toJson(),
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:kickGroupMembers arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:kickGroupMembers', arguments);
    return result;
  }

  @override
  Future<int> joinGroup(String groupId, {IRCIMIWJoinGroupCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:joinGroup arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:joinGroup', arguments);
    return result;
  }

  @override
  Future<int> quitGroup(String groupId, RCIMIWQuitGroupConfig config, {IRCIMIWQuitGroupCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "config": config.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:quitGroup arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:quitGroup', arguments);
    return result;
  }

  @override
  Future<int> dismissGroup(String groupId, {IRCIMIWDismissGroupCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:dismissGroup arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:dismissGroup', arguments);
    return result;
  }

  @override
  Future<int> transferGroupOwner(
    String groupId,
    String newOwnerId,
    bool quitGroup,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWTransferGroupOwnerCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "newOwnerId": newOwnerId,
      "quitGroup": quitGroup,
      "config": config.toJson(),
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:transferGroupOwner arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:transferGroupOwner', arguments);
    return result;
  }

  @override
  Future<int> getGroupMembers(String groupId, List<String> userIds, {IRCIMIWGetGroupMembersCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getGroupMembers arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getGroupMembers', arguments);
    return result;
  }

  @override
  Future<int> getGroupMembersByRole(
    String groupId,
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetGroupMembersByRoleCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "role": role.index,
      "option": option.toJson(),
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getGroupMembersByRole arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getGroupMembersByRole', arguments);
    return result;
  }

  @override
  Future<int> getJoinedGroupsByRole(
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetJoinedGroupsByRoleCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"role": role.index, "option": option.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getJoinedGroupsByRole arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getJoinedGroupsByRole', arguments);
    return result;
  }

  @override
  Future<int> getJoinedGroups(List<String> groupIds, {IRCIMIWGetJoinedGroupsCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupIds": groupIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getJoinedGroups arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getJoinedGroups', arguments);
    return result;
  }

  @override
  Future<int> setGroupRemark(String groupId, String remark, {IRCIMIWSetGroupRemarkCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "remark": remark, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:setGroupRemark arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:setGroupRemark', arguments);
    return result;
  }

  @override
  Future<int> setGroupMemberInfo(
    String groupId,
    String userId,
    String nickname,
    String extra, {
    IRCIMIWSetGroupMemberInfoCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "userId": userId,
      "nickname": nickname,
      "extra": extra,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:setGroupMemberInfo arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:setGroupMemberInfo', arguments);
    return result;
  }

  @override
  Future<int> searchJoinedGroups(
    String groupName,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchJoinedGroupsCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupName": groupName,
      "option": option.toJson(),
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:searchJoinedGroups arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchJoinedGroups', arguments);
    return result;
  }

  @override
  Future<int> searchGroupMembers(
    String groupId,
    String name,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchGroupMembersCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "name": name,
      "option": option.toJson(),
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:searchGroupMembers arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchGroupMembers', arguments);
    return result;
  }

  @override
  Future<int> addGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWAddGroupManagersCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:addGroupManagers arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:addGroupManagers', arguments);
    return result;
  }

  @override
  Future<int> removeGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupManagersCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeGroupManagers arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeGroupManagers', arguments);
    return result;
  }

  @override
  Future<int> inviteUsersToGroup(
    String groupId,
    List<String> userIds, {
    IRCIMIWInviteUsersToGroupCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:inviteUsersToGroup arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:inviteUsersToGroup', arguments);
    return result;
  }

  @override
  Future<int> acceptGroupInvite(String groupId, String inviterId, {IRCIMIWAcceptGroupInviteCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "inviterId": inviterId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:acceptGroupInvite arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:acceptGroupInvite', arguments);
    return result;
  }

  @override
  Future<int> refuseGroupInvite(
    String groupId,
    String inviterId,
    String reason, {
    IRCIMIWRefuseGroupInviteCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "inviterId": inviterId,
      "reason": reason,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:refuseGroupInvite arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:refuseGroupInvite', arguments);
    return result;
  }

  @override
  Future<int> acceptGroupApplication(
    String groupId,
    String inviterId,
    String applicantId, {
    IRCIMIWAcceptGroupApplicationCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "inviterId": inviterId,
      "applicantId": applicantId,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:acceptGroupApplication arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:acceptGroupApplication', arguments);
    return result;
  }

  @override
  Future<int> refuseGroupApplication(
    String groupId,
    String inviterId,
    String applicantId,
    String reason, {
    IRCIMIWRefuseGroupApplicationCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "groupId": groupId,
      "inviterId": inviterId,
      "applicantId": applicantId,
      "reason": reason,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:refuseGroupApplication arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:refuseGroupApplication', arguments);
    return result;
  }

  @override
  Future<int> getGroupApplications(
    RCIMIWPagingQueryOption option,
    List<RCIMIWGroupApplicationDirection> directions,
    List<RCIMIWGroupApplicationStatus> status, {
    IRCIMIWGetGroupApplicationsCallback? callback,
  }) async {
    List directionsStr = [];
    for (var element in directions) {
      directionsStr.add(element.index);
    }

    List statusStr = [];
    for (var element in status) {
      statusStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "option": option.toJson(),
      "directions": directionsStr,
      "status": statusStr,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:getGroupApplications arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getGroupApplications', arguments);
    return result;
  }

  @override
  Future<int> addGroupFollows(String groupId, List<String> userIds, {IRCIMIWAddGroupFollowsCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:addGroupFollows arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:addGroupFollows', arguments);
    return result;
  }

  @override
  Future<int> removeGroupFollows(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupFollowsCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:removeGroupFollows arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:removeGroupFollows', arguments);
    return result;
  }

  @override
  Future<int> getGroupFollows(String groupId, {IRCIMIWGetGroupFollowsCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"groupId": groupId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getGroupFollows arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getGroupFollows', arguments);
    return result;
  }

  @override
  Future<int> setCheckChatRoomDuplicateMessage(bool enableCheck) async {
    Map<String, dynamic> arguments = {"enableCheck": enableCheck};
    log("[RC:Flutter] engine:setCheckChatRoomDuplicateMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:setCheckChatRoomDuplicateMessage', arguments);
    return result;
  }

  @override
  Future<int> translateMessagesWithParams(
    RCIMIWTranslateMessagesParams params, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"params": params.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:translateMessagesWithParams arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:translateMessagesWithParams', arguments);
    return result;
  }

  @override
  Future<int> translateTextsWithParams(
    RCIMIWTranslateTextParams params, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"params": params.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:translateTextsWithParams arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:translateTextsWithParams', arguments);
    return result;
  }

  @override
  Future<int> setTranslationLanguage(String language, {IRCIMIWTranslateResponseCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"language": language, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:setTranslationLanguage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:setTranslationLanguage', arguments);
    return result;
  }

  @override
  Future<int> getTranslationLanguage({IRCIMIWTranslateGetLanguageCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getTranslationLanguage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getTranslationLanguage', arguments);
    return result;
  }

  @override
  Future<int> setAutoTranslateEnable(bool isEnable, {IRCIMIWTranslateResponseCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"isEnable": isEnable, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:setAutoTranslateEnable arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:setAutoTranslateEnable', arguments);
    return result;
  }

  @override
  Future<int> getAutoTranslateEnabled({IRCIMIWGetAutoTranslateEnabledCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getAutoTranslateEnabled arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getAutoTranslateEnabled', arguments);
    return result;
  }

  @override
  Future<int> batchSetConversationTranslateStrategy(
    List<RCIMIWConversationType> types,
    List<String> targetIds,
    List<String> channelIds,
    RCIMIWTranslateStrategy strategy, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    List typesStr = [];
    for (var element in types) {
      typesStr.add(element.index);
    }
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "types": typesStr,
      "targetIds": targetIds,
      "channelIds": channelIds,
      "strategy": strategy.index,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:batchSetConversationTranslateStrategy arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:batchSetConversationTranslateStrategy', arguments);
    return result;
  }

  @override
  Future<String> calculateTextMD5(String text) async {
    Map<String, dynamic> arguments = {"text": text};
    log("[RC:Flutter] engine:calculateTextMD5 arguments: " + arguments.toString());
    String result = await _channel.invokeMethod('engine:calculateTextMD5', arguments);
    return result;
  }

  @override
  Future<int> updateMyUserProfileVisibility(
    RCIMIWUserProfileVisibility visibility, {
    IRCIMIWUpdateMyUserProfileVisibilityCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"visibility": visibility.index, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:updateMyUserProfileVisibility arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:updateMyUserProfileVisibility', arguments);
    return result;
  }

  @override
  Future<int> getMyUserProfileVisibility({IRCIMIWGetMyUserProfileVisibilityCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getMyUserProfileVisibility arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getMyUserProfileVisibility', arguments);
    return result;
  }

  @override
  Future<int> updateMyUserProfile(RCIMIWUserProfile profile, {IRCIMIWUpdateMyUserProfileCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"profile": profile.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:updateMyUserProfile arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:updateMyUserProfile', arguments);
    return result;
  }

  @override
  Future<int> getMyUserProfile({IRCIMIWGetMyUserProfileCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getMyUserProfile arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getMyUserProfile', arguments);
    return result;
  }

  @override
  Future<int> getUserProfiles(List<String> userIds, {IRCIMIWGetUserProfilesCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"userIds": userIds, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:getUserProfiles arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:getUserProfiles', arguments);
    return result;
  }

  @override
  Future<int> searchUserProfileByUniqueId(
    String uniqueId, {
    IRCIMIWSearchUserProfileByUniqueIdCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"uniqueId": uniqueId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:searchUserProfileByUniqueId arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:searchUserProfileByUniqueId', arguments);
    return result;
  }

  @override
  Future<int> subscribeEvent(RCIMIWSubscribeEventRequest request, {IRCIMIWSubscribeEventCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"request": request.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:subscribeEvent arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:subscribeEvent', arguments);
    return result;
  }

  @override
  Future<int> unSubscribeEvent(RCIMIWSubscribeEventRequest request, {IRCIMIWSubscribeEventCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"request": request.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:unSubscribeEvent arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:unSubscribeEvent', arguments);
    return result;
  }

  @override
  Future<int> querySubscribeEvent(
    RCIMIWSubscribeEventRequest request, {
    IRCIMIWQuerySubscribeEventCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"request": request.toJson(), "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:querySubscribeEvent arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:querySubscribeEvent', arguments);
    return result;
  }

  @override
  Future<int> querySubscribeEventByPage(
    RCIMIWSubscribeEventRequest request,
    int pageSize,
    int startIndex, {
    IRCIMIWQuerySubscribeEventCallback? callback,
  }) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {
      "request": request.toJson(),
      "pageSize": pageSize,
      "startIndex": startIndex,
      "cb_handler": rongcloudHandler,
    };
    log("[RC:Flutter] engine:querySubscribeEventByPage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:querySubscribeEventByPage', arguments);
    return result;
  }

  @override
  Future<int> requestSpeechToTextForMessage(String messageUId, {IRCIMIWOperationCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageUId": messageUId, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:requestSpeechToTextForMessage arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:requestSpeechToTextForMessage', arguments);
    return result;
  }

  @override
  Future<int> setMessageSpeechToTextVisible(int messageId, bool visible, {IRCIMIWOperationCallback? callback}) async {
    int rongcloudHandler = addCallback(callback);

    Map<String, dynamic> arguments = {"messageId": messageId, "visible": visible, "cb_handler": rongcloudHandler};
    log("[RC:Flutter] engine:setMessageSpeechToTextVisible arguments: " + arguments.toString());
    int result = await _channel.invokeMethod('engine:setMessageSpeechToTextVisible', arguments);
    return result;
  }

  Future<dynamic> _handler(MethodCall call) async {
    log("[RC:Flutter] " + call.method + " arguments:" + call.arguments.toString());
    switch (call.method) {
      case 'engine:onMessageReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;
        int? left = arguments['left'];
        bool? offline = arguments['offline'];
        bool? hasPackage = arguments['hasPackage'];

        engine?.onMessageReceived?.call(message, left, offline, hasPackage);
        log("[RC:Flutter] engine:onMessageReceived invoke finished");
        break;

      case 'engine:onOfflineMessageSyncCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;

        engine?.onOfflineMessageSyncCompleted?.call();
        log("[RC:Flutter] engine:onOfflineMessageSyncCompleted invoke finished");
        break;

      case 'engine:onConnectionStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConnectionStatus? status =
            arguments['status'] == null ? null : RCIMIWConnectionStatus.values[arguments['status']];

        engine?.onConnectionStatusChanged?.call(status);
        log("[RC:Flutter] engine:onConnectionStatusChanged invoke finished");
        break;

      case 'engine:onConversationTopStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        bool? top = arguments['top'];

        engine?.onConversationTopStatusSynced?.call(type, targetId, channelId, top);
        log("[RC:Flutter] engine:onConversationTopStatusSynced invoke finished");
        break;

      case 'engine:onConversationNotificationLevelSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onConversationNotificationLevelSynced?.call(type, targetId, channelId, level);
        log("[RC:Flutter] engine:onConversationNotificationLevelSynced invoke finished");
        break;

      case 'engine:onConversationTranslationStrategySynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWTranslateStrategy? strategy =
            arguments['strategy'] == null ? null : RCIMIWTranslateStrategy.values[arguments['strategy']];

        engine?.onConversationTranslationStrategySynced?.call(type, targetId, channelId, strategy);
        log("[RC:Flutter] engine:onConversationTranslationStrategySynced invoke finished");
        break;

      case 'engine:onRemoteMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onRemoteMessageRecalled?.call(message);
        log("[RC:Flutter] engine:onRemoteMessageRecalled invoke finished");
        break;

      case 'engine:onPrivateReadReceiptReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        engine?.onPrivateReadReceiptReceived?.call(targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onPrivateReadReceiptReceived invoke finished");
        break;

      case 'engine:onRemoteMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;

        Map? expansion = arguments['expansion'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onRemoteMessageExpansionUpdated?.call(expansion, message);
        log("[RC:Flutter] engine:onRemoteMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onRemoteMessageExpansionForKeyRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;
        List<String>? keys = List.from(arguments['keys']);

        engine?.onRemoteMessageExpansionForKeyRemoved?.call(message, keys);
        log("[RC:Flutter] engine:onRemoteMessageExpansionForKeyRemoved invoke finished");
        break;

      case 'engine:onChatRoomMemberChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWChatRoomMemberAction> actionsStr = [];
        arguments['actions'].forEach((element) {
          actionsStr.add(
            RCIMIWChatRoomMemberAction.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        String? targetId = arguments['targetId'];
        List<RCIMIWChatRoomMemberAction>? actions = actionsStr;

        engine?.onChatRoomMemberChanged?.call(targetId, actions);
        log("[RC:Flutter] engine:onChatRoomMemberChanged invoke finished");
        break;

      case 'engine:onTypingStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWTypingStatus> userTypingStatusStr = [];
        arguments['userTypingStatus'].forEach((element) {
          userTypingStatusStr.add(
            RCIMIWTypingStatus.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWTypingStatus>? userTypingStatus = userTypingStatusStr;

        engine?.onTypingStatusChanged?.call(type, targetId, channelId, userTypingStatus);
        log("[RC:Flutter] engine:onTypingStatusChanged invoke finished");
        break;

      case 'engine:onConversationReadStatusSyncMessageReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        int? timestamp = arguments['timestamp'];

        engine?.onConversationReadStatusSyncMessageReceived?.call(type, targetId, timestamp);
        log("[RC:Flutter] engine:onConversationReadStatusSyncMessageReceived invoke finished");
        break;

      case 'engine:onChatRoomEntriesSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? roomId = arguments['roomId'];

        engine?.onChatRoomEntriesSynced?.call(roomId);
        log("[RC:Flutter] engine:onChatRoomEntriesSynced invoke finished");
        break;

      case 'engine:onChatRoomEntriesChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWChatRoomEntriesOperationType? operationType =
            arguments['operationType'] == null
                ? null
                : RCIMIWChatRoomEntriesOperationType.values[arguments['operationType']];
        String? roomId = arguments['roomId'];
        Map? entries = arguments['entries'];

        engine?.onChatRoomEntriesChanged?.call(operationType, roomId, entries);
        log("[RC:Flutter] engine:onChatRoomEntriesChanged invoke finished");
        break;

      case 'engine:onRemoteUltraGroupMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onRemoteUltraGroupMessageExpansionUpdated?.call(messages);
        log("[RC:Flutter] engine:onRemoteUltraGroupMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onRemoteUltraGroupMessageModified':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onRemoteUltraGroupMessageModified?.call(messages);
        log("[RC:Flutter] engine:onRemoteUltraGroupMessageModified invoke finished");
        break;

      case 'engine:onRemoteUltraGroupMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onRemoteUltraGroupMessageRecalled?.call(messages);
        log("[RC:Flutter] engine:onRemoteUltraGroupMessageRecalled invoke finished");
        break;

      case 'engine:onUltraGroupReadTimeReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        engine?.onUltraGroupReadTimeReceived?.call(targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onUltraGroupReadTimeReceived invoke finished");
        break;

      case 'engine:onUltraGroupTypingStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWUltraGroupTypingStatusInfo> infoStr = [];
        arguments['info'].forEach((element) {
          infoStr.add(
            RCIMIWUltraGroupTypingStatusInfo.fromJson(
              (element as Map).map((key, value) => MapEntry(key.toString(), value)),
            ),
          );
        });

        List<RCIMIWUltraGroupTypingStatusInfo>? info = infoStr;

        engine?.onUltraGroupTypingStatusChanged?.call(info);
        log("[RC:Flutter] engine:onUltraGroupTypingStatusChanged invoke finished");
        break;

      case 'engine:onSpeechToTextCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWSpeechToTextInfo? info =
            arguments['info'] != null
                ? RCIMIWSpeechToTextInfo.fromJson(Map<String, dynamic>.from(arguments['info']))
                : null;
        String? messageUId = arguments['messageUId'];
        int? code = arguments['code'];

        engine?.onSpeechToTextCompleted?.call(info, messageUId, code);
        log("[RC:Flutter] engine:onSpeechToTextCompleted invoke finished");
        break;

      case 'engine:onMessageBlocked':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWBlockedMessageInfo? info =
            arguments['info'] != null
                ? RCIMIWBlockedMessageInfo.fromJson(Map<String, dynamic>.from(arguments['info']))
                : null;

        engine?.onMessageBlocked?.call(info);
        log("[RC:Flutter] engine:onMessageBlocked invoke finished");
        break;

      case 'engine:onChatRoomStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        RCIMIWChatRoomStatus? status =
            arguments['status'] == null ? null : RCIMIWChatRoomStatus.values[arguments['status']];

        engine?.onChatRoomStatusChanged?.call(targetId, status);
        log("[RC:Flutter] engine:onChatRoomStatusChanged invoke finished");
        break;

      case 'engine:onGroupMessageReadReceiptRequestReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? messageUId = arguments['messageUId'];

        engine?.onGroupMessageReadReceiptRequestReceived?.call(targetId, messageUId);
        log("[RC:Flutter] engine:onGroupMessageReadReceiptRequestReceived invoke finished");
        break;

      case 'engine:onGroupMessageReadReceiptResponseReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? messageUId = arguments['messageUId'];
        Map? respondUserIds = arguments['respondUserIds'];

        engine?.onGroupMessageReadReceiptResponseReceived?.call(targetId, messageUId, respondUserIds);
        log("[RC:Flutter] engine:onGroupMessageReadReceiptResponseReceived invoke finished");
        break;

      case 'engine:onConnected':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];

        engine?.onConnected?.call(code, userId);
        log("[RC:Flutter] engine:onConnected invoke finished");
        break;

      case 'engine:onDatabaseOpened':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];

        engine?.onDatabaseOpened?.call(code);
        log("[RC:Flutter] engine:onDatabaseOpened invoke finished");
        break;

      case 'engine:onConversationLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWConversation? conversation =
            arguments['conversation'] != null
                ? RCIMIWConversation.fromJson(Map<String, dynamic>.from(arguments['conversation']))
                : null;

        engine?.onConversationLoaded?.call(code, type, targetId, channelId, conversation);
        log("[RC:Flutter] engine:onConversationLoaded invoke finished");
        break;

      case 'engine:onConversationsLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversationType> conversationTypesStr = [];
        arguments['conversationTypes'].forEach((element) {
          conversationTypesStr.add(RCIMIWConversationType.values[element]);
        });
        List<RCIMIWConversation> conversationsStr = [];
        arguments['conversations'].forEach((element) {
          conversationsStr.add(
            RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        int? startTime = arguments['startTime'];
        int? count = arguments['count'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        engine?.onConversationsLoaded?.call(code, conversationTypes, channelId, startTime, count, conversations);
        log("[RC:Flutter] engine:onConversationsLoaded invoke finished");
        break;

      case 'engine:onConversationRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];

        engine?.onConversationRemoved?.call(code, type, targetId, channelId);
        log("[RC:Flutter] engine:onConversationRemoved invoke finished");
        break;

      case 'engine:onConversationsRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversationType> conversationTypesStr = [];
        arguments['conversationTypes'].forEach((element) {
          conversationTypesStr.add(RCIMIWConversationType.values[element]);
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];

        engine?.onConversationsRemoved?.call(code, conversationTypes, channelId);
        log("[RC:Flutter] engine:onConversationsRemoved invoke finished");
        break;

      case 'engine:onTotalUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        engine?.onTotalUnreadCountLoaded?.call(code, channelId, count);
        log("[RC:Flutter] engine:onTotalUnreadCountLoaded invoke finished");
        break;

      case 'engine:onUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        engine?.onUnreadCountLoaded?.call(code, type, targetId, channelId, count);
        log("[RC:Flutter] engine:onUnreadCountLoaded invoke finished");
        break;

      case 'engine:onUnreadCountByConversationTypesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversationType> conversationTypesStr = [];
        arguments['conversationTypes'].forEach((element) {
          conversationTypesStr.add(RCIMIWConversationType.values[element]);
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        bool? contain = arguments['contain'];
        int? count = arguments['count'];

        engine?.onUnreadCountByConversationTypesLoaded?.call(code, conversationTypes, channelId, contain, count);
        log("[RC:Flutter] engine:onUnreadCountByConversationTypesLoaded invoke finished");
        break;

      case 'engine:onUnreadMentionedCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        engine?.onUnreadMentionedCountLoaded?.call(code, type, targetId, channelId, count);
        log("[RC:Flutter] engine:onUnreadMentionedCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupAllUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? count = arguments['count'];

        engine?.onUltraGroupAllUnreadCountLoaded?.call(code, count);
        log("[RC:Flutter] engine:onUltraGroupAllUnreadCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupAllUnreadMentionedCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? count = arguments['count'];

        engine?.onUltraGroupAllUnreadMentionedCountLoaded?.call(code, count);
        log("[RC:Flutter] engine:onUltraGroupAllUnreadMentionedCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupConversationsSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        engine?.onUltraGroupConversationsSynced?.call();
        log("[RC:Flutter] engine:onUltraGroupConversationsSynced invoke finished");
        break;

      case 'engine:onUnreadCountCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        engine?.onUnreadCountCleared?.call(code, type, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onUnreadCountCleared invoke finished");
        break;

      case 'engine:onDraftMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? draft = arguments['draft'];

        engine?.onDraftMessageSaved?.call(code, type, targetId, channelId, draft);
        log("[RC:Flutter] engine:onDraftMessageSaved invoke finished");
        break;

      case 'engine:onDraftMessageCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];

        engine?.onDraftMessageCleared?.call(code, type, targetId, channelId);
        log("[RC:Flutter] engine:onDraftMessageCleared invoke finished");
        break;

      case 'engine:onDraftMessageLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? draft = arguments['draft'];

        engine?.onDraftMessageLoaded?.call(code, type, targetId, channelId, draft);
        log("[RC:Flutter] engine:onDraftMessageLoaded invoke finished");
        break;

      case 'engine:onBlockedConversationsLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversationType> conversationTypesStr = [];
        arguments['conversationTypes'].forEach((element) {
          conversationTypesStr.add(RCIMIWConversationType.values[element]);
        });
        List<RCIMIWConversation> conversationsStr = [];
        arguments['conversations'].forEach((element) {
          conversationsStr.add(
            RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        engine?.onBlockedConversationsLoaded?.call(code, conversationTypes, channelId, conversations);
        log("[RC:Flutter] engine:onBlockedConversationsLoaded invoke finished");
        break;

      case 'engine:onConversationTopStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        bool? top = arguments['top'];

        engine?.onConversationTopStatusChanged?.call(code, type, targetId, channelId, top);
        log("[RC:Flutter] engine:onConversationTopStatusChanged invoke finished");
        break;

      case 'engine:onConversationTopStatusLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        bool? top = arguments['top'];

        engine?.onConversationTopStatusLoaded?.call(code, type, targetId, channelId, top);
        log("[RC:Flutter] engine:onConversationTopStatusLoaded invoke finished");
        break;

      case 'engine:onConversationReadStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        engine?.onConversationReadStatusSynced?.call(code, type, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onConversationReadStatusSynced invoke finished");
        break;

      case 'engine:onMessageAttached':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onMessageAttached?.call(message);
        log("[RC:Flutter] engine:onMessageAttached invoke finished");
        break;

      case 'engine:onMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onMessageSent?.call(code, message);
        log("[RC:Flutter] engine:onMessageSent invoke finished");
        break;

      case 'engine:onMediaMessageAttached':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        engine?.onMediaMessageAttached?.call(message);
        log("[RC:Flutter] engine:onMediaMessageAttached invoke finished");
        break;

      case 'engine:onMediaMessageSending':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;
        int? progress = arguments['progress'];

        engine?.onMediaMessageSending?.call(message, progress);
        log("[RC:Flutter] engine:onMediaMessageSending invoke finished");
        break;

      case 'engine:onSendingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        engine?.onSendingMediaMessageCanceled?.call(code, message);
        log("[RC:Flutter] engine:onSendingMediaMessageCanceled invoke finished");
        break;

      case 'engine:onMediaMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        engine?.onMediaMessageSent?.call(code, message);
        log("[RC:Flutter] engine:onMediaMessageSent invoke finished");
        break;

      case 'engine:onMediaMessageDownloading':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;
        int? progress = arguments['progress'];

        engine?.onMediaMessageDownloading?.call(message, progress);
        log("[RC:Flutter] engine:onMediaMessageDownloading invoke finished");
        break;

      case 'engine:onMediaMessageDownloaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        engine?.onMediaMessageDownloaded?.call(code, message);
        log("[RC:Flutter] engine:onMediaMessageDownloaded invoke finished");
        break;

      case 'engine:onDownloadingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        engine?.onDownloadingMediaMessageCanceled?.call(code, message);
        log("[RC:Flutter] engine:onDownloadingMediaMessageCanceled invoke finished");
        break;

      case 'engine:onMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? sentTime = arguments['sentTime'];
        RCIMIWTimeOrder? order = arguments['order'] == null ? null : RCIMIWTimeOrder.values[arguments['order']];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onMessagesLoaded?.call(code, type, targetId, channelId, sentTime, order, messages);
        log("[RC:Flutter] engine:onMessagesLoaded invoke finished");
        break;

      case 'engine:onUnreadMentionedMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onUnreadMentionedMessagesLoaded?.call(code, type, targetId, channelId, messages);
        log("[RC:Flutter] engine:onUnreadMentionedMessagesLoaded invoke finished");
        break;

      case 'engine:onFirstUnreadMessageLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onFirstUnreadMessageLoaded?.call(code, type, targetId, channelId, message);
        log("[RC:Flutter] engine:onFirstUnreadMessageLoaded invoke finished");
        break;

      case 'engine:onMessageInserted':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onMessageInserted?.call(code, message);
        log("[RC:Flutter] engine:onMessageInserted invoke finished");
        break;

      case 'engine:onMessagesInserted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onMessagesInserted?.call(code, messages);
        log("[RC:Flutter] engine:onMessagesInserted invoke finished");
        break;

      case 'engine:onMessagesCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        engine?.onMessagesCleared?.call(code, type, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onMessagesCleared invoke finished");
        break;

      case 'engine:onLocalMessagesDeleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onLocalMessagesDeleted?.call(code, messages);
        log("[RC:Flutter] engine:onLocalMessagesDeleted invoke finished");
        break;

      case 'engine:onMessagesDeleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onMessagesDeleted?.call(code, type, targetId, channelId, messages);
        log("[RC:Flutter] engine:onMessagesDeleted invoke finished");
        break;

      case 'engine:onMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onMessageRecalled?.call(code, message);
        log("[RC:Flutter] engine:onMessageRecalled invoke finished");
        break;

      case 'engine:onPrivateReadReceiptMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        engine?.onPrivateReadReceiptMessageSent?.call(code, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onPrivateReadReceiptMessageSent invoke finished");
        break;

      case 'engine:onMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];
        Map? expansion = arguments['expansion'];

        engine?.onMessageExpansionUpdated?.call(code, messageUId, expansion);
        log("[RC:Flutter] engine:onMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onMessageExpansionForKeysRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];
        List<String>? keys = List.from(arguments['keys']);

        engine?.onMessageExpansionForKeysRemoved?.call(code, messageUId, keys);
        log("[RC:Flutter] engine:onMessageExpansionForKeysRemoved invoke finished");
        break;

      case 'engine:onMessageReceiveStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? messageId = arguments['messageId'];

        engine?.onMessageReceiveStatusChanged?.call(code, messageId);
        log("[RC:Flutter] engine:onMessageReceiveStatusChanged invoke finished");
        break;

      case 'engine:onMessageSentStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? messageId = arguments['messageId'];

        engine?.onMessageSentStatusChanged?.call(code, messageId);
        log("[RC:Flutter] engine:onMessageSentStatusChanged invoke finished");
        break;

      case 'engine:onChatRoomJoined':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];

        engine?.onChatRoomJoined?.call(code, targetId);
        log("[RC:Flutter] engine:onChatRoomJoined invoke finished");
        break;

      case 'engine:onChatRoomJoining':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];

        engine?.onChatRoomJoining?.call(targetId);
        log("[RC:Flutter] engine:onChatRoomJoining invoke finished");
        break;

      case 'engine:onChatRoomLeft':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];

        engine?.onChatRoomLeft?.call(code, targetId);
        log("[RC:Flutter] engine:onChatRoomLeft invoke finished");
        break;

      case 'engine:onChatRoomMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        List<RCIMIWMessage>? messages = messagesStr;
        int? syncTime = arguments['syncTime'];

        engine?.onChatRoomMessagesLoaded?.call(code, targetId, messages, syncTime);
        log("[RC:Flutter] engine:onChatRoomMessagesLoaded invoke finished");
        break;

      case 'engine:onChatRoomEntryAdded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? key = arguments['key'];

        engine?.onChatRoomEntryAdded?.call(code, targetId, key);
        log("[RC:Flutter] engine:onChatRoomEntryAdded invoke finished");
        break;

      case 'engine:onChatRoomEntriesAdded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        Map? entries = arguments['entries'];
        Map? errorEntries = arguments['errorEntries'];

        engine?.onChatRoomEntriesAdded?.call(code, targetId, entries, errorEntries);
        log("[RC:Flutter] engine:onChatRoomEntriesAdded invoke finished");
        break;

      case 'engine:onChatRoomEntryLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        Map? entry = arguments['entry'];

        engine?.onChatRoomEntryLoaded?.call(code, targetId, entry);
        log("[RC:Flutter] engine:onChatRoomEntryLoaded invoke finished");
        break;

      case 'engine:onChatRoomAllEntriesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        Map? entries = arguments['entries'];

        engine?.onChatRoomAllEntriesLoaded?.call(code, targetId, entries);
        log("[RC:Flutter] engine:onChatRoomAllEntriesLoaded invoke finished");
        break;

      case 'engine:onChatRoomEntryRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? key = arguments['key'];

        engine?.onChatRoomEntryRemoved?.call(code, targetId, key);
        log("[RC:Flutter] engine:onChatRoomEntryRemoved invoke finished");
        break;

      case 'engine:onChatRoomEntriesRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        List<String>? keys = List.from(arguments['keys']);

        engine?.onChatRoomEntriesRemoved?.call(code, targetId, keys);
        log("[RC:Flutter] engine:onChatRoomEntriesRemoved invoke finished");
        break;

      case 'engine:onBlacklistAdded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];

        engine?.onBlacklistAdded?.call(code, userId);
        log("[RC:Flutter] engine:onBlacklistAdded invoke finished");
        break;

      case 'engine:onBlacklistRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];

        engine?.onBlacklistRemoved?.call(code, userId);
        log("[RC:Flutter] engine:onBlacklistRemoved invoke finished");
        break;

      case 'engine:onBlacklistStatusLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];
        RCIMIWBlacklistStatus? status =
            arguments['status'] == null ? null : RCIMIWBlacklistStatus.values[arguments['status']];

        engine?.onBlacklistStatusLoaded?.call(code, userId, status);
        log("[RC:Flutter] engine:onBlacklistStatusLoaded invoke finished");
        break;

      case 'engine:onBlacklistLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        List<String>? userIds = List.from(arguments['userIds']);

        engine?.onBlacklistLoaded?.call(code, userIds);
        log("[RC:Flutter] engine:onBlacklistLoaded invoke finished");
        break;

      case 'engine:onMessagesSearched':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? keyword = arguments['keyword'];
        int? startTime = arguments['startTime'];
        int? count = arguments['count'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onMessagesSearched?.call(code, type, targetId, channelId, keyword, startTime, count, messages);
        log("[RC:Flutter] engine:onMessagesSearched invoke finished");
        break;

      case 'engine:onMessagesSearchedByTimeRange':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? keyword = arguments['keyword'];
        int? startTime = arguments['startTime'];
        int? endTime = arguments['endTime'];
        int? offset = arguments['offset'];
        int? count = arguments['count'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onMessagesSearchedByTimeRange?.call(
          code,
          type,
          targetId,
          channelId,
          keyword,
          startTime,
          endTime,
          offset,
          count,
          messages,
        );
        log("[RC:Flutter] engine:onMessagesSearchedByTimeRange invoke finished");
        break;

      case 'engine:onMessagesSearchedByUserId':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        String? userId = arguments['userId'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? startTime = arguments['startTime'];
        int? count = arguments['count'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onMessagesSearchedByUserId?.call(code, userId, type, targetId, channelId, startTime, count, messages);
        log("[RC:Flutter] engine:onMessagesSearchedByUserId invoke finished");
        break;

      case 'engine:onConversationsSearched':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversationType> conversationTypesStr = [];
        arguments['conversationTypes'].forEach((element) {
          conversationTypesStr.add(RCIMIWConversationType.values[element]);
        });
        List<RCIMIWMessageType> messageTypesStr = [];
        arguments['messageTypes'].forEach((element) {
          messageTypesStr.add(RCIMIWMessageType.values[element]);
        });
        List<RCIMIWSearchConversationResult> conversationsStr = [];
        arguments['conversations'].forEach((element) {
          conversationsStr.add(
            RCIMIWSearchConversationResult.fromJson(
              (element as Map).map((key, value) => MapEntry(key.toString(), value)),
            ),
          );
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        List<RCIMIWMessageType>? messageTypes = messageTypesStr;
        String? keyword = arguments['keyword'];
        List<RCIMIWSearchConversationResult>? conversations = conversationsStr;

        engine?.onConversationsSearched?.call(code, conversationTypes, channelId, messageTypes, keyword, conversations);
        log("[RC:Flutter] engine:onConversationsSearched invoke finished");
        break;

      case 'engine:onGroupReadReceiptRequestSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onGroupReadReceiptRequestSent?.call(code, message);
        log("[RC:Flutter] engine:onGroupReadReceiptRequestSent invoke finished");
        break;

      case 'engine:onGroupReadReceiptResponseSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWMessage>? messages = messagesStr;

        engine?.onGroupReadReceiptResponseSent?.call(code, targetId, channelId, messages);
        log("[RC:Flutter] engine:onGroupReadReceiptResponseSent invoke finished");
        break;

      case 'engine:onNotificationQuietHoursChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? startTime = arguments['startTime'];
        int? spanMinutes = arguments['spanMinutes'];
        RCIMIWPushNotificationQuietHoursLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationQuietHoursLevel.values[arguments['level']];

        engine?.onNotificationQuietHoursChanged?.call(code, startTime, spanMinutes, level);
        log("[RC:Flutter] engine:onNotificationQuietHoursChanged invoke finished");
        break;

      case 'engine:onNotificationQuietHoursRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];

        engine?.onNotificationQuietHoursRemoved?.call(code);
        log("[RC:Flutter] engine:onNotificationQuietHoursRemoved invoke finished");
        break;

      case 'engine:onNotificationQuietHoursLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? startTime = arguments['startTime'];
        int? spanMinutes = arguments['spanMinutes'];
        RCIMIWPushNotificationQuietHoursLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationQuietHoursLevel.values[arguments['level']];

        engine?.onNotificationQuietHoursLoaded?.call(code, startTime, spanMinutes, level);
        log("[RC:Flutter] engine:onNotificationQuietHoursLoaded invoke finished");
        break;

      case 'engine:onConversationNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onConversationNotificationLevelChanged?.call(code, type, targetId, channelId, level);
        log("[RC:Flutter] engine:onConversationNotificationLevelChanged invoke finished");
        break;

      case 'engine:onConversationNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onConversationNotificationLevelLoaded?.call(code, type, targetId, channelId, level);
        log("[RC:Flutter] engine:onConversationNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onConversationTypeNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onConversationTypeNotificationLevelChanged?.call(code, type, level);
        log("[RC:Flutter] engine:onConversationTypeNotificationLevelChanged invoke finished");
        break;

      case 'engine:onConversationTypeNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onConversationTypeNotificationLevelLoaded?.call(code, type, level);
        log("[RC:Flutter] engine:onConversationTypeNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onUltraGroupDefaultNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onUltraGroupDefaultNotificationLevelChanged?.call(code, targetId, level);
        log("[RC:Flutter] engine:onUltraGroupDefaultNotificationLevelChanged invoke finished");
        break;

      case 'engine:onUltraGroupDefaultNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onUltraGroupDefaultNotificationLevelLoaded?.call(code, targetId, level);
        log("[RC:Flutter] engine:onUltraGroupDefaultNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onUltraGroupChannelDefaultNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onUltraGroupChannelDefaultNotificationLevelChanged?.call(code, targetId, channelId, level);
        log("[RC:Flutter] engine:onUltraGroupChannelDefaultNotificationLevelChanged invoke finished");
        break;

      case 'engine:onUltraGroupChannelDefaultNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['level']];

        engine?.onUltraGroupChannelDefaultNotificationLevelLoaded?.call(code, targetId, channelId, level);
        log("[RC:Flutter] engine:onUltraGroupChannelDefaultNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onPushContentShowStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        bool? showContent = arguments['showContent'];

        engine?.onPushContentShowStatusChanged?.call(code, showContent);
        log("[RC:Flutter] engine:onPushContentShowStatusChanged invoke finished");
        break;

      case 'engine:onPushLanguageChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? language = arguments['language'];

        engine?.onPushLanguageChanged?.call(code, language);
        log("[RC:Flutter] engine:onPushLanguageChanged invoke finished");
        break;

      case 'engine:onPushReceiveStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        bool? receive = arguments['receive'];

        engine?.onPushReceiveStatusChanged?.call(code, receive);
        log("[RC:Flutter] engine:onPushReceiveStatusChanged invoke finished");
        break;

      case 'engine:onMessageCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        engine?.onMessageCountLoaded?.call(code, type, targetId, channelId, count);
        log("[RC:Flutter] engine:onMessageCountLoaded invoke finished");
        break;

      case 'engine:onTopConversationsLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversationType> conversationTypesStr = [];
        arguments['conversationTypes'].forEach((element) {
          conversationTypesStr.add(RCIMIWConversationType.values[element]);
        });
        List<RCIMIWConversation> conversationsStr = [];
        arguments['conversations'].forEach((element) {
          conversationsStr.add(
            RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        engine?.onTopConversationsLoaded?.call(code, conversationTypes, channelId, conversations);
        log("[RC:Flutter] engine:onTopConversationsLoaded invoke finished");
        break;

      case 'engine:onGroupMessageToDesignatedUsersAttached':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onGroupMessageToDesignatedUsersAttached?.call(message);
        log("[RC:Flutter] engine:onGroupMessageToDesignatedUsersAttached invoke finished");
        break;

      case 'engine:onGroupMessageToDesignatedUsersSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        engine?.onGroupMessageToDesignatedUsersSent?.call(code, message);
        log("[RC:Flutter] engine:onGroupMessageToDesignatedUsersSent invoke finished");
        break;

      case 'engine:onUltraGroupReadStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        engine?.onUltraGroupReadStatusSynced?.call(code, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onUltraGroupReadStatusSynced invoke finished");
        break;

      case 'engine:onConversationsLoadedForAllChannel':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversation> conversationsStr = [];
        arguments['conversations'].forEach((element) {
          conversationsStr.add(
            RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type =
            arguments['type'] == null ? null : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        engine?.onConversationsLoadedForAllChannel?.call(code, type, targetId, conversations);
        log("[RC:Flutter] engine:onConversationsLoadedForAllChannel invoke finished");
        break;

      case 'engine:onUltraGroupUnreadMentionedCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        int? count = arguments['count'];

        engine?.onUltraGroupUnreadMentionedCountLoaded?.call(code, targetId, count);
        log("[RC:Flutter] engine:onUltraGroupUnreadMentionedCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        int? count = arguments['count'];

        engine?.onUltraGroupUnreadCountLoaded?.call(code, targetId, count);
        log("[RC:Flutter] engine:onUltraGroupUnreadCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupMessageModified':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];

        engine?.onUltraGroupMessageModified?.call(code, messageUId);
        log("[RC:Flutter] engine:onUltraGroupMessageModified invoke finished");
        break;

      case 'engine:onUltraGroupMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;
        bool? deleteRemote = arguments['deleteRemote'];

        engine?.onUltraGroupMessageRecalled?.call(code, message, deleteRemote);
        log("[RC:Flutter] engine:onUltraGroupMessageRecalled invoke finished");
        break;

      case 'engine:onUltraGroupMessagesCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];
        RCIMIWMessageOperationPolicy? policy =
            arguments['policy'] == null ? null : RCIMIWMessageOperationPolicy.values[arguments['policy']];

        engine?.onUltraGroupMessagesCleared?.call(code, targetId, channelId, timestamp, policy);
        log("[RC:Flutter] engine:onUltraGroupMessagesCleared invoke finished");
        break;

      case 'engine:onUltraGroupMessagesClearedForAllChannel':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        int? timestamp = arguments['timestamp'];

        engine?.onUltraGroupMessagesClearedForAllChannel?.call(code, targetId, timestamp);
        log("[RC:Flutter] engine:onUltraGroupMessagesClearedForAllChannel invoke finished");
        break;

      case 'engine:onUltraGroupTypingStatusSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWUltraGroupTypingStatus? typingStatus =
            arguments['typingStatus'] == null ? null : RCIMIWUltraGroupTypingStatus.values[arguments['typingStatus']];

        engine?.onUltraGroupTypingStatusSent?.call(code, targetId, channelId, typingStatus);
        log("[RC:Flutter] engine:onUltraGroupTypingStatusSent invoke finished");
        break;

      case 'engine:onBatchRemoteUltraGroupMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> matchedMessagesStr = [];
        arguments['matchedMessages'].forEach((element) {
          matchedMessagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });
        List<RCIMIWMessage> notMatchedMessagesStr = [];
        arguments['notMatchedMessages'].forEach((element) {
          notMatchedMessagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWMessage>? matchedMessages = matchedMessagesStr;
        List<RCIMIWMessage>? notMatchedMessages = notMatchedMessagesStr;

        engine?.onBatchRemoteUltraGroupMessagesLoaded?.call(code, matchedMessages, notMatchedMessages);
        log("[RC:Flutter] engine:onBatchRemoteUltraGroupMessagesLoaded invoke finished");
        break;

      case 'engine:onUltraGroupMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        Map? expansion = arguments['expansion'];
        String? messageUId = arguments['messageUId'];

        engine?.onUltraGroupMessageExpansionUpdated?.call(code, expansion, messageUId);
        log("[RC:Flutter] engine:onUltraGroupMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onUltraGroupMessageExpansionForKeysRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];
        List<String>? keys = List.from(arguments['keys']);

        engine?.onUltraGroupMessageExpansionForKeysRemoved?.call(code, messageUId, keys);
        log("[RC:Flutter] engine:onUltraGroupMessageExpansionForKeysRemoved invoke finished");
        break;

      case 'engine:onGroupOperation':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWGroupMemberInfo> memberInfosStr = [];
        arguments['memberInfos'].forEach((element) {
          memberInfosStr.add(
            RCIMIWGroupMemberInfo.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        String? groupId = arguments['groupId'];
        RCIMIWGroupMemberInfo? operatorInfo =
            arguments['operatorInfo'] != null
                ? RCIMIWGroupMemberInfo.fromJson(Map<String, dynamic>.from(arguments['operatorInfo']))
                : null;
        RCIMIWGroupInfo? groupInfo =
            arguments['groupInfo'] != null
                ? RCIMIWGroupInfo.fromJson(Map<String, dynamic>.from(arguments['groupInfo']))
                : null;
        RCIMIWGroupOperation? operation =
            arguments['operation'] == null ? null : RCIMIWGroupOperation.values[arguments['operation']];
        List<RCIMIWGroupMemberInfo>? memberInfos = memberInfosStr;
        int? operationTime = arguments['operationTime'];

        engine?.onGroupOperation?.call(groupId, operatorInfo, groupInfo, operation, memberInfos, operationTime);
        log("[RC:Flutter] engine:onGroupOperation invoke finished");
        break;

      case 'engine:onGroupInfoChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWGroupMemberInfo? operatorInfo =
            arguments['operatorInfo'] != null
                ? RCIMIWGroupMemberInfo.fromJson(Map<String, dynamic>.from(arguments['operatorInfo']))
                : null;
        RCIMIWGroupInfo? fullGroupInfo =
            arguments['fullGroupInfo'] != null
                ? RCIMIWGroupInfo.fromJson(Map<String, dynamic>.from(arguments['fullGroupInfo']))
                : null;
        RCIMIWGroupInfo? changedGroupInfo =
            arguments['changedGroupInfo'] != null
                ? RCIMIWGroupInfo.fromJson(Map<String, dynamic>.from(arguments['changedGroupInfo']))
                : null;
        int? operationTime = arguments['operationTime'];

        engine?.onGroupInfoChanged?.call(operatorInfo, fullGroupInfo, changedGroupInfo, operationTime);
        log("[RC:Flutter] engine:onGroupInfoChanged invoke finished");
        break;

      case 'engine:onGroupMemberInfoChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? groupId = arguments['groupId'];
        RCIMIWGroupMemberInfo? operatorInfo =
            arguments['operatorInfo'] != null
                ? RCIMIWGroupMemberInfo.fromJson(Map<String, dynamic>.from(arguments['operatorInfo']))
                : null;
        RCIMIWGroupMemberInfo? memberInfo =
            arguments['memberInfo'] != null
                ? RCIMIWGroupMemberInfo.fromJson(Map<String, dynamic>.from(arguments['memberInfo']))
                : null;
        int? operationTime = arguments['operationTime'];

        engine?.onGroupMemberInfoChanged?.call(groupId, operatorInfo, memberInfo, operationTime);
        log("[RC:Flutter] engine:onGroupMemberInfoChanged invoke finished");
        break;

      case 'engine:onGroupApplicationEvent':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWGroupApplicationInfo? info =
            arguments['info'] != null
                ? RCIMIWGroupApplicationInfo.fromJson(Map<String, dynamic>.from(arguments['info']))
                : null;

        engine?.onGroupApplicationEvent?.call(info);
        log("[RC:Flutter] engine:onGroupApplicationEvent invoke finished");
        break;

      case 'engine:onGroupRemarkChangedSync':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? groupId = arguments['groupId'];
        RCIMIWGroupOperationType? operationType =
            arguments['operationType'] == null ? null : RCIMIWGroupOperationType.values[arguments['operationType']];
        String? groupRemark = arguments['groupRemark'];
        int? operationTime = arguments['operationTime'];

        engine?.onGroupRemarkChangedSync?.call(groupId, operationType, groupRemark, operationTime);
        log("[RC:Flutter] engine:onGroupRemarkChangedSync invoke finished");
        break;

      case 'engine:onGroupFollowsChangedSync':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? groupId = arguments['groupId'];
        RCIMIWGroupOperationType? operationType =
            arguments['operationType'] == null ? null : RCIMIWGroupOperationType.values[arguments['operationType']];
        List<String>? userIds = List.from(arguments['userIds']);
        int? operationTime = arguments['operationTime'];

        engine?.onGroupFollowsChangedSync?.call(groupId, operationType, userIds, operationTime);
        log("[RC:Flutter] engine:onGroupFollowsChangedSync invoke finished");
        break;

      case 'engine:onChatRoomNotifyMultiLoginSync':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWChatRoomSyncEvent? event =
            arguments['event'] != null
                ? RCIMIWChatRoomSyncEvent.fromJson(Map<String, dynamic>.from(arguments['event']))
                : null;

        engine?.onChatRoomNotifyMultiLoginSync?.call(event);
        log("[RC:Flutter] engine:onChatRoomNotifyMultiLoginSync invoke finished");
        break;

      case 'engine:onChatRoomNotifyBlock':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWChatRoomMemberBlockEvent? event =
            arguments['event'] != null
                ? RCIMIWChatRoomMemberBlockEvent.fromJson(Map<String, dynamic>.from(arguments['event']))
                : null;

        engine?.onChatRoomNotifyBlock?.call(event);
        log("[RC:Flutter] engine:onChatRoomNotifyBlock invoke finished");
        break;

      case 'engine:onChatRoomNotifyBan':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWChatRoomMemberBanEvent? event =
            arguments['event'] != null
                ? RCIMIWChatRoomMemberBanEvent.fromJson(Map<String, dynamic>.from(arguments['event']))
                : null;

        engine?.onChatRoomNotifyBan?.call(event);
        log("[RC:Flutter] engine:onChatRoomNotifyBan invoke finished");
        break;

      case 'engine:onTranslationDidFinished':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWTranslateItem> itemsStr = [];
        arguments['items'].forEach((element) {
          itemsStr.add(
            RCIMIWTranslateItem.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        List<RCIMIWTranslateItem>? items = itemsStr;

        engine?.onTranslationDidFinished?.call(items);
        log("[RC:Flutter] engine:onTranslationDidFinished invoke finished");
        break;

      case 'engine:onTranslationLanguageDidChange':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? language = arguments['language'];

        engine?.onTranslationLanguageDidChange?.call(language);
        log("[RC:Flutter] engine:onTranslationLanguageDidChange invoke finished");
        break;

      case 'engine:onAutoTranslateStateDidChange':
        Map<dynamic, dynamic> arguments = call.arguments;

        bool? isEnable = arguments['isEnable'];

        engine?.onAutoTranslateStateDidChange?.call(isEnable);
        log("[RC:Flutter] engine:onAutoTranslateStateDidChange invoke finished");
        break;

      case 'engine:onEventChange':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWSubscribeInfoEvent> subscribeEventsStr = [];
        arguments['subscribeEvents'].forEach((element) {
          subscribeEventsStr.add(
            RCIMIWSubscribeInfoEvent.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        List<RCIMIWSubscribeInfoEvent>? subscribeEvents = subscribeEventsStr;

        engine?.onEventChange?.call(subscribeEvents);
        log("[RC:Flutter] engine:onEventChange invoke finished");
        break;

      case 'engine:onSubscriptionSyncCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWSubscribeType? type = arguments['type'] == null ? null : RCIMIWSubscribeType.values[arguments['type']];

        engine?.onSubscriptionSyncCompleted?.call(type);
        log("[RC:Flutter] engine:onSubscriptionSyncCompleted invoke finished");
        break;

      case 'engine:onSubscriptionChangedOnOtherDevices':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWSubscribeEvent> subscribeEventsStr = [];
        arguments['subscribeEvents'].forEach((element) {
          subscribeEventsStr.add(
            RCIMIWSubscribeEvent.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        List<RCIMIWSubscribeEvent>? subscribeEvents = subscribeEventsStr;

        engine?.onSubscriptionChangedOnOtherDevices?.call(subscribeEvents);
        log("[RC:Flutter] engine:onSubscriptionChangedOnOtherDevices invoke finished");
        break;

      case 'engine_cb:RCIMIWConnectCallback_onDatabaseOpened':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        RCIMIWConnectCallback? callback = getCallback(rongcloudHandler);
        Function(int?)? method = callback?.onDatabaseOpened;
        method?.call(code);
        log("[RC:Flutter] engine_cb:RCIMIWConnectCallback_onDatabaseOpened invoke finished");
        break;

      case 'engine_cb:RCIMIWConnectCallback_onConnected':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        String? userId = arguments['userId'];

        RCIMIWConnectCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onConnected;
        method?.call(code, userId);
        log("[RC:Flutter] engine_cb:RCIMIWConnectCallback_onConnected invoke finished");
        break;

      case 'engine_cb:RCIMIWSendMessageCallback_onMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        RCIMIWSendMessageCallback? callback = getCallback(rongcloudHandler);
        Function(RCIMIWMessage?)? method = callback?.onMessageSaved;
        method?.call(message);
        log("[RC:Flutter] engine_cb:RCIMIWSendMessageCallback_onMessageSaved invoke finished");
        break;

      case 'engine_cb:RCIMIWSendMessageCallback_onMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        RCIMIWSendMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMessage?)? method = callback?.onMessageSent;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:RCIMIWSendMessageCallback_onMessageSent invoke finished");
        break;

      case 'engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        RCIMIWSendMediaMessageListener? callback = getCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?)? method = callback?.onMediaMessageSaved;
        method?.call(message);
        log("[RC:Flutter] engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSaved invoke finished");
        break;

      case 'engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSending':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;
        int? progress = arguments['progress'];

        RCIMIWSendMediaMessageListener? callback = getCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?, int?)? method = callback?.onMediaMessageSending;
        method?.call(message, progress);
        log("[RC:Flutter] engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSending invoke finished");
        break;

      case 'engine_cb:RCIMIWSendMediaMessageListener_onSendingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        RCIMIWSendMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?)? method = callback?.onSendingMediaMessageCanceled;
        method?.call(message);
        log("[RC:Flutter] engine_cb:RCIMIWSendMediaMessageListener_onSendingMediaMessageCanceled invoke finished");
        break;

      case 'engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        RCIMIWSendMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMediaMessage?)? method = callback?.onMediaMessageSent;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:RCIMIWSendMediaMessageListener_onMediaMessageSent invoke finished");
        break;

      case 'engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloading':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;
        int? progress = arguments['progress'];

        RCIMIWDownloadMediaMessageListener? callback = getCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?, int?)? method = callback?.onMediaMessageDownloading;
        method?.call(message, progress);
        log("[RC:Flutter] engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloading invoke finished");
        break;

      case 'engine_cb:RCIMIWDownloadMediaMessageListener_onDownloadingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        RCIMIWDownloadMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?)? method = callback?.onDownloadingMediaMessageCanceled;
        method?.call(message);
        log(
          "[RC:Flutter] engine_cb:RCIMIWDownloadMediaMessageListener_onDownloadingMediaMessageCanceled invoke finished",
        );
        break;

      case 'engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        RCIMIWDownloadMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMediaMessage?)? method = callback?.onMediaMessageDownloaded;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:RCIMIWDownloadMediaMessageListener_onMediaMessageDownloaded invoke finished");
        break;

      case 'engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        RCIMIWSendGroupMessageToDesignatedUsersCallback? callback = getCallback(rongcloudHandler);
        Function(RCIMIWMessage?)? method = callback?.onMessageSaved;
        method?.call(message);
        log("[RC:Flutter] engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSaved invoke finished");
        break;

      case 'engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        RCIMIWSendGroupMessageToDesignatedUsersCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMessage?)? method = callback?.onMessageSent;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:RCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSent invoke finished");
        break;

      case 'engine_cb:IRCIMIWConnectCallback_onConnected':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        String? userId = arguments['userId'];

        IRCIMIWConnectCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onConnected;
        method?.call(code, userId);
        log("[RC:Flutter] engine_cb:IRCIMIWConnectCallback_onConnected invoke finished");
        break;

      case 'engine_cb:IRCIMIWConnectCallback_onDatabaseOpened':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWConnectCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onDatabaseOpened;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWConnectCallback_onDatabaseOpened invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendMessageCallback_onMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        IRCIMIWSendMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMessage?)? method = callback?.onMessageSaved;
        method?.call(message);
        log("[RC:Flutter] engine_cb:IRCIMIWSendMessageCallback_onMessageSaved invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendMessageCallback_onMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        IRCIMIWSendMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMessage?)? method = callback?.onMessageSent;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:IRCIMIWSendMessageCallback_onMessageSent invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        IRCIMIWSendMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?)? method = callback?.onMediaMessageSaved;
        method?.call(message);
        log("[RC:Flutter] engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSaved invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSending':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;
        int? progress = arguments['progress'];

        IRCIMIWSendMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?, int?)? method = callback?.onMediaMessageSending;
        method?.call(message, progress);
        log("[RC:Flutter] engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSending invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendMediaMessageListener_onSendingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        IRCIMIWSendMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?)? method = callback?.onSendingMediaMessageCanceled;
        method?.call(message);
        log("[RC:Flutter] engine_cb:IRCIMIWSendMediaMessageListener_onSendingMediaMessageCanceled invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        IRCIMIWSendMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMediaMessage?)? method = callback?.onMediaMessageSent;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:IRCIMIWSendMediaMessageListener_onMediaMessageSent invoke finished");
        break;

      case 'engine_cb:IRCIMIWCancelSendingMediaMessageCallback_onCancelSendingMediaMessageCalled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        IRCIMIWCancelSendingMediaMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMediaMessage?)? method = callback?.onCancelSendingMediaMessageCalled;
        method?.call(code, message);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWCancelSendingMediaMessageCallback_onCancelSendingMediaMessageCalled invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWDownloadMediaMessageListener_onMediaMessageDownloading':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;
        int? progress = arguments['progress'];

        IRCIMIWDownloadMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?, int?)? method = callback?.onMediaMessageDownloading;
        method?.call(message, progress);
        log("[RC:Flutter] engine_cb:IRCIMIWDownloadMediaMessageListener_onMediaMessageDownloading invoke finished");
        break;

      case 'engine_cb:IRCIMIWDownloadMediaMessageListener_onDownloadingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        IRCIMIWDownloadMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMediaMessage?)? method = callback?.onDownloadingMediaMessageCanceled;
        method?.call(message);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWDownloadMediaMessageListener_onDownloadingMediaMessageCanceled invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWDownloadMediaMessageListener_onMediaMessageDownloaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        IRCIMIWDownloadMediaMessageListener? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMediaMessage?)? method = callback?.onMediaMessageDownloaded;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:IRCIMIWDownloadMediaMessageListener_onMediaMessageDownloaded invoke finished");
        break;

      case 'engine_cb:IRCIMIWCancelDownloadingMediaMessageCallback_onCancelDownloadingMediaMessageCalled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMediaMessage? message =
            arguments['message'] != null
                ? (RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message'])) as RCIMIWMediaMessage?)
                : null;

        IRCIMIWCancelDownloadingMediaMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMediaMessage?)? method = callback?.onCancelDownloadingMediaMessageCalled;
        method?.call(code, message);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWCancelDownloadingMediaMessageCallback_onCancelDownloadingMediaMessageCalled invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetConversationCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWConversation? t =
            arguments['t'] != null ? RCIMIWConversation.fromJson(Map<String, dynamic>.from(arguments['t'])) : null;

        IRCIMIWGetConversationCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWConversation?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetConversationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversation> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWConversation>? t = tStr;

        IRCIMIWGetConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWConversation>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadConversationsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversation> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWConversation>? t = tStr;

        IRCIMIWGetUnreadConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWConversation>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadConversationsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadConversationsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUnreadConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadConversationsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveConversationCallback_onConversationRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveConversationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationRemoved;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveConversationCallback_onConversationRemoved invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveConversationsCallback_onConversationsRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationsRemoved;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveConversationsCallback_onConversationsRemoved invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetTotalUnreadCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetTotalUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTotalUnreadCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetTotalUnreadCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetTotalUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTotalUnreadCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUnreadMentionedCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUnreadMentionedCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadMentionedCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUltraGroupAllUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUltraGroupAllUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupAllUnreadCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUltraGroupUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUltraGroupUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupUnreadCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupUnreadMentionedCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUnreadCountByConversationTypesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUnreadCountByConversationTypesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadCountByConversationTypesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetUnreadCountByLevelsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUnreadCountByLevelsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadCountByLevelsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWClearUnreadCountCallback_onUnreadCountCleared':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWClearUnreadCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUnreadCountCleared;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWClearUnreadCountCallback_onUnreadCountCleared invoke finished");
        break;

      case 'engine_cb:IRCIMIWSaveDraftMessageCallback_onDraftMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSaveDraftMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onDraftMessageSaved;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSaveDraftMessageCallback_onDraftMessageSaved invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetDraftMessageCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        String? t = arguments['t'];

        IRCIMIWGetDraftMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(String?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetDraftMessageCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetDraftMessageCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetDraftMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetDraftMessageCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWClearDraftMessageCallback_onDraftMessageCleared':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWClearDraftMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onDraftMessageCleared;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWClearDraftMessageCallback_onDraftMessageCleared invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetBlockedConversationsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversation> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWConversation>? t = tStr;

        IRCIMIWGetBlockedConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWConversation>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBlockedConversationsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetBlockedConversationsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetBlockedConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBlockedConversationsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeConversationTopStatusCallback_onConversationTopStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeConversationTopStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationTopStatusChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeConversationTopStatusCallback_onConversationTopStatusChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetConversationTopStatusCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        bool? t = arguments['t'];

        IRCIMIWGetConversationTopStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(bool?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationTopStatusCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationTopStatusCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetConversationTopStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationTopStatusCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSyncConversationReadStatusCallback_onConversationReadStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSyncConversationReadStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationReadStatusSynced;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWSyncConversationReadStatusCallback_onConversationReadStatusSynced invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetMessagesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWGetMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessagesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMessagesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessagesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMessageCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMessage? t =
            arguments['t'] != null ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['t'])) : null;

        IRCIMIWGetMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMessage?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessageCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMessageCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessageCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWGetMessagesAroundTimeCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetMessagesAroundTimeCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessagesAroundTimeCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMessage? t =
            arguments['t'] != null ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['t'])) : null;

        IRCIMIWGetFirstUnreadMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMessage?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetFirstUnreadMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetFirstUnreadMessageCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWGetUnreadMentionedMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUnreadMentionedMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUnreadMentionedMessagesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWInsertMessageCallback_onMessageInserted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        IRCIMIWInsertMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMessage?)? method = callback?.onMessageInserted;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:IRCIMIWInsertMessageCallback_onMessageInserted invoke finished");
        break;

      case 'engine_cb:IRCIMIWInsertMessagesCallback_onMessagesInserted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        List<RCIMIWMessage>? messages = messagesStr;

        IRCIMIWInsertMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, List<RCIMIWMessage>?)? method = callback?.onMessagesInserted;
        method?.call(code, messages);
        log("[RC:Flutter] engine_cb:IRCIMIWInsertMessagesCallback_onMessagesInserted invoke finished");
        break;

      case 'engine_cb:IRCIMIWClearMessagesCallback_onMessagesCleared':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWClearMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onMessagesCleared;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWClearMessagesCallback_onMessagesCleared invoke finished");
        break;

      case 'engine_cb:IRCIMIWDeleteLocalMessagesCallback_onLocalMessagesDeleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        List<RCIMIWMessage>? messages = messagesStr;

        IRCIMIWDeleteLocalMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, List<RCIMIWMessage>?)? method = callback?.onLocalMessagesDeleted;
        method?.call(code, messages);
        log("[RC:Flutter] engine_cb:IRCIMIWDeleteLocalMessagesCallback_onLocalMessagesDeleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWDeleteLocalMessageByIdsCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWDeleteLocalMessageByIdsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWDeleteLocalMessageByIdsCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWCompletionCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWCompletionCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWCompletionCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWDeleteMessagesCallback_onMessagesDeleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        List<RCIMIWMessage>? messages = messagesStr;

        IRCIMIWDeleteMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, List<RCIMIWMessage>?)? method = callback?.onMessagesDeleted;
        method?.call(code, messages);
        log("[RC:Flutter] engine_cb:IRCIMIWDeleteMessagesCallback_onMessagesDeleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWRecallMessageCallback_onMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        IRCIMIWRecallMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMessage?)? method = callback?.onMessageRecalled;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:IRCIMIWRecallMessageCallback_onMessageRecalled invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendPrivateReadReceiptMessageCallback_onPrivateReadReceiptMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSendPrivateReadReceiptMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onPrivateReadReceiptMessageSent;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWSendPrivateReadReceiptMessageCallback_onPrivateReadReceiptMessageSent invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWSendGroupReadReceiptRequestCallback_onGroupReadReceiptRequestSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        IRCIMIWSendGroupReadReceiptRequestCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMessage?)? method = callback?.onGroupReadReceiptRequestSent;
        method?.call(code, message);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWSendGroupReadReceiptRequestCallback_onGroupReadReceiptRequestSent invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWSendGroupReadReceiptResponseCallback_onGroupReadReceiptResponseSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messageStr = [];
        arguments['message'].forEach((element) {
          messageStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        List<RCIMIWMessage>? message = messageStr;

        IRCIMIWSendGroupReadReceiptResponseCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, List<RCIMIWMessage>?)? method = callback?.onGroupReadReceiptResponseSent;
        method?.call(code, message);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWSendGroupReadReceiptResponseCallback_onGroupReadReceiptResponseSent invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWUpdateMessageExpansionCallback_onMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWUpdateMessageExpansionCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onMessageExpansionUpdated;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWUpdateMessageExpansionCallback_onMessageExpansionUpdated invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveMessageExpansionForKeysCallback_onMessageExpansionForKeysRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveMessageExpansionForKeysCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onMessageExpansionForKeysRemoved;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWRemoveMessageExpansionForKeysCallback_onMessageExpansionForKeysRemoved invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWChangeMessageSentStatusCallback_onMessageSentStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeMessageSentStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onMessageSentStatusChanged;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWChangeMessageSentStatusCallback_onMessageSentStatusChanged invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeMessageReceivedStatusCallback_onMessageReceiveStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeMessageReceivedStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onMessageReceiveStatusChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeMessageReceivedStatusCallback_onMessageReceiveStatusChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWChangeMessageReceivedStatusInfoCallback_onMessageReceiveStatusInfoChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeMessageReceivedStatusInfoCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onMessageReceiveStatusInfoChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeMessageReceivedStatusInfoCallback_onMessageReceiveStatusInfoChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWUpdateMessageLocalExtraCallback_onMessageLocalExtraUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWUpdateMessageLocalExtraCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onMessageLocalExtraUpdated;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWUpdateMessageLocalExtraCallback_onMessageLocalExtraUpdated invoke finished");
        break;

      case 'engine_cb:IRCIMIWJoinChatRoomCallback_onChatRoomJoined':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        String? targetId = arguments['targetId'];

        IRCIMIWJoinChatRoomCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onChatRoomJoined;
        method?.call(code, targetId);
        log("[RC:Flutter] engine_cb:IRCIMIWJoinChatRoomCallback_onChatRoomJoined invoke finished");
        break;

      case 'engine_cb:IRCIMIWLeaveChatRoomCallback_onChatRoomLeft':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        String? targetId = arguments['targetId'];

        IRCIMIWLeaveChatRoomCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onChatRoomLeft;
        method?.call(code, targetId);
        log("[RC:Flutter] engine_cb:IRCIMIWLeaveChatRoomCallback_onChatRoomLeft invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetChatRoomMessagesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWGetChatRoomMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetChatRoomMessagesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetChatRoomMessagesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetChatRoomMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetChatRoomMessagesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWAddChatRoomEntryCallback_onChatRoomEntryAdded':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWAddChatRoomEntryCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onChatRoomEntryAdded;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWAddChatRoomEntryCallback_onChatRoomEntryAdded invoke finished");
        break;

      case 'engine_cb:IRCIMIWAddChatRoomEntriesCallback_onChatRoomEntriesAdded':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        Map? errors = arguments['errors'];

        IRCIMIWAddChatRoomEntriesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, Map?)? method = callback?.onChatRoomEntriesAdded;
        method?.call(code, errors);
        log("[RC:Flutter] engine_cb:IRCIMIWAddChatRoomEntriesCallback_onChatRoomEntriesAdded invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetChatRoomEntryCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        Map? t = arguments['t'];

        IRCIMIWGetChatRoomEntryCallback? callback = takeCallback(rongcloudHandler);
        Function(Map?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetChatRoomEntryCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetChatRoomEntryCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetChatRoomEntryCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetChatRoomEntryCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        Map? t = arguments['t'];

        IRCIMIWGetChatRoomAllEntriesCallback? callback = takeCallback(rongcloudHandler);
        Function(Map?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetChatRoomAllEntriesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetChatRoomAllEntriesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveChatRoomEntryCallback_onChatRoomEntryRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveChatRoomEntryCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onChatRoomEntryRemoved;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveChatRoomEntryCallback_onChatRoomEntryRemoved invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveChatRoomEntriesCallback_onChatRoomEntriesRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveChatRoomEntriesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onChatRoomEntriesRemoved;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveChatRoomEntriesCallback_onChatRoomEntriesRemoved invoke finished");
        break;

      case 'engine_cb:IRCIMIWAddToBlacklistCallback_onBlacklistAdded':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        String? userId = arguments['userId'];

        IRCIMIWAddToBlacklistCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onBlacklistAdded;
        method?.call(code, userId);
        log("[RC:Flutter] engine_cb:IRCIMIWAddToBlacklistCallback_onBlacklistAdded invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveFromBlacklistCallback_onBlacklistRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        String? userId = arguments['userId'];

        IRCIMIWRemoveFromBlacklistCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onBlacklistRemoved;
        method?.call(code, userId);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveFromBlacklistCallback_onBlacklistRemoved invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetBlacklistStatusCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWBlacklistStatus? t = arguments['t'] == null ? null : RCIMIWBlacklistStatus.values[arguments['t']];

        IRCIMIWGetBlacklistStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWBlacklistStatus?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBlacklistStatusCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetBlacklistStatusCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetBlacklistStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBlacklistStatusCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetBlacklistCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        List<String>? t = List.from(arguments['t']);

        IRCIMIWGetBlacklistCallback? callback = takeCallback(rongcloudHandler);
        Function(List<String>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBlacklistCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetBlacklistCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetBlacklistCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBlacklistCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWSearchMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSearchMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWSearchMessagesByTimeRangeCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSearchMessagesByTimeRangeCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesByTimeRangeCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWSearchMessagesByUserIdCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSearchMessagesByUserIdCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesByUserIdCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? t = tStr;

        IRCIMIWSearchMessagesByMessageTypesCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSearchMessagesByMessageTypesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchMessagesByMessageTypesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchConversationsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWSearchConversationResult> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(
            RCIMIWSearchConversationResult.fromJson(
              (element as Map).map((key, value) => MapEntry(key.toString(), value)),
            ),
          );
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWSearchConversationResult>? t = tStr;

        IRCIMIWSearchConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWSearchConversationResult>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchConversationsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchConversationsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSearchConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchConversationsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeNotificationQuietHoursCallback_onNotificationQuietHoursChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeNotificationQuietHoursCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onNotificationQuietHoursChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeNotificationQuietHoursCallback_onNotificationQuietHoursChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWRemoveNotificationQuietHoursCallback_onNotificationQuietHoursRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveNotificationQuietHoursCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onNotificationQuietHoursRemoved;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWRemoveNotificationQuietHoursCallback_onNotificationQuietHoursRemoved invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        String? startTime = arguments['startTime'];
        int? spanMinutes = arguments['spanMinutes'];
        RCIMIWPushNotificationQuietHoursLevel? level =
            arguments['level'] == null ? null : RCIMIWPushNotificationQuietHoursLevel.values[arguments['level']];

        IRCIMIWGetNotificationQuietHoursCallback? callback = takeCallback(rongcloudHandler);
        Function(String?, int?, RCIMIWPushNotificationQuietHoursLevel?)? method = callback?.onSuccess;
        method?.call(startTime, spanMinutes, level);
        log("[RC:Flutter] engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetNotificationQuietHoursCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetNotificationQuietHoursCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeConversationNotificationLevelCallback_onConversationNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeConversationNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationNotificationLevelChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeConversationNotificationLevelCallback_onConversationNotificationLevelChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPushNotificationLevel? t =
            arguments['t'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['t']];

        IRCIMIWGetConversationNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPushNotificationLevel?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetConversationNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationNotificationLevelCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeConversationTypeNotificationLevelCallback_onConversationTypeNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeConversationTypeNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationTypeNotificationLevelChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeConversationTypeNotificationLevelCallback_onConversationTypeNotificationLevelChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPushNotificationLevel? t =
            arguments['t'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['t']];

        IRCIMIWGetConversationTypeNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPushNotificationLevel?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetConversationTypeNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationTypeNotificationLevelCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback_onUltraGroupDefaultNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupDefaultNotificationLevelChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback_onUltraGroupDefaultNotificationLevelChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPushNotificationLevel? t =
            arguments['t'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['t']];

        IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPushNotificationLevel?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupDefaultNotificationLevelCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback_onUltraGroupChannelDefaultNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupChannelDefaultNotificationLevelChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback_onUltraGroupChannelDefaultNotificationLevelChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPushNotificationLevel? t =
            arguments['t'] == null ? null : RCIMIWPushNotificationLevel.values[arguments['t']];

        IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPushNotificationLevel?)? method = callback?.onSuccess;
        method?.call(t);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onSuccess invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback_onError invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWChangePushContentShowStatusCallback_onPushContentShowStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangePushContentShowStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onPushContentShowStatusChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangePushContentShowStatusCallback_onPushContentShowStatusChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWChangePushLanguageCallback_onPushLanguageChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangePushLanguageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onPushLanguageChanged;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWChangePushLanguageCallback_onPushLanguageChanged invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangePushReceiveStatusCallback_onPushReceiveStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangePushReceiveStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onPushReceiveStatusChanged;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWChangePushReceiveStatusCallback_onPushReceiveStatusChanged invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        IRCIMIWSendGroupMessageToDesignatedUsersCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWMessage?)? method = callback?.onMessageSaved;
        method?.call(message);
        log("[RC:Flutter] engine_cb:IRCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSaved invoke finished");
        break;

      case 'engine_cb:IRCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        RCIMIWMessage? message =
            arguments['message'] != null
                ? RCIMConverter.convertMessage(Map<String, dynamic>.from(arguments['message']))
                : null;

        IRCIMIWSendGroupMessageToDesignatedUsersCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, RCIMIWMessage?)? method = callback?.onMessageSent;
        method?.call(code, message);
        log("[RC:Flutter] engine_cb:IRCIMIWSendGroupMessageToDesignatedUsersCallback_onMessageSent invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMessageCountCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWGetMessageCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessageCountCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMessageCountCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetMessageCountCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMessageCountCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetTopConversationsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversation> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWConversation>? t = tStr;

        IRCIMIWGetTopConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWConversation>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTopConversationsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetTopConversationsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetTopConversationsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTopConversationsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSyncUltraGroupReadStatusCallback_onUltraGroupReadStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSyncUltraGroupReadStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupReadStatusSynced;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWSyncUltraGroupReadStatusCallback_onUltraGroupReadStatusSynced invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversation> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWConversation.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWConversation>? t = tStr;

        IRCIMIWGetConversationsForAllChannelCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWConversation>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetConversationsForAllChannelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationsForAllChannelCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWModifyUltraGroupMessageCallback_onUltraGroupMessageModified':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWModifyUltraGroupMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupMessageModified;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWModifyUltraGroupMessageCallback_onUltraGroupMessageModified invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWRecallUltraGroupMessageCallback_onUltraGroupMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRecallUltraGroupMessageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupMessageRecalled;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWRecallUltraGroupMessageCallback_onUltraGroupMessageRecalled invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWClearUltraGroupMessagesCallback_onUltraGroupMessagesCleared':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWClearUltraGroupMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupMessagesCleared;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWClearUltraGroupMessagesCallback_onUltraGroupMessagesCleared invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWSendUltraGroupTypingStatusCallback_onUltraGroupTypingStatusSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSendUltraGroupTypingStatusCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupTypingStatusSent;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWSendUltraGroupTypingStatusCallback_onUltraGroupTypingStatusSent invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWClearUltraGroupMessagesForAllChannelCallback_onUltraGroupMessagesClearedForAllChannel':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupMessagesClearedForAllChannel;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWClearUltraGroupMessagesForAllChannelCallback_onUltraGroupMessagesClearedForAllChannel invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> matchedMessagesStr = [];
        arguments['matchedMessages'].forEach((element) {
          matchedMessagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });
        List<RCIMIWMessage> notMatchedMessagesStr = [];
        arguments['notMatchedMessages'].forEach((element) {
          notMatchedMessagesStr.add(RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWMessage>? matchedMessages = matchedMessagesStr;
        List<RCIMIWMessage>? notMatchedMessages = notMatchedMessagesStr;

        IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWMessage>?, List<RCIMIWMessage>?)? method = callback?.onSuccess;
        method?.call(matchedMessages, notMatchedMessages);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetBatchRemoteUltraGroupMessagesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWUpdateUltraGroupMessageExpansionCallback_onUltraGroupMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupMessageExpansionUpdated;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWUpdateUltraGroupMessageExpansionCallback_onUltraGroupMessageExpansionUpdated invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback_onUltraGroupMessageExpansionForKeysRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onUltraGroupMessageExpansionForKeysRemoved;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback_onUltraGroupMessageExpansionForKeysRemoved invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWCreateTagCallback_onTagCreated':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWCreateTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onTagCreated;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWCreateTagCallback_onTagCreated invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveTagCallback_onTagRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onTagRemoved;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveTagCallback_onTagRemoved invoke finished");
        break;

      case 'engine_cb:IRCIMIWUpdateTagNameByIdCallback_onTagNameByIdUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWUpdateTagNameByIdCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onTagNameByIdUpdated;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWUpdateTagNameByIdCallback_onTagNameByIdUpdated invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetTagsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWTagInfo> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWTagInfo.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWTagInfo>? t = tStr;

        IRCIMIWGetTagsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWTagInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTagsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetTagsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetTagsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTagsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWAddConversationToTagCallback_onConversationToTagAdded':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWAddConversationToTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationToTagAdded;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWAddConversationToTagCallback_onConversationToTagAdded invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveConversationFromTagCallback_onConversationFromTagRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveConversationFromTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationFromTagRemoved;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWRemoveConversationFromTagCallback_onConversationFromTagRemoved invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWRemoveTagsFromConversationCallback_onTagsFromConversationRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveTagsFromConversationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onTagsFromConversationRemoved;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWRemoveTagsFromConversationCallback_onTagsFromConversationRemoved invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetTagsFromConversationCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversationTagInfo> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(
            RCIMIWConversationTagInfo.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWConversationTagInfo>? t = tStr;

        IRCIMIWGetTagsFromConversationCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWConversationTagInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTagsFromConversationCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetTagsFromConversationCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetTagsFromConversationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetTagsFromConversationCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWChangeConversationTopStatusInTagCallback_onConversationTopStatusInTagChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWChangeConversationTopStatusInTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onConversationTopStatusInTagChanged;
        method?.call(code);
        log(
          "[RC:Flutter] engine_cb:IRCIMIWChangeConversationTopStatusInTagCallback_onConversationTopStatusInTagChanged invoke finished",
        );
        break;

      case 'engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        bool? t = arguments['t'];

        IRCIMIWGetConversationTopStatusInTagCallback? callback = takeCallback(rongcloudHandler);
        Function(bool?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetConversationTopStatusInTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetConversationTopStatusInTagCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        bool? t = arguments['t'];

        IRCIMIWClearMessagesUnreadStatusByTagCallback? callback = takeCallback(rongcloudHandler);
        Function(bool?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWClearMessagesUnreadStatusByTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWClearMessagesUnreadStatusByTagCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWClearConversationsByTagCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        bool? t = arguments['t'];

        IRCIMIWClearConversationsByTagCallback? callback = takeCallback(rongcloudHandler);
        Function(bool?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWClearConversationsByTagCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWClearConversationsByTagCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWClearConversationsByTagCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWClearConversationsByTagCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWCreateGroupCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? processCode = arguments['processCode'];

        IRCIMIWCreateGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(processCode);
        log("[RC:Flutter] engine_cb:IRCIMIWCreateGroupCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWCreateGroupCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? errorCode = arguments['errorCode'];
        String? errorInfo = arguments['errorInfo'];

        IRCIMIWCreateGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onError;
        method?.call(errorCode, errorInfo);
        log("[RC:Flutter] engine_cb:IRCIMIWCreateGroupCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGroupInfoUpdatedCallback_onGroupInfoUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        String? errorInfo = arguments['errorInfo'];

        IRCIMIWGroupInfoUpdatedCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, String?)? method = callback?.onGroupInfoUpdated;
        method?.call(code, errorInfo);
        log("[RC:Flutter] engine_cb:IRCIMIWGroupInfoUpdatedCallback_onGroupInfoUpdated invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupsInfoCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWGroupInfo> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWGroupInfo.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWGroupInfo>? t = tStr;

        IRCIMIWGetGroupsInfoCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWGroupInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupsInfoCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupsInfoCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetGroupsInfoCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupsInfoCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWKickGroupMembersCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWKickGroupMembersCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWKickGroupMembersCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWJoinGroupCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWJoinGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWJoinGroupCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWJoinGroupCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWJoinGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWJoinGroupCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWQuitGroupCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWQuitGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWQuitGroupCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWDismissGroupCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWDismissGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWDismissGroupCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWTransferGroupOwnerCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWTransferGroupOwnerCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWTransferGroupOwnerCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupMembersCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWGroupMemberInfo> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(
            RCIMIWGroupMemberInfo.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWGroupMemberInfo>? t = tStr;

        IRCIMIWGetGroupMembersCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWGroupMemberInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupMembersCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupMembersCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetGroupMembersCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupMembersCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t =
            arguments['t'] != null
                ? RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>.fromJson(Map<String, dynamic>.from(arguments['t']))
                : null;

        IRCIMIWGetGroupMembersByRoleCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetGroupMembersByRoleCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupMembersByRoleCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t =
            arguments['t'] != null
                ? RCIMIWPagingQueryResult<RCIMIWGroupInfo>.fromJson(Map<String, dynamic>.from(arguments['t']))
                : null;

        IRCIMIWGetJoinedGroupsByRoleCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPagingQueryResult<RCIMIWGroupInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetJoinedGroupsByRoleCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetJoinedGroupsByRoleCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetJoinedGroupsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWGroupInfo> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWGroupInfo.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWGroupInfo>? t = tStr;

        IRCIMIWGetJoinedGroupsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWGroupInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetJoinedGroupsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetJoinedGroupsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetJoinedGroupsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetJoinedGroupsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSetGroupRemarkCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSetGroupRemarkCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSetGroupRemarkCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWSetGroupMemberInfoCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSetGroupMemberInfoCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSetGroupMemberInfoCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchJoinedGroupsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPagingQueryResult<RCIMIWGroupInfo>? t =
            arguments['t'] != null
                ? RCIMIWPagingQueryResult<RCIMIWGroupInfo>.fromJson(Map<String, dynamic>.from(arguments['t']))
                : null;

        IRCIMIWSearchJoinedGroupsCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPagingQueryResult<RCIMIWGroupInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchJoinedGroupsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchJoinedGroupsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSearchJoinedGroupsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchJoinedGroupsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchGroupMembersCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>? t =
            arguments['t'] != null
                ? RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>.fromJson(Map<String, dynamic>.from(arguments['t']))
                : null;

        IRCIMIWSearchGroupMembersCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPagingQueryResult<RCIMIWGroupMemberInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchGroupMembersCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchGroupMembersCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWSearchGroupMembersCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchGroupMembersCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWAddGroupManagersCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWAddGroupManagersCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWAddGroupManagersCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveGroupManagersCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveGroupManagersCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveGroupManagersCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWInviteUsersToGroupCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWInviteUsersToGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWInviteUsersToGroupCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWInviteUsersToGroupCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWInviteUsersToGroupCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWInviteUsersToGroupCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWAcceptGroupInviteCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWAcceptGroupInviteCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWAcceptGroupInviteCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWRefuseGroupInviteCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRefuseGroupInviteCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRefuseGroupInviteCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWAcceptGroupApplicationCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? t = arguments['t'];

        IRCIMIWAcceptGroupApplicationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWAcceptGroupApplicationCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWAcceptGroupApplicationCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWAcceptGroupApplicationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWAcceptGroupApplicationCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWRefuseGroupApplicationCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRefuseGroupApplicationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRefuseGroupApplicationCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupApplicationsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo>? t =
            arguments['t'] != null
                ? RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo>.fromJson(
                  Map<String, dynamic>.from(arguments['t']),
                )
                : null;

        IRCIMIWGetGroupApplicationsCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWPagingQueryResult<RCIMIWGroupApplicationInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupApplicationsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupApplicationsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetGroupApplicationsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupApplicationsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWAddGroupFollowsCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWAddGroupFollowsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWAddGroupFollowsCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWRemoveGroupFollowsCallback_onCompleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWRemoveGroupFollowsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onCompleted;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWRemoveGroupFollowsCallback_onCompleted invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupFollowsCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWFollowInfo> tStr = [];
        arguments['t'].forEach((element) {
          tStr.add(RCIMIWFollowInfo.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))));
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWFollowInfo>? t = tStr;

        IRCIMIWGetGroupFollowsCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWFollowInfo>?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupFollowsCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetGroupFollowsCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetGroupFollowsCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetGroupFollowsCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWTranslateResponseCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onTranslateResponse;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWTranslateResponseCallback_onTranslateResponse invoke finished");
        break;

      case 'engine_cb:IRCIMIWTranslateGetLanguageCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        String? t = arguments['t'];

        IRCIMIWTranslateGetLanguageCallback? callback = takeCallback(rongcloudHandler);
        Function(String?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWTranslateGetLanguageCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWTranslateGetLanguageCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWTranslateGetLanguageCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWTranslateGetLanguageCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        bool? t = arguments['t'];

        IRCIMIWGetAutoTranslateEnabledCallback? callback = takeCallback(rongcloudHandler);
        Function(bool?)? method = callback?.onSuccess;
        method?.call(t);
        log("[RC:Flutter] engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWGetAutoTranslateEnabledCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWGetAutoTranslateEnabledCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];

        IRCIMIWUpdateMyUserProfileVisibilityCallback? callback = takeCallback(rongcloudHandler);
        Function()? method = callback?.onSuccess;
        method?.call();
        log("[RC:Flutter] engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? errorCode = arguments['errorCode'];

        IRCIMIWUpdateMyUserProfileVisibilityCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(errorCode);
        log("[RC:Flutter] engine_cb:IRCIMIWUpdateMyUserProfileVisibilityCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? visibility = arguments['visibility'];

        IRCIMIWGetMyUserProfileVisibilityCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onSuccess;
        method?.call(visibility);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? errorCode = arguments['errorCode'];

        IRCIMIWGetMyUserProfileVisibilityCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(errorCode);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMyUserProfileVisibilityCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWUpdateMyUserProfileCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];

        IRCIMIWUpdateMyUserProfileCallback? callback = takeCallback(rongcloudHandler);
        Function()? method = callback?.onSuccess;
        method?.call();
        log("[RC:Flutter] engine_cb:IRCIMIWUpdateMyUserProfileCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWUpdateMyUserProfileCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? errorCode = arguments['errorCode'];
        List<String>? errorKeys = List.from(arguments['errorKeys']);

        IRCIMIWUpdateMyUserProfileCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, List<String>?)? method = callback?.onError;
        method?.call(errorCode, errorKeys);
        log("[RC:Flutter] engine_cb:IRCIMIWUpdateMyUserProfileCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMyUserProfileCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWUserProfile? userProfile =
            arguments['userProfile'] != null
                ? RCIMIWUserProfile.fromJson(Map<String, dynamic>.from(arguments['userProfile']))
                : null;

        IRCIMIWGetMyUserProfileCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWUserProfile?)? method = callback?.onSuccess;
        method?.call(userProfile);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMyUserProfileCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetMyUserProfileCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? errorCode = arguments['errorCode'];

        IRCIMIWGetMyUserProfileCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(errorCode);
        log("[RC:Flutter] engine_cb:IRCIMIWGetMyUserProfileCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUserProfilesCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWUserProfile> userProfilesStr = [];
        arguments['userProfiles'].forEach((element) {
          userProfilesStr.add(
            RCIMIWUserProfile.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWUserProfile>? userProfiles = userProfilesStr;

        IRCIMIWGetUserProfilesCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWUserProfile>?)? method = callback?.onSuccess;
        method?.call(userProfiles);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUserProfilesCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWGetUserProfilesCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? errorCode = arguments['errorCode'];

        IRCIMIWGetUserProfilesCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(errorCode);
        log("[RC:Flutter] engine_cb:IRCIMIWGetUserProfilesCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        RCIMIWUserProfile? userProfile =
            arguments['userProfile'] != null
                ? RCIMIWUserProfile.fromJson(Map<String, dynamic>.from(arguments['userProfile']))
                : null;

        IRCIMIWSearchUserProfileByUniqueIdCallback? callback = takeCallback(rongcloudHandler);
        Function(RCIMIWUserProfile?)? method = callback?.onSuccess;
        method?.call(userProfile);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? errorCode = arguments['errorCode'];

        IRCIMIWSearchUserProfileByUniqueIdCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(errorCode);
        log("[RC:Flutter] engine_cb:IRCIMIWSearchUserProfileByUniqueIdCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWSubscribeEventCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];

        IRCIMIWSubscribeEventCallback? callback = takeCallback(rongcloudHandler);
        Function()? method = callback?.onSuccess;
        method?.call();
        log("[RC:Flutter] engine_cb:IRCIMIWSubscribeEventCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWSubscribeEventCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];
        List<String>? failedUserIds = List.from(arguments['failedUserIds']);

        IRCIMIWSubscribeEventCallback? callback = takeCallback(rongcloudHandler);
        Function(int?, List<String>?)? method = callback?.onError;
        method?.call(code, failedUserIds);
        log("[RC:Flutter] engine_cb:IRCIMIWSubscribeEventCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWQuerySubscribeEventCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWSubscribeInfoEvent> eventsStr = [];
        arguments['events'].forEach((element) {
          eventsStr.add(
            RCIMIWSubscribeInfoEvent.fromJson((element as Map).map((key, value) => MapEntry(key.toString(), value))),
          );
        });

        int rongcloudHandler = arguments['cb_handler'];
        List<RCIMIWSubscribeInfoEvent>? events = eventsStr;

        IRCIMIWQuerySubscribeEventCallback? callback = takeCallback(rongcloudHandler);
        Function(List<RCIMIWSubscribeInfoEvent>?)? method = callback?.onSuccess;
        method?.call(events);
        log("[RC:Flutter] engine_cb:IRCIMIWQuerySubscribeEventCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWQuerySubscribeEventCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWQuerySubscribeEventCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWQuerySubscribeEventCallback_onError invoke finished");
        break;

      case 'engine_cb:IRCIMIWOperationCallback_onSuccess':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];

        IRCIMIWOperationCallback? callback = takeCallback(rongcloudHandler);
        Function()? method = callback?.onSuccess;
        method?.call();
        log("[RC:Flutter] engine_cb:IRCIMIWOperationCallback_onSuccess invoke finished");
        break;

      case 'engine_cb:IRCIMIWOperationCallback_onError':
        Map<dynamic, dynamic> arguments = call.arguments;
        int rongcloudHandler = arguments['cb_handler'];
        int? code = arguments['code'];

        IRCIMIWOperationCallback? callback = takeCallback(rongcloudHandler);
        Function(int?)? method = callback?.onError;
        method?.call(code);
        log("[RC:Flutter] engine_cb:IRCIMIWOperationCallback_onError invoke finished");
        break;
    }
  }
}
