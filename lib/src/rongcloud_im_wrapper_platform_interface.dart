import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'rongcloud_im_wrapper_method_channel.dart';
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

abstract class RCIMWrapperPlatform extends PlatformInterface {
  RCIMWrapperPlatform() : super(token: _token);

  static final Object _token = Object();

  static RCIMWrapperPlatform _instance = RCIMWrapperMethodChannel();

  static RCIMWrapperPlatform get instance => _instance;

  RCIMIWEngine? _engine;

  RCIMIWEngine? get engine => _engine;

  static set instance(RCIMWrapperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void setEngine(RCIMIWEngine engine) {
    _engine = engine;
  }

  /// 引擎构建方法
  /// - [appKey] 开发者后台获取的 AppKey
  /// - [options] 引擎相关配置项
  Future<void> create(String appKey, RCIMIWEngineOptions options) {
    throw UnimplementedError('create() has not been implemented.');
  }

  /// 销毁引擎
  Future<void> destroy() {
    throw UnimplementedError('destroy() has not been implemented.');
  }

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
  /// @param messageIdentifier The unique identifier of the message
  /// @param persistentFlag The storage strategy of the message
  /// ---
  Future<int> registerNativeCustomMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    throw UnimplementedError('registerNativeCustomMessage() has not been implemented.');
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
  /// @param messageIdentifier The unique identifier of the message.
  /// @param persistentFlag The storage strategy of the message.
  /// ---
  Future<int> registerNativeCustomMediaMessage(
    String messageIdentifier,
    RCIMIWNativeCustomMessagePersistentFlag persistentFlag,
  ) async {
    throw UnimplementedError('registerNativeCustomMediaMessage() has not been implemented.');
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
  /// @param token The token obtained by calling the server API.
  /// @param timeout Connection timeout duration in seconds.
  /// If timeout ≤ 0, the IM will keep trying to connect until it succeeds or fails (e.g., due to an invalid token).
  /// If timeout > 0, the IM will attempt to connect for a maximum of timeout seconds.
  /// If the connection is successful within timeLimit seconds, the SDK will automatically reconnect in case of network changes or app state transitions. If the connection fails within timeLimit seconds, no further reconnection attempts will be made, and the listener will notify of a connection timeout. You will need to manually call the connect interface again.
  /// @param callback Connection event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener The interface callback can listen to [onConnected].
  /// ---
  Future<int> connect(String token, int timeout, {RCIMIWConnectCallback? callback}) async {
    throw UnimplementedError('connect() has not been implemented.');
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
  /// @param receivePush Specifies whether to receive push notifications after disconnection. true: continue receiving remote push notifications after disconnection; false: stop receiving remote push notifications after disconnection.
  /// ---
  Future<int> disconnect(bool receivePush) async {
    throw UnimplementedError('disconnect() has not been implemented.');
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
    throw UnimplementedError('getConnectionStatus() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param targetId Specifies the conversation ID.
  /// @param channelId Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass `null`.
  /// @param text Specifies the text content.
  /// ---
  Future<RCIMIWTextMessage?> createTextMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String text,
  ) async {
    throw UnimplementedError('createTextMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param path Local path of the image message. Must be a valid path.
  /// ---
  Future<RCIMIWImageMessage?> createImageMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    throw UnimplementedError('createImageMessage() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param targetId Specifies the conversation ID.
  /// @param channelId Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// @param path Specifies the local path of the file message, which must be a valid path.
  /// ---
  Future<RCIMIWFileMessage?> createFileMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    throw UnimplementedError('createFileMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param path Local path of the short video message. Must be a valid path.
  /// @param duration Duration of the short video message
  /// ---
  Future<RCIMIWSightMessage?> createSightMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    throw UnimplementedError('createSightMessage() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param targetId Specifies the conversation ID.
  /// @param channelId Specifies the channel ID. Only supported for ultra groups. For other conversation types, pass null.
  /// @param path Specifies the local path of the voice message. Must be a valid path.
  /// @param duration Specifies the duration of the voice message.
  /// ---
  Future<RCIMIWVoiceMessage?> createVoiceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
    int duration,
  ) async {
    throw UnimplementedError('createVoiceMessage() has not been implemented.');
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
  /// @param type   Conversation type
  /// @param targetId    Conversation ID
  /// @param channelId   Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param referenceMessage The referenced message
  /// @param text   The referenced text content
  /// ---
  Future<RCIMIWReferenceMessage?> createReferenceMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWMessage referenceMessage,
    String text,
  ) async {
    throw UnimplementedError('createReferenceMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param path Local path of the GIF message
  /// ---
  Future<RCIMIWGIFMessage?> createGIFMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String path,
  ) async {
    throw UnimplementedError('createGIFMessage() has not been implemented.');
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
  /// @param type    Conversation type
  /// @param targetId     Conversation ID
  /// @param channelId    Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param policy  Message storage policy
  /// @param messageIdentifier Message identifier, must be unique
  /// @param fields  Key-value pairs of message content
  /// ---
  Future<RCIMIWCustomMessage?> createCustomMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWCustomMessagePolicy policy,
    String messageIdentifier,
    Map fields,
  ) async {
    throw UnimplementedError('createCustomMessage() has not been implemented.');
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
  /// @param type     Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param longitude Longitude
  /// @param latitude Latitude
  /// @param poiName  POI information
  /// @param thumbnailPath Local path of the thumbnail, must be a valid path
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
    throw UnimplementedError('createLocationMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param messageIdentifier Unique identifier for the message
  /// @param fields Key-value pairs for the message content
  /// ---
  Future<RCIMIWNativeCustomMessage?> createNativeCustomMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String messageIdentifier,
    Map fields,
  ) async {
    throw UnimplementedError('createNativeCustomMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param messageIdentifier Unique identifier for the message
  /// @param path Local path of the media file, must be a valid path
  /// @param fields Key-value pairs for the message content
  /// ---
  Future<RCIMIWNativeCustomMediaMessage?> createNativeCustomMediaMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String messageIdentifier,
    String path,
    Map fields,
  ) async {
    throw UnimplementedError('createNativeCustomMediaMessage() has not been implemented.');
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
  /// @param message The message object to be sent.
  /// @param callback The event callback for sending the message. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener The interface callback can listen to [onMessageAttached], [onMessageSent].
  /// ---
  Future<int> sendMessage(RCIMIWMessage message, {RCIMIWSendMessageCallback? callback}) async {
    throw UnimplementedError('sendMessage() has not been implemented.');
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
  /// @param message The media message object to be sent
  /// @param listener Event listener for sending media messages
  /// @listener The interface callback can listen to [onMediaMessageSending], [onMediaMessageAttached], [onMediaMessageSent]
  /// ---
  Future<int> sendMediaMessage(RCIMIWMediaMessage message, {RCIMIWSendMediaMessageListener? listener}) async {
    throw UnimplementedError('sendMediaMessage() has not been implemented.');
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
  /// @param message The media message entity to be canceled
  /// @param callback The event callback for canceling the media message. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener The interface callback can be monitored via [onSendingMediaMessageCanceled]
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelSendingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelSendingMediaMessageCallback? callback,
  }) async {
    throw UnimplementedError('cancelSendingMediaMessage() has not been implemented.');
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
  /// @param message The media message entity to be downloaded
  /// @param listener The event listener for media message download
  /// @listener  [onMediaMessageDownloaded], [onMediaMessageDownloading]
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> downloadMediaMessage(RCIMIWMediaMessage message, {RCIMIWDownloadMediaMessageListener? listener}) async {
    throw UnimplementedError('downloadMediaMessage() has not been implemented.');
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
  /// @param message The media message entity for which the download needs to be canceled.
  /// @param callback The event callback for canceling the media message download. The SDK supports callback-based notifications starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelDownloadingMediaMessage(
    RCIMIWMediaMessage message, {
    IRCIMIWCancelDownloadingMediaMessageCallback? callback,
  }) async {
    throw UnimplementedError('cancelDownloadingMediaMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups; pass null for other conversation types
  /// @deprecated Use {@link #getConversation(RCIMIWConversationType, String, String, IRCIMIWGetConversationCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversation] 代替')
  Future<int> loadConversation(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadConversation() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param callback Callback for retrieving the conversation. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onConversationLoaded]
  Future<int> getConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationCallback? callback,
  }) async {
    throw UnimplementedError('getConversation() has not been implemented.');
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
  /// @param conversationTypes Conversation types
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param startTime Timestamp (in milliseconds). Retrieve conversations with timestamps earlier than this value. Pass 0 to query the latest data.
  /// @param count Number of conversations to query, 0 < count ≤ 50
  /// @deprecated Use {@link #getConversations(List, String, long, int, IRCIMIWGetConversationsCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversations] 代替')
  Future<int> loadConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count,
  ) async {
    throw UnimplementedError('loadConversations() has not been implemented.');
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
  /// @param conversationTypes Specifies the conversation types.
  /// @param channelId Indicates the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// @param startTime Represents the timestamp (in milliseconds) for retrieving conversations before this time. Pass 0 to query the latest data.
  /// @param count Specifies the number of conversations to retrieve, where 0 < count ≤ 50.
  /// @param callback Indicates the callback for retrieving the conversation list. The SDK supports callback-based retrieval starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onConversationsLoaded]
  Future<int> getConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    throw UnimplementedError('getConversations() has not been implemented.');
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
  /// @param conversationTypes Conversation type
  /// @param channelId  Channel ID (ultra group only), set null for other types
  /// @param startTime    Timestamp in ms (0 for latest data)
  /// @param count   Number to query (0 < count ≤ 50)
  /// @param topPriority  Pin priority: true/false
  /// @param callback     Callback for conversation list
  /// ---
  Future<int> getConversationsWithPriority(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    int startTime,
    int count,
    bool topPriority, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    throw UnimplementedError('getConversationsWithPriority() has not been implemented.');
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
  /// @param conversationTypes Supported conversation types include one-to-one chat, group chat, and system conversation.
  /// @param callback Callback function for retrieving the conversation list.
  /// ---
  Future<int> getUnreadConversations(
    List<RCIMIWConversationType> conversationTypes, {
    IRCIMIWGetUnreadConversationsCallback? callback,
  }) async {
    throw UnimplementedError('getUnreadConversations() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types
  /// @param callback Callback for the conversation removal event. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> removeConversation(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWRemoveConversationCallback? callback,
  }) async {
    throw UnimplementedError('removeConversation() has not been implemented.');
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
  /// @param conversationTypes A collection of conversation types
  /// @param channelId    Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param callback     Callback for the conversation removal event. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWRemoveConversationsCallback? callback,
  }) async {
    throw UnimplementedError('removeConversations() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Use {@link #getUnreadCount(RCIMIWConversationType, String, String, IRCIMIWGetUnreadCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUnreadCount] 代替')
  Future<int> loadUnreadCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadUnreadCount() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param callback Callback for retrieving the unread count of the conversation. SDK supports callback-based retrieval starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onUnreadCountLoaded]
  Future<int> getUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadCountCallback? callback,
  }) async {
    throw UnimplementedError('getUnreadCount() has not been implemented.');
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
  /// @param channelId Indicates the channel ID. This parameter is only supported for ultra groups. For other conversation types, pass `null`.
  /// @deprecated Use {@link #getTotalUnreadCount(String, IRCIMIWGetTotalUnreadCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getTotalUnreadCount] 代替')
  Future<int> loadTotalUnreadCount(String? channelId) async {
    throw UnimplementedError('loadTotalUnreadCount() has not been implemented.');
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
  /// @param channelId Channel ID, supported only for ultra groups. For other conversation types, pass null.
  /// @param callback Callback for the total unread count event. The SDK supports callback-based handling starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in the 6.x version. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onTotalUnreadCountLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  Future<int> getTotalUnreadCount(String? channelId, {IRCIMIWGetTotalUnreadCountCallback? callback}) async {
    throw UnimplementedError('getTotalUnreadCount() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param targetId Specifies the conversation ID.
  /// @param channelId Specifies the channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getUnreadMentionedCount(RCIMIWConversationType, String, String, IRCIMIWGetUnreadMentionedCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUnreadMentionedCount] 代替')
  Future<int> loadUnreadMentionedCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadUnreadMentionedCount() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param targetId Specifies the conversation ID.
  /// @param channelId Specifies the channel ID. This is only supported for ultra groups. For other conversation types, pass `null`.
  /// @param callback Callback triggered when the count of unread @ messages is retrieved. The SDK has supported callback mode since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// @listener [onUnreadMentionedCountLoaded]
  Future<int> getUnreadMentionedCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedCountCallback? callback,
  }) async {
    throw UnimplementedError('getUnreadMentionedCount() has not been implemented.');
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
    throw UnimplementedError('loadUltraGroupAllUnreadCount() has not been implemented.');
  }

  /// [ZH]
  /// ---
  /// 获取当前用户加入的所有超级群会话的未读消息数的总和。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Get the total count of unread messages from all ultra group conversations the current user has joined.
  /// @param callback Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If a callback parameter is provided, only the callback will be triggered.
  /// @listener [onUltraGroupAllUnreadCountLoaded]
  Future<int> getUltraGroupAllUnreadCount({IRCIMIWGetUltraGroupAllUnreadCountCallback? callback}) async {
    throw UnimplementedError('getUltraGroupAllUnreadCount() has not been implemented.');
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
    throw UnimplementedError('loadUltraGroupAllUnreadMentionedCount() has not been implemented.');
  }

  /// [ZH]
  /// ---
  /// 获取当前用户加入的所有超级群会话中的未读 @ 消息数的总和。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the total count of unread @ mentions across all ultra group conversations the current user has joined.
  /// @param callback Event callback. SDK supports callback-based events starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback event will be triggered.
  /// @listener [onUltraGroupAllUnreadMentionedCountLoaded]
  Future<int> getUltraGroupAllUnreadMentionedCount({
    IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback,
  }) async {
    throw UnimplementedError('getUltraGroupAllUnreadMentionedCount() has not been implemented.');
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
  /// @param targetId The conversation ID
  /// @deprecated Use {@link #getUltraGroupUnreadCount(String, IRCIMIWGetUltraGroupUnreadCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupUnreadCount] 代替')
  Future<int> loadUltraGroupUnreadCount(String targetId) async {
    throw UnimplementedError('loadUltraGroupUnreadCount() has not been implemented.');
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
  /// @param targetId Conversation ID
  /// @param callback Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onUltraGroupUnreadCountLoaded]
  Future<int> getUltraGroupUnreadCount(String targetId, {IRCIMIWGetUltraGroupUnreadCountCallback? callback}) async {
    throw UnimplementedError('getUltraGroupUnreadCount() has not been implemented.');
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
  /// @param targetId The conversation ID.
  /// @deprecated Use {@link #getUltraGroupUnreadMentionedCount(String, IRCIMIWGetUltraGroupUnreadMentionedCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupUnreadMentionedCount] 代替')
  Future<int> loadUltraGroupUnreadMentionedCount(String targetId) async {
    throw UnimplementedError('loadUltraGroupUnreadMentionedCount() has not been implemented.');
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
  /// @param targetId The conversation ID
  /// @param callback The event callback. SDK supports callback-style events starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If a callback parameter is provided, only the callback will be triggered.
  /// @listener [onUltraGroupUnreadMentionedCountLoaded]
  Future<int> getUltraGroupUnreadMentionedCount(
    String targetId, {
    IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback,
  }) async {
    throw UnimplementedError('getUltraGroupUnreadMentionedCount() has not been implemented.');
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
  /// @param conversationTypes Specifies the collection of conversation types.
  /// @param channelId Indicates the channel ID. This parameter is only supported for ultra groups. For other conversation types, pass `null`.
  /// @param contain Indicates whether to include unread messages from muted conversations.
  /// @deprecated Use {@link #getUnreadCountByConversationTypes(List, String, boolean, IRCIMIWGetUnreadCountByConversationTypesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getUnreadCountByConversationTypes] 代替')
  Future<int> loadUnreadCountByConversationTypes(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    bool contain,
  ) async {
    throw UnimplementedError('loadUnreadCountByConversationTypes() has not been implemented.');
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
  /// @param conversationTypes Specifies the collection of conversation types.
  /// @param channelId Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// @param contain Indicates whether to include unread messages from muted conversations.
  /// @param callback Specifies the event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onUnreadCountByConversationTypesLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  Future<int> getUnreadCountByConversationTypes(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    bool contain, {
    IRCIMIWGetUnreadCountByConversationTypesCallback? callback,
  }) async {
    throw UnimplementedError('getUnreadCountByConversationTypes() has not been implemented.');
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
  /// @param conversationTypes List of conversation types
  /// @param levels List of DND levels
  /// @param callback Callback for unread message count
  /// ---
  Future<int> getUnreadCountByLevels(
    List<RCIMIWConversationType> conversationTypes,
    List<RCIMIWPushNotificationLevel> levels, {
    IRCIMIWGetUnreadCountByLevelsCallback? callback,
  }) async {
    throw UnimplementedError('getUnreadCountByLevels() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param timestamp The timestamp of the last read message in the conversation. Pass the latest timestamp to clear all.
  /// @param callback Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in the 6.x version. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> clearUnreadCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWClearUnreadCountCallback? callback,
  }) async {
    throw UnimplementedError('clearUnreadCount() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param draft The text content of the draft.
  /// @param callback Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> saveDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String draft, {
    IRCIMIWSaveDraftMessageCallback? callback,
  }) async {
    throw UnimplementedError('saveDraftMessage() has not been implemented.');
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
  /// @param type The type of the conversation.
  /// @param targetId The ID of the conversation.
  /// @param channelId The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getDraftMessage(RCIMIWConversationType, String, String, IRCIMIWGetDraftMessageCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getDraftMessage] 代替')
  Future<int> loadDraftMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadDraftMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, supported only for ultra groups. Pass null for other conversation types.
  /// @param callback Event callback. The SDK supports callback-based event handling starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onDraftMessageLoaded]
  Future<int> getDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetDraftMessageCallback? callback,
  }) async {
    throw UnimplementedError('getDraftMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param callback Event callback. SDK supports callback mode from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onDraftMessageCleared]
  /// ---
  Future<int> clearDraftMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWClearDraftMessageCallback? callback,
  }) async {
    throw UnimplementedError('clearDraftMessage() has not been implemented.');
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
  /// @param conversationTypes Collection of conversation types
  /// @param channelId Channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// @deprecated Use {@link #getBlockedConversations(List, String, IRCIMIWGetBlockedConversationsCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  @Deprecated('请使用 [getBlockedConversations] 代替')
  Future<int> loadBlockedConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    throw UnimplementedError('loadBlockedConversations() has not been implemented.');
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
  /// @param conversationTypes A collection of conversation types.
  /// @param channelId    The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param callback     The event callback. The SDK has supported callback-based responses since version 5.3.1. Other callback methods for this interface have been deprecated since version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBlockedConversationsLoaded]
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  Future<int> getBlockedConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetBlockedConversationsCallback? callback,
  }) async {
    throw UnimplementedError('getBlockedConversations() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param targetId Specifies the conversation ID.
  /// @param channelId Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// @param top  Indicates whether to pin the conversation.
  /// @param callback Specifies the event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口在 Flutter For Web 端不支持超级群
  Future<int> changeConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    bool top, {
    IRCIMIWChangeConversationTopStatusCallback? callback,
  }) async {
    throw UnimplementedError('changeConversationTopStatus() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID (ultra group only, set null for others)
  /// @param top Pin status
  /// @param updateOperationTime Update operation timestamp (default: false)
  /// @param callback Event callback (supported since v5.3.1). Other callback methods deprecated in v5.4.0 and will be removed in v6.x. Callback param overrides all other callbacks.
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
    throw UnimplementedError('changeConversationTopStatusWithUpdateTme() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getConversationTopStatus(RCIMIWConversationType, String, String, IRCIMIWGetConversationTopStatusCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口在 Flutter For Web 端不支持超级群
  @Deprecated('请使用 [getConversationTopStatus] 代替')
  Future<int> loadConversationTopStatus(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadConversationTopStatus() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param callback Event callback. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onConversationTopStatusLoaded]
  /// 此接口在 Flutter For Web 端不支持超级群
  Future<int> getConversationTopStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationTopStatusCallback? callback,
  }) async {
    throw UnimplementedError('getConversationTopStatus() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param timestamp Timestamp of the last read message in the conversation
  /// @param callback Event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> syncConversationReadStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSyncConversationReadStatusCallback? callback,
  }) async {
    throw UnimplementedError('syncConversationReadStatus() has not been implemented.');
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
  /// @param type   Specifies the conversation type
  /// @param targetId Specifies the conversation ID
  /// @param channelId Specifies the channel ID, which is only supported for ultra groups. For other conversation types, pass null.
  /// @param currentType Specifies the current status
  /// ---
  Future<int> sendTypingStatus(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    String currentType,
  ) async {
    throw UnimplementedError('sendTypingStatus() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, supported only for ultra groups. Pass `null` for other conversation types.
  /// @param sentTime Timestamp of the current message
  /// @param order Direction of message retrieval. `BEFORE`: Retrieve messages before `sentTime` (in descending order). `AFTER`: Retrieve messages after `sentTime` (in ascending order).
  /// @param policy Message loading policy. `LOCAL`: Load only local messages. `REMOTE`: Load only remote messages. `LOCAL_REMOTE`: Load both local and remote messages.
  /// @param count Number of messages to retrieve. Must satisfy `0 < count ≤ 20`.
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
    throw UnimplementedError('loadMessages() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param sentTime Timestamp of the current message
  /// @param order Direction to fetch messages. BEFORE: Fetch messages before sentTime (in descending order). AFTER: Fetch messages after sentTime (in ascending order).
  /// @param policy Message loading strategy. LOCAL: Load only local messages. REMOTE: Load only remote messages. LOCAL_REMOTE: Load both local and remote messages.
  /// @param count Number of messages to fetch, where 0 < count ≤ 20
  /// @param callback Event callback. SDK supports callback starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
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
    throw UnimplementedError('getMessages() has not been implemented.');
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
  /// @param messageId The messageId of the message, which can be obtained from the message object.
  /// @param callback The event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageById(int messageId, {IRCIMIWGetMessageCallback? callback}) async {
    throw UnimplementedError('getMessageById() has not been implemented.');
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
  /// @param messageUId The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// @param callback The event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageByUId(String messageUId, {IRCIMIWGetMessageCallback? callback}) async {
    throw UnimplementedError('getMessageByUId() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Business identifier for the conversation
  /// @param sentTime Target message's timestamp (in milliseconds), can't be 0
  /// @param beforeCount Number of messages before the target
  /// @param afterCount Number of messages after the target
  /// @param callback Result callback
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
    throw UnimplementedError('getMessagesAroundTime() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Business identifier for the conversation
  /// @param messageTypes List of message types
  /// @param sentTime Message timestamp (0 for latest)
  /// @param order Fetch direction: BEFORE for messages prior to sentTime (descending), AFTER for messages after sentTime (ascending)
  /// @param count Number of messages to fetch
  /// @param callback Result callback
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
    throw UnimplementedError('getLocalMessagesByMessageTypes() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Use {@link #getFirstUnreadMessage(RCIMIWConversationType, String, String, IRCIMIWGetFirstUnreadMessageCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getFirstUnreadMessage] 代替')
  Future<int> loadFirstUnreadMessage(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadFirstUnreadMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param callback Event callback. The SDK has supported callback-based responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onFirstUnreadMessageLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getFirstUnreadMessage(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetFirstUnreadMessageCallback? callback,
  }) async {
    throw UnimplementedError('getFirstUnreadMessage() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// @deprecated Use {@link #getUnreadMentionedMessages(RCIMIWConversationType, String, String, IRCIMIWGetUnreadMentionedMessagesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getUnreadMentionedMessages] 代替')
  Future<int> loadUnreadMentionedMessages(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadUnreadMentionedMessages() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param callback Event callback. SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onUnreadMentionedMessagesLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getUnreadMentionedMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetUnreadMentionedMessagesCallback? callback,
  }) async {
    throw UnimplementedError('getUnreadMentionedMessages() has not been implemented.');
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
  /// @param message The message to be inserted.
  /// @param callback Event callback. The SDK has supported callback-based event handling since version 5.3.1. Other callback methods for this interface have been deprecated since version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessage(RCIMIWMessage message, {IRCIMIWInsertMessageCallback? callback}) async {
    throw UnimplementedError('insertMessage() has not been implemented.');
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
  /// @param messages The collection of messages to be inserted.
  /// @param callback The event callback. Starting from version 5.3.1, the SDK supports callback for event handling. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessages(List<RCIMIWMessage> messages, {IRCIMIWInsertMessagesCallback? callback}) async {
    throw UnimplementedError('insertMessages() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param timestamp Timestamp for clearing messages up to a certain time. 0 ≤ timestamp ≤ sentTime of the last message in the current conversation. 0 clears all messages, other values clear messages with sentTime ≤ timestamp.
  /// @param policy Clearing policy
  /// @param callback Event callback. SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> clearMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy, {
    IRCIMIWClearMessagesCallback? callback,
  }) async {
    throw UnimplementedError('clearMessages() has not been implemented.');
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
  /// @param messages The collection of messages to be deleted.
  /// @param callback The event callback. Starting from version 5.3.1, the SDK supports callback-based event handling. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in the 6.x release. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> deleteLocalMessages(List<RCIMIWMessage> messages, {IRCIMIWDeleteLocalMessagesCallback? callback}) async {
    throw UnimplementedError('deleteLocalMessages() has not been implemented.');
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
  /// @param messageIds Set of message IDs
  /// @param callback Event callback
  /// ---
  Future<int> deleteLocalMessageByIds(List<int> messageIds, {IRCIMIWDeleteLocalMessageByIdsCallback? callback}) async {
    throw UnimplementedError('deleteLocalMessageByIds() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param messages Message collection
  /// @param callback Event callback. SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> deleteMessages(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWDeleteMessagesCallback? callback,
  }) async {
    throw UnimplementedError('deleteMessages() has not been implemented.');
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
  /// @param message The message to be recalled.
  /// @param callback Event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface have been deprecated since version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> recallMessage(RCIMIWMessage message, {IRCIMIWRecallMessageCallback? callback}) async {
    throw UnimplementedError('recallMessage() has not been implemented.');
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
  /// @param targetId The conversation ID.
  /// @param channelId The channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// @param timestamp The timestamp of the last read message in the conversation.
  /// @param callback The event callback. SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> sendPrivateReadReceiptMessage(
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSendPrivateReadReceiptMessageCallback? callback,
  }) async {
    throw UnimplementedError('sendPrivateReadReceiptMessage() has not been implemented.');
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
  /// @param message The message for which the read receipt is requested.
  /// @param callback Event callback. Starting from SDK version 5.3.1, callback mode is supported. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendGroupReadReceiptRequest(
    RCIMIWMessage message, {
    IRCIMIWSendGroupReadReceiptRequestCallback? callback,
  }) async {
    throw UnimplementedError('sendGroupReadReceiptRequest() has not been implemented.');
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
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param messages List of messages in the conversation for which read receipts need to be sent
  /// @param callback Event callback. SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendGroupReadReceiptResponse(
    String targetId,
    String? channelId,
    List<RCIMIWMessage> messages, {
    IRCIMIWSendGroupReadReceiptResponseCallback? callback,
  }) async {
    throw UnimplementedError('sendGroupReadReceiptResponse() has not been implemented.');
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
  /// @param messageUId The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// @param expansion The key-value pairs of message extension information to be updated, of type HashMap. The Key supports a combination of uppercase and lowercase English letters, numbers, and some special symbols + = - _. Chinese characters are not supported. The Value can include spaces.
  /// @param callback The event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> updateMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateMessageExpansionCallback? callback,
  }) async {
    throw UnimplementedError('updateMessageExpansion() has not been implemented.');
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
  /// @param messageUId The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// @param keys The list of keys to be deleted from the message extension information. The type is ArrayList.
  /// @param callback Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> removeMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveMessageExpansionForKeysCallback? callback,
  }) async {
    throw UnimplementedError('removeMessageExpansionForKeys() has not been implemented.');
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
  /// @param messageId The messageId of the message, which can be obtained from the message object.
  /// @param sentStatus The status to be modified.
  /// @param callback Event callback. The SDK supports callback-based notification starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageSentStatus(
    int messageId,
    RCIMIWSentStatus sentStatus, {
    IRCIMIWChangeMessageSentStatusCallback? callback,
  }) async {
    throw UnimplementedError('changeMessageSentStatus() has not been implemented.');
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
  /// @param messageId The messageId of the message, which can be obtained from the message object.
  /// @param receivedStatus The status to be modified.
  /// @param callback  Event callback. The SDK has supported callback-style responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageReceiveStatus(
    int messageId,
    RCIMIWReceivedStatus receivedStatus, {
    IRCIMIWChangeMessageReceivedStatusCallback? callback,
  }) async {
    throw UnimplementedError('changeMessageReceiveStatus() has not been implemented.');
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
  /// @param messageId Message ID from Message Object
  /// @param receivedStatusInfo Status to modify
  /// @param callback  Event callback. Supported since SDK 5.3.1. Other callback methods deprecated in 5.4.0 and will be removed in 6.x. If callback is provided, only triggers callback response.
  /// ---
  Future<int> changeMessageReceiveStatusInfo(
    int messageId,
    RCIMIWReceivedStatusInfo receivedStatusInfo, {
    IRCIMIWChangeMessageReceivedStatusInfoCallback? callback,
  }) async {
    throw UnimplementedError('changeMessageReceiveStatusInfo() has not been implemented.');
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
  /// @param messageId Message ID from Message Object
  /// @param extra Additional data
  /// @param callback Event callback
  /// ---
  Future<int> updateMessageLocalExtra(
    int messageId,
    String extra, {
    IRCIMIWUpdateMessageLocalExtraCallback? callback,
  }) async {
    throw UnimplementedError('updateMessageLocalExtra() has not been implemented.');
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
  /// @param targetId The chatroom conversation ID
  /// @param messageCount The number of messages to fetch upon entering the chatroom. -1 means no messages will be fetched, 0 means fetching 10 messages, with a maximum of 50 messages allowed.
  /// @param autoCreate Whether to create the chatroom. If TRUE and the chatroom does not exist, the SDK will create the chatroom and join it. If the chatroom already exists, the SDK will directly join it.
  /// @param callback Event callback. The SDK supports callback-based events starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> joinChatRoom(
    String targetId,
    int messageCount,
    bool autoCreate, {
    IRCIMIWJoinChatRoomCallback? callback,
  }) async {
    throw UnimplementedError('joinChatRoom() has not been implemented.');
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
  /// @param targetId The conversation ID of the chatroom.
  /// @param callback The event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> leaveChatRoom(String targetId, {IRCIMIWLeaveChatRoomCallback? callback}) async {
    throw UnimplementedError('leaveChatRoom() has not been implemented.');
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
  /// @param targetId The conversation ID of the chatroom
  /// @param timestamp The timestamp of the starting message
  /// @param order The order of fetching messages: 0 for descending, 1 for ascending
  /// @param count The number of messages to fetch, where 0 < count ≤ 50
  /// @deprecated Use {@link #getChatRoomMessages(String, long, RCIMIWTimeOrder, int, IRCIMIWGetChatRoomMessagesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getChatRoomMessages] 代替')
  Future<int> loadChatRoomMessages(String targetId, int timestamp, RCIMIWTimeOrder order, int count) async {
    throw UnimplementedError('loadChatRoomMessages() has not been implemented.');
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
  /// @param targetId The chatroom conversation ID
  /// @param timestamp The starting message timestamp
  /// @param order The order of retrieval: 0 for descending, 1 for ascending
  /// @param count The number of messages to retrieve, where 0 < count ≤ 50
  /// @param callback The event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onChatRoomMessagesLoaded]
  Future<int> getChatRoomMessages(
    String targetId,
    int timestamp,
    RCIMIWTimeOrder order,
    int count, {
    IRCIMIWGetChatRoomMessagesCallback? callback,
  }) async {
    throw UnimplementedError('getChatRoomMessages() has not been implemented.');
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
  /// @param targetId  The conversation ID of the chatroom.
  /// @param key  The name of the chatroom attribute. The key supports a combination of uppercase and lowercase letters, numbers, and special characters + = - _. The maximum length is 128 characters.
  /// @param value     The value corresponding to the chatroom attribute. The maximum length is 4096 characters.
  /// @param deleteWhenLeft Whether to automatically delete the key-value pair when the user goes offline or exits the chatroom.
  /// @param overwrite Whether to overwrite the existing key if it already exists.
  /// @param callback  The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> addChatRoomEntry(
    String targetId,
    String key,
    String value,
    bool deleteWhenLeft,
    bool overwrite, {
    IRCIMIWAddChatRoomEntryCallback? callback,
  }) async {
    throw UnimplementedError('addChatRoomEntry() has not been implemented.');
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
  /// @param targetId  Chatroom conversation ID
  /// @param entries   Chatroom attributes
  /// @param deleteWhenLeft Whether to automatically delete the Key and Value when the user goes offline or exits
  /// @param overwrite Whether to force overwrite
  /// @param callback  Event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> addChatRoomEntries(
    String targetId,
    Map entries,
    bool deleteWhenLeft,
    bool overwrite, {
    IRCIMIWAddChatRoomEntriesCallback? callback,
  }) async {
    throw UnimplementedError('addChatRoomEntries() has not been implemented.');
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
  /// @param targetId The conversation ID of the chatroom
  /// @param key The key of the chatroom attribute
  /// @deprecated Use {@link #getChatRoomEntry(String, String, IRCIMIWGetChatRoomEntryCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getChatRoomEntry] 代替')
  Future<int> loadChatRoomEntry(String targetId, String key) async {
    throw UnimplementedError('loadChatRoomEntry() has not been implemented.');
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
  /// @param targetId The conversation ID of the chatroom
  /// @param key The key of the chatroom attribute
  /// @param callback The event callback. SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onChatRoomEntryLoaded]
  Future<int> getChatRoomEntry(String targetId, String key, {IRCIMIWGetChatRoomEntryCallback? callback}) async {
    throw UnimplementedError('getChatRoomEntry() has not been implemented.');
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
  /// @param targetId The conversation ID of the chatroom
  /// @deprecated Use {@link #getChatRoomAllEntries(String, IRCIMIWGetChatRoomAllEntriesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getChatRoomAllEntries] 代替')
  Future<int> loadChatRoomAllEntries(String targetId) async {
    throw UnimplementedError('loadChatRoomAllEntries() has not been implemented.');
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
  /// @param targetId The conversation ID of the chatroom.
  /// @param callback The event callback. Starting from SDK version 5.3.1, the callback method is supported. From version 5.4.0, other callback methods for this interface are deprecated and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onChatRoomAllEntriesLoaded]
  Future<int> getChatRoomAllEntries(String targetId, {IRCIMIWGetChatRoomAllEntriesCallback? callback}) async {
    throw UnimplementedError('getChatRoomAllEntries() has not been implemented.');
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
  /// @param targetId The chatroom conversation ID
  /// @param key The chatroom attribute key
  /// @param force Whether to force deletion
  /// @param callback The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> removeChatRoomEntry(
    String targetId,
    String key,
    bool force, {
    IRCIMIWRemoveChatRoomEntryCallback? callback,
  }) async {
    throw UnimplementedError('removeChatRoomEntry() has not been implemented.');
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
  /// @param targetId The chatroom conversation ID
  /// @param keys The chatroom attributes
  /// @param force Specifies whether to force overwrite
  /// @param callback The event callback. SDK supports callback mode from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> removeChatRoomEntries(
    String targetId,
    List<String> keys,
    bool force, {
    IRCIMIWRemoveChatRoomEntriesCallback? callback,
  }) async {
    throw UnimplementedError('removeChatRoomEntries() has not been implemented.');
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
  /// @param userId User ID
  /// @param callback Event callback. The SDK has supported callback-style callbacks since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> addToBlacklist(String userId, {IRCIMIWAddToBlacklistCallback? callback}) async {
    throw UnimplementedError('addToBlacklist() has not been implemented.');
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
  /// @param userId User ID
  /// @param callback Event callback. The SDK supports callback-based event handling starting from version 5.3.1. Other callback methods for this interface have been deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If a callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeFromBlacklist(String userId, {IRCIMIWRemoveFromBlacklistCallback? callback}) async {
    throw UnimplementedError('removeFromBlacklist() has not been implemented.');
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
  /// @param userId The user ID
  /// @deprecated Use {@link #getBlacklistStatus(String, IRCIMIWGetBlacklistStatusCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getBlacklistStatus] 代替')
  Future<int> loadBlacklistStatus(String userId) async {
    throw UnimplementedError('loadBlacklistStatus() has not been implemented.');
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
  /// @param userId User ID
  /// @param callback Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBlacklistStatusLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklistStatus(String userId, {IRCIMIWGetBlacklistStatusCallback? callback}) async {
    throw UnimplementedError('getBlacklistStatus() has not been implemented.');
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
    throw UnimplementedError('loadBlacklist() has not been implemented.');
  }

  /// [ZH]
  /// ---
  /// 获取当前用户设置的黑名单列表。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// Retrieve the current user's blocklist.
  /// @param callback Event callback. The SDK has supported callback-style responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBlacklistLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklist({IRCIMIWGetBlacklistCallback? callback}) async {
    throw UnimplementedError('getBlacklist() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param keyword Keyword to search for
  /// @param startTime Search for messages before this timestamp. Pass 0 to start searching from the latest message and move backward in time.
  /// @param count Number of messages to query, where 0 < count ≤ 50.
  /// @param callback Event callback. The SDK has supported callback-based responses since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
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
    throw UnimplementedError('searchMessages() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param keyword Keyword to search for
  /// @param startTime Start time
  /// @param endTime End time
  /// @param offset Offset
  /// @param count Number of search results to return, where 0 < count ≤ 50.
  /// @param callback Event callback. The SDK supports callback-style event handling starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
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
    throw UnimplementedError('searchMessagesByTimeRange() has not been implemented.');
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
  /// @param userId User ID
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass `null` for other conversation types.
  /// @param startTime Start time for the query. Pass `0` to start searching from the latest message and search backward from that time.
  /// @param count Number of search results to return. Must be in the range 0 < count ≤ 50.
  /// @param callback Event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback will be triggered.
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
    throw UnimplementedError('searchMessagesByUserId() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel identifier for messages
  /// @param messageTypes Set of message types
  /// @param keyword Search keyword (required)
  /// @param startTime Search messages before this timestamp (0 means start from latest) in milliseconds
  /// @param count Max results (up to 100)
  /// @param callback Callback for search results
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
    throw UnimplementedError('searchMessagesByMessageTypes() has not been implemented.');
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
  /// @param conversationTypes Collection of conversation types
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param messageTypes Message types to search for
  /// @param keyword Keyword to search for
  /// @param callback Event callback. SDK supports callback mode from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId,
    List<RCIMIWMessageType> messageTypes,
    String keyword, {
    IRCIMIWSearchConversationsCallback? callback,
  }) async {
    throw UnimplementedError('searchConversations() has not been implemented.');
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
  /// @param startTime
  /// Specifies the start time for muting message notifications, in the format `HH:MM:SS`.
  /// @param spanMinutes
  /// The duration in minutes for muting message notifications, where `0 < spanMinutes < 1440`.
  /// For example, if the start time is `00:00` and the end time is `01:00`, then `spanMinutes` would be `60`. Setting it to `1439` represents a full day of muting (`23 60 + 59 = 1439`).
  /// @param level
  /// The notification level for messages.
  /// @param callback
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
    throw UnimplementedError('changeNotificationQuietHours() has not been implemented.');
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
  /// @param callback Event callback. The SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeNotificationQuietHours({IRCIMIWRemoveNotificationQuietHoursCallback? callback}) async {
    throw UnimplementedError('removeNotificationQuietHours() has not been implemented.');
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
    throw UnimplementedError('loadNotificationQuietHours() has not been implemented.');
  }

  /// [ZH]
  /// ---
  /// 获取已设置的时间段消息提醒屏蔽
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// ---
  /// [EN]
  /// ### Get the Set Time Period for Message Reminder Blocking
  /// @param callback Event callback. The SDK has supported callback-based event handling since version 5.3.1. Starting from version 5.4.0, other callback methods for this interface have been deprecated and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// @listener [onNotificationQuietHoursLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getNotificationQuietHours({IRCIMIWGetNotificationQuietHoursCallback? callback}) async {
    throw UnimplementedError('getNotificationQuietHours() has not been implemented.');
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
  /// @param type The conversation type. Please note the following restrictions:
  /// Ultra group conversation type: For ultra group services activated before 2022.09.01, setting the Do Not Disturb level for all messages in a single ultra group conversation (where "all messages" refers to messages across all channels and messages not belonging to any channel) is not supported by default. This API only sets the Do Not Disturb level for messages not belonging to any channel within the specified ultra group conversation (`targetId`). To modify this behavior, submit a ticket.
  /// Chatroom conversation type: Not supported, as chatroom messages do not support push notifications by default.
  /// @param targetId The conversation ID.
  /// @param channelId The channel ID for the ultra group conversation. Pass `null` for other types.
  /// If a channel ID is provided, the Do Not Disturb level is set for the specified channel. If no channel ID is specified, it applies to all messages in the ultra group.
  /// Note: For ultra group services activated before 2022.09.01, if no channel ID is specified, pass an empty string `""`, which sets the Do Not Disturb level only for messages not belonging to any channel within the specified ultra group conversation (`targetId`). To modify this behavior, submit a ticket.
  /// @param level The message notification level.
  /// @param callback The event callback. Starting from SDK version 5.3.1, callback is supported. Other callback methods for this API are deprecated as of version 5.4.0 and will be removed in version 6.x. If the `callback` parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> changeConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeConversationNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('changeConversationNotificationLevel() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @deprecated Use {@link #getConversationNotificationLevel(RCIMIWConversationType, String, String, IRCIMIWGetConversationNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversationNotificationLevel] 代替')
  Future<int> loadConversationNotificationLevel(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadConversationNotificationLevel() has not been implemented.');
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
  /// @param type Conversation type. Please note the following restrictions:
  /// Ultra group conversation type: If the ultra group service was activated before 2022.09.01, it does not support setting the Do Not Disturb level for all messages in a single ultra group conversation by default ("all messages" refers to messages in all channels and messages not belonging to any channel). This API only sets the Do Not Disturb level for messages in the specified ultra group conversation (`targetId`) that do not belong to any channel. Submit a ticket if modification is required.Chatroom conversation type: Not supported, as chatroom messages do not support push notifications by default.
  /// @param targetId Conversation ID
  /// @param channelId Channel ID of the ultra group conversation. Pass `null` for other types.
  /// If a channel ID is provided, the Do Not Disturb level will be set for messages in that specific channel. If no channel ID is specified, it will apply to all ultra group messages.Note: For customers who activated the ultra group service before 2022.09.01, if no channel ID is specified, pass an empty string `""` by default, which means the Do Not Disturb level will only be set for messages in the specified ultra group conversation (`targetId`) that do not belong to any channel. Submit a ticket if modification is required.
  /// @param callback Event callback. The SDK supports callback-style response starting from version 5.3.1. Other callback methods for this API are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback will be triggered.
  /// @listener [onConversationNotificationLevelLoaded]
  Future<int> getConversationNotificationLevel(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetConversationNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('getConversationNotificationLevel() has not been implemented.');
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
  /// @param type The conversation type
  /// @param level The message notification level
  /// @param callback The event callback. The SDK supports callback-based event handling starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the `callback` parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> changeConversationTypeNotificationLevel(
    RCIMIWConversationType type,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeConversationTypeNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('changeConversationTypeNotificationLevel() has not been implemented.');
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
  /// @param type The conversation type.
  /// @deprecated Use {@link #getConversationTypeNotificationLevel(RCIMIWConversationType, IRCIMIWGetConversationTypeNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversationTypeNotificationLevel] 代替')
  Future<int> loadConversationTypeNotificationLevel(RCIMIWConversationType type) async {
    throw UnimplementedError('loadConversationTypeNotificationLevel() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param callback Event callback. The SDK has supported callback-based event handling since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> getConversationTypeNotificationLevel(
    RCIMIWConversationType type, {
    IRCIMIWGetConversationTypeNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('getConversationTypeNotificationLevel() has not been implemented.');
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
  /// @param targetId The conversation ID
  /// @param level The message notification level
  /// @param callback The event callback. Starting from SDK version 5.3.1, callback method is supported. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in the 6.x version. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> changeUltraGroupDefaultNotificationLevel(
    String targetId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('changeUltraGroupDefaultNotificationLevel() has not been implemented.');
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
  /// @param targetId The conversation ID
  /// @deprecated Use {@link #getUltraGroupDefaultNotificationLevel(String, IRCIMIWGetUltraGroupDefaultNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupDefaultNotificationLevel(String targetId) async {
    throw UnimplementedError('loadUltraGroupDefaultNotificationLevel() has not been implemented.');
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
  /// @param targetId The conversation ID
  /// @param callback The event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onUltraGroupDefaultNotificationLevelLoaded]
  Future<int> getUltraGroupDefaultNotificationLevel(
    String targetId, {
    IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('getUltraGroupDefaultNotificationLevel() has not been implemented.');
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
  /// @param targetId The conversation ID
  /// @param channelId The channel ID, only supported for ultra groups
  /// @param level The message notification level
  /// @param callback The event callback. The SDK has supported callback-based event handling since version 5.3.1. Other callback methods for this interface were deprecated in version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> changeUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId,
    RCIMIWPushNotificationLevel level, {
    IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('changeUltraGroupChannelDefaultNotificationLevel() has not been implemented.');
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
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups.
  /// @deprecated Use {@link #getUltraGroupChannelDefaultNotificationLevel(String, String, IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getUltraGroupChannelDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupChannelDefaultNotificationLevel(String targetId, String? channelId) async {
    throw UnimplementedError('loadUltraGroupChannelDefaultNotificationLevel() has not been implemented.');
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
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups.
  /// @param callback Event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onUltraGroupChannelDefaultNotificationLevelLoaded]
  Future<int> getUltraGroupChannelDefaultNotificationLevel(
    String targetId,
    String? channelId, {
    IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback? callback,
  }) async {
    throw UnimplementedError('getUltraGroupChannelDefaultNotificationLevel() has not been implemented.');
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
  /// @param showContent Indicates whether to display the content of remote push notifications.
  /// @param callback The event callback. SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> changePushContentShowStatus(
    bool showContent, {
    IRCIMIWChangePushContentShowStatusCallback? callback,
  }) async {
    throw UnimplementedError('changePushContentShowStatus() has not been implemented.');
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
  /// @param language The push language. Currently supports en_us, zh_cn, and ar_sa.
  /// @param callback The event callback. The SDK has supported callback-based notifications since version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushLanguage(String language, {IRCIMIWChangePushLanguageCallback? callback}) async {
    throw UnimplementedError('changePushLanguage() has not been implemented.');
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
  /// @param receive Indicates whether to receive push notifications.
  /// @param callback Event callback. The SDK supports callback mode starting from version 5.3.1. Other callback modes for this interface are deprecated as of version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushReceiveStatus(bool receive, {IRCIMIWChangePushReceiveStatusCallback? callback}) async {
    throw UnimplementedError('changePushReceiveStatus() has not been implemented.');
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
  /// @param message The message to be sent
  /// @param userIds The collection of group members
  /// @param callback The event callback. The SDK supports callback-based response starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in the 6.x release. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendGroupMessageToDesignatedUsers(
    RCIMIWMessage message,
    List<String> userIds, {
    RCIMIWSendGroupMessageToDesignatedUsersCallback? callback,
  }) async {
    throw UnimplementedError('sendGroupMessageToDesignatedUsers() has not been implemented.');
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
  /// @param type The type of the conversation.
  /// @param targetId The ID of the conversation.
  /// @param channelId The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getMessageCount(RCIMIWConversationType, String, String, IRCIMIWGetMessageCountCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getMessageCount] 代替')
  Future<int> loadMessageCount(RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadMessageCount() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @param callback Event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onMessageCountLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageCount(
    RCIMIWConversationType type,
    String targetId,
    String? channelId, {
    IRCIMIWGetMessageCountCallback? callback,
  }) async {
    throw UnimplementedError('getMessageCount() has not been implemented.');
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
  /// @param conversationTypes A collection of conversation types.
  /// @param channelId    The channel ID, only supported for ultra groups. Pass null for other conversation types.
  /// @deprecated Use {@link #getTopConversations(List, String, IRCIMIWGetTopConversationsCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getTopConversations] 代替')
  Future<int> loadTopConversations(List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    throw UnimplementedError('loadTopConversations() has not been implemented.');
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
  /// @param conversationTypes A collection of conversation types.
  /// @param channelId    The channel ID, only supported for ultra groups. For other conversation types, pass null.
  /// @param callback     The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onTopConversationsLoaded]
  Future<int> getTopConversations(
    List<RCIMIWConversationType> conversationTypes,
    String? channelId, {
    IRCIMIWGetTopConversationsCallback? callback,
  }) async {
    throw UnimplementedError('getTopConversations() has not been implemented.');
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
  /// @param targetId The conversation ID.
  /// @param channelId The channel ID, only supported for ultra groups.
  /// @param timestamp The read time.
  /// @param callback The event callback. The SDK supports callback-style responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  /// [timestamp] 在 Flutter For Web 端无效
  Future<int> syncUltraGroupReadStatus(
    String targetId,
    String? channelId,
    int timestamp, {
    IRCIMIWSyncUltraGroupReadStatusCallback? callback,
  }) async {
    throw UnimplementedError('syncUltraGroupReadStatus() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @deprecated Use {@link #getConversationsForAllChannel(RCIMIWConversationType, String, IRCIMIWGetConversationsForAllChannelCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getConversationsForAllChannel] 代替')
  Future<int> loadConversationsForAllChannel(RCIMIWConversationType type, String targetId) async {
    throw UnimplementedError('loadConversationsForAllChannel() has not been implemented.');
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
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param callback Event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// @listener [onConversationsLoadedForAllChannel]
  Future<int> getConversationsForAllChannel(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationsForAllChannelCallback? callback,
  }) async {
    throw UnimplementedError('getConversationsForAllChannel() has not been implemented.');
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
  /// @param messageUId The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// @param message The message to be modified.
  /// @param callback Event callback. SDK supports callback-style callbacks starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> modifyUltraGroupMessage(
    String messageUId,
    RCIMIWMessage message, {
    IRCIMIWModifyUltraGroupMessageCallback? callback,
  }) async {
    throw UnimplementedError('modifyUltraGroupMessage() has not been implemented.');
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
  /// @param message The message to be recalled
  /// @param deleteRemote Whether to delete the remote message
  /// @param callback Event callback. SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> recallUltraGroupMessage(
    RCIMIWMessage message,
    bool deleteRemote, {
    IRCIMIWRecallUltraGroupMessageCallback? callback,
  }) async {
    throw UnimplementedError('recallUltraGroupMessage() has not been implemented.');
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
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, only supported for ultra groups.
  /// @param timestamp Unix timestamp
  /// @param policy Clear policy
  /// @param callback Event callback. SDK supports callback method from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback method will be triggered.
  /// ---
  Future<int> clearUltraGroupMessages(
    String targetId,
    String? channelId,
    int timestamp,
    RCIMIWMessageOperationPolicy policy, {
    IRCIMIWClearUltraGroupMessagesCallback? callback,
  }) async {
    throw UnimplementedError('clearUltraGroupMessages() has not been implemented.');
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
  /// @param targetId Conversation ID
  /// @param channelId Channel ID, supported only for ultra groups.
  /// @param typingStatus Typing status
  /// @param callback Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and will be removed in the 6.x release. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> sendUltraGroupTypingStatus(
    String targetId,
    String? channelId,
    RCIMIWUltraGroupTypingStatus typingStatus, {
    IRCIMIWSendUltraGroupTypingStatusCallback? callback,
  }) async {
    throw UnimplementedError('sendUltraGroupTypingStatus() has not been implemented.');
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
  /// @param targetId The conversation ID.
  /// @param timestamp The timestamp.
  /// @param callback The event callback. The SDK supports callback mode starting from version 5.3.1. Other callback methods for this interface are deprecated in version 5.4.0 and will be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> clearUltraGroupMessagesForAllChannel(
    String targetId,
    int timestamp, {
    IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback,
  }) async {
    throw UnimplementedError('clearUltraGroupMessagesForAllChannel() has not been implemented.');
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
  /// @param messages The collection of messages to be retrieved
  /// @deprecated Use {@link #getBatchRemoteUltraGroupMessages(List, IRCIMIWGetBatchRemoteUltraGroupMessagesCallback)} instead. This interface is expected to be removed in version 6.x.
  /// ---
  @Deprecated('请使用 [getBatchRemoteUltraGroupMessages] 代替')
  Future<int> loadBatchRemoteUltraGroupMessages(List<RCIMIWMessage> messages) async {
    throw UnimplementedError('loadBatchRemoteUltraGroupMessages() has not been implemented.');
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
  /// @param messages The collection of messages retrieved.
  /// @param callback The event callback. Starting from SDK version 5.3.1, callback is supported. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// @listener [onBatchRemoteUltraGroupMessagesLoaded]
  Future<int> getBatchRemoteUltraGroupMessages(
    List<RCIMIWMessage> messages, {
    IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback,
  }) async {
    throw UnimplementedError('getBatchRemoteUltraGroupMessages() has not been implemented.');
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
  /// @param messageUId The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// @param expansion The key-value pairs for the updated message extension information, of type HashMap. Key supports a combination of uppercase and lowercase English letters, numbers, and special characters + = - _. Chinese characters are not supported. Value can include spaces.
  /// @param callback The event callback. SDK supports callback method starting from version 5.3.1. Other callback methods for this interface are deprecated starting from version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> updateUltraGroupMessageExpansion(
    String messageUId,
    Map expansion, {
    IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback,
  }) async {
    throw UnimplementedError('updateUltraGroupMessageExpansion() has not been implemented.');
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
  /// @param messageUId The messageUid of the message, which can be obtained from the message object. Only successfully sent messages will have a value.
  /// @param keys  The list of keys to be deleted from the message extension information, of type ArrayList.
  /// @param callback Event callback. The SDK supports callback-based responses starting from version 5.3.1. Other callback methods for this interface are deprecated as of version 5.4.0 and are expected to be removed in version 6.x. If the callback parameter is provided, only the callback will be triggered.
  /// ---
  Future<int> removeUltraGroupMessageExpansionForKeys(
    String messageUId,
    List<String> keys, {
    IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback,
  }) async {
    throw UnimplementedError('removeUltraGroupMessageExpansionForKeys() has not been implemented.');
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
  /// @param level The log level
  /// ---
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeLogLevel(RCIMIWLogLevel level) async {
    throw UnimplementedError('changeLogLevel() has not been implemented.');
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
    throw UnimplementedError('getDeltaTime() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// @param tagName The name of the tag, with a maximum length of 15 characters. Tag names can be duplicated.
  /// @param callback Event callback.
  /// ---
  Future<int> createTag(String tagId, String tagName, {IRCIMIWCreateTagCallback? callback}) async {
    throw UnimplementedError('createTag() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// @param callback The event callback.
  /// ---
  Future<int> removeTag(String tagId, {IRCIMIWRemoveTagCallback? callback}) async {
    throw UnimplementedError('removeTag() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// @param newName The new name of the tag, with a maximum length of 15 characters. Tag names can be duplicated.
  /// @param callback The event callback.
  /// ---
  Future<int> updateTagNameById(String tagId, String newName, {IRCIMIWUpdateTagNameByIdCallback? callback}) async {
    throw UnimplementedError('updateTagNameById() has not been implemented.');
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
  /// @param callback The event callback.
  /// ---
  Future<int> getTags({IRCIMIWGetTagsCallback? callback}) async {
    throw UnimplementedError('getTags() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// @param type The type of the conversation
  /// @param targetId The ID of the conversation
  /// @param callback The event callback.
  /// ---
  Future<int> addConversationToTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWAddConversationToTagCallback? callback,
  }) async {
    throw UnimplementedError('addConversationToTag() has not been implemented.');
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
  /// @param tagId Unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// @param type Conversation type
  /// @param targetId Conversation ID
  /// @param callback Event callback.
  /// ---
  Future<int> removeConversationFromTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWRemoveConversationFromTagCallback? callback,
  }) async {
    throw UnimplementedError('removeConversationFromTag() has not been implemented.');
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
  /// @param type Specifies the conversation type
  /// @param targetId Indicates the conversation ID
  /// @param tagIds Represents the collection of tags
  /// @param callback Specifies the event callback.
  /// ---
  Future<int> removeTagsFromConversation(
    RCIMIWConversationType type,
    String targetId,
    List<String> tagIds, {
    IRCIMIWRemoveTagsFromConversationCallback? callback,
  }) async {
    throw UnimplementedError('removeTagsFromConversation() has not been implemented.');
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
  /// @param type Specifies the conversation type.
  /// @param targetId Indicates the conversation ID.
  /// @param callback Represents the event callback.
  /// ---
  Future<int> getTagsFromConversation(
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetTagsFromConversationCallback? callback,
  }) async {
    throw UnimplementedError('getTagsFromConversation() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, a string type with a maximum length of 10 characters.
  /// @param timestamp The timestamp of the conversation. Retrieves the conversation list before this timestamp. For the first query, pass 0. For subsequent queries, use the operationTime property value from the returned RCConversation object as the startTime for the next query.
  /// @param count The number of conversations to retrieve. If the number of conversations retrieved is less than the count value, it indicates that all data has been fetched.
  /// @param callback The event callback.
  /// ---
  Future<int> getConversationsFromTagByPage(
    String tagId,
    int timestamp,
    int count, {
    IRCIMIWGetConversationsCallback? callback,
  }) async {
    throw UnimplementedError('getConversationsFromTagByPage() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag. It is a string type and its length should not exceed 10 characters.
  /// @param contain Indicates whether to include conversations with Do Not Disturb enabled.
  /// @param callback The event callback.
  /// ---
  Future<int> getUnreadCountByTag(String tagId, bool contain, {IRCIMIWGetUnreadCountCallback? callback}) async {
    throw UnimplementedError('getUnreadCountByTag() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, character type, with a maximum length of 10 characters.
  /// @param type The type of conversation.
  /// @param targetId The ID of the conversation.
  /// @param top Whether to pin the conversation to the top.
  /// @param callback The event callback.
  /// ---
  Future<int> changeConversationTopStatusInTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId,
    bool top, {
    IRCIMIWChangeConversationTopStatusInTagCallback? callback,
  }) async {
    throw UnimplementedError('changeConversationTopStatusInTag() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag. String type, with a maximum length of 10 characters.
  /// @param type The type of the conversation.
  /// @param targetId The ID of the conversation.
  /// @param callback The event callback.
  /// ---
  Future<int> getConversationTopStatusInTag(
    String tagId,
    RCIMIWConversationType type,
    String targetId, {
    IRCIMIWGetConversationTopStatusInTagCallback? callback,
  }) async {
    throw UnimplementedError('getConversationTopStatusInTag() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, string type, with a maximum length of 10 characters.
  /// @param callback The event callback.
  /// ---
  Future<int> clearMessagesUnreadStatusByTag(
    String tagId, {
    IRCIMIWClearMessagesUnreadStatusByTagCallback? callback,
  }) async {
    throw UnimplementedError('clearMessagesUnreadStatusByTag() has not been implemented.');
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
  /// @param tagId The unique identifier of the tag, character type, with a length not exceeding 10 characters.
  /// @param deleteMessage Specifies whether to delete the messages.
  /// @param callback Event callback.
  /// ---
  Future<int> clearConversationsByTag(
    String tagId,
    bool deleteMessage, {
    IRCIMIWClearConversationsByTagCallback? callback,
  }) async {
    throw UnimplementedError('clearConversationsByTag() has not been implemented.');
  }

  Future<int> setModuleName(String moduleName, String version) async {
    throw UnimplementedError('setModuleName() has not been implemented.');
  }

  Future<int> writeLog(String method, String callMethod, int codeValue, String message) async {
    throw UnimplementedError('writeLog() has not been implemented.');
  }

  Future<int> createGroup(
    RCIMIWGroupInfo groupInfo,
    List<String> inviteeUserIds, {
    IRCIMIWCreateGroupCallback? callback,
  }) async {
    throw UnimplementedError('createGroup() has not been implemented.');
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
  /// @param groupInfo Group details (only modified parameters required)
  /// @param callback Event callback
  /// ---
  Future<int> updateGroupInfo(RCIMIWGroupInfo groupInfo, {IRCIMIWGroupInfoUpdatedCallback? callback}) async {
    throw UnimplementedError('updateGroupInfo() has not been implemented.');
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
    throw UnimplementedError('getGroupsInfo() has not been implemented.');
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
  /// @param groupId Group identifier
  /// @param userIds Array of member IDs (supports batch operations, max 100 per call)
  /// @param config Removal config (optional, uses default when empty)
  /// @param callback Event callback
  /// ---
  Future<int> kickGroupMembers(
    String groupId,
    List<String> userIds,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWKickGroupMembersCallback? callback,
  }) async {
    throw UnimplementedError('kickGroupMembers() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param callback Event callback
  /// ---
  Future<int> joinGroup(String groupId, {IRCIMIWJoinGroupCallback? callback}) async {
    throw UnimplementedError('joinGroup() has not been implemented.');
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
  /// @param groupId group ID
  /// @param config Exit config (optional, defaults apply if null)
  /// @param callback Event callback
  /// ---
  Future<int> quitGroup(String groupId, RCIMIWQuitGroupConfig config, {IRCIMIWQuitGroupCallback? callback}) async {
    throw UnimplementedError('quitGroup() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param callback Event callback
  /// ---
  Future<int> dismissGroup(String groupId, {IRCIMIWDismissGroupCallback? callback}) async {
    throw UnimplementedError('dismissGroup() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param newOwnerId New owner ID
  /// @param quitGroup Whether to leave group
  /// @param config Transfer config (optional, defaults apply if null)
  /// @param callback Event callback
  /// ---
  Future<int> transferGroupOwner(
    String groupId,
    String newOwnerId,
    bool quitGroup,
    RCIMIWQuitGroupConfig config, {
    IRCIMIWTransferGroupOwnerCallback? callback,
  }) async {
    throw UnimplementedError('transferGroupOwner() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param userIds User ID list (max 100 per request)
  /// @param callback Event callback
  /// ---
  Future<int> getGroupMembers(String groupId, List<String> userIds, {IRCIMIWGetGroupMembersCallback? callback}) async {
    throw UnimplementedError('getGroupMembers() has not been implemented.');
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
  /// @param groupId group ID
  /// @param role member role
  /// @param option query options including page token (optional, returns first page if empty), page size (max 100), and ascending order (default desc)
  /// @param callback event callback
  /// ---
  Future<int> getGroupMembersByRole(
    String groupId,
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetGroupMembersByRoleCallback? callback,
  }) async {
    throw UnimplementedError('getGroupMembersByRole() has not been implemented.');
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
  /// @param role Group member role
  /// @param option Query options including page token (optional, returns first page if empty), page size (max 100), and ascending order (default desc)
  /// @param callback Event callback
  /// ---
  Future<int> getJoinedGroupsByRole(
    RCIMIWGroupMemberRole role,
    RCIMIWPagingQueryOption option, {
    IRCIMIWGetJoinedGroupsByRoleCallback? callback,
  }) async {
    throw UnimplementedError('getJoinedGroupsByRole() has not been implemented.');
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
  /// @param groupIds List of group IDs
  /// @param callback Event callback
  /// ---
  Future<int> getJoinedGroups(List<String> groupIds, {IRCIMIWGetJoinedGroupsCallback? callback}) async {
    throw UnimplementedError('getJoinedGroups() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param remark Group remark (max 64 chars). Pass empty string to remove remark
  /// @param callback Event callback
  /// ---
  Future<int> setGroupRemark(String groupId, String remark, {IRCIMIWSetGroupRemarkCallback? callback}) async {
    throw UnimplementedError('setGroupRemark() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param userId Required user ID (supports current logged-in user ID)
  /// @param nickname Optional nickname (max 64 chars). Empty string removes nickname
  /// @param extra Optional additional info (max 128 chars)
  /// @param callback Event callback
  /// ---
  Future<int> setGroupMemberInfo(
    String groupId,
    String userId,
    String nickname,
    String extra, {
    IRCIMIWSetGroupMemberInfoCallback? callback,
  }) async {
    throw UnimplementedError('setGroupMemberInfo() has not been implemented.');
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
  /// @param groupName Group name (required, max 64 chars)
  /// @param option Query options including page token (optional, first page by default), page size (max 200), and sort order (descending by default)
  /// @param callback Event callback
  /// ---
  Future<int> searchJoinedGroups(
    String groupName,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchJoinedGroupsCallback? callback,
  }) async {
    throw UnimplementedError('searchJoinedGroups() has not been implemented.');
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
  /// @param groupId groupID
  /// @param name Member nickname (required, max 64 chars)
  /// @param option Search options including page token (optional, first page by default), page size (max 200), and sort order (descending by default)
  /// @param callback Event callback
  /// @note Searches nickname first, then username. Returns results if either field matches
  /// ---
  Future<int> searchGroupMembers(
    String groupId,
    String name,
    RCIMIWPagingQueryOption option, {
    IRCIMIWSearchGroupMembersCallback? callback,
  }) async {
    throw UnimplementedError('searchGroupMembers() has not been implemented.');
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
  /// @param groupId Required group ID
  /// @param userIds Required user ID array. Must be group members. Max 10 admins per group (owner excluded)
  /// @param callback Event callback
  /// ---
  Future<int> addGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWAddGroupManagersCallback? callback,
  }) async {
    throw UnimplementedError('addGroupManagers() has not been implemented.');
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
  /// @param groupId Required group ID
  /// @param userIds Required user ID array (max 10 admins per operation)
  /// @param callback Event callback
  /// ---
  Future<int> removeGroupManagers(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupManagersCallback? callback,
  }) async {
    throw UnimplementedError('removeGroupManagers() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param userIds User ID list (max 30 per request)
  /// @param callback Event callback
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
    throw UnimplementedError('inviteUsersToGroup() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param inviterId Inviter's ID
  /// @param callback Event callback
  /// ---
  Future<int> acceptGroupInvite(String groupId, String inviterId, {IRCIMIWAcceptGroupInviteCallback? callback}) async {
    throw UnimplementedError('acceptGroupInvite() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param inviterId Inviter's ID
  /// @param reason Optional decline reason (max 128 chars)
  /// @param callback Event callback
  /// ---
  Future<int> refuseGroupInvite(
    String groupId,
    String inviterId,
    String reason, {
    IRCIMIWRefuseGroupInviteCallback? callback,
  }) async {
    throw UnimplementedError('refuseGroupInvite() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param inviterId Inviter's user ID (optional). Required for invited joins, empty for direct requests.
  /// @param applicantId Applicant's user ID
  /// @param callback Event callback
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
    throw UnimplementedError('acceptGroupApplication() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param inviterId Inviter's user ID (optional). Required for invited joins, empty for self-requested joins
  /// @param applicantId Applicant's ID
  /// @param reason Rejection reason (max 128 chars)
  /// @param callback Event callback
  /// ---
  Future<int> refuseGroupApplication(
    String groupId,
    String inviterId,
    String applicantId,
    String reason, {
    IRCIMIWRefuseGroupApplicationCallback? callback,
  }) async {
    throw UnimplementedError('refuseGroupApplication() has not been implemented.');
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
  /// @param option Query options including page token (optional, returns first page if empty), page size (max 200), and sort order (descending by default)
  /// @param directions Array of `RCGroupApplicationDirection` for application directions
  /// @param status Array of `RCGroupApplicationStatus` for status types
  /// @param callback Event callback. Total count isn't supported
  /// ---
  Future<int> getGroupApplications(
    RCIMIWPagingQueryOption option,
    List<RCIMIWGroupApplicationDirection> directions,
    List<RCIMIWGroupApplicationStatus> status, {
    IRCIMIWGetGroupApplicationsCallback? callback,
  }) async {
    throw UnimplementedError('getGroupApplications() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param userIds User IDs to follow (max 100 per request)
  /// @param callback Event callback
  /// ---
  Future<int> addGroupFollows(String groupId, List<String> userIds, {IRCIMIWAddGroupFollowsCallback? callback}) async {
    throw UnimplementedError('addGroupFollows() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param userIds List of user IDs (max 100 per request)
  /// @param callback Event callback
  /// ---
  Future<int> removeGroupFollows(
    String groupId,
    List<String> userIds, {
    IRCIMIWRemoveGroupFollowsCallback? callback,
  }) async {
    throw UnimplementedError('removeGroupFollows() has not been implemented.');
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
  /// @param groupId Group ID
  /// @param callback Event callback
  /// ---
  Future<int> getGroupFollows(String groupId, {IRCIMIWGetGroupFollowsCallback? callback}) async {
    throw UnimplementedError('getGroupFollows() has not been implemented.');
  }

  Future<int> setCheckChatRoomDuplicateMessage(bool enableCheck) async {
    throw UnimplementedError('setCheckChatRoomDuplicateMessage() has not been implemented.');
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
  /// @param params Messages to translate
  /// @param callback Event callback
  /// ---
  Future<int> translateMessagesWithParams(
    RCIMIWTranslateMessagesParams params, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    throw UnimplementedError('translateMessagesWithParams() has not been implemented.');
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
  /// @param params Content to translate
  /// @param callback Event callback
  /// ---
  Future<int> translateTextsWithParams(
    RCIMIWTranslateTextParams params, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    throw UnimplementedError('translateTextsWithParams() has not been implemented.');
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
  /// @param language Target language
  /// @param callback Parameter validation callback
  /// ---
  Future<int> setTranslationLanguage(String language, {IRCIMIWTranslateResponseCallback? callback}) async {
    throw UnimplementedError('setTranslationLanguage() has not been implemented.');
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
  /// @param callback Event callback
  /// ---
  Future<int> getTranslationLanguage({IRCIMIWTranslateGetLanguageCallback? callback}) async {
    throw UnimplementedError('getTranslationLanguage() has not been implemented.');
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
  /// @param isEnable Enable auto-translation
  /// @param callback Parameter validation callback
  /// ---
  Future<int> setAutoTranslateEnable(bool isEnable, {IRCIMIWTranslateResponseCallback? callback}) async {
    throw UnimplementedError('setAutoTranslateEnable() has not been implemented.');
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
  /// @param callback Callback for parameter validation
  /// ---
  Future<int> getAutoTranslateEnabled({IRCIMIWGetAutoTranslateEnabledCallback? callback}) async {
    throw UnimplementedError('getAutoTranslateEnabled() has not been implemented.');
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
  /// @param types List of conversation types
  /// @param targetIds List of conversation IDs
  /// @param channelIds List of channel IDs
  /// @param strategy Translation strategy
  /// @param callback Parameter validation callback result
  /// ---
  Future<int> batchSetConversationTranslateStrategy(
    List<RCIMIWConversationType> types,
    List<String> targetIds,
    List<String> channelIds,
    RCIMIWTranslateStrategy strategy, {
    IRCIMIWTranslateResponseCallback? callback,
  }) async {
    throw UnimplementedError('batchSetConversationTranslateStrategy() has not been implemented.');
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
  /// @param text Input text for hashing
  /// ---
  Future<String> calculateTextMD5(String text) async {
    throw UnimplementedError('calculateTextMD5() has not been implemented.');
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
  /// @param visibility Privacy settings
  /// @param callback Event callback
  /// ---
  Future<int> updateMyUserProfileVisibility(
    RCIMIWUserProfileVisibility visibility, {
    IRCIMIWUpdateMyUserProfileVisibilityCallback? callback,
  }) async {
    throw UnimplementedError('updateMyUserProfileVisibility() has not been implemented.');
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
  /// @param callback Event callback
  /// ---
  Future<int> getMyUserProfileVisibility({IRCIMIWGetMyUserProfileVisibilityCallback? callback}) async {
    throw UnimplementedError('getMyUserProfileVisibility() has not been implemented.');
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
  /// @param profile User profile data
  /// @param callback Event callback
  /// ---
  Future<int> updateMyUserProfile(RCIMIWUserProfile profile, {IRCIMIWUpdateMyUserProfileCallback? callback}) async {
    throw UnimplementedError('updateMyUserProfile() has not been implemented.');
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
  /// @param callback Event callback
  /// ---
  Future<int> getMyUserProfile({IRCIMIWGetMyUserProfileCallback? callback}) async {
    throw UnimplementedError('getMyUserProfile() has not been implemented.');
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
  /// @param userIds List of user IDs
  /// @param callback Event callback
  /// ---
  Future<int> getUserProfiles(List<String> userIds, {IRCIMIWGetUserProfilesCallback? callback}) async {
    throw UnimplementedError('getUserProfiles() has not been implemented.');
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
  /// @param uniqueId User app ID
  /// @param callback Event callback, returns error code RC_USER_PROFILE_USER_NOT_EXIST (24366) if user not found
  /// ---
  Future<int> searchUserProfileByUniqueId(
    String uniqueId, {
    IRCIMIWSearchUserProfileByUniqueIdCallback? callback,
  }) async {
    throw UnimplementedError('searchUserProfileByUniqueId() has not been implemented.');
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
  /// @param request Subscription request params
  /// @param callback Event callback
  /// ---
  Future<int> subscribeEvent(RCIMIWSubscribeEventRequest request, {IRCIMIWSubscribeEventCallback? callback}) async {
    throw UnimplementedError('subscribeEvent() has not been implemented.');
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
  /// @param request Unsubscription request params
  /// @param callback Event callback
  /// ---
  Future<int> unSubscribeEvent(RCIMIWSubscribeEventRequest request, {IRCIMIWSubscribeEventCallback? callback}) async {
    throw UnimplementedError('unSubscribeEvent() has not been implemented.');
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
  /// @param request Query parameters
  /// @param callback Event callback
  /// ---
  Future<int> querySubscribeEvent(
    RCIMIWSubscribeEventRequest request, {
    IRCIMIWQuerySubscribeEventCallback? callback,
  }) async {
    throw UnimplementedError('querySubscribeEvent() has not been implemented.');
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
  /// @param request Query params
  /// @param pageSize Items per page
  /// @param startIndex Start index
  /// @param callback Event callback
  /// ---
  Future<int> querySubscribeEventByPage(
    RCIMIWSubscribeEventRequest request,
    int pageSize,
    int startIndex, {
    IRCIMIWQuerySubscribeEventCallback? callback,
  }) async {
    throw UnimplementedError('querySubscribeEventByPage() has not been implemented.');
  }

  // -------- web 专有的方法 --------

  /// 构建语音消息 (高清语音)，发送成功后会根据文件自动生成 duration
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
    throw UnimplementedError('createVoiceMessageForWeb() has not been implemented.');
  }

  /// 构建图片消息，发送成功后会根据文件自动生成缩略图
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 图片文件节点
  /// - [返回值] 图片消息实体
  Future<RCIMIWImageMessage?> createImageMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) async {
    throw UnimplementedError('createImageMessageForWeb() has not been implemented.');
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
    throw UnimplementedError('createFileMessageForWeb() has not been implemented.');
  }

  /// 构建小视频消息， 发送成功后会根据文件自动生成 duration 和 缩略图
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 小视频文件节点
  /// - [返回值] 视频消息实体
  Future<RCIMIWSightMessage?> createSightMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) async {
    throw UnimplementedError('createSightMessageForWeb() has not been implemented.');
  }

  /// 构建 GIF 消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] GIF 文件节点
  /// - [返回值] GIF 消息实体
  Future<RCIMIWGIFMessage> createGIFMessageForWeb(
    RCIMIWConversationType type,
    String targetId,
    String? channelId,
    dynamic file,
  ) {
    throw UnimplementedError('createGIFMessageForWeb() has not been implemented.');
  }

  /// 构建位置消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [longitude] 经度
  /// - [latitude] 纬度
  /// - [poiName]  POI 信息
  /// - [thumbnailBase64] 缩略图 base64 字符串
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
    throw UnimplementedError('createLocationMessageForWeb() has not been implemented.');
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
    throw UnimplementedError('updateMessageExpansionForWeb() has not been implemented.');
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
    throw UnimplementedError('sendPrivateReadReceiptMessage() has not been implemented.');
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
    throw UnimplementedError('updateUltraGroupMessageExpansionForWeb() has not been implemented.');
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
    throw UnimplementedError('removeUltraGroupMessageExpansionForKeysForWeb() has not been implemented.');
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
  }) async {
    throw UnimplementedError('modifyUltraGroupMessageForWeb() has not been implemented.');
  }

  // -------- web 专有的方法 --------
}
