import 'dart:async';
import 'rongcloud_im_callbacks.dart';
import 'rongcloud_im_converter.dart';
import 'rongcloud_im_wrapper_platform_interface.dart';
import 'rongcloud_im_classes.dart';
import 'rongcloud_im_enum.dart';

class RCIMIWEngine {
  static RCIMIWEngine? _instance;

  Future<RCIMIWEngine> _create(String appKey, RCIMIWEngineOptions options) async {
    await RCIMWrapperPlatform.instance.create(appKey, options);
    RCIMWrapperPlatform.instance.setEngine(this);
    return this;
  }

  /// 引擎构建方法
  /// - [appKey] 开发者后台获取的 AppKey
  /// - [options] 引擎相关配置项
  static Future<RCIMIWEngine> create(String appKey, RCIMIWEngineOptions options) async {
    _instance ??= RCIMIWEngine();
    return _instance!._create(appKey, options);
  }

  /// 销毁引擎
  Future<void> destroy() async {
    _instance = null;
    await RCIMWrapperPlatform.instance.destroy();
  }

  /// 注册自定义消息
  /// - [objectName] 自定义消息的 objectName, 需要与原生定义的 objectName 相同
  /// - [messageDcoder] 消息的解析方法
  Future<void> registerCustomMessage(
    String objectName,
    RCIMIWUserCustomMessage Function(Map<String, dynamic> json) messageDcoder,
  ) async {
    RCIMConverter.decodeMap[objectName] = messageDcoder;
  }

  // -------- web 专有的方法 --------

  /// 构建图片消息，web 专用
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 图片消息的本地路径，必须为有效路径
  /// - [返回值] 图片消息实体
  Future<RCIMIWImageMessage?> createImageMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) async {
    return RCIMWrapperPlatform.instance.createImageMessageForWeb(type, targetId, channelId, file);
  }

  /// 构建文件消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 文件节点
  /// - [返回值] 文件消息实体
  Future<RCIMIWFileMessage?> createFileMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) async {
    return RCIMWrapperPlatform.instance.createFileMessageForWeb(type, targetId, channelId, file);
  }

  /// 构建小视频消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 小视频文件节点
  /// - [duration] 小视频消息的视频时长
  /// - [返回值] 视频消息实体
  Future<RCIMIWSightMessage?> createSightMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) async {
    return RCIMWrapperPlatform.instance.createSightMessageForWeb(type, targetId, channelId, file);
  }

  /// 构建 GIF 消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] GIF 消息的本地路径
  /// - [返回值] GIF 消息实体
  Future<RCIMIWGIFMessage?> createGIFMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) async {
    return await RCIMWrapperPlatform.instance.createGIFMessageForWeb(type, targetId, channelId, file);
  }

  /// 构建语音消息 (高清语音)
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 语音文件节点
  /// - [duration] 语音消息的消息时长
  /// - [返回值] 语音消息的实体
  Future<RCIMIWVoiceMessage?> createVoiceMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) async {
    return RCIMWrapperPlatform.instance.createVoiceMessageForWeb(type, targetId, channelId, file);
  }

  /// 构建位置消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [longitude] 经度
  /// - [latitude] 纬度
  /// - [poiName]  POI 信息
  /// - [thumbnailBase64] 缩略图的 base64 字符串
  /// - [返回值] 位置消息实体
  Future<RCIMIWLocationMessage?> createLocationMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    double longitude,
    double latitude,
    String poiName,
    String thumbnailBase64,
  ) async {
    return RCIMWrapperPlatform.instance.createLocationMessageForWeb(
      type,
      targetId,
      channelId,
      longitude,
      latitude,
      poiName,
      thumbnailBase64,
    );
  }

  /// 更新消息扩展信息
  /// 每条消息携带扩展信息键值对最大值 300个，单次设置扩展信息键值对最大值 20个
  /// - [message] 已发送的消息
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionUpdated]
  Future<int> updateMessageExpansionForWeb(
    RCIMIWMessage message,
    Map expansion, {
    IRCIMIWUpdateMessageExpansionCallback? callback,
  }) async {
    return await RCIMWrapperPlatform.instance.updateMessageExpansionForWeb(message, expansion, callback: callback);
  }

  /// 删除消息扩展信息中特定的键值对
  /// - [message] 已发送的消息
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionForKeysRemoved]
  Future<int> removeMessageExpansionForKeysForWeb(
    RCIMIWMessage message,
    List<String> keys, {
    IRCIMIWRemoveMessageExpansionForKeysCallback? callback,
  }) async {
    return await RCIMWrapperPlatform.instance.removeMessageExpansionForKeysForWeb(message, keys, callback: callback);
  }

  /// 发送某个会话中的消息阅读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPrivateReadReceiptMessageSent]
  Future<int> sendPrivateReadReceiptMessageForWeb(
    String targetId,
    String? channelId,
    int timestamp,
    String messageUId, {
    IRCIMIWSendPrivateReadReceiptMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendPrivateReadReceiptMessageForWeb(
      targetId,
      channelId,
      timestamp,
      messageUId,
      callback: callback,
    );
  }

  /// 更新超级群消息扩展信息
  /// - [message] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格。
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionUpdated]
  Future<int> updateUltraGroupMessageExpansionForWeb(
    RCIMIWMessage message,
    Map expansion, {
    IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateUltraGroupMessageExpansionForWeb(message, expansion, callback: callback);
  }

  /// 删除超级群消息扩展信息中特定的键值对
  /// - [message] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionForKeysRemoved]
  Future<int> removeUltraGroupMessageExpansionForKeysForWeb(
    RCIMIWMessage message,
    List<String> keys, {
    IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback,
  }) {
    return RCIMWrapperPlatform.instance.removeUltraGroupMessageExpansionForKeysForWeb(
      message,
      keys,
      callback: callback,
    );
  }

  /// 修改超级群消息
  /// - [originalMessage] 发送成功的原始消息
  /// - [newMessage] 要修改的 message，要与原始消息类型一致
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageModified]
  Future<int> modifyUltraGroupMessageForWeb(
    RCIMIWMessage originalMessage,
    RCIMIWMessage newMessage, {
    IRCIMIWModifyUltraGroupMessageCallback? callback,
  }) {
    return RCIMWrapperPlatform.instance.modifyUltraGroupMessageForWeb(originalMessage, newMessage, callback: callback);
  }

  /// 消息扩展信息更改的回调 (web 端)
  /// - [expansion] 消息扩展信息中更新的键值对，只包含更新的键值对，不是全部的数据。如果想获取全部的键值对，请使用 message 的 expansion 属性。
  /// - [messageUId] 发生变化的消息 UId
  Function(Map? expansion, String? messageUId)? onRemoteMessageExpansionUpdatedForWeb;

  /// 消息扩展信息删除的回调
  /// - [messageUId] 发生变化的消息 UId
  /// - [keys] 消息扩展信息中删除的键值对 key 列表
  Function(String? messageUId, List<String>? keys)? onRemoteMessageExpansionForKeyRemovedForWeb;

  /// 会话状态更新的回调
  /// - [conversations] 有更新的所有会话
  Function(List<RCIMIWConversation> conversations)? onConversationsUpdateForWeb;

  // -------- web 专有的方法 --------

  /// [ZH]
  /// ---
  /// 注册原生自定义普通消息
  /// - [messageIdentifier] 消息的唯一标识
  /// - [persistentFlag] 消息的存储策略
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功，非 0 代表当前接口调用操作失败，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Register Native Custom Message
  /// - [messageIdentifier] The unique identifier of the message
  /// - [persistentFlag] The storage strategy of the message
  /// ---
  Future<int> registerNativeCustomMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    return RCIMWrapperPlatform.instance.registerNativeCustomMessage(messageIdentifier, persistentFlag);
  }

  /// [ZH]
  /// ---
  /// 注册原生自定义媒体消息
  /// - [messageIdentifier] 消息的唯一标识
  /// - [persistentFlag] 消息的存储策略
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功，非 0 代表当前接口调用操作失败，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Register Native Custom Media Message
  /// - [messageIdentifier] The unique identifier of the message.
  /// - [persistentFlag] The storage strategy of the message.
  /// ---
  Future<int> registerNativeCustomMediaMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    return RCIMWrapperPlatform.instance.registerNativeCustomMediaMessage(messageIdentifier, persistentFlag);
  }

  /// [ZH]
  /// ---
  /// 连接融云服务器，在整个应用程序全局，只需要调用一次。调用此接口返回非业务错误码时，SDK 会启动重连机制进行重连；如果仍没有连接成功，会在设备网络状态变化时再次进行重连。
  /// - [token] 调用 server api 获取到的 token
  /// - [timeout] 连接超时时间，单位：秒。
  /// timeout ≤ 0，则 IM 将一直连接，直到连接成功或者无法连接（如 token 非法）
  /// timeout > 0，则 IM 将最多连接 timeout 秒
  /// 如果在 timeout 秒内连接成功，后面再发生了网络变化或前后台切换，SDK 会自动重连； 如果在 timeout 秒无法连接成功则不再进行重连，通过 listener 告知连接超时，您需要再自行调用 connect 接口
  /// - [callback] 链接事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onConnected]
  /// ---
  /// [EN]
  /// ---
  /// Connect to the RongCloud server. This interface should be called only once globally throughout the application. When this interface returns a non-business error code, the SDK will initiate a reconnection mechanism. If the connection is still unsuccessful, the SDK will attempt to reconnect when the device's network status changes.
  /// - [token] The token obtained by calling the server API.
  /// - [timeout] Connection timeout duration in seconds.
  /// If timeout ≤ 0, the IM will keep trying to connect until it succeeds or fails (e.g., due to an invalid token).
  /// If timeout > 0, the IM will attempt to connect for a maximum of timeout seconds.
  /// If the connection is successful within timeLimit seconds, the SDK will automatically reconnect in case of network changes or app state transitions. If the connection fails within timeLimit seconds, no further reconnection attempts will be made, and the listener will notify of a connection timeout. You will need to manually call the connect interface again.
  /// - [callback] Connection event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener The interface callback can listen to [onConnected].
  /// ---
  Future<int> connect(String token, int timeout, {RCIMIWConnectCallback? callback}) async {
    return RCIMWrapperPlatform.instance.connect(token, timeout, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 断开链接
  /// 注：因为 SDK 在前后台切换或者网络出现异常都会自动重连，保证连接可靠性。 所以除非您的 App 逻辑需要登出，否则一般不需要调用此方法进行手动断开
  /// - [receivePush] 退出后是否接收 push，true:断开后接收远程推送，false:断开后不再接收远程推送
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Disconnect
  /// Note: Since the SDK automatically reconnects when the app switches between foreground and background or when network exceptions occur, ensuring connection reliability, this method is generally not required for manual disconnection unless your app logic requires logout.
  /// - [receivePush] Specifies whether to receive push notifications after disconnection. true: continue receiving remote push notifications after disconnection; false: stop receiving remote push notifications after disconnection.
  /// ---
  Future<int> disconnect(bool receivePush) async {
    return RCIMWrapperPlatform.instance.disconnect(receivePush);
  }

  /// [ZH]
  /// ---
  /// 获取当前 IM 服务连接状态
  /// - [返回值] 当前连接状态
  /// ---
  /// [EN]
  /// ---
  /// Get current IM service connection status
  /// ---
  Future<RCIMIWConnectionStatus> getConnectionStatus() async {
    return RCIMWrapperPlatform.instance.getConnectionStatus();
  }

  /// [ZH]
  /// ---
  /// 构建文本消息
  /// - [type] 会话类型，
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [text] 文本内容
  /// - [返回值] 文本消息实体
  /// ---
  /// [EN]
  /// ---
  /// Build Text Message
  /// - [type] Specifies the conversation type.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass `null`.
  /// - [text] Specifies the text content.
  /// ---
  Future<RCIMIWTextMessage?> createTextMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String text,
  ) async {
    return RCIMWrapperPlatform.instance.createTextMessage(type, targetId, channelId, text);
  }

  /// [ZH]
  /// ---
  /// 构建图片消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 图片消息的本地路径，必须为有效路径
  /// - [返回值] 图片消息实体
  /// ---
  /// [EN]
  /// ---
  /// Create an Image Message
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [path] Local path of the image message. Must be a valid path.
  /// ---
  Future<RCIMIWImageMessage?> createImageMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    return RCIMWrapperPlatform.instance.createImageMessage(type, targetId, channelId, path);
  }

  /// [ZH]
  /// ---
  /// 构建文件消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 文件消息的本地路径，必须为有效路径
  /// - [返回值] 文件消息实体
  /// ---
  /// [EN]
  /// ---
  /// Build File Message
  /// - [type] Specifies the conversation type.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [path] Specifies the local path of the file message, which must be a valid path.
  /// ---
  Future<RCIMIWFileMessage?> createFileMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    return RCIMWrapperPlatform.instance.createFileMessage(type, targetId, channelId, path);
  }

  /// [ZH]
  /// ---
  /// 构建小视频消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 小视频消息的本地路径，必须为有效路径
  /// - [duration] 小视频消息的视频时长
  /// - [返回值] 视频消息实体
  /// ---
  /// [EN]
  /// ---
  /// Build Short Video Message
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [path] Local path of the short video message. Must be a valid path.
  /// - [duration] Duration of the short video message
  /// ---
  Future<RCIMIWSightMessage?> createSightMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    return RCIMWrapperPlatform.instance.createSightMessage(type, targetId, channelId, path, duration);
  }

  /// [ZH]
  /// ---
  /// 构建语音消息 (高清语音)
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 语音消息的本地路径，必须为有效路径
  /// - [duration] 语音消息的消息时长
  /// - [返回值] 语音消息的实体
  /// ---
  /// [EN]
  /// ---
  /// Build a Voice Message (HD Voice)
  /// - [type] Specifies the conversation type.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID. Only supported for ultra groups. For other conversation types, pass null.
  /// - [path] Specifies the local path of the voice message. Must be a valid path.
  /// - [duration] Specifies the duration of the voice message.
  /// ---
  Future<RCIMIWVoiceMessage?> createVoiceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    return RCIMWrapperPlatform.instance.createVoiceMessage(type, targetId, channelId, path, duration);
  }

  /// [ZH]
  /// ---
  /// 构建引用消息
  /// - [type] 会话类型
  /// - [targetId]    会话 ID
  /// - [channelId]   频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [referenceMessage] 引用的消息
  /// - [text]   引用的文本内容
  /// - [返回值] 引用消息实体
  /// ---
  /// [EN]
  /// ---
  /// Construct a reference message
  /// - [type]   Conversation type
  /// - [targetId]    Conversation ID
  /// - [channelId]   Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [referenceMessage] The referenced message
  /// - [text]   The referenced text content
  /// ---
  Future<RCIMIWReferenceMessage?> createReferenceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWMessage referenceMessage,
    String text,
  ) async {
    return RCIMWrapperPlatform.instance.createReferenceMessage(type, targetId, channelId, referenceMessage, text);
  }

  /// [ZH]
  /// ---
  /// 构建 GIF 消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] GIF 消息的本地路径
  /// - [返回值] GIF 消息实体
  /// ---
  /// [EN]
  /// ---
  /// Build GIF Message
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [path] Local path of the GIF message
  /// ---
  Future<RCIMIWGIFMessage?> createGIFMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    return RCIMWrapperPlatform.instance.createGIFMessage(type, targetId, channelId, path);
  }

  /// [ZH]
  /// ---
  /// 构建自定义消息
  /// - [type] 会话类型
  /// - [targetId]     会话 ID
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [policy]  消息的存储策略
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [fields]  消息的内容键值对
  /// - [返回值] 自定义消息实体
  /// ---
  /// [EN]
  /// ---
  /// Build Custom Message
  /// - [type]    Conversation type
  /// - [targetId]     Conversation ID
  /// - [channelId]    Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [policy]  Message storage policy
  /// - [messageIdentifier] Message identifier, must be unique
  /// - [fields]  Key-value pairs of message content
  /// ---
  Future<RCIMIWCustomMessage?> createCustomMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWCustomMessagePolicy policy,
    String messageIdentifier,
    Map fields,
  ) async {
    return RCIMWrapperPlatform.instance.createCustomMessage(
      type,
      targetId,
      channelId,
      policy,
      messageIdentifier,
      fields,
    );
  }

  /// [ZH]
  /// ---
  /// 构建位置消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [longitude] 经度
  /// - [latitude] 纬度
  /// - [poiName]  POI 信息
  /// - [thumbnailPath] 缩略图本地路径，必须为有效路径
  /// - [返回值] 位置消息实体
  /// ---
  /// [EN]
  /// ---
  /// Construct Location Message
  /// - [type]     Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [longitude] Longitude
  /// - [latitude] Latitude
  /// - [poiName]  POI information
  /// - [thumbnailPath] Local path of the thumbnail, must be a valid path
  /// ---
  Future<RCIMIWLocationMessage?> createLocationMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    double longitude,
    double latitude,
    String poiName,
    String thumbnailPath,
  ) async {
    return RCIMWrapperPlatform.instance.createLocationMessage(
      type,
      targetId,
      channelId,
      longitude,
      latitude,
      poiName,
      thumbnailPath,
    );
  }

  /// [ZH]
  /// ---
  /// 构建原生自定义普通消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [fields] 消息的内容键值对
  /// - [返回值] 原生自定义普通消息
  /// ---
  /// [EN]
  /// ---
  /// Build Native Custom Regular Message
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [messageIdentifier] Unique identifier for the message
  /// - [fields] Key-value pairs for the message content
  /// ---
  Future<RCIMIWNativeCustomMessage?> createNativeCustomMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String messageIdentifier,
    Map fields,
  ) async {
    return RCIMWrapperPlatform.instance.createNativeCustomMessage(type, targetId, channelId, messageIdentifier, fields);
  }

  /// [ZH]
  /// ---
  /// 构建原生自定义媒体消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [path] 媒体文件的本地路径，必须为有效路径
  /// - [fields] 消息的内容键值对
  /// - [返回值] 原生自定义媒体消息
  /// ---
  /// [EN]
  /// ---
  /// Build Native Custom Media Message
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [messageIdentifier] Unique identifier for the message
  /// - [path] Local path of the media file, must be a valid path
  /// - [fields] Key-value pairs for the message content
  /// ---
  Future<RCIMIWNativeCustomMediaMessage?> createNativeCustomMediaMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String messageIdentifier,
    String path,
    Map fields,
  ) async {
    return RCIMWrapperPlatform.instance.createNativeCustomMediaMessage(
      type,
      targetId,
      channelId,
      messageIdentifier,
      path,
      fields,
    );
  }

  /// [ZH]
  /// ---
  /// 发送普通消息
  /// - [message] 发送的消息实体
  /// - [callback] 发送消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMessageAttached],[onMessageSent]
  /// ---
  /// [EN]
  /// ---
  /// Send a Normal Message
  /// - [message] The message object to be sent.
  /// - [callback] The event callback for sending the message. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener The interface callback can listen to [onMessageAttached], [onMessageSent].
  /// ---
  Future<int> sendMessage(RCIMIWMessage message, {RCIMIWSendMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.sendMessage(message, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 发送媒体消息
  /// - [message] 发送的媒体消息实体
  /// - [listener] 发送媒体消息的事件监听
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMediaMessageSending],[onMediaMessageAttached],[onMediaMessageSent]
  /// ---
  /// [EN]
  /// ---
  /// Send Media Message
  /// - [message] The media message object to be sent
  /// - [listener] Event listener for sending media messages
  /// @listener The interface callback can listen to [onMediaMessageSending], [onMediaMessageAttached], [onMediaMessageSent]
  /// ---
  Future<int> sendMediaMessage(RCIMIWMediaMessage message, {RCIMIWSendMediaMessageListener? listener}) async {
    return RCIMWrapperPlatform.instance.sendMediaMessage(message, listener: listener);
  }

  /// [ZH]
  /// ---
  /// 取消发送媒体消息
  /// - [message] 需要取消发送的媒体消息实体
  /// - [callback] 取消发送媒体消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onSendingMediaMessageCanceled]
  /// ---
  /// [EN]
  /// ---
  /// Cancel Sending Media Message
  /// - [message] The media message entity to be canceled
  /// - [callback] The event callback for canceling the media message. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener The interface callback can be monitored via [onSendingMediaMessageCanceled]
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelSendingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelSendingMediaMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.cancelSendingMediaMessage(message, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 下载媒体消息
  /// - [message] 需要下载的媒体消息实体
  /// - [listener] 下载媒体消息的事件监听
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMediaMessageDownloaded], [onMediaMessageDownloading]
  /// ---
  /// [EN]
  /// ---
  /// Download Media Message
  /// - [message] The media message entity to be downloaded
  /// - [listener] The event listener for media message download
  /// @listener  [onMediaMessageDownloaded], [onMediaMessageDownloading]
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> downloadMediaMessage(RCIMIWMediaMessage message, {RCIMIWDownloadMediaMessageListener? listener}) async {
    return RCIMWrapperPlatform.instance.downloadMediaMessage(message, listener: listener);
  }

  /// [ZH]
  /// ---
  /// 取消下载媒体消息
  /// - [message] 需要取消下载的媒体消息实体
  /// - [callback] 取消下载媒体消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDownloadingMediaMessageCanceled]
  /// ---
  /// [EN]
  /// ---
  /// Cancel Media Message Download
  /// - [message] The media message entity for which the download needs to be canceled.
  /// - [callback] The event callback for canceling the media message download. The SDK supports callback-based notifications starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelDownloadingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelDownloadingMediaMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.cancelDownloadingMediaMessage(message, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load a Conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups; pass null for other conversation types
  /// @deprecated Use {@link #getConversation(RCIMIWConversationType, String, String, IRCIMIWGetConversationCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversation] 代替')
  Future<int> loadConversation(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadConversation(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [callback] 获取会话事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve a Conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [callback] Callback for retrieving the conversation. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onConversationLoaded]
  Future<int> getConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversation(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载某些会话
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count ≤ 50
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load specific conversations
  /// - [conversationTypes] Conversation types
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [startTime] Timestamp (in milliseconds). Retrieve conversations with timestamps earlier than this value. Pass 0 to query the latest data.
  /// - [count] Number of conversations to query, 0 < count ≤ 50
  /// @deprecated Use {@link #getConversations(List, String, long, int, IRCIMIWGetConversationsCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversations] 代替')
  Future<int> loadConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count,
  ) async {
    return RCIMWrapperPlatform.instance.loadConversations(conversationTypes, channelId, startTime, count);
  }

  /// [ZH]
  /// ---
  /// 获取某些会话
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count ≤ 50
  /// - [callback]     获取会话列表事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve Certain Conversations
  /// - [conversationTypes] Specifies the conversation types.
  /// - [channelId] Indicates the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [startTime] Represents the timestamp (in milliseconds) for retrieving conversations before this time. Pass 0 to query the latest data.
  /// - [count] Specifies the number of conversations to retrieve, where 0 < count ≤ 50.
  /// - [callback] Indicates the callback for retrieving the conversation list. The SDK supports callback-based retrieval starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onConversationsLoaded]
  Future<int> getConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversations(
      conversationTypes,
      channelId,
      startTime,
      count,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 获取某些会话，可设置是否优先置顶
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count <= 50
  /// - [topPriority]  是否优先置顶，true: 优先置顶，false: 不优先置顶
  /// - [callback]     获取会话列表事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get conversations with optional pin priority
  /// - [conversationTypes] Conversation type
  /// - [channelId]  Channel ID (ultra group only), set null for other types
  /// - [startTime]    Timestamp in ms (0 for latest data)
  /// - [count]   Number to query (0 < count ≤ 50)
  /// - [topPriority]  Pin priority: true/false
  /// - [callback]     Callback for conversation list
  /// ---
  Future<int> getConversationsWithPriority(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count,
    bool topPriority, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationsWithPriority(
      conversationTypes,
      channelId,
      startTime,
      count,
      topPriority,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 获取指定类型的含有未读消息的会话列表
  /// - [conversationTypes] 支持单聊、群聊、系统会话
  /// - [callback] 获取会话列表事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Retrieve the conversation list with unread messages of the specified type.
  /// - [conversationTypes] Supported conversation types include one-to-one chat, group chat, and system conversation.
  /// - [callback] Callback function for retrieving the conversation list.
  /// ---
  Future<int> getUnreadConversations(
    List<RCIMIWConversationType> conversationTypes, {
    IRCIMIWGetUnreadConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadConversations(conversationTypes, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 移除某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [callback] 移除会话事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Remove a Conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types
  /// - [callback] Callback for the conversation removal event. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> removeConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWRemoveConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeConversation(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 根据会话类型移除会话
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     移除会话列表事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Remove conversations based on conversation type
  /// - [conversationTypes] A collection of conversation types
  /// - [channelId]    Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [callback]     Callback for the conversation removal event. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWRemoveConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeConversations(conversationTypes, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载某个会话的未读数
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the unread count of a conversation
  /// Note: Chatrooms are not supported!
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Use {@link #getUnreadCount(RCIMIWConversationType, String, String, IRCIMIWGetUnreadCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUnreadCount] 代替')
  Future<int> loadUnreadCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUnreadCount(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取某个会话的未读数
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取会话未读数事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the unread count of a conversation
  /// Note: Not supported for chatrooms!
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [callback] Callback for retrieving the unread count of the conversation. SDK supports callback-based retrieval starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onUnreadCountLoaded]
  Future<int> getUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadCount(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载所有未读数
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTotalUnreadCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load All Unread Counts
  /// - [channelId] Indicates the channel ID. This parameter is only supported for ultra groups. For other conversation types, pass `null`.
  /// @deprecated Use {@link #getTotalUnreadCount(String, IRCIMIWGetTotalUnreadCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getTotalUnreadCount] 代替')
  Future<int> loadTotalUnreadCount(String? channelId) async {
    return RCIMWrapperPlatform.instance.loadTotalUnreadCount(channelId);
  }

  /// [ZH]
  /// ---
  /// 获取所有未读数
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取所有未读数事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get Total Unread Count
  /// - [channelId] Channel ID, supported only for ultra groups. For other conversation types, pass null.
  /// - [callback] Callback for the total unread count event. The SDK supports callback-based handling starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in the 6.x version. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onTotalUnreadCountLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  Future<int> getTotalUnreadCount(String? channelId, {IRCIMIWGetTotalUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getTotalUnreadCount(channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载会话中未读的 @ 消息数量。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the count of unread @ messages in the conversation.
  /// Note: Not supported for chatrooms!
  /// - [type] Specifies the conversation type.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getUnreadMentionedCount(RCIMIWConversationType, String, String, IRCIMIWGetUnreadMentionedCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUnreadMentionedCount] 代替')
  Future<int> loadUnreadMentionedCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUnreadMentionedCount(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取会话中未读的 @ 消息数量。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取会话中未读的 @ 消息数量事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the count of unread @ messages in a conversation.
  /// Note: This feature is not supported in chatrooms!
  /// - [type] Specifies the conversation type.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID. This is only supported for ultra groups. For other conversation types, pass `null`.
  /// - [callback] Callback triggered when the count of unread @ messages is retrieved. The SDK has supported callback mode since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// @listener [onUnreadMentionedCountLoaded]
  Future<int> getUnreadMentionedCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadMentionedCount(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载当前用户加入的所有超级群会话的未读消息数的总和。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the total count of unread messages from all ultra group conversations the current user has joined.
  /// @deprecated Use {@link #getUltraGroupAllUnreadCount(IRCIMIWGetUltraGroupAllUnreadCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupAllUnreadCount] 代替')
  Future<int> loadUltraGroupAllUnreadCount() async {
    return RCIMWrapperPlatform.instance.loadUltraGroupAllUnreadCount();
  }

  /// [ZH]
  /// ---
  /// 获取当前用户加入的所有超级群会话的未读消息数的总和。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the total count of unread messages from all ultra group conversations the current user has joined.
  /// - [callback] Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If a callback parameter is provided, only the callback will be triggered.
  /// @listener [onUltraGroupAllUnreadCountLoaded]
  Future<int> getUltraGroupAllUnreadCount({IRCIMIWGetUltraGroupAllUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getUltraGroupAllUnreadCount(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载当前用户加入的所有超级群会话中的未读 @ 消息数的总和。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadMentionedCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the total count of unread mentions in all ultra group conversations that the current user has joined.
  /// @deprecated Use {@link #getUltraGroupAllUnreadMentionedCount(IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupAllUnreadMentionedCount] 代替')
  Future<int> loadUltraGroupAllUnreadMentionedCount() async {
    return RCIMWrapperPlatform.instance.loadUltraGroupAllUnreadMentionedCount();
  }

  /// [ZH]
  /// ---
  /// 获取当前用户加入的所有超级群会话中的未读 @ 消息数的总和。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the total count of unread @ mentions across all ultra group conversations the current user has joined.
  /// - [callback] Event callback. SDK supports callback-based events starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback event will be triggered.
  /// @listener [onUltraGroupAllUnreadMentionedCountLoaded]
  Future<int> getUltraGroupAllUnreadMentionedCount({
    IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUltraGroupAllUnreadMentionedCount(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取指定会话的未读消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Get the unread message count for a specified conversation
  /// - [targetId] The conversation ID
  /// @deprecated Use {@link #getUltraGroupUnreadCount(String, IRCIMIWGetUltraGroupUnreadCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupUnreadCount] 代替')
  Future<int> loadUltraGroupUnreadCount(String targetId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupUnreadCount(targetId);
  }

  /// [ZH]
  /// ---
  /// 获取指定会话的未读消息数
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the unread message count for a specified conversation
  /// - [targetId] Conversation ID
  /// - [callback] Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onUltraGroupUnreadCountLoaded]
  Future<int> getUltraGroupUnreadCount(String targetId, {IRCIMIWGetUltraGroupUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getUltraGroupUnreadCount(targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取超级群会话中被 @ 的消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadMentionedCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Get the count of unread mentioned messages in an ultra group conversation.
  /// - [targetId] The conversation ID.
  /// @deprecated Use {@link #getUltraGroupUnreadMentionedCount(String, IRCIMIWGetUltraGroupUnreadMentionedCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupUnreadMentionedCount] 代替')
  Future<int> loadUltraGroupUnreadMentionedCount(String targetId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupUnreadMentionedCount(targetId);
  }

  /// [ZH]
  /// ---
  /// 获取超级群会话中被 @ 的消息数
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the count of mentioned messages in an ultra group conversation
  /// - [targetId] The conversation ID
  /// - [callback] The event callback. SDK supports callback-style events starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If a callback parameter is provided, only the callback will be triggered.
  /// @listener [onUltraGroupUnreadMentionedCountLoaded]
  Future<int> getUltraGroupUnreadMentionedCount(
    String targetId, {
    IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUltraGroupUnreadMentionedCount(targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 根据会话类型加载未读数
  /// 注：不支持聊天室！
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountByConversationTypesLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load Unread Count by Conversation Type
  /// Note: Not supported for chatrooms!
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId] Indicates the channel ID. This parameter is only supported for ultra groups. For other conversation types, pass `null`.
  /// - [contain] Indicates whether to include unread messages from muted conversations.
  /// @deprecated Use {@link #getUnreadCountByConversationTypes(List, String, boolean, IRCIMIWGetUnreadCountByConversationTypesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getUnreadCountByConversationTypes] 代替')
  Future<int> loadUnreadCountByConversationTypes(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    bool contain,
  ) async {
    return RCIMWrapperPlatform.instance.loadUnreadCountByConversationTypes(conversationTypes, channelId, contain);
  }

  /// [ZH]
  /// ---
  /// 根据会话类型加载未读数
  /// 注：不支持聊天室！
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [callback]     事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Load unread count based on conversation type
  /// Note: Chatrooms are not supported!
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [contain] Indicates whether to include unread messages from muted conversations.
  /// - [callback] Specifies the event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onUnreadCountByConversationTypesLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  Future<int> getUnreadCountByConversationTypes(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    bool contain, {
    IRCIMIWGetUnreadCountByConversationTypesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadCountByConversationTypes(
      conversationTypes,
      channelId,
      contain,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 根据会话的免打扰级别加载未读数
  /// - [conversationTypes] 会话类型列表
  /// - [levels] 免打扰级别列表
  /// - [callback] 获取会话未读消息数回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果通过接口 callback 回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Load unread count by conversation's DND level
  /// - [conversationTypes] List of conversation types
  /// - [levels] List of DND levels
  /// - [callback] Callback for unread message count
  /// ---
  Future<int> getUnreadCountByLevels(
    List<RCIMIWConversationType> conversationTypes,
    List<RCIMIWPushNotificationLevel> levels, {
    IRCIMIWGetUnreadCountByLevelsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadCountByLevels(conversationTypes, levels, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 清除某个会话中的未读消息数。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话已阅读的最后一条消息的发送时间戳，清除所有传入当前最新时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountCleared]
  /// ---
  /// [EN]
  /// ---
  /// Clear the unread message count for a specific conversation.
  /// Note: Not supported for chatrooms!
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [timestamp] The timestamp of the last read message in the conversation. Pass the latest timestamp to clear all.
  /// - [callback] Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in the 6.x version. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> clearUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWClearUnreadCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearUnreadCount(type, targetId, channelId, timestamp, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 保存会话草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿的文字内容。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageSaved]
  /// ---
  /// [EN]
  /// ---
  /// Save conversation draft information.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [draft] The text content of the draft.
  /// - [callback] Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> saveDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String draft, {
    IRCIMIWSaveDraftMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.saveDraftMessage(type, targetId, channelId, draft, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Loads the draft message in the conversation.
  /// - [type] The type of the conversation.
  /// - [targetId] The ID of the conversation.
  /// - [channelId] The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getDraftMessage(RCIMIWConversationType, String, String, IRCIMIWGetDraftMessageCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getDraftMessage] 代替')
  Future<int> loadDraftMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadDraftMessage(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve draft information from a conversation.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, supported only for ultra groups. Pass null for other conversation types.
  /// - [callback] Event callback. The SDK supports callback-based event handling starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onDraftMessageLoaded]
  Future<int> getDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetDraftMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getDraftMessage(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除指定会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageCleared]
  /// ---
  /// [EN]
  /// ---
  /// Deletes draft information from the specified conversation.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [callback] Event callback. SDK supports callback mode from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onDraftMessageCleared]
  /// ---
  Future<int> clearDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWClearDraftMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearDraftMessage(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载免打扰的会话列表。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlockedConversationsLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the list of conversations with Do Not Disturb enabled.
  /// - [conversationTypes] Collection of conversation types
  /// - [channelId] Channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// @deprecated Use {@link #getBlockedConversations(List, String, IRCIMIWGetBlockedConversationsCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  @Deprecated('请使用 [getBlockedConversations] 代替')
  Future<int> loadBlockedConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadBlockedConversations(conversationTypes, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取免打扰的会话列表。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the list of conversations with Do Not Disturb enabled.
  /// - [conversationTypes] A collection of conversation types.
  /// - [channelId]    The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [callback]     The event callback. The SDK has supported callback-based responses since version 5.3.1. Other callback methods for this interface have been deprecated since version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBlockedConversationsLoaded]
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  Future<int> getBlockedConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetBlockedConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getBlockedConversations(conversationTypes, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置会话的置顶状态。若会话不存在，调用此方法 SDK 自动创建会话并置顶。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusChanged]
  /// ---
  /// [EN]
  /// ---
  /// Sets the pinned status of a conversation. If the conversation does not exist, calling this method will automatically create and pin the conversation.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [top]  Indicates whether to pin the conversation.
  /// - [callback] Specifies the event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口在 Flutter For Web 端不支持超级群
  Future<int> changeConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    bool top, {
    IRCIMIWChangeConversationTopStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeConversationTopStatus(type, targetId, channelId, top, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置会话的置顶状态。若会话不存在，调用此方法 SDK 自动创建会话并置顶。
  /// - [type] conversation type
  /// - [targetId] conversation ID
  /// - [channelId] 频道 ID，仅支持ultra group使用，其他conversation type传 null 即可。
  /// - [top]  是否置顶
  /// - [updateOperationTime] 是否更新操作事件，默认不更新，如果需要更新请传 true
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusChanged]
  /// ---
  /// [EN]
  /// ---
  /// Pin or unpin a conversation. SDK auto-creates missing conversations.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID (ultra group only, set null for others)
  /// - [top] Pin status
  /// - [updateOperationTime] Update operation timestamp (default: false)
  /// - [callback] Event callback (supported since v5.3.1). Other callback methods deprecated in v5.4.0 and will be removed in v6.x. Callback param overrides all other callbacks.
  /// @listener [onConversationTopStatusChanged]
  /// ---
  Future<int> changeConversationTopStatusWithUpdateTme(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    bool top,
    bool updateOperationTime, {
    IRCIMIWChangeConversationTopStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeConversationTopStatusWithUpdateTme(
      type,
      targetId,
      channelId,
      top,
      updateOperationTime,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 加载会话的置顶状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the pinned status of a conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getConversationTopStatus(RCIMIWConversationType, String, String, IRCIMIWGetConversationTopStatusCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口在 Flutter For Web 端不支持超级群
  @Deprecated('请使用 [getConversationTopStatus] 代替')
  Future<int> loadConversationTopStatus(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadConversationTopStatus(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取会话的置顶状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the pinned status of a conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [callback] Event callback. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onConversationTopStatusLoaded]
  /// 此接口在 Flutter For Web 端不支持超级群
  Future<int> getConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationTopStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationTopStatus(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 同步会话阅读状态。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationReadStatusSynced]
  /// ---
  /// [EN]
  /// ---
  /// Synchronize conversation read status.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [timestamp] Timestamp of the last read message in the conversation
  /// - [callback] Event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> syncConversationReadStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSyncConversationReadStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.syncConversationReadStatus(
      type,
      targetId,
      channelId,
      timestamp,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 向会话中发送正在输入的状态，目前只支持单聊。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [currentType] 当前的状态
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Send a typing status to the conversation. Currently, this feature is only supported in one-to-one chats.
  /// - [type]   Specifies the conversation type
  /// - [targetId] Specifies the conversation ID
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [currentType] Specifies the current status
  /// ---
  Future<int> sendTypingStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String currentType,
  ) async {
    return RCIMWrapperPlatform.instance.sendTypingStatus(type, targetId, channelId, currentType);
  }

  /// [ZH]
  /// ---
  /// 加载历史消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [policy] 消息的加载策略。LOCAL：只加载本地，REMOTE：只加载远端，LOCAL_REMOTE：本地远端都加载
  /// - [count] 获取的消息数量，0 < count ≤ 20
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load Historical Messages
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, supported only for ultra groups. Pass `null` for other conversation types.
  /// - [sentTime] Timestamp of the current message
  /// - [order] Direction of message retrieval. `BEFORE`: Retrieve messages before `sentTime` (in descending order). `AFTER`: Retrieve messages after `sentTime` (in ascending order).
  /// - [policy] Message loading policy. `LOCAL`: Load only local messages. `REMOTE`: Load only remote messages. `LOCAL_REMOTE`: Load both local and remote messages.
  /// - [count] Number of messages to retrieve. Must satisfy `0 < count ≤ 20`.
  /// @deprecated Use {@link #getMessages(RCIMIWConversationType, String, String, long, RCIMIWTimeOrder, RCIMIWMessageOperationPolicy, int, IRCIMIWGetMessagesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getMessages] 代替')
  Future<int> loadMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int sentTime,
    RCIMIWTimeOrder order,
    RCIMIWMessageOperationPolicy policy,
    int count,
  ) async {
    return RCIMWrapperPlatform.instance.loadMessages(type, targetId, channelId, sentTime, order, policy, count);
  }

  /// [ZH]
  /// ---
  /// 加载历史消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [policy] 消息的加载策略。LOCAL：只加载本地，REMOTE：只加载远端，LOCAL_REMOTE：本地远端都加载
  /// - [count] 获取的消息数量，0 < count ≤ 20
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Load Historical Messages
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [sentTime] Timestamp of the current message
  /// - [order] Direction to fetch messages. BEFORE: Fetch messages before sentTime (in descending order). AFTER: Fetch messages after sentTime (in ascending order).
  /// - [policy] Message loading strategy. LOCAL: Load only local messages. REMOTE: Load only remote messages. LOCAL_REMOTE: Load both local and remote messages.
  /// - [count] Number of messages to fetch, where 0 < count ≤ 20
  /// - [callback] Event callback. SDK supports callback starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onMessagesLoaded]
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
    return RCIMWrapperPlatform.instance.getMessages(
      type,
      targetId,
      channelId,
      sentTime,
      order,
      policy,
      count,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 根据消息 id 获取消息体（本地数据库索引唯一值）。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Retrieve the message body based on the message ID (unique value in the local database index).
  /// - [messageId] The messageId of the message, which can be obtained from the message object.
  /// - [callback] The event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageById(int messageId, {IRCIMIWGetMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getMessageById(messageId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 通过全局唯一 id 获取消息实体。
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Retrieve the message entity by its globally unique ID.
  /// - [messageUId] The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// - [callback] The event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageByUId(String messageUId, {IRCIMIWGetMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getMessageByUId(messageUId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 在会话中获取指定消息的前后指定数量的消息。返回的消息列表中会包含指定的消息。消息列表时间顺序从新到旧。
  /// - [type] 会话类型。
  /// - [targetId] 会话 ID。
  /// - [channelId] 消息所属会话的业务标识。
  /// - [sentTime] 指定消息的发送时间，不能为 0。单位：毫秒。
  /// - [beforeCount] 指定消息的前部分消息数量。
  /// - [afterCount] 指定消息的后部分消息数量。
  /// - [callback] 获取结果回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果通过接口 callback 回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get messages around a specified one in conversation. The returned list includes the target message, sorted from newest to oldest.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Business identifier for the conversation
  /// - [sentTime] Target message's timestamp (in milliseconds), can't be 0
  /// - [beforeCount] Number of messages before the target
  /// - [afterCount] Number of messages after the target
  /// - [callback] Result callback
  /// ---
  Future<int> getMessagesAroundTime(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int sentTime,
    int beforeCount,
    int afterCount, {
    IRCIMIWGetMessagesAroundTimeCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getMessagesAroundTime(
      type,
      targetId,
      channelId,
      sentTime,
      beforeCount,
      afterCount,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 获取会话中指定类型的消息。
  /// - [type] 会话类型。
  /// - [targetId] 会话 ID。
  /// - [channelId] 消息所属会话的业务标识。
  /// - [messageTypes] 消息类型列表。
  /// - [sentTime] 消息发送时间戳，0 表示最新的消息
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [count] 获取的消息数量
  /// - [callback] 获取结果回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果通过接口 callback 回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Fetch messages of specified types in conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Business identifier for the conversation
  /// - [messageTypes] List of message types
  /// - [sentTime] Message timestamp (0 for latest)
  /// - [order] Fetch direction: BEFORE for messages prior to sentTime (descending), AFTER for messages after sentTime (ascending)
  /// - [count] Number of messages to fetch
  /// - [callback] Result callback
  /// ---
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
    return RCIMWrapperPlatform.instance.getLocalMessagesByMessageTypes(
      type,
      targetId,
      channelId,
      messageTypes,
      sentTime,
      order,
      count,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 加载第一条未读消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onFirstUnreadMessageLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the first unread message.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Use {@link #getFirstUnreadMessage(RCIMIWConversationType, String, String, IRCIMIWGetFirstUnreadMessageCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getFirstUnreadMessage] 代替')
  Future<int> loadFirstUnreadMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadFirstUnreadMessage(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取第一条未读消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the first unread message.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [callback] Event callback. The SDK has supported callback-based responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onFirstUnreadMessageLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getFirstUnreadMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetFirstUnreadMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getFirstUnreadMessage(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载会话中未读的 @ 消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedMessagesLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load unread @ messages in the conversation.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// @deprecated Use {@link #getUnreadMentionedMessages(RCIMIWConversationType, String, String, IRCIMIWGetUnreadMentionedMessagesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getUnreadMentionedMessages] 代替')
  Future<int> loadUnreadMentionedMessages(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUnreadMentionedMessages(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取会话中未读的 @ 消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Fetch unread @ messages in a conversation.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [callback] Event callback. SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onUnreadMentionedMessagesLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getUnreadMentionedMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadMentionedMessages(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 插入一条消息
  /// - [message] 插入的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageInserted]
  /// ---
  /// [EN]
  /// ---
  /// Insert a Message
  /// - [message] The message to be inserted.
  /// - [callback] Event callback. The SDK has supported callback-based event handling since version 5.3.1. Other callback methods for this interface have been deprecated since version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessage(RCIMIWMessage message, {IRCIMIWInsertMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.insertMessage(message, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 插入多条消息，不支持超级群
  /// - [messages] 插入的消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesInserted]
  /// ---
  /// [EN]
  /// ---
  /// Insert multiple messages. Ultra groups are not supported.
  /// - [messages] The collection of messages to be inserted.
  /// - [callback] The event callback. Starting from version 5.3.1, the SDK supports callback for event handling. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessages(List<RCIMIWMessage> messages, {IRCIMIWInsertMessagesCallback? callback}) async {
    return RCIMWrapperPlatform.instance.insertMessages(messages, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 清除消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 清除消息截止时间戳，0 ≤ timestamp ≤ 当前会话最后一条消息的 sentTime, 0 清除所有消息，其他值清除小于等于 timestamp 的消息
  /// - [policy] 清除的策略
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesCleared]
  /// ---
  /// [EN]
  /// ---
  /// Clear Messages
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [timestamp] Timestamp for clearing messages up to a certain time. 0 ≤ timestamp ≤ sentTime of the last message in the current conversation. 0 clears all messages, other values clear messages with sentTime ≤ timestamp.
  /// - [policy] Clearing policy
  /// - [callback] Event callback. SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> clearMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy, {
    IRCIMIWClearMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearMessages(type, targetId, channelId, timestamp, policy, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除本地消息
  /// - [messages] 消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onLocalMessagesDeleted]
  /// ---
  /// [EN]
  /// ---
  /// Delete Local Messages
  /// - [messages] The collection of messages to be deleted.
  /// - [callback] The event callback. Starting from version 5.3.1, the SDK supports callback-based event handling. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in the 6.x release. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> deleteLocalMessages(List<RCIMIWMessage> messages, {IRCIMIWDeleteLocalMessagesCallback? callback}) async {
    return RCIMWrapperPlatform.instance.deleteLocalMessages(messages, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 根据 messageId 批量删除本地消息
  /// - [messageIds] 消息的 messageId 集合
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Delete local messages in batch by messageId
  /// - [messageIds] Set of message IDs
  /// - [callback] Event callback
  /// ---
  Future<int> deleteLocalMessageByIds(List<int> messageIds, {IRCIMIWDeleteLocalMessageByIdsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.deleteLocalMessageByIds(messageIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesDeleted]
  /// ---
  /// [EN]
  /// ---
  /// Delete Messages
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [messages] Message collection
  /// - [callback] Event callback. SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> deleteMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWDeleteMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.deleteMessages(type, targetId, channelId, messages, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 撤回消息
  /// - [message] 需要被撤回的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageRecalled]
  /// ---
  /// [EN]
  /// ---
  /// Recall Message
  /// - [message] The message to be recalled.
  /// - [callback] Event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface have been deprecated since version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> recallMessage(RCIMIWMessage message, {IRCIMIWRecallMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.recallMessage(message, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 发送某个会话中的消息阅读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPrivateReadReceiptMessageSent]
  /// ---
  /// [EN]
  /// ---
  /// Send a read receipt for messages in a specific conversation.
  /// - [targetId] The conversation ID.
  /// - [channelId] The channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// - [timestamp] The timestamp of the last read message in the conversation.
  /// - [callback] The event callback. SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> sendPrivateReadReceiptMessage(
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSendPrivateReadReceiptMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendPrivateReadReceiptMessage(
      targetId,
      channelId,
      timestamp,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 发起群聊消息已读回执请求
  /// - [message] 需要请求已读回执的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptRequestSent]
  /// ---
  /// [EN]
  /// ---
  /// Send Group Message Read Receipt Request
  /// - [message] The message for which the read receipt is requested.
  /// - [callback] Event callback. Starting from SDK version 5.3.1, callback mode is supported. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendGroupReadReceiptRequest(
    RCIMIWMessage message, {
    IRCIMIWSendGroupReadReceiptRequestCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendGroupReadReceiptRequest(message, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 发送群聊已读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 会话中需要发送已读回执的消息列表
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptResponseSent]
  /// ---
  /// [EN]
  /// ---
  /// Send Group Read Receipt
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [messages] List of messages in the conversation for which read receipts need to be sent
  /// - [callback] Event callback. SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendGroupReadReceiptResponse(
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWSendGroupReadReceiptResponseCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendGroupReadReceiptResponse(targetId, channelId, messages, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 更新消息扩展信息
  /// 每条消息携带扩展信息键值对最大值 300个，单次设置扩展信息键值对最大值 20个
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionUpdated]
  /// ---
  /// [EN]
  /// ---
  /// Update Message Extension Information
  /// Each message can carry a maximum of 300 key-value pairs of extension information, and a single update can set a maximum of 20 key-value pairs.
  /// - [messageUId] The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// - [expansion] The key-value pairs of message extension information to be updated, of type HashMap. The Key supports a combination of uppercase and lowercase English letters, numbers, and some special symbols + = - _. Chinese characters are not supported. The Value can include spaces.
  /// - [callback] The event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> updateMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateMessageExpansionCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateMessageExpansion(messageUId, expansion, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionForKeysRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Delete specific key-value pairs from message extension information
  /// - [messageUId] The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// - [keys] The list of keys to be deleted from the message extension information. The type is ArrayList.
  /// - [callback] Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> removeMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveMessageExpansionForKeysCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeMessageExpansionForKeys(messageUId, keys, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置消息发送状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [sentStatus] 要修改的状态
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageSentStatusChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set the message sending status.
  /// - [messageId] The messageId of the message, which can be obtained from the message object.
  /// - [sentStatus] The status to be modified.
  /// - [callback] Event callback. The SDK supports callback-based notification starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageSentStatus(
    int messageId,
    RCIMIWSentStatus sentStatus, {
    IRCIMIWChangeMessageSentStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeMessageSentStatus(messageId, sentStatus, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置消息接收状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [receivedStatus] 要修改的状态
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageReceiveStatusChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set the message received status.
  /// - [messageId] The messageId of the message, which can be obtained from the message object.
  /// - [receivedStatus] The status to be modified.
  /// - [callback]  Event callback. The SDK has supported callback-style responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageReceiveStatus(
    int messageId,
    RCIMIWReceivedStatus receivedStatus, {
    IRCIMIWChangeMessageReceivedStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeMessageReceiveStatus(messageId, receivedStatus, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置消息接收状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [receivedStatusInfo] 要修改的状态
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageReceiveStatusChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set message received status
  /// - [messageId] Message ID from Message Object
  /// - [receivedStatusInfo] Status to modify
  /// - [callback]  Event callback. Supported since SDK 5.3.1. Other callback methods deprecated in 5.4.0 and will be removed in 6.x. If callback is provided, only triggers callback response.
  /// ---
  Future<int> changeMessageReceiveStatusInfo(
    int messageId,
    RCIMIWReceivedStatusInfo receivedStatusInfo, {
    IRCIMIWChangeMessageReceivedStatusInfoCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeMessageReceiveStatusInfo(
      messageId,
      receivedStatusInfo,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 设置消息的附加信息，只能用于本地使用，无法同步到远端。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [extra] 附加信息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Set message extras for local use only (won't sync to server)
  /// - [messageId] Message ID from Message Object
  /// - [extra] Additional data
  /// - [callback] Event callback
  /// ---
  Future<int> updateMessageLocalExtra(
    int messageId,
    String extra, {
    IRCIMIWUpdateMessageLocalExtraCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateMessageLocalExtra(messageId, extra, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加入聊天室。
  /// - [targetId] 聊天室会话 ID
  /// - [messageCount] 进入聊天室拉取消息数目，-1 时不拉取任何消息，0 时拉取 10 条消息，最多只能拉取 50
  /// - [autoCreate] 是否创建聊天室，TRUE 如果聊天室不存在，sdk 会创建聊天室并加入，如果已存在，则直接加入
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomJoined]
  /// ---
  /// [EN]
  /// ---
  /// Join a chatroom.
  /// - [targetId] The chatroom conversation ID
  /// - [messageCount] The number of messages to fetch upon entering the chatroom. -1 means no messages will be fetched, 0 means fetching 10 messages, with a maximum of 50 messages allowed.
  /// - [autoCreate] Whether to create the chatroom. If TRUE and the chatroom does not exist, the SDK will create the chatroom and join it. If the chatroom already exists, the SDK will directly join it.
  /// - [callback] Event callback. The SDK supports callback-based events starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> joinChatRoom(
    String targetId,
    int messageCount,
    bool autoCreate, {
    IRCIMIWJoinChatRoomCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.joinChatRoom(targetId, messageCount, autoCreate, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 退出聊天室。
  /// - [targetId] 聊天室会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomLeft]
  /// ---
  /// [EN]
  /// ---
  /// Exit the chatroom.
  /// - [targetId] The conversation ID of the chatroom.
  /// - [callback] The event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> leaveChatRoom(String targetId, {IRCIMIWLeaveChatRoomCallback? callback}) async {
    return RCIMWrapperPlatform.instance.leaveChatRoom(targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载聊天室历史消息记录。
  /// 注：必须先开通聊天室消息云存储功能。
  /// - [targetId] 聊天室会话 ID
  /// - [timestamp] 起始的消息发送时间戳
  /// - [order] 拉取顺序 0:倒序，1:正序
  /// - [count] 要获取的消息数量，0 < count ≤ 50。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomMessagesLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load chatroom historical messages.
  /// Note: The chatroom message cloud storage feature must be enabled first.
  /// - [targetId] The conversation ID of the chatroom
  /// - [timestamp] The timestamp of the starting message
  /// - [order] The order of fetching messages: 0 for descending, 1 for ascending
  /// - [count] The number of messages to fetch, where 0 < count ≤ 50
  /// @deprecated Use {@link #getChatRoomMessages(String, long, RCIMIWTimeOrder, int, IRCIMIWGetChatRoomMessagesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getChatRoomMessages] 代替')
  Future<int> loadChatRoomMessages(String targetId, int timestamp, RCIMIWTimeOrder order, int count) async {
    return RCIMWrapperPlatform.instance.loadChatRoomMessages(targetId, timestamp, order, count);
  }

  /// [ZH]
  /// ---
  /// 获取聊天室历史消息记录。
  /// 注：必须先开通聊天室消息云存储功能。
  /// - [targetId] 聊天室会话 ID
  /// - [timestamp] 起始的消息发送时间戳
  /// - [order] 拉取顺序 0:倒序，1:正序
  /// - [count] 要获取的消息数量，0 < count ≤ 50。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve chatroom historical messages.
  /// Note: The chatroom message cloud storage feature must be enabled first.
  /// - [targetId] The chatroom conversation ID
  /// - [timestamp] The starting message timestamp
  /// - [order] The order of retrieval: 0 for descending, 1 for ascending
  /// - [count] The number of messages to retrieve, where 0 < count ≤ 50
  /// - [callback] The event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onChatRoomMessagesLoaded]
  Future<int> getChatRoomMessages(
    String targetId,
    int timestamp,
    RCIMIWTimeOrder order,
    int count, {
    IRCIMIWGetChatRoomMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getChatRoomMessages(targetId, timestamp, order, count, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置聊天室自定义属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key]  聊天室属性名称，Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，最大长度 128 个字符
  /// - [value]     聊天室属性对应的值，最大长度 4096 个字符
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 如果当前 key 存在，是否进行覆盖
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryAdded]
  /// ---
  /// [EN]
  /// ---
  /// Set chatroom custom attributes.
  /// - [targetId]  The conversation ID of the chatroom.
  /// - [key]  The name of the chatroom attribute. The key supports a combination of uppercase and lowercase letters, numbers, and special characters + = - _. The maximum length is 128 characters.
  /// - [value]     The value corresponding to the chatroom attribute. The maximum length is 4096 characters.
  /// - [deleteWhenLeft] Whether to automatically delete the key-value pair when the user goes offline or exits the chatroom.
  /// - [overwrite] Whether to overwrite the existing key if it already exists.
  /// - [callback]  The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> addChatRoomEntry(
    String targetId,
    String key,
    String value,
    bool deleteWhenLeft,
    bool overwrite, {
    IRCIMIWAddChatRoomEntryCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.addChatRoomEntry(
      targetId,
      key,
      value,
      deleteWhenLeft,
      overwrite,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 批量设置聊天室自定义属性
  /// - [targetId] 聊天室会话 ID
  /// - [entries]   聊天室属性
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 是否强制覆盖
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesAdded]
  /// ---
  /// [EN]
  /// ---
  /// Batch Set Chatroom Custom Attributes
  /// - [targetId]  Chatroom conversation ID
  /// - [entries]   Chatroom attributes
  /// - [deleteWhenLeft] Whether to automatically delete the Key and Value when the user goes offline or exits
  /// - [overwrite] Whether to force overwrite
  /// - [callback]  Event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> addChatRoomEntries(
    String targetId,
    Map entries,
    bool deleteWhenLeft,
    bool overwrite, {
    IRCIMIWAddChatRoomEntriesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.addChatRoomEntries(
      targetId,
      entries,
      deleteWhenLeft,
      overwrite,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 加载聊天室单个属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load a single chatroom attribute.
  /// - [targetId] The conversation ID of the chatroom
  /// - [key] The key of the chatroom attribute
  /// @deprecated Use {@link #getChatRoomEntry(String, String, IRCIMIWGetChatRoomEntryCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getChatRoomEntry] 代替')
  Future<int> loadChatRoomEntry(String targetId, String key) async {
    return RCIMWrapperPlatform.instance.loadChatRoomEntry(targetId, key);
  }

  /// [ZH]
  /// ---
  /// 获取聊天室单个属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve a single chatroom attribute.
  /// - [targetId] The conversation ID of the chatroom
  /// - [key] The key of the chatroom attribute
  /// - [callback] The event callback. SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onChatRoomEntryLoaded]
  Future<int> getChatRoomEntry(String targetId, String key, {IRCIMIWGetChatRoomEntryCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getChatRoomEntry(targetId, key, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载聊天室所有属性。
  /// - [targetId] 聊天室会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomAllEntriesLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load all chatroom attributes.
  /// - [targetId] The conversation ID of the chatroom
  /// @deprecated Use {@link #getChatRoomAllEntries(String, IRCIMIWGetChatRoomAllEntriesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getChatRoomAllEntries] 代替')
  Future<int> loadChatRoomAllEntries(String targetId) async {
    return RCIMWrapperPlatform.instance.loadChatRoomAllEntries(targetId);
  }

  /// [ZH]
  /// ---
  /// 获取聊天室所有属性。
  /// - [targetId] 聊天室会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve all attributes of a chatroom.
  /// - [targetId] The conversation ID of the chatroom.
  /// - [callback] The event callback. Starting from SDK version 5.3.1, the callback method is supported. From version 5.4.0, other callback methods for this interface are deprecated and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onChatRoomAllEntriesLoaded]
  Future<int> getChatRoomAllEntries(String targetId, {IRCIMIWGetChatRoomAllEntriesCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getChatRoomAllEntries(targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除聊天室自定义属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [force] 是否强制删除
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Remove chatroom custom attributes.
  /// - [targetId] The chatroom conversation ID
  /// - [key] The chatroom attribute key
  /// - [force] Whether to force deletion
  /// - [callback] The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> removeChatRoomEntry(
    String targetId,
    String key,
    bool force, {
    IRCIMIWRemoveChatRoomEntryCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeChatRoomEntry(targetId, key, force, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 批量删除聊天室自定义属性
  /// - [targetId] 聊天室会话 ID
  /// - [keys] 聊天室属性
  /// - [force] 是否强制覆盖
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Batch Delete Chatroom Custom Attributes
  /// - [targetId] The chatroom conversation ID
  /// - [keys] The chatroom attributes
  /// - [force] Specifies whether to force overwrite
  /// - [callback] The event callback. SDK supports callback mode from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> removeChatRoomEntries(
    String targetId,
    List<String> keys,
    bool force, {
    IRCIMIWRemoveChatRoomEntriesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeChatRoomEntries(targetId, keys, force, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 将某个用户加入黑名单。
  /// 当你把对方加入黑名单后，对方再发消息时，就会提示“已被加入黑名单，消息发送失败”。 但你依然可以发消息个对方。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistAdded]
  /// ---
  /// [EN]
  /// ---
  /// Add a user to the blocklist.
  /// When you add a user to the blocklist, they will receive a notification stating "You have been added to the blocklist, message sending failed" when attempting to send you a message. However, you can still send messages to them.
  /// - [userId] User ID
  /// - [callback] Event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> addToBlacklist(String userId, {IRCIMIWAddToBlacklistCallback? callback}) async {
    return RCIMWrapperPlatform.instance.addToBlacklist(userId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 将某个用户从黑名单中移出。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Remove a user from the blocklist.
  /// - [userId] User ID
  /// - [callback] Event callback. The SDK supports callback-based event handling starting from version 5.3.1. Other callback methods for this interface have been deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If a callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeFromBlacklist(String userId, {IRCIMIWRemoveFromBlacklistCallback? callback}) async {
    return RCIMWrapperPlatform.instance.removeFromBlacklist(userId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取某用户是否在黑名单中。
  /// - [userId] 用户 Id
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistStatusLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Check if a user is in the blocklist.
  /// - [userId] The user ID
  /// @deprecated Use {@link #getBlacklistStatus(String, IRCIMIWGetBlacklistStatusCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getBlacklistStatus] 代替')
  Future<int> loadBlacklistStatus(String userId) async {
    return RCIMWrapperPlatform.instance.loadBlacklistStatus(userId);
  }

  /// [ZH]
  /// ---
  /// 获取某用户是否在黑名单中。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Check if a user is in the blocklist.
  /// - [userId] User ID
  /// - [callback] Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBlacklistStatusLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklistStatus(String userId, {IRCIMIWGetBlacklistStatusCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getBlacklistStatus(userId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载当前用户设置的黑名单列表。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Loads the blocklist of the current user.
  /// @deprecated Use {@link #getBlacklist(IRCIMIWGetBlacklistCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getBlacklist] 代替')
  Future<int> loadBlacklist() async {
    return RCIMWrapperPlatform.instance.loadBlacklist();
  }

  /// [ZH]
  /// ---
  /// 获取当前用户设置的黑名单列表。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the current user's blocklist.
  /// - [callback] Event callback. The SDK has supported callback-style responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBlacklistLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklist({IRCIMIWGetBlacklistCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getBlacklist(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 根据关键字搜索指定会话中的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 查询 beginTime 之前的消息， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 查询的数量，0 < count ≤ 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearched]
  /// ---
  /// [EN]
  /// ---
  /// Search for messages in a specified conversation based on keywords.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [keyword] Keyword to search for
  /// - [startTime] Search for messages before this timestamp. Pass 0 to start searching from the latest message and move backward in time.
  /// - [count] Number of messages to query, where 0 < count ≤ 50.
  /// - [callback] Event callback. The SDK has supported callback-based responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String keyword,
    int startTime,
    int count, {
    IRCIMIWSearchMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchMessages(
      type,
      targetId,
      channelId,
      keyword,
      startTime,
      count,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 根据关键字搜索指定会话中某个时间段的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 开始时间
  /// - [endTime] 结束时间
  /// - [offset] 偏移量
  /// - [count] 返回的搜索结果数量，0 < count ≤ 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByTimeRange]
  /// ---
  /// [EN]
  /// ---
  /// Search for messages within a specified time range in a conversation based on a keyword.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [keyword] Keyword to search for
  /// - [startTime] Start time
  /// - [endTime] End time
  /// - [offset] Offset
  /// - [count] Number of search results to return, where 0 < count ≤ 50.
  /// - [callback] Event callback. The SDK supports callback-style event handling starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
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
    return RCIMWrapperPlatform.instance.searchMessagesByTimeRange(
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
  }

  /// [ZH]
  /// ---
  /// 根据用户 id 搜索指定会话中的消息。
  /// - [userId] 用户 id
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [startTime] 查询记录的起始时间， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 返回的搜索结果数量 0 < count ≤ 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByUserId]
  /// ---
  /// [EN]
  /// ---
  /// Search for messages in a specified conversation based on user ID.
  /// - [userId] User ID
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// - [startTime] Start time for the query. Pass `0` to start searching from the latest message and search backward from that time.
  /// - [count] Number of search results to return. Must be in the range 0 < count ≤ 50.
  /// - [callback] Event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchMessagesByUserId(
    String userId,
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int startTime,
    int count, {
    IRCIMIWSearchMessagesByUserIdCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchMessagesByUserId(
      userId,
      type,
      targetId,
      channelId,
      startTime,
      count,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 根据关键字搜索指定会话中，指定消息类型的本地历史消息。
  /// - [type] 会话类型。
  /// - [targetId] 会话 ID。
  /// - [channelId] 消息所属的会话标识。
  /// - [messageTypes] 消息类型集合。
  /// - [keyword] 搜索的关键字，非空。
  /// - [startTime] 查询 startTime 之前的消息（传 0 表示从最新消息开始搜索），单位：毫秒
  /// - [count] 最大的查询数量，最大 100。
  /// - [callback] 搜索结果的回调接口
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果通过接口 callback 回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Search local message history by keyword in specified conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel identifier for messages
  /// - [messageTypes] Set of message types
  /// - [keyword] Search keyword (required)
  /// - [startTime] Search messages before this timestamp (0 means start from latest) in milliseconds
  /// - [count] Max results (up to 100)
  /// - [callback] Callback for search results
  /// ---
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
    return RCIMWrapperPlatform.instance.searchMessagesByMessageTypes(
      type,
      targetId,
      channelId,
      messageTypes,
      keyword,
      startTime,
      count,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 根据关键字搜索会话。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageTypes] 搜索的消息类型
  /// - [keyword]      搜索的关键字。
  /// - [callback]     事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsSearched]
  /// ---
  /// [EN]
  /// ---
  /// Search conversations by keyword.
  /// - [conversationTypes] Collection of conversation types
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [messageTypes] Message types to search for
  /// - [keyword] Keyword to search for
  /// - [callback] Event callback. SDK supports callback mode from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    List<RCIMIWMessageType> messageTypes,
    String keyword, {
    IRCIMIWSearchConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchConversations(
      conversationTypes,
      channelId,
      messageTypes,
      keyword,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 屏蔽某个时间段的消息提醒
  /// - [startTime] 开始消息免打扰时间，格式为 HH:MM:SS
  /// - [spanMinutes] 需要消息免打扰分钟数，0 < spanMinutes < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为 01:00，则 spanMinutes 为 60 分钟。设置为 1439 代表全天免打扰 （23 60 + 59 = 1439 ））
  /// - [level]  消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursChanged]
  /// ---
  /// [EN]
  /// ---
  /// ### Mute Message Notifications for a Specific Time Period
  /// - [startTime]
  /// Specifies the start time for muting message notifications, in the format `HH:MM:SS`.
  /// - [spanMinutes]
  /// The duration in minutes for muting message notifications, where `0 < spanMinutes < 1440`.
  /// For example, if the start time is `00:00` and the end time is `01:00`, then `spanMinutes` would be `60`. Setting it to `1439` represents a full day of muting (`23 60 + 59 = 1439`).
  /// - [level]
  /// The notification level for messages.
  /// - [callback]
  /// The event callback. Starting from SDK version 5.3.1, the callback method is supported. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// The status code for the current operation. `0` indicates a successful call, and the specific result requires implementing the callback interface. Non-zero values indicate that the current operation failed, and the callback will not be triggered. Refer to the error codes for detailed error information.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeNotificationQuietHours(
    String startTime,
    int spanMinutes,
    RCIMIWPushNotificationQuietHoursLevel level, {
    IRCIMIWChangeNotificationQuietHoursCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeNotificationQuietHours(startTime, spanMinutes, level, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除已设置的全局时间段消息提醒屏蔽
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Remove the globally set time period message reminder mute
  /// - [callback] Event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeNotificationQuietHours({IRCIMIWRemoveNotificationQuietHoursCallback? callback}) async {
    return RCIMWrapperPlatform.instance.removeNotificationQuietHours(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载已设置的时间段消息提醒屏蔽
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the set notification quiet hours
  /// @deprecated Use {@link #getNotificationQuietHours(IRCIMIWGetNotificationQuietHoursCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getNotificationQuietHours] 代替')
  Future<int> loadNotificationQuietHours() async {
    return RCIMWrapperPlatform.instance.loadNotificationQuietHours();
  }

  /// [ZH]
  /// ---
  /// 获取已设置的时间段消息提醒屏蔽
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ### Get the Set Time Period for Message Reminder Blocking
  /// - [callback] Event callback. The SDK has supported callback-based event handling since version 5.3.1. Starting from version 5.4.0, other callback methods for this interface have been deprecated and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// @listener [onNotificationQuietHoursLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getNotificationQuietHours({IRCIMIWGetNotificationQuietHoursCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getNotificationQuietHours(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置会话的消息提醒状态
  /// 注：超级群调用该接口，channelId 为空时，相当于设置了 channelId 为空的频道的免打扰，不会屏蔽整个超级群会话下所有频道的免打扰
  /// - [type] 会话类型。请注意以下限制：*超级群会话类型*：如在 2022.09.01 之前开通超级群业务，默认不支持为单个超级群会话*所有消息*设置免打扰级别（“所有消息”指所有频道中的消息和不属于任何频道的消息）。该接口仅设置指定超级群会话（`targetId`）中*不属于任何频道的消息*的免打扰状态级别。如需修改请提交工单。*聊天室会话类型*：不支持，因为聊天室消息默认不支持消息推送提醒。
  /// - [targetId] 会话 ID
  /// - [channelId] 超级群的会话频道 ID。其他类型传 null 即可。如果传入频道 ID，则针对该指定频道设置消息免打扰级别。如果不指定频道 ID，则对所有超级群消息生效。*注意*：2022.09.01 之前开通超级群业务的客户，如果不指定频道 ID，则默认传 "" 空字符串，即仅针对指定超级群会话（`targetId`）中*不属于任何频道的消息*设置免打扰状态级别。如需修改请提交工单。
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set the message notification level for a conversation
  /// Note: When calling this API for an ultra group, if `channelId` is empty, it sets the Do Not Disturb level for messages not belonging to any channel within the specified ultra group conversation. This does not affect the Do Not Disturb settings for all channels within the ultra group conversation.
  /// - [type] The conversation type. Please note the following restrictions:
  /// Ultra group conversation type: For ultra group services activated before 2022.09.01, setting the Do Not Disturb level for all messages in a single ultra group conversation (where "all messages" refers to messages across all channels and messages not belonging to any channel) is not supported by default. This API only sets the Do Not Disturb level for messages not belonging to any channel within the specified ultra group conversation (`targetId`). To modify this behavior, submit a ticket.
  /// Chatroom conversation type: Not supported, as chatroom messages do not support push notifications by default.
  /// - [targetId] The conversation ID.
  /// - [channelId] The channel ID for the ultra group conversation. Pass `null` for other types.
  /// If a channel ID is provided, the Do Not Disturb level is set for the specified channel. If no channel ID is specified, it applies to all messages in the ultra group.
  /// Note: For ultra group services activated before 2022.09.01, if no channel ID is specified, pass an empty string `""`, which sets the Do Not Disturb level only for messages not belonging to any channel within the specified ultra group conversation (`targetId`). To modify this behavior, submit a ticket.
  /// - [level] The message notification level.
  /// - [callback] The event callback. Starting from SDK version 5.3.1, callback is supported. Other callback methods for this API are deprecated as of version 5.4.0 and will be removed in version 6.x. If the `callback` parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> changeConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeConversationNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeConversationNotificationLevel(
      type,
      targetId,
      channelId,
      level,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 加载会话的消息提醒状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the notification level of a conversation
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Use {@link #getConversationNotificationLevel(RCIMIWConversationType, String, String, IRCIMIWGetConversationNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversationNotificationLevel] 代替')
  Future<int> loadConversationNotificationLevel(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadConversationNotificationLevel(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取会话的消息提醒状态
  /// - [type] 会话类型。请注意以下限制：*超级群会话类型*：如在 2022.09.01 之前开通超级群业务，默认不支持为单个超级群会话*所有消息*设置免打扰级别（“所有消息”指所有频道中的消息和不属于任何频道的消息）。该接口仅设置指定超级群会话（`targetId`）中*不属于任何频道的消息*的免打扰状态级别。如需修改请提交工单。*聊天室会话类型*：不支持，因为聊天室消息默认不支持消息推送提醒。
  /// - [targetId] 会话 ID
  /// - [channelId] 超级群的会话频道 ID。其他类型传 null 即可。如果传入频道 ID，则针对该指定频道设置消息免打扰级别。如果不指定频道 ID，则对所有超级群消息生效。*注意*：2022.09.01 之前开通超级群业务的客户，如果不指定频道 ID，则默认传 "" 空字符串，即仅针对指定超级群会话（`targetId`）中*不属于任何频道的消息*设置免打扰状态级别。如需修改请提交工单。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get Conversation Notification Level
  /// - [type] Conversation type. Please note the following restrictions:
  /// Ultra group conversation type: If the ultra group service was activated before 2022.09.01, it does not support setting the Do Not Disturb level for all messages in a single ultra group conversation by default ("all messages" refers to messages in all channels and messages not belonging to any channel). This API only sets the Do Not Disturb level for messages in the specified ultra group conversation (`targetId`) that do not belong to any channel. Submit a ticket if modification is required.Chatroom conversation type: Not supported, as chatroom messages do not support push notifications by default.
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID of the ultra group conversation. Pass `null` for other types.
  /// If a channel ID is provided, the Do Not Disturb level will be set for messages in that specific channel. If no channel ID is specified, it will apply to all ultra group messages.Note: For customers who activated the ultra group service before 2022.09.01, if no channel ID is specified, pass an empty string `""` by default, which means the Do Not Disturb level will only be set for messages in the specified ultra group conversation (`targetId`) that do not belong to any channel. Submit a ticket if modification is required.
  /// - [callback] Event callback. The SDK supports callback-style response starting from version 5.3.1. Other callback methods for this API are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback will be triggered.
  /// @listener [onConversationNotificationLevelLoaded]
  Future<int> getConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationNotificationLevel(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置会话类型的消息提醒状态
  /// 注：如要移除消息提醒状态，设置level为RCIMIWPushNotificationLevelDefault
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTypeNotificationLevelChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set the message notification level for a conversation type
  /// Note: To remove the message notification level, set the level to `RCIMIWPushNotificationLevelDefault`.
  /// - [type] The conversation type
  /// - [level] The message notification level
  /// - [callback] The event callback. The SDK supports callback-based event handling starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> changeConversationTypeNotificationLevel(
    RCIMIWConversationType type,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeConversationTypeNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeConversationTypeNotificationLevel(type, level, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取会话类型的消息提醒状态
  /// - [type] 会话类型
  /// - [返回值] [onConversationTypeNotificationLevelLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Get the message notification status for a conversation type.
  /// - [type] The conversation type.
  /// @deprecated Use {@link #getConversationTypeNotificationLevel(RCIMIWConversationType, IRCIMIWGetConversationTypeNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversationTypeNotificationLevel] 代替')
  Future<int> loadConversationTypeNotificationLevel(RCIMIWConversationType type) async {
    return RCIMWrapperPlatform.instance.loadConversationTypeNotificationLevel(type);
  }

  /// [ZH]
  /// ---
  /// 获取会话类型的消息提醒状态
  /// - [type] 会话类型
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get the notification level for a specific conversation type.
  /// - [type] Specifies the conversation type.
  /// - [callback] Event callback. The SDK has supported callback-based event handling since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> getConversationTypeNotificationLevel(
    RCIMIWConversationType type, {
    IRCIMIWGetConversationTypeNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationTypeNotificationLevel(type, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置超级群的默认消息状态
  /// 一般由管理员设置的接口，针对超级群的所有群成员生效，针对超级群下所有频道生效，优先级较低。如果群成员自己超级群的免打扰级别，那么以群成员自己设置的为准。
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set the default message status for ultra groups
  /// This interface is typically used by administrators and applies to all members of the ultra group and all channels under the ultra group, with a lower priority. If a group member sets their own Do Not Disturb level for the ultra group, the member's setting takes precedence.
  /// - [targetId] The conversation ID
  /// - [level] The message notification level
  /// - [callback] The event callback. Starting from SDK version 5.3.1, callback method is supported. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in the 6.x version. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> changeUltraGroupDefaultNotificationLevel(
    String targetId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeUltraGroupDefaultNotificationLevel(targetId, level, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取超级群的默认消息状态
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Get the default message status of an ultra group
  /// - [targetId] The conversation ID
  /// @deprecated Use {@link #getUltraGroupDefaultNotificationLevel(String, IRCIMIWGetUltraGroupDefaultNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupDefaultNotificationLevel(String targetId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupDefaultNotificationLevel(targetId);
  }

  /// [ZH]
  /// ---
  /// 获取超级群的默认消息状态
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the default message status of an ultra group
  /// - [targetId] The conversation ID
  /// - [callback] The event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onUltraGroupDefaultNotificationLevelLoaded]
  Future<int> getUltraGroupDefaultNotificationLevel(
    String targetId, {
    IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUltraGroupDefaultNotificationLevel(targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set the default message status for an ultra group channel
  /// - [targetId] The conversation ID
  /// - [channelId] The channel ID, only supported for ultra groups
  /// - [level] The message notification level
  /// - [callback] The event callback. The SDK has supported callback-based event handling since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> changeUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeUltraGroupChannelDefaultNotificationLevel(
      targetId,
      channelId,
      level,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 获取超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Get the default message status of an ultra group channel
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups.
  /// @deprecated Use {@link #getUltraGroupChannelDefaultNotificationLevel(String, String, IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupChannelDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupChannelDefaultNotificationLevel(String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupChannelDefaultNotificationLevel(targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the default message status of an ultra group channel
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups.
  /// - [callback] Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onUltraGroupChannelDefaultNotificationLevelLoaded]
  Future<int> getUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId, {
    IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUltraGroupChannelDefaultNotificationLevel(
      targetId,
      channelId,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 设置是否显示远程推送内容详情，此功能需要从服务端开启用户设置功能。
  /// - [showContent] 是否显示远程推送内容
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushContentShowStatusChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set whether to display the details of remote push notifications. This feature requires enabling user settings from the server side.
  /// - [showContent] Indicates whether to display the content of remote push notifications.
  /// - [callback] The event callback. SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> changePushContentShowStatus(
    bool showContent, {
    IRCIMIWChangePushContentShowStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changePushContentShowStatus(showContent, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置推送语言
  /// - [language] 推送语言， 目前仅支持 en_us、zh_cn、ar_sa
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushLanguageChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set Push Language
  /// - [language] The push language. Currently supports en_us, zh_cn, and ar_sa.
  /// - [callback] The event callback. The SDK has supported callback-based notifications since version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushLanguage(String language, {IRCIMIWChangePushLanguageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.changePushLanguage(language, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置是否接收远程推送。
  /// 前提：移动端未在线，Web 、MAC/PC 终端在线，移动端是否接收远程推送。
  /// 此功能需要从服务端开启用户设置功能。
  /// - [receive] 是否接收
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushReceiveStatusChanged]
  /// ---
  /// [EN]
  /// ---
  /// Set whether to receive remote push notifications.
  /// Prerequisite: When the mobile client is offline, and Web or MAC/PC clients are online, determine whether the mobile client receives remote push notifications.
  /// This feature requires enabling user settings from the server side.
  /// - [receive] Indicates whether to receive push notifications.
  /// - [callback] Event callback. The SDK supports callback mode starting from version 5.3.1. Other callback modes for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushReceiveStatus(bool receive, {IRCIMIWChangePushReceiveStatusCallback? callback}) async {
    return RCIMWrapperPlatform.instance.changePushReceiveStatus(receive, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 给指定的群成员发送消息
  /// - [message] 要发送的消息
  /// - [userIds] 群成员集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupMessageToDesignatedUsersAttached], [onGroupMessageToDesignatedUsersSent]
  /// ---
  /// [EN]
  /// ---
  /// Send a message to specified group members
  /// - [message] The message to be sent
  /// - [userIds] The collection of group members
  /// - [callback] The event callback. The SDK supports callback-based response starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in the 6.x release. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendGroupMessageToDesignatedUsers(
    RCIMIWMessage message,
    List<String> userIds, {
    RCIMIWSendGroupMessageToDesignatedUsersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendGroupMessageToDesignatedUsers(message, userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 加载指定会话的消息总数。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageCountLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Loads the total message count for the specified conversation.
  /// - [type] The type of the conversation.
  /// - [targetId] The ID of the conversation.
  /// - [channelId] The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getMessageCount(RCIMIWConversationType, String, String, IRCIMIWGetMessageCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getMessageCount] 代替')
  Future<int> loadMessageCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadMessageCount(type, targetId, channelId);
  }

  /// [ZH]
  /// ---
  /// 获取指定会话的消息总数。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the total number of messages for a specified conversation.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [callback] Event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onMessageCountLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetMessageCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getMessageCount(type, targetId, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 根据会话类型,加载置顶会话列表
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTopConversationsLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Load the pinned conversation list based on the conversation type.
  /// - [conversationTypes] A collection of conversation types.
  /// - [channelId]    The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getTopConversations(List, String, IRCIMIWGetTopConversationsCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getTopConversations] 代替')
  Future<int> loadTopConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadTopConversations(conversationTypes, channelId);
  }

  /// [ZH]
  /// ---
  /// 根据会话类型,获取置顶会话列表
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the list of pinned conversations based on conversation type.
  /// - [conversationTypes] A collection of conversation types.
  /// - [channelId]    The channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [callback]     The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onTopConversationsLoaded]
  Future<int> getTopConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetTopConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getTopConversations(conversationTypes, channelId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 上报超级群的已读时间
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [timestamp] 已读时间
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupReadStatusSynced]
  /// ---
  /// [EN]
  /// ---
  /// Report the read time of an ultra group.
  /// - [targetId] The conversation ID.
  /// - [channelId] The channel ID, only supported for ultra groups.
  /// - [timestamp] The read time.
  /// - [callback] The event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// [timestamp] 在 Flutter For Web 端无效
  Future<int> syncUltraGroupReadStatus(
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSyncUltraGroupReadStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.syncUltraGroupReadStatus(targetId, channelId, timestamp, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取特定会话下所有频道的会话列表，只支持超级群
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoadedForAllChannel]
  /// ---
  /// [EN]
  /// ---
  /// Retrieve the conversation list of all channels under a specific conversation. Only supported for ultra groups.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// @deprecated Use {@link #getConversationsForAllChannel(RCIMIWConversationType, String, IRCIMIWGetConversationsForAllChannelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversationsForAllChannel] 代替')
  Future<int> loadConversationsForAllChannel(RCIMIWConversationType type, String targetId) async {
    return RCIMWrapperPlatform.instance.loadConversationsForAllChannel(type, targetId);
  }

  /// [ZH]
  /// ---
  /// 获取特定会话下所有频道的会话列表，只支持超级群
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the conversation list for all channels under a specific conversation. Only supported for ultra groups.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [callback] Event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onConversationsLoadedForAllChannel]
  Future<int> getConversationsForAllChannel(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationsForAllChannelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationsForAllChannel(type, targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 修改超级群消息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [message] 要修改的 message
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageModified]
  /// ---
  /// [EN]
  /// ---
  /// Modify Ultra Group Message
  /// - [messageUId] The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// - [message] The message to be modified.
  /// - [callback] Event callback. SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> modifyUltraGroupMessage(
    String messageUId,
    RCIMIWMessage message, {
    IRCIMIWModifyUltraGroupMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.modifyUltraGroupMessage(messageUId, message, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 撤回超级群消息
  /// - [message] 需要撤回的消息
  /// - [deleteRemote] 是否删除远端消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageRecalled]
  /// ---
  /// [EN]
  /// ---
  /// Recall Ultra Group Message
  /// - [message] The message to be recalled
  /// - [deleteRemote] Whether to delete the remote message
  /// - [callback] Event callback. SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> recallUltraGroupMessage(
    RCIMIWMessage message,
    bool deleteRemote, {
    IRCIMIWRecallUltraGroupMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.recallUltraGroupMessage(message, deleteRemote, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除超级群指定时间之前的消息
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [timestamp] 时间戳
  /// - [policy] 清除策略
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesCleared]
  /// ---
  /// [EN]
  /// ---
  /// Delete messages in an ultra group before a specified time
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups.
  /// - [timestamp] Unix timestamp
  /// - [policy] Clear policy
  /// - [callback] Event callback. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> clearUltraGroupMessages(
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy, {
    IRCIMIWClearUltraGroupMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearUltraGroupMessages(
      targetId,
      channelId,
      timestamp,
      policy,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 发送超级群输入状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [typingStatus] 输入状态
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupTypingStatusSent]
  /// ---
  /// [EN]
  /// ---
  /// Send Ultra Group Typing Status
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, supported only for ultra groups.
  /// - [typingStatus] Typing status
  /// - [callback] Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in the 6.x release. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendUltraGroupTypingStatus(
    String targetId,
    String? channelId,
    RCIMIWUltraGroupTypingStatus typingStatus, {
    IRCIMIWSendUltraGroupTypingStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendUltraGroupTypingStatus(
      targetId,
      channelId,
      typingStatus,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 删除超级群所有频道指定时间之前的消息
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesClearedForAllChannel]
  /// ---
  /// [EN]
  /// ---
  /// Delete messages in all channels of an ultra group before a specified timestamp.
  /// - [targetId] The conversation ID.
  /// - [timestamp] The timestamp.
  /// - [callback] The event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> clearUltraGroupMessagesForAllChannel(
    String targetId,
    int timestamp, {
    IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearUltraGroupMessagesForAllChannel(targetId, timestamp, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 从服务获取批量消息
  /// - [messages] 获取的消息集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBatchRemoteUltraGroupMessagesLoaded]
  /// ---
  /// [EN]
  /// ---
  /// Retrieve Batch Messages from Service
  /// - [messages] The collection of messages to be retrieved
  /// @deprecated Use {@link #getBatchRemoteUltraGroupMessages(List, IRCIMIWGetBatchRemoteUltraGroupMessagesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getBatchRemoteUltraGroupMessages] 代替')
  Future<int> loadBatchRemoteUltraGroupMessages(List<RCIMIWMessage> messages) async {
    return RCIMWrapperPlatform.instance.loadBatchRemoteUltraGroupMessages(messages);
  }

  /// [ZH]
  /// ---
  /// 从服务获取批量消息
  /// - [messages] 获取的消息集合
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve Batch Messages from Service
  /// - [messages] The collection of messages retrieved.
  /// - [callback] The event callback. Starting from SDK version 5.3.1, callback is supported. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBatchRemoteUltraGroupMessagesLoaded]
  Future<int> getBatchRemoteUltraGroupMessages(
    List<RCIMIWMessage> messages, {
    IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getBatchRemoteUltraGroupMessages(messages, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 更新超级群消息扩展信息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionUpdated]
  /// ---
  /// [EN]
  /// ---
  /// Update Ultra Group Message Extension Information
  /// - [messageUId] The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// - [expansion] The key-value pairs for the updated message extension information, of type HashMap. Key supports a combination of uppercase and lowercase English letters, numbers, and special characters + = - _. Chinese characters are not supported. Value can include spaces.
  /// - [callback] The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> updateUltraGroupMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateUltraGroupMessageExpansion(messageUId, expansion, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除超级群消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionForKeysRemoved]
  /// ---
  /// [EN]
  /// ---
  /// Delete specific key-value pairs from the message extension information of an ultra group.
  /// - [messageUId] The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// - [keys]  The list of keys to be deleted from the message extension information, of type ArrayList.
  /// - [callback] Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> removeUltraGroupMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeUltraGroupMessageExpansionForKeys(messageUId, keys, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 修改日志等级
  /// - [level] 日志级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Modify Log Level
  /// - [level] The log level
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeLogLevel(RCIMIWLogLevel level) async {
    return RCIMWrapperPlatform.instance.changeLogLevel(level);
  }

  /// [ZH]
  /// ---
  /// 获取本地时间与服务器时间的时间差。消息发送成功后，SDK 与服务器同步时间，消息所在数据库中存储的时间就是服务器时间。 System.currentTimeMillis() - getDeltaTime() 可以获取服务器当前时间。
  /// - [返回值] 本地时间与服务器时间的差值
  /// ---
  /// [EN]
  /// ---
  /// Retrieves the time difference between local time and server time.
  /// After a message is successfully sent, the SDK synchronizes time with the server,
  /// and the time stored in the message database is the server time.
  /// System.currentTimeMillis() - getDeltaTime() can be used to obtain the current server time.
  /// ---
  Future<int> getDeltaTime() async {
    return RCIMWrapperPlatform.instance.getDeltaTime();
  }

  Future<RCIMIWAppSettings?> getAppSettings() async {
    return RCIMWrapperPlatform.instance.getAppSettings();
  }

  /// [ZH]
  /// ---
  /// 创建标签信息
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [tagName] 长度不超过 15 个字，标签名称可以重复。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Create Tag Information
  /// - [tagId] The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// - [tagName] The name of the tag, with a maximum length of 15 characters. Tag names can be duplicated.
  /// - [callback] Event callback.
  /// ---
  Future<int> createTag(String tagId, String tagName, {IRCIMIWCreateTagCallback? callback}) async {
    return RCIMWrapperPlatform.instance.createTag(tagId, tagName, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 移除标签
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Remove Tag
  /// - [tagId] The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// - [callback] The event callback.
  /// ---
  Future<int> removeTag(String tagId, {IRCIMIWRemoveTagCallback? callback}) async {
    return RCIMWrapperPlatform.instance.removeTag(tagId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 更新标签信息
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [newName] 长度不超过 15 个字，标签名称可以重复。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Update Tag Information
  /// - [tagId] The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// - [newName] The new name of the tag, with a maximum length of 15 characters. Tag names can be duplicated.
  /// - [callback] The event callback.
  /// ---
  Future<int> updateTagNameById(String tagId, String newName, {IRCIMIWUpdateTagNameByIdCallback? callback}) async {
    return RCIMWrapperPlatform.instance.updateTagNameById(tagId, newName, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取当前用户已创建的标签信息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Retrieve the tag information created by the current user.
  /// - [callback] The event callback.
  /// ---
  Future<int> getTags({IRCIMIWGetTagsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getTags(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 将一个会话添加到指定标签
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Add a conversation to a specified tag
  /// - [tagId] The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// - [type] The type of the conversation
  /// - [targetId] The ID of the conversation
  /// - [callback] The event callback.
  /// ---
  Future<int> addConversationToTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWAddConversationToTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.addConversationToTag(tagId, type, targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 从标签中移除一个会话
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Remove a conversation from a tag
  /// - [tagId] Unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [callback] Event callback.
  /// ---
  Future<int> removeConversationFromTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWRemoveConversationFromTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeConversationFromTag(tagId, type, targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 为指定会话移除一个或多个标签
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [tagIds] 标签集合
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Remove one or more tags for a specified conversation
  /// - [type] Specifies the conversation type
  /// - [targetId] Indicates the conversation ID
  /// - [tagIds] Represents the collection of tags
  /// - [callback] Specifies the event callback.
  /// ---
  Future<int> removeTagsFromConversation(
    RCIMIWConversationType type,
    String targetId,
    List<String> tagIds, {
    IRCIMIWRemoveTagsFromConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeTagsFromConversation(type, targetId, tagIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取指定会话携带的所有标签
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// ### Get All Tags Associated with a Specified Conversation
  /// - [type] Specifies the conversation type.
  /// - [targetId] Indicates the conversation ID.
  /// - [callback] Represents the event callback.
  /// ---
  Future<int> getTagsFromConversation(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetTagsFromConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getTagsFromConversation(type, targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 以会话中最后一条消息时间戳为界，分页获取本地指定标签下会话列表
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [timestamp] 会话的时间戳。获取这个时间戳之前的会话列表。首次可传 0，后续可以使用返回的 RCConversation 对象的 operationTime 属性值，作为下一次查询的 startTime。
  /// - [count] 获取的数量。当实际取回的会话数量小于 count 值时，表明已取完数据。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Retrieve the local conversation list under a specified tag, paginated by the timestamp of the last message in the conversation.
  /// - [tagId] The unique identifier of the tag, a string type with a maximum length of 10 characters.
  /// - [timestamp] The timestamp of the conversation. Retrieves the conversation list before this timestamp. For the first query, pass 0. For subsequent queries, use the operationTime property value from the returned RCConversation object as the startTime for the next query.
  /// - [count] The number of conversations to retrieve. If the number of conversations retrieved is less than the count value, it indicates that all data has been fetched.
  /// - [callback] The event callback.
  /// ---
  Future<int> getConversationsFromTagByPage(
    String tagId,
    int timestamp,
    int count, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationsFromTagByPage(tagId, timestamp, count, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取携带指定标签的所有会话的未读消息数。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [contain] 是否包含免打扰会话。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get the unread message count for all conversations with the specified tag.
  /// - [tagId] The unique identifier of the tag. It is a string type and its length should not exceed 10 characters.
  /// - [contain] Indicates whether to include conversations with Do Not Disturb enabled.
  /// - [callback] The event callback.
  /// ---
  Future<int> getUnreadCountByTag(String tagId, bool contain, {IRCIMIWGetUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getUnreadCountByTag(tagId, contain, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 在携带指定标签的所有会话中设置指定会话置顶。例如，在所有添加了「培训班」标签的会话中将与「Tom」的私聊会话置顶。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [top] 是否置顶
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Set the specified conversation as top in all conversations with the specified tag. For example, pin the private chat with "Tom" to the top among all conversations tagged with "Training Class".
  /// - [tagId] The unique identifier of the tag, character type, with a maximum length of 10 characters.
  /// - [type] The type of conversation.
  /// - [targetId] The ID of the conversation.
  /// - [top] Whether to pin the conversation to the top.
  /// - [callback] The event callback.
  /// ---
  Future<int> changeConversationTopStatusInTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId,
    bool top, {
    IRCIMIWChangeConversationTopStatusInTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeConversationTopStatusInTag(
      tagId,
      type,
      targetId,
      top,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 查询指定会话是否在携带同一标签的所有会话中置顶。获取成功后会返回是否已置顶。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Checks whether the specified conversation is pinned among all conversations with the same tag. Returns the pinned status upon successful retrieval.
  /// - [tagId] The unique identifier of the tag. String type, with a maximum length of 10 characters.
  /// - [type] The type of the conversation.
  /// - [targetId] The ID of the conversation.
  /// - [callback] The event callback.
  /// ---
  Future<int> getConversationTopStatusInTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationTopStatusInTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationTopStatusInTag(tagId, type, targetId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 清除携带指定标签的所有会话的未读消息数。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Clear the unread message count for all conversations carrying the specified tag.
  /// - [tagId] The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// - [callback] The event callback.
  /// ---
  Future<int> clearMessagesUnreadStatusByTag(
    String tagId, {
    IRCIMIWClearMessagesUnreadStatusByTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearMessagesUnreadStatusByTag(tagId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除指定标签下的全部会话，同时解除这些会话和标签的绑定关系。删除成功后，会话不再携带指定的标签。这些会话收到新消息时，会产生新的会话。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [deleteMessage] 是否删除消息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Remove all conversations under the specified tag and unbind these conversations from the tag. After successful deletion, the conversations will no longer carry the specified tag. When these conversations receive new messages, new conversations will be created.
  /// - [tagId] The unique identifier of the tag, character type, with a length not exceeding 10 characters.
  /// - [deleteMessage] Specifies whether to delete the messages.
  /// - [callback] Event callback.
  /// ---
  Future<int> clearConversationsByTag(
    String tagId,
    bool deleteMessage, {
    IRCIMIWClearConversationsByTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearConversationsByTag(tagId, deleteMessage, callback: callback);
  }

  Future<int> setModuleName(String moduleName, String version) async {
    return RCIMWrapperPlatform.instance.setModuleName(moduleName, version);
  }

  Future<int> writeLog(String method, String callMethod, int codeValue, String message) async {
    return RCIMWrapperPlatform.instance.writeLog(method, callMethod, codeValue, message);
  }

  Future<int> createGroup(
    RCIMIWGroupInfo groupInfo,
    List<String> inviteeUserIds, {
    IRCIMIWCreateGroupCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.createGroup(groupInfo, inviteeUserIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 更新群组资料
  /// - [groupInfo] 群信息，只需传入需要修改的参数
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Update group info
  /// - [groupInfo] Group details (only modified parameters required)
  /// - [callback] Event callback
  /// ---
  Future<int> updateGroupInfo(RCIMIWGroupInfo groupInfo, {IRCIMIWGroupInfoUpdatedCallback? callback}) async {
    return RCIMWrapperPlatform.instance.updateGroupInfo(groupInfo, callback: callback);
  }

  /// [ZH]
  /// ---
  /// - [groupIds]
  /// - [callback]
  /// - [返回值]
  /// ---
  /// [EN]
  /// ---
  /// ---
  Future<int> getGroupsInfo(List<String> groupIds, {IRCIMIWGetGroupsInfoCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getGroupsInfo(groupIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 踢出群组
  /// - [groupId] 群组Id。
  /// - [userIds] 群成员Id数组。支持批量操作，单次上限为 100 个。
  /// - [config] 踢出群组配置。允许传空，传空代表使用默认配置。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Remove members from group
  /// - [groupId] Group identifier
  /// - [userIds] Array of member IDs (supports batch operations, max 100 per call)
  /// - [config] Removal config (optional, uses default when empty)
  /// - [callback] Event callback
  /// ---
  Future<int> kickGroupMembers(
    String groupId,
    List<String> userIds,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWKickGroupMembersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.kickGroupMembers(groupId, userIds, config, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 主动加入group
  /// - [groupId] groupId。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Join group actively
  /// - [groupId] Group ID
  /// - [callback] Event callback
  /// ---
  Future<int> joinGroup(String groupId, {IRCIMIWJoinGroupCallback? callback}) async {
    return RCIMWrapperPlatform.instance.joinGroup(groupId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 主动退出群组
  /// - [groupId] 群组 ID
  /// - [config] 退出群组配置。允许传空，传空代表使用默认配置。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Leave group actively
  /// - [groupId] group ID
  /// - [config] Exit config (optional, defaults apply if null)
  /// - [callback] Event callback
  /// ---
  Future<int> quitGroup(String groupId, RCIMIWQuitGroupConfig config, {IRCIMIWQuitGroupCallback? callback}) async {
    return RCIMWrapperPlatform.instance.quitGroup(groupId, config, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 解散群组
  /// - [groupId] 群组 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Dismiss group
  /// - [groupId] Group ID
  /// - [callback] Event callback
  /// ---
  Future<int> dismissGroup(String groupId, {IRCIMIWDismissGroupCallback? callback}) async {
    return RCIMWrapperPlatform.instance.dismissGroup(groupId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 转让群主身份
  /// - [groupId] 群组 ID
  /// - [newOwnerId] 新群主 ID
  /// - [quitGroup] 是否退出群组
  /// - [config] 转让群主配置。允许传空，传空代表使用默认配置。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Transfer group ownership
  /// - [groupId] Group ID
  /// - [newOwnerId] New owner ID
  /// - [quitGroup] Whether to leave group
  /// - [config] Transfer config (optional, defaults apply if null)
  /// - [callback] Event callback
  /// ---
  Future<int> transferGroupOwner(
    String groupId,
    String newOwnerId,
    bool quitGroup,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWTransferGroupOwnerCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.transferGroupOwner(groupId, newOwnerId, quitGroup, config, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取已加入指定群成员信息
  /// - [groupId] 群组 ID
  /// - [userIds] 用户 ID 列表，一次最多不超过 100 个。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get group member info
  /// - [groupId] Group ID
  /// - [userIds] User ID list (max 100 per request)
  /// - [callback] Event callback
  /// ---
  Future<int> getGroupMembers(String groupId, List<String> userIds, {IRCIMIWGetGroupMembersCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getGroupMembers(groupId, userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 分页获取群成员信息
  /// - [groupId] 群组 ID
  /// - [role] 群成员角色
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 100 条）、是否正序查询（默认倒序）
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get group members with pagination
  /// - [groupId] group ID
  /// - [role] member role
  /// - [option] query options including page token (optional, returns first page if empty), page size (max 100), and ascending order (default desc)
  /// - [callback] event callback
  /// ---
  Future<int> getGroupMembersByRole(
    String groupId,
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetGroupMembersByRoleCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getGroupMembersByRole(groupId, role, option, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 按角色获取已加入群组的资料
  /// - [role] 群成员角色
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 100 条）、是否正序查询（默认倒序）
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get joined group info by role
  /// - [role] Group member role
  /// - [option] Query options including page token (optional, returns first page if empty), page size (max 100), and ascending order (default desc)
  /// - [callback] Event callback
  /// ---
  Future<int> getJoinedGroupsByRole(
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetJoinedGroupsByRoleCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getJoinedGroupsByRole(role, option, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取指定已加入群组的资料
  /// - [groupIds] 群组 ID 列表。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get joined group details
  /// - [groupIds] List of group IDs
  /// - [callback] Event callback
  /// ---
  Future<int> getJoinedGroups(List<String> groupIds, {IRCIMIWGetJoinedGroupsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getJoinedGroups(groupIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置群组备注名
  /// - [groupId] 群组 ID。
  /// - [remark] 群备注，字符串长度不超过 64 个字符。传空或空字符串表示移除群备注
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Set group remark name
  /// - [groupId] Group ID
  /// - [remark] Group remark (max 64 chars). Pass empty string to remove remark
  /// - [callback] Event callback
  /// ---
  Future<int> setGroupRemark(String groupId, String remark, {IRCIMIWSetGroupRemarkCallback? callback}) async {
    return RCIMWrapperPlatform.instance.setGroupRemark(groupId, remark, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置群成员资料
  /// - [groupId] 群组 ID
  /// - [userId] 用户ID， 必填项，支持传入当前登录用户 ID。
  /// - [nickname] 用户昵称，非必填项，长度不超过 64 个字符，传空或空字符串表示移除用户昵称。
  /// - [extra] 附加信息，非必填项，长度不超过 128 个字符
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Set group member profile
  /// - [groupId] Group ID
  /// - [userId] Required user ID (supports current logged-in user ID)
  /// - [nickname] Optional nickname (max 64 chars). Empty string removes nickname
  /// - [extra] Optional additional info (max 128 chars)
  /// - [callback] Event callback
  /// ---
  Future<int> setGroupMemberInfo(
    String groupId,
    String userId,
    String nickname,
    String extra, {
    IRCIMIWSetGroupMemberInfoCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.setGroupMemberInfo(groupId, userId, nickname, extra, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 按群名称搜索已加入群组的资料
  /// - [groupName] 群名称，不能为空，最长不超过 64 个字符。
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Search joined groups by name
  /// - [groupName] Group name (required, max 64 chars)
  /// - [option] Query options including page token (optional, first page by default), page size (max 200), and sort order (descending by default)
  /// - [callback] Event callback
  /// ---
  Future<int> searchJoinedGroups(
    String groupName,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchJoinedGroupsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchJoinedGroups(groupName, option, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 根据群成员昵称查询群成员
  /// - [groupId] 群组 ID
  /// - [name] 群成员昵称，必填，不能为空最长不超过 64 个字符。
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// @note 优先匹配群成员昵称 nickname，再匹配群成员用户名 name。只要其中一个字段匹配成功，即返回搜索结果。
  /// ---
  /// [EN]
  /// ---
  /// Search group members by nickname
  /// - [groupId] groupID
  /// - [name] Member nickname (required, max 64 chars)
  /// - [option] Search options including page token (optional, first page by default), page size (max 200), and sort order (descending by default)
  /// - [callback] Event callback
  /// @note Searches nickname first, then username. Returns results if either field matches
  /// ---
  Future<int> searchGroupMembers(
    String groupId,
    String name,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchGroupMembersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchGroupMembers(groupId, name, option, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 添加群管理员
  /// - [groupId] 群组 ID，必填项
  /// - [userIds] 用户 ID 数组，必填项。用户 ID 必须为群成员，一次最多设置 10 个群成员为管理员，管理员上限为 10 个。群主不支持设置为管理员
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口���用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Add group admin
  /// - [groupId] Required group ID
  /// - [userIds] Required user ID array. Must be group members. Max 10 admins per group (owner excluded)
  /// - [callback] Event callback
  /// ---
  Future<int> addGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWAddGroupManagersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.addGroupManagers(groupId, userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 移除群管理员
  /// - [groupId] 群组 ID，必填项
  /// - [userIds] 用户 ID 数组，必填项。一次最多操作 10 个管理员
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Remove group admin
  /// - [groupId] Required group ID
  /// - [userIds] Required user ID array (max 10 admins per operation)
  /// - [callback] Event callback
  /// ---
  Future<int> removeGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupManagersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeGroupManagers(groupId, userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 邀请用户加入群组
  /// - [groupId] 群组 ID
  /// - [userIds] 用户ID列表，一次最多不超过 30 个
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// @note
  /// *`callback` 的 `processCode` 参数说明*
  /// - 当群组的 `joinPermission` 为需要群主或管理员审批时，`processCode` 返回 `RC_GROUP_JOIN_GROUP_NEED_MANAGER_ACCEPT` ( 25424 )，表示需要等待群主或管理员审批。
  /// - 当群组的 `joinPermission` 为不用验证，同时 `inviteHandlePermission` 为需要被邀请人同意时，`processCode` 返回 `RC_GROUP_NEED_INVITEE_ACCEPT` ( 25427 )，表示需要被邀请人同意后才能进入group。
  /// ---
  /// [EN]
  /// ---
  /// Invite users to join a group
  /// - [groupId] Group ID
  /// - [userIds] User ID list (max 30 per request)
  /// - [callback] Event callback
  /// @note
  /// *About `processCode` in callback*
  /// - When group's `joinPermission` requires owner/admin approval, returns `RC_GROUP_JOIN_GROUP_NEED_MANAGER_ACCEPT` (25424) - pending approval
  /// - When `joinPermission` is open but `inviteHandlePermission` requires invitee consent, returns `RC_GROUP_NEED_INVITEE_ACCEPT` (25427) - pending invitee confirmation
  /// ---
  Future<int> inviteUsersToGroup(
    String groupId,
    List<String> userIds, {
    IRCIMIWInviteUsersToGroupCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.inviteUsersToGroup(groupId, userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 用户同意加入群组
  /// - [groupId] 群组 ID
  /// - [inviterId] 邀请者ID
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Accept group invitation
  /// - [groupId] Group ID
  /// - [inviterId] Inviter's ID
  /// - [callback] Event callback
  /// ---
  Future<int> acceptGroupInvite(String groupId, String inviterId, {IRCIMIWAcceptGroupInviteCallback? callback}) async {
    return RCIMWrapperPlatform.instance.acceptGroupInvite(groupId, inviterId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 用户拒绝加入群组
  /// - [groupId] 群组ID
  /// - [inviterId] 邀请者ID
  /// - [reason] 拒绝原因，非必填项，拒绝时可选择是否输入拒绝原因，内容不超过 128 个字符。
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// User declines group invitation
  /// - [groupId] Group ID
  /// - [inviterId] Inviter's ID
  /// - [reason] Optional decline reason (max 128 chars)
  /// - [callback] Event callback
  /// ---
  Future<int> refuseGroupInvite(
    String groupId,
    String inviterId,
    String reason, {
    IRCIMIWRefuseGroupInviteCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.refuseGroupInvite(groupId, inviterId, reason, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 群主或管理员同意用户加入群组
  /// - [groupId] 群组 ID
  /// - [inviterId] 邀请人用户 ID，非必填，如果是邀请入群，则传邀请人ID；如果是用户主动加群，可以为空。
  /// - [applicantId] 申请入群用户 ID
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// @note
  /// *`callback` 的 `processCode` 参数说明*
  /// - 当群组的 `inviteHandlePermission` 为需要被邀请人同意时，若 `processCode` 返回 `RC_GROUP_NEED_INVITEE_ACCEPT` (25427)，表示需等待被邀请人同意方可加入群组。
  /// - 当群组的 `inviteHandlePermission` 为无需被邀请人同意时，若 `processCode` 返回 `RC_SUCCESS` (0)，表示被邀请人已成功加入群组。
  /// 以上仅适用于邀请加入群组的情况，当用户主动申请加入群组时，`processCode` 始终为 `RC_SUCCESS` (0)。
  /// ---
  /// [EN]
  /// ---
  /// Approve user's request to join group
  /// - [groupId] Group ID
  /// - [inviterId] Inviter's user ID (optional). Required for invited joins, empty for direct requests.
  /// - [applicantId] Applicant's user ID
  /// - [callback] Event callback
  /// @note
  /// *About `callback`'s `processCode`:*
  /// - When group's `inviteHandlePermission` requires invitee consent, `RC_GROUP_NEED_INVITEE_ACCEPT` (25427) means waiting for approval.
  /// - When no consent needed, `RC_SUCCESS` (0) means invitee joined successfully.
  /// Note: These only apply to invited joins. For direct requests, `processCode` always returns `RC_SUCCESS` (0).
  /// ---
  Future<int> acceptGroupApplication(
    String groupId,
    String inviterId,
    String applicantId, {
    IRCIMIWAcceptGroupApplicationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.acceptGroupApplication(groupId, inviterId, applicantId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 群主或管理员拒绝用户加入群组
  /// - [groupId] 群组 ID
  /// - [inviterId] 邀请人用户 ID ，非必填，如果是邀请入群，则传邀请人ID；如果是主动加群，可以为空。
  /// - [applicantId] 申请者ID
  /// - [reason] 拒绝原因，内容不超过 128 个字符。
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Reject user's group join request
  /// - [groupId] Group ID
  /// - [inviterId] Inviter's user ID (optional). Required for invited joins, empty for self-requested joins
  /// - [applicantId] Applicant's ID
  /// - [reason] Rejection reason (max 128 chars)
  /// - [callback] Event callback
  /// ---
  Future<int> refuseGroupApplication(
    String groupId,
    String inviterId,
    String applicantId,
    String reason, {
    IRCIMIWRefuseGroupApplicationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.refuseGroupApplication(
      groupId,
      inviterId,
      applicantId,
      reason,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 分页获取群组申请列表
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）
  /// - [directions] 申请方向 `RCGroupApplicationDirection` 数组
  /// - [status] 状态类型 `RCGroupApplicationStatus` 数组
  /// - [callback] 事件回调，此接口不支持返回请求总数。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get group applications by page
  /// - [option] Query options including page token (optional, returns first page if empty), page size (max 200), and sort order (descending by default)
  /// - [directions] Array of `RCGroupApplicationDirection` for application directions
  /// - [status] Array of `RCGroupApplicationStatus` for status types
  /// - [callback] Event callback. Total count isn't supported
  /// ---
  Future<int> getGroupApplications(
    RCIMIWPagingQueryOption option,
    List<RCIMIWGroupApplicationDirection> directions,
    List<RCIMIWGroupApplicationStatus> status, {
    IRCIMIWGetGroupApplicationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getGroupApplications(option, directions, status, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 添加群组特别关注用户
  /// - [groupId] 群组 ID
  /// - [userIds] 用户 ID 列表，单次最多关注 100 个用户。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码。
  /// ---
  /// [EN]
  /// ---
  /// Follow group users
  /// - [groupId] Group ID
  /// - [userIds] User IDs to follow (max 100 per request)
  /// - [callback] Event callback
  /// ---
  Future<int> addGroupFollows(String groupId, List<String> userIds, {IRCIMIWAddGroupFollowsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.addGroupFollows(groupId, userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 删除群组特别关注用户
  /// - [groupId] 群组 ID
  /// - [userIds] 用户 ID 列表，单次取消关注 100 个用户。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码。
  /// ---
  /// [EN]
  /// ---
  /// Unfollow groupUsers
  /// - [groupId] Group ID
  /// - [userIds] List of user IDs (max 100 per request)
  /// - [callback] Event callback
  /// ---
  Future<int> removeGroupFollows(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupFollowsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeGroupFollows(groupId, userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取g群组特别关注用户
  /// - [groupId] 群组 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码。
  /// ---
  /// [EN]
  /// ---
  /// Get groupUsers I follow
  /// - [groupId] Group ID
  /// - [callback] Event callback
  /// ---
  Future<int> getGroupFollows(String groupId, {IRCIMIWGetGroupFollowsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getGroupFollows(groupId, callback: callback);
  }

  Future<int> setCheckChatRoomDuplicateMessage(bool enableCheck) async {
    return RCIMWrapperPlatform.instance.setCheckChatRoomDuplicateMessage(enableCheck);
  }

  /// [ZH]
  /// ---
  /// 批量翻译消息
  /// - [params] 需要翻译的消息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Batch translate messages
  /// - [params] Messages to translate
  /// - [callback] Event callback
  /// ---
  Future<int> translateMessagesWithParams(
    RCIMIWTranslateMessagesParams params, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.translateMessagesWithParams(params, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 批量翻译内容
  /// - [params] 需要翻译的内容
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Batch translate content
  /// - [params] Content to translate
  /// - [callback] Event callback
  /// ---
  Future<int> translateTextsWithParams(
    RCIMIWTranslateTextParams params, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.translateTextsWithParams(params, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置翻译语言
  /// SDK 不校验字符串有效性
  /// - [language] 翻译语言
  /// - [callback] 参数校验回调结果
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Set translation language
  /// SDK won't validate string format
  /// - [language] Target language
  /// - [callback] Parameter validation callback
  /// ---
  Future<int> setTranslationLanguage(String language, {IRCIMIWTranslateResponseCallback? callback}) async {
    return RCIMWrapperPlatform.instance.setTranslationLanguage(language, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取翻译目标语言
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get target translation language
  /// - [callback] Event callback
  /// ---
  Future<int> getTranslationLanguage({IRCIMIWTranslateGetLanguageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getTranslationLanguage(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 设置自动翻译开关
  /// - [isEnable] 是否开启自动翻译
  /// - [callback] 参数校验回调结果
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Toggle auto-translation
  /// - [isEnable] Enable auto-translation
  /// - [callback] Parameter validation callback
  /// ---
  Future<int> setAutoTranslateEnable(bool isEnable, {IRCIMIWTranslateResponseCallback? callback}) async {
    return RCIMWrapperPlatform.instance.setAutoTranslateEnable(isEnable, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取自动翻译开关状态
  /// - [callback] 参数校验回调结果
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Get auto-translation toggle status
  /// - [callback] Callback for parameter validation
  /// ---
  Future<int> getAutoTranslateEnabled({IRCIMIWGetAutoTranslateEnabledCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getAutoTranslateEnabled(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 批量设置会话翻译策略
  /// - [types] 会话类型列表
  /// - [targetIds] 会话ID列表
  /// - [channelIds] 频道ID列表
  /// - [strategy] 翻译策略
  /// - [callback] 参数校验回调结果
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ---
  /// Set translation strategies in bulk
  /// - [types] List of conversation types
  /// - [targetIds] List of conversation IDs
  /// - [channelIds] List of channel IDs
  /// - [strategy] Translation strategy
  /// - [callback] Parameter validation callback result
  /// ---
  Future<int> batchSetConversationTranslateStrategy(
    List<RCIMIWConversationType> types,
    List<String> targetIds,
    List<String> channelIds,
    RCIMIWTranslateStrategy strategy, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.batchSetConversationTranslateStrategy(
      types,
      targetIds,
      channelIds,
      strategy,
      callback: callback,
    );
  }

  /// [ZH]
  /// ---
  /// 计算文本MD5值
  /// - [text] 需要计算MD5的文本
  /// - [返回值] MD5字符串，计算失败返回null
  /// ---
  /// [EN]
  /// ---
  /// Calculate MD5 hash of text
  /// - [text] Input text for hashing
  /// ---
  Future<String> calculateTextMD5(String text) async {
    return RCIMWrapperPlatform.instance.calculateTextMD5(text);
  }

  /// [ZH]
  /// ---
  /// 设置自己的信息访问权限
  /// - [visibility] 权限设置
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Set info access permissions
  /// - [visibility] Privacy settings
  /// - [callback] Event callback
  /// ---
  Future<int> updateMyUserProfileVisibility(
    RCIMIWUserProfileVisibility visibility, {
    IRCIMIWUpdateMyUserProfileVisibilityCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateMyUserProfileVisibility(visibility, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 获取自己的信息访问权限
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Get self-info access
  /// - [callback] Event callback
  /// ---
  Future<int> getMyUserProfileVisibility({IRCIMIWGetMyUserProfileVisibilityCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getMyUserProfileVisibility(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 修改自己的用户信息
  /// - [profile] 用户信息
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Update your profile info
  /// - [profile] User profile data
  /// - [callback] Event callback
  /// ---
  Future<int> updateMyUserProfile(RCIMIWUserProfile profile, {IRCIMIWUpdateMyUserProfileCallback? callback}) async {
    return RCIMWrapperPlatform.instance.updateMyUserProfile(profile, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 查询自己的用户信息
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Get your profile info
  /// - [callback] Event callback
  /// ---
  Future<int> getMyUserProfile({IRCIMIWGetMyUserProfileCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getMyUserProfile(callback: callback);
  }

  /// [ZH]
  /// ---
  /// 批量获取用户信息
  /// - [userIds] 用户 ID 列表
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Get user info in batch
  /// - [userIds] List of user IDs
  /// - [callback] Event callback
  /// ---
  Future<int> getUserProfiles(List<String> userIds, {IRCIMIWGetUserProfilesCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getUserProfiles(userIds, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 按用户应用号精确搜索
  /// - [uniqueId] 用户应用号
  /// - [callback] 事件回调，如果搜不到用户，会返回错误码 RC_USER_PROFILE_USER_NOT_EXIST (24366)
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Search by user app ID
  /// - [uniqueId] User app ID
  /// - [callback] Event callback, returns error code RC_USER_PROFILE_USER_NOT_EXIST (24366) if user not found
  /// ---
  Future<int> searchUserProfileByUniqueId(
    String uniqueId, {
    IRCIMIWSearchUserProfileByUniqueIdCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchUserProfileByUniqueId(uniqueId, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 订阅个人信息变更事件
  /// - [request] 订阅事件请求参数
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Subscribe to personal info change events
  /// - [request] Subscription request params
  /// - [callback] Event callback
  /// ---
  Future<int> subscribeEvent(RCIMIWSubscribeEventRequest request, {IRCIMIWSubscribeEventCallback? callback}) async {
    return RCIMWrapperPlatform.instance.subscribeEvent(request, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 取消订阅个人信息变更事件
  /// - [request] 取消订阅事件请求参数
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Unsubscribe from personal info change events
  /// - [request] Unsubscription request params
  /// - [callback] Event callback
  /// ---
  Future<int> unSubscribeEvent(RCIMIWSubscribeEventRequest request, {IRCIMIWSubscribeEventCallback? callback}) async {
    return RCIMWrapperPlatform.instance.unSubscribeEvent(request, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 查询已订阅的个人信息变更事件
  /// - [request] 查询订阅事件请求参数
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Get subscribed personal info change events
  /// - [request] Query parameters
  /// - [callback] Event callback
  /// ---
  Future<int> querySubscribeEvent(
    RCIMIWSubscribeEventRequest request, {
    IRCIMIWQuerySubscribeEventCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.querySubscribeEvent(request, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 分页查询已订阅的个人信息变更事件
  /// - [request] 查询订阅事件请求参数
  /// - [pageSize] 每页条数
  /// - [startIndex] 起始索引
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调
  /// ---
  /// [EN]
  /// ---
  /// Get subscribed personal info change events by page
  /// - [request] Query params
  /// - [pageSize] Items per page
  /// - [startIndex] Start index
  /// - [callback] Event callback
  /// ---
  Future<int> querySubscribeEventByPage(
    RCIMIWSubscribeEventRequest request,
    int pageSize,
    int startIndex, {
    IRCIMIWQuerySubscribeEventCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.querySubscribeEventByPage(request, pageSize, startIndex, callback: callback);
  }

  /// 请求将指定消息的语音转为文字
  /// - [messageUId] 消息唯一 ID
  /// - [callback] 事件回调
  /// - [返回值] 调用状态码，0 表示发起成功
  Future<int> requestSpeechToTextForMessage(String messageUId, {IRCIMIWOperationCallback? callback}) async {
    return RCIMWrapperPlatform.instance.requestSpeechToTextForMessage(messageUId, callback: callback);
  }

  /// 设置指定消息的语音转文字可见性
  /// - [messageId] 消息本地 ID
  /// - [visible] 是否可见
  /// - [callback] 事件回调
  /// - [返回值] 调用状态码，0 表示发起成功
  Future<int> setMessageSpeechToTextVisible(int messageId, bool visible, {IRCIMIWOperationCallback? callback}) async {
    return RCIMWrapperPlatform.instance.setMessageSpeechToTextVisible(messageId, visible, callback: callback);
  }

  /// [ZH]
  /// ---
  /// 收到消息的监听
  /// - [message] 接收到的消息对象
  /// - [left]  当客户端连接成功后，服务端会将所有补偿消息以消息包的形式下发给客户端，最多每 200 条消息为一个消息包，即一个 Package, 客户端接受到消息包后，会逐条解析并通知应用。left 为当前消息包（Package）里还剩余的消息条数
  /// - [offline] 消息是否离线消息
  /// - [hasPackage] 是否在服务端还存在未下发的消息包
  /// ---
  /// [EN]
  /// ---
  /// Message Received Listener
  /// - [message] Represents the received message object.
  /// - [left]  After the client successfully connects, the server delivers all compensation messages in packages, with a maximum of 200 messages per package. Once the client receives a message package, it parses and notifies the application message by message. The `left` parameter indicates the number of remaining messages in the current package.
  /// - [offline] Specifies whether the message is an offline message.
  /// - [hasPackage] Indicates whether there are undelivered message packages remaining on the server.
  /// ---
  /// 在 Flutter For Web 端 [offline] [hasPackage] 参数永远都为 false，可通过消息体内的 offline 字段判断是否为离线消息
  Function(RCIMIWMessage? message, int? left, bool? offline, bool? hasPackage)? onMessageReceived;

  /// [ZH]
  /// ---
  /// 离线消息同步完成
  /// ---
  /// [EN]
  /// ---
  /// Offline messages synced
  /// ---

  Function()? onOfflineMessageSyncCompleted;

  /// [ZH]
  /// ---
  /// 网络状态变化
  /// - [status] SDK 与融云服务器的连接状态
  /// ---
  /// [EN]
  /// ---
  /// Network Status Change
  /// - [status] Specifies the connection status between the SDK and the RongCloud server.
  /// ---
  Function(RCIMIWConnectionStatus? status)? onConnectionStatusChanged;

  /// [ZH]
  /// ---
  /// 会话状态置顶多端同步监听
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// ---
  /// [EN]
  /// ---
  /// Pin Conversation Status Multi-Device Sync Listener
  /// - [type] Specifies the conversation type.
  /// - [targetId] Indicates the conversation ID.
  /// - [channelId] Represents the channel ID, which is only supported for ultra groups. For other conversation types, pass `null`.
  /// - [top]  Indicates whether the conversation is pinned.
  /// ---
  Function(RCIMIWConversationType? type, String? targetId, String? channelId, bool? top)? onConversationTopStatusSynced;

  /// [ZH]
  /// ---
  /// 会话状态免打扰多端同步监听
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 当前会话通知的类型
  /// ---
  /// [EN]
  /// ---
  /// Conversation Status Do Not Disturb Multi-Device Synchronization Listener
  /// - [type] Specifies the conversation type
  /// - [targetId] Specifies the conversation ID
  /// - [channelId] Specifies the channel ID, supported only for ultra groups. For other conversation types, pass `null`.
  /// - [level] Indicates the current notification type for the conversation
  /// ---
  Function(RCIMIWConversationType? type, String? targetId, String? channelId, RCIMIWPushNotificationLevel? level)?
  onConversationNotificationLevelSynced;

  /// [ZH]
  /// ---
  /// 会话翻译策略多端同步监听
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持ultra group使用，其他conversation type传 null 即可。
  /// - [strategy] 翻译策略
  /// ---
  /// [EN]
  /// ---
  /// Sync translation strategy across devices
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID (ultra group only, set null for other types)
  /// - [strategy] Translation strategy
  /// ---
  Function(RCIMIWConversationType? type, String? targetId, String? channelId, RCIMIWTranslateStrategy? strategy)?
  onConversationTranslationStrategySynced;

  /// [ZH]
  /// ---
  /// 撤回消息监听器
  /// - [message] 原本的消息会变为撤回消息
  /// ---
  /// [EN]
  /// ---
  /// Message Recall Listener
  /// - [message] The original message will be transformed into a recalled message.
  /// ---
  Function(RCIMIWMessage? message)? onRemoteMessageRecalled;

  /// [ZH]
  /// ---
  /// 单聊中收到消息回执的回调。
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 已阅读的最后一条消息的 sendTime
  /// ---
  /// [EN]
  /// ---
  /// Callback triggered when a message receipt is received in a one-to-one chat.
  /// - [targetId] The conversation ID
  /// - [channelId] The channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// - [timestamp] The sendTime of the last read message
  /// ---
  Function(String? targetId, String? channelId, int? timestamp)? onPrivateReadReceiptReceived;

  /// [ZH]
  /// ---
  /// 消息扩展信息更改的回调
  /// - [expansion] 消息扩展信息中更新的键值对，只包含更新的键值对，不是全部的数据。如果想获取全部的键值对，请使用 message 的 expansion 属性。
  /// - [message] 发生变化的消息
  /// ---
  /// [EN]
  /// ---
  /// Callback for Message Extension Information Change
  /// - [expansion] Specifies the key-value pairs updated in the message extension information. Only the updated key-value pairs are included, not the entire dataset. To retrieve all key-value pairs, use the `expansion` property of the `message` object.
  /// - [message] Indicates the message object where the changes occurred.
  /// ---
  /// 在 Flutter For Web 端监听变为 [onRemoteMessageExpansionUpdatedForWeb]
  Function(Map? expansion, RCIMIWMessage? message)? onRemoteMessageExpansionUpdated;

  /// [ZH]
  /// ---
  /// 消息扩展信息删除的回调
  /// - [message] 发生变化的消息
  /// - [keys] 消息扩展信息中删除的键值对 key 列表
  /// ---
  /// [EN]
  /// ---
  /// Callback for Message Extension Information Deletion
  /// - [message] The message that has been modified
  /// - [keys] List of keys deleted from the message extension information
  /// ---
  /// 在 Flutter For Web 端监听变为 [onRemoteMessageExpansionForKeyRemovedForWeb]
  Function(RCIMIWMessage? message, List<String>? keys)? onRemoteMessageExpansionForKeyRemoved;

  /// [ZH]
  /// ---
  /// 聊天室用户进入、退出聊天室监听
  /// - [targetId] 会话 ID
  /// - [actions] 发生的事件
  /// ---
  /// [EN]
  /// ---
  /// Chatroom User Entry and Exit Monitoring
  /// - [targetId] Conversation ID
  /// - [actions] Events that occurred
  /// ---
  Function(String? targetId, List<RCIMIWChatRoomMemberAction>? actions)? onChatRoomMemberChanged;

  /// [ZH]
  /// ---
  /// 会话输入状态发生变化。对于单聊而言，当对方正在输入时，监听会触发一次；当对方不处于输入状态时，该监听还会触发一次，但回调里输入用户列表为空。
  /// - [type] 会话类型
  /// - [targetId]    会话 ID
  /// - [channelId]   频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [userTypingStatus] 发生状态变化的集合
  /// ---
  /// [EN]
  /// ---
  /// The conversation input status has changed. For one-to-one chats, the listener is triggered once when the other party is typing, and it is triggered again when the other party stops typing, but the list of typing users in the callback will be empty.
  /// - [type]   Conversation type
  /// - [targetId]    Conversation ID
  /// - [channelId]   Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [userTypingStatus] Collection of users whose typing status has changed
  /// ---
  Function(
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    List<RCIMIWTypingStatus>? userTypingStatus,
  )?
  onTypingStatusChanged;

  /// [ZH]
  /// ---
  /// 同步消息未读状态监听接口。多端登录，收到其它端清除某一会话未读数通知的时候
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  /// ---
  /// [EN]
  /// ---
  /// Listener interface for synchronizing unread message status. Triggers when a multi-device login occurs and a notification is received from another device clearing the unread count of a specific conversation.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [timestamp] Timestamp
  /// ---
  Function(RCIMIWConversationType? type, String? targetId, int? timestamp)? onConversationReadStatusSyncMessageReceived;

  /// [ZH]
  /// ---
  /// 聊天室 KV 同步完成的回调
  /// - [roomId] 聊天室 ID
  /// ---
  /// [EN]
  /// ---
  /// Chatroom KV Synchronization Completion Callback
  /// - [roomId] The ID of the chatroom.
  /// ---
  /// Flutter For Web 端不支持此回调
  Function(String? roomId)? onChatRoomEntriesSynced;

  /// [ZH]
  /// ---
  /// 聊天室 KV 发生变化的回调
  /// - [operationType] 操作的类型
  /// - [roomId]   聊天室 ID
  /// - [entries]  发送变化的 KV
  /// ---
  /// [EN]
  /// ---
  /// Callback for Chatroom KV Changes
  /// - [operationType] Specifies the type of operation
  /// - [roomId]   Indicates the chatroom ID
  /// - [entries]  Represents the KV that has changed
  /// ---
  Function(RCIMIWChatRoomEntriesOperationType? operationType, String? roomId, Map? entries)? onChatRoomEntriesChanged;

  /// [ZH]
  /// ---
  /// 超级群消息 kv 被更新
  /// - [messages] 被更新的消息集合
  /// ---
  /// [EN]
  /// ---
  /// Supergroup message KV is updated.
  /// - [messages] The collection of messages that have been updated.
  /// ---
  Function(List<RCIMIWMessage>? messages)? onRemoteUltraGroupMessageExpansionUpdated;

  /// [ZH]
  /// ---
  /// 超级群消息被更改
  /// - [messages] 被更新的消息集合
  /// ---
  /// [EN]
  /// ---
  /// Super Group Messages Updated
  /// - [messages] Specifies the collection of updated messages.
  /// ---
  Function(List<RCIMIWMessage>? messages)? onRemoteUltraGroupMessageModified;

  /// [ZH]
  /// ---
  /// 超级群消息被撤回
  /// - [messages] 撤回的消息集合
  /// ---
  /// [EN]
  /// ---
  /// Ultra Group Message Recalled
  /// - [messages] Specifies the collection of messages that have been recalled.
  /// ---
  Function(List<RCIMIWMessage>? messages)? onRemoteUltraGroupMessageRecalled;

  /// [ZH]
  /// ---
  /// 超级群已读的监听
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp]
  /// ---
  /// [EN]
  /// ---
  /// Ultra Group Read Receipt Listener
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID (supported only for ultra groups; for other conversation types, pass `null`).
  /// - [timestamp] Indicates the timestamp of the read receipt.
  /// ---
  Function(String? targetId, String? channelId, int? timestamp)? onUltraGroupReadTimeReceived;

  /// [ZH]
  /// ---
  /// 用户输入状态变化的回调
  /// 当客户端收到用户输入状态的变化时，会回调此接口，通知发生变化的会话以及当前正在输入的RCUltraGroupTypingStatusInfo列表
  /// - [info] 正在输入的RCUltraGroupTypingStatusInfo列表（nil标示当前没有用户正在输入）
  /// ---
  /// [EN]
  /// ---
  /// Callback for User Typing Status Change
  /// This callback is triggered when the client detects a change in the user's typing status. It notifies the affected conversation and provides a list of RCUltraGroupTypingStatusInfo indicating users currently typing.
  /// - [info] List of RCUltraGroupTypingStatusInfo indicating users currently typing (nil indicates no users are currently typing)
  /// ---
  Function(List<RCIMIWUltraGroupTypingStatusInfo>? info)? onUltraGroupTypingStatusChanged;

  /// 语音转文字完成回调
  /// - [info] 语音转文字信息
  /// - [messageUId] 消息唯一 ID
  /// - [code] 错误码，0 代表成功
  Function(RCIMIWSpeechToTextInfo? info, String? messageUId, int? code)? onSpeechToTextCompleted;

  /// [ZH]
  /// ---
  /// 发送含有敏感词消息被拦截的回调
  /// - [info] 被拦截消息的相关信息
  /// ---
  /// [EN]
  /// ---
  /// Callback for Blocked Messages Containing Sensitive Words
  /// - [info] Specifies the details of the blocked message.
  /// ---
  Function(RCIMIWBlockedMessageInfo? info)? onMessageBlocked;

  /// [ZH]
  /// ---
  /// 聊天室状态发生变化的监听
  /// - [targetId] 会话 ID
  /// - [status] 聊天室变化的状态
  /// ---
  /// [EN]
  /// ---
  /// Callback for Chatroom Status Changes
  /// - [targetId] The conversation ID
  /// - [status] The status of the chatroom change
  /// ---
  Function(String? targetId, RCIMIWChatRoomStatus? status)? onChatRoomStatusChanged;

  /// [ZH]
  /// ---
  /// 收到群聊已读回执请求的监听
  /// - [targetId] 会话 ID
  /// - [messageUId] 消息的 messageUid
  /// ---
  /// [EN]
  /// ---
  /// Callback for Receiving Group Chat Read Receipt Request
  /// - [targetId] Conversation ID
  /// - [messageUId] Message's messageUid
  /// ---
  Function(String? targetId, String? messageUId)? onGroupMessageReadReceiptRequestReceived;

  /// [ZH]
  /// ---
  /// 收到群聊已读回执响应的监听
  /// - [targetId] 会话 ID
  /// - [messageUId] 收到回执响应的消息的 messageUId
  /// - [respondUserIds] 会话中响应了此消息的用户列表。其中 key： 用户 id ； value： 响应时间。
  /// ---
  /// [EN]
  /// ---
  /// Listener for Group Chat Read Receipt Response
  /// - [targetId]  Conversation ID
  /// - [messageUId] Message UID of the message for which the read receipt response was received
  /// - [respondUserIds] List of users in the conversation who responded to this message. The key is the user ID, and the value is the response time.
  /// ---
  Function(String? targetId, String? messageUId, Map? respondUserIds)? onGroupMessageReadReceiptResponseReceived;

  /// [ZH]
  /// ---
  /// [connect] 的接口监听，收到链接结果的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 链接成功的用户 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [connect] Interface listener, callback for connection result
  /// - [code] Status code of the interface callback, 0 indicates success, non-zero indicates an exception
  /// - [userId] User ID of the successfully connected user
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId)? onConnected;

  /// [ZH]
  /// ---
  /// [connect] 的接口监听，数据库打开时发生的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [connect] Interface listener, callback triggered when the database is opened.
  /// - [code] Status code of the interface callback, where 0 indicates success and non-zero indicates an exception.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code)? onDatabaseOpened;

  /// [ZH]
  /// ---
  /// [loadConversation] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type]    会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversation] 获取到的会话
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadConversation] Interface Listener
  /// - [code]  Indicates the status code of the interface callback. `0` represents success, while non-zero values indicate an exception.
  /// - [type]  Specifies the conversation type.
  /// - [targetId]   Represents the conversation ID.
  /// - [channelId]  Indicates the channel ID, which is only supported for ultra groups. For other conversation types, pass `null`.
  /// - [conversation] Represents the retrieved conversation.
  /// @deprecated  Please use the corresponding interface's callback to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWConversation? conversation,
  )?
  onConversationLoaded;

  /// [ZH]
  /// ---
  /// [loadConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，
  /// - [startTime]    时间戳（毫秒）
  /// - [count]   查询的数量
  /// - [conversations] 查询到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadConversations] Interface Listener
  /// - [code]    Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId]    Represents the channel ID, only supported for ultra groups.
  /// - [startTime]    Specifies the timestamp in milliseconds.
  /// - [count]   Indicates the number of queries.
  /// - [conversations] Represents the collection of queried conversations.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    int? startTime,
    int? count,
    List<RCIMIWConversation>? conversations,
  )?
  onConversationsLoaded;

  /// [ZH]
  /// ---
  /// [removeConversation] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Interface Monitoring for [removeConversation]
  /// - [code]  Indicates the status code of the interface callback. `0` represents success, while a non-zero value indicates an exception.
  /// - [type]  Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Indicates the channel ID, which is only supported for ultra groups. For other conversation types, pass `null`.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId)? onConversationRemoved;

  /// [ZH]
  /// ---
  /// [removeConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [removeConversations] Interface Listener
  /// - [code]    Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId]    Represents the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWConversationType>? conversationTypes, String? channelId)? onConversationsRemoved;

  /// [ZH]
  /// ---
  /// [loadTotalUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadTotalUnreadCount] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [count] Represents the unread count.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? channelId, int? count)? onTotalUnreadCountLoaded;

  /// [ZH]
  /// ---
  /// [loadUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUnreadCount] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [count] Indicates the unread count.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? count)?
  onUnreadCountLoaded;

  /// [ZH]
  /// ---
  /// [loadUnreadCountByConversationTypes] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [count]   未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [loadUnreadCountByConversationTypes] interface
  /// - [code]    Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId]    Specifies the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [contain]      Indicates whether to include the unread count of messages in Do Not Disturb mode.
  /// - [count]   Specifies the unread count.
  /// @deprecated    Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWConversationType>? conversationTypes, String? channelId, bool? contain, int? count)?
  onUnreadCountByConversationTypesLoaded;

  /// [ZH]
  /// ---
  /// [loadUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUnreadMentionedCount] Interface Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [count] Indicates the count of unread mentions.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? count)?
  onUnreadMentionedCountLoaded;

  /// [ZH]
  /// ---
  /// [loadUltraGroupAllUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUltraGroupAllUnreadMentionedCount] Event Listener
  /// - [code] The status code of the interface callback. 0 indicates success, while non-zero indicates an exception.
  /// - [count] The count of unread mentions.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? count)? onUltraGroupAllUnreadCountLoaded;

  /// [ZH]
  /// ---
  /// [loadUltraGroupAllUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUltraGroupAllUnreadMentionedCount] Interface Listener
  /// - [code] Indicates the status code of the interface callback, where 0 represents success and non-zero indicates an exception.
  /// - [count] Specifies the number of unread mentions.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? count)? onUltraGroupAllUnreadMentionedCountLoaded;

  /// [ZH]
  /// ---
  /// 超级群列表同步完成的回调
  /// ---
  /// [EN]
  /// ---
  /// Callback for Ultra Group List Synchronization Completion
  /// ---

  Function()? onUltraGroupConversationsSynced;

  /// [ZH]
  /// ---
  /// [clearUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话已阅读的最后一条消息的发送时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [clearUnreadCount] interface
  /// - [code] Indicates the status code of the callback. 0 represents success, non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [timestamp] Indicates the timestamp of the last read message in the conversation.
  /// @deprecated Use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? timestamp)?
  onUnreadCountCleared;

  /// [ZH]
  /// ---
  /// [saveDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿信息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [saveDraftMessage] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [draft] Contains the draft information.
  /// @deprecated Use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, String? draft)?
  onDraftMessageSaved;

  /// [ZH]
  /// ---
  /// [clearDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [clearDraftMessage] Interface Listener
  /// - [code] The status code of the interface callback. 0 indicates success, while non-zero indicates an exception.
  /// - [type] The type of conversation.
  /// - [targetId] The ID of the conversation.
  /// - [channelId] The ID of the channel. Only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId)? onDraftMessageCleared;

  /// [ZH]
  /// ---
  /// [loadDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿信息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadDraftMessage] Interface Listener
  /// - [code] Status code of the interface callback. 0 indicates success, non-zero indicates an exception.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [draft] Draft information
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, String? draft)?
  onDraftMessageLoaded;

  /// [ZH]
  /// ---
  /// [loadBlockedConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversations] 获取到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadBlockedConversations] Interface Listener
  /// - [code]    Indicates the status code of the interface callback. 0 represents success, and non-zero indicates an exception.
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId]    Represents the channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [conversations] Specifies the collection of conversations retrieved.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWConversation>? conversations,
  )?
  onBlockedConversationsLoaded;

  /// [ZH]
  /// ---
  /// [changeConversationTopStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeConversationTopStatus] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 indicates success, while non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, supported only for ultra groups. Pass null for other conversation types.
  /// - [top]  Indicates whether the conversation is pinned to the top.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, bool? top)?
  onConversationTopStatusChanged;

  /// [ZH]
  /// ---
  /// [loadConversationTopStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Interface Listener for [loadConversationTopStatus]
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero values indicate an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Indicates the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [top]  Specifies whether the conversation is pinned to the top.
  /// @deprecated Please use the corresponding interface's callback to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, bool? top)?
  onConversationTopStatusLoaded;

  /// [ZH]
  /// ---
  /// [syncConversationReadStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 会话中已读的最后一条消息的发送时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [syncConversationReadStatus] interface
  /// - [code] Status code of the interface callback. 0 indicates success, non-zero indicates an exception.
  /// - [type] Conversation type
  /// - [targetId] Conversation ID
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [timestamp] Timestamp of the last read message in the conversation
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? timestamp)?
  onConversationReadStatusSynced;

  /// [ZH]
  /// ---
  /// [sendMessage] 的接口监听
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [sendMessage] Event Listener
  /// - [message] The message being sent
  /// @deprecated Use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMessage? message)? onMessageAttached;

  /// [ZH]
  /// ---
  /// [sendMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [sendMessage] Interface Listener
  /// - [code] The status code of the interface callback. 0 indicates success, non-zero indicates an exception.
  /// - [message] The message that was sent.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onMessageSent;

  /// [ZH]
  /// ---
  /// [sendMediaMessage] 的接口监听
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [sendMediaMessage] interface
  /// - [message] The message being sent
  /// @deprecated Use the callback provided by the corresponding interface to get the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMediaMessage? message)? onMediaMessageAttached;

  /// [ZH]
  /// ---
  /// [sendMediaMessage] 的接口监听
  /// - [message] 发送的消息
  /// - [progress] 发送的进度
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [sendMediaMessage] Event Listener
  /// - [message] The message being sent
  /// - [progress] The progress of the message sending
  /// @deprecated Use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageSending;

  /// [ZH]
  /// ---
  /// [cancelSendingMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [cancelSendingMediaMessage] Event Listener
  /// - [code] Indicates the status code of the callback, where 0 represents success and non-zero indicates an exception.
  /// - [message] Specifies the message being sent.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onSendingMediaMessageCanceled;

  /// [ZH]
  /// ---
  /// [sendMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for [sendMediaMessage] interface
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [message] Represents the message being sent.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onMediaMessageSent;

  /// [ZH]
  /// ---
  /// [downloadMediaMessage] 的接口监听
  /// - [message] 下载的消息
  /// - [progress] 下载的进度
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [downloadMediaMessage] Event Listener
  /// - [message] The message to be downloaded
  /// - [progress] The download progress
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageDownloading;

  /// [ZH]
  /// ---
  /// [downloadMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 下载的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [downloadMediaMessage] Event Listener
  /// - [code] Indicates the status code of the callback, where 0 represents success and non-zero indicates an exception.
  /// - [message] Specifies the downloaded message.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onMediaMessageDownloaded;

  /// [ZH]
  /// ---
  /// [cancelDownloadingMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 取消下载的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [cancelDownloadingMediaMessage] Interface Listener
  /// - [code] The status code of the interface callback. 0 indicates success, non-zero indicates an exception.
  /// - [message] The message for which the download was canceled.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onDownloadingMediaMessageCanceled;

  /// [ZH]
  /// ---
  /// [loadMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [messages] 获取到的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadMessages] Interface Listener
  /// - [code] The status code of the interface callback. 0 indicates success, while non-zero indicates an exception.
  /// - [type] The type of the conversation.
  /// - [targetId] The ID of the conversation.
  /// - [channelId] The channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [sentTime] The timestamp of the current message.
  /// - [order] The direction in which messages are retrieved. BEFORE: Retrieve messages before sentTime (in descending order). AFTER: Retrieve messages after sentTime (in ascending order).
  /// - [messages] The collection of retrieved messages.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? sentTime,
    RCIMIWTimeOrder? order,
    List<RCIMIWMessage>? messages,
  )?
  onMessagesLoaded;

  /// [ZH]
  /// ---
  /// [loadUnreadMentionedMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 获取到的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUnreadMentionedMessages] Interface Listener
  /// - [code] The status code of the interface callback, where 0 indicates success and non-zero indicates an exception.
  /// - [type] The type of conversation.
  /// - [targetId] The ID of the conversation.
  /// - [channelId] The channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [messages] The collection of messages retrieved.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, List<RCIMIWMessage>? messages)?
  onUnreadMentionedMessagesLoaded;

  /// [ZH]
  /// ---
  /// [loadFirstUnreadMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [message] 获取到的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadFirstUnreadMessage] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [message] Represents the retrieved message.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, RCIMIWMessage? message)?
  onFirstUnreadMessageLoaded;

  /// [ZH]
  /// ---
  /// [insertMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 插入的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [insertMessage] Interface Listener
  /// - [code] The status code of the interface callback. 0 indicates success, while non-zero values indicate an exception.
  /// - [message] The inserted message.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onMessageInserted;

  /// [ZH]
  /// ---
  /// [insertMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messages] 插入的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [insertMessages] Interface Listener
  /// - [code] Indicates the status code of the interface callback, where 0 represents success and non-zero indicates an exception.
  /// - [messages] Specifies the collection of messages inserted.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWMessage>? messages)? onMessagesInserted;

  /// [ZH]
  /// ---
  /// [clearMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [clearMessages] Event Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [timestamp] Indicates the timestamp.
  /// @deprecated Use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? timestamp)?
  onMessagesCleared;

  /// [ZH]
  /// ---
  /// [deleteLocalMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messages] 删除的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [deleteLocalMessages] Event Listener
  /// - [code] Indicates the status code of the callback, where 0 represents success and non-zero indicates an exception.
  /// - [messages] Specifies the collection of deleted messages.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWMessage>? messages)? onLocalMessagesDeleted;

  /// [ZH]
  /// ---
  /// [deleteMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 删除的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [deleteMessages] Event Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Indicates the channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [messages] Represents the collection of deleted messages.
  /// @deprecated Use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, List<RCIMIWMessage>? messages)?
  onMessagesDeleted;

  /// [ZH]
  /// ---
  /// [recallMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 撤回的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [recallMessage] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [message] Specifies the message that was recalled.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onMessageRecalled;

  /// [ZH]
  /// ---
  /// [sendPrivateReadReceiptMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Event listener for the [sendPrivateReadReceiptMessage] interface.
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Represents the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [timestamp] Specifies the timestamp.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, int? timestamp)? onPrivateReadReceiptMessageSent;

  /// [ZH]
  /// ---
  /// [updateMessageExpansion] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [updateMessageExpansion] Interface Listener
  /// - [code]  Indicates the status code of the interface callback. 0 represents success, while non-zero values indicate exceptions.
  /// - [messageUId] Specifies the messageUid of the message.
  /// - [expansion] Represents the key-value pairs of the message expansion information to be updated, of type HashMap.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId, Map? expansion)? onMessageExpansionUpdated;

  /// [ZH]
  /// ---
  /// [removeMessageExpansionForKeys] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [removeMessageExpansionForKeys] interface.
  /// - [code]  Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [messageUId] Specifies the messageUid of the message.
  /// - [keys]  Represents the list of keys to be removed from the message's expansion information. The type is ArrayList.
  /// @deprecated Use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId, List<String>? keys)? onMessageExpansionForKeysRemoved;

  /// [ZH]
  /// ---
  /// [changeMessageReceiveStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageId] 消息的 messageId
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeMessageReceiveStatus] Interface Listener
  /// - [code] Status code of the interface callback, where 0 indicates success and non-zero indicates an exception
  /// - [messageId] The messageId of the message
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? messageId)? onMessageReceiveStatusChanged;

  /// [ZH]
  /// ---
  /// [changeMessageSentStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageId] 消息的 messageId
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeMessageSentStatus] Event Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero indicates an exception.
  /// - [messageId] Specifies the messageId of the message.
  /// @deprecated Use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? messageId)? onMessageSentStatusChanged;

  /// [ZH]
  /// ---
  /// [joinChatRoom] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [joinChatRoom] interface listener
  /// - [code] Status code of the interface callback, where 0 indicates success and non-zero indicates an exception
  /// - [targetId] Conversation ID
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId)? onChatRoomJoined;

  /// [ZH]
  /// ---
  /// 正在加入聊天室的回调
  /// - [targetId] 聊天室 ID
  /// ---
  /// [EN]
  /// ---
  /// Callback for Joining a Chatroom
  /// - [targetId] Specifies the ID of the chatroom.
  /// ---
  Function(String? targetId)? onChatRoomJoining;

  /// [ZH]
  /// ---
  /// [leaveChatRoom] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [leaveChatRoom] Event Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero values indicate an exception.
  /// - [targetId] Specifies the conversation ID.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId)? onChatRoomLeft;

  /// [ZH]
  /// ---
  /// [loadChatRoomMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [messages] 加载到的消息
  /// - [syncTime] 下次拉取的时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadChatRoomMessages] Event Listener
  /// - [code] Indicates the status code of the callback. A value of 0 represents success, while any non-zero value indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [messages] Represents the loaded messages.
  /// - [syncTime] Indicates the timestamp for the next pull operation.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, List<RCIMIWMessage>? messages, int? syncTime)? onChatRoomMessagesLoaded;

  /// [ZH]
  /// ---
  /// [addChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性名称
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [addChatRoomEntry] Interface Listener
  /// - [code] Status code of the interface callback, where 0 indicates success and non-zero indicates an exception.
  /// - [targetId] Conversation ID
  /// - [key] Name of the chatroom attribute
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? key)? onChatRoomEntryAdded;

  /// [ZH]
  /// ---
  /// [addChatRoomEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entries] 聊天室属性
  /// - [errorEntries] 发生错误的属性
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [addChatRoomEntries] Event Listener
  /// - [code]    Indicates the status code of the callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [entries] Represents the chatroom attributes.
  /// - [errorEntries] Indicates the attributes that encountered errors.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, Map? entries, Map? errorEntries)? onChatRoomEntriesAdded;

  /// [ZH]
  /// ---
  /// [loadChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entry] 获取到的属性。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadChatRoomEntry] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero values indicate exceptions.
  /// - [targetId] Specifies the conversation ID.
  /// - [entry] Represents the retrieved attributes.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, Map? entry)? onChatRoomEntryLoaded;

  /// [ZH]
  /// ---
  /// [loadChatRoomAllEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entries] 获取到的属性集合。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadChatRoomAllEntries] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [entries] Represents the collection of retrieved attributes.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, Map? entries)? onChatRoomAllEntriesLoaded;

  /// [ZH]
  /// ---
  /// [removeChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性键值
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [removeChatRoomEntry] Event Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [key] Represents the key of the chatroom attribute.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? key)? onChatRoomEntryRemoved;

  /// [ZH]
  /// ---
  /// [removeChatRoomEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [keys] 聊天室属性键值集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [removeChatRoomEntries] Event Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero values indicate an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [keys] Represents the collection of chatroom attribute key-value pairs.
  /// @deprecated Use the callback provided by the corresponding interface to retrieve the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, List<String>? keys)? onChatRoomEntriesRemoved;

  /// [ZH]
  /// ---
  /// [addToBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [addToBlacklist] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [userId] Specifies the user ID.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId)? onBlacklistAdded;

  /// [ZH]
  /// ---
  /// [removeFromBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [removeFromBlacklist] Event Listener
  /// - [code] Indicates the status code of the callback. 0 represents success, non-zero indicates an exception.
  /// - [userId] Specifies the user ID.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId)? onBlacklistRemoved;

  /// [ZH]
  /// ---
  /// [loadBlacklistStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  /// - [status] 当前状态
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadBlacklistStatus] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [userId] Represents the user ID.
  /// - [status] Specifies the current status.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId, RCIMIWBlacklistStatus? status)? onBlacklistStatusLoaded;

  /// [ZH]
  /// ---
  /// [loadBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userIds] 用户 ID 集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadBlacklist] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [userIds] Represents a collection of user IDs.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<String>? userIds)? onBlacklistLoaded;

  /// [ZH]
  /// ---
  /// [searchMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 查询 beginTime 之前的消息
  /// - [count] 查询的数量
  /// - [messages] 查询到的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [searchMessages] interface
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [keyword] Represents the search keyword.
  /// - [startTime] Specifies the start time for querying messages before this timestamp.
  /// - [count] Indicates the number of messages to query.
  /// - [messages] Represents the collection of messages retrieved from the query.
  /// @deprecated Use the corresponding interface's callback to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    String? keyword,
    int? startTime,
    int? count,
    List<RCIMIWMessage>? messages,
  )?
  onMessagesSearched;

  /// [ZH]
  /// ---
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
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [searchMessagesByTimeRange] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [keyword] Specifies the search keyword.
  /// - [startTime] Indicates the start time.
  /// - [endTime] Indicates the end time.
  /// - [offset] Specifies the offset.
  /// - [count] Specifies the number of messages to query.
  /// - [messages] Represents the collection of messages retrieved from the query.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
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
  )?
  onMessagesSearchedByTimeRange;

  /// [ZH]
  /// ---
  /// [searchMessagesByUserId] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 id
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [startTime] 查询记录的起始时间
  /// - [count] 查询的数量
  /// - [messages] 查询到的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [searchMessagesByUserId] interface
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [userId] Specifies the user ID.
  /// - [type] Indicates the conversation type.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. Pass null for other conversation types.
  /// - [startTime] Specifies the start time for querying records.
  /// - [count] Specifies the number of messages to query.
  /// - [messages] Represents the collection of messages retrieved from the query.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    String? userId,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    int? startTime,
    int? count,
    List<RCIMIWMessage>? messages,
  )?
  onMessagesSearchedByUserId;

  /// [ZH]
  /// ---
  /// [searchConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageTypes] 搜索的消息类型
  /// - [keyword]      搜索的关键字
  /// - [conversations] 查询到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [searchConversations] Interface Listener
  /// - [code]    Indicates the status code of the interface callback. 0 represents success, non-0 indicates an exception.
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId]    Represents the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [messageTypes] Specifies the message types to be searched.
  /// - [keyword]      Represents the keyword for the search.
  /// - [conversations] Indicates the collection of conversations retrieved from the query.
  /// @deprecated    Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWMessageType>? messageTypes,
    String? keyword,
    List<RCIMIWSearchConversationResult>? conversations,
  )?
  onConversationsSearched;

  /// [ZH]
  /// ---
  /// sendGroupReadReceiptRequest 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 需要请求已读回执的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// sendGroupReadReceiptRequest Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [message] Specifies the message for which the read receipt is requested.
  /// @deprecated Use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onGroupReadReceiptRequestSent;

  /// [ZH]
  /// ---
  /// [sendGroupReadReceiptResponse] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 会话中需要发送已读回执的消息列表
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [sendGroupReadReceiptResponse] interface
  /// - [code] Indicates the status code of the callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [messages] Indicates the list of messages in the conversation for which read receipts need to be sent.
  /// @deprecated Use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, List<RCIMIWMessage>? messages)?
  onGroupReadReceiptResponseSent;

  /// [ZH]
  /// ---
  /// [changeNotificationQuietHours] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [startTime] 开始消息免打扰时间
  /// - [spanMinutes] 需要消息免打扰分钟数，0 < spanMinutes < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为 01:00，则 spanMinutes 为 60 分钟。设置为 1439 代表全天免打扰 （23 60 + 59 = 1439 ））
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeNotificationQuietHours] Interface Callback
  /// - [code] The status code of the interface callback. 0 indicates success, while non-zero indicates an exception.
  /// - [startTime] The start time for message Do Not Disturb.
  /// - [spanMinutes] The duration in minutes for message Do Not Disturb. 0 < spanMinutes < 1440 (For example, if the start time is 00:00 and the end time is 01:00, spanMinutes would be 60 minutes. Setting it to 1439 represents a full day of Do Not Disturb (23 60 + 59 = 1439)).
  /// - [level] The message notification level.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? startTime, int? spanMinutes, RCIMIWPushNotificationQuietHoursLevel? level)?
  onNotificationQuietHoursChanged;

  /// [ZH]
  /// ---
  /// [removeNotificationQuietHours] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [removeNotificationQuietHours] Callback
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero indicates an exception.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code)? onNotificationQuietHoursRemoved;

  /// [ZH]
  /// ---
  /// [loadNotificationQuietHours] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [startTime] 开始消息免打扰时间
  /// - [spanMinutes] 已设置的屏蔽时间分钟数，0 < spanMinutes < 1440
  /// - [level]  消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadNotificationQuietHours] Interface Callback
  /// - [code]   Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [startTime] Specifies the start time of the message Do Not Disturb period.
  /// - [spanMinutes] Represents the duration of the set quiet hours in minutes, where 0 < spanMinutes < 1440.
  /// - [level]  Indicates the message notification level.
  /// @deprecated Please use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? startTime, int? spanMinutes, RCIMIWPushNotificationQuietHoursLevel? level)?
  onNotificationQuietHoursLoaded;

  /// [ZH]
  /// ---
  /// [changeConversationNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeConversationNotificationLevel] Interface Callback
  /// - [code] Status code of the interface callback. 0 indicates success, non-zero indicates an exception.
  /// - [type] Conversation type.
  /// - [targetId] Conversation ID.
  /// - [channelId] Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// - [level] Message notification level.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )?
  onConversationNotificationLevelChanged;

  /// [ZH]
  /// ---
  /// [loadConversationNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 当前会话的消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadConversationNotificationLevel] Interface Callback
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero values indicate exceptions.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Indicates the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [level] Specifies the current conversation's message notification level.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )?
  onConversationNotificationLevelLoaded;

  /// [ZH]
  /// ---
  /// [changeConversationTypeNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeConversationTypeNotificationLevel] Callback
  /// - [code] The status code of the callback, where 0 indicates success and non-zero indicates an exception
  /// - [type] The type of conversation
  /// - [level] The notification level for messages
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, RCIMIWPushNotificationLevel? level)?
  onConversationTypeNotificationLevelChanged;

  /// [ZH]
  /// ---
  /// [loadConversationTypeNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadConversationTypeNotificationLevel] Interface Callback
  /// - [code] The status code of the interface callback, where 0 indicates success and non-zero indicates an exception
  /// - [type] The type of conversation
  /// - [level] The notification level of the message
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, RCIMIWPushNotificationLevel? level)?
  onConversationTypeNotificationLevelLoaded;

  /// [ZH]
  /// ---
  /// [changeUltraGroupDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeUltraGroupDefaultNotificationLevel] Interface Callback
  /// - [code] The status code of the interface callback. 0 indicates success, non-zero indicates an exception.
  /// - [targetId] The conversation ID.
  /// - [level] The message notification level.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, RCIMIWPushNotificationLevel? level)?
  onUltraGroupDefaultNotificationLevelChanged;

  /// [ZH]
  /// ---
  /// [loadUltraGroupDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUltraGroupDefaultNotificationLevel] Callback
  /// - [code] Indicates the status code of the callback. 0 represents success, while non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [level] Represents the notification level of the message.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, RCIMIWPushNotificationLevel? level)? onUltraGroupDefaultNotificationLevelLoaded;

  /// [ZH]
  /// ---
  /// [changeUltraGroupChannelDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changeUltraGroupChannelDefaultNotificationLevel] Interface Callback
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Represents the channel ID, which is only supported for ultra groups.
  /// - [level] Specifies the message notification level.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, RCIMIWPushNotificationLevel? level)?
  onUltraGroupChannelDefaultNotificationLevelChanged;

  /// [ZH]
  /// ---
  /// [loadUltraGroupChannelDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUltraGroupChannelDefaultNotificationLevel] Interface Callback
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Represents the channel ID, which is only supported for ultra groups.
  /// - [level] Indicates the message notification level.
  /// @deprecated Please use the corresponding interface's callback to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, RCIMIWPushNotificationLevel? level)?
  onUltraGroupChannelDefaultNotificationLevelLoaded;

  /// [ZH]
  /// ---
  /// [changePushContentShowStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [showContent] 是否显示远程推送内容
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [changePushContentShowStatus] Interface Listener
  /// - [code]   Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [showContent] Specifies whether to display the content of remote push notifications.
  /// @deprecated   Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, bool? showContent)? onPushContentShowStatusChanged;

  /// [ZH]
  /// ---
  /// [changePushLanguage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [language] 推送语言
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [changePushLanguage] interface
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [language] Specifies the push notification language.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? language)? onPushLanguageChanged;

  /// [ZH]
  /// ---
  /// [changePushReceiveStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [receive] 是否接收
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [changePushReceiveStatus] interface
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero represents an exception.
  /// - [receive] Specifies whether to receive push notifications.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, bool? receive)? onPushReceiveStatusChanged;

  /// [ZH]
  /// ---
  /// [loadMessageCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 消息的数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadMessageCount] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [type] Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [channelId] Indicates the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [count] Specifies the number of messages.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? count)?
  onMessageCountLoaded;

  /// [ZH]
  /// ---
  /// [loadTopConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversations] 加载的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadTopConversations] Interface Listener
  /// - [code]    Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [conversationTypes] Specifies the collection of conversation types.
  /// - [channelId]     Represents the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// - [conversations] Represents the collection of loaded conversations.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWConversation>? conversations,
  )?
  onTopConversationsLoaded;

  /// [ZH]
  /// ---
  /// [sendGroupMessageToDesignatedUsers] 的接口监听
  /// 消息存入数据库的回调
  /// - [message] 发送的消息内容
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [`sendGroupMessageToDesignatedUsers`] Callback
  /// Callback for message storage in the database
  /// - [message] Specifies the content of the sent message
  /// @deprecated Use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMessage? message)? onGroupMessageToDesignatedUsersAttached;

  /// [ZH]
  /// ---
  /// [sendGroupMessageToDesignatedUsers] 的接口监听
  /// 消息发送完成的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息内容
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [sendGroupMessageToDesignatedUsers] Callback
  /// Callback triggered when the message sending is completed.
  /// - [code] The status code of the callback, where 0 indicates success and non-zero indicates an exception.
  /// - [message] The content of the sent message.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onGroupMessageToDesignatedUsersSent;

  /// [ZH]
  /// ---
  /// [syncUltraGroupReadStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 已读时间
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [syncUltraGroupReadStatus] interface
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID. Only supported for ultra groups. Pass null for other conversation types.
  /// - [timestamp] Represents the read timestamp.
  /// @deprecated Use the callback provided by the corresponding interface to retrieve the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, int? timestamp)? onUltraGroupReadStatusSynced;

  /// [ZH]
  /// ---
  /// [loadConversationsForAllChannel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type]     会话类型
  /// - [targetId] 会话 ID
  /// - [conversations] 获取到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadConversationsForAllChannel] Interface Listener
  /// - [code]     Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [type]     Specifies the conversation type.
  /// - [targetId] Represents the conversation ID.
  /// - [conversations] Indicates the collection of retrieved conversations.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, List<RCIMIWConversation>? conversations)?
  onConversationsLoadedForAllChannel;

  /// [ZH]
  /// ---
  /// [loadUltraGroupUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUltraGroupUnreadMentionedCount] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [count] Represents the number of unread mentions.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, int? count)? onUltraGroupUnreadMentionedCountLoaded;

  /// [ZH]
  /// ---
  /// [loadUltraGroupUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadUltraGroupUnreadCount] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [count] Represents the number of unread mentions.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, int? count)? onUltraGroupUnreadCountLoaded;

  /// [ZH]
  /// ---
  /// [modifyUltraGroupMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [modifyUltraGroupMessage] Event Listener
  /// - [code]  Indicates the status code of the callback. 0 represents success, non-zero indicates an exception.
  /// - [messageUId] Specifies the messageUid of the message.
  /// @deprecated  Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId)? onUltraGroupMessageModified;

  /// [ZH]
  /// ---
  /// [recallUltraGroupMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 撤回的消息
  /// - [deleteRemote] 调用接口时传入的是否删除远端消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [recallUltraGroupMessage] Event Listener
  /// - [code]    Indicates the status code of the callback. 0 represents success, non-zero indicates an exception.
  /// - [message] Specifies the message that was recalled.
  /// - [deleteRemote] Indicates whether the remote message should be deleted, as passed in the API call.
  /// @deprecated    Use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message, bool? deleteRemote)? onUltraGroupMessageRecalled;

  /// [ZH]
  /// ---
  /// [clearUltraGroupMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// - [policy] 清除策略
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [clearUltraGroupMessages] Interface Listener
  /// - [code] Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Specifies the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [timestamp] Represents the timestamp.
  /// - [policy] Specifies the clearing policy.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, int? timestamp, RCIMIWMessageOperationPolicy? policy)?
  onUltraGroupMessagesCleared;

  /// [ZH]
  /// ---
  /// [clearUltraGroupMessagesForAllChannel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [clearUltraGroupMessagesForAllChannel] Interface Listener
  /// - [code] Indicates the status code of the interface callback, where 0 represents success and non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [timestamp] Represents the timestamp.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, int? timestamp)? onUltraGroupMessagesClearedForAllChannel;

  /// [ZH]
  /// ---
  /// [sendUltraGroupTypingStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [typingStatus] 输入状态枚举
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// Listener for the [sendUltraGroupTypingStatus] interface
  /// - [code]    Indicates the status code of the interface callback. 0 represents success, non-zero indicates an exception.
  /// - [targetId] Specifies the conversation ID.
  /// - [channelId] Represents the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// - [typingStatus] Specifies the typing status enumeration.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, RCIMIWUltraGroupTypingStatus? typingStatus)?
  onUltraGroupTypingStatusSent;

  /// [ZH]
  /// ---
  /// [loadBatchRemoteUltraGroupMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [matchedMessages] 从服务获取的消息列表
  /// - [notMatchedMessages] 非法参数或者从服务没有拿到对应消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [loadBatchRemoteUltraGroupMessages] Interface Listener
  /// - [code]     Indicates the status code of the interface callback. 0 represents success, while non-zero indicates an exception.
  /// - [matchedMessages] Represents the list of messages retrieved from the service.
  /// - [matchedMessages] Specifies messages that were not retrieved due to invalid parameters or absence from the service.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the results.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWMessage>? matchedMessages, List<RCIMIWMessage>? notMatchedMessages)?
  onBatchRemoteUltraGroupMessagesLoaded;

  /// [ZH]
  /// ---
  /// [updateUltraGroupMessageExpansion] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [expansion] 更新的消息扩展信息键值对
  /// - [messageUId] 消息的 messageUid
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [updateUltraGroupMessageExpansion] Event Listener
  /// - [code]  Indicates the status code of the callback, where 0 represents success and non-zero indicates an exception.
  /// - [expansion] Specifies the key-value pairs of the updated message expansion information.
  /// - [messageUId] Represents the messageUid of the message.
  /// @deprecated  Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, Map? expansion, String? messageUId)? onUltraGroupMessageExpansionUpdated;

  /// [ZH]
  /// ---
  /// [removeUltraGroupMessageExpansionForKeys] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [keys]  消息扩展信息中待删除的 key 的列表
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  /// ---
  /// [EN]
  /// ---
  /// [removeUltraGroupMessageExpansionForKeys] Interface Listener
  /// - [code]  Indicates the status code of the interface callback. 0 indicates success, while non-zero indicates an exception.
  /// - [messageUId] Specifies the messageUid of the message.
  /// - [keys]  Represents the list of keys to be removed from the message expansion information.
  /// @deprecated Please use the callback provided by the corresponding interface to obtain the result.
  /// ---
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId, List<String>? keys)? onUltraGroupMessageExpansionForKeysRemoved;

  /// [ZH]
  /// ---
  /// group操作回调
  /// - [groupId] 群组ID
  /// - [operatorInfo] 操作者信息。服务端 api 操作踢出时为空。
  /// - [groupInfo] 群组信息，仅在操作类型为创建群组时有效。
  /// - [operation] 操作类型
  /// - [memberInfos] 目标用户信息列表
  /// - [operation]Time 操作时间
  /// ---
  /// [EN]
  /// ---
  /// Group operation callback
  /// - [groupId] Group ID
  /// - [operatorInfo] Operator info. Empty when kicked via server API.
  /// - [groupInfo] Group details. Only valid for create-group operations.
  /// - [operation] Operation type
  /// - [memberInfos] Target user info list
  /// - [operation]Time Operation timestamp
  /// ---
  Function(
    String? groupId,
    RCIMIWGroupMemberInfo? operatorInfo,
    RCIMIWGroupInfo? groupInfo,
    RCIMIWGroupOperation? operation,
    List<RCIMIWGroupMemberInfo>? memberInfos,
    int? operationTime,
  )?
  onGroupOperation;

  /// [ZH]
  /// ---
  /// 群组资料变更回调
  /// - [operatorInfo] 操作人用户信息
  /// - [fullGroupInfo] 群组信息。注意：只有包含在 updateKeys 中的属性值有效
  /// - [changedGroupInfo] 变更的群组信息
  /// - [operationTime] 操作时间。
  /// ---
  /// [EN]
  /// ---
  /// Group info change callback
  /// - [operatorInfo] Operator's user info
  /// - [fullGroupInfo] Group details. Note: Only properties in updateKeys are valid
  /// - [changedGroupInfo] Modified group data
  /// - [operationTime] Timestamp of the operation
  /// ---
  Function(
    RCIMIWGroupMemberInfo? operatorInfo,
    RCIMIWGroupInfo? fullGroupInfo,
    RCIMIWGroupInfo? changedGroupInfo,
    int? operationTime,
  )?
  onGroupInfoChanged;

  /// [ZH]
  /// ---
  /// 群成员资料变更回调
  /// - [groupId] 群组 ID
  /// - [operatorInfo] 操作者信息
  /// - [memberInfo] 有变更的群成员资料
  /// - [operationTime] 操作时间
  /// ---
  /// [EN]
  /// ---
  /// Group member profile change callback
  /// - [groupId] Group ID
  /// - [operatorInfo] Operator details
  /// - [memberInfo] Changed member profile
  /// - [operationTime] Operation timestamp
  /// ---
  Function(String? groupId, RCIMIWGroupMemberInfo? operatorInfo, RCIMIWGroupMemberInfo? memberInfo, int? operationTime)?
  onGroupMemberInfoChanged;

  /// [ZH]
  /// ---
  /// 群申请事件回调
  /// - [info] 包含以下事件： 用户申请加入群组的*申请*或*结果*；邀请加入群组p的*申请*或*结果*
  /// ---
  /// [EN]
  /// ---
  /// Group request event callback
  /// - [info] Covers: *requests* or *results* for joining groups, and *invitations* or *responses* to join groups
  /// ---
  Function(RCIMIWGroupApplicationInfo? info)? onGroupApplicationEvent;

  /// [ZH]
  /// ---
  /// 群备注名更新多端同步回调事件
  /// - [groupId] 群组ID
  /// - [operationType] 操作类型，添加或移除
  /// - [groupRemark] 群备注名
  /// - [operationTime] 操作时间
  /// ---
  /// [EN]
  /// ---
  /// Multi-device sync callback for group remark updates
  /// - [groupId] Group ID
  /// - [operationType] Add or remove operation
  /// - [groupRemark] Group remark name
  /// - [operationTime] Timestamp of the operation
  /// ---
  Function(String? groupId, RCIMIWGroupOperationType? operationType, String? groupRemark, int? operationTime)?
  onGroupRemarkChangedSync;

  /// [ZH]
  /// ---
  /// 群成员特别关注变更多端同步回调事件
  /// - [groupId] 群组 ID
  /// - [operationType] 操作类型，添加或移除
  /// - [userIds] 用户ID列表
  /// - [operationTime] 操作时间
  /// ---
  /// [EN]
  /// ---
  /// Cross-device sync callback for member watchlist changes
  /// - [groupId] Group ID
  /// - [operationType] Add or remove operation
  /// - [userIds] List of user IDs
  /// - [operationTime] Timestamp of the operation
  /// ---
  Function(String? groupId, RCIMIWGroupOperationType? operationType, List<String>? userIds, int? operationTime)?
  onGroupFollowsChangedSync;

  /// [ZH]
  /// ---
  /// 多端登录相关事件通知回调
  /// - [event] 同步事件信息
  /// ---
  /// [EN]
  /// ---
  /// Callback for multi-device login events
  /// - [event] Synchronization event details
  /// ---
  Function(RCIMIWChatRoomSyncEvent? event)? onChatRoomNotifyMultiLoginSync;

  /// [ZH]
  /// ---
  /// 封禁用户相关事件通知回调
  /// - [event] 封禁事件信息
  /// ---
  /// [EN]
  /// ---
  /// Callback for banned user events
  /// - [event] Ban event details
  /// ---
  Function(RCIMIWChatRoomMemberBlockEvent? event)? onChatRoomNotifyBlock;

  /// [ZH]
  /// ---
  /// 禁言相关事件通知回调
  /// - [event] 禁言事件信息
  /// ---
  /// [EN]
  /// ---
  /// Mute event notification callback
  /// - [event] Mute event details
  /// ---
  Function(RCIMIWChatRoomMemberBanEvent? event)? onChatRoomNotifyBan;

  Function(List<RCIMIWTranslateItem>? items)? onTranslationDidFinished;

  Function(String? language)? onTranslationLanguageDidChange;

  Function(bool? isEnable)? onAutoTranslateStateDidChange;

  /// [ZH]
  /// ---
  /// 订阅事件变化监听
  /// - [subscribeEvents] 订阅事件的列表，包含所有发生变化的事件
  /// ---
  /// [EN]
  /// ---
  /// Subscribe to event changes
  /// - [subscribeEvents] List of events to subscribe to, including all changed events
  /// ---
  Function(List<RCIMIWSubscribeInfoEvent>? subscribeEvents)? onEventChange;

  /// [ZH]
  /// ---
  /// 订阅数据同步完成监听
  /// - [type] 订阅事件的类型
  /// ---
  /// [EN]
  /// ---
  /// Subscribe to data sync completion
  /// - [type] Type of subscription event
  /// ---
  Function(RCIMIWSubscribeType? type)? onSubscriptionSyncCompleted;

  /// [ZH]
  /// ---
  /// 其他设备订阅变更监听
  /// - [subscribeEvents] 订阅事件的列表
  /// ---
  /// [EN]
  /// ---
  /// Listen for subscription changes on other devices
  /// - [subscribeEvents] List of subscription events
  /// ---
  Function(List<RCIMIWSubscribeEvent>? subscribeEvents)? onSubscriptionChangedOnOtherDevices;
}
