import 'package:rongcloud_im_wrapper_plugin/src/rongcloud_im_converter.dart';
import 'package:rongcloud_im_wrapper_plugin/src/rongcloud_im_enum.dart';

class RCIMIWAndroidPushOptions {
  /// Android 平台 Push 唯一标识。
  /// 目前支持小米、华为推送平台，默认开发者不需要进行设置。
  /// 当消息产生推送时，消息的 messageUId 作为 notificationId 使用。
  String? notificationId;

  /// 小米的渠道 ID
  /// 该条消息针对小米使用的推送渠道。
  String? channelIdMi;

  /// 华为的渠道 ID
  /// 该条消息针对华为使用的推送渠道，如开发者集成了华为推送，需要指定 channelId 时，可向 Android 端研发人员获取，channelId 由开发者自行创建。
  String? channelIdHW;

  /// OPPO 的渠道 ID。
  /// 该条消息针对 OPPO 使用的推送渠道，如开发者集成了 OPPO 推送，需要指定 channelId 时，可向 Android 端研发人员获取，channelId 由开发者自行创建。
  String? channelIdOPPO;

  /// VIVO 推送通道类型 开发者集成了 VIVO 推送，需要指定推送类型时，可进行设置。
  RCIMIWVIVOPushType? pushTypeVIVO;

  /// FCM 通知类型推送时所使用的分组 id
  String? collapseKeyFCM;

  /// FCM 通知类型的推送所使用的通知图片 url
  String? imageUrlFCM;

  /// 华为推送消息级别
  RCIMIWImportanceHW? importanceHW;

  /// 华为通知栏消息右侧大图标 URL，如果不设置，则不展示通知栏右侧图标。
  /// URL使用的协议必须是HTTPS协议，取值样例：https://example.com/image.png。图标文件须小于 512KB，图标建议规格大小：40dp x 40dp，弧角大小为 8dp，超出建议规格大小的图标会存在图片压缩或显示不全的情况。
  String? imageUrlHW;

  /// 小米 Large icon 链接
  /// Large icon 可以出现在大图版和多字版消息中，显示在右边。国内版仅 MIUI12 以上版本支持，以下版本均不支持；国际版支持。
  /// 图片要求：大小 120 120px，格式为 png 或者 jpg 格式
  String? imageUrlMi;

  /// FCM 通知的频道 ID，该应用程序必须使用此频道 ID 创建一个频道，然后才能收到带有该频道 ID 的任何通知。
  /// 如果您未在请求中发送此频道 ID，或者如果应用尚未创建提供的频道 ID，则 FCM 使用应用清单中指定的频道 ID。
  String? channelIdFCM;

  RCIMIWAndroidPushOptions.create({
    this.notificationId,
    this.channelIdMi,
    this.channelIdHW,
    this.channelIdOPPO,
    this.pushTypeVIVO,
    this.collapseKeyFCM,
    this.imageUrlFCM,
    this.importanceHW,
    this.imageUrlHW,
    this.imageUrlMi,
    this.channelIdFCM,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['notificationId'] = notificationId;
    json['channelIdMi'] = channelIdMi;
    json['channelIdHW'] = channelIdHW;
    json['channelIdOPPO'] = channelIdOPPO;
    json['pushTypeVIVO'] = pushTypeVIVO?.index;
    json['collapseKeyFCM'] = collapseKeyFCM;
    json['imageUrlFCM'] = imageUrlFCM;
    json['importanceHW'] = importanceHW?.index;
    json['imageUrlHW'] = imageUrlHW;
    json['imageUrlMi'] = imageUrlMi;
    json['channelIdFCM'] = channelIdFCM;
    return json;
  }

  RCIMIWAndroidPushOptions.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    channelIdMi = json['channelIdMi'];
    channelIdHW = json['channelIdHW'];
    channelIdOPPO = json['channelIdOPPO'];
    pushTypeVIVO = json['pushTypeVIVO'] == null
        ? null
        : RCIMIWVIVOPushType.values[json['pushTypeVIVO']];
    collapseKeyFCM = json['collapseKeyFCM'];
    imageUrlFCM = json['imageUrlFCM'];
    importanceHW = json['importanceHW'] == null
        ? null
        : RCIMIWImportanceHW.values[json['importanceHW']];
    imageUrlHW = json['imageUrlHW'];
    imageUrlMi = json['imageUrlMi'];
    channelIdFCM = json['channelIdFCM'];
  }
}

class RCIMIWMessagePushOptions {
  /// 是否发送通知
  bool? disableNotification;

  /// 通知栏是否屏蔽通知标题
  /// true 不显示通知标题，false 显示通知标题
  /// 默认情况下融云单聊消息通知标题为用户名、群聊消息为群名称，设置后不会再显示通知标题。
  /// 此属性只针目标用户为iOS 平台时有效，Android 第三方推送平台的通知标题为必填项，所以暂不支持。
  bool? disablePushTitle;

  /// 推送标题
  /// 默认标题显示规则：内置消息：单聊通知标题显示为发送者名称，群聊通知标题显示为群名称。 自定义消息：默认不显示标题。
  String? pushTitle;

  /// 推送内容。
  String? pushContent;

  /// 远程推送附加信息.
  String? pushData;

  /// 是否强制显示通知详情。 当目标用户设置推送不显示消息详情时， 可通过此功能，强制设置该条消息显示推送详情。
  bool? forceShowDetailContent;

  /// 推送模板 ID
  /// 设置后根据目标用户通过 setPushLanguageCode 设置的语言环境，匹配模板中设置的语言内容进行推送
  /// 未匹配成功时使用默认内容进行推送,模板内容在“开发者后台-自定义推送文案”中进行设置 注：RCMessagePushConfig 中的 Title 和 PushContent
  /// 优先级高于模板 ID（templateId）中对应的标题和推送内容
  String? templateId;

  /// 如果对端设备是 iOS，设置 isVoIPPush 为 True，会走 VoIP 通道推送 Push。
  bool? voIPPush;

  /// iOS 平台相关配置
  RCIMIWIOSPushOptions? iOSPushOptions;

  /// Android 平台相关配置
  RCIMIWAndroidPushOptions? androidPushOptions;

  RCIMIWMessagePushOptions.create({
    this.disableNotification,
    this.disablePushTitle,
    this.pushTitle,
    this.pushContent,
    this.pushData,
    this.forceShowDetailContent,
    this.templateId,
    this.voIPPush,
    this.iOSPushOptions,
    this.androidPushOptions,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['disableNotification'] = disableNotification;
    json['disablePushTitle'] = disablePushTitle;
    json['pushTitle'] = pushTitle;
    json['pushContent'] = pushContent;
    json['pushData'] = pushData;
    json['forceShowDetailContent'] = forceShowDetailContent;
    json['templateId'] = templateId;
    json['voIPPush'] = voIPPush;
    json['iOSPushOptions'] = iOSPushOptions?.toJson();
    json['androidPushOptions'] = androidPushOptions?.toJson();
    return json;
  }

  RCIMIWMessagePushOptions.fromJson(Map<String, dynamic> json) {
    disableNotification = json['disableNotification'];
    disablePushTitle = json['disablePushTitle'];
    pushTitle = json['pushTitle'];
    pushContent = json['pushContent'];
    pushData = json['pushData'];
    forceShowDetailContent = json['forceShowDetailContent'];
    templateId = json['templateId'];
    voIPPush = json['voIPPush'];
    if (json['iOSPushOptions'] != null) {
      iOSPushOptions = RCIMIWIOSPushOptions.fromJson(
          Map<String, dynamic>.from(json['iOSPushOptions']));
    }
    if (json['androidPushOptions'] != null) {
      androidPushOptions = RCIMIWAndroidPushOptions.fromJson(
          Map<String, dynamic>.from(json['androidPushOptions']));
    }
  }
}

class RCIMIWIOSPushOptions {
  /// iOS 平台通知栏分组 ID 相同的 thread-id 推送分为一组 iOS10 开始支持
  String? threadId;

  /// iOS 富文本推送的类型开发者自己定义，自己在 App 端进行解析判断，与 richMediaUri 一起使用，当设置 category 后，推送时默认携带 mutable-content 进行推送，属性值为 1。
  /// 如果不设置后台默认取消息类型字符串，如RC:TxtMsg
  String? category;

  /// iOS 平台通知覆盖 ID apnsCollapseId 相同时，新收到的通知会覆盖老的通知，最大 64 字节 iOS10 开始支持
  String? apnsCollapseId;

  /// iOS 富文本推送内容的 URL，与 category 一起使用。
  String? richMediaUri;

  RCIMIWIOSPushOptions.create({
    this.threadId,
    this.category,
    this.apnsCollapseId,
    this.richMediaUri,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['threadId'] = threadId;
    json['category'] = category;
    json['apnsCollapseId'] = apnsCollapseId;
    json['richMediaUri'] = richMediaUri;
    return json;
  }

  RCIMIWIOSPushOptions.fromJson(Map<String, dynamic> json) {
    threadId = json['threadId'];
    category = json['category'];
    apnsCollapseId = json['apnsCollapseId'];
    richMediaUri = json['richMediaUri'];
  }
}

class RCIMIWCompressOptions {
  /// 原图压缩比
  int? originalImageQuality;

  /// 原图最长边的最大宽度
  int? originalImageSize;

  /// 原图大小限制 配置发送图片时，如果图片大小不超过则发送原图
  int? originalImageMaxSize;

  /// 缩略图压缩比例
  int? thumbnailQuality;

  /// 缩略图压缩宽、高
  int? thumbnailMaxSize;

  /// 缩略图压缩最小宽、高
  int? thumbnailMinSize;

  /// 小视频压缩宽度,建议使用16的倍数
  int? sightCompressWidth;

  /// 小视频压缩高度，建议使用16的倍数
  int? sightCompressHeight;
  int? locationThumbnailQuality;
  int? locationThumbnailWidth;
  int? locationThumbnailHeight;

  RCIMIWCompressOptions.create({
    this.originalImageQuality,
    this.originalImageSize,
    this.originalImageMaxSize,
    this.thumbnailQuality,
    this.thumbnailMaxSize,
    this.thumbnailMinSize,
    this.sightCompressWidth,
    this.sightCompressHeight,
    this.locationThumbnailQuality,
    this.locationThumbnailWidth,
    this.locationThumbnailHeight,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['originalImageQuality'] = originalImageQuality;
    json['originalImageSize'] = originalImageSize;
    json['originalImageMaxSize'] = originalImageMaxSize;
    json['thumbnailQuality'] = thumbnailQuality;
    json['thumbnailMaxSize'] = thumbnailMaxSize;
    json['thumbnailMinSize'] = thumbnailMinSize;
    json['sightCompressWidth'] = sightCompressWidth;
    json['sightCompressHeight'] = sightCompressHeight;
    json['locationThumbnailQuality'] = locationThumbnailQuality;
    json['locationThumbnailWidth'] = locationThumbnailWidth;
    json['locationThumbnailHeight'] = locationThumbnailHeight;
    return json;
  }

  RCIMIWCompressOptions.fromJson(Map<String, dynamic> json) {
    originalImageQuality = json['originalImageQuality'];
    originalImageSize = json['originalImageSize'];
    originalImageMaxSize = json['originalImageMaxSize'];
    thumbnailQuality = json['thumbnailQuality'];
    thumbnailMaxSize = json['thumbnailMaxSize'];
    thumbnailMinSize = json['thumbnailMinSize'];
    sightCompressWidth = json['sightCompressWidth'];
    sightCompressHeight = json['sightCompressHeight'];
    locationThumbnailQuality = json['locationThumbnailQuality'];
    locationThumbnailWidth = json['locationThumbnailWidth'];
    locationThumbnailHeight = json['locationThumbnailHeight'];
  }
}

class RCIMIWEngineOptions {
  /// 私有部署的导航服务器地址。
  String? naviServer;

  /// 私有部署的媒体服务器地址，即文件和图片的上传地址。使用私有云时必须填写。
  String? fileServer;

  /// 配置数据上传地址
  String? statisticServer;

  /// 设置断线重连时是否踢出重连设备。
  /// 用户没有开通多设备登录功能的前提下，同一个账号在一台新设备上登录的时候，会把这个账号在之前登录的设备上踢出。
  bool? kickReconnectDevice;

  /// 压缩项配置
  RCIMIWCompressOptions? compressOptions;
  RCIMIWPushOptions? pushOptions;

  RCIMIWEngineOptions.create({
    this.naviServer,
    this.fileServer,
    this.statisticServer,
    this.kickReconnectDevice,
    this.compressOptions,
    this.pushOptions,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['naviServer'] = naviServer;
    json['fileServer'] = fileServer;
    json['statisticServer'] = statisticServer;
    json['kickReconnectDevice'] = kickReconnectDevice;
    json['compressOptions'] = compressOptions?.toJson();
    json['pushOptions'] = pushOptions?.toJson();
    return json;
  }

  RCIMIWEngineOptions.fromJson(Map<String, dynamic> json) {
    naviServer = json['naviServer'];
    fileServer = json['fileServer'];
    statisticServer = json['statisticServer'];
    kickReconnectDevice = json['kickReconnectDevice'];
    if (json['compressOptions'] != null) {
      compressOptions = RCIMIWCompressOptions.fromJson(
          Map<String, dynamic>.from(json['compressOptions']));
    }
    if (json['pushOptions'] != null) {
      pushOptions = RCIMIWPushOptions.fromJson(
          Map<String, dynamic>.from(json['pushOptions']));
    }
  }
}

class RCIMIWUnknownMessage extends RCIMIWMessage {
  /// 消息数据
  String? rawData;

  /// 消息的标识
  String? objectName;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['rawData'] = rawData;
    json['objectName'] = objectName;
    return json;
  }

  RCIMIWUnknownMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    rawData = json['rawData'];
    objectName = json['objectName'];
  }
}

class RCIMIWUserInfo {
  /// 用户 id。
  String? userId;

  /// 名称（昵称）。
  String? name;

  /// 用户头像地址。
  String? portrait;

  /// 备注
  String? alias;

  /// 附加信息。
  String? extra;

  RCIMIWUserInfo.create({
    this.userId,
    this.name,
    this.portrait,
    this.alias,
    this.extra,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['name'] = name;
    json['portrait'] = portrait;
    json['alias'] = alias;
    json['extra'] = extra;
    return json;
  }

  RCIMIWUserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    portrait = json['portrait'];
    alias = json['alias'];
    extra = json['extra'];
  }
}

class RCIMIWCustomMessage extends RCIMIWMessage {
  /// 自定义消息的标识符
  String? identifier;

  /// 自定义的消息存储策略
  RCIMIWCustomMessagePolicy? policy;

  /// 自定义消息的键值对
  Map? fields;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['identifier'] = identifier;
    json['policy'] = policy?.index;
    json['fields'] = fields;
    return json;
  }

  RCIMIWCustomMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    identifier = json['identifier'];
    policy = json['policy'] == null
        ? null
        : RCIMIWCustomMessagePolicy.values[json['policy']];
    fields = json['fields'];
  }
}

class RCIMIWMessage {
  /// 会话类型
  RCIMIWConversationType? conversationType;

  /// 消息的类型
  RCIMIWMessageType? messageType;

  /// 会话 ID
  String? targetId;

  /// 所属会话的业务标识，长度限制 20 字符
  String? channelId;

  /// 本地存储的消息的唯一值（数据库索引唯一值）
  int? messageId;

  /// 服务器消息唯一 ID（在同一个 Appkey 下全局唯一）
  String? messageUId;

  /// 是否是离线消息，只在接收消息的回调方法中有效，如果消息为离线消息，则为 YES ，其他情况均为 NO
  bool? offLine;

  /// 群阅读回执状态
  RCIMIWGroupReadReceiptInfo? groupReadReceiptInfo;

  /// 消息的接收时间（Unix 时间戳、毫秒）
  int? receivedTime;

  /// 消息的发送时间（Unix 时间戳、毫秒）
  int? sentTime;

  /// 消息的接收状态
  RCIMIWReceivedStatus? receivedStatus;

  /// 消息的发送状态
  RCIMIWSentStatus? sentStatus;

  /// 消息的发送者 ID
  String? senderUserId;

  /// 消息的方向
  RCIMIWMessageDirection? direction;

  /// 消息携带的用户信息
  RCIMIWUserInfo? userInfo;

  /// 消息的 @ 信息
  RCIMIWMentionedInfo? mentionedInfo;

  /// 消息推送配置
  RCIMIWMessagePushOptions? pushOptions;

  /// 消息的附加字段
  String? extra;

  /// 消息扩展信息列表，该属性在消息发送时确定，发送之后不能再做修改
  /// 扩展信息只支持单聊和群组，其它会话类型不能设置扩展信息
  /// 默认消息扩展字典 key 长度不超过 32 ，value 长度不超过 4096 ，单次设置扩展数量最大为 20，消息的扩展总数不能超过 300
  Map? expansion;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['conversationType'] = conversationType?.index;
    json['messageType'] = messageType?.index;
    json['targetId'] = targetId;
    json['channelId'] = channelId;
    json['messageId'] = messageId;
    json['messageUId'] = messageUId;
    json['offLine'] = offLine;
    json['groupReadReceiptInfo'] = groupReadReceiptInfo?.toJson();
    json['receivedTime'] = receivedTime;
    json['sentTime'] = sentTime;
    json['receivedStatus'] = receivedStatus?.index;
    json['sentStatus'] = sentStatus?.index;
    json['senderUserId'] = senderUserId;
    json['direction'] = direction?.index;
    json['userInfo'] = userInfo?.toJson();
    json['mentionedInfo'] = mentionedInfo?.toJson();
    json['pushOptions'] = pushOptions?.toJson();
    json['extra'] = extra;
    json['expansion'] = expansion;
    return json;
  }

  RCIMIWMessage.fromJson(Map<String, dynamic> json) {
    conversationType = json['conversationType'] == null
        ? null
        : RCIMIWConversationType.values[json['conversationType']];
    messageType = json['messageType'] == null
        ? null
        : RCIMIWMessageType.values[json['messageType']];
    targetId = json['targetId'];
    channelId = json['channelId'];
    messageId = json['messageId'];
    messageUId = json['messageUId'];
    offLine = json['offLine'];
    if (json['groupReadReceiptInfo'] != null) {
      groupReadReceiptInfo = RCIMIWGroupReadReceiptInfo.fromJson(
          Map<String, dynamic>.from(json['groupReadReceiptInfo']));
    }
    receivedTime = json['receivedTime'];
    sentTime = json['sentTime'];
    receivedStatus = json['receivedStatus'] == null
        ? null
        : RCIMIWReceivedStatus.values[json['receivedStatus']];
    sentStatus = json['sentStatus'] == null
        ? null
        : RCIMIWSentStatus.values[json['sentStatus']];
    senderUserId = json['senderUserId'];
    direction = json['direction'] == null
        ? null
        : RCIMIWMessageDirection.values[json['direction']];
    if (json['userInfo'] != null) {
      userInfo =
          RCIMIWUserInfo.fromJson(Map<String, dynamic>.from(json['userInfo']));
    }
    if (json['mentionedInfo'] != null) {
      mentionedInfo = RCIMIWMentionedInfo.fromJson(
          Map<String, dynamic>.from(json['mentionedInfo']));
    }
    if (json['pushOptions'] != null) {
      pushOptions = RCIMIWMessagePushOptions.fromJson(
          Map<String, dynamic>.from(json['pushOptions']));
    }
    extra = json['extra'];
    expansion = json['expansion'];
  }
}

class RCIMIWImageMessage extends RCIMIWMediaMessage {
  /// 图片的缩略图数据
  String? thumbnailBase64String;

  /// 是否为原图
  bool? original;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['thumbnailBase64String'] = thumbnailBase64String;
    json['original'] = original;
    return json;
  }

  RCIMIWImageMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    thumbnailBase64String = json['thumbnailBase64String'];
    original = json['original'];
  }
}

class RCIMIWFileMessage extends RCIMIWMediaMessage {
  /// 文件名
  String? name;

  /// 文件类型
  String? fileType;

  /// 文件大小，单位为 Byte
  int? size;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['name'] = name;
    json['fileType'] = fileType;
    json['size'] = size;
    return json;
  }

  RCIMIWFileMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    name = json['name'];
    fileType = json['fileType'];
    size = json['size'];
  }
}

class RCIMIWRecallNotificationMessage extends RCIMIWMessage {
  /// 是否是管理员操作
  bool? admin;

  /// 是否删除
  bool? deleted;

  /// 撤回的时间（毫秒）
  int? recallTime;

  /// 撤回动作的时间（毫秒）
  int? recallActionTime;

  /// 被撤回的原消息
  RCIMIWMessage? originalMessage;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['admin'] = admin;
    json['deleted'] = deleted;
    json['recallTime'] = recallTime;
    json['recallActionTime'] = recallActionTime;
    json['originalMessage'] = originalMessage?.toJson();
    return json;
  }

  RCIMIWRecallNotificationMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    admin = json['admin'];
    deleted = json['deleted'];
    recallTime = json['recallTime'];
    recallActionTime = json['recallActionTime'];
    if (json['originalMessage'] != null) {
      originalMessage = RCIMConverter.convertMessage(
          Map<String, dynamic>.from(json['originalMessage']));
    }
  }
}

class RCIMIWMediaMessage extends RCIMIWMessage {
  /// 本地路径
  String? local;

  /// 远端路径
  String? remote;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['local'] = local;
    json['remote'] = remote;
    return json;
  }

  RCIMIWMediaMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    local = json['local'];
    remote = json['remote'];
  }
}

class RCIMIWTextMessage extends RCIMIWMessage {
  /// 文本内容
  String? text;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['text'] = text;
    return json;
  }

  RCIMIWTextMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    text = json['text'];
  }
}

class RCIMIWGIFMessage extends RCIMIWMediaMessage {
  /// GIF 图的大小，单位字节
  int? dataSize;

  /// GIF 图的宽
  int? width;

  /// GIF 图的高
  int? height;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['dataSize'] = dataSize;
    json['width'] = width;
    json['height'] = height;
    return json;
  }

  RCIMIWGIFMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    dataSize = json['dataSize'];
    width = json['width'];
    height = json['height'];
  }
}

class RCIMIWCommandMessage extends RCIMIWMessage {
  /// 命令的名称
  String? name;

  /// 命令的扩展数据，可以为任意字符串，如存放您定义的json数据。
  String? data;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['name'] = name;
    json['data'] = data;
    return json;
  }

  RCIMIWCommandMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    name = json['name'];
    data = json['data'];
  }
}

class RCIMIWVoiceMessage extends RCIMIWMediaMessage {
  /// 语音的长度，单位：秒
  int? duration;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['duration'] = duration;
    return json;
  }

  RCIMIWVoiceMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    duration = json['duration'];
  }
}

class RCIMIWMentionedInfo {
  /// @ 提醒的类型
  RCIMIWMentionedType? type;

  /// @ 的用户 ID 列表
  List<String>? userIdList;

  /// 包含 @ 提醒的消息，本地通知和远程推送显示的内容
  String? mentionedContent;

  RCIMIWMentionedInfo.create({
    this.type,
    this.userIdList,
    this.mentionedContent,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['type'] = type?.index;
    json['userIdList'] = userIdList;
    json['mentionedContent'] = mentionedContent;
    return json;
  }

  RCIMIWMentionedInfo.fromJson(Map<String, dynamic> json) {
    type =
        json['type'] == null ? null : RCIMIWMentionedType.values[json['type']];
    userIdList = json['userIdList']?.cast<String>();
    mentionedContent = json['mentionedContent'];
  }
}

class RCIMIWCommandNotificationMessage extends RCIMIWMessage {
  /// 命令提醒的名称
  String? name;

  /// 命令提醒消息的扩展数据，可以为任意字符串，如存放您定义的 json 数据。
  String? data;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['name'] = name;
    json['data'] = data;
    return json;
  }

  RCIMIWCommandNotificationMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    name = json['name'];
    data = json['data'];
  }
}

class RCIMIWSightMessage extends RCIMIWMediaMessage {
  /// 视频时长
  int? duration;

  /// 视频大小
  int? size;

  /// 视频的名称
  String? name;

  /// 缩略图数据
  String? thumbnailBase64String;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['duration'] = duration;
    json['size'] = size;
    json['name'] = name;
    json['thumbnailBase64String'] = thumbnailBase64String;
    return json;
  }

  RCIMIWSightMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    duration = json['duration'];
    size = json['size'];
    name = json['name'];
    thumbnailBase64String = json['thumbnailBase64String'];
  }
}

class RCIMIWLocationMessage extends RCIMIWMessage {
  /// 经度信息
  double? longitude;

  /// 纬度信息
  double? latitude;

  /// POI 信息
  String? poiName;

  /// 缩略图地址
  String? thumbnailPath;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['longitude'] = longitude;
    json['latitude'] = latitude;
    json['poiName'] = poiName;
    json['thumbnailPath'] = thumbnailPath;
    return json;
  }

  RCIMIWLocationMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    poiName = json['poiName'];
    thumbnailPath = json['thumbnailPath'];
  }
}

class RCIMIWReferenceMessage extends RCIMIWMessage {
  /// 引用文本
  String? text;

  /// 被引用的消息
  RCIMIWMessage? referenceMessage;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['text'] = text;
    json['referenceMessage'] = referenceMessage?.toJson();
    return json;
  }

  RCIMIWReferenceMessage.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    text = json['text'];
    if (json['referenceMessage'] != null) {
      referenceMessage = RCIMConverter.convertMessage(
          Map<String, dynamic>.from(json['referenceMessage']));
    }
  }
}

class RCIMIWBlockedMessageInfo {
  /// 封禁的会话类型
  RCIMIWConversationType? conversationType;

  /// 封禁的会话 ID
  String? targetId;

  /// 封禁的消息 Uid
  String? blockedMsgUId;

  /// 封禁的类型
  RCIMIWMessageBlockType? blockType;

  /// 封禁的附加信息
  String? extra;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['conversationType'] = conversationType?.index;
    json['targetId'] = targetId;
    json['blockedMsgUId'] = blockedMsgUId;
    json['blockType'] = blockType?.index;
    json['extra'] = extra;
    return json;
  }

  RCIMIWBlockedMessageInfo.fromJson(Map<String, dynamic> json) {
    conversationType = json['conversationType'] == null
        ? null
        : RCIMIWConversationType.values[json['conversationType']];
    targetId = json['targetId'];
    blockedMsgUId = json['blockedMsgUId'];
    blockType = json['blockType'] == null
        ? null
        : RCIMIWMessageBlockType.values[json['blockType']];
    extra = json['extra'];
  }
}

class RCIMIWTypingStatus {
  /// 当前正在输入的用户 ID
  String? userId;

  /// 当前正在输入的消息类型名
  String? contentType;

  /// 输入时间
  int? sentTime;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['contentType'] = contentType;
    json['sentTime'] = sentTime;
    return json;
  }

  RCIMIWTypingStatus.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    contentType = json['contentType'];
    sentTime = json['sentTime'];
  }
}

class RCIMIWUltraGroupTypingStatusInfo {
  /// 会话 ID
  String? targetId;

  /// 所属会话的业务标识
  String? channelId;

  /// 用户id
  String? userId;

  /// 用户数
  int? userNums;

  /// 输入状态
  RCIMIWUltraGroupTypingStatus? status;

  /// 服务端收到用户操作的上行时间.
  int? timestamp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['targetId'] = targetId;
    json['channelId'] = channelId;
    json['userId'] = userId;
    json['userNums'] = userNums;
    json['status'] = status?.index;
    json['timestamp'] = timestamp;
    return json;
  }

  RCIMIWUltraGroupTypingStatusInfo.fromJson(Map<String, dynamic> json) {
    targetId = json['targetId'];
    channelId = json['channelId'];
    userId = json['userId'];
    userNums = json['userNums'];
    status = json['status'] == null
        ? null
        : RCIMIWUltraGroupTypingStatus.values[json['status']];
    timestamp = json['timestamp'];
  }
}

class RCIMIWGroupReadReceiptInfo {
  /// 是否为需要回执的消息。 true: 需要回执的消息。 false: 普通消息。
  bool? readReceiptMessage;

  /// 是否发送过消息回执响应。 仅对消息接收方有效。
  bool? hasRespond;

  /// 会话中响应过该消息回执的成员 userId 列表。 key: userId value: respondTime
  Map? respondUserIds;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['readReceiptMessage'] = readReceiptMessage;
    json['hasRespond'] = hasRespond;
    json['respondUserIds'] = respondUserIds;
    return json;
  }

  RCIMIWGroupReadReceiptInfo.fromJson(Map<String, dynamic> json) {
    readReceiptMessage = json['readReceiptMessage'];
    hasRespond = json['hasRespond'];
    respondUserIds = json['respondUserIds'];
  }
}

class RCIMIWChatRoomMemberAction {
  /// 操作的用户
  String? userId;

  /// 事件类型
  RCIMIWChatRoomMemberActionType? actionType;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['actionType'] = actionType?.index;
    return json;
  }

  RCIMIWChatRoomMemberAction.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    actionType = json['actionType'] == null
        ? null
        : RCIMIWChatRoomMemberActionType.values[json['actionType']];
  }
}

class RCIMIWSearchConversationResult {
  /// 获取会话的实体，用来容纳和存储客户端的会话信息，对应会话列表中的会话。
  RCIMIWConversation? conversation;

  /// 获取匹配会话数量
  int? count;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['conversation'] = conversation?.toJson();
    json['count'] = count;
    return json;
  }

  RCIMIWSearchConversationResult.fromJson(Map<String, dynamic> json) {
    if (json['conversation'] != null) {
      conversation = RCIMIWConversation.fromJson(
          Map<String, dynamic>.from(json['conversation']));
    }
    count = json['count'];
  }
}

class RCIMIWConversation {
  /// 获取会话类型
  RCIMIWConversationType? conversationType;

  /// 会话 ID
  String? targetId;

  /// 获取渠道 ID
  String? channelId;

  /// 获取未读消息数。
  int? unreadCount;

  /// 获取本会话里自己被 @ 的消息数量。
  int? mentionedCount;

  /// 获取置顶状态
  bool? top;

  /// 会话草稿
  String? draft;

  /// 获取最后一条消息
  RCIMIWMessage? lastMessage;

  /// 会话的通知级别
  RCIMIWPushNotificationLevel? notificationLevel;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['conversationType'] = conversationType?.index;
    json['targetId'] = targetId;
    json['channelId'] = channelId;
    json['unreadCount'] = unreadCount;
    json['mentionedCount'] = mentionedCount;
    json['top'] = top;
    json['draft'] = draft;
    json['lastMessage'] = lastMessage?.toJson();
    json['notificationLevel'] = notificationLevel?.index;
    return json;
  }

  RCIMIWConversation.fromJson(Map<String, dynamic> json) {
    conversationType = json['conversationType'] == null
        ? null
        : RCIMIWConversationType.values[json['conversationType']];
    targetId = json['targetId'];
    channelId = json['channelId'];
    unreadCount = json['unreadCount'];
    mentionedCount = json['mentionedCount'];
    top = json['top'];
    draft = json['draft'];
    if (json['lastMessage'] != null) {
      lastMessage = RCIMConverter.convertMessage(
          Map<String, dynamic>.from(json['lastMessage']));
    }
    notificationLevel = json['notificationLevel'] == null
        ? null
        : RCIMIWPushNotificationLevel.values[json['notificationLevel']];
  }
}

class RCIMIWPushOptions {
  // 小米推送 Id
  String? idMI;
  // 小米推送 appKey
  String? appKeyMI;
  // 魅族推送 Id
  String? appIdMeizu;
  // 魅族推送 appKey
  String? appKeyMeizu;
  // Oppo 推送 appKey
  String? appKeyOPPO;
  // Oppo 推送 appSecret
  String? appSecretOPPO;
  // 是否开启华为推送
  bool? enableHWPush;
  // 是否开启 FCM 推送
  bool? enableFCM;
  // 是否开启 Vivo 推送
  bool? enableVIVOPush;

  RCIMIWPushOptions.create({
    this.idMI,
    this.appKeyMI,
    this.appIdMeizu,
    this.appKeyMeizu,
    this.appKeyOPPO,
    this.appSecretOPPO,
    this.enableHWPush,
    this.enableFCM,
    this.enableVIVOPush,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idMI'] = idMI;
    json['appKeyMI'] = appKeyMI;
    json['appIdMeizu'] = appIdMeizu;
    json['appKeyMeizu'] = appKeyMeizu;
    json['appKeyOPPO'] = appKeyOPPO;
    json['appSecretOPPO'] = appSecretOPPO;
    json['enableHWPush'] = enableHWPush;
    json['enableFCM'] = enableFCM;
    json['enableVIVOPush'] = enableVIVOPush;
    return json;
  }

  RCIMIWPushOptions.fromJson(Map<String, dynamic> json) {
    idMI = json['idMI'];
    appKeyMI = json['appKeyMI'];
    appIdMeizu = json['appIdMeizu'];
    appKeyMeizu = json['appKeyMeizu'];
    appKeyOPPO = json['appKeyOPPO'];
    appSecretOPPO = json['appSecretOPPO'];
    enableHWPush = json['enableHWPush'];
    enableFCM = json['enableFCM'];
    enableVIVOPush = json['enableVIVOPush'];
  }
}
