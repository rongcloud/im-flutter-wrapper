import 'dart:async';
import 'package:flutter/services.dart';
import 'rongcloud_im_classes.dart';
import 'rongcloud_im_enum.dart';
import 'rongcloud_im_converter.dart';
import 'dart:developer';

class RCIMIWEngine {
  static RCIMIWEngine? _instance;
  final MethodChannel _channel;

  RCIMIWEngine._()
      : _channel = const MethodChannel('cn.rongcloud.im.flutter/RCIMIWEngine') {
    _channel.setMethodCallHandler(_handler);
  }

  Future<RCIMIWEngine> _create(
    String appKey,
    RCIMIWEngineOptions options,
  ) async {
    Map<String, dynamic> arguments = {
      "appKey": appKey,
      "options": options.toJson(),
    };
    await _channel.invokeMethod('engine:create', arguments);
    return Future.value(this);
  }

  /// 引擎构建方法
  /// - [appKey] 开发者后台获取的 AppKey
  /// - [options] 引擎相关配置项
  static Future<RCIMIWEngine> create(
    String appKey,
    RCIMIWEngineOptions options,
  ) async {
    _instance ??= RCIMIWEngine._();
    return _instance!._create(appKey, options);
  }

  /// 销毁引擎
  Future<void> destroy() async {
    _instance = null;
    await _channel.invokeMethod('engine:destroy');
  }

  /// 连接融云服务器，在整个应用程序全局，只需要调用一次。调用此接口返回非业务错误码时，SDK 会启动重连机制进行重连；如果仍没有连接成功，会在设备网络状态变化时再次进行重连。
  /// - [token] 调用 server api 获取到的 token
  /// - [timeout] 连接超时时间，单位：秒。
  /// timeLimit <= 0，则 IM 将一直连接，直到连接成功或者无法连接（如 token 非法）
  /// timeLimit > 0，则 IM 将最多连接 timeLimit 秒
  /// 如果在 timeLimit 秒内连接成功，后面再发生了网络变化或前后台切换，SDK 会自动重连； 如果在 timeLimit 秒无法连接成功则不再进行重连，通过 listener 告知连接超时，您需要再自行调用 connect 接口
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onConnected]
  Future<int> connect(
    String token,
    int timeout,
  ) async {
    Map<String, dynamic> arguments = {
      "token": token,
      "timeout": timeout,
    };
    log("[RC:Flutter] engine:connect arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:connect', arguments);
    return result;
  }

  /// 断开链接
  /// 注：因为 SDK 在前后台切换或者网络出现异常都会自动重连，保证连接可靠性。 所以除非您的 App 逻辑需要登出，否则一般不需要调用此方法进行手动断开
  /// - [receivePush] 退出后是否接收 push，true:断开后接收远程推送，false:断开后不再接收远程推送
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> disconnect(
    bool receivePush,
  ) async {
    Map<String, dynamic> arguments = {
      "receivePush": receivePush,
    };
    log("[RC:Flutter] engine:disconnect arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:disconnect', arguments);
    return result;
  }

  /// 构建文本消息
  /// - [type] 会话类型，
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [text] 文本内容
  /// - [返回值] 文本消息实体
  Future<RCIMIWTextMessage> createTextMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String text,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "text": text,
    };
    log("[RC:Flutter] engine:createTextMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createTextMessage', arguments);
    return RCIMIWTextMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建图片消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 图片消息的本地路径，必须为有效路径
  /// - [返回值] 图片消息实体
  Future<RCIMIWImageMessage> createImageMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "path": path,
    };
    log("[RC:Flutter] engine:createImageMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createImageMessage', arguments);
    return RCIMIWImageMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建文件消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 文件消息的本地路径，必须为有效路径
  /// - [返回值] 文件消息实体
  Future<RCIMIWFileMessage> createFileMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "path": path,
    };
    log("[RC:Flutter] engine:createFileMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createFileMessage', arguments);
    return RCIMIWFileMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建小视频消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 小视频消息的本地路径，必须为有效路径
  /// - [duration] 小视频消息的视频时长
  /// - [返回值] 视频消息实体
  Future<RCIMIWSightMessage> createSightMessage(
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
    log("[RC:Flutter] engine:createSightMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createSightMessage', arguments);
    return RCIMIWSightMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建语音消息 (高清语音)
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 语音消息的本地路径，必须为有效路径
  /// - [duration] 语音消息的消息时长
  /// - [返回值] 语音消息的实体
  Future<RCIMIWVoiceMessage> createVoiceMessage(
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
    log("[RC:Flutter] engine:createVoiceMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createVoiceMessage', arguments);
    return RCIMIWVoiceMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建引用消息
  /// - [type] 会话类型
  /// - [targetId]    会话 ID
  /// - [channelId]   频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [referenceMessage] 引用的消息
  /// - [text]   引用的文本内容
  /// - [返回值] 引用消息实体
  Future<RCIMIWReferenceMessage> createReferenceMessage(
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
    log("[RC:Flutter] engine:createReferenceMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createReferenceMessage', arguments);
    return RCIMIWReferenceMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建 GIF 消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] GIF 消息的本地路径
  /// - [返回值] GIF 消息实体
  Future<RCIMIWGIFMessage> createGIFMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "path": path,
    };
    log("[RC:Flutter] engine:createGIFMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createGIFMessage', arguments);
    return RCIMIWGIFMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建自定义消息
  /// - [type] 会话类型
  /// - [targetId]     会话 ID
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [policy]  消息的存储策略
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [fields]  消息的内容键值对
  /// - [返回值] 自定义消息实体
  Future<RCIMIWCustomMessage> createCustomMessage(
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
    log("[RC:Flutter] engine:createCustomMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createCustomMessage', arguments);
    return RCIMIWCustomMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 构建位置消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [longitude] 经度
  /// - [latitude] 纬度
  /// - [poiName]  POI 信息
  /// - [thumbnailPath] 缩略图本地路径，必须为有效路径
  /// - [返回值] 位置消息实体
  Future<RCIMIWLocationMessage> createLocationMessage(
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
    log("[RC:Flutter] engine:createLocationMessage arguments:" +
        arguments.toString());
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod('engine:createLocationMessage', arguments);
    return RCIMIWLocationMessage.fromJson(Map<String, dynamic>.from(result));
  }

  /// 发送普通消息
  /// - [message] 发送的消息实体
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMessageAttached],[onMessageSent]
  Future<int> sendMessage(
    RCIMIWMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:sendMessage arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:sendMessage', arguments);
    return result;
  }

  /// 发送媒体消息
  /// - [message] 发送的媒体消息实体
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMediaMessageSending],[onMediaMessageAttached],[onMediaMessageSent]
  Future<int> sendMediaMessage(
    RCIMIWMediaMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:sendMediaMessage arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:sendMediaMessage', arguments);
    return result;
  }

  /// 取消发送媒体消息
  /// - [message] 需要取消发送的媒体消息实体
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onSendingMediaMessageCanceled]
  Future<int> cancelSendingMediaMessage(
    RCIMIWMediaMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:cancelSendingMediaMessage arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:cancelSendingMediaMessage', arguments);
    return result;
  }

  /// 下载媒体消息
  /// - [message] 需要下载的媒体消息实体
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMediaMessageDownloaded], [onMediaMessageDownloading]
  Future<int> downloadMediaMessage(
    RCIMIWMediaMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:downloadMediaMessage arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:downloadMediaMessage', arguments);
    return result;
  }

  /// 取消下载媒体消息
  /// - [message] 需要取消下载的媒体消息实体
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDownloadingMediaMessageCanceled]
  Future<int> cancelDownloadingMediaMessage(
    RCIMIWMediaMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:cancelDownloadingMediaMessage arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:cancelDownloadingMediaMessage', arguments);
    return result;
  }

  /// 加载某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationLoaded]
  Future<int> loadConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadConversation arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadConversation', arguments);
    return result;
  }

  /// 加载某些会话
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count <= 50
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoaded]
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
    log("[RC:Flutter] engine:loadConversations arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadConversations', arguments);
    return result;
  }

  /// 移除某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationRemoved]
  Future<int> removeConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:removeConversation arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:removeConversation', arguments);
    return result;
  }

  /// 根据会话类型移除会话
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsRemoved]
  Future<int> removeConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
  ) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:removeConversations arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:removeConversations', arguments);
    return result;
  }

  /// 加载某个会话的未读数
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountLoaded]
  Future<int> loadUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadUnreadCount arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadUnreadCount', arguments);
    return result;
  }

  /// 加载所有未读数
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTotalUnreadCountLoaded]
  Future<int> loadTotalUnreadCount(
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadTotalUnreadCount arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadTotalUnreadCount', arguments);
    return result;
  }

  /// 获取会话中未读的 @ 消息。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedCountLoaded]
  Future<int> loadUnreadMentionedCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadUnreadMentionedCount arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUnreadMentionedCount', arguments);
    return result;
  }

  /// 获取当前用户加入的所有超级群会话的未读消息数的总和。

  Future<int> loadUltraGroupAllUnreadCount() async {
    Map<String, dynamic> arguments = {};
    log("[RC:Flutter] engine:loadUltraGroupAllUnreadCount arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUltraGroupAllUnreadCount', arguments);
    return result;
  }

  /// 获取当前用户加入的所有超级群会话中的未读 @ 消息数的总和。

  Future<int> loadUltraGroupAllUnreadMentionedCount() async {
    Map<String, dynamic> arguments = {};
    log("[RC:Flutter] engine:loadUltraGroupAllUnreadMentionedCount arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUltraGroupAllUnreadMentionedCount', arguments);
    return result;
  }

  /// 获取指定会话的未读消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadCountLoaded]
  Future<int> loadUltraGroupUnreadCount(
    String targetId,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
    };
    log("[RC:Flutter] engine:loadUltraGroupUnreadCount arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUltraGroupUnreadCount', arguments);
    return result;
  }

  /// 获取超级群会话中被 @ 的消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadMentionedCountLoaded]
  Future<int> loadUltraGroupUnreadMentionedCount(
    String targetId,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
    };
    log("[RC:Flutter] engine:loadUltraGroupUnreadMentionedCount arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUltraGroupUnreadMentionedCount', arguments);
    return result;
  }

  /// 根据会话类型加载未读数
  /// 注：不支持聊天室！
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountByConversationTypesLoaded]
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
    log("[RC:Flutter] engine:loadUnreadCountByConversationTypes arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUnreadCountByConversationTypes', arguments);
    return result;
  }

  /// 清除某个会话中的未读消息数。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话已阅读的最后一条消息的发送时间戳，传 0 代表清除所有未读。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountCleared]
  Future<int> clearUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
    };
    log("[RC:Flutter] engine:clearUnreadCount arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:clearUnreadCount', arguments);
    return result;
  }

  /// 保存会话草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿的文字内容。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageSaved]
  Future<int> saveDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String draft,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "draft": draft,
    };
    log("[RC:Flutter] engine:saveDraftMessage arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:saveDraftMessage', arguments);
    return result;
  }

  /// 获取会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageLoaded]
  Future<int> loadDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadDraftMessage arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadDraftMessage', arguments);
    return result;
  }

  /// 删除指定会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageCleared]
  Future<int> clearDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:clearDraftMessage arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:clearDraftMessage', arguments);
    return result;
  }

  /// 获取免打扰的会话列表。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlockedConversationsLoaded]
  Future<int> loadBlockedConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
  ) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadBlockedConversations arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadBlockedConversations', arguments);
    return result;
  }

  /// 设置会话的置顶状态。若会话不存在，调用此方法 SDK 自动创建会话并置顶。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusChanged]
  Future<int> changeConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    bool top,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "top": top,
    };
    log("[RC:Flutter] engine:changeConversationTopStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeConversationTopStatus', arguments);
    return result;
  }

  /// 获取会话的置顶状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusLoaded]
  Future<int> loadConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadConversationTopStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadConversationTopStatus', arguments);
    return result;
  }

  /// 同步会话阅读状态。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 会话中已读的最后一条消息的发送时间戳
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationReadStatusSynced]
  Future<int> syncConversationReadStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
    };
    log("[RC:Flutter] engine:syncConversationReadStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:syncConversationReadStatus', arguments);
    return result;
  }

  /// 向会话中发送正在输入的状态，目前只支持单聊。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [currentType] 当前的状态
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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
    log("[RC:Flutter] engine:sendTypingStatus arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:sendTypingStatus', arguments);
    return result;
  }

  /// 加载历史消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [policy] 消息的加载策略。LOCAL：只加载本地，REMOTE：只加载远端，LOCAL_REMOTE：本地远端都加载
  /// - [count] 获取的消息数量，0 < count <= 20
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesLoaded]
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
    log("[RC:Flutter] engine:loadMessages arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadMessages', arguments);
    return result;
  }

  /// 获取第一条未读消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onFirstUnreadMessageLoaded]
  Future<int> loadFirstUnreadMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadFirstUnreadMessage arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadFirstUnreadMessage', arguments);
    return result;
  }

  /// 获取会话中未读的 @ 消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedMessagesLoaded]
  Future<int> loadUnreadMentionedMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadUnreadMentionedMessages arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUnreadMentionedMessages', arguments);
    return result;
  }

  /// 插入一条消息
  /// - [message] 插入的消息
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageInserted]
  Future<int> insertMessage(
    RCIMIWMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:insertMessage arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:insertMessage', arguments);
    return result;
  }

  /// 插入多条消息，不支持超级群
  /// - [messages] 插入的消息集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesInserted]
  Future<int> insertMessages(
    List<RCIMIWMessage> messages,
  ) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }

    Map<String, dynamic> arguments = {
      "messages": messagesStr,
    };
    log("[RC:Flutter] engine:insertMessages arguments:" + arguments.toString());
    int result =
        await _channel.invokeMethod('engine:insertMessages', arguments);
    return result;
  }

  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 清除消息截止时间戳，0 <= recordTime <= 当前会话最后一条消息的 sentTime, 0 清除所有消息，其他值清除小于等于 recordTime 的消息
  /// - [policy] 清除的策略
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageCleared]
  Future<int> clearMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "policy": policy.index,
    };
    log("[RC:Flutter] engine:clearMessages arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:clearMessages', arguments);
    return result;
  }

  /// - [messages] 消息集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onLocalMessagesDeleted]
  Future<int> deleteLocalMessages(
    List<RCIMIWMessage> messages,
  ) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }

    Map<String, dynamic> arguments = {
      "messages": messagesStr,
    };
    log("[RC:Flutter] engine:deleteLocalMessages arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:deleteLocalMessages', arguments);
    return result;
  }

  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 消息集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesDeleted]
  Future<int> deleteMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages,
  ) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }

    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "messages": messagesStr,
    };
    log("[RC:Flutter] engine:deleteMessages arguments:" + arguments.toString());
    int result =
        await _channel.invokeMethod('engine:deleteMessages', arguments);
    return result;
  }

  /// - [message] 需要被撤回的消息
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageRecalled]
  Future<int> recallMessage(
    RCIMIWMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:recallMessage arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:recallMessage', arguments);
    return result;
  }

  /// 发送某个会话中的消息阅读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话中已读的最后一条消息的发送时间戳
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPrivateReadReceiptMessageSent]
  Future<int> sendPrivateReadReceiptMessage(
    String targetId,
    String? channelId,
    int timestamp,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
    };
    log("[RC:Flutter] engine:sendPrivateReadReceiptMessage arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:sendPrivateReadReceiptMessage', arguments);
    return result;
  }

  /// 发起消息已读回执请求
  /// - [message] 需要请求已读回执的消息
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptRequestSent]
  Future<int> sendGroupReadReceiptRequest(
    RCIMIWMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:sendGroupReadReceiptRequest arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:sendGroupReadReceiptRequest', arguments);
    return result;
  }

  /// 发送已读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 会话中需要发送已读回执的消息列表
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptResponseSent]
  Future<int> sendGroupReadReceiptResponse(
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages,
  ) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }

    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "messages": messagesStr,
    };
    log("[RC:Flutter] engine:sendGroupReadReceiptResponse arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:sendGroupReadReceiptResponse', arguments);
    return result;
  }

  /// 更新消息扩展信息
  /// 每条消息携带扩展信息键值对最大值 300个，单次设置扩展信息键值对最大值 20个
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionUpdated]
  Future<int> updateMessageExpansion(
    String messageUId,
    Map expansion,
  ) async {
    Map<String, dynamic> arguments = {
      "messageUId": messageUId,
      "expansion": expansion,
    };
    log("[RC:Flutter] engine:updateMessageExpansion arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:updateMessageExpansion', arguments);
    return result;
  }

  /// 删除消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionForKeysRemoved]
  Future<int> removeMessageExpansionForKeys(
    String messageUId,
    List<String> keys,
  ) async {
    Map<String, dynamic> arguments = {
      "messageUId": messageUId,
      "keys": keys,
    };
    log("[RC:Flutter] engine:removeMessageExpansionForKeys arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:removeMessageExpansionForKeys', arguments);
    return result;
  }

  /// 设置消息发送状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [sentStatus] 要修改的状态
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageSentStatusChanged]
  Future<int> changeMessageSentStatus(
    int messageId,
    RCIMIWSentStatus sentStatus,
  ) async {
    Map<String, dynamic> arguments = {
      "messageId": messageId,
      "sentStatus": sentStatus.index,
    };
    log("[RC:Flutter] engine:changeMessageSentStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeMessageSentStatus', arguments);
    return result;
  }

  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [receivedStatus] 要修改的状态
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageReceiveStatusChanged]
  Future<int> changeMessageReceiveStatus(
    int messageId,
    RCIMIWReceivedStatus receivedStatus,
  ) async {
    Map<String, dynamic> arguments = {
      "messageId": messageId,
      "receivedStatus": receivedStatus.index,
    };
    log("[RC:Flutter] engine:changeMessageReceiveStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeMessageReceiveStatus', arguments);
    return result;
  }

  /// 加入聊天室。
  /// - [targetId] 会话 ID
  /// - [messageCount] 进入聊天室拉取消息数目，-1 时不拉取任何消息，0 时拉取 10 条消息，最多只能拉取 50
  /// - [autoCreate] 是否创建聊天室，TRUE 如果聊天室不存在，sdk 会创建聊天室并加入，如果已存在，则直接加入
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomJoined]
  Future<int> joinChatRoom(
    String targetId,
    int messageCount,
    bool autoCreate,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "messageCount": messageCount,
      "autoCreate": autoCreate,
    };
    log("[RC:Flutter] engine:joinChatRoom arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:joinChatRoom', arguments);
    return result;
  }

  /// 退出聊天室。
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomLeft]
  Future<int> leaveChatRoom(
    String targetId,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
    };
    log("[RC:Flutter] engine:leaveChatRoom arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:leaveChatRoom', arguments);
    return result;
  }

  /// 获取聊天室历史消息记录。
  /// 注：必须先开通聊天室消息云存储功能。
  /// - [targetId] 会话 ID
  /// - [timestamp] 起始的消息发送时间戳
  /// - [order] 拉取顺序 0:倒序，1:正序
  /// - [count] 要获取的消息数量，0 < count <= 50。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomMessagesLoaded]
  Future<int> loadChatRoomMessages(
    String targetId,
    int timestamp,
    RCIMIWTimeOrder order,
    int count,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "timestamp": timestamp,
      "order": order.index,
      "count": count,
    };
    log("[RC:Flutter] engine:loadChatRoomMessages arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadChatRoomMessages', arguments);
    return result;
  }

  /// 设置聊天室自定义属性。
  /// - [targetId] 会话 ID
  /// - [key]  聊天室属性名称，Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，最大长度 128 个字符
  /// - [value]     聊天室属性对应的值，最大长度 4096 个字符
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 如果当前 key 存在，是否进行覆盖
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryAdded]
  Future<int> addChatRoomEntry(
    String targetId,
    String key,
    String value,
    bool deleteWhenLeft,
    bool overwrite,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "key": key,
      "value": value,
      "deleteWhenLeft": deleteWhenLeft,
      "overwrite": overwrite,
    };
    log("[RC:Flutter] engine:addChatRoomEntry arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:addChatRoomEntry', arguments);
    return result;
  }

  /// 批量设置聊天室自定义属性
  /// - [targetId] 会话 ID
  /// - [entries]   聊天室属性
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 是否强制覆盖
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesAdded]
  Future<int> addChatRoomEntries(
    String targetId,
    Map entries,
    bool deleteWhenLeft,
    bool overwrite,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "entries": entries,
      "deleteWhenLeft": deleteWhenLeft,
      "overwrite": overwrite,
    };
    log("[RC:Flutter] engine:addChatRoomEntries arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:addChatRoomEntries', arguments);
    return result;
  }

  /// 获取聊天室单个属性。
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性键值
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryLoaded]
  Future<int> loadChatRoomEntry(
    String targetId,
    String key,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "key": key,
    };
    log("[RC:Flutter] engine:loadChatRoomEntry arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadChatRoomEntry', arguments);
    return result;
  }

  /// 获取聊天室所有属性。
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onAllChatRoomEntriesLoaded]
  Future<int> loadAllChatRoomEntries(
    String targetId,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
    };
    log("[RC:Flutter] engine:loadAllChatRoomEntries arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadAllChatRoomEntries', arguments);
    return result;
  }

  /// 删除聊天室自定义属性。
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性键值
  /// - [force] 是否强制删除
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryRemoved]
  Future<int> removeChatRoomEntry(
    String targetId,
    String key,
    bool force,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "key": key,
      "force": force,
    };
    log("[RC:Flutter] engine:removeChatRoomEntry arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:removeChatRoomEntry', arguments);
    return result;
  }

  /// 批量删除聊天室自定义属性
  /// - [targetId] 会话 ID
  /// - [keys] 聊天室属性
  /// - [force] 是否强制覆盖
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesRemoved]
  Future<int> removeChatRoomEntries(
    String targetId,
    List<String> keys,
    bool force,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "keys": keys,
      "force": force,
    };
    log("[RC:Flutter] engine:removeChatRoomEntries arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:removeChatRoomEntries', arguments);
    return result;
  }

  /// 将某个用户加入黑名单。
  /// 当你把对方加入黑名单后，对方再发消息时，就会提示“已被加入黑名单，消息发送失败”。 但你依然可以发消息个对方。
  /// - [userId] 用户 Id
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistAdded]
  Future<int> addToBlacklist(
    String userId,
  ) async {
    Map<String, dynamic> arguments = {
      "userId": userId,
    };
    log("[RC:Flutter] engine:addToBlacklist arguments:" + arguments.toString());
    int result =
        await _channel.invokeMethod('engine:addToBlacklist', arguments);
    return result;
  }

  /// 将某个用户从黑名单中移出。
  /// - [userId] 用户 Id
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistRemoved]
  Future<int> removeFromBlacklist(
    String userId,
  ) async {
    Map<String, dynamic> arguments = {
      "userId": userId,
    };
    log("[RC:Flutter] engine:removeFromBlacklist arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:removeFromBlacklist', arguments);
    return result;
  }

  /// 获取某用户是否在黑名单中。
  /// - [userId] 用户 Id
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistStatusLoaded]
  Future<int> loadBlacklistStatus(
    String userId,
  ) async {
    Map<String, dynamic> arguments = {
      "userId": userId,
    };
    log("[RC:Flutter] engine:loadBlacklistStatus arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadBlacklistStatus', arguments);
    return result;
  }

  /// 获取当前用户设置的黑名单列表。

  Future<int> loadBlacklist() async {
    Map<String, dynamic> arguments = {};
    log("[RC:Flutter] engine:loadBlacklist arguments:" + arguments.toString());
    int result = await _channel.invokeMethod('engine:loadBlacklist', arguments);
    return result;
  }

  /// 根据关键字搜索指定会话中的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 查询 beginTime 之前的消息， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 查询的数量，0 < count <= 50。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearched]
  Future<int> searchMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String keyword,
    int startTime,
    int count,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "keyword": keyword,
      "startTime": startTime,
      "count": count,
    };
    log("[RC:Flutter] engine:searchMessages arguments:" + arguments.toString());
    int result =
        await _channel.invokeMethod('engine:searchMessages', arguments);
    return result;
  }

  /// 根据关键字搜索指定会话中某个时间段的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 开始时间
  /// - [endTime] 结束时间
  /// - [offset] 偏移量
  /// - [count] 返回的搜索结果数量，0 < count <= 50。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByTimeRange]
  Future<int> searchMessagesByTimeRange(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String keyword,
    int startTime,
    int endTime,
    int offset,
    int count,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "keyword": keyword,
      "startTime": startTime,
      "endTime": endTime,
      "offset": offset,
      "count": count,
    };
    log("[RC:Flutter] engine:searchMessagesByTimeRange arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:searchMessagesByTimeRange', arguments);
    return result;
  }

  /// 根据用户 id 搜索指定会话中的消息。
  /// - [userId] 用户 id
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [startTime] 查询记录的起始时间， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 返回的搜索结果数量 0 < count <= 50。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByUserId]
  Future<int> searchMessagesByUserId(
    String userId,
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int startTime,
    int count,
  ) async {
    Map<String, dynamic> arguments = {
      "userId": userId,
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "startTime": startTime,
      "count": count,
    };
    log("[RC:Flutter] engine:searchMessagesByUserId arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:searchMessagesByUserId', arguments);
    return result;
  }

  /// 根据关键字搜索会话。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageTypes] 搜索的消息类型
  /// - [keyword]      搜索的关键字。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsSearched]
  Future<int> searchConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    List<RCIMIWMessageType> messageTypes,
    String keyword,
  ) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    List messageTypesStr = [];
    for (var element in messageTypes) {
      messageTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
      "messageTypes": messageTypesStr,
      "keyword": keyword,
    };
    log("[RC:Flutter] engine:searchConversations arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:searchConversations', arguments);
    return result;
  }

  /// 屏蔽某个时间段的消息提醒
  /// - [startTime] 开始消息免打扰时间，格式为 HH:MM:SS
  /// - [spanMins] 需要消息免打扰分钟数，0 < spanMins < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为 01:00，则 spanMins 为 60 分钟。设置为 1439 代表全天免打扰 （23 60 + 59 = 1439 ））
  /// - [level] 消息通知级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursChanged]
  Future<int> changeNotificationQuietHours(
    String startTime,
    int spanMins,
    RCIMIWPushNotificationQuietHoursLevel level,
  ) async {
    Map<String, dynamic> arguments = {
      "startTime": startTime,
      "spanMins": spanMins,
      "level": level.index,
    };
    log("[RC:Flutter] engine:changeNotificationQuietHours arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeNotificationQuietHours', arguments);
    return result;
  }

  /// 删除已设置的全局时间段消息提醒屏蔽

  Future<int> removeNotificationQuietHours() async {
    Map<String, dynamic> arguments = {};
    log("[RC:Flutter] engine:removeNotificationQuietHours arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:removeNotificationQuietHours', arguments);
    return result;
  }

  /// 查询已设置的时间段消息提醒屏蔽

  Future<int> loadNotificationQuietHours() async {
    Map<String, dynamic> arguments = {};
    log("[RC:Flutter] engine:loadNotificationQuietHours arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadNotificationQuietHours', arguments);
    return result;
  }

  /// 设置会话的消息提醒状态
  /// 注：超级群调用该接口，channelId 为空时，相当于设置了 channelId 为空的频道的免打扰，不会屏蔽整个超级群会话下所有频道的免打扰
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 消息通知级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelChanged]
  Future<int> changeConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
      "level": level.index,
    };
    log("[RC:Flutter] engine:changeConversationNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeConversationNotificationLevel', arguments);
    return result;
  }

  /// 获取会话的消息提醒状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelLoaded]
  Future<int> loadConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadConversationNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadConversationNotificationLevel', arguments);
    return result;
  }

  /// 设置会话类型的消息提醒状态
  /// 注：如要移除消息提醒状态，设置level为RCIMIWPushNotificationLevelDefault
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTypeNotificationLevelChanged]
  Future<int> changeConversationTypeNotificationLevel(
    RCIMIWConversationType type,
    RCIMIWPushNotificationLevel level,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "level": level.index,
    };
    log("[RC:Flutter] engine:changeConversationTypeNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeConversationTypeNotificationLevel', arguments);
    return result;
  }

  /// 获取会话类型的消息提醒状态
  /// - [type] 会话类型
  /// - [返回值] [onConversationTypeNotificationLevelLoaded]
  Future<int> loadConversationTypeNotificationLevel(
    RCIMIWConversationType type,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
    };
    log("[RC:Flutter] engine:loadConversationTypeNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadConversationTypeNotificationLevel', arguments);
    return result;
  }

  /// 设置超级群的默认消息状态
  /// 一般由管理员设置的接口，针对超级群的所有群成员生效，针对超级群下所有频道生效，优先级较低。如果群成员自己超级群的免打扰级别，那么以群成员自己设置的为准。
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelChanged]
  Future<int> changeUltraGroupDefaultNotificationLevel(
    String targetId,
    RCIMIWPushNotificationLevel level,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "level": level.index,
    };
    log("[RC:Flutter] engine:changeUltraGroupDefaultNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeUltraGroupDefaultNotificationLevel', arguments);
    return result;
  }

  /// 获取超级群的默认消息状态
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelLoaded]
  Future<int> loadUltraGroupDefaultNotificationLevel(
    String targetId,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
    };
    log("[RC:Flutter] engine:loadUltraGroupDefaultNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUltraGroupDefaultNotificationLevel', arguments);
    return result;
  }

  /// 设置超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 消息通知级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelChanged]
  Future<int> changeUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "level": level.index,
    };
    log("[RC:Flutter] engine:changeUltraGroupChannelDefaultNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changeUltraGroupChannelDefaultNotificationLevel', arguments);
    return result;
  }

  /// 获取超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelLoaded]
  Future<int> loadUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadUltraGroupChannelDefaultNotificationLevel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadUltraGroupChannelDefaultNotificationLevel', arguments);
    return result;
  }

  /// 设置是否显示远程推送内容详情，此功能需要从服务端开启用户设置功能。
  /// - [showContent] 是否显示远程推送内容
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushContentShowStatusChanged]
  Future<int> changePushContentShowStatus(
    bool showContent,
  ) async {
    Map<String, dynamic> arguments = {
      "showContent": showContent,
    };
    log("[RC:Flutter] engine:changePushContentShowStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changePushContentShowStatus', arguments);
    return result;
  }

  /// 设置推送语言
  /// - [language] 推送语言， 目前仅支持 en_us、zh_cn、ar_sa
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushLanguageChanged]
  Future<int> changePushLanguage(
    String language,
  ) async {
    Map<String, dynamic> arguments = {
      "language": language,
    };
    log("[RC:Flutter] engine:changePushLanguage arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:changePushLanguage', arguments);
    return result;
  }

  /// 设置是否接收远程推送。
  /// 前提：移动端未在线，Web 、MAC/PC 终端在线，移动端是否接收远程推送。
  /// 此功能需要从服务端开启用户设置功能。
  /// - [receive] 是否接收
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushReceiveStatusChanged]
  Future<int> changePushReceiveStatus(
    bool receive,
  ) async {
    Map<String, dynamic> arguments = {
      "receive": receive,
    };
    log("[RC:Flutter] engine:changePushReceiveStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:changePushReceiveStatus', arguments);
    return result;
  }

  /// 给指定的群成员发送消息
  /// - [message] 要发送的消息
  /// - [userIds] 群成员集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupMessageToDesignatedUsersAttached], [onGroupMessageToDesignatedUsersSent]
  Future<int> sendGroupMessageToDesignatedUsers(
    RCIMIWMessage message,
    List<String> userIds,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
      "userIds": userIds,
    };
    log("[RC:Flutter] engine:sendGroupMessageToDesignatedUsers arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:sendGroupMessageToDesignatedUsers', arguments);
    return result;
  }

  /// 获取指定会话的消息总数。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageCountLoaded]
  Future<int> loadMessageCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadMessageCount arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadMessageCount', arguments);
    return result;
  }

  /// 根据会话类型,获取置顶会话列表
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTopConversationsLoaded]
  Future<int> loadTopConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
  ) async {
    List conversationTypesStr = [];
    for (var element in conversationTypes) {
      conversationTypesStr.add(element.index);
    }

    Map<String, dynamic> arguments = {
      "conversationTypes": conversationTypesStr,
      "channelId": channelId,
    };
    log("[RC:Flutter] engine:loadTopConversations arguments:" +
        arguments.toString());
    int result =
        await _channel.invokeMethod('engine:loadTopConversations', arguments);
    return result;
  }

  /// 上报超级群的已读时间
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 已读时间
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupReadStatusSynced]
  Future<int> syncUltraGroupReadStatus(
    String targetId,
    String? channelId,
    int timestamp,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
    };
    log("[RC:Flutter] engine:syncUltraGroupReadStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:syncUltraGroupReadStatus', arguments);
    return result;
  }

  /// 获取特定会话下所有频道的会话列表，只支持超级群
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoadedForAllChannel]
  Future<int> loadConversationsForAllChannel(
    RCIMIWConversationType type,
    String targetId,
  ) async {
    Map<String, dynamic> arguments = {
      "type": type.index,
      "targetId": targetId,
    };
    log("[RC:Flutter] engine:loadConversationsForAllChannel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadConversationsForAllChannel', arguments);
    return result;
  }

  /// 修改消息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [message] 要修改的 message
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageModified]
  Future<int> modifyUltraGroupMessage(
    String messageUId,
    RCIMIWMessage message,
  ) async {
    Map<String, dynamic> arguments = {
      "messageUId": messageUId,
      "message": message.toJson(),
    };
    log("[RC:Flutter] engine:modifyUltraGroupMessage arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:modifyUltraGroupMessage', arguments);
    return result;
  }

  /// 撤回超级群消息
  /// - [message] 需要撤回的消息
  /// - [deleteRemote] 是否删除远端消息
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageRecalled]
  Future<int> recallUltraGroupMessage(
    RCIMIWMessage message,
    bool deleteRemote,
  ) async {
    Map<String, dynamic> arguments = {
      "message": message.toJson(),
      "deleteRemote": deleteRemote,
    };
    log("[RC:Flutter] engine:recallUltraGroupMessage arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:recallUltraGroupMessage', arguments);
    return result;
  }

  /// 删除本地特定 channel 特点时间之前的消息
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// - [policy] 清除策略
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesCleared]
  Future<int> clearUltraGroupMessages(
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "timestamp": timestamp,
      "policy": policy.index,
    };
    log("[RC:Flutter] engine:clearUltraGroupMessages arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:clearUltraGroupMessages', arguments);
    return result;
  }

  /// 发送超级群输入状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [typingStatus]
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupTypingStatusSent]
  Future<int> sendUltraGroupTypingStatus(
    String targetId,
    String? channelId,
    RCIMIWUltraGroupTypingStatus typingStatus,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "channelId": channelId,
      "typingStatus": typingStatus.index,
    };
    log("[RC:Flutter] engine:sendUltraGroupTypingStatus arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:sendUltraGroupTypingStatus', arguments);
    return result;
  }

  /// 删除本地所有 channel 特定时间之前的消息
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesClearedForAllChannel]
  Future<int> clearUltraGroupMessagesForAllChannel(
    String targetId,
    int timestamp,
  ) async {
    Map<String, dynamic> arguments = {
      "targetId": targetId,
      "timestamp": timestamp,
    };
    log("[RC:Flutter] engine:clearUltraGroupMessagesForAllChannel arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:clearUltraGroupMessagesForAllChannel', arguments);
    return result;
  }

  /// 从服务获取批量消息
  /// - [messages] 获取的消息集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBatchRemoteUltraGroupMessagesLoaded]
  Future<int> loadBatchRemoteUltraGroupMessages(
    List<RCIMIWMessage> messages,
  ) async {
    List messagesStr = [];
    for (var element in messages) {
      messagesStr.add(element.toJson());
    }

    Map<String, dynamic> arguments = {
      "messages": messagesStr,
    };
    log("[RC:Flutter] engine:loadBatchRemoteUltraGroupMessages arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:loadBatchRemoteUltraGroupMessages', arguments);
    return result;
  }

  /// 更新超级群消息扩展信息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionUpdated]
  Future<int> updateUltraGroupMessageExpansion(
    String messageUId,
    Map expansion,
  ) async {
    Map<String, dynamic> arguments = {
      "messageUId": messageUId,
      "expansion": expansion,
    };
    log("[RC:Flutter] engine:updateUltraGroupMessageExpansion arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:updateUltraGroupMessageExpansion', arguments);
    return result;
  }

  /// 删除超级群消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionRemoved]
  Future<int> removeUltraGroupMessageExpansion(
    String messageUId,
    List<String> keys,
  ) async {
    Map<String, dynamic> arguments = {
      "messageUId": messageUId,
      "keys": keys,
    };
    log("[RC:Flutter] engine:removeUltraGroupMessageExpansion arguments:" +
        arguments.toString());
    int result = await _channel.invokeMethod(
        'engine:removeUltraGroupMessageExpansion', arguments);
    return result;
  }

  /// 修改日志等级
  /// - [level] 日志级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> changeLogLevel(
    RCIMIWLogLevel level,
  ) async {
    Map<String, dynamic> arguments = {
      "level": level.index,
    };
    log("[RC:Flutter] engine:changeLogLevel arguments:" + arguments.toString());
    int result =
        await _channel.invokeMethod('engine:changeLogLevel', arguments);
    return result;
  }

  /// 根据 messageId 获取消息
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [返回值] 获取到的消息对象
  Future<RCIMIWMessage?> getMessageById(
    int messageId,
  ) async {
    Map<String, dynamic> arguments = {
      "messageId": messageId,
    };
    Map<dynamic, dynamic>? result =
        await _channel.invokeMethod('engine:getMessageById', arguments);
    return result != null
        ? RCIMConverter.convertMessage(Map<String, dynamic>.from(result))
        : null;
  }

  /// 根据 messageUId 获取消息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值。
  /// - [返回值] 获取到的消息对象
  Future<RCIMIWMessage?> getMessageByUId(
    String messageUId,
  ) async {
    Map<String, dynamic> arguments = {
      "messageUId": messageUId,
    };
    Map<dynamic, dynamic>? result =
        await _channel.invokeMethod('engine:getMessageByUId', arguments);
    return result != null
        ? RCIMConverter.convertMessage(Map<String, dynamic>.from(result))
        : null;
  }

  /// 收到消息的监听
  /// - [message] 接收到的消息对象
  /// - [left]  当客户端连接成功后，服务端会将所有补偿消息以消息包的形式下发给客户端，最多每 200 条消息为一个消息包，即一个 Package, 客户端接受到消息包后，会逐条解析并通知应用。left 为当前消息包（Package）里还剩余的消息条数
  /// - [offline] 消息是否离线消息
  /// - [hasPackage] 是否在服务端还存在未下发的消息包
  Function(
    RCIMIWMessage? message,
    int? left,
    bool? offline,
    bool? hasPackage,
  )? onMessageReceived;

  /// 网络状态变化
  /// - [status] SDK 与融云服务器的连接状态
  Function(
    RCIMIWConnectionStatus? status,
  )? onConnectionStatusChanged;

  /// 会话状态置顶多端同步监听
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  Function(
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    bool? top,
  )? onConversationTopStatusSynced;

  /// 撤回消息监听器
  /// - [message] 原本的消息会变为撤回消息
  Function(
    RCIMIWMessage? message,
  )? onRemoteMessageRecalled;

  /// 单聊中收到消息回执的回调。
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 已阅读的最后一条消息的 sendTime
  Function(
    String? targetId,
    String? channelId,
    int? timestamp,
  )? onPrivateReadReceiptReceived;

  /// 消息扩展信息更改的回调
  /// - [expansion] 消息扩展信息中更新的键值对，只包含更新的键值对，不是全部的数据。如果想获取全部的键值对，请使用 message 的 expansion 属性。
  /// - [message] 发生变化的消息
  Function(
    Map? expansion,
    RCIMIWMessage? message,
  )? onRemoteMessageExpansionUpdated;

  /// 消息扩展信息删除的回调
  /// - [message] 发生变化的消息
  /// - [keys] 消息扩展信息中删除的键值对 key 列表
  Function(
    RCIMIWMessage? message,
    List<String>? keys,
  )? onRemoteMessageExpansionForKeyRemoved;

  /// 聊天室用户进入、退出聊天室监听
  /// - [targetId] 会话 ID
  /// - [actions] 发生的事件
  Function(
    String? targetId,
    List<RCIMIWChatRoomMemberAction>? actions,
  )? onChatRoomMemberChanged;

  /// 会话输入状态发生变化。对于单聊而言，当对方正在输入时，监听会触发一次；当对方不处于输入状态时，该监听还会触发一次，但回调里输入用户列表为空。
  /// - [type] 会话类型
  /// - [targetId]    会话 ID
  /// - [channelId]   频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [userTypingStatus] 发生状态变化的集合
  Function(
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    List<RCIMIWTypingStatus>? userTypingStatus,
  )? onTypingStatusChanged;

  /// 同步消息未读状态监听接口。多端登录，收到其它端清除某一会话未读数通知的时候
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  Function(
    RCIMIWConversationType? type,
    String? targetId,
    int? timestamp,
  )? onConversationReadStatusSyncMessageReceived;

  /// 聊天室 KV 同步完成的回调
  /// - [roomId] 聊天室 ID
  Function(
    String? roomId,
  )? onChatRoomEntriesSynced;

  /// 聊天室 KV 发生变化的回调
  /// - [operationType] 操作的类型
  /// - [roomId]   聊天室 ID
  /// - [entries]  发送变化的 KV
  Function(
    RCIMIWChatRoomEntriesOperationType? operationType,
    String? roomId,
    Map? entries,
  )? onChatRoomEntriesChanged;

  /// 超级群消息 kv 被更新
  /// - [messages] 被更新的消息集合
  Function(
    List<RCIMIWMessage>? messages,
  )? onRemoteUltraGroupMessageExpansionUpdated;

  /// 超级群消息被更改
  /// - [messages] 被更新的消息集合
  Function(
    List<RCIMIWMessage>? messages,
  )? onRemoteUltraGroupMessageModified;

  /// 超级群消息被撤回
  /// - [messages] 撤回的消息集合
  Function(
    List<RCIMIWMessage>? messages,
  )? onRemoteUltraGroupMessageRecalled;

  /// 超级群已读的监听
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp]
  Function(
    String? targetId,
    String? channelId,
    int? timestamp,
  )? onUltraGroupReadTimeReceived;

  /// 用户输入状态变化的回调
  /// 当客户端收到用户输入状态的变化时，会回调此接口，通知发生变化的会话以及当前正在输入的RCUltraGroupTypingStatusInfo列表
  /// - [info] 正在输入的RCUltraGroupTypingStatusInfo列表（nil标示当前没有用户正在输入）
  Function(
    List<RCIMIWUltraGroupTypingStatusInfo>? info,
  )? onUltraGroupTypingStatusChanged;

  /// 发送含有敏感词消息被拦截的回调
  /// - [info] 被拦截消息的相关信息
  Function(
    RCIMIWBlockedMessageInfo? info,
  )? onMessageBlocked;

  /// 聊天室状态发生变化的监听
  /// - [targetId] 会话 ID
  /// - [status] 聊天室变化的状态
  Function(
    String? targetId,
    RCIMIWChatRoomStatus? status,
  )? onChatRoomStatusChanged;

  /// 收到群聊已读回执请求的监听
  /// - [targetId] 会话 ID
  /// - [messageUId] 消息的 messageUid
  Function(
    String? targetId,
    String? messageUId,
  )? onGroupMessageReadReceiptRequestReceived;

  /// 收到群聊已读回执响应的监听
  /// - [targetId] 会话 ID
  /// - [messageUId] 收到回执响应的消息的 messageUId
  /// - [respondUserIds] 会话中响应了此消息的用户列表。其中 key： 用户 id ； value： 响应时间。
  Function(
    String? targetId,
    String? messageUId,
    Map? respondUserIds,
  )? onGroupMessageReadReceiptResponseReceived;

  /// [connect] 的接口监听，收到链接结果的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 链接成功的用户 ID
  Function(
    int? code,
    String? userId,
  )? onConnected;

  /// [connect] 的接口监听，数据库打开时发生的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  Function(
    int? code,
  )? onDatabaseOpened;

  /// [loadConversation] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type]    会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversation] 获取到的会话
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWConversation? conversation,
  )? onConversationLoaded;

  /// [loadConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，
  /// - [startTime]    时间戳（毫秒）
  /// - [count]   查询的数量
  /// - [conversations] 查询到的会话集合
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    int? startTime,
    int? count,
    List<RCIMIWConversation>? conversations,
  )? onConversationsLoaded;

  /// [removeConversation] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
  )? onConversationRemoved;

  /// [removeConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
  )? onConversationsRemoved;

  /// [loadTotalUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  Function(
    int? code,
    String? channelId,
    int? count,
  )? onTotalUnreadCountLoaded;

  /// [loadUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? count,
  )? onUnreadCountLoaded;

  /// [loadUnreadCountByConversationTypes] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [count]   未读数量
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    bool? contain,
    int? count,
  )? onUnreadCountByConversationTypesLoaded;

  /// [loadUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? count,
  )? onUnreadMentionedCountLoaded;

  /// [loadUltraGroupAllUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [count] 未读数量
  Function(
    int? code,
    int? count,
  )? onUltraGroupAllUnreadCountLoaded;

  /// [loadUltraGroupAllUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [count] 未读数量
  Function(
    int? code,
    int? count,
  )? onUltraGroupAllUnreadMentionedCountLoaded;

  /// [clearUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话已阅读的最后一条消息的发送时间戳
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? timestamp,
  )? onUnreadCountCleared;

  /// [saveDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿信息
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    String? draft,
  )? onDraftMessageSaved;

  /// [clearDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
  )? onDraftMessageCleared;

  /// [loadDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿信息
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    String? draft,
  )? onDraftMessageLoaded;

  /// [loadBlockedConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversations] 获取到的会话集合
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWConversation>? conversations,
  )? onBlockedConversationsLoaded;

  /// [changeConversationTopStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    bool? top,
  )? onConversationTopStatusChanged;

  /// [loadConversationTopStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    bool? top,
  )? onConversationTopStatusLoaded;

  /// [syncConversationReadStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 会话中已读的最后一条消息的发送时间戳
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? timestamp,
  )? onConversationReadStatusSynced;

  /// [sendMessage] 的接口监听
  /// - [message] 发送的消息
  Function(
    RCIMIWMessage? message,
  )? onMessageAttached;

  /// [sendMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  Function(
    int? code,
    RCIMIWMessage? message,
  )? onMessageSent;

  /// [sendMediaMessage] 的接口监听
  /// - [message] 发送的消息
  Function(
    RCIMIWMediaMessage? message,
  )? onMediaMessageAttached;

  /// [sendMediaMessage] 的接口监听
  /// - [message] 发送的消息
  /// - [progress] 发送的进度
  Function(
    RCIMIWMediaMessage? message,
    int? progress,
  )? onMediaMessageSending;

  /// [cancelSendingMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  Function(
    int? code,
    RCIMIWMediaMessage? message,
  )? onSendingMediaMessageCanceled;

  /// [sendMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  Function(
    int? code,
    RCIMIWMediaMessage? message,
  )? onMediaMessageSent;

  /// [downloadMediaMessage] 的接口监听
  /// - [message] 下载的消息
  /// - [progress] 下载的进度
  Function(
    RCIMIWMediaMessage? message,
    int? progress,
  )? onMediaMessageDownloading;

  /// [downloadMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 下载的消息
  Function(
    int? code,
    RCIMIWMediaMessage? message,
  )? onMediaMessageDownloaded;

  /// [cancelDownloadingMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 取消下载的消息
  Function(
    int? code,
    RCIMIWMediaMessage? message,
  )? onDownloadingMediaMessageCanceled;

  /// [loadMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [messages] 获取到的消息集合
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? sentTime,
    RCIMIWTimeOrder? order,
    List<RCIMIWMessage>? messages,
  )? onMessagesLoaded;

  /// [loadUnreadMentionedMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 获取到的消息集合
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    List<RCIMIWMessage>? messages,
  )? onUnreadMentionedMessagesLoaded;

  /// [loadFirstUnreadMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [message] 获取到的消息
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWMessage? message,
  )? onFirstUnreadMessageLoaded;

  /// [insertMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 插入的消息
  Function(
    int? code,
    RCIMIWMessage? message,
  )? onMessageInserted;

  /// [insertMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messages] 插入的消息集合
  Function(
    int? code,
    List<RCIMIWMessage>? messages,
  )? onMessagesInserted;

  /// [clearMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? timestamp,
  )? onMessageCleared;

  /// [deleteLocalMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messages] 删除的消息集合
  Function(
    int? code,
    List<RCIMIWMessage>? messages,
  )? onLocalMessagesDeleted;

  /// [deleteMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 删除的消息集合
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    List<RCIMIWMessage>? messages,
  )? onMessagesDeleted;

  /// [recallMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 撤回的消息
  Function(
    int? code,
    RCIMIWMessage? message,
  )? onMessageRecalled;

  /// [sendPrivateReadReceiptMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  Function(
    int? code,
    String? targetId,
    String? channelId,
    int? timestamp,
  )? onPrivateReadReceiptMessageSent;

  /// [updateMessageExpansion] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap
  Function(
    int? code,
    String? messageUId,
    Map? expansion,
  )? onMessageExpansionUpdated;

  /// [removeMessageExpansionForKeys] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  Function(
    int? code,
    String? messageUId,
    List<String>? keys,
  )? onMessageExpansionForKeysRemoved;

  /// [changeMessageReceiveStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageId] 消息的 messageId
  Function(
    int? code,
    int? messageId,
  )? onMessageReceiveStatusChanged;

  /// [changeMessageSentStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageId] 消息的 messageId
  Function(
    int? code,
    int? messageId,
  )? onMessageSentStatusChanged;

  /// [joinChatRoom] 的接口监听
  /// - [targetId] 会话 ID
  Function(
    int? code,
    String? targetId,
  )? onChatRoomJoined;

  /// 正在加入聊天室的回调
  /// - [targetId] 聊天室 ID
  Function(
    String? targetId,
  )? onChatRoomJoining;

  /// [leaveChatRoom] 的接口监听
  /// - [targetId] 会话 ID
  Function(
    int? code,
    String? targetId,
  )? onChatRoomLeft;

  /// [loadChatRoomMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [messages] 加载到的消息
  /// - [syncTime] 下次拉取的时间戳
  Function(
    int? code,
    String? targetId,
    List<RCIMIWMessage>? messages,
    int? syncTime,
  )? onChatRoomMessagesLoaded;

  /// [addChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性名称
  Function(
    int? code,
    String? targetId,
    String? key,
  )? onChatRoomEntryAdded;

  /// [addChatRoomEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entries] 聊天室属性
  /// - [errorEntries] 发生错误的属性
  Function(
    int? code,
    String? targetId,
    Map? entries,
    Map? errorEntries,
  )? onChatRoomEntriesAdded;

  /// [loadChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entry] 获取到的属性。
  Function(
    int? code,
    String? targetId,
    Map? entry,
  )? onChatRoomEntryLoaded;

  /// [loadAllChatRoomEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entries] 获取到的属性集合。
  Function(
    int? code,
    String? targetId,
    Map? entries,
  )? onAllChatRoomEntriesLoaded;

  /// [removeChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性键值
  Function(
    int? code,
    String? targetId,
    String? key,
  )? onChatRoomEntryRemoved;

  /// [removeChatRoomEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [keys] 聊天室属性键值集合
  Function(
    int? code,
    String? targetId,
    List<String>? keys,
  )? onChatRoomEntriesRemoved;

  /// [addToBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  Function(
    int? code,
    String? userId,
  )? onBlacklistAdded;

  /// [removeFromBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  Function(
    int? code,
    String? userId,
  )? onBlacklistRemoved;

  /// [loadBlacklistStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  /// - [status] 当前状态
  Function(
    int? code,
    String? userId,
    RCIMIWBlacklistStatus? status,
  )? onBlacklistStatusLoaded;

  /// [loadBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userIds] 用户 ID 集合
  Function(
    int? code,
    List<String>? userIds,
  )? onBlacklistLoaded;

  /// [searchMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 查询 beginTime 之前的消息
  /// - [count] 查询的数量
  /// - [messages] 查询到的消息集合
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    String? keyword,
    int? startTime,
    int? count,
    List<RCIMIWMessage>? messages,
  )? onMessagesSearched;

  /// [searchMessagesByTimeRange] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 开始时间
  /// - [endTime] 结束时间
  /// - [offset] 偏移量
  /// - [count] 查询的数量
  /// - [messages] 查询到的消息集合
  Function(
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
  )? onMessagesSearchedByTimeRange;

  /// [searchMessagesByUserId] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 id
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [startTime] 查询记录的起始时间
  /// - [count] 查询的数量
  /// - [messages] 查询到的消息集合
  Function(
    int? code,
    String? userId,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? startTime,
    int? count,
    List<RCIMIWMessage>? messages,
  )? onMessagesSearchedByUserId;

  /// [searchConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageTypes] 搜索的消息类型
  /// - [keyword]      搜索的关键字
  /// - [conversations] 查询到的会话集合
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWMessageType>? messageTypes,
    String? keyword,
    List<RCIMIWSearchConversationResult>? conversations,
  )? onConversationsSearched;

  /// sendGroupReadReceiptRequest 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 需要请求已读回执的消息
  Function(
    int? code,
    RCIMIWMessage? message,
  )? onGroupReadReceiptRequestSent;

  /// [sendGroupReadReceiptResponse] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 会话中需要发送已读回执的消息列表
  Function(
    int? code,
    String? targetId,
    String? channelId,
    List<RCIMIWMessage>? messages,
  )? onGroupReadReceiptResponseSent;

  /// [changeNotificationQuietHours] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [startTime] 开始消息免打扰时间
  /// - [spanMins] 需要消息免打扰分钟数，0 < spanMins < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为 01:00，则 spanMins 为 60 分钟。设置为 1439 代表全天免打扰 （23 60 + 59 = 1439 ））
  Function(
    int? code,
    String? startTime,
    int? spanMins,
    RCIMIWPushNotificationQuietHoursLevel? level,
  )? onNotificationQuietHoursChanged;

  /// [removeNotificationQuietHours] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  Function(
    int? code,
  )? onNotificationQuietHoursRemoved;

  /// [loadNotificationQuietHours] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [startTime] 开始消息免打扰时间
  /// - [spanMins] 已设置的屏蔽时间分钟数，0 < spanMins < 1440]
  Function(
    int? code,
    String? startTime,
    int? spanMins,
    RCIMIWPushNotificationQuietHoursLevel? level,
  )? onNotificationQuietHoursLoaded;

  /// [changeConversationNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 消息通知级别
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )? onConversationNotificationLevelChanged;

  /// [loadConversationNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 当前会话的消息通知级别
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )? onConversationNotificationLevelLoaded;

  /// [changeConversationTypeNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  Function(
    int? code,
    RCIMIWConversationType? type,
    RCIMIWPushNotificationLevel? level,
  )? onConversationTypeNotificationLevelChanged;

  /// [loadConversationTypeNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  Function(
    int? code,
    RCIMIWConversationType? type,
    RCIMIWPushNotificationLevel? level,
  )? onConversationTypeNotificationLevelLoaded;

  /// [changeUltraGroupDefaultNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  Function(
    int? code,
    String? targetId,
    RCIMIWPushNotificationLevel? level,
  )? onUltraGroupDefaultNotificationLevelChanged;

  /// [loadUltraGroupDefaultNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  Function(
    int? code,
    String? targetId,
    RCIMIWPushNotificationLevel? level,
  )? onUltraGroupDefaultNotificationLevelLoaded;

  /// [changeUltraGroupChannelDefaultNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  Function(
    int? code,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )? onUltraGroupChannelDefaultNotificationLevelChanged;

  /// [loadUltraGroupChannelDefaultNotificationLevel] 的接口回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  Function(
    int? code,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )? onUltraGroupChannelDefaultNotificationLevelLoaded;

  /// [changePushContentShowStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [showContent] 是否显示远程推送内容
  Function(
    int? code,
    bool? showContent,
  )? onPushContentShowStatusChanged;

  /// [changePushLanguage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [language] 推送语言
  Function(
    int? code,
    String? language,
  )? onPushLanguageChanged;

  /// [changePushReceiveStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [receive] 是否接收
  Function(
    int? code,
    bool? receive,
  )? onPushReceiveStatusChanged;

  /// [loadMessageCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 消息的数量
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? count,
  )? onMessageCountLoaded;

  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversations] 加载的会话集合
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWConversation>? conversations,
  )? onTopConversationsLoaded;

  /// [sendGroupMessageToDesignatedUsers] 的接口回调
  /// 消息存入数据库的回调
  /// - [message] 发送的消息内容
  Function(
    RCIMIWMessage? message,
  )? onGroupMessageToDesignatedUsersAttached;

  /// [sendGroupMessageToDesignatedUsers] 的接口回调
  /// 消息发送完成的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息内容
  Function(
    int? code,
    RCIMIWMessage? message,
  )? onGroupMessageToDesignatedUsersSent;

  /// [syncUltraGroupReadStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 已读时间
  Function(
    int? code,
    String? targetId,
    String? channelId,
    int? timestamp,
  )? onUltraGroupReadStatusSynced;

  /// [loadConversationsForAllChannel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type]     会话类型
  /// - [targetId] 会话 ID
  /// - [conversations] 获取到的会话集合
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    List<RCIMIWConversation>? conversations,
  )? onConversationsLoadedForAllChannel;

  /// [loadUltraGroupUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [count] 未读数量
  Function(
    int? code,
    String? targetId,
    int? count,
  )? onUltraGroupUnreadMentionedCountLoaded;

  Function(
    int? code,
    String? targetId,
    int? count,
  )? onUltraGroupUnreadCountLoaded;

  /// [modifyUltraGroupMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  Function(
    int? code,
    String? messageUId,
  )? onUltraGroupMessageModified;

  /// [recallUltraGroupMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 撤回的消息
  /// - [deleteRemote] 调用接口时传入的是否删除远端消息
  Function(
    int? code,
    RCIMIWMessage? message,
    bool? deleteRemote,
  )? onUltraGroupMessageRecalled;

  /// [clearUltraGroupMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// - [policy] 清除策略
  Function(
    int? code,
    String? targetId,
    String? channelId,
    int? timestamp,
    RCIMIWMessageOperationPolicy? policy,
  )? onUltraGroupMessagesCleared;

  /// [clearUltraGroupMessagesForAllChannel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  Function(
    int? code,
    String? targetId,
    int? timestamp,
  )? onUltraGroupMessagesClearedForAllChannel;

  /// [sendUltraGroupTypingStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [typingStatus]
  Function(
    int? code,
    String? targetId,
    String? channelId,
    RCIMIWUltraGroupTypingStatus? typingStatus,
  )? onUltraGroupTypingStatusSent;

  /// [loadBatchRemoteUltraGroupMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [matchedMessages] 从服务获取的消息列表
  /// - [notMatchedMessages] 非法参数或者从服务没有拿到对应消息
  Function(
    int? code,
    List<RCIMIWMessage>? matchedMessages,
    List<RCIMIWMessage>? notMatchedMessages,
  )? onBatchRemoteUltraGroupMessagesLoaded;

  /// [updateUltraGroupMessageExpansion] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [expansion] 更新的消息扩展信息键值对
  /// - [messageUId] 消息的 messageUid
  Function(
    int? code,
    Map? expansion,
    String? messageUId,
  )? onUltraGroupMessageExpansionUpdated;

  /// [removeUltraGroupMessageExpansion] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [keys]  消息扩展信息中待删除的 key 的列表
  Function(
    int? code,
    String? messageUId,
    List<String>? keys,
  )? onUltraGroupMessageExpansionRemoved;

  Future<dynamic> _handler(MethodCall call) async {
    log("[RC:Flutter] " +
        call.method +
        " arguments:" +
        call.arguments.toString());
    switch (call.method) {
      case 'engine:onMessageReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;
        int? left = arguments['left'];
        bool? offline = arguments['offline'];
        bool? hasPackage = arguments['hasPackage'];

        onMessageReceived?.call(message, left, offline, hasPackage);
        log("[RC:Flutter] engine:onMessageReceived invoke finished");
        break;

      case 'engine:onConnectionStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConnectionStatus? status = arguments['status'] == null
            ? null
            : RCIMIWConnectionStatus.values[arguments['status']];

        onConnectionStatusChanged?.call(status);
        log("[RC:Flutter] engine:onConnectionStatusChanged invoke finished");
        break;

      case 'engine:onConversationTopStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        bool? top = arguments['top'];

        onConversationTopStatusSynced?.call(type, targetId, channelId, top);
        log("[RC:Flutter] engine:onConversationTopStatusSynced invoke finished");
        break;

      case 'engine:onRemoteMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onRemoteMessageRecalled?.call(message);
        log("[RC:Flutter] engine:onRemoteMessageRecalled invoke finished");
        break;

      case 'engine:onPrivateReadReceiptReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        onPrivateReadReceiptReceived?.call(targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onPrivateReadReceiptReceived invoke finished");
        break;

      case 'engine:onRemoteMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;

        Map? expansion = arguments['expansion'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onRemoteMessageExpansionUpdated?.call(expansion, message);
        log("[RC:Flutter] engine:onRemoteMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onRemoteMessageExpansionForKeyRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;
        List<String>? keys = List.from(arguments['keys']);

        onRemoteMessageExpansionForKeyRemoved?.call(message, keys);
        log("[RC:Flutter] engine:onRemoteMessageExpansionForKeyRemoved invoke finished");
        break;

      case 'engine:onChatRoomMemberChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWChatRoomMemberAction> actionsStr = [];
        arguments['actions'].forEach((element) {
          actionsStr.add(RCIMIWChatRoomMemberAction.fromJson(
              Map<String, dynamic>.from(element)));
        });

        String? targetId = arguments['targetId'];
        List<RCIMIWChatRoomMemberAction>? actions = actionsStr;

        onChatRoomMemberChanged?.call(targetId, actions);
        log("[RC:Flutter] engine:onChatRoomMemberChanged invoke finished");
        break;

      case 'engine:onTypingStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWTypingStatus> userTypingStatusStr = [];
        arguments['userTypingStatus'].forEach((element) {
          userTypingStatusStr.add(
              RCIMIWTypingStatus.fromJson(Map<String, dynamic>.from(element)));
        });

        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWTypingStatus>? userTypingStatus = userTypingStatusStr;

        onTypingStatusChanged?.call(
            type, targetId, channelId, userTypingStatus);
        log("[RC:Flutter] engine:onTypingStatusChanged invoke finished");
        break;

      case 'engine:onConversationReadStatusSyncMessageReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        int? timestamp = arguments['timestamp'];

        onConversationReadStatusSyncMessageReceived?.call(
            type, targetId, timestamp);
        log("[RC:Flutter] engine:onConversationReadStatusSyncMessageReceived invoke finished");
        break;

      case 'engine:onChatRoomEntriesSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? roomId = arguments['roomId'];

        onChatRoomEntriesSynced?.call(roomId);
        log("[RC:Flutter] engine:onChatRoomEntriesSynced invoke finished");
        break;

      case 'engine:onChatRoomEntriesChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWChatRoomEntriesOperationType? operationType =
            arguments['operationType'] == null
                ? null
                : RCIMIWChatRoomEntriesOperationType
                    .values[arguments['operationType']];
        String? roomId = arguments['roomId'];
        Map? entries = arguments['entries'];

        onChatRoomEntriesChanged?.call(operationType, roomId, entries);
        log("[RC:Flutter] engine:onChatRoomEntriesChanged invoke finished");
        break;

      case 'engine:onRemoteUltraGroupMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        List<RCIMIWMessage>? messages = messagesStr;

        onRemoteUltraGroupMessageExpansionUpdated?.call(messages);
        log("[RC:Flutter] engine:onRemoteUltraGroupMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onRemoteUltraGroupMessageModified':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        List<RCIMIWMessage>? messages = messagesStr;

        onRemoteUltraGroupMessageModified?.call(messages);
        log("[RC:Flutter] engine:onRemoteUltraGroupMessageModified invoke finished");
        break;

      case 'engine:onRemoteUltraGroupMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        List<RCIMIWMessage>? messages = messagesStr;

        onRemoteUltraGroupMessageRecalled?.call(messages);
        log("[RC:Flutter] engine:onRemoteUltraGroupMessageRecalled invoke finished");
        break;

      case 'engine:onUltraGroupReadTimeReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        onUltraGroupReadTimeReceived?.call(targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onUltraGroupReadTimeReceived invoke finished");
        break;

      case 'engine:onUltraGroupTypingStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWUltraGroupTypingStatusInfo> infoStr = [];
        arguments['info'].forEach((element) {
          infoStr.add(RCIMIWUltraGroupTypingStatusInfo.fromJson(
              Map<String, dynamic>.from(element)));
        });

        List<RCIMIWUltraGroupTypingStatusInfo>? info = infoStr;

        onUltraGroupTypingStatusChanged?.call(info);
        log("[RC:Flutter] engine:onUltraGroupTypingStatusChanged invoke finished");
        break;

      case 'engine:onMessageBlocked':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWBlockedMessageInfo? info = arguments['info'] != null
            ? RCIMIWBlockedMessageInfo.fromJson(
                Map<String, dynamic>.from(arguments['info']))
            : null;

        onMessageBlocked?.call(info);
        log("[RC:Flutter] engine:onMessageBlocked invoke finished");
        break;

      case 'engine:onChatRoomStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        RCIMIWChatRoomStatus? status = arguments['status'] == null
            ? null
            : RCIMIWChatRoomStatus.values[arguments['status']];

        onChatRoomStatusChanged?.call(targetId, status);
        log("[RC:Flutter] engine:onChatRoomStatusChanged invoke finished");
        break;

      case 'engine:onGroupMessageReadReceiptRequestReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? messageUId = arguments['messageUId'];

        onGroupMessageReadReceiptRequestReceived?.call(targetId, messageUId);
        log("[RC:Flutter] engine:onGroupMessageReadReceiptRequestReceived invoke finished");
        break;

      case 'engine:onGroupMessageReadReceiptResponseReceived':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];
        String? messageUId = arguments['messageUId'];
        Map? respondUserIds = arguments['respondUserIds'];

        onGroupMessageReadReceiptResponseReceived?.call(
            targetId, messageUId, respondUserIds);
        log("[RC:Flutter] engine:onGroupMessageReadReceiptResponseReceived invoke finished");
        break;

      case 'engine:onConnected':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];

        onConnected?.call(code, userId);
        log("[RC:Flutter] engine:onConnected invoke finished");
        break;

      case 'engine:onDatabaseOpened':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];

        onDatabaseOpened?.call(code);
        log("[RC:Flutter] engine:onDatabaseOpened invoke finished");
        break;

      case 'engine:onConversationLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWConversation? conversation = arguments['conversation'] != null
            ? RCIMIWConversation.fromJson(
                Map<String, dynamic>.from(arguments['conversation']))
            : null;

        onConversationLoaded?.call(
            code, type, targetId, channelId, conversation);
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
              RCIMIWConversation.fromJson(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        int? startTime = arguments['startTime'];
        int? count = arguments['count'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        onConversationsLoaded?.call(code, conversationTypes, channelId,
            startTime, count, conversations);
        log("[RC:Flutter] engine:onConversationsLoaded invoke finished");
        break;

      case 'engine:onConversationRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];

        onConversationRemoved?.call(code, type, targetId, channelId);
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

        onConversationsRemoved?.call(code, conversationTypes, channelId);
        log("[RC:Flutter] engine:onConversationsRemoved invoke finished");
        break;

      case 'engine:onTotalUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        onTotalUnreadCountLoaded?.call(code, channelId, count);
        log("[RC:Flutter] engine:onTotalUnreadCountLoaded invoke finished");
        break;

      case 'engine:onUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        onUnreadCountLoaded?.call(code, type, targetId, channelId, count);
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

        onUnreadCountByConversationTypesLoaded?.call(
            code, conversationTypes, channelId, contain, count);
        log("[RC:Flutter] engine:onUnreadCountByConversationTypesLoaded invoke finished");
        break;

      case 'engine:onUnreadMentionedCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        onUnreadMentionedCountLoaded?.call(
            code, type, targetId, channelId, count);
        log("[RC:Flutter] engine:onUnreadMentionedCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupAllUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? count = arguments['count'];

        onUltraGroupAllUnreadCountLoaded?.call(code, count);
        log("[RC:Flutter] engine:onUltraGroupAllUnreadCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupAllUnreadMentionedCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? count = arguments['count'];

        onUltraGroupAllUnreadMentionedCountLoaded?.call(code, count);
        log("[RC:Flutter] engine:onUltraGroupAllUnreadMentionedCountLoaded invoke finished");
        break;

      case 'engine:onUnreadCountCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        onUnreadCountCleared?.call(code, type, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onUnreadCountCleared invoke finished");
        break;

      case 'engine:onDraftMessageSaved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? draft = arguments['draft'];

        onDraftMessageSaved?.call(code, type, targetId, channelId, draft);
        log("[RC:Flutter] engine:onDraftMessageSaved invoke finished");
        break;

      case 'engine:onDraftMessageCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];

        onDraftMessageCleared?.call(code, type, targetId, channelId);
        log("[RC:Flutter] engine:onDraftMessageCleared invoke finished");
        break;

      case 'engine:onDraftMessageLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? draft = arguments['draft'];

        onDraftMessageLoaded?.call(code, type, targetId, channelId, draft);
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
              RCIMIWConversation.fromJson(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        onBlockedConversationsLoaded?.call(
            code, conversationTypes, channelId, conversations);
        log("[RC:Flutter] engine:onBlockedConversationsLoaded invoke finished");
        break;

      case 'engine:onConversationTopStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        bool? top = arguments['top'];

        onConversationTopStatusChanged?.call(
            code, type, targetId, channelId, top);
        log("[RC:Flutter] engine:onConversationTopStatusChanged invoke finished");
        break;

      case 'engine:onConversationTopStatusLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        bool? top = arguments['top'];

        onConversationTopStatusLoaded?.call(
            code, type, targetId, channelId, top);
        log("[RC:Flutter] engine:onConversationTopStatusLoaded invoke finished");
        break;

      case 'engine:onConversationReadStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        onConversationReadStatusSynced?.call(
            code, type, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onConversationReadStatusSynced invoke finished");
        break;

      case 'engine:onMessageAttached':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onMessageAttached?.call(message);
        log("[RC:Flutter] engine:onMessageAttached invoke finished");
        break;

      case 'engine:onMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onMessageSent?.call(code, message);
        log("[RC:Flutter] engine:onMessageSent invoke finished");
        break;

      case 'engine:onMediaMessageAttached':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMediaMessage? message = arguments['message'] != null
            ? (RCIMConverter.convertMessage(
                    Map<String, dynamic>.from(arguments['message']))
                as RCIMIWMediaMessage?)
            : null;

        onMediaMessageAttached?.call(message);
        log("[RC:Flutter] engine:onMediaMessageAttached invoke finished");
        break;

      case 'engine:onMediaMessageSending':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMediaMessage? message = arguments['message'] != null
            ? (RCIMConverter.convertMessage(
                    Map<String, dynamic>.from(arguments['message']))
                as RCIMIWMediaMessage?)
            : null;
        int? progress = arguments['progress'];

        onMediaMessageSending?.call(message, progress);
        log("[RC:Flutter] engine:onMediaMessageSending invoke finished");
        break;

      case 'engine:onSendingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message = arguments['message'] != null
            ? (RCIMConverter.convertMessage(
                    Map<String, dynamic>.from(arguments['message']))
                as RCIMIWMediaMessage?)
            : null;

        onSendingMediaMessageCanceled?.call(code, message);
        log("[RC:Flutter] engine:onSendingMediaMessageCanceled invoke finished");
        break;

      case 'engine:onMediaMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message = arguments['message'] != null
            ? (RCIMConverter.convertMessage(
                    Map<String, dynamic>.from(arguments['message']))
                as RCIMIWMediaMessage?)
            : null;

        onMediaMessageSent?.call(code, message);
        log("[RC:Flutter] engine:onMediaMessageSent invoke finished");
        break;

      case 'engine:onMediaMessageDownloading':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMediaMessage? message = arguments['message'] != null
            ? (RCIMConverter.convertMessage(
                    Map<String, dynamic>.from(arguments['message']))
                as RCIMIWMediaMessage?)
            : null;
        int? progress = arguments['progress'];

        onMediaMessageDownloading?.call(message, progress);
        log("[RC:Flutter] engine:onMediaMessageDownloading invoke finished");
        break;

      case 'engine:onMediaMessageDownloaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message = arguments['message'] != null
            ? (RCIMConverter.convertMessage(
                    Map<String, dynamic>.from(arguments['message']))
                as RCIMIWMediaMessage?)
            : null;

        onMediaMessageDownloaded?.call(code, message);
        log("[RC:Flutter] engine:onMediaMessageDownloaded invoke finished");
        break;

      case 'engine:onDownloadingMediaMessageCanceled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMediaMessage? message = arguments['message'] != null
            ? (RCIMConverter.convertMessage(
                    Map<String, dynamic>.from(arguments['message']))
                as RCIMIWMediaMessage?)
            : null;

        onDownloadingMediaMessageCanceled?.call(code, message);
        log("[RC:Flutter] engine:onDownloadingMediaMessageCanceled invoke finished");
        break;

      case 'engine:onMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? sentTime = arguments['sentTime'];
        RCIMIWTimeOrder? order = arguments['order'] == null
            ? null
            : RCIMIWTimeOrder.values[arguments['order']];
        List<RCIMIWMessage>? messages = messagesStr;

        onMessagesLoaded?.call(
            code, type, targetId, channelId, sentTime, order, messages);
        log("[RC:Flutter] engine:onMessagesLoaded invoke finished");
        break;

      case 'engine:onUnreadMentionedMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWMessage>? messages = messagesStr;

        onUnreadMentionedMessagesLoaded?.call(
            code, type, targetId, channelId, messages);
        log("[RC:Flutter] engine:onUnreadMentionedMessagesLoaded invoke finished");
        break;

      case 'engine:onFirstUnreadMessageLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onFirstUnreadMessageLoaded?.call(
            code, type, targetId, channelId, message);
        log("[RC:Flutter] engine:onFirstUnreadMessageLoaded invoke finished");
        break;

      case 'engine:onMessageInserted':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onMessageInserted?.call(code, message);
        log("[RC:Flutter] engine:onMessageInserted invoke finished");
        break;

      case 'engine:onMessagesInserted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWMessage>? messages = messagesStr;

        onMessagesInserted?.call(code, messages);
        log("[RC:Flutter] engine:onMessagesInserted invoke finished");
        break;

      case 'engine:onMessageCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        onMessageCleared?.call(code, type, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onMessageCleared invoke finished");
        break;

      case 'engine:onLocalMessagesDeleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWMessage>? messages = messagesStr;

        onLocalMessagesDeleted?.call(code, messages);
        log("[RC:Flutter] engine:onLocalMessagesDeleted invoke finished");
        break;

      case 'engine:onMessagesDeleted':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWMessage>? messages = messagesStr;

        onMessagesDeleted?.call(code, type, targetId, channelId, messages);
        log("[RC:Flutter] engine:onMessagesDeleted invoke finished");
        break;

      case 'engine:onMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onMessageRecalled?.call(code, message);
        log("[RC:Flutter] engine:onMessageRecalled invoke finished");
        break;

      case 'engine:onPrivateReadReceiptMessageSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        onPrivateReadReceiptMessageSent?.call(
            code, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onPrivateReadReceiptMessageSent invoke finished");
        break;

      case 'engine:onMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];
        Map? expansion = arguments['expansion'];

        onMessageExpansionUpdated?.call(code, messageUId, expansion);
        log("[RC:Flutter] engine:onMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onMessageExpansionForKeysRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];
        List<String>? keys = List.from(arguments['keys']);

        onMessageExpansionForKeysRemoved?.call(code, messageUId, keys);
        log("[RC:Flutter] engine:onMessageExpansionForKeysRemoved invoke finished");
        break;

      case 'engine:onMessageReceiveStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? messageId = arguments['messageId'];

        onMessageReceiveStatusChanged?.call(code, messageId);
        log("[RC:Flutter] engine:onMessageReceiveStatusChanged invoke finished");
        break;

      case 'engine:onMessageSentStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        int? messageId = arguments['messageId'];

        onMessageSentStatusChanged?.call(code, messageId);
        log("[RC:Flutter] engine:onMessageSentStatusChanged invoke finished");
        break;

      case 'engine:onChatRoomJoined':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];

        onChatRoomJoined?.call(code, targetId);
        log("[RC:Flutter] engine:onChatRoomJoined invoke finished");
        break;

      case 'engine:onChatRoomJoining':
        Map<dynamic, dynamic> arguments = call.arguments;

        String? targetId = arguments['targetId'];

        onChatRoomJoining?.call(targetId);
        log("[RC:Flutter] engine:onChatRoomJoining invoke finished");
        break;

      case 'engine:onChatRoomLeft':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];

        onChatRoomLeft?.call(code, targetId);
        log("[RC:Flutter] engine:onChatRoomLeft invoke finished");
        break;

      case 'engine:onChatRoomMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        List<RCIMIWMessage>? messages = messagesStr;
        int? syncTime = arguments['syncTime'];

        onChatRoomMessagesLoaded?.call(code, targetId, messages, syncTime);
        log("[RC:Flutter] engine:onChatRoomMessagesLoaded invoke finished");
        break;

      case 'engine:onChatRoomEntryAdded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? key = arguments['key'];

        onChatRoomEntryAdded?.call(code, targetId, key);
        log("[RC:Flutter] engine:onChatRoomEntryAdded invoke finished");
        break;

      case 'engine:onChatRoomEntriesAdded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        Map? entries = arguments['entries'];
        Map? errorEntries = arguments['errorEntries'];

        onChatRoomEntriesAdded?.call(code, targetId, entries, errorEntries);
        log("[RC:Flutter] engine:onChatRoomEntriesAdded invoke finished");
        break;

      case 'engine:onChatRoomEntryLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        Map? entry = arguments['entry'];

        onChatRoomEntryLoaded?.call(code, targetId, entry);
        log("[RC:Flutter] engine:onChatRoomEntryLoaded invoke finished");
        break;

      case 'engine:onAllChatRoomEntriesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        Map? entries = arguments['entries'];

        onAllChatRoomEntriesLoaded?.call(code, targetId, entries);
        log("[RC:Flutter] engine:onAllChatRoomEntriesLoaded invoke finished");
        break;

      case 'engine:onChatRoomEntryRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? key = arguments['key'];

        onChatRoomEntryRemoved?.call(code, targetId, key);
        log("[RC:Flutter] engine:onChatRoomEntryRemoved invoke finished");
        break;

      case 'engine:onChatRoomEntriesRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        List<String>? keys = List.from(arguments['keys']);

        onChatRoomEntriesRemoved?.call(code, targetId, keys);
        log("[RC:Flutter] engine:onChatRoomEntriesRemoved invoke finished");
        break;

      case 'engine:onBlacklistAdded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];

        onBlacklistAdded?.call(code, userId);
        log("[RC:Flutter] engine:onBlacklistAdded invoke finished");
        break;

      case 'engine:onBlacklistRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];

        onBlacklistRemoved?.call(code, userId);
        log("[RC:Flutter] engine:onBlacklistRemoved invoke finished");
        break;

      case 'engine:onBlacklistStatusLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? userId = arguments['userId'];
        RCIMIWBlacklistStatus? status = arguments['status'] == null
            ? null
            : RCIMIWBlacklistStatus.values[arguments['status']];

        onBlacklistStatusLoaded?.call(code, userId, status);
        log("[RC:Flutter] engine:onBlacklistStatusLoaded invoke finished");
        break;

      case 'engine:onBlacklistLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        List<String>? userIds = List.from(arguments['userIds']);

        onBlacklistLoaded?.call(code, userIds);
        log("[RC:Flutter] engine:onBlacklistLoaded invoke finished");
        break;

      case 'engine:onMessagesSearched':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? keyword = arguments['keyword'];
        int? startTime = arguments['startTime'];
        int? count = arguments['count'];
        List<RCIMIWMessage>? messages = messagesStr;

        onMessagesSearched?.call(code, type, targetId, channelId, keyword,
            startTime, count, messages);
        log("[RC:Flutter] engine:onMessagesSearched invoke finished");
        break;

      case 'engine:onMessagesSearchedByTimeRange':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        String? keyword = arguments['keyword'];
        int? startTime = arguments['startTime'];
        int? endTime = arguments['endTime'];
        int? offset = arguments['offset'];
        int? count = arguments['count'];
        List<RCIMIWMessage>? messages = messagesStr;

        onMessagesSearchedByTimeRange?.call(code, type, targetId, channelId,
            keyword, startTime, endTime, offset, count, messages);
        log("[RC:Flutter] engine:onMessagesSearchedByTimeRange invoke finished");
        break;

      case 'engine:onMessagesSearchedByUserId':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        String? userId = arguments['userId'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? startTime = arguments['startTime'];
        int? count = arguments['count'];
        List<RCIMIWMessage>? messages = messagesStr;

        onMessagesSearchedByUserId?.call(code, userId, type, targetId,
            channelId, startTime, count, messages);
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
          conversationsStr.add(RCIMIWSearchConversationResult.fromJson(
              Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        List<RCIMIWMessageType>? messageTypes = messageTypesStr;
        String? keyword = arguments['keyword'];
        List<RCIMIWSearchConversationResult>? conversations = conversationsStr;

        onConversationsSearched?.call(code, conversationTypes, channelId,
            messageTypes, keyword, conversations);
        log("[RC:Flutter] engine:onConversationsSearched invoke finished");
        break;

      case 'engine:onGroupReadReceiptRequestSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onGroupReadReceiptRequestSent?.call(code, message);
        log("[RC:Flutter] engine:onGroupReadReceiptRequestSent invoke finished");
        break;

      case 'engine:onGroupReadReceiptResponseSent':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> messagesStr = [];
        arguments['messages'].forEach((element) {
          messagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        List<RCIMIWMessage>? messages = messagesStr;

        onGroupReadReceiptResponseSent?.call(
            code, targetId, channelId, messages);
        log("[RC:Flutter] engine:onGroupReadReceiptResponseSent invoke finished");
        break;

      case 'engine:onNotificationQuietHoursChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? startTime = arguments['startTime'];
        int? spanMins = arguments['spanMins'];
        RCIMIWPushNotificationQuietHoursLevel? level = arguments['level'] ==
                null
            ? null
            : RCIMIWPushNotificationQuietHoursLevel.values[arguments['level']];

        onNotificationQuietHoursChanged?.call(code, startTime, spanMins, level);
        log("[RC:Flutter] engine:onNotificationQuietHoursChanged invoke finished");
        break;

      case 'engine:onNotificationQuietHoursRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];

        onNotificationQuietHoursRemoved?.call(code);
        log("[RC:Flutter] engine:onNotificationQuietHoursRemoved invoke finished");
        break;

      case 'engine:onNotificationQuietHoursLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? startTime = arguments['startTime'];
        int? spanMins = arguments['spanMins'];
        RCIMIWPushNotificationQuietHoursLevel? level = arguments['level'] ==
                null
            ? null
            : RCIMIWPushNotificationQuietHoursLevel.values[arguments['level']];

        onNotificationQuietHoursLoaded?.call(code, startTime, spanMins, level);
        log("[RC:Flutter] engine:onNotificationQuietHoursLoaded invoke finished");
        break;

      case 'engine:onConversationNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onConversationNotificationLevelChanged?.call(
            code, type, targetId, channelId, level);
        log("[RC:Flutter] engine:onConversationNotificationLevelChanged invoke finished");
        break;

      case 'engine:onConversationNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onConversationNotificationLevelLoaded?.call(
            code, type, targetId, channelId, level);
        log("[RC:Flutter] engine:onConversationNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onConversationTypeNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onConversationTypeNotificationLevelChanged?.call(code, type, level);
        log("[RC:Flutter] engine:onConversationTypeNotificationLevelChanged invoke finished");
        break;

      case 'engine:onConversationTypeNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onConversationTypeNotificationLevelLoaded?.call(code, type, level);
        log("[RC:Flutter] engine:onConversationTypeNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onUltraGroupDefaultNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onUltraGroupDefaultNotificationLevelChanged?.call(
            code, targetId, level);
        log("[RC:Flutter] engine:onUltraGroupDefaultNotificationLevelChanged invoke finished");
        break;

      case 'engine:onUltraGroupDefaultNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onUltraGroupDefaultNotificationLevelLoaded?.call(code, targetId, level);
        log("[RC:Flutter] engine:onUltraGroupDefaultNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onUltraGroupChannelDefaultNotificationLevelChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onUltraGroupChannelDefaultNotificationLevelChanged?.call(
            code, targetId, channelId, level);
        log("[RC:Flutter] engine:onUltraGroupChannelDefaultNotificationLevelChanged invoke finished");
        break;

      case 'engine:onUltraGroupChannelDefaultNotificationLevelLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWPushNotificationLevel? level = arguments['level'] == null
            ? null
            : RCIMIWPushNotificationLevel.values[arguments['level']];

        onUltraGroupChannelDefaultNotificationLevelLoaded?.call(
            code, targetId, channelId, level);
        log("[RC:Flutter] engine:onUltraGroupChannelDefaultNotificationLevelLoaded invoke finished");
        break;

      case 'engine:onPushContentShowStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        bool? showContent = arguments['showContent'];

        onPushContentShowStatusChanged?.call(code, showContent);
        log("[RC:Flutter] engine:onPushContentShowStatusChanged invoke finished");
        break;

      case 'engine:onPushLanguageChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? language = arguments['language'];

        onPushLanguageChanged?.call(code, language);
        log("[RC:Flutter] engine:onPushLanguageChanged invoke finished");
        break;

      case 'engine:onPushReceiveStatusChanged':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        bool? receive = arguments['receive'];

        onPushReceiveStatusChanged?.call(code, receive);
        log("[RC:Flutter] engine:onPushReceiveStatusChanged invoke finished");
        break;

      case 'engine:onMessageCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? count = arguments['count'];

        onMessageCountLoaded?.call(code, type, targetId, channelId, count);
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
              RCIMIWConversation.fromJson(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWConversationType>? conversationTypes = conversationTypesStr;
        String? channelId = arguments['channelId'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        onTopConversationsLoaded?.call(
            code, conversationTypes, channelId, conversations);
        log("[RC:Flutter] engine:onTopConversationsLoaded invoke finished");
        break;

      case 'engine:onGroupMessageToDesignatedUsersAttached':
        Map<dynamic, dynamic> arguments = call.arguments;

        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onGroupMessageToDesignatedUsersAttached?.call(message);
        log("[RC:Flutter] engine:onGroupMessageToDesignatedUsersAttached invoke finished");
        break;

      case 'engine:onGroupMessageToDesignatedUsersSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;

        onGroupMessageToDesignatedUsersSent?.call(code, message);
        log("[RC:Flutter] engine:onGroupMessageToDesignatedUsersSent invoke finished");
        break;

      case 'engine:onUltraGroupReadStatusSynced':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];

        onUltraGroupReadStatusSynced?.call(
            code, targetId, channelId, timestamp);
        log("[RC:Flutter] engine:onUltraGroupReadStatusSynced invoke finished");
        break;

      case 'engine:onConversationsLoadedForAllChannel':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWConversation> conversationsStr = [];
        arguments['conversations'].forEach((element) {
          conversationsStr.add(
              RCIMIWConversation.fromJson(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        RCIMIWConversationType? type = arguments['type'] == null
            ? null
            : RCIMIWConversationType.values[arguments['type']];
        String? targetId = arguments['targetId'];
        List<RCIMIWConversation>? conversations = conversationsStr;

        onConversationsLoadedForAllChannel?.call(
            code, type, targetId, conversations);
        log("[RC:Flutter] engine:onConversationsLoadedForAllChannel invoke finished");
        break;

      case 'engine:onUltraGroupUnreadMentionedCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        int? count = arguments['count'];

        onUltraGroupUnreadMentionedCountLoaded?.call(code, targetId, count);
        log("[RC:Flutter] engine:onUltraGroupUnreadMentionedCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupUnreadCountLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        int? count = arguments['count'];

        onUltraGroupUnreadCountLoaded?.call(code, targetId, count);
        log("[RC:Flutter] engine:onUltraGroupUnreadCountLoaded invoke finished");
        break;

      case 'engine:onUltraGroupMessageModified':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];

        onUltraGroupMessageModified?.call(code, messageUId);
        log("[RC:Flutter] engine:onUltraGroupMessageModified invoke finished");
        break;

      case 'engine:onUltraGroupMessageRecalled':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        RCIMIWMessage? message = arguments['message'] != null
            ? RCIMConverter.convertMessage(
                Map<String, dynamic>.from(arguments['message']))
            : null;
        bool? deleteRemote = arguments['deleteRemote'];

        onUltraGroupMessageRecalled?.call(code, message, deleteRemote);
        log("[RC:Flutter] engine:onUltraGroupMessageRecalled invoke finished");
        break;

      case 'engine:onUltraGroupMessagesCleared':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        int? timestamp = arguments['timestamp'];
        RCIMIWMessageOperationPolicy? policy = arguments['policy'] == null
            ? null
            : RCIMIWMessageOperationPolicy.values[arguments['policy']];

        onUltraGroupMessagesCleared?.call(
            code, targetId, channelId, timestamp, policy);
        log("[RC:Flutter] engine:onUltraGroupMessagesCleared invoke finished");
        break;

      case 'engine:onUltraGroupMessagesClearedForAllChannel':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        int? timestamp = arguments['timestamp'];

        onUltraGroupMessagesClearedForAllChannel?.call(
            code, targetId, timestamp);
        log("[RC:Flutter] engine:onUltraGroupMessagesClearedForAllChannel invoke finished");
        break;

      case 'engine:onUltraGroupTypingStatusSent':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? targetId = arguments['targetId'];
        String? channelId = arguments['channelId'];
        RCIMIWUltraGroupTypingStatus? typingStatus =
            arguments['typingStatus'] == null
                ? null
                : RCIMIWUltraGroupTypingStatus
                    .values[arguments['typingStatus']];

        onUltraGroupTypingStatusSent?.call(
            code, targetId, channelId, typingStatus);
        log("[RC:Flutter] engine:onUltraGroupTypingStatusSent invoke finished");
        break;

      case 'engine:onBatchRemoteUltraGroupMessagesLoaded':
        Map<dynamic, dynamic> arguments = call.arguments;
        List<RCIMIWMessage> matchedMessagesStr = [];
        arguments['matchedMessages'].forEach((element) {
          matchedMessagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });
        List<RCIMIWMessage> notMatchedMessagesStr = [];
        arguments['notMatchedMessages'].forEach((element) {
          notMatchedMessagesStr.add(
              RCIMConverter.convertMessage(Map<String, dynamic>.from(element)));
        });

        int? code = arguments['code'];
        List<RCIMIWMessage>? matchedMessages = matchedMessagesStr;
        List<RCIMIWMessage>? notMatchedMessages = notMatchedMessagesStr;

        onBatchRemoteUltraGroupMessagesLoaded?.call(
            code, matchedMessages, notMatchedMessages);
        log("[RC:Flutter] engine:onBatchRemoteUltraGroupMessagesLoaded invoke finished");
        break;

      case 'engine:onUltraGroupMessageExpansionUpdated':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        Map? expansion = arguments['expansion'];
        String? messageUId = arguments['messageUId'];

        onUltraGroupMessageExpansionUpdated?.call(code, expansion, messageUId);
        log("[RC:Flutter] engine:onUltraGroupMessageExpansionUpdated invoke finished");
        break;

      case 'engine:onUltraGroupMessageExpansionRemoved':
        Map<dynamic, dynamic> arguments = call.arguments;

        int? code = arguments['code'];
        String? messageUId = arguments['messageUId'];
        List<String>? keys = List.from(arguments['keys']);

        onUltraGroupMessageExpansionRemoved?.call(code, messageUId, keys);
        log("[RC:Flutter] engine:onUltraGroupMessageExpansionRemoved invoke finished");
        break;
    }
  }
}
