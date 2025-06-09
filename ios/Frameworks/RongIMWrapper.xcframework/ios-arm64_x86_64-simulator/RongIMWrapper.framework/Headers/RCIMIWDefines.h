//
//  RCIMIWDefines.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/24/22.
//

#ifndef RCIMIWDefines_h
#define RCIMIWDefines_h

#pragma mark 错误码

typedef NS_ENUM(NSInteger, RCIMIWErrorCode) {
    RCIMIWErrorCodeSuccess = 0,
    RCIMIWErrorCodeParamError = -101,
    RCIMIWErrorCodeEngineDestroyed = -102,
    RCIMIWErrorCodeNativeOperationError = -103,
    RCIMIWErrorCodeResultUnknown = -104,
};

#pragma mark 连接状态

typedef NS_ENUM(NSInteger, RCIMIWConnectionStatus) {

    /*!
     连接过程中，当前设备网络不可用

     @discussion 当网络恢复可用时，SDK 会做好自动重连，开发者无须处理。
     */
    RCIMIWConnectionStatusNetworkUnavailable = 0,
    
    /*!
     连接成功
     */
    RCIMIWConnectionStatusConnected = 1,
    
    /*!
     连接中
     */
    RCIMIWConnectionStatusConnecting = 2,

    /*!
     连接失败或未连接
     */
    RCIMIWConnectionStatusUnconnected = 3,
    
    /*!
     当前用户在其他设备上登录，此设备被踢下线
     */
    RCIMIWConnectionStatusKickedOfflineByOtherClient = 4,
    
    /*!
     Token无效

     @discussion
     Token 无效一般有两种原因。一是 token 错误，请您检查客户端初始化使用的 AppKey 和您服务器获取 token 使用的 AppKey
     是否一致；二是 token 过期，是因为您在开发者后台设置了 token 过期时间，您需要请求您的服务器重新获取 token
     并再次用新的 token 建立连接。
     */
    RCIMIWConnectionStatusTokenIncorrect = 5,
    
    /*!
     与服务器的连接已断开,用户被封禁
     */
    RCIMIWConnectionStatusConnUserBlocked = 6,
    
    /*!
     已登出
     */
    RCIMIWConnectionStatusSignOut = 7,
    
    /*!
     连接暂时挂起（多是由于网络问题导致），SDK 会在合适时机进行自动重连
    */
    RCIMIWConnectionStatusSuspend = 8,
    
    /*!
     自动连接超时，SDK 将不会继续连接，用户需要做超时处理，再自行调用 connectWithToken 接口进行连接
    */
    RCIMIWConnectionStatusTimeout = 9,
    
    /*!
     未知状态

     @discussion 建立连接中出现异常的临时状态，SDK 会做好自动重连，开发者无须处理。
     */
    RCIMIWConnectionStatusUnknown = 10,
};


#pragma mark 会话类型
 
typedef NS_ENUM(NSInteger, RCIMIWConversationType) {
    /*!
     无效类型
     */
    RCIMIWConversationTypeInvalid = 0,
    
    /*!
     单聊
     */
    RCIMIWConversationTypePrivate = 1,

    /*!
     群组
     */
    RCIMIWConversationTypeGroup = 2,

    /*!
     聊天室
     */
    RCIMIWConversationTypeChatroom = 3,

    /*!
     系统会话
     */
    RCIMIWConversationTypeSystem = 4,

    /*!
     超级群
     */
    RCIMIWConversationTypeUltraGroup = 5,

};

#pragma mark 消息类型

typedef NS_ENUM(NSInteger, RCIMIWMessageType)  {
    
    /*!
     未知消息
     */
    RCIMIWMessageTypeUnknown = 0,

    /*!
     自定义
     */
    RCIMIWMessageTypeCustom = 1,
    
    /*!
     文本
     */
    RCIMIWMessageTypeText = 2,

    /*!
     语音
     */
    RCIMIWMessageTypeVoice = 3,

    /*!
     图片
     */
    RCIMIWMessageTypeImage = 4,

    /*!
     其他文件
     */
    RCIMIWMessageTypeFile = 5,

    /*!
     小视频
     */
    RCIMIWMessageTypeSight = 6,
    
    /*!
     动图
     */
    RCIMIWMessageTypeGIF = 7,
    
    /*!
     撤回
     */
    RCIMIWMessageTypeRecall = 8,
    
    /*!
     引用消息
     */
    RCIMIWMessageTypeReference = 9,
    
    /*!
     命令消息
     */
    RCIMIWMessageTypeCommand = 10,
    
    /*!
     命令通知消息
     */
    RCIMIWMessageTypeCommandNotification = 11,
    
    /*!
     位置消息
     */
    RCIMIWMessageTypeLocation = 12,
    
    /*!
     用户自定义消息
     */
    RCIMIWMessageTypeUserCustom = 13,
    
    /*!
     原生自定义普通消息
     */
    RCIMIWMessageTypeNativeCustom = 14,
    
    /*!
     原生自定义媒体消息
     */
    RCIMIWMessageTypeNativeCustomMedia = 15,
    
    /*!
     群组通知消息
     */
    RCIMIWMessageTypeGroupNotification = 16,
};

#pragma mark 自定义消息的类别

typedef NS_ENUM(NSUInteger, RCIMIWCustomMessagePolicy) {
    RCIMIWCustomMessagePolicyCommand = 0,
    RCIMIWCustomMessagePolicyNormal,
    RCIMIWCustomMessagePolicyStatus,
    RCIMIWCustomMessagePolicyStorage,
};


typedef NS_ENUM(NSUInteger, RCIMIWNativeCustomMessagePersistentFlag) {
    RCIMIWNativeCustomMessagePersistentNone,
    /// 在本地只存储，但不计入未读数
    RCIMIWNativeCustomMessagePersistentPersisted,
    /// 在本地进行存储并计入未读数
    RCIMIWNativeCustomMessagePersistentCounted,
    /// 在本地不存储，不计入未读数，并且如果对方不在线，服务器会直接丢弃该消息，对方如果之后再上线也不会再收到此消息。
    /// 一般用于发送输入状态之类的消息。
    RCIMIWNativeCustomMessagePersistentStatus,
};

#pragma mark 消息的方向

typedef NS_ENUM(NSUInteger, RCIMIWMessageDirection) {
    /*!
     * 发送
     */
    RCIMIWMessageDirectionSend = 0,

    /*!
     * 接收
     */
    RCIMIWMessageDirectionReceive = 1,
};

/*!
 * 消息的发送状态
 */
typedef NS_ENUM(NSUInteger, RCIMIWSentStatus) {
    /*!
     * 发送中
     */
    RCIMIWSentStatusSending = 0,

    /*!
     * 发送失败
     */
    RCIMIWSentStatusFailed = 1,

    /*!
     *  \~chinese
     已发送成功
     */
    RCIMIWSentStatusSent = 2,

    /*!
     *  \~chinese
     对方已接收
     */
    RCIMIWSentStatusReceived = 3,

    /*!
     *  \~chinese
     对方已阅读
     */
    RCIMIWSentStatusRead = 4,

    /*!
     *  \~chinese
     对方已销毁
     */
    RCIMIWSentStatusDestroyed = 5,

    /*!
     *  \~chinese
     发送已取消
     */
    RCIMIWSentStatusCanceled = 6,
};

#pragma mark 消息的接收状态

typedef NS_ENUM(NSUInteger, RCIMIWReceivedStatus) {
    /*!
     *  \~chinese
     未读
     */
    RCIMIWReceivedStatusUnread = 0,

    /*!
     *  \~chinese
     已读
     */
    RCIMIWReceivedStatusRead = 1,

    /*!
     *  \~chinese
     已听

     @discussion 仅用于语音消息
     */
    RCIMIWReceivedStatusListened = 2,

    /*!
     *  \~chinese
     已下载
     */
    RCIMIWReceivedStatusDownloaded = 3,

    /*!
     *  \~chinese
     该消息已经被其他登录的多端收取过。（即该消息已经被其他端收取过后。当前端才登录，并重新拉取了这条消息。客户可以通过这个状态更新
     UI，比如不再提示）。
     */
    RCIMIWReceivedStatusRetrieved = 4,

    /*!
     *  该消息是被多端同时收取的。（即其他端正同时登录，一条消息被同时发往多端。客户可以通过这个状态值更新自己的某些 UI
     * 状态）。
     */
    RCIMIWReceivedStatusMultipleReceive = 5,

};

#pragma mark @消息的类型

typedef NS_ENUM(NSUInteger, RCIMIWMentionedType) {
    
    /*!
     @ 所有人
     */
    RCIMIWMentionedTypeAll = 0,
    
    /*!
     @ 部分人
     */
    RCIMIWMentionedTypePart = 1,
};

#pragma mark 时间顺序

typedef NS_ENUM(NSUInteger, RCIMIWTimeOrder) {
    /*！
     以前的时间
     */
    RCIMIWTimeOrderBefore = 0,

    /*！
     以后的时间
     */
    RCIMIWTimeOrderAfter = 1,
};

#pragma mark 加载消息策略

typedef NS_ENUM(NSUInteger, RCIMIWMessageOperationPolicy) {
    RCIMIWMessageOperationPolicyLocal = 0,
    RCIMIWMessageOperationPolicyRemote = 1,
    RCIMIWMessageOperationPolicyLocalRemote = 2,
};

#pragma mark 聊天室状态

typedef NS_ENUM(NSUInteger, RCIMIWChatRoomStatus) {
    RCIMIWChatRoomStatusReset = 0,
    RCIMIWChatRoomStatusDestroyManual = 1,
    RCIMIWChatRoomStatusDestroyAuto = 2,
};

#pragma mark 聊天室成员加入或者退出

typedef NS_ENUM(NSInteger, RCIMIWChatRoomMemberActionType) {

    RCIMIWChatRoomMemberActionTypeUnknown = 0,

    /*!
     聊天室成员加入
     */
    RCIMIWChatRoomMemberActionTypeJoin = 1,
    
    /*!
     聊天室成员退出
     */
    RCIMIWChatRoomMemberActionTypeLeave = 2,
};

typedef NS_ENUM(NSInteger, RCIMIWBlacklistStatus) {
    RCIMIWBlacklistStatusUnknown = 0,
    RCIMIWBlacklistStatusInBlacklist = 1,
    RCIMIWBlacklistStatusNotInBlacklist = 2,
};

#pragma mark 消息被拦截类型
 
typedef NS_ENUM(NSUInteger, RCIMIWMessageBlockType) {
    
    RCIMIWMessageBlockTypeUnknown = 0,
    
    /*!
     全局敏感词：命中了融云内置的全局敏感词
     */
    RCIMIWMessageBlockTypeGlobal,

    /*!
     自定义敏感词拦截：命中了客户在融云自定义的敏感词
     */
    RCIMIWMessageBlockTypeCustom,
    
    /*!
     第三方审核拦截：命中了第三方（数美）或模板路由决定不下发的状态
     */
    RCIMIWMessageBlockTypeThirdParty,
};


#pragma mark 通知状态
 
typedef NS_ENUM(NSInteger, RCIMIWNotificationStatus) {
    RCIMIWNotificationStatusUnknown = 0,
    RCIMIWNotificationStatusMute = 1,
    RCIMIWNotificationStatusUnmute = 2,
};

typedef NS_ENUM(NSUInteger, RCIMIWUltraGroupTypingStatus) {
    /*!
     正在输入文本
     */
    RCIMIWUltraGroupTypingStatusText = 0,
};

/**
 VIVO 推送通道类options.typeVivo型
 */
typedef NS_ENUM(NSUInteger, RCIMIWVIVOPushType) {
    /**
     运营消息
     */
    RCIMIWVIVOPushTypeOperate,
    
    /**
     系统消息
     */
    RCIMIWVIVOPushTypeSystem,
};

#pragma mark 日志级别
/*!
 日志级别
 */
typedef NS_ENUM(NSUInteger, RCIMIWLogLevel) {

    /*!
     *  不输出任何日志
     */
    RCIMIWLogLevelNone = 0,

    /*!
     *  只输出错误的日志
     */
    RCIMIWLogLevelError = 1,

    /*!
     *  输出错误和警告的日志
     */
    RCIMIWLogLevelWarn = 2,

    /*!
     *  输出错误、警告和一般的日志
     */
    RCIMIWLogLevelInfo = 3,

    /*!
     *  输出输出错误、警告和一般的日志以及 debug 日志
     */
    RCIMIWLogLevelDebug = 4,

    /*!
     *  输出所有日志
     */
    RCIMIWLogLevelVerbose = 5,
};

#pragma mark 消息免打扰级别
/*!
 消息免打扰级别
 */
typedef NS_ENUM(NSInteger, RCIMIWPushNotificationQuietHoursLevel) {
   
    /*!
     未设置（向上查询群或者APP级别设置）
     */
    RCIMIWPushNotificationQuietHoursLevelNone = 0,
    /*!
     群聊超级群仅@消息通知，单聊代表消息不通知
     */
    RCIMIWPushNotificationQuietHoursLevelMention = 1,
    /*!
     消息通知被屏蔽，即不接收消息通知
     */
    RCIMIWPushNotificationQuietHoursLevelBlocked = 5,
};

#pragma mark 消息通知级别
/*!
 消息通知级别
 */
typedef NS_ENUM(NSInteger, RCIMIWPushNotificationLevel) {
    /*!
     全部消息通知（接收全部消息通知 -- 显示指定关闭免打扰功能）
     */
    RCIMIWPushNotificationLevelAllMessage = -1,
    /*!
     未设置（向上查询群或者APP级别设置）,存量数据中0表示未设置
     */
    RCIMIWPushNotificationLevelNone = 0,
    /*!
     群聊，超级群 @所有人 或者 @成员列表有自己 时通知；单聊代表消息不通知
     */
    RCIMIWPushNotificationLevelMention = 1,
    /*!
     群聊，超级群 @成员列表有自己时通知，@所有人不通知；单聊代表消息不通知
     */
    RCIMIWPushNotificationLevelMentionUsers = 2,
    /*!
     群聊，超级群 @所有人通知，其他情况都不通知；单聊代表消息不通知
     */
    RCIMIWPushNotificationLevelMentionAll = 4,
    /*!
     消息通知被屏蔽，即不接收消息通知
     */
    RCIMIWPushNotificationLevelBlocked = 5,
};

typedef NS_ENUM(NSUInteger, RCIMIWChatRoomEntriesOperationType) {
    RCIMIWChatRoomEntriesOperationTypeUpdate = 0,
    RCIMIWChatRoomEntriesOperationTypeRemove = 1,
};

/**
 华为推送消息级别
 */
typedef NS_ENUM(NSUInteger, RCIMIWImportanceHW) {
    /*!
     华为推送消息级别 NORMAL，表示消息为服务与通讯类。消息提醒方式为锁屏+铃声+震动。
     */
    RCIMIWImportanceHWNormal = 0,
    
    /*!
     华为推送消息级别 LOW, 表示消息为资讯营销类。消息提醒方式为静默通知，仅在下拉通知栏展示。
     */
    RCIMIWImportanceHWLow = 1,
};

/**
 荣耀推送消息级别
 */
typedef NS_ENUM(NSUInteger, RCIMIWImportanceHonor) {
    /*!
     华为推送消息级别 NORMAL，表示消息为服务与通讯类。消息提醒方式为锁屏+铃声+震动。
     */
    RCIMIWImportanceHonorNormal = 0,
    
    /*!
     华为推送消息级别 LOW, 表示消息为资讯营销类。消息提醒方式为静默通知，仅在下拉通知栏展示。
     */
    RCIMIWImportanceHonorLow = 1,
};

typedef NS_ENUM(NSUInteger, RCIMIWAreaCode) {
    /// 默认值，北京数据中心
    RCIMIWAreaCodeBJ = 1,
    /// 新加坡数据中心
    RCIMIWAreaCodeSG = 2,
    /// 北美数据中心
    RCIMIWAreaCodeNA = 3,
    /// 新增的新加坡数据中心
    RCIMIWAreaCodeSGB = 4,
    /// 沙特数据中心
    RCIMIWAreaCodeSA = 5,
};

typedef NS_ENUM(NSUInteger, RCIMIWMessageAuditType) {
    /// 不需要审核
    RCIMIWMessageAuditTypeDisallow = 0,
    /// 需要审核
    RCIMIWMessageAuditTypeAllow = 1,
};

#pragma mark - 群信息托管

/// 加入群权限
typedef NS_ENUM(NSInteger, RCIMIWGroupJoinPermission) {
    /// 需要群主验证（默认）
    RCIMIWGroupJoinPermissionOwnerVerify = 0,
    /// 不用验证
    RCIMIWGroupJoinPermissionFree = 1,
    /// 群主或群管理员
    RCIMIWGroupJoinPermissionOwnerOrManagerVerify = 2,
    /// 不允许任何人加入
    RCIMIWGroupJoinPermissionNoOneAllowed = 3,
};

/// 群操作权限
typedef NS_ENUM(NSInteger, RCIMIWGroupOperationPermission) {
    /// 群主（默认）
    RCIMIWGroupOperationPermissionOwner = 0,
    /// 群主或群管理员
    RCIMIWGroupOperationPermissionOwnerOrManager = 1,
    /// 所有人
    RCIMIWGroupOperationPermissionEveryone = 2
};

/// 邀请加入群组处理权限
typedef NS_ENUM(NSInteger, RCIMIWGroupInviteHandlePermission) {
    /// 不需要被邀请人同意（默认）
    RCIMIWGroupInviteHandlePermissionFree = 0,
    /// 需要被邀请人同意
    RCIMIWGroupInviteHandlePermissionInviteeVerify = 1,
};

/// 群成员资料编辑权限
typedef NS_ENUM(NSInteger, RCIMIWGroupMemberInfoEditPermission) {
    /// 群主、群管理员和自己（默认）
    RCIMIWGroupMemberInfoEditPermissionOwnerOrManagerOrSelf = 0,
    /// 群主和自己
    RCIMIWGroupMemberInfoEditPermissionOwnerOrSelf = 1,
    /// 仅自己
    RCIMIWGroupMemberInfoEditPermissionSelf = 2,
};

/// 群成员身份
typedef NS_ENUM(NSInteger, RCIMIWGroupMemberRole) {
    /// 不区分角色（未加群时无角色）
    RCIMIWGroupMemberRoleUndef = 0,
    /// 普通群成员
    RCIMIWGroupMemberRoleNormal = 1,
    /// 管理员
    RCIMIWGroupMemberRoleManager = 2,
    /// 群主
    RCIMIWGroupMemberRoleOwner = 3,
};

/// 操作类型枚举
typedef NS_ENUM(NSInteger, RCIMIWGroupOperation) {
    /// 创建群
    RCIMIWGroupOperationCreate = 0,
    
    /// 加入
    RCIMIWGroupOperationJoin = 1,
    
    /// 踢出
    RCIMIWGroupOperationKick = 2,
    
    /// 退出
    RCIMIWGroupOperationQuit = 3,
    
    /// 解散
    RCIMIWGroupOperationDismiss = 4,
    
    /// 添加管理员
    RCIMIWGroupOperationAddManager = 5,
    
    /// 移除管理员
    RCIMIWGroupOperationRemoveManager = 6,
    
    /// 转让群主
    RCIMIWGroupOperationTransferGroupOwner = 7,
};

/// 群申请状态
typedef NS_ENUM (NSInteger, RCIMIWGroupApplicationStatus) {
    /// 管理员待处理
    RCIMIWGroupApplicationStatusManagerUnHandled = 0,
    /// 管理员已拒绝
    RCIMIWGroupApplicationStatusManagerRefused = 1,
    /// 被邀请人待处理
    RCIMIWGroupApplicationStatusInviteeUnHandled = 2,
    /// 被邀请人拒绝
    RCIMIWGroupApplicationStatusInviteeRefused = 3,
    /// 已加入
    RCIMIWGroupApplicationStatusJoined = 4,
    /// 已过期
    RCIMIWGroupApplicationStatusExpired = 5,
};

/// 操作类型
typedef NS_ENUM(NSInteger, RCIMIWGroupOperationType) {
    /// 添加
    RCIMIWGroupOperationTypeAdd = 1,
    /// 删除
    RCIMIWGroupOperationTypeRemove = 2
};

/// 群申请方向
typedef NS_ENUM(NSInteger, RCIMIWGroupApplicationDirection) {
    /// 发出的申请
    RCIMIWGroupApplicationDirectionApplicationSent = 0,
    /// 发出的邀请
    RCIMIWGroupApplicationDirectionInvitationSent = 1,
    /// 收到的邀请
    RCIMIWGroupApplicationDirectionInvitationReceived = 2,
    /// 收到的申请
    RCIMIWGroupApplicationDirectionApplicationReceived = 3
};

/// 群申请类型
typedef NS_ENUM (NSInteger, RCIMIWGroupApplicationType) {
    /// 主动加入群组
    RCIMIWGroupApplicationTypeApplication = 0,
    /// 被邀请加入群组
    RCIMIWGroupApplicationTypeInvitation = 1,
};

/// 群组状态
typedef NS_ENUM (NSInteger, RCIMIWGroupStatus) {
    /// 使用中（默认）
    RCIMIWGroupStatusUsing,
    /// 已解散
    RCIMIWGroupStatusDismissed,
    /// 已封禁
    RCIMIWGroupStatusBanned,
    /// 已禁言
    RCIMIWGroupStatusMuted,
};



/// 聊天室多端登录同步时，消息中的状态

typedef NS_ENUM(NSInteger, RCIMIWChatRoomSyncStatus) {
    /*!
     多端登录同步用户离开聊天室，
     1. 同一用户在一终端离开聊天室，通知另一终端
     2. 用户多端加入聊天室场景：用户在 Android 端加入聊天室，在 Web 端登录后又加入一个新的聊天室，自动将用户从上一个聊天室踢出
     被踢出聊天室中的所有成员，包括被踢出用户
     */
    RCIMIWChatRoomSyncStatusQuit = 0,
    
    /*!
     多端登录同步用户加入聊天室，
     同一用户在一终端加入聊天室，通知另一终端
     */
    RCIMIWChatRoomSyncStatusJoin = 1
};

typedef NS_ENUM(NSInteger, RCIMIWChatRoomSyncStatusReason) {
    /*!
     自己主动离开
     */
    RCIMIWChatRoomSyncStatusLeaveOnMyOwn = 1,
    
    /*!
     多端加入互踢导致离开
     */
    RCIMIWChatRoomSyncStatusOtherDeviceLogin = 2,
};

typedef NS_ENUM(NSInteger, RCIMIWChatRoomMemberOperateType) {
    /*!
     解封
     */
    RCIMIWChatRoomMemberOperateTypeDeblock = 0,
    
    /*!
     封禁
     */
    RCIMIWChatRoomMemberOperateTypeBlocked = 1
};

/*!
 聊天室禁言相关消息，操作类型枚举
 */
typedef NS_ENUM(NSInteger, RCIMIWChatRoomMemberBanType) {
    /*!
     解除指定聊天室中用户禁言
     */
    RCIMIWChatRoomMemberBanTypeUnmuteUsers = 0,
    
    /*!
     禁言指定聊天室中用户
     */
    RCIMIWChatRoomMemberBanTypeMuteUsers = 1,
    
    /*!
     解除聊天室全体禁言
     */
    RCIMIWChatRoomMemberBanTypeUnmuteAll = 2,
    
    /*!
     聊天室全体禁言
     */
    RCIMIWChatRoomMemberBanTypeMuteAll = 3,
    
    /*!
     移出禁言用户白名单
     */
    RCIMIWChatRoomMemberBanTypeRemoveWhitelist = 4,
    
    /*!
     添加禁言用户白名单
     */
    RCIMIWChatRoomMemberBanTypeAddWhitelist = 5,
    
    /*!
     解除用户聊天室全局禁言
     */
    RCIMIWChatRoomMemberBanTypeUnmuteGlobal = 6,
    
    /*!
     用户聊天室全局禁言
     */
    RCIMIWChatRoomMemberBanTypeMuteGlobal = 7
};


#endif /* RCIMIWDefines_h */
