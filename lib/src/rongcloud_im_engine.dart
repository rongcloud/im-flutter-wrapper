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

  /// 注册原生自定义普通消息
  /// - [messageIdentifier] 消息的唯一标识
  /// - [persistentFlag] 消息的存储策略
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功，非 0 代表当前接口调用操作失败，详细错误参考错误码
  Future<int> registerNativeCustomMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    return RCIMWrapperPlatform.instance.registerNativeCustomMessage(messageIdentifier, persistentFlag);
  }

  /// 注册原生自定义媒体消息
  /// - [messageIdentifier] 消息的唯一标识
  /// - [persistentFlag] 消息的存储策略
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功，非 0 代表当前接口调用操作失败，详细错误参考错误码
  Future<int> registerNativeCustomMediaMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    return RCIMWrapperPlatform.instance.registerNativeCustomMediaMessage(messageIdentifier, persistentFlag);
  }

  /// 连接融云服务器，在整个应用程序全局，只需要调用一次。调用此接口返回非业务错误码时，SDK 会启动重连机制进行重连；如果仍没有连接成功，会在设备网络状态变化时再次进行重连。
  /// - [token] 调用 server api 获取到的 token
  /// - [timeout] 连接超时时间，单位：秒。
  /// timeLimit <= 0，则 IM 将一直连接，直到连接成功或者无法连接（如 token 非法）
  /// timeLimit > 0，则 IM 将最多连接 timeLimit 秒
  /// 如果在 timeLimit 秒内连接成功，后面再发生了网络变化或前后台切换，SDK 会自动重连； 如果在 timeLimit 秒无法连接成功则不再进行重连，通过 listener 告知连接超时，您需要再自行调用 connect 接口
  /// - [callback] 链接事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onConnected]
  Future<int> connect(String token, int timeout, {RCIMIWConnectCallback? callback}) async {
    return RCIMWrapperPlatform.instance.connect(token, timeout, callback: callback);
  }

  /// 断开链接
  /// 注：因为 SDK 在前后台切换或者网络出现异常都会自动重连，保证连接可靠性。 所以除非您的 App 逻辑需要登出，否则一般不需要调用此方法进行手动断开
  /// - [receivePush] 退出后是否接收 push，true:断开后接收远程推送，false:断开后不再接收远程推送
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> disconnect(bool receivePush) async {
    return RCIMWrapperPlatform.instance.disconnect(receivePush);
  }

  /// 获取当前 IM 服务连接状态
  /// - [返回值] 当前连接状态
  Future<RCIMIWConnectionStatus> getConnectionStatus() async {
    return RCIMWrapperPlatform.instance.getConnectionStatus();
  }

  /// 构建文本消息
  /// - [type] 会话类型，
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [text] 文本内容
  /// - [返回值] 文本消息实体
  Future<RCIMIWTextMessage?> createTextMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String text,
  ) async {
    return RCIMWrapperPlatform.instance.createTextMessage(type, targetId, channelId, text);
  }

  /// 构建图片消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 图片消息的本地路径，必须为有效路径
  /// - [返回值] 图片消息实体
  Future<RCIMIWImageMessage?> createImageMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    return RCIMWrapperPlatform.instance.createImageMessage(type, targetId, channelId, path);
  }

  /// 构建文件消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 文件消息的本地路径，必须为有效路径
  /// - [返回值] 文件消息实体
  Future<RCIMIWFileMessage?> createFileMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    return RCIMWrapperPlatform.instance.createFileMessage(type, targetId, channelId, path);
  }

  /// 构建小视频消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 小视频消息的本地路径，必须为有效路径
  /// - [duration] 小视频消息的视频时长
  /// - [返回值] 视频消息实体
  Future<RCIMIWSightMessage?> createSightMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    return RCIMWrapperPlatform.instance.createSightMessage(type, targetId, channelId, path, duration);
  }

  /// 构建语音消息 (高清语音)
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 语音消息的本地路径，必须为有效路径
  /// - [duration] 语音消息的消息时长
  /// - [返回值] 语音消息的实体
  Future<RCIMIWVoiceMessage?> createVoiceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    return RCIMWrapperPlatform.instance.createVoiceMessage(type, targetId, channelId, path, duration);
  }

  /// 构建引用消息
  /// - [type] 会话类型
  /// - [targetId]    会话 ID
  /// - [channelId]   频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [referenceMessage] 引用的消息
  /// - [text]   引用的文本内容
  /// - [返回值] 引用消息实体
  Future<RCIMIWReferenceMessage?> createReferenceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWMessage referenceMessage,
    String text,
  ) async {
    return RCIMWrapperPlatform.instance.createReferenceMessage(type, targetId, channelId, referenceMessage, text);
  }

  /// 构建 GIF 消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] GIF 消息的本地路径
  /// - [返回值] GIF 消息实体
  Future<RCIMIWGIFMessage?> createGIFMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    return RCIMWrapperPlatform.instance.createGIFMessage(type, targetId, channelId, path);
  }

  /// 构建自定义消息
  /// - [type] 会话类型
  /// - [targetId]     会话 ID
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [policy]  消息的存储策略
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [fields]  消息的内容键值对
  /// - [返回值] 自定义消息实体
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

  /// 构建位置消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [longitude] 经度
  /// - [latitude] 纬度
  /// - [poiName]  POI 信息
  /// - [thumbnailPath] 缩略图本地路径，必须为有效路径
  /// - [返回值] 位置消息实体
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

  /// 构建原生自定义普通消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [fields] 消息的内容键值对
  /// - [返回值] 原生自定义普通消息
  Future<RCIMIWNativeCustomMessage?> createNativeCustomMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String messageIdentifier,
    Map fields,
  ) async {
    return RCIMWrapperPlatform.instance.createNativeCustomMessage(type, targetId, channelId, messageIdentifier, fields);
  }

  /// 构建原生自定义媒体消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [path] 媒体文件的本地路径，必须为有效路径
  /// - [fields] 消息的内容键值对
  /// - [返回值] 原生自定义媒体消息
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

  /// 发送普通消息
  /// - [message] 发送的消息实体
  /// - [callback] 发送消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMessageAttached],[onMessageSent]
  Future<int> sendMessage(RCIMIWMessage message, {RCIMIWSendMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.sendMessage(message, callback: callback);
  }

  /// 发送媒体消息
  /// - [message] 发送的媒体消息实体
  /// - [listener] 发送媒体消息的事件监听
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMediaMessageSending],[onMediaMessageAttached],[onMediaMessageSent]
  Future<int> sendMediaMessage(RCIMIWMediaMessage message, {RCIMIWSendMediaMessageListener? listener}) async {
    return RCIMWrapperPlatform.instance.sendMediaMessage(message, listener: listener);
  }

  /// 取消发送媒体消息
  /// - [message] 需要取消发送的媒体消息实体
  /// - [callback] 取消发送媒体消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onSendingMediaMessageCanceled]
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelSendingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelSendingMediaMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.cancelSendingMediaMessage(message, callback: callback);
  }

  /// 下载媒体消息
  /// - [message] 需要下载的媒体消息实体
  /// - [listener] 下载媒体消息的事件监听
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMediaMessageDownloaded], [onMediaMessageDownloading]
  /// 此接口不支持 Flutter For Web 端
  Future<int> downloadMediaMessage(RCIMIWMediaMessage message, {RCIMIWDownloadMediaMessageListener? listener}) async {
    return RCIMWrapperPlatform.instance.downloadMediaMessage(message, listener: listener);
  }

  /// 取消下载媒体消息
  /// - [message] 需要取消下载的媒体消息实体
  /// - [callback] 取消下载媒体消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDownloadingMediaMessageCanceled]
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelDownloadingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelDownloadingMediaMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.cancelDownloadingMediaMessage(message, callback: callback);
  }

  /// 加载某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationLoaded]
  @Deprecated('请使用 [getConversation] 代替')
  Future<int> loadConversation(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadConversation(type, targetId, channelId);
  }

  /// 获取某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [callback] 获取会话事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversation(type, targetId, channelId, callback: callback);
  }

  /// 加载某些会话
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count <= 50
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoaded]
  @Deprecated('请使用 [getConversations] 代替')
  Future<int> loadConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count,
  ) async {
    return RCIMWrapperPlatform.instance.loadConversations(conversationTypes, channelId, startTime, count);
  }

  /// 获取某些会话
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count <= 50
  /// - [callback]     获取会话列表事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 获取某些会话，可设置是否优先置顶
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count <= 50
  /// - [topPriority]  是否优先置顶，true: 优先置顶，false: 不优先置顶
  /// - [callback]     获取会话列表事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 获取指定类型的含有未读消息的会话列表
  /// - [conversationTypes] 支持单聊、群聊、系统会话
  /// - [callback] 获取会话列表事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUnreadConversations(
    List<RCIMIWConversationType> conversationTypes, {
    IRCIMIWGetUnreadConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadConversations(conversationTypes, callback: callback);
  }

  /// 移除某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [callback] 移除会话事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationRemoved]
  Future<int> removeConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWRemoveConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeConversation(type, targetId, channelId, callback: callback);
  }

  /// 根据会话类型移除会话
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     移除会话列表事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsRemoved]
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWRemoveConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeConversations(conversationTypes, channelId, callback: callback);
  }

  /// 加载某个会话的未读数
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountLoaded]
  @Deprecated('请使用 [getUnreadCount] 代替')
  Future<int> loadUnreadCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUnreadCount(type, targetId, channelId);
  }

  /// 获取某个会话的未读数
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取会话未读数事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadCount(type, targetId, channelId, callback: callback);
  }

  /// 加载所有未读数
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTotalUnreadCountLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getTotalUnreadCount] 代替')
  Future<int> loadTotalUnreadCount(String? channelId) async {
    return RCIMWrapperPlatform.instance.loadTotalUnreadCount(channelId);
  }

  /// 获取所有未读数
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取所有未读数事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  Future<int> getTotalUnreadCount(String? channelId, {IRCIMIWGetTotalUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getTotalUnreadCount(channelId, callback: callback);
  }

  /// 加载会话中未读的 @ 消息数量。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedCountLoaded]
  @Deprecated('请使用 [getUnreadMentionedCount] 代替')
  Future<int> loadUnreadMentionedCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUnreadMentionedCount(type, targetId, channelId);
  }

  /// 获取会话中未读的 @ 消息数量。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取会话中未读的 @ 消息数量事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUnreadMentionedCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadMentionedCount(type, targetId, channelId, callback: callback);
  }

  /// 加载当前用户加入的所有超级群会话的未读消息数的总和。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadCountLoaded]
  @Deprecated('请使用 [getUltraGroupAllUnreadCount] 代替')
  Future<int> loadUltraGroupAllUnreadCount() async {
    return RCIMWrapperPlatform.instance.loadUltraGroupAllUnreadCount();
  }

  /// 获取当前用户加入的所有超级群会话的未读消息数的总和。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUltraGroupAllUnreadCount({IRCIMIWGetUltraGroupAllUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getUltraGroupAllUnreadCount(callback: callback);
  }

  /// 加载当前用户加入的所有超级群会话中的未读 @ 消息数的总和。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadMentionedCountLoaded]
  @Deprecated('请使用 [getUltraGroupAllUnreadMentionedCount] 代替')
  Future<int> loadUltraGroupAllUnreadMentionedCount() async {
    return RCIMWrapperPlatform.instance.loadUltraGroupAllUnreadMentionedCount();
  }

  /// 获取当前用户加入的所有超级群会话中的未读 @ 消息数的总和。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUltraGroupAllUnreadMentionedCount({
    IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUltraGroupAllUnreadMentionedCount(callback: callback);
  }

  /// 获取指定会话的未读消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadCountLoaded]
  @Deprecated('请使用 [getUltraGroupUnreadCount] 代替')
  Future<int> loadUltraGroupUnreadCount(String targetId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupUnreadCount(targetId);
  }

  /// 获取指定会话的未读消息数
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUltraGroupUnreadCount(String targetId, {IRCIMIWGetUltraGroupUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getUltraGroupUnreadCount(targetId, callback: callback);
  }

  /// 获取超级群会话中被 @ 的消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadMentionedCountLoaded]
  @Deprecated('请使用 [getUltraGroupUnreadMentionedCount] 代替')
  Future<int> loadUltraGroupUnreadMentionedCount(String targetId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupUnreadMentionedCount(targetId);
  }

  /// 获取超级群会话中被 @ 的消息数
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUltraGroupUnreadMentionedCount(
    String targetId, {
    IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUltraGroupUnreadMentionedCount(targetId, callback: callback);
  }

  /// 根据会话类型加载未读数
  /// 注：不支持聊天室！
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountByConversationTypesLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getUnreadCountByConversationTypes] 代替')
  Future<int> loadUnreadCountByConversationTypes(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    bool contain,
  ) async {
    return RCIMWrapperPlatform.instance.loadUnreadCountByConversationTypes(conversationTypes, channelId, contain);
  }

  /// 根据会话类型加载未读数
  /// 注：不支持聊天室！
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [callback]     事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 根据会话的免打扰级别加载未读数
  /// - [conversationTypes] 会话类型列表
  /// - [levels] 免打扰级别列表
  /// - [callback] 获取会话未读消息数回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果通过接口 callback 回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUnreadCountByLevels(
    List<RCIMIWConversationType> conversationTypes,
    List<RCIMIWPushNotificationLevel> levels, {
    IRCIMIWGetUnreadCountByLevelsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadCountByLevels(conversationTypes, levels, callback: callback);
  }

  /// 清除某个会话中的未读消息数。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话已阅读的最后一条消息的发送时间戳，清除所有传入当前最新时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountCleared]
  Future<int> clearUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWClearUnreadCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearUnreadCount(type, targetId, channelId, timestamp, callback: callback);
  }

  /// 保存会话草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿的文字内容。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageSaved]
  Future<int> saveDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String draft, {
    IRCIMIWSaveDraftMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.saveDraftMessage(type, targetId, channelId, draft, callback: callback);
  }

  /// 加载会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageLoaded]
  @Deprecated('请使用 [getDraftMessage] 代替')
  Future<int> loadDraftMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadDraftMessage(type, targetId, channelId);
  }

  /// 获取会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetDraftMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getDraftMessage(type, targetId, channelId, callback: callback);
  }

  /// 删除指定会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageCleared]
  Future<int> clearDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWClearDraftMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearDraftMessage(type, targetId, channelId, callback: callback);
  }

  /// 加载免打扰的会话列表。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlockedConversationsLoaded]
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  @Deprecated('请使用 [getBlockedConversations] 代替')
  Future<int> loadBlockedConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadBlockedConversations(conversationTypes, channelId);
  }

  /// 获取免打扰的会话列表。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  Future<int> getBlockedConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetBlockedConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getBlockedConversations(conversationTypes, channelId, callback: callback);
  }

  /// 设置会话的置顶状态。若会话不存在，调用此方法 SDK 自动创建会话并置顶。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusChanged]
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

  /// 设置会话的置顶状态。若会话不存在，调用此方法 SDK 自动创建会话并置顶。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// - [updateOperationTime] 是否更新操作事件，默认不更新，如果需要更新请传 true
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusChanged]
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

  /// 加载会话的置顶状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusLoaded]
  /// 此接口在 Flutter For Web 端不支持超级群
  @Deprecated('请使用 [getConversationTopStatus] 代替')
  Future<int> loadConversationTopStatus(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadConversationTopStatus(type, targetId, channelId);
  }

  /// 获取会话的置顶状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口在 Flutter For Web 端不支持超级群
  Future<int> getConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationTopStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationTopStatus(type, targetId, channelId, callback: callback);
  }

  /// 同步会话阅读状态。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationReadStatusSynced]
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
    return RCIMWrapperPlatform.instance.sendTypingStatus(type, targetId, channelId, currentType);
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

  /// 加载历史消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [policy] 消息的加载策略。LOCAL：只加载本地，REMOTE：只加载远端，LOCAL_REMOTE：本地远端都加载
  /// - [count] 获取的消息数量，0 < count <= 20
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 根据消息 id 获取消息体（本地数据库索引唯一值）。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageById(int messageId, {IRCIMIWGetMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getMessageById(messageId, callback: callback);
  }

  /// 通过全局唯一 id 获取消息实体。
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageByUId(String messageUId, {IRCIMIWGetMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getMessageByUId(messageUId, callback: callback);
  }

  /// 在会话中获取指定消息的前后指定数量的消息。返回的消息列表中会包含指定的消息。消息列表时间顺序从新到旧。
  /// - [type] 会话类型。
  /// - [targetId] 会话 ID。
  /// - [channelId] 消息所属会话的业务标识。
  /// - [sentTime] 指定消息的发送时间，不能为 0。单位：毫秒。
  /// - [beforeCount] 指定消息的前部分消息数量。
  /// - [afterCount] 指定消息的后部分消息数量。
  /// - [callback] 获取结果回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果通过接口 callback 回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 加载第一条未读消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onFirstUnreadMessageLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getFirstUnreadMessage] 代替')
  Future<int> loadFirstUnreadMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadFirstUnreadMessage(type, targetId, channelId);
  }

  /// 获取第一条未读消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getFirstUnreadMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetFirstUnreadMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getFirstUnreadMessage(type, targetId, channelId, callback: callback);
  }

  /// 加载会话中未读的 @ 消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedMessagesLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getUnreadMentionedMessages] 代替')
  Future<int> loadUnreadMentionedMessages(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUnreadMentionedMessages(type, targetId, channelId);
  }

  /// 获取会话中未读的 @ 消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getUnreadMentionedMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUnreadMentionedMessages(type, targetId, channelId, callback: callback);
  }

  /// 插入一条消息
  /// - [message] 插入的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageInserted]
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessage(RCIMIWMessage message, {IRCIMIWInsertMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.insertMessage(message, callback: callback);
  }

  /// 插入多条消息，不支持超级群
  /// - [messages] 插入的消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesInserted]
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessages(List<RCIMIWMessage> messages, {IRCIMIWInsertMessagesCallback? callback}) async {
    return RCIMWrapperPlatform.instance.insertMessages(messages, callback: callback);
  }

  /// 清除消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 清除消息截止时间戳，0 <= recordTime <= 当前会话最后一条消息的 sentTime, 0 清除所有消息，其他值清除小于等于 recordTime 的消息
  /// - [policy] 清除的策略
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesCleared]
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

  /// 删除本地消息
  /// - [messages] 消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onLocalMessagesDeleted]
  /// 此接口不支持 Flutter For Web 端
  Future<int> deleteLocalMessages(List<RCIMIWMessage> messages, {IRCIMIWDeleteLocalMessagesCallback? callback}) async {
    return RCIMWrapperPlatform.instance.deleteLocalMessages(messages, callback: callback);
  }

  /// 根据 messageId 批量删除本地消息
  /// - [messageIds] 消息的 messageId 集合
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> deleteLocalMessageByIds(List<int> messageIds, {IRCIMIWDeleteLocalMessageByIdsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.deleteLocalMessageByIds(messageIds, callback: callback);
  }

  /// 删除消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesDeleted]
  Future<int> deleteMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWDeleteMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.deleteMessages(type, targetId, channelId, messages, callback: callback);
  }

  /// 撤回消息
  /// - [message] 需要被撤回的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageRecalled]
  Future<int> recallMessage(RCIMIWMessage message, {IRCIMIWRecallMessageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.recallMessage(message, callback: callback);
  }

  /// 发送某个会话中的消息阅读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPrivateReadReceiptMessageSent]
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

  /// 发起群聊消息已读回执请求
  /// - [message] 需要请求已读回执的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptRequestSent]
  Future<int> sendGroupReadReceiptRequest(
    RCIMIWMessage message, {
    IRCIMIWSendGroupReadReceiptRequestCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendGroupReadReceiptRequest(message, callback: callback);
  }

  /// 发送群聊已读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 会话中需要发送已读回执的消息列表
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptResponseSent]
  Future<int> sendGroupReadReceiptResponse(
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWSendGroupReadReceiptResponseCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendGroupReadReceiptResponse(targetId, channelId, messages, callback: callback);
  }

  /// 更新消息扩展信息
  /// 每条消息携带扩展信息键值对最大值 300个，单次设置扩展信息键值对最大值 20个
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionUpdated]
  Future<int> updateMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateMessageExpansionCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateMessageExpansion(messageUId, expansion, callback: callback);
  }

  /// 删除消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionForKeysRemoved]
  Future<int> removeMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveMessageExpansionForKeysCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeMessageExpansionForKeys(messageUId, keys, callback: callback);
  }

  /// 设置消息发送状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [sentStatus] 要修改的状态
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageSentStatusChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageSentStatus(
    int messageId,
    RCIMIWSentStatus sentStatus, {
    IRCIMIWChangeMessageSentStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeMessageSentStatus(messageId, sentStatus, callback: callback);
  }

  /// 设置消息接收状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [receivedStatus] 要修改的状态
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageReceiveStatusChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageReceiveStatus(
    int messageId,
    RCIMIWReceivedStatus receivedStatus, {
    IRCIMIWChangeMessageReceivedStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeMessageReceiveStatus(messageId, receivedStatus, callback: callback);
  }

  /// 设置消息接收状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [receivedStatusInfo] 要修改的状态
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageReceiveStatusChanged]
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

  /// 设置消息的附加信息，只能用于本地使用，无法同步到远端。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [extra] 附加信息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> updateMessageLocalExtra(
    int messageId,
    String extra, {
    IRCIMIWUpdateMessageLocalExtraCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateMessageLocalExtra(messageId, extra, callback: callback);
  }

  /// 加入聊天室。
  /// - [targetId] 聊天室会话 ID
  /// - [messageCount] 进入聊天室拉取消息数目，-1 时不拉取任何消息，0 时拉取 10 条消息，最多只能拉取 50
  /// - [autoCreate] 是否创建聊天室，TRUE 如果聊天室不存在，sdk 会创建聊天室并加入，如果已存在，则直接加入
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomJoined]
  Future<int> joinChatRoom(
    String targetId,
    int messageCount,
    bool autoCreate, {
    IRCIMIWJoinChatRoomCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.joinChatRoom(targetId, messageCount, autoCreate, callback: callback);
  }

  /// 退出聊天室。
  /// - [targetId] 聊天室会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomLeft]
  Future<int> leaveChatRoom(String targetId, {IRCIMIWLeaveChatRoomCallback? callback}) async {
    return RCIMWrapperPlatform.instance.leaveChatRoom(targetId, callback: callback);
  }

  /// 加载聊天室历史消息记录。
  /// 注：必须先开通聊天室消息云存储功能。
  /// - [targetId] 聊天室会话 ID
  /// - [timestamp] 起始的消息发送时间戳
  /// - [order] 拉取顺序 0:倒序，1:正序
  /// - [count] 要获取的消息数量，0 < count <= 50。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomMessagesLoaded]
  @Deprecated('请使用 [getChatRoomMessages] 代替')
  Future<int> loadChatRoomMessages(String targetId, int timestamp, RCIMIWTimeOrder order, int count) async {
    return RCIMWrapperPlatform.instance.loadChatRoomMessages(targetId, timestamp, order, count);
  }

  /// 获取聊天室历史消息记录。
  /// 注：必须先开通聊天室消息云存储功能。
  /// - [targetId] 聊天室会话 ID
  /// - [timestamp] 起始的消息发送时间戳
  /// - [order] 拉取顺序 0:倒序，1:正序
  /// - [count] 要获取的消息数量，0 < count <= 50。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getChatRoomMessages(
    String targetId,
    int timestamp,
    RCIMIWTimeOrder order,
    int count, {
    IRCIMIWGetChatRoomMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getChatRoomMessages(targetId, timestamp, order, count, callback: callback);
  }

  /// 设置聊天室自定义属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key]  聊天室属性名称，Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，最大长度 128 个字符
  /// - [value]     聊天室属性对应的值，最大长度 4096 个字符
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 如果当前 key 存在，是否进行覆盖
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryAdded]
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

  /// 批量设置聊天室自定义属性
  /// - [targetId] 聊天室会话 ID
  /// - [entries]   聊天室属性
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 是否强制覆盖
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesAdded]
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

  /// 加载聊天室单个属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryLoaded]
  @Deprecated('请使用 [getChatRoomEntry] 代替')
  Future<int> loadChatRoomEntry(String targetId, String key) async {
    return RCIMWrapperPlatform.instance.loadChatRoomEntry(targetId, key);
  }

  /// 获取聊天室单个属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getChatRoomEntry(String targetId, String key, {IRCIMIWGetChatRoomEntryCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getChatRoomEntry(targetId, key, callback: callback);
  }

  /// 加载聊天室所有属性。
  /// - [targetId] 聊天室会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomAllEntriesLoaded]
  @Deprecated('请使用 [getChatRoomAllEntries] 代替')
  Future<int> loadChatRoomAllEntries(String targetId) async {
    return RCIMWrapperPlatform.instance.loadChatRoomAllEntries(targetId);
  }

  /// 获取聊天室所有属性。
  /// - [targetId] 聊天室会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getChatRoomAllEntries(String targetId, {IRCIMIWGetChatRoomAllEntriesCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getChatRoomAllEntries(targetId, callback: callback);
  }

  /// 删除聊天室自定义属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [force] 是否强制删除
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryRemoved]
  Future<int> removeChatRoomEntry(
    String targetId,
    String key,
    bool force, {
    IRCIMIWRemoveChatRoomEntryCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeChatRoomEntry(targetId, key, force, callback: callback);
  }

  /// 批量删除聊天室自定义属性
  /// - [targetId] 聊天室会话 ID
  /// - [keys] 聊天室属性
  /// - [force] 是否强制覆盖
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesRemoved]
  Future<int> removeChatRoomEntries(
    String targetId,
    List<String> keys,
    bool force, {
    IRCIMIWRemoveChatRoomEntriesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeChatRoomEntries(targetId, keys, force, callback: callback);
  }

  /// 将某个用户加入黑名单。
  /// 当你把对方加入黑名单后，对方再发消息时，就会提示“已被加入黑名单，消息发送失败”。 但你依然可以发消息个对方。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistAdded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> addToBlacklist(String userId, {IRCIMIWAddToBlacklistCallback? callback}) async {
    return RCIMWrapperPlatform.instance.addToBlacklist(userId, callback: callback);
  }

  /// 将某个用户从黑名单中移出。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistRemoved]
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeFromBlacklist(String userId, {IRCIMIWRemoveFromBlacklistCallback? callback}) async {
    return RCIMWrapperPlatform.instance.removeFromBlacklist(userId, callback: callback);
  }

  /// 获取某用户是否在黑名单中。
  /// - [userId] 用户 Id
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistStatusLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getBlacklistStatus] 代替')
  Future<int> loadBlacklistStatus(String userId) async {
    return RCIMWrapperPlatform.instance.loadBlacklistStatus(userId);
  }

  /// 获取某用户是否在黑名单中。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklistStatus(String userId, {IRCIMIWGetBlacklistStatusCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getBlacklistStatus(userId, callback: callback);
  }

  /// 加载当前用户设置的黑名单列表。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getBlacklist] 代替')
  Future<int> loadBlacklist() async {
    return RCIMWrapperPlatform.instance.loadBlacklist();
  }

  /// 获取当前用户设置的黑名单列表。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklist({IRCIMIWGetBlacklistCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getBlacklist(callback: callback);
  }

  /// 根据关键字搜索指定会话中的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 查询 beginTime 之前的消息， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 查询的数量，0 < count <= 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearched]
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

  /// 根据关键字搜索指定会话中某个时间段的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 开始时间
  /// - [endTime] 结束时间
  /// - [offset] 偏移量
  /// - [count] 返回的搜索结果数量，0 < count <= 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByTimeRange]
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

  /// 根据用户 id 搜索指定会话中的消息。
  /// - [userId] 用户 id
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [startTime] 查询记录的起始时间， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 返回的搜索结果数量 0 < count <= 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByUserId]
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

  /// 根据关键字搜索会话。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageTypes] 搜索的消息类型
  /// - [keyword]      搜索的关键字。
  /// - [callback]     事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsSearched]
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

  /// 屏蔽某个时间段的消息提醒
  /// - [startTime] 开始消息免打扰时间，格式为 HH:MM:SS
  /// - [spanMinutes] 需要消息免打扰分钟数，0 < spanMinutes < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为 01:00，则 spanMinutes 为 60 分钟。设置为 1439 代表全天免打扰 （23 60 + 59 = 1439 ））
  /// - [level]  消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeNotificationQuietHours(
    String startTime,
    int spanMinutes,
    RCIMIWPushNotificationQuietHoursLevel level, {
    IRCIMIWChangeNotificationQuietHoursCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeNotificationQuietHours(startTime, spanMinutes, level, callback: callback);
  }

  /// 删除已设置的全局时间段消息提醒屏蔽
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursRemoved]
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeNotificationQuietHours({IRCIMIWRemoveNotificationQuietHoursCallback? callback}) async {
    return RCIMWrapperPlatform.instance.removeNotificationQuietHours(callback: callback);
  }

  /// 加载已设置的时间段消息提醒屏蔽
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getNotificationQuietHours] 代替')
  Future<int> loadNotificationQuietHours() async {
    return RCIMWrapperPlatform.instance.loadNotificationQuietHours();
  }

  /// 获取已设置的时间段消息提醒屏蔽
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getNotificationQuietHours({IRCIMIWGetNotificationQuietHoursCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getNotificationQuietHours(callback: callback);
  }

  /// 设置会话的消息提醒状态
  /// 注：超级群调用该接口，channelId 为空时，相当于设置了 channelId 为空的频道的免打扰，不会屏蔽整个超级群会话下所有频道的免打扰
  /// - [type] 会话类型。请注意以下限制：<ul><li>*超级群会话类型*：如在 2022.09.01 之前开通超级群业务，默认不支持为单个超级群会话*所有消息*设置免打扰级别（“所有消息”指所有频道中的消息和不属于任何频道的消息）。该接口仅设置指定超级群会话（`targetId`）中*不属于任何频道的消息*的免打扰状态级别。如需修改请提交工单。</li><li>*聊天室会话类型*：不支持，因为聊天室消息默认不支持消息推送提醒。</li></ul>
  /// - [targetId] 会话 ID
  /// - [channelId] 超级群的会话频道 ID。其他类型传 null 即可。<ul><li>如果传入频道 ID，则针对该指定频道设置消息免打扰级别。如果不指定频道 ID，则对所有超级群消息生效。</li><li>*注意*：2022.09.01 之前开通超级群业务的客户，如果不指定频道 ID，则默认传 "" 空字符串，即仅针对指定超级群会话（`targetId`）中*不属于任何频道的消息*设置免打扰状态级别。如需修改请提交工单。</p></li></ul>
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelChanged]
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

  /// 加载会话的消息提醒状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelLoaded]
  @Deprecated('请使用 [getConversationNotificationLevel] 代替')
  Future<int> loadConversationNotificationLevel(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadConversationNotificationLevel(type, targetId, channelId);
  }

  /// 获取会话的消息提醒状态
  /// - [type] 会话类型。请注意以下限制：<ul><li>*超级群会话类型*：如在 2022.09.01 之前开通超级群业务，默认不支持为单个超级群会话*所有消息*设置免打扰级别（“所有消息”指所有频道中的消息和不属于任何频道的消息）。该接口仅设置指定超级群会话（`targetId`）中*不属于任何频道的消息*的免打扰状态级别。如需修改请提交工单。</li><li>*聊天室会话类型*：不支持，因为聊天室消息默认不支持消息推送提醒。</li></ul>
  /// - [targetId] 会话 ID
  /// - [channelId] 超级群的会话频道 ID。其他类型传 null 即可。<ul><li>如果传入频道 ID，则针对该指定频道设置消息免打扰级别。如果不指定频道 ID，则对所有超级群消息生效。</li><li>*注意*：2022.09.01 之前开通超级群业务的客户，如果不指定频道 ID，则默认传 "" 空字符串，即仅针对指定超级群会话（`targetId`）中*不属于任何频道的消息*设置免打扰状态级别。如需修改请提交工单。</p></li></ul>
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationNotificationLevel(type, targetId, channelId, callback: callback);
  }

  /// 设置会话类型的消息提醒状态
  /// 注：如要移除消息提醒状态，设置level为RCIMIWPushNotificationLevelDefault
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTypeNotificationLevelChanged]
  Future<int> changeConversationTypeNotificationLevel(
    RCIMIWConversationType type,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeConversationTypeNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeConversationTypeNotificationLevel(type, level, callback: callback);
  }

  /// 获取会话类型的消息提醒状态
  /// - [type] 会话类型
  /// - [返回值] [onConversationTypeNotificationLevelLoaded]
  @Deprecated('请使用 [getConversationTypeNotificationLevel] 代替')
  Future<int> loadConversationTypeNotificationLevel(RCIMIWConversationType type) async {
    return RCIMWrapperPlatform.instance.loadConversationTypeNotificationLevel(type);
  }

  Future<int> getConversationTypeNotificationLevel(
    RCIMIWConversationType type, {
    IRCIMIWGetConversationTypeNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationTypeNotificationLevel(type, callback: callback);
  }

  /// 设置超级群的默认消息状态
  /// 一般由管理员设置的接口，针对超级群的所有群成员生效，针对超级群下所有频道生效，优先级较低。如果群成员自己超级群的免打扰级别，那么以群成员自己设置的为准。
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelChanged]
  Future<int> changeUltraGroupDefaultNotificationLevel(
    String targetId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changeUltraGroupDefaultNotificationLevel(targetId, level, callback: callback);
  }

  /// 获取超级群的默认消息状态
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelLoaded]
  @Deprecated('请使用 [getUltraGroupDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupDefaultNotificationLevel(String targetId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupDefaultNotificationLevel(targetId);
  }

  /// 获取超级群的默认消息状态
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUltraGroupDefaultNotificationLevel(
    String targetId, {
    IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getUltraGroupDefaultNotificationLevel(targetId, callback: callback);
  }

  /// 设置超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelChanged]
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

  /// 获取超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelLoaded]
  @Deprecated('请使用 [getUltraGroupChannelDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupChannelDefaultNotificationLevel(String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadUltraGroupChannelDefaultNotificationLevel(targetId, channelId);
  }

  /// 获取超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 设置是否显示远程推送内容详情，此功能需要从服务端开启用户设置功能。
  /// - [showContent] 是否显示远程推送内容
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushContentShowStatusChanged]
  Future<int> changePushContentShowStatus(
    bool showContent, {
    IRCIMIWChangePushContentShowStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.changePushContentShowStatus(showContent, callback: callback);
  }

  /// 设置推送语言
  /// - [language] 推送语言， 目前仅支持 en_us、zh_cn、ar_sa
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushLanguageChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushLanguage(String language, {IRCIMIWChangePushLanguageCallback? callback}) async {
    return RCIMWrapperPlatform.instance.changePushLanguage(language, callback: callback);
  }

  /// 设置是否接收远程推送。
  /// 前提：移动端未在线，Web 、MAC/PC 终端在线，移动端是否接收远程推送。
  /// 此功能需要从服务端开启用户设置功能。
  /// - [receive] 是否接收
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushReceiveStatusChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushReceiveStatus(bool receive, {IRCIMIWChangePushReceiveStatusCallback? callback}) async {
    return RCIMWrapperPlatform.instance.changePushReceiveStatus(receive, callback: callback);
  }

  /// 给指定的群成员发送消息
  /// - [message] 要发送的消息
  /// - [userIds] 群成员集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupMessageToDesignatedUsersAttached], [onGroupMessageToDesignatedUsersSent]
  Future<int> sendGroupMessageToDesignatedUsers(
    RCIMIWMessage message,
    List<String> userIds, {
    RCIMIWSendGroupMessageToDesignatedUsersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.sendGroupMessageToDesignatedUsers(message, userIds, callback: callback);
  }

  /// 加载指定会话的消息总数。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageCountLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getMessageCount] 代替')
  Future<int> loadMessageCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadMessageCount(type, targetId, channelId);
  }

  /// 获取指定会话的消息总数。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetMessageCountCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getMessageCount(type, targetId, channelId, callback: callback);
  }

  /// 根据会话类型,加载置顶会话列表
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTopConversationsLoaded]
  @Deprecated('请使用 [getTopConversations] 代替')
  Future<int> loadTopConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    return RCIMWrapperPlatform.instance.loadTopConversations(conversationTypes, channelId);
  }

  /// 根据会话类型,获取置顶会话列表
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getTopConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetTopConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getTopConversations(conversationTypes, channelId, callback: callback);
  }

  /// 上报超级群的已读时间
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [timestamp] 已读时间
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupReadStatusSynced]
  /// [timestamp] 在 Flutter For Web 端无效
  Future<int> syncUltraGroupReadStatus(
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSyncUltraGroupReadStatusCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.syncUltraGroupReadStatus(targetId, channelId, timestamp, callback: callback);
  }

  /// 获取特定会话下所有频道的会话列表，只支持超级群
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoadedForAllChannel]
  @Deprecated('请使用 [getConversationsForAllChannel] 代替')
  Future<int> loadConversationsForAllChannel(RCIMIWConversationType type, String targetId) async {
    return RCIMWrapperPlatform.instance.loadConversationsForAllChannel(type, targetId);
  }

  /// 获取特定会话下所有频道的会话列表，只支持超级群
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getConversationsForAllChannel(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationsForAllChannelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationsForAllChannel(type, targetId, callback: callback);
  }

  /// 修改超级群消息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [message] 要修改的 message
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageModified]
  Future<int> modifyUltraGroupMessage(
    String messageUId,
    RCIMIWMessage message, {
    IRCIMIWModifyUltraGroupMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.modifyUltraGroupMessage(messageUId, message, callback: callback);
  }

  /// 撤回超级群消息
  /// - [message] 需要撤回的消息
  /// - [deleteRemote] 是否删除远端消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageRecalled]
  Future<int> recallUltraGroupMessage(
    RCIMIWMessage message,
    bool deleteRemote, {
    IRCIMIWRecallUltraGroupMessageCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.recallUltraGroupMessage(message, deleteRemote, callback: callback);
  }

  /// 删除超级群指定时间之前的消息
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [timestamp] 时间戳
  /// - [policy] 清除策略
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesCleared]
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

  /// 发送超级群输入状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [typingStatus] 输入状态
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupTypingStatusSent]
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

  /// 删除超级群所有频道指定时间之前的消息
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesClearedForAllChannel]
  Future<int> clearUltraGroupMessagesForAllChannel(
    String targetId,
    int timestamp, {
    IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearUltraGroupMessagesForAllChannel(targetId, timestamp, callback: callback);
  }

  /// 从服务获取批量消息
  /// - [messages] 获取的消息集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBatchRemoteUltraGroupMessagesLoaded]
  @Deprecated('请使用 [getBatchRemoteUltraGroupMessages] 代替')
  Future<int> loadBatchRemoteUltraGroupMessages(List<RCIMIWMessage> messages) async {
    return RCIMWrapperPlatform.instance.loadBatchRemoteUltraGroupMessages(messages);
  }

  /// 从服务获取批量消息
  /// - [messages] 获取的消息集合
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getBatchRemoteUltraGroupMessages(
    List<RCIMIWMessage> messages, {
    IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getBatchRemoteUltraGroupMessages(messages, callback: callback);
  }

  /// 更新超级群消息扩展信息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionUpdated]
  Future<int> updateUltraGroupMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.updateUltraGroupMessageExpansion(messageUId, expansion, callback: callback);
  }

  /// 删除超级群消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionForKeysRemoved]
  Future<int> removeUltraGroupMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeUltraGroupMessageExpansionForKeys(messageUId, keys, callback: callback);
  }

  /// 修改日志等级
  /// - [level] 日志级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeLogLevel(RCIMIWLogLevel level) async {
    return RCIMWrapperPlatform.instance.changeLogLevel(level);
  }

  /// 获取本地时间与服务器时间的时间差。消息发送成功后，SDK 与服务器同步时间，消息所在数据库中存储的时间就是服务器时间。 System.currentTimeMillis() - getDeltaTime() 可以获取服务器当前时间。
  /// - [返回值] 本地时间与服务器时间的差值
  Future<int> getDeltaTime() async {
    return RCIMWrapperPlatform.instance.getDeltaTime();
  }

  /// 创建标签信息
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [tagName] 长度不超过 15 个字，标签名称可以重复。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> createTag(String tagId, String tagName, {IRCIMIWCreateTagCallback? callback}) async {
    return RCIMWrapperPlatform.instance.createTag(tagId, tagName, callback: callback);
  }

  /// 移除标签
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> removeTag(String tagId, {IRCIMIWRemoveTagCallback? callback}) async {
    return RCIMWrapperPlatform.instance.removeTag(tagId, callback: callback);
  }

  /// 更新标签信息
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [newName] 长度不超过 15 个字，标签名称可以重复。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> updateTagNameById(String tagId, String newName, {IRCIMIWUpdateTagNameByIdCallback? callback}) async {
    return RCIMWrapperPlatform.instance.updateTagNameById(tagId, newName, callback: callback);
  }

  /// 获取当前用户已创建的标签信息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getTags({IRCIMIWGetTagsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getTags(callback: callback);
  }

  /// 将一个会话添加到指定标签
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> addConversationToTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWAddConversationToTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.addConversationToTag(tagId, type, targetId, callback: callback);
  }

  /// 从标签中移除一个会话
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> removeConversationFromTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWRemoveConversationFromTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeConversationFromTag(tagId, type, targetId, callback: callback);
  }

  /// 为指定会话移除一个或多个标签
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [tagIds] 标签集合
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> removeTagsFromConversation(
    RCIMIWConversationType type,
    String targetId,
    List<String> tagIds, {
    IRCIMIWRemoveTagsFromConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeTagsFromConversation(type, targetId, tagIds, callback: callback);
  }

  /// 获取指定会话携带的所有标签
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getTagsFromConversation(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetTagsFromConversationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getTagsFromConversation(type, targetId, callback: callback);
  }

  /// 以会话中最后一条消息时间戳为界，分页获取本地指定标签下会话列表
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [timestamp] 会话的时间戳。获取这个时间戳之前的会话列表。首次可传 0，后续可以使用返回的 RCConversation 对象的 operationTime 属性值，作为下一次查询的 startTime。
  /// - [count] 获取的数量。当实际取回的会话数量小于 count 值时，表明已取完数据。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getConversationsFromTagByPage(
    String tagId,
    int timestamp,
    int count, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationsFromTagByPage(tagId, timestamp, count, callback: callback);
  }

  /// 获取携带指定标签的所有会话的未读消息数。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [contain] 是否包含免打扰会话。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUnreadCountByTag(String tagId, bool contain, {IRCIMIWGetUnreadCountCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getUnreadCountByTag(tagId, contain, callback: callback);
  }

  /// 在携带指定标签的所有会话中设置指定会话置顶。例如，在所有添加了「培训班」标签的会话中将与「Tom」的私聊会话置顶。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [top] 是否置顶
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 查询指定会话是否在携带同一标签的所有会话中置顶。获取成功后会返回是否已置顶。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getConversationTopStatusInTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationTopStatusInTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getConversationTopStatusInTag(tagId, type, targetId, callback: callback);
  }

  /// 清除携带指定标签的所有会话的未读消息数。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> clearMessagesUnreadStatusByTag(
    String tagId, {
    IRCIMIWClearMessagesUnreadStatusByTagCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.clearMessagesUnreadStatusByTag(tagId, callback: callback);
  }

  /// 删除指定标签下的全部会话，同时解除这些会话和标签的绑定关系。删除成功后，会话不再携带指定的标签。这些会话收到新消息时，会产生新的会话。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [deleteMessage] 是否删除消息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 更新群组资料
  /// - [groupInfo] 群信息，只需传入需要修改的参数
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> updateGroupInfo(RCIMIWGroupInfo groupInfo, {IRCIMIWGroupInfoUpdatedCallback? callback}) async {
    return RCIMWrapperPlatform.instance.updateGroupInfo(groupInfo, callback: callback);
  }

  /// - [groupIds]
  /// - [callback]
  /// - [返回值]
  Future<int> getGroupsInfo(List<String> groupIds, {IRCIMIWGetGroupsInfoCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getGroupsInfo(groupIds, callback: callback);
  }

  /// 踢出群组
  /// - [groupId] 群组Id。
  /// - [userIds] 群成员Id数组。支持批量操作，单次上限为 100 个。
  /// - [config] 踢出群组配置。允许传空，传空代表使用默认配置。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> kickGroupMembers(
    String groupId,
    List<String> userIds,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWKickGroupMembersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.kickGroupMembers(groupId, userIds, config, callback: callback);
  }

  /// 主动加入群组
  /// - [groupId] 群组Id。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> joinGroup(String groupId, {IRCIMIWJoinGroupCallback? callback}) async {
    return RCIMWrapperPlatform.instance.joinGroup(groupId, callback: callback);
  }

  /// 主动退出群组
  /// - [groupId] 群组 ID
  /// - [config] 退出群组配置。允许传空，传空代表使用默认配置。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> quitGroup(String groupId, RCIMIWQuitGroupConfig config, {IRCIMIWQuitGroupCallback? callback}) async {
    return RCIMWrapperPlatform.instance.quitGroup(groupId, config, callback: callback);
  }

  /// 解散群组
  /// - [groupId] 群组 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> dismissGroup(String groupId, {IRCIMIWDismissGroupCallback? callback}) async {
    return RCIMWrapperPlatform.instance.dismissGroup(groupId, callback: callback);
  }

  /// 转让群主身份
  /// - [groupId] 群组 ID
  /// - [newOwnerId] 新群主 ID
  /// - [quitGroup] 是否退出群组
  /// - [config] 转让群主配置。允许传空，传空代表使用默认配置。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> transferGroupOwner(
    String groupId,
    String newOwnerId,
    bool quitGroup,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWTransferGroupOwnerCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.transferGroupOwner(groupId, newOwnerId, quitGroup, config, callback: callback);
  }

  /// 获取已加入指定群成员信息
  /// - [groupId] 群组 ID
  /// - [userIds] 用户 ID 列表，一次最多不超过 100 个。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getGroupMembers(String groupId, List<String> userIds, {IRCIMIWGetGroupMembersCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getGroupMembers(groupId, userIds, callback: callback);
  }

  /// 分页获取群成员信息
  /// - [groupId] 群组 ID
  /// - [role] 群成员角色
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 100 条）、是否正序查询（默认倒序）
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getGroupMembersByRole(
    String groupId,
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetGroupMembersByRoleCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getGroupMembersByRole(groupId, role, option, callback: callback);
  }

  /// 按角色获取已加入群组的资料
  /// - [role] 群成员角色
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 100 条）、是否正序查询（默认倒序）
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getJoinedGroupsByRole(
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetJoinedGroupsByRoleCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getJoinedGroupsByRole(role, option, callback: callback);
  }

  /// 获取指定已加入群组的资料
  /// - [groupIds] 群组 ID 列表。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getJoinedGroups(List<String> groupIds, {IRCIMIWGetJoinedGroupsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getJoinedGroups(groupIds, callback: callback);
  }

  /// 设置群组备注名
  /// - [groupId] 群组 ID。
  /// - [remark] 群备注，字符串长度不超过 64 个字符。传空或空字符串表示移除群备注
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> setGroupRemark(String groupId, String remark, {IRCIMIWSetGroupRemarkCallback? callback}) async {
    return RCIMWrapperPlatform.instance.setGroupRemark(groupId, remark, callback: callback);
  }

  /// 设置群成员资料
  /// - [groupId] 群组 ID
  /// - [userId] 用户ID， 必填项，支持传入当前登录用户 ID。
  /// - [nickname] 用户昵称，非必填项，长度不超过 64 个字符，传空或空字符串表示移除用户昵称。
  /// - [extra] 附加信息，非必填项，长度不超过 128 个字符
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> setGroupMemberInfo(
    String groupId,
    String userId,
    String nickname,
    String extra, {
    IRCIMIWSetGroupMemberInfoCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.setGroupMemberInfo(groupId, userId, nickname, extra, callback: callback);
  }

  /// 按群名称搜索已加入群组的资料
  /// - [groupName] 群名称，不能为空，最长不超过 64 个字符。
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> searchJoinedGroups(
    String groupName,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchJoinedGroupsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchJoinedGroups(groupName, option, callback: callback);
  }

  /// 根据群成员昵称查询群成员
  /// - [groupId] 群组ID
  /// - [name] 群成员昵称，必填，不能为空最长不超过 64 个字符。
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// @note 优先匹配群成员昵称 nickname，再匹配群成员用户名 name。只要其中一个字段匹配成功，即返回搜索结果。
  Future<int> searchGroupMembers(
    String groupId,
    String name,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchGroupMembersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.searchGroupMembers(groupId, name, option, callback: callback);
  }

  /// 添加群管理员
  /// - [groupId] 群组 ID，必填项
  /// - [userIds] 用户 ID 数组，必填项。用户 ID 必须为群成员，一次最多设置 10 个群成员为管理员，管理员上限为 10 个。群主不支持设置为管理员
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口���用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> addGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWAddGroupManagersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.addGroupManagers(groupId, userIds, callback: callback);
  }

  /// 移除群管理员
  /// - [groupId] 群组 ID，必填项
  /// - [userIds] 用户 ID 数组，必填项。一次最多操作 10 个管理员
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> removeGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupManagersCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeGroupManagers(groupId, userIds, callback: callback);
  }

  /// 邀请用户加入群组
  /// - [groupId] 群组ID
  /// - [userIds] 用户ID列表，一次最多不超过 30 个
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// @note
  /// *`callback` 的 `processCode` 参数说明*
  /// - 当群组的 `joinPermission` 为需要群主或管理员审批时，`processCode` 返回 `RC_GROUP_JOIN_GROUP_NEED_MANAGER_ACCEPT` ( 25424 )，表示需要等待群主或管理员审批。
  /// - 当群组的 `joinPermission` 为不用验证，同时 `inviteHandlePermission` 为需要被邀请人同意时，`processCode` 返回 `RC_GROUP_NEED_INVITEE_ACCEPT` ( 25427 )，表示需要被邀请人同意后才能进入群组。
  Future<int> inviteUsersToGroup(
    String groupId,
    List<String> userIds, {
    IRCIMIWInviteUsersToGroupCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.inviteUsersToGroup(groupId, userIds, callback: callback);
  }

  /// 用户同意加入群组
  /// - [groupId] 群组ID
  /// - [inviterId] 邀请者ID
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> acceptGroupInvite(String groupId, String inviterId, {IRCIMIWAcceptGroupInviteCallback? callback}) async {
    return RCIMWrapperPlatform.instance.acceptGroupInvite(groupId, inviterId, callback: callback);
  }

  /// 用户拒绝加入群组
  /// - [groupId] 群组ID
  /// - [inviterId] 邀请者ID
  /// - [reason] 拒绝原因，非必填项，拒绝时可选择是否输入拒绝原因，内容不超过 128 个字符。
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> refuseGroupInvite(
    String groupId,
    String inviterId,
    String reason, {
    IRCIMIWRefuseGroupInviteCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.refuseGroupInvite(groupId, inviterId, reason, callback: callback);
  }

  /// 群主或管理员同意用户加入群组
  /// - [groupId] 群组 ID
  /// - [inviterId] ��请人用户 ID，非必填，如果是邀请入群，则传邀请人ID；如果是用户主动加群，可以为空。
  /// - [applicantId] 申请入群用户 ID
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// @note
  /// *`callback` 的 `processCode` 参数说明*
  /// - 当群组的 `inviteHandlePermission` 为需要被邀请人同意时，若 `processCode` 返回 `RC_GROUP_NEED_INVITEE_ACCEPT` (25427)，表示需等待被邀请人同意方可加入群组。
  /// - 当群组的 `inviteHandlePermission` 为无需被邀请人同意时，若 `processCode` 返回 `RC_SUCCESS` (0)，表示被邀请人已成功加入群组。
  /// 以上仅适用于邀请加入群组的情况，当用户主动申请加入群组时，`processCode` 始终为 `RC_SUCCESS` (0)。
  Future<int> acceptGroupApplication(
    String groupId,
    String inviterId,
    String applicantId, {
    IRCIMIWAcceptGroupApplicationCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.acceptGroupApplication(groupId, inviterId, applicantId, callback: callback);
  }

  /// 群主或管理员拒绝用户加入群组
  /// - [groupId] 群组ID
  /// - [inviterId] 邀请人用户 ID ，非必填，如果是邀请入群，则传邀请人ID；如果是主动加群，��以为空。
  /// - [applicantId] 申请者ID
  /// - [reason] 拒绝原因，内容不超过 128 个字符。
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
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

  /// 分页获取群组申请列表
  /// - [option] 查询选项，包含 页面标识（非必填，不填返回第一页数据）、每页条数（最大不超过 200 条）、是否正序查询（默认倒序）
  /// - [directions] 申请方向 `RCGroupApplicationDirection` 数组
  /// - [status] 状态类型 `RCGroupApplicationStatus` 数组
  /// - [callback] 事件回调，此接口不支持返回请求总数。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getGroupApplications(
    RCIMIWPagingQueryOption option,
    List<RCIMIWGroupApplicationDirection> directions,
    List<RCIMIWGroupApplicationStatus> status, {
    IRCIMIWGetGroupApplicationsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.getGroupApplications(option, directions, status, callback: callback);
  }

  /// 添加群组特别关注用户
  /// - [groupId] 群组 ID
  /// - [userIds] 用户 ID 列表，单次最多关注 100 个用户。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码。
  Future<int> addGroupFollows(String groupId, List<String> userIds, {IRCIMIWAddGroupFollowsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.addGroupFollows(groupId, userIds, callback: callback);
  }

  /// 删除群组特别关注用户
  /// - [groupId] 群组 ID
  /// - [userIds] 用户 ID 列表，单次取消关注 100 个用户。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码。
  Future<int> removeGroupFollows(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupFollowsCallback? callback,
  }) async {
    return RCIMWrapperPlatform.instance.removeGroupFollows(groupId, userIds, callback: callback);
  }

  /// 获取群组特别关注用户
  /// - [groupId] 群组 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码。
  Future<int> getGroupFollows(String groupId, {IRCIMIWGetGroupFollowsCallback? callback}) async {
    return RCIMWrapperPlatform.instance.getGroupFollows(groupId, callback: callback);
  }

  Future<int> setCheckChatRoomDuplicateMessage(bool enableCheck) async {
    return RCIMWrapperPlatform.instance.setCheckChatRoomDuplicateMessage(enableCheck);
  }

  /// 收到消息的监听
  /// - [message] 接收到的消息对象
  /// - [left]  当客户端连接成功后，服务端会将所有补偿消息以消息包的形式下发给客户端，最多每 200 条消息为一个消息包，即一个 Package, 客户端接受到消息包后，会逐条解析并通知应用。left 为当前消息包（Package）里还剩余的消息条数
  /// - [offline] 消息是否离线消息
  /// - [hasPackage] 是否在服务端还存在未下发的消息包
  /// 在 Flutter For Web 端 [offline] [hasPackage] 参数永远都为 false，可通过消息体内的 offline 字段判断是否为离线消息
  Function(RCIMIWMessage? message, int? left, bool? offline, bool? hasPackage)? onMessageReceived;

  /// 离线消息同步完成

  Function()? onOfflineMessageSyncCompleted;

  /// 网络状态变化
  /// - [status] SDK 与融云服务器的连接状态
  Function(RCIMIWConnectionStatus? status)? onConnectionStatusChanged;

  /// 会话状态置顶多端同步监听
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  Function(RCIMIWConversationType? type, String? targetId, String? channelId, bool? top)? onConversationTopStatusSynced;

  /// 会话状态免打扰多端同步监听
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 当前会话通知的类型
  Function(RCIMIWConversationType? type, String? targetId, String? channelId, RCIMIWPushNotificationLevel? level)?
  onConversationNotificationLevelSynced;

  /// 撤回消息监听器
  /// - [message] 原本的消息会变为撤回消息
  Function(RCIMIWMessage? message)? onRemoteMessageRecalled;

  /// 单聊中收到消息回执的回调。
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 已阅读的最后一条消息的 sendTime
  Function(String? targetId, String? channelId, int? timestamp)? onPrivateReadReceiptReceived;

  /// 消息扩展信息更改的回调
  /// - [expansion] 消息扩展信息中更新的键值对，只包含更新的键值对，不是全部的数据。如果想获取全部的键值对，请使用 message 的 expansion 属性。
  /// - [message] 发生变化的消息
  /// 在 Flutter For Web 端监听变为 [onRemoteMessageExpansionUpdatedForWeb]
  Function(Map? expansion, RCIMIWMessage? message)? onRemoteMessageExpansionUpdated;

  /// 消息扩展信息删除的回调
  /// - [message] 发生变化的消息
  /// - [keys] 消息扩展信息中删除的键值对 key 列表
  /// 在 Flutter For Web 端监听变为 [onRemoteMessageExpansionForKeyRemovedForWeb]
  Function(RCIMIWMessage? message, List<String>? keys)? onRemoteMessageExpansionForKeyRemoved;

  /// 聊天室用户进入、退出聊天室监听
  /// - [targetId] 会话 ID
  /// - [actions] 发生的事件
  Function(String? targetId, List<RCIMIWChatRoomMemberAction>? actions)? onChatRoomMemberChanged;

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
  )?
  onTypingStatusChanged;

  /// 同步消息未读状态监听接口。多端登录，收到其它端清除某一会话未读数通知的时候
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  Function(RCIMIWConversationType? type, String? targetId, int? timestamp)? onConversationReadStatusSyncMessageReceived;

  /// 聊天室 KV 同步完成的回调
  /// - [roomId] 聊天室 ID
  /// Flutter For Web 端不支持此回调
  Function(String? roomId)? onChatRoomEntriesSynced;

  /// 聊天室 KV 发生变化的回调
  /// - [operationType] 操作的类型
  /// - [roomId]   聊天室 ID
  /// - [entries]  发送变化的 KV
  Function(RCIMIWChatRoomEntriesOperationType? operationType, String? roomId, Map? entries)? onChatRoomEntriesChanged;

  /// 超级群消息 kv 被更新
  /// - [messages] 被更新的消息集合
  Function(List<RCIMIWMessage>? messages)? onRemoteUltraGroupMessageExpansionUpdated;

  /// 超级群消息被更改
  /// - [messages] 被更新的消息集合
  Function(List<RCIMIWMessage>? messages)? onRemoteUltraGroupMessageModified;

  /// 超级群消息被撤回
  /// - [messages] 撤回的消息集合
  Function(List<RCIMIWMessage>? messages)? onRemoteUltraGroupMessageRecalled;

  /// 超级群已读的监听
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp]
  Function(String? targetId, String? channelId, int? timestamp)? onUltraGroupReadTimeReceived;

  /// 用户输入状态变化的回调
  /// 当客户端收到用户输入状态的变化时，会回调此接口，通知发生变化的会话以及当前正在输入的RCUltraGroupTypingStatusInfo列表
  /// - [info] 正在输入的RCUltraGroupTypingStatusInfo列表（nil标示当前没有用户正在输入）
  Function(List<RCIMIWUltraGroupTypingStatusInfo>? info)? onUltraGroupTypingStatusChanged;

  /// 发送含有敏感词消息被拦截的回调
  /// - [info] 被拦截消息的相关信息
  Function(RCIMIWBlockedMessageInfo? info)? onMessageBlocked;

  /// 聊天室状态发生变化的监听
  /// - [targetId] 会话 ID
  /// - [status] 聊天室变化的状态
  Function(String? targetId, RCIMIWChatRoomStatus? status)? onChatRoomStatusChanged;

  /// 收到群聊已读回执请求的监听
  /// - [targetId] 会话 ID
  /// - [messageUId] 消息的 messageUid
  Function(String? targetId, String? messageUId)? onGroupMessageReadReceiptRequestReceived;

  /// 收到群聊已读回执响应的监听
  /// - [targetId] 会话 ID
  /// - [messageUId] 收到回执响应的消息的 messageUId
  /// - [respondUserIds] 会话中响应了此消息的用户列表。其中 key： 用户 id ； value： 响应时间。
  Function(String? targetId, String? messageUId, Map? respondUserIds)? onGroupMessageReadReceiptResponseReceived;

  /// [connect] 的接口监听，收到链接结果的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 链接成功的用户 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId)? onConnected;

  /// [connect] 的接口监听，数据库打开时发生的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code)? onDatabaseOpened;

  /// [loadConversation] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type]    会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversation] 获取到的会话
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWConversation? conversation,
  )?
  onConversationLoaded;

  /// [loadConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，
  /// - [startTime]    时间戳（毫秒）
  /// - [count]   查询的数量
  /// - [conversations] 查询到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
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

  /// [removeConversation] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId)? onConversationRemoved;

  /// [removeConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWConversationType>? conversationTypes, String? channelId)? onConversationsRemoved;

  /// [loadTotalUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? channelId, int? count)? onTotalUnreadCountLoaded;

  /// [loadUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? count)?
  onUnreadCountLoaded;

  /// [loadUnreadCountByConversationTypes] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [count]   未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWConversationType>? conversationTypes, String? channelId, bool? contain, int? count)?
  onUnreadCountByConversationTypesLoaded;

  /// [loadUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? count)?
  onUnreadMentionedCountLoaded;

  /// [loadUltraGroupAllUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? count)? onUltraGroupAllUnreadCountLoaded;

  /// [loadUltraGroupAllUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? count)? onUltraGroupAllUnreadMentionedCountLoaded;

  /// 超级群列表同步完成的回调

  Function()? onUltraGroupConversationsSynced;

  /// [clearUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话已阅读的最后一条消息的发送时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? timestamp)?
  onUnreadCountCleared;

  /// [saveDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿信息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, String? draft)?
  onDraftMessageSaved;

  /// [clearDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId)? onDraftMessageCleared;

  /// [loadDraftMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿信息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, String? draft)?
  onDraftMessageLoaded;

  /// [loadBlockedConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversations] 获取到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWConversation>? conversations,
  )?
  onBlockedConversationsLoaded;

  /// [changeConversationTopStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, bool? top)?
  onConversationTopStatusChanged;

  /// [loadConversationTopStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, bool? top)?
  onConversationTopStatusLoaded;

  /// [syncConversationReadStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 会话中已读的最后一条消息的发送时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? timestamp)?
  onConversationReadStatusSynced;

  /// [sendMessage] 的接口监听
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMessage? message)? onMessageAttached;

  /// [sendMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onMessageSent;

  /// [sendMediaMessage] 的接口监听
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMediaMessage? message)? onMediaMessageAttached;

  /// [sendMediaMessage] 的接口监听
  /// - [message] 发送的消息
  /// - [progress] 发送的进度
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageSending;

  /// [cancelSendingMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onSendingMediaMessageCanceled;

  /// [sendMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onMediaMessageSent;

  /// [downloadMediaMessage] 的接口监听
  /// - [message] 下载的消息
  /// - [progress] 下载的进度
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMediaMessage? message, int? progress)? onMediaMessageDownloading;

  /// [downloadMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 下载的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onMediaMessageDownloaded;

  /// [cancelDownloadingMediaMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 取消下载的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMediaMessage? message)? onDownloadingMediaMessageCanceled;

  /// [loadMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [messages] 获取到的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
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

  /// [loadUnreadMentionedMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 获取到的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, List<RCIMIWMessage>? messages)?
  onUnreadMentionedMessagesLoaded;

  /// [loadFirstUnreadMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [message] 获取到的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, RCIMIWMessage? message)?
  onFirstUnreadMessageLoaded;

  /// [insertMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 插入的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onMessageInserted;

  /// [insertMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messages] 插入的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWMessage>? messages)? onMessagesInserted;

  /// [clearMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? timestamp)?
  onMessagesCleared;

  /// [deleteLocalMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messages] 删除的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWMessage>? messages)? onLocalMessagesDeleted;

  /// [deleteMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 删除的消息集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, List<RCIMIWMessage>? messages)?
  onMessagesDeleted;

  /// [recallMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 撤回的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onMessageRecalled;

  /// [sendPrivateReadReceiptMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, int? timestamp)? onPrivateReadReceiptMessageSent;

  /// [updateMessageExpansion] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId, Map? expansion)? onMessageExpansionUpdated;

  /// [removeMessageExpansionForKeys] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId, List<String>? keys)? onMessageExpansionForKeysRemoved;

  /// [changeMessageReceiveStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageId] 消息的 messageId
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? messageId)? onMessageReceiveStatusChanged;

  /// [changeMessageSentStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageId] 消息的 messageId
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, int? messageId)? onMessageSentStatusChanged;

  /// [joinChatRoom] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId)? onChatRoomJoined;

  /// 正在加入聊天室的回调
  /// - [targetId] 聊天室 ID
  Function(String? targetId)? onChatRoomJoining;

  /// [leaveChatRoom] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId)? onChatRoomLeft;

  /// [loadChatRoomMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [messages] 加载到的消息
  /// - [syncTime] 下次拉取的时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, List<RCIMIWMessage>? messages, int? syncTime)? onChatRoomMessagesLoaded;

  /// [addChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性名称
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? key)? onChatRoomEntryAdded;

  /// [addChatRoomEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entries] 聊天室属性
  /// - [errorEntries] 发生错误的属性
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, Map? entries, Map? errorEntries)? onChatRoomEntriesAdded;

  /// [loadChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entry] 获取到的属性。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, Map? entry)? onChatRoomEntryLoaded;

  /// [loadChatRoomAllEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [entries] 获取到的属性集合。
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, Map? entries)? onChatRoomAllEntriesLoaded;

  /// [removeChatRoomEntry] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [key] 聊天室属性键值
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? key)? onChatRoomEntryRemoved;

  /// [removeChatRoomEntries] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [keys] 聊天室属性键值集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, List<String>? keys)? onChatRoomEntriesRemoved;

  /// [addToBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId)? onBlacklistAdded;

  /// [removeFromBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId)? onBlacklistRemoved;

  /// [loadBlacklistStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userId] 用户 ID
  /// - [status] 当前状态
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? userId, RCIMIWBlacklistStatus? status)? onBlacklistStatusLoaded;

  /// [loadBlacklist] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [userIds] 用户 ID 集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<String>? userIds)? onBlacklistLoaded;

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

  /// [searchConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageTypes] 搜索的消息类型
  /// - [keyword]      搜索的关键字
  /// - [conversations] 查询到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
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

  /// sendGroupReadReceiptRequest 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 需要请求已读回执的消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onGroupReadReceiptRequestSent;

  /// [sendGroupReadReceiptResponse] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 会话中需要发送已读回执的消息列表
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, List<RCIMIWMessage>? messages)?
  onGroupReadReceiptResponseSent;

  /// [changeNotificationQuietHours] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [startTime] 开始消息免打扰时间
  /// - [spanMinutes] 需要消息免打扰分钟数，0 < spanMinutes < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为 01:00，则 spanMinutes 为 60 分钟。设置为 1439 代表全天免打扰 （23 60 + 59 = 1439 ））
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? startTime, int? spanMinutes, RCIMIWPushNotificationQuietHoursLevel? level)?
  onNotificationQuietHoursChanged;

  /// [removeNotificationQuietHours] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code)? onNotificationQuietHoursRemoved;

  /// [loadNotificationQuietHours] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [startTime] 开始消息免打扰时间
  /// - [spanMinutes] 已设置的屏蔽时间分钟数，0 < spanMinutes < 1440
  /// - [level]  消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? startTime, int? spanMinutes, RCIMIWPushNotificationQuietHoursLevel? level)?
  onNotificationQuietHoursLoaded;

  /// [changeConversationNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )?
  onConversationNotificationLevelChanged;

  /// [loadConversationNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [level] 当前会话的消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    RCIMIWConversationType? type,
    String? targetId,
    String? channelId,
    RCIMIWPushNotificationLevel? level,
  )?
  onConversationNotificationLevelLoaded;

  /// [changeConversationTypeNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, RCIMIWPushNotificationLevel? level)?
  onConversationTypeNotificationLevelChanged;

  /// [loadConversationTypeNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, RCIMIWPushNotificationLevel? level)?
  onConversationTypeNotificationLevelLoaded;

  /// [changeUltraGroupDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, RCIMIWPushNotificationLevel? level)?
  onUltraGroupDefaultNotificationLevelChanged;

  /// [loadUltraGroupDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, RCIMIWPushNotificationLevel? level)? onUltraGroupDefaultNotificationLevelLoaded;

  /// [changeUltraGroupChannelDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, RCIMIWPushNotificationLevel? level)?
  onUltraGroupChannelDefaultNotificationLevelChanged;

  /// [loadUltraGroupChannelDefaultNotificationLevel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, RCIMIWPushNotificationLevel? level)?
  onUltraGroupChannelDefaultNotificationLevelLoaded;

  /// [changePushContentShowStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [showContent] 是否显示远程推送内容
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, bool? showContent)? onPushContentShowStatusChanged;

  /// [changePushLanguage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [language] 推送语言
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? language)? onPushLanguageChanged;

  /// [changePushReceiveStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [receive] 是否接收
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, bool? receive)? onPushReceiveStatusChanged;

  /// [loadMessageCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [count] 消息的数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, String? channelId, int? count)?
  onMessageCountLoaded;

  /// [loadTopConversations] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [conversations] 加载的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(
    int? code,
    List<RCIMIWConversationType>? conversationTypes,
    String? channelId,
    List<RCIMIWConversation>? conversations,
  )?
  onTopConversationsLoaded;

  /// [sendGroupMessageToDesignatedUsers] 的接口监听
  /// 消息存入数据库的回调
  /// - [message] 发送的消息内容
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(RCIMIWMessage? message)? onGroupMessageToDesignatedUsersAttached;

  /// [sendGroupMessageToDesignatedUsers] 的接口监听
  /// 消息发送完成的回调
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 发送的消息内容
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message)? onGroupMessageToDesignatedUsersSent;

  /// [syncUltraGroupReadStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 已读时间
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, int? timestamp)? onUltraGroupReadStatusSynced;

  /// [loadConversationsForAllChannel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [type]     会话类型
  /// - [targetId] 会话 ID
  /// - [conversations] 获取到的会话集合
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWConversationType? type, String? targetId, List<RCIMIWConversation>? conversations)?
  onConversationsLoadedForAllChannel;

  /// [loadUltraGroupUnreadMentionedCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, int? count)? onUltraGroupUnreadMentionedCountLoaded;

  /// [loadUltraGroupUnreadCount] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [count] 未读数量
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, int? count)? onUltraGroupUnreadCountLoaded;

  /// [modifyUltraGroupMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId)? onUltraGroupMessageModified;

  /// [recallUltraGroupMessage] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [message] 撤回的消息
  /// - [deleteRemote] 调用接口时传入的是否删除远端消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, RCIMIWMessage? message, bool? deleteRemote)? onUltraGroupMessageRecalled;

  /// [clearUltraGroupMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 时间戳
  /// - [policy] 清除策略
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, int? timestamp, RCIMIWMessageOperationPolicy? policy)?
  onUltraGroupMessagesCleared;

  /// [clearUltraGroupMessagesForAllChannel] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, int? timestamp)? onUltraGroupMessagesClearedForAllChannel;

  /// [sendUltraGroupTypingStatus] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [typingStatus] 输入状态枚举
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? targetId, String? channelId, RCIMIWUltraGroupTypingStatus? typingStatus)?
  onUltraGroupTypingStatusSent;

  /// [loadBatchRemoteUltraGroupMessages] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [matchedMessages] 从服务获取的消息列表
  /// - [notMatchedMessages] 非法参数或者从服务没有拿到对应消息
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, List<RCIMIWMessage>? matchedMessages, List<RCIMIWMessage>? notMatchedMessages)?
  onBatchRemoteUltraGroupMessagesLoaded;

  /// [updateUltraGroupMessageExpansion] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [expansion] 更新的消息扩展信息键值对
  /// - [messageUId] 消息的 messageUid
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, Map? expansion, String? messageUId)? onUltraGroupMessageExpansionUpdated;

  /// [removeUltraGroupMessageExpansionForKeys] 的接口监听
  /// - [code] 接口回调的状态码，0 代表成功，非 0 代表出现异常
  /// - [messageUId] 消息的 messageUid
  /// - [keys]  消息扩展信息中待删除的 key 的列表
  /// @deprecated 请使用对应接口提供的 callback 获取结果。
  @Deprecated('建议在调用接口时直接传入 callback 参数，此回调从 5.4.0 版本开始不推荐使用')
  Function(int? code, String? messageUId, List<String>? keys)? onUltraGroupMessageExpansionForKeysRemoved;

  /// 群组操作回调
  /// - [groupId] 群组ID
  /// - [operatorInfo] 操作者信息。服务端 api 操作踢出时为空。
  /// - [groupInfo] 群组信息，仅在操作类型为创建群组时有效。
  /// - [operation] 操作类型
  /// - [memberInfos] 目标用户信息列表
  /// - [operation]Time 操作时间
  Function(
    String? groupId,
    RCIMIWGroupMemberInfo? operatorInfo,
    RCIMIWGroupInfo? groupInfo,
    RCIMIWGroupOperation? operation,
    List<RCIMIWGroupMemberInfo>? memberInfos,
    int? operationTime,
  )?
  onGroupOperation;

  /// 群组资料变更回调
  /// - [operatorInfo] 操作人用户信息
  /// - [fullGroupInfo] 群组信息。注意：只有包含在 updateKeys 中的属性值有效
  /// - [changedGroupInfo] 变更的群组信息
  /// - [operationTime] 操作时间。
  Function(
    RCIMIWGroupMemberInfo? operatorInfo,
    RCIMIWGroupInfo? fullGroupInfo,
    RCIMIWGroupInfo? changedGroupInfo,
    int? operationTime,
  )?
  onGroupInfoChanged;

  /// 群成员资料变更回调
  /// - [groupId] 群组ID
  /// - [operatorInfo] 操作者信息
  /// - [memberInfo] 有变更的群成员资料
  /// - [operationTime] 操作时间
  Function(String? groupId, RCIMIWGroupMemberInfo? operatorInfo, RCIMIWGroupMemberInfo? memberInfo, int? operationTime)?
  onGroupMemberInfoChanged;

  /// 群申请事件回调
  /// - [info] 包含以下事件： 用户申请加入群组的*申请*或*结果*；邀请加入群组的*申请*或*结果*
  Function(RCIMIWGroupApplicationInfo? info)? onGroupApplicationEvent;

  /// 群备注名更新多端同步回调事件
  /// - [groupId] 群组ID
  /// - [operationType] 操作类型，添加或移除
  /// - [groupRemark] 群备注名
  /// - [operationTime] 操作时间
  Function(String? groupId, RCIMIWGroupOperationType? operationType, String? groupRemark, int? operationTime)?
  onGroupRemarkChangedSync;

  /// 群成员特别关注变更多端同步回调事件
  /// - [groupId] 群组ID
  /// - [operationType] 操作类型，添加或移除
  /// - [userIds] 用户ID列表
  /// - [operationTime] 操作时间
  Function(String? groupId, RCIMIWGroupOperationType? operationType, List<String>? userIds, int? operationTime)?
  onGroupFollowsChangedSync;

  /// 多端登录相关事件通知回调
  /// - [event] 同步事件信息
  Function(RCIMIWChatRoomSyncEvent? event)? onChatRoomNotifyMultiLoginSync;

  /// 封禁用户相关事件通知回调
  /// - [event] 封禁事件信息
  Function(RCIMIWChatRoomMemberBlockEvent? event)? onChatRoomNotifyBlock;

  /// 禁言相关事件通知回调
  /// - [event] 禁言事件信息
  Function(RCIMIWChatRoomMemberBanEvent? event)? onChatRoomNotifyBan;
}
