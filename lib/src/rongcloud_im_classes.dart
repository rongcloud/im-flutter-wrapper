import 'package:rongcloud_im_wrapper_plugin/src/rongcloud_im_converter.dart';
import 'package:rongcloud_im_wrapper_plugin/src/rongcloud_im_enum.dart';

abstract class RCIMIWUserCustomMessage extends RCIMIWMessage {
  String? objectName;

  RCIMIWUserCustomMessage(RCIMIWConversationType type, String targetId) : super.fromJson({}) {
    conversationType = type;
    this.targetId = targetId;
    messageType = RCIMIWMessageType.userCustom;
    objectName = messageObjectName();
  }
  RCIMIWUserCustomMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    messageType = RCIMIWMessageType.userCustom;
    objectName = messageObjectName();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['objectName'] = objectName;
    return json;
  }

  /// 消息的编码方法
  String encode();

  /// 消息的解码方法
  void decode(String jsonStr);

  /// 自定义消息的 objectName, 需要与原生定义的 objectName 相同
  String messageObjectName();
}

class RCIMIWHarmonyPushOptions {
  /// 通知栏右侧图片，格式支持 png、jpg、jpeg、heif、gif、bmp，图片长宽<25000像素，图片不满足要求的情况下，终端不能显示通知消息。
  String? imageUrl;

  /// 消息自分类标识，默认为空。category 取值必须为大写字母，例如 IM。消息自分类标识，默认为空。category 取值必须为大写字母，例如 IM。
  String? category;

  RCIMIWHarmonyPushOptions.create({this.imageUrl, this.category});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['imageUrl'] = imageUrl;
    json['category'] = category;
    return json;
  }

  RCIMIWHarmonyPushOptions.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    category = json['category'];
  }
}

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
  String? categoryHW;

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

  /// FCM 通知的频道 ID，该应用程序必须使用此频道 ID 创建一个频道，然后才能收到带有该频道 ID 的任何通知。
  /// 如果您未在请求中发送此频道 ID，或者如果应用尚未创建提供的频道 ID，则 FCM 使用应用清单中指定的频道 ID。
  String? channelIdFCM;
  String? categoryVivo;

  /// 荣耀推送消息级别
  RCIMIWImportanceHonor? importanceHonor;

  /// 荣耀通知栏消息右侧大图标 URL，如果不设置，则不展示通知栏右侧图标。
  /// URL使用的协议必须是HTTPS协议，取值样例：https://example.com/image.png。图标文件须小于 512KB，图标建议规格大小：40dp x 40dp，弧角大小为 8dp，超出建议规格大小的图标会存在图片压缩或显示不全的情况。
  String? imageUrlHonor;

  RCIMIWAndroidPushOptions.create({
    this.notificationId,
    this.channelIdMi,
    this.channelIdHW,
    this.categoryHW,
    this.channelIdOPPO,
    this.pushTypeVIVO,
    this.collapseKeyFCM,
    this.imageUrlFCM,
    this.importanceHW,
    this.imageUrlHW,
    this.channelIdFCM,
    this.categoryVivo,
    this.importanceHonor,
    this.imageUrlHonor,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['notificationId'] = notificationId;
    json['channelIdMi'] = channelIdMi;
    json['channelIdHW'] = channelIdHW;
    json['categoryHW'] = categoryHW;
    json['channelIdOPPO'] = channelIdOPPO;
    json['pushTypeVIVO'] = pushTypeVIVO?.index;
    json['collapseKeyFCM'] = collapseKeyFCM;
    json['imageUrlFCM'] = imageUrlFCM;
    json['importanceHW'] = importanceHW?.index;
    json['imageUrlHW'] = imageUrlHW;
    json['channelIdFCM'] = channelIdFCM;
    json['categoryVivo'] = categoryVivo;
    json['importanceHonor'] = importanceHonor?.index;
    json['imageUrlHonor'] = imageUrlHonor;
    return json;
  }

  RCIMIWAndroidPushOptions.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    channelIdMi = json['channelIdMi'];
    channelIdHW = json['channelIdHW'];
    categoryHW = json['categoryHW'];
    channelIdOPPO = json['channelIdOPPO'];
    pushTypeVIVO = json['pushTypeVIVO'] == null ? null : RCIMIWVIVOPushType.values[json['pushTypeVIVO']];
    collapseKeyFCM = json['collapseKeyFCM'];
    imageUrlFCM = json['imageUrlFCM'];
    importanceHW = json['importanceHW'] == null ? null : RCIMIWImportanceHW.values[json['importanceHW']];
    imageUrlHW = json['imageUrlHW'];
    channelIdFCM = json['channelIdFCM'];
    categoryVivo = json['categoryVivo'];
    importanceHonor = json['importanceHonor'] == null ? null : RCIMIWImportanceHonor.values[json['importanceHonor']];
    imageUrlHonor = json['imageUrlHonor'];
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

  /// 鸿蒙推送配置
  RCIMIWHarmonyPushOptions? harmonyPushOptions;

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
    this.harmonyPushOptions,
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
    json['harmonyPushOptions'] = harmonyPushOptions?.toJson();
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
        (json['iOSPushOptions'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    if (json['androidPushOptions'] != null) {
      androidPushOptions = RCIMIWAndroidPushOptions.fromJson(
        (json['androidPushOptions'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    if (json['harmonyPushOptions'] != null) {
      harmonyPushOptions = RCIMIWHarmonyPushOptions.fromJson(
        (json['harmonyPushOptions'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
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

  /// iOS 推送级别。默认值 "active"。
  /// "passive" 被动通知：即并不需要及时关注的通知，类似餐馆推荐通知。
  /// "active" 主动通知（默认的）：默认的通知，即人们可能想知道的，类似最喜欢的体育比赛的最新比分。
  /// "time-sensitive" 时效性通知：需要人们立刻注意的通知，类似账户安全问题或快递动态。
  /// "critical" 重要通知：关于个人健康或直接影响到设备拥有者的公共安全事件且需要立刻关注的，这类通知很少，一般是来自公共政府机构或健康 App。
  String? interruptionLevel;

  RCIMIWIOSPushOptions.create({
    this.threadId,
    this.category,
    this.apnsCollapseId,
    this.richMediaUri,
    this.interruptionLevel,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['threadId'] = threadId;
    json['category'] = category;
    json['apnsCollapseId'] = apnsCollapseId;
    json['richMediaUri'] = richMediaUri;
    json['interruptionLevel'] = interruptionLevel;
    return json;
  }

  RCIMIWIOSPushOptions.fromJson(Map<String, dynamic> json) {
    threadId = json['threadId'];
    category = json['category'];
    apnsCollapseId = json['apnsCollapseId'];
    richMediaUri = json['richMediaUri'];
    interruptionLevel = json['interruptionLevel'];
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

  /// 位置消息缩略图压缩比例
  int? locationThumbnailQuality;

  /// 位置消息压缩的宽度
  int? locationThumbnailWidth;

  /// 位置消息压缩的高度
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

  /// 配置日志上传地址
  String? logServer;

  /// 配置云控服务器地址
  String? cloudControlServer;

  /// 数据中心区域码
  RCIMIWAreaCode? areaCode;

  /// 网络环境标识
  /// 标识客户端所在当前网络环境，例如 intranet 内网，private 专网。如果不配置，使用对应于的默认环境配置
  String? environment;

  /// 设置断线重连时是否踢出重连设备。
  /// 用户没有开通多设备登录功能的前提下，同一个账号在一台新设备上登录的时候，会把这个账号在之前登录的设备上踢出。
  bool? kickReconnectDevice;

  /// 压缩项配置
  RCIMIWCompressOptions? compressOptions;

  /// 日志级别
  RCIMIWLogLevel? logLevel;
  RCIMIWPushOptions? pushOptions;
  bool? enablePush;
  bool? enableIPC;

  RCIMIWEngineOptions.create({
    this.naviServer,
    this.fileServer,
    this.statisticServer,
    this.logServer,
    this.cloudControlServer,
    this.areaCode,
    this.environment,
    this.kickReconnectDevice,
    this.compressOptions,
    this.logLevel,
    this.pushOptions,
    this.enablePush,
    this.enableIPC,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['naviServer'] = naviServer;
    json['fileServer'] = fileServer;
    json['statisticServer'] = statisticServer;
    json['logServer'] = logServer;
    json['cloudControlServer'] = cloudControlServer;
    json['areaCode'] = areaCode?.index;
    json['environment'] = environment;
    json['kickReconnectDevice'] = kickReconnectDevice;
    json['compressOptions'] = compressOptions?.toJson();
    json['logLevel'] = logLevel?.index;
    json['pushOptions'] = pushOptions?.toJson();
    json['enablePush'] = enablePush;
    json['enableIPC'] = enableIPC;
    return json;
  }

  RCIMIWEngineOptions.fromJson(Map<String, dynamic> json) {
    naviServer = json['naviServer'];
    fileServer = json['fileServer'];
    statisticServer = json['statisticServer'];
    logServer = json['logServer'];
    cloudControlServer = json['cloudControlServer'];
    areaCode = json['areaCode'] == null ? null : RCIMIWAreaCode.values[json['areaCode']];
    environment = json['environment'];
    kickReconnectDevice = json['kickReconnectDevice'];
    if (json['compressOptions'] != null) {
      compressOptions = RCIMIWCompressOptions.fromJson(
        (json['compressOptions'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    logLevel = json['logLevel'] == null ? null : RCIMIWLogLevel.values[json['logLevel']];
    if (json['pushOptions'] != null) {
      pushOptions = RCIMIWPushOptions.fromJson(
        (json['pushOptions'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    enablePush = json['enablePush'];
    enableIPC = json['enableIPC'];
  }
}

class RCIMIWMessageAuditInfo {
  /// 是否送审，消息回调是否送给三方审核
  RCIMIWMessageAuditType? auditType;

  /// 项目名称 默认为 空字符串
  String? project;

  /// 审核策略
  String? strategy;

  RCIMIWMessageAuditInfo.create({this.auditType, this.project, this.strategy});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['auditType'] = auditType?.index;
    json['project'] = project;
    json['strategy'] = strategy;
    return json;
  }

  RCIMIWMessageAuditInfo.fromJson(Map<String, dynamic> json) {
    auditType = json['auditType'] == null ? null : RCIMIWMessageAuditType.values[json['auditType']];
    project = json['project'];
    strategy = json['strategy'];
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

  RCIMIWUnknownMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

  RCIMIWUserInfo.create({this.userId, this.name, this.portrait, this.alias, this.extra});

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

  RCIMIWCustomMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    identifier = json['identifier'];
    policy = json['policy'] == null ? null : RCIMIWCustomMessagePolicy.values[json['policy']];
    fields = json['fields'];
  }
}

class RCIMIWNativeCustomMessage extends RCIMIWMessage {
  /// 自定义消息的内容
  Map? fields;

  /// 自定义消息的搜索关键字
  List<String>? searchableWords;

  /// 自定义消息的唯一标识
  String? messageIdentifier;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['fields'] = fields;
    json['searchableWords'] = searchableWords;
    json['messageIdentifier'] = messageIdentifier;
    return json;
  }

  RCIMIWNativeCustomMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    fields = json['fields'];
    searchableWords = json['searchableWords']?.cast<String>();
    messageIdentifier = json['messageIdentifier'];
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

  /// 本地数据库中存储的消息的唯一 ID 值。发送新消息时无需指定该 ID，否则会导致消息入库失败。在失败重发消息时，可以填入已入库的消息的 ID，请确保使用上一次发送失败的消息实例。
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

  /// 设置焚烧时间，默认是 0，0 代表该消息非阅后即焚消息。若此值大于 0，则消息为已读状态后，经过 destructDuration 时间后销毁。
  int? destructDuration;

  /// 消息的接收状态，只能为单一某个状态
  RCIMIWReceivedStatus? receivedStatus;

  /// 消息的接收状态，可同时设为已读、已听、已下载、已收取
  RCIMIWReceivedStatusInfo? receivedStatusInfo;

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

  /// 消息的附加字段，可以随着消息发送给远端
  String? extra;

  /// 消息的本地扩展字段，不会随着消息发送给远端，只会保存在本地数据库中
  String? localExtra;

  /// 消息扩展信息列表，该属性在消息发送时确定，发送之后不能再做修改。扩展信息只支持单聊、群聊、超级群，其它会话类型不能设置扩展信息。默认消息扩展字典 key 长度不超过 32 ，value 长度不超过 4096 ，单次设置扩展数量最大为 20，消息的扩展总数不能超过 300
  Map? expansion;

  /// 消息是否可以包含扩展信息。
  bool? canIncludeExpansion;

  /// 消息送审配置
  RCIMIWMessageAuditInfo? auditInfo;

  /// 定向用户列表，单聊会话类型返回空
  List<String>? directedUserIds;

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
    json['destructDuration'] = destructDuration;
    json['receivedStatus'] = receivedStatus?.index;
    json['receivedStatusInfo'] = receivedStatusInfo?.toJson();
    json['sentStatus'] = sentStatus?.index;
    json['senderUserId'] = senderUserId;
    json['direction'] = direction?.index;
    json['userInfo'] = userInfo?.toJson();
    json['mentionedInfo'] = mentionedInfo?.toJson();
    json['pushOptions'] = pushOptions?.toJson();
    json['extra'] = extra;
    json['localExtra'] = localExtra;
    json['expansion'] = expansion;
    json['canIncludeExpansion'] = canIncludeExpansion;
    json['auditInfo'] = auditInfo?.toJson();
    json['directedUserIds'] = directedUserIds;
    return json;
  }

  RCIMIWMessage.fromJson(Map<String, dynamic> json) {
    conversationType =
        json['conversationType'] == null ? null : RCIMIWConversationType.values[json['conversationType']];
    messageType = json['messageType'] == null ? null : RCIMIWMessageType.values[json['messageType']];
    targetId = json['targetId'];
    channelId = json['channelId'];
    messageId = json['messageId'];
    messageUId = json['messageUId'];
    offLine = json['offLine'];
    if (json['groupReadReceiptInfo'] != null) {
      groupReadReceiptInfo = RCIMIWGroupReadReceiptInfo.fromJson(
        (json['groupReadReceiptInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    receivedTime = json['receivedTime'];
    sentTime = json['sentTime'];
    destructDuration = json['destructDuration'];
    receivedStatus = json['receivedStatus'] == null ? null : RCIMIWReceivedStatus.values[json['receivedStatus']];
    if (json['receivedStatusInfo'] != null) {
      receivedStatusInfo = RCIMIWReceivedStatusInfo.fromJson(
        (json['receivedStatusInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    sentStatus = json['sentStatus'] == null ? null : RCIMIWSentStatus.values[json['sentStatus']];
    senderUserId = json['senderUserId'];
    direction = json['direction'] == null ? null : RCIMIWMessageDirection.values[json['direction']];
    if (json['userInfo'] != null) {
      userInfo = RCIMIWUserInfo.fromJson(
        (json['userInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    if (json['mentionedInfo'] != null) {
      mentionedInfo = RCIMIWMentionedInfo.fromJson(
        (json['mentionedInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    if (json['pushOptions'] != null) {
      pushOptions = RCIMIWMessagePushOptions.fromJson(
        (json['pushOptions'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    extra = json['extra'];
    localExtra = json['localExtra'];
    expansion = json['expansion'];
    canIncludeExpansion = json['canIncludeExpansion'];
    if (json['auditInfo'] != null) {
      auditInfo = RCIMIWMessageAuditInfo.fromJson(
        (json['auditInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    directedUserIds = json['directedUserIds']?.cast<String>();
  }
}

class RCIMIWNativeCustomMediaMessage extends RCIMIWMediaMessage {
  /// 自定义消息的内容
  Map? fields;

  /// 自定义消息的搜索关键字
  List<String>? searchableWords;

  /// 自定义消息的唯一标识
  String? messageIdentifier;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['fields'] = fields;
    json['searchableWords'] = searchableWords;
    json['messageIdentifier'] = messageIdentifier;
    return json;
  }

  RCIMIWNativeCustomMediaMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    fields = json['fields'];
    searchableWords = json['searchableWords']?.cast<String>();
    messageIdentifier = json['messageIdentifier'];
  }
}

class RCIMIWReceivedStatusInfo {
  /// 获取是否已读取的状态。
  bool? read;

  /// 获取是否已被收听的状态。
  bool? listened;

  /// 获取文件是否已经下载的状态。
  bool? downloaded;

  /// 获取消息是否已经被收取过。该消息已被同时在线或之前登录的其他设备接收。只要任何其他设备先收到该消息，当前设备该状态值就会为 true。
  bool? retrieved;

  RCIMIWReceivedStatusInfo.create({this.read, this.listened, this.downloaded, this.retrieved});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['read'] = read;
    json['listened'] = listened;
    json['downloaded'] = downloaded;
    json['retrieved'] = retrieved;
    return json;
  }

  RCIMIWReceivedStatusInfo.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    listened = json['listened'];
    downloaded = json['downloaded'];
    retrieved = json['retrieved'];
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

  RCIMIWImageMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

  /// 被撤回的原始消息的发送时间（毫秒）
  int? recallTime;

  /// 撤回动作的时间（毫秒）
  int? recallActionTime;

  /// 撤回操作者的用户 ID
  String? operatorId;

  /// 被撤回的原消息
  RCIMIWMessage? originalMessage;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['admin'] = admin;
    json['deleted'] = deleted;
    json['recallTime'] = recallTime;
    json['recallActionTime'] = recallActionTime;
    json['operatorId'] = operatorId;
    json['originalMessage'] = originalMessage?.toJson();
    return json;
  }

  RCIMIWRecallNotificationMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    admin = json['admin'];
    deleted = json['deleted'];
    recallTime = json['recallTime'];
    recallActionTime = json['recallActionTime'];
    operatorId = json['operatorId'];
    if (json['originalMessage'] != null) {
      originalMessage = RCIMConverter.convertMessage(
        (json['originalMessage'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
  }
}

class RCIMIWMediaMessage extends RCIMIWMessage {
  /// 本地路径
  String? local;

  /// 远端路径
  String? remote;

  /// Flutter For Web 端选取的文件（移动端使用无效）
  dynamic file;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['local'] = local;
    json['remote'] = remote;
    return json;
  }

  RCIMIWMediaMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    local = json['local'];
    remote = json['remote'];
  }
}

class RCIMIWTextMessage extends RCIMIWMessage {
  /// 文本内容
  String? text;
  RCIMIWTranslateInfo? translateInfo;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['text'] = text;
    json['translateInfo'] = translateInfo?.toJson();
    return json;
  }

  RCIMIWTextMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    text = json['text'];
    if (json['translateInfo'] != null) {
      translateInfo = RCIMIWTranslateInfo.fromJson(
        (json['translateInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
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

  RCIMIWCommandMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

  RCIMIWVoiceMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

  RCIMIWMentionedInfo.create({this.type, this.userIdList, this.mentionedContent});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['type'] = type?.index;
    json['userIdList'] = userIdList;
    json['mentionedContent'] = mentionedContent;
    return json;
  }

  RCIMIWMentionedInfo.fromJson(Map<String, dynamic> json) {
    type = json['type'] == null ? null : RCIMIWMentionedType.values[json['type']];
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

  RCIMIWCommandNotificationMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

  RCIMIWSightMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

  /// 缩略图 base64 字符串 （仅限 Flutter For Web 端使用）
  String? thumbnailBase64;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['longitude'] = longitude;
    json['latitude'] = latitude;
    json['poiName'] = poiName;
    json['thumbnailPath'] = thumbnailPath;
    return json;
  }

  RCIMIWLocationMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    poiName = json['poiName'];
    thumbnailPath = json['thumbnailPath'];
  }
}

class RCIMIWGroupNotificationMessage extends RCIMIWMessage {
  String? operation;
  String? operatorUserId;
  String? data;
  String? message;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['operation'] = operation;
    json['operatorUserId'] = operatorUserId;
    json['data'] = data;
    json['message'] = message;
    return json;
  }

  RCIMIWGroupNotificationMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    operation = json['operation'];
    operatorUserId = json['operatorUserId'];
    data = json['data'];
    message = json['message'];
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

  RCIMIWReferenceMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    text = json['text'];
    if (json['referenceMessage'] != null) {
      referenceMessage = RCIMConverter.convertMessage(
        (json['referenceMessage'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
  }
}

class RCIMIWTranslateMessageParam {
  String? messageUId;

  /// Getters
  String? sourceLanguage;
  String? targetLanguage;

  RCIMIWTranslateMessageParam.create({this.messageUId, this.sourceLanguage, this.targetLanguage});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['messageUId'] = messageUId;
    json['sourceLanguage'] = sourceLanguage;
    json['targetLanguage'] = targetLanguage;
    return json;
  }

  RCIMIWTranslateMessageParam.fromJson(Map<String, dynamic> json) {
    messageUId = json['messageUId'];
    sourceLanguage = json['sourceLanguage'];
    targetLanguage = json['targetLanguage'];
  }
}

class RCIMIWTranslateTextParams {
  RCIMIWTranslateMode? mode;
  List<RCIMIWTranslateTextParam>? list;

  RCIMIWTranslateTextParams.create({this.mode, this.list});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['mode'] = mode?.index;
    json['list'] = list?.map((item) => item.toJson()).toList();
    return json;
  }

  RCIMIWTranslateTextParams.fromJson(Map<String, dynamic> json) {
    mode = json['mode'] == null ? null : RCIMIWTranslateMode.values[json['mode']];
    list =
        json['list']
            ?.map<RCIMIWTranslateTextParam>(
              (item) =>
                  RCIMIWTranslateTextParam.fromJson((item as Map).map((key, value) => MapEntry(key.toString(), value))),
            )
            .toList();
  }
}

class RCIMIWTranslateMessagesParams {
  /// Getters
  bool? force;
  RCIMIWTranslateMode? mode;
  List<RCIMIWTranslateMessageParam>? list;

  RCIMIWTranslateMessagesParams.create({this.force, this.mode, this.list});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['force'] = force;
    json['mode'] = mode?.index;
    json['list'] = list?.map((item) => item.toJson()).toList();
    return json;
  }

  RCIMIWTranslateMessagesParams.fromJson(Map<String, dynamic> json) {
    force = json['force'];
    mode = json['mode'] == null ? null : RCIMIWTranslateMode.values[json['mode']];
    list =
        json['list']
            ?.map<RCIMIWTranslateMessageParam>(
              (item) => RCIMIWTranslateMessageParam.fromJson(
                (item as Map).map((key, value) => MapEntry(key.toString(), value)),
              ),
            )
            .toList();
  }
}

class RCIMIWTranslateInfo {
  /// Getters
  String? translatedText;
  String? targetLanguage;
  RCIMIWTranslateStatus? status;

  RCIMIWTranslateInfo.create({this.translatedText, this.targetLanguage, this.status});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['translatedText'] = translatedText;
    json['targetLanguage'] = targetLanguage;
    json['status'] = status?.index;
    return json;
  }

  RCIMIWTranslateInfo.fromJson(Map<String, dynamic> json) {
    translatedText = json['translatedText'];
    targetLanguage = json['targetLanguage'];
    status = json['status'] == null ? null : RCIMIWTranslateStatus.values[json['status']];
  }
}

class RCIMIWTranslateTextParam {
  String? text;

  /// Getters
  String? sourceLanguage;
  String? targetLanguage;

  RCIMIWTranslateTextParam.create({this.text, this.sourceLanguage, this.targetLanguage});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['text'] = text;
    json['sourceLanguage'] = sourceLanguage;
    json['targetLanguage'] = targetLanguage;
    return json;
  }

  RCIMIWTranslateTextParam.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    sourceLanguage = json['sourceLanguage'];
    targetLanguage = json['targetLanguage'];
  }
}

class RCIMIWTranslateItem {
  /// Getters
  String? identifier;
  RCIMIWTranslateInfo? translateInfo;
  int? errorCode;
  RCIMIWTranslateResultType? resultType;

  RCIMIWTranslateItem.create({this.identifier, this.translateInfo, this.errorCode, this.resultType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['identifier'] = identifier;
    json['translateInfo'] = translateInfo?.toJson();
    json['errorCode'] = errorCode;
    json['resultType'] = resultType?.index;
    return json;
  }

  RCIMIWTranslateItem.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    if (json['translateInfo'] != null) {
      translateInfo = RCIMIWTranslateInfo.fromJson(
        (json['translateInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    errorCode = json['errorCode'];
    resultType = json['resultType'] == null ? null : RCIMIWTranslateResultType.values[json['resultType']];
  }
}

class RCIMIWPagingQueryResult<T> {
  String? pageToken;
  int? totalCount;
  List<T>? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['pageToken'] = pageToken;
    json['totalCount'] = totalCount;
    json['data'] = data;
    return json;
  }

  RCIMIWPagingQueryResult.fromJson(Map<String, dynamic> json) {
    pageToken = json['pageToken'] as String?;
    totalCount = json['totalCount'] as int?;

    var rawList = json['data'] as List<dynamic>?;

    if (rawList != null) {
      data =
          rawList.map<T>((e) {
            final map = Map<String, dynamic>.from(e as Map);
            if (T == RCIMIWGroupMemberInfo) {
              return RCIMIWGroupMemberInfo.fromJson(map) as T;
            } else if (T == RCIMIWGroupInfo) {
              return RCIMIWGroupInfo.fromJson(map) as T;
            } else if (T == RCIMIWGroupApplicationInfo) {
              return RCIMIWGroupApplicationInfo.fromJson(map) as T;
            } else {
              throw UnsupportedError('Unsupported type: $T');
            }
          }).toList();
    }
  }
}

class RCIMIWFollowInfo {
  /// 用户 Id
  String? userId;

  /// 关注时间戳，当前用户关注此用户的时间戳。
  int? time;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['time'] = time;
    return json;
  }

  RCIMIWFollowInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    time = json['time'];
  }
}

class RCIMIWGroupInfo {
  /// 群Id。最大长度 64 个字符。支持大小写英文字母与数字的组合。
  String? groupId;

  /// 群名称。最长不超过 64 个字符，创建群组时群名称可以重复。
  String? groupName;

  /// 群头像 URL 地址。长度不超过 128 个字符
  String? portraitUri;

  /// 群简介。最大长度不超过 512 个字符
  String? introduction;

  /// 群公告。最大长度不超过 1024 个字符
  String? notice;

  /// 群扩展信息。默认最多可设置 10 个扩展信息。注意：需要通过开发者后台或 API 设置后才能使用，否则返回设置失败
  Map? extProfile;

  /// 主动加入群权限权限
  RCIMIWGroupJoinPermission? joinPermission;

  /// 将群成员移出群组设置权限
  RCIMIWGroupOperationPermission? removeMemberPermission;

  /// 邀请他人入群权限
  RCIMIWGroupOperationPermission? invitePermission;

  /// 被邀请入群权限
  RCIMIWGroupInviteHandlePermission? inviteHandlePermission;

  /// 群信息更新权限
  RCIMIWGroupOperationPermission? groupInfoEditPermission;

  /// 群成员信息更新权限
  RCIMIWGroupMemberInfoEditPermission? memberInfoEditPermission;

  /// 创建者ID。 注意：此属性只读
  String? creatorId;

  /// 群主ID。注意：此属性只读
  String? ownerId;

  /// 当前群名称备注名。注意：此属性只读
  String? remark;

  /// 群组创建时间。注意：此属性只读
  int? createTime;

  /// 群当前成员人数。注意：此属性只读
  int? membersCount;

  /// 当前用户加入时间：用户多次加入群组时，以最后一次加入时间为准。注意：此属性只读
  int? joinedTime;

  /// 当前用户群身份：群主、群管理员、群成员。注意：此属性只读
  RCIMIWGroupMemberRole? role;

  /// 群组状态 (默认为使用中)。注意：此属性只读
  RCIMIWGroupStatus? groupStatus;

  /// 群组状态更新时间: 如果是使用中，则为创建时间；如果是已解散，则为解散时间。注意：此属性只读
  int? groupStatusUpdateTime;

  RCIMIWGroupInfo.create({
    this.groupId,
    this.groupName,
    this.portraitUri,
    this.introduction,
    this.notice,
    this.extProfile,
    this.joinPermission,
    this.removeMemberPermission,
    this.invitePermission,
    this.inviteHandlePermission,
    this.groupInfoEditPermission,
    this.memberInfoEditPermission,
    this.creatorId,
    this.ownerId,
    this.remark,
    this.createTime,
    this.membersCount,
    this.joinedTime,
    this.role,
    this.groupStatus,
    this.groupStatusUpdateTime,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['groupId'] = groupId;
    json['groupName'] = groupName;
    json['portraitUri'] = portraitUri;
    json['introduction'] = introduction;
    json['notice'] = notice;
    json['extProfile'] = extProfile;
    json['joinPermission'] = joinPermission?.index;
    json['removeMemberPermission'] = removeMemberPermission?.index;
    json['invitePermission'] = invitePermission?.index;
    json['inviteHandlePermission'] = inviteHandlePermission?.index;
    json['groupInfoEditPermission'] = groupInfoEditPermission?.index;
    json['memberInfoEditPermission'] = memberInfoEditPermission?.index;
    json['creatorId'] = creatorId;
    json['ownerId'] = ownerId;
    json['remark'] = remark;
    json['createTime'] = createTime;
    json['membersCount'] = membersCount;
    json['joinedTime'] = joinedTime;
    json['role'] = role?.index;
    json['groupStatus'] = groupStatus?.index;
    json['groupStatusUpdateTime'] = groupStatusUpdateTime;
    return json;
  }

  RCIMIWGroupInfo.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    groupName = json['groupName'];
    portraitUri = json['portraitUri'];
    introduction = json['introduction'];
    notice = json['notice'];
    extProfile = json['extProfile'];
    joinPermission = json['joinPermission'] == null ? null : RCIMIWGroupJoinPermission.values[json['joinPermission']];
    removeMemberPermission =
        json['removeMemberPermission'] == null
            ? null
            : RCIMIWGroupOperationPermission.values[json['removeMemberPermission']];
    invitePermission =
        json['invitePermission'] == null ? null : RCIMIWGroupOperationPermission.values[json['invitePermission']];
    inviteHandlePermission =
        json['inviteHandlePermission'] == null
            ? null
            : RCIMIWGroupInviteHandlePermission.values[json['inviteHandlePermission']];
    groupInfoEditPermission =
        json['groupInfoEditPermission'] == null
            ? null
            : RCIMIWGroupOperationPermission.values[json['groupInfoEditPermission']];
    memberInfoEditPermission =
        json['memberInfoEditPermission'] == null
            ? null
            : RCIMIWGroupMemberInfoEditPermission.values[json['memberInfoEditPermission']];
    creatorId = json['creatorId'];
    ownerId = json['ownerId'];
    remark = json['remark'];
    createTime = json['createTime'];
    membersCount = json['membersCount'];
    joinedTime = json['joinedTime'];
    role = json['role'] == null ? null : RCIMIWGroupMemberRole.values[json['role']];
    groupStatus = json['groupStatus'] == null ? null : RCIMIWGroupStatus.values[json['groupStatus']];
    groupStatusUpdateTime = json['groupStatusUpdateTime'];
  }
}

class RCIMIWGroupMemberInfo {
  /// 群成员用户Id。
  String? userId;

  /// 群成员头像 URL 地址。长度不超过 128 个字符
  String? portraitUri;

  /// 群成员名称。
  String? name;

  /// 群成员群昵称：默认未设置时为用户名称，最大长度不超过 64 个字符
  String? nickname;

  /// 群成员附加信息。长度不超过 128 个字符
  String? extra;

  /// 入群时间：时间戳，精确到毫秒
  int? joinedTime;

  /// 群成员角色
  RCIMIWGroupMemberRole? role;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['portraitUri'] = portraitUri;
    json['name'] = name;
    json['nickname'] = nickname;
    json['extra'] = extra;
    json['joinedTime'] = joinedTime;
    json['role'] = role?.index;
    return json;
  }

  RCIMIWGroupMemberInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    portraitUri = json['portraitUri'];
    name = json['name'];
    nickname = json['nickname'];
    extra = json['extra'];
    joinedTime = json['joinedTime'];
    role = json['role'] == null ? null : RCIMIWGroupMemberRole.values[json['role']];
  }
}

class RCIMIWPagingQueryOption {
  /// 当前页数标识，表示当前查询到的位置。
  String? pageToken;

  /// 每页条数。
  int? count;

  /// 排序类型：支持设置正序、倒序获取。true：正序；false：倒序。默认值为false，倒序返回。
  bool? order;

  RCIMIWPagingQueryOption.create({this.pageToken, this.count, this.order});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['pageToken'] = pageToken;
    json['count'] = count;
    json['order'] = order;
    return json;
  }

  RCIMIWPagingQueryOption.fromJson(Map<String, dynamic> json) {
    pageToken = json['pageToken'];
    count = json['count'];
    order = json['order'];
  }
}

class RCIMIWQuitGroupConfig {
  /// 是否移除群成员禁言状态，true代表移除，false代表不移除。默认为true
  bool? removeMuteStatus;

  /// 是否移除群成员白名单，true代表移除，false代表不移除。默认为true
  bool? removeWhiteList;

  /// 是否移除特别关注群成员，true代表移除，false代表不移除。默认为true
  bool? removeFollow;

  RCIMIWQuitGroupConfig.create({this.removeMuteStatus, this.removeWhiteList, this.removeFollow});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['removeMuteStatus'] = removeMuteStatus;
    json['removeWhiteList'] = removeWhiteList;
    json['removeFollow'] = removeFollow;
    return json;
  }

  RCIMIWQuitGroupConfig.fromJson(Map<String, dynamic> json) {
    removeMuteStatus = json['removeMuteStatus'];
    removeWhiteList = json['removeWhiteList'];
    removeFollow = json['removeFollow'];
  }
}

class RCIMIWGroupApplicationInfo {
  String? groupId;
  RCIMIWGroupMemberInfo? joinMemberInfo;
  RCIMIWGroupMemberInfo? inviterInfo;
  RCIMIWGroupMemberInfo? operatorInfo;
  RCIMIWGroupApplicationStatus? status;
  RCIMIWGroupApplicationDirection? direction;
  RCIMIWGroupApplicationType? type;
  int? operationTime;
  String? reason;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['groupId'] = groupId;
    json['joinMemberInfo'] = joinMemberInfo?.toJson();
    json['inviterInfo'] = inviterInfo?.toJson();
    json['operatorInfo'] = operatorInfo?.toJson();
    json['status'] = status?.index;
    json['direction'] = direction?.index;
    json['type'] = type?.index;
    json['operationTime'] = operationTime;
    json['reason'] = reason;
    return json;
  }

  RCIMIWGroupApplicationInfo.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    if (json['joinMemberInfo'] != null) {
      joinMemberInfo = RCIMIWGroupMemberInfo.fromJson(
        (json['joinMemberInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    if (json['inviterInfo'] != null) {
      inviterInfo = RCIMIWGroupMemberInfo.fromJson(
        (json['inviterInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    if (json['operatorInfo'] != null) {
      operatorInfo = RCIMIWGroupMemberInfo.fromJson(
        (json['operatorInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    status = json['status'] == null ? null : RCIMIWGroupApplicationStatus.values[json['status']];
    direction = json['direction'] == null ? null : RCIMIWGroupApplicationDirection.values[json['direction']];
    type = json['type'] == null ? null : RCIMIWGroupApplicationType.values[json['type']];
    operationTime = json['operationTime'];
    reason = json['reason'];
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
    conversationType =
        json['conversationType'] == null ? null : RCIMIWConversationType.values[json['conversationType']];
    targetId = json['targetId'];
    blockedMsgUId = json['blockedMsgUId'];
    blockType = json['blockType'] == null ? null : RCIMIWMessageBlockType.values[json['blockType']];
    extra = json['extra'];
  }
}

class RCIMIWTypingStatus {
  /// 当前正在输入的用户 ID
  String? userId;

  /// 当前正在输入的消息类型名，为发送方调用发送接口时传入的 currentType
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
    status = json['status'] == null ? null : RCIMIWUltraGroupTypingStatus.values[json['status']];
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

class RCIMIWChatRoomMemberBanEvent {
  String? chatroomId;
  RCIMIWChatRoomMemberBanType? banType;
  int? durationTime;
  int? operateTime;
  List<String>? userIdList;
  String? extra;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['chatroomId'] = chatroomId;
    json['banType'] = banType?.index;
    json['durationTime'] = durationTime;
    json['operateTime'] = operateTime;
    json['userIdList'] = userIdList;
    json['extra'] = extra;
    return json;
  }

  RCIMIWChatRoomMemberBanEvent.fromJson(Map<String, dynamic> json) {
    chatroomId = json['chatroomId'];
    banType = json['banType'] == null ? null : RCIMIWChatRoomMemberBanType.values[json['banType']];
    durationTime = json['durationTime'];
    operateTime = json['operateTime'];
    userIdList = json['userIdList']?.cast<String>();
    extra = json['extra'];
  }
}

class RCIMIWChatRoomSyncEvent {
  String? chatroomId;
  RCIMIWChatRoomSyncStatus? status;
  RCIMIWChatRoomSyncStatusReason? reason;
  int? time;
  String? extra;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['chatroomId'] = chatroomId;
    json['status'] = status?.index;
    json['reason'] = reason?.index;
    json['time'] = time;
    json['extra'] = extra;
    return json;
  }

  RCIMIWChatRoomSyncEvent.fromJson(Map<String, dynamic> json) {
    chatroomId = json['chatroomId'];
    status = json['status'] == null ? null : RCIMIWChatRoomSyncStatus.values[json['status']];
    reason = json['reason'] == null ? null : RCIMIWChatRoomSyncStatusReason.values[json['reason']];
    time = json['time'];
    extra = json['extra'];
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
    actionType = json['actionType'] == null ? null : RCIMIWChatRoomMemberActionType.values[json['actionType']];
  }
}

class RCIMIWChatRoomMemberBlockEvent {
  String? chatroomId;
  RCIMIWChatRoomMemberOperateType? operateType;
  int? durationTime;
  int? operateTime;
  List<String>? userIdList;
  String? extra;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['chatroomId'] = chatroomId;
    json['operateType'] = operateType?.index;
    json['durationTime'] = durationTime;
    json['operateTime'] = operateTime;
    json['userIdList'] = userIdList;
    json['extra'] = extra;
    return json;
  }

  RCIMIWChatRoomMemberBlockEvent.fromJson(Map<String, dynamic> json) {
    chatroomId = json['chatroomId'];
    operateType = json['operateType'] == null ? null : RCIMIWChatRoomMemberOperateType.values[json['operateType']];
    durationTime = json['durationTime'];
    operateTime = json['operateTime'];
    userIdList = json['userIdList']?.cast<String>();
    extra = json['extra'];
  }
}

class RCIMIWSubscribeEvent {
  String? userId;
  RCIMIWSubscribeType? subscribeType;
  RCIMIWSubscribeOperationType? operationType;
  int? subscribeTime;
  int? expiry;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['subscribeType'] = subscribeType?.index;
    json['operationType'] = operationType?.index;
    json['subscribeTime'] = subscribeTime;
    json['expiry'] = expiry;
    return json;
  }

  RCIMIWSubscribeEvent.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    subscribeType = json['subscribeType'] == null ? null : RCIMIWSubscribeType.values[json['subscribeType']];
    operationType = json['operationType'] == null ? null : RCIMIWSubscribeOperationType.values[json['operationType']];
    subscribeTime = json['subscribeTime'];
    expiry = json['expiry'];
  }
}

class RCIMIWSubscribeInfoEvent {
  String? userId;
  RCIMIWSubscribeType? subscribeType;
  int? subscribeTime;
  int? expiry;
  List<RCIMIWSubscribeEventDetail>? details;
  RCIMIWUserProfile? userProfile;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['subscribeType'] = subscribeType?.index;
    json['subscribeTime'] = subscribeTime;
    json['expiry'] = expiry;
    json['details'] = details?.map((item) => item.toJson()).toList();
    json['userProfile'] = userProfile?.toJson();
    return json;
  }

  RCIMIWSubscribeInfoEvent.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    subscribeType = json['subscribeType'] == null ? null : RCIMIWSubscribeType.values[json['subscribeType']];
    subscribeTime = json['subscribeTime'];
    expiry = json['expiry'];
    details =
        json['details']
            ?.map<RCIMIWSubscribeEventDetail>(
              (item) => RCIMIWSubscribeEventDetail.fromJson(
                (item as Map).map((key, value) => MapEntry(key.toString(), value)),
              ),
            )
            .toList();
    if (json['userProfile'] != null) {
      userProfile = RCIMIWUserProfile.fromJson(
        (json['userProfile'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
  }
}

class RCIMIWSubscribeEventDetail {
  int? eventValue;
  int? changeTime;
  RCIMIWPlatform? platform;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['eventValue'] = eventValue;
    json['changeTime'] = changeTime;
    json['platform'] = platform?.index;
    return json;
  }

  RCIMIWSubscribeEventDetail.fromJson(Map<String, dynamic> json) {
    eventValue = json['eventValue'];
    changeTime = json['changeTime'];
    platform = json['platform'] == null ? null : RCIMIWPlatform.values[json['platform']];
  }
}

class RCIMIWSubscribeEventRequest {
  RCIMIWSubscribeType? subscribeType;
  int? expiry;
  List<String>? userIds;

  RCIMIWSubscribeEventRequest.create({this.subscribeType, this.expiry, this.userIds});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['subscribeType'] = subscribeType?.index;
    json['expiry'] = expiry;
    json['userIds'] = userIds;
    return json;
  }

  RCIMIWSubscribeEventRequest.fromJson(Map<String, dynamic> json) {
    subscribeType = json['subscribeType'] == null ? null : RCIMIWSubscribeType.values[json['subscribeType']];
    expiry = json['expiry'];
    userIds = json['userIds']?.cast<String>();
  }
}

class RCIMIWUserProfile {
  String? userId;
  String? name;
  String? portraitUri;
  String? uniqueId;
  String? email;
  String? birthday;
  RCIMIWUserGender? gender;
  String? location;
  int? role;
  int? level;
  Map? userExtProfile;

  RCIMIWUserProfile.create({
    this.userId,
    this.name,
    this.portraitUri,
    this.uniqueId,
    this.email,
    this.birthday,
    this.gender,
    this.location,
    this.role,
    this.level,
    this.userExtProfile,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userId'] = userId;
    json['name'] = name;
    json['portraitUri'] = portraitUri;
    json['uniqueId'] = uniqueId;
    json['email'] = email;
    json['birthday'] = birthday;
    json['gender'] = gender?.index;
    json['location'] = location;
    json['role'] = role;
    json['level'] = level;
    json['userExtProfile'] = userExtProfile;
    return json;
  }

  RCIMIWUserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    portraitUri = json['portraitUri'];
    uniqueId = json['uniqueId'];
    email = json['email'];
    birthday = json['birthday'];
    gender = json['gender'] == null ? null : RCIMIWUserGender.values[json['gender']];
    location = json['location'];
    role = json['role'];
    level = json['level'];
    userExtProfile = json['userExtProfile'];
  }
}

class RCIMIWConversationTagInfo {
  RCIMIWTagInfo? tagInfo;
  bool? top;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['tagInfo'] = tagInfo?.toJson();
    json['top'] = top;
    return json;
  }

  RCIMIWConversationTagInfo.fromJson(Map<String, dynamic> json) {
    if (json['tagInfo'] != null) {
      tagInfo = RCIMIWTagInfo.fromJson((json['tagInfo'] as Map).map((key, value) => MapEntry(key.toString(), value)));
    }
    top = json['top'];
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
        (json['conversation'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    count = json['count'];
  }
}

class RCIMIWTagInfo {
  String? tagId;
  String? tagName;
  int? count;
  int? timestamp;

  RCIMIWTagInfo.create({this.tagId, this.tagName, this.count, this.timestamp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['tagId'] = tagId;
    json['tagName'] = tagName;
    json['count'] = count;
    json['timestamp'] = timestamp;
    return json;
  }

  RCIMIWTagInfo.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    tagName = json['tagName'];
    count = json['count'];
    timestamp = json['timestamp'];
  }
}

class RCIMIWConversation {
  /// 获取会话类型
  RCIMIWConversationType? conversationType;

  /// 会话 ID，单聊时为接收方 ID，群组会话中为群组 ID，聊天室会话中为聊天室 ID，系统会话为开发者指定的系统账号 Id
  String? targetId;

  /// 频道 ID
  String? channelId;

  /// 当前会话未读消息数量
  int? unreadCount;

  /// 会话中 @ 消息的总未读个数
  int? mentionedCount;

  /// 超级群会话中 @ 我的消息的未读个数，只有超级群获取频道列表时有效。
  int? mentionedMeCount;

  /// 本会话是否置顶
  bool? top;

  /// 会话里保存的草稿信息
  String? draft;

  /// 获取最后一条消息
  RCIMIWMessage? lastMessage;

  /// 会话的通知级别
  RCIMIWPushNotificationLevel? notificationLevel;

  /// 获取会话第一条未读消息的时间戳，仅对超级群生效
  int? firstUnreadMsgSendTime;

  /// 获取会话最后的操作时间
  int? operationTime;

  /// 获取会话翻译策略
  RCIMIWTranslateStrategy? translateStrategy;

  RCIMIWConversation.create({
    this.conversationType,
    this.targetId,
    this.channelId,
    this.unreadCount,
    this.mentionedCount,
    this.mentionedMeCount,
    this.top,
    this.draft,
    this.lastMessage,
    this.notificationLevel,
    this.firstUnreadMsgSendTime,
    this.operationTime,
    this.translateStrategy,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['conversationType'] = conversationType?.index;
    json['targetId'] = targetId;
    json['channelId'] = channelId;
    json['unreadCount'] = unreadCount;
    json['mentionedCount'] = mentionedCount;
    json['mentionedMeCount'] = mentionedMeCount;
    json['top'] = top;
    json['draft'] = draft;
    json['lastMessage'] = lastMessage?.toJson();
    json['notificationLevel'] = notificationLevel?.index;
    json['firstUnreadMsgSendTime'] = firstUnreadMsgSendTime;
    json['operationTime'] = operationTime;
    json['translateStrategy'] = translateStrategy?.index;
    return json;
  }

  RCIMIWConversation.fromJson(Map<String, dynamic> json) {
    conversationType =
        json['conversationType'] == null ? null : RCIMIWConversationType.values[json['conversationType']];
    targetId = json['targetId'];
    channelId = json['channelId'];
    unreadCount = json['unreadCount'];
    mentionedCount = json['mentionedCount'];
    mentionedMeCount = json['mentionedMeCount'];
    top = json['top'];
    draft = json['draft'];
    if (json['lastMessage'] != null) {
      lastMessage = RCIMConverter.convertMessage(
        (json['lastMessage'] as Map).map((key, value) => MapEntry(key.toString(), value)),
      );
    }
    notificationLevel =
        json['notificationLevel'] == null ? null : RCIMIWPushNotificationLevel.values[json['notificationLevel']];
    firstUnreadMsgSendTime = json['firstUnreadMsgSendTime'];
    operationTime = json['operationTime'];
    translateStrategy =
        json['translateStrategy'] == null ? null : RCIMIWTranslateStrategy.values[json['translateStrategy']];
  }
}

class RCIMIWPushOptions {
  String? idMI;
  String? appKeyMI;
  String? appIdMeizu;
  String? appKeyMeizu;
  String? appKeyOPPO;
  String? appSecretOPPO;
  bool? enableHWPush;
  bool? enableFCM;
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
