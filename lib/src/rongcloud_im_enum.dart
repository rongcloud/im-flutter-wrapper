enum RCIMIWGroupInviteHandlePermission {
  /// 不需要被邀请人同意（默认）。
  free,

  /// 需要被邀请人同意
  inviteeverify,
}

enum RCIMIWGroupApplicationStatus {
  /// 管理员待处理
  managerunhandled,

  /// 管理员拒绝。
  managerrefused,

  /// 被邀请人待处理
  inviteeunhandled,

  /// 被邀请人拒绝。
  inviteerefused,

  /// 已加入
  joined,

  /// 已过期
  expired,
}

enum RCIMIWGroupApplicationDirection {
  /// 发出申请。
  applicationsent,

  /// 发出的邀请。
  invitationsent,

  /// 收到的邀请。
  invitationreceived,

  /// 收到的申请。
  applicationreceived,
}

enum RCIMIWGroupOperation {
  /// 创建。
  create,

  /// 加入
  join,

  /// 踢出
  kick,

  /// 退出。
  quit,

  /// 解散
  dismiss,

  /// 添加管理员
  addmanager,

  /// 移除管理员。
  removemanager,

  /// 转移群主
  transfergroupowner,
}

enum RCIMIWGroupJoinPermission {
  /// 需要群主验证（默认）
  ownerverify,

  /// 不用验证
  free,

  /// 群管理员或者群主验证
  ownerormanagerverify,

  /// 不允许任何人加入
  nooneallowed,
}

enum RCIMIWGroupStatus {
  /// 使用中（默认状态）
  using,

  /// 已解散
  dismissed,

  /// 已封禁
  banned,

  /// 已禁言
  muted,
}

enum RCIMIWGroupOperationPermission {
  /// 群主（默认）。
  owner,

  /// 群主+群管理员。
  ownerormanager,

  /// 所有人
  everyone,
}

enum RCIMIWGroupOperationType {
  /// 加入。
  add,

  /// 移除
  remove,
}

enum RCIMIWGroupMemberInfoEditPermission {
  /// 群主+群管理员+自已(默认)。
  ownerormanagerorself,

  /// 群主+自已。
  ownerorself,

  /// 仅自已
  self,
}

enum RCIMIWGroupMemberRole {
  /// 未定义角色（使用此枚举代表查询全部类型群成员）
  undef,

  /// 普通群成员
  normal,

  /// 管理员。
  manager,

  /// 群主。
  owner,
}

enum RCIMIWGroupApplicationType {
  /// 主动加入群组
  application,

  /// 被邀请加入群组。
  invitation,
}

enum RCIMIWTranslateStrategy {
  /// [ZH]
  /// ---
  /// 跟随用户级配置
  /// ---
  /// [EN]
  /// ---
  /// Follow user-level settings
  /// ---
  defaultFollowUser,

  /// [ZH]
  /// ---
  /// 开启自动翻译
  /// ---
  /// [EN]
  /// ---
  /// Enable auto-translation
  /// ---
  autoOn,

  /// [ZH]
  /// ---
  /// 关闭自动翻译
  /// ---
  /// [EN]
  /// ---
  /// Turn off auto-translation
  /// ---
  autoOff,
}

enum RCIMIWImportanceHW {
  /// [ZH]
  /// ---
  /// 表示消息为服务与通讯类��消息提醒方式为锁屏+铃声+震动。
  /// ---
  /// [EN]
  /// ---
  /// Indicates that the message is a service and communication reminder, with the notification method set to lock screen + ringtone + vibration.
  /// ---
  normal,

  /// [ZH]
  /// ---
  /// 表示消息为资讯营销类。消息提醒方式为静默通知，仅在下拉通知栏展示。
  /// ---
  /// [EN]
  /// ---
  /// Indicates that the message is of the marketing type. The notification method is silent, and it is only displayed in the notification drop-down bar.
  /// ---
  low,
}

enum RCIMIWMessageOperationPolicy {
  /// [ZH]
  /// ---
  /// 本地
  /// ---
  /// [EN]
  /// ---
  /// Local
  /// ---
  local,

  /// [ZH]
  /// ---
  /// 远端
  /// ---
  /// [EN]
  /// ---
  /// Remote
  /// ---
  remote,

  /// [ZH]
  /// ---
  /// 本地和远端
  /// ---
  /// [EN]
  /// ---
  /// Local and Remote
  /// ---
  localRemote,
}

enum RCIMIWNativeCustomMessagePersistentFlag {
  /// [ZH]
  /// ---
  /// 不存储，不计数
  /// ---
  /// [EN]
  /// ---
  /// Non-storage, non-counting
  /// ---
  none,

  /// [ZH]
  /// ---
  /// 在本地只存储，但不计入未读数
  /// ---
  /// [EN]
  /// ---
  /// Store locally but do not count as unread.
  /// ---
  persisted,

  /// [ZH]
  /// ---
  /// 在本地进行存储并计入未读数
  /// ---
  /// [EN]
  /// ---
  /// Store locally and count as unread.
  /// ---
  counted,

  /// [ZH]
  /// ---
  /// 在本地不存储，不计入未读数，并且如果对方不在线，服务器会直接丢弃该消息，对方如果之后再上线也不会再收到此消息。
  /// 一般用于发送输入状态之类的消息。
  /// ---
  /// [EN]
  /// ---
  /// The message is not stored locally, does not count towards the unread message count, and if the recipient is offline, the server will directly discard the message. The recipient will not receive this message even if they come online later.
  /// This is typically used for sending messages such as typing status indicators.
  /// ---
  status,
}

enum RCIMIWVIVOPushType {
  /// [ZH]
  /// ---
  /// 运营消息
  /// ---
  /// [EN]
  /// ---
  /// Operation Message
  /// ---
  operate,

  /// [ZH]
  /// ---
  /// 系统消息
  /// ---
  /// [EN]
  /// ---
  /// System Message
  /// ---
  system,
}

enum RCIMIWSpeechToTextStatus { notConverted, converting, success, failed }

enum RCIMIWSentStatus {
  /// [ZH]
  /// ---
  /// 发送中
  /// ---
  /// [EN]
  /// ---
  /// Sending
  /// ---
  sending,

  /// [ZH]
  /// ---
  /// 发送失败
  /// ---
  /// [EN]
  /// ---
  /// Send failed
  /// ---
  failed,

  /// [ZH]
  /// ---
  /// 已发送
  /// ---
  /// [EN]
  /// ---
  /// Sent
  /// ---
  sent,

  /// [ZH]
  /// ---
  /// 对方已接收
  /// ---
  /// [EN]
  /// ---
  /// The message has been received by the recipient.
  /// ---
  received,

  /// [ZH]
  /// ---
  /// 对方已读
  /// ---
  /// [EN]
  /// ---
  /// The message has been read by the recipient.
  /// ---
  read,

  /// [ZH]
  /// ---
  /// 对方已销毁
  /// ---
  /// [EN]
  /// ---
  /// The other party has been deactivated.
  /// ---
  destroyed,

  /// [ZH]
  /// ---
  /// 对方已取消
  /// ---
  /// [EN]
  /// ---
  /// The other party has canceled.
  /// ---
  canceled,
}

enum RCIMIWChatRoomSyncStatus { quit, join }

enum RCIMIWPushNotificationQuietHoursLevel {
  /// [ZH]
  /// ---
  /// 未设置。如未设置，SDK 会依次查询消息所属群的用户级别免打扰设置及其他非用户级别设置，再判断是否需要推送通知。
  /// ---
  /// [EN]
  /// ---
  /// Not set. If not set, the SDK will sequentially check the user-level Do Not Disturb settings of the group to which the message belongs, as well as other non-user-level settings, to determine whether a push notification is required.
  /// ---
  none,

  /// [ZH]
  /// ---
  /// 与融云服务端断开连接后，当前用户仅在指定时段内针对指定会话中提及（@）当前用户和全体群成员的消息接收通知。
  /// ---
  /// [EN]
  /// ---
  /// After disconnecting from the RongCloud server, the current user will only receive notifications for messages that mention (@) the current user and all group members in specified conversations within a designated time period.
  /// ---
  mentionMessage,

  /// [ZH]
  /// ---
  /// 当前用户在指定时段内针对任何消息都不接收推送通知。
  /// ---
  /// [EN]
  /// ---
  /// The current user will not receive push notifications for any messages during the specified time period.
  /// ---
  blocked,
}

enum RCIMIWMessageDirection {
  /// [ZH]
  /// ---
  /// 发送方
  /// ---
  /// [EN]
  /// ---
  /// Sender
  /// ---
  send,

  /// [ZH]
  /// ---
  /// 接收方
  /// ---
  /// [EN]
  /// ---
  /// Recipient
  /// ---
  receive,
}

enum RCIMIWTranslateStatus { none, translating, success, failed }

enum RCIMIWReceivedStatus {
  /// [ZH]
  /// ---
  /// 未读
  /// ---
  /// [EN]
  /// ---
  /// Unread
  /// ---
  unread,

  /// [ZH]
  /// ---
  /// 已读
  /// ---
  /// [EN]
  /// ---
  /// Read
  /// ---
  read,

  /// [ZH]
  /// ---
  /// 已听
  /// ---
  /// [EN]
  /// ---
  /// Listened
  /// ---
  listened,

  /// [ZH]
  /// ---
  /// 已下载
  /// ---
  /// [EN]
  /// ---
  /// Downloaded.
  /// ---
  downloaded,

  /// [ZH]
  /// ---
  /// 该消息已经被其他登录的多端收取过。（即该消息已经被其他端收取过后。当前端才登录，并重新拉取了这条消息。客户可以通过这个状态更新 UI，比如不再提示）
  /// ---
  /// [EN]
  /// ---
  /// The message has already been received by other devices logged in with the same account. (This means the message was received by other devices before the current device logged in and re-fetched the message. Clients can use this status to update the UI, e.g., stop displaying notifications.)
  /// ---
  retrieved,

  /// [ZH]
  /// ---
  /// 该消息是被多端同时收取的。（即其他端正同时登录，一条消息被同时发往多端。客户可以通过这个状态值更新自己的某些 UI 状态）。
  /// ---
  /// [EN]
  /// ---
  /// The message is simultaneously received by multiple endpoints (i.e., other endpoints are logged in at the same time, and a single message is sent to multiple endpoints simultaneously). Clients can use this status value to update certain UI states.
  /// ---
  multipleReceive,
}

enum RCIMIWChatRoomMemberActionType {
  /// [ZH]
  /// ---
  /// 未知
  /// ---
  /// [EN]
  /// ---
  /// Unknown
  /// ---
  unknown,

  /// [ZH]
  /// ---
  /// 已加入
  /// ---
  /// [EN]
  /// ---
  /// Joined
  /// ---
  join,

  /// [ZH]
  /// ---
  /// 已离开
  /// ---
  /// [EN]
  /// ---
  /// Left
  /// ---
  leave,
}

enum RCIMIWPushNotificationLevel {
  /// [ZH]
  /// ---
  /// 与融云服务端断开连接后，当前用户可针对指定类型会话中的所有消息接收通知。
  /// ---
  /// [EN]
  /// ---
  /// After disconnecting from the RongCloud server, the current user can receive notifications for all messages in specified conversation types.
  /// ---
  allMessage,

  /// [ZH]
  /// ---
  /// 未设置。未设置时均为此初始状态。
  /// ---
  /// [EN]
  /// ---
  /// Not set. This is the initial state when no value is set.
  /// ---
  none,

  /// [ZH]
  /// ---
  /// 与融云服务端断开连接后，当前用户仅针对指定类型的会话中提及（@）当前用户和全体群成员的消息接收通知。
  /// ---
  /// [EN]
  /// ---
  /// After disconnecting from the RongCloud server, the current user will only receive notifications for messages that mention (@) the current user or all group members in specified types of conversations.
  /// ---
  mention,

  /// [ZH]
  /// ---
  /// 与融云服务端断开连接后，当前用户仅针对指定类型的会话中提及（@）当前用户的消息接收通知。例如：张三只会接收 “@张三 Hello” 的消息的通知。
  /// ---
  /// [EN]
  /// ---
  /// After disconnecting from the RongCloud server, the current user will only receive notifications for messages that mention (@) them in specified conversation types. For example, Zhang San will only receive notifications for messages like @Zhang San Hello.
  /// ---
  mentionUsers,

  /// [ZH]
  /// ---
  /// 与融云服务端断开连接后，当前用户仅针对指定类型的会话中提及（@）全部群成员的消息接收通知。
  /// ---
  /// [EN]
  /// ---
  /// After disconnecting from the RongCloud server, the current user will only receive notifications for messages that mention (@) all group members in specified types of conversations.
  /// ---
  mentionAll,

  /// [ZH]
  /// ---
  /// 当前用户针对指定类型的会话中的任何消息都不接收推送通知。
  /// ---
  /// [EN]
  /// ---
  /// The current user does not receive push notifications for any messages in the specified type of conversation.
  /// ---
  blocked,
}

enum RCIMIWTranslateMode {
  /// [ZH]
  /// ---
  /// 机械翻译
  /// ---
  /// [EN]
  /// ---
  /// Machine translation
  /// ---
  mechanical,

  /// [ZH]
  /// ---
  /// 智能翻译
  /// ---
  /// [EN]
  /// ---
  /// Smart translation
  /// ---
  intelligent,
}

enum RCIMIWTranslateResultType { message, customText }

enum RCIMIWMessageType {
  /// [ZH]
  /// ---
  /// 无效类型
  /// ---
  /// [EN]
  /// ---
  /// Invalid Type
  /// ---
  unknown,

  /// [ZH]
  /// ---
  /// 自定义
  /// ---
  /// [EN]
  /// ---
  /// Custom
  /// ---
  custom,

  /// [ZH]
  /// ---
  /// 文本
  /// ---
  /// [EN]
  /// ---
  /// Text
  /// ---
  text,

  /// [ZH]
  /// ---
  /// 语音
  /// ---
  /// [EN]
  /// ---
  /// Voice
  /// ---
  voice,

  /// [ZH]
  /// ---
  /// 图片
  /// ---
  /// [EN]
  /// ---
  /// Image
  /// ---
  image,

  /// [ZH]
  /// ---
  /// 文件
  /// ---
  /// [EN]
  /// ---
  /// File
  /// ---
  file,

  /// [ZH]
  /// ---
  /// 小视频
  /// ---
  /// [EN]
  /// ---
  /// Short video
  /// ---
  sight,

  /// [ZH]
  /// ---
  /// GIF 图
  /// ---
  /// [EN]
  /// ---
  /// GIF Image
  /// ---
  gif,

  /// [ZH]
  /// ---
  /// 撤回
  /// ---
  /// [EN]
  /// ---
  /// Recall
  /// ---
  recall,

  /// [ZH]
  /// ---
  /// 引用
  /// ---
  /// [EN]
  /// ---
  /// Reference
  /// ---
  reference,

  /// [ZH]
  /// ---
  /// 命令
  /// ---
  /// [EN]
  /// ---
  /// Command
  /// ---
  command,

  /// [ZH]
  /// ---
  /// 命令通知
  /// ---
  /// [EN]
  /// ---
  /// Command Notification
  /// ---
  commandNotification,

  /// [ZH]
  /// ---
  /// 位置消息
  /// ---
  /// [EN]
  /// ---
  /// Location Message
  /// ---
  location,

  /// [ZH]
  /// ---
  /// 用户自定义消息
  /// ---
  /// [EN]
  /// ---
  /// User Custom Message
  /// ---
  userCustom,

  /// [ZH]
  /// ---
  /// 原生自定义普通消息
  /// ---
  /// [EN]
  /// ---
  /// Native Custom Message
  /// ---
  nativeCustom,

  /// [ZH]
  /// ---
  /// 原生自定义媒体消息
  /// ---
  /// [EN]
  /// ---
  /// Native Custom Media Message
  /// ---
  nativeCustomMedia,

  /// 群通知消息
  groupNotification,
}

enum RCIMIWMessageBlockType {
  /// [ZH]
  /// ---
  /// 未知
  /// ---
  /// [EN]
  /// ---
  /// Unknown
  /// ---
  unknown,

  /// [ZH]
  /// ---
  /// 全局敏感词：命中了融云内置的全局敏感词
  /// ---
  /// [EN]
  /// ---
  /// Global Sensitive Words: Matches RongCloud's built-in global sensitive words.
  /// ---
  global,

  /// [ZH]
  /// ---
  /// 自定义敏感词拦截：命中了客户在融云自定义的敏感词
  /// ---
  /// [EN]
  /// ---
  /// Custom Sensitive Word Blocking: Triggered by sensitive words customized by the customer in RongCloud.
  /// ---
  custom,

  /// [ZH]
  /// ---
  /// 第三方审核拦截：命中了第三方（数美）或模板路由决定不下发的状态
  /// ---
  /// [EN]
  /// ---
  /// Third-party moderation interception: Triggered when the message is blocked by a third-party (e.g., ShuMei) or the template routing decides not to deliver it.
  /// ---
  thirdParty,
}

enum RCIMIWMessageAuditType {
  /// [ZH]
  /// ---
  /// 不需要送审，默认值
  /// ---
  /// [EN]
  /// ---
  /// No review required, default value
  /// ---
  disallow,

  /// [ZH]
  /// ---
  /// 需要送审
  /// ---
  /// [EN]
  /// ---
  /// Requires review
  /// ---
  allow,
}

enum RCIMIWChatRoomMemberBanType {
  /// 解除指定聊天室中用户禁言
  unmuteusers,

  /// 禁言指定聊天室中用户
  muteusers,

  /// 解除聊天室全体禁言
  unmuteall,

  /// 聊天室全体禁言
  muteall,

  /// 移出禁言用户白名单
  removewhitelist,

  /// 添加禁言用户白名单
  addwhitelist,

  /// 解除用户聊天室全局禁言
  unmuteglobal,

  /// 用户聊天室全局禁言
  muteglobal,
}

enum RCIMIWChatRoomMemberOperateType {
  /// 0是解封
  deblock,

  /// 1是封禁
  blocked,
}

enum RCIMIWTimeOrder {
  /// [ZH]
  /// ---
  /// 时间递减
  /// ---
  /// [EN]
  /// ---
  /// Time descending
  /// ---
  before,

  /// [ZH]
  /// ---
  /// 时间递增
  /// ---
  /// [EN]
  /// ---
  /// Timestamp Increment
  /// ---
  after,
}

enum RCIMIWCustomMessagePolicy {
  /// [ZH]
  /// ---
  /// 客户端不存储，支持离线消息机制，不计入未读消息数
  /// ---
  /// [EN]
  /// ---
  /// The client does not store messages locally and supports an offline message mechanism, which does not count towards unread message totals.
  /// ---
  command,

  /// [ZH]
  /// ---
  /// 客户端存储，支持离线消息机制，且存入服务端历史消息，计入未读消息数
  /// ---
  /// [EN]
  /// ---
  /// Client-side storage supports the offline message mechanism, stores messages in server history, and counts towards unread message totals.
  /// ---
  normal,

  /// [ZH]
  /// ---
  /// 客户端不存储，服务端不存储，不计入未读消息数
  /// ---
  /// [EN]
  /// ---
  /// The client does not store it, the server does not store it, and it is not counted in the unread message count.
  /// ---
  status,

  /// [ZH]
  /// ---
  /// 客户端存储，支持离线消息机制，且存入服务端历史消息，不计入未读消息数
  /// ---
  /// [EN]
  /// ---
  /// Client-side storage supports the offline message mechanism, and messages stored in the server's history are not counted as unread messages.
  /// ---
  storage,
}

enum RCIMIWChatRoomStatus {
  /// [ZH]
  /// ---
  /// 聊天室被重置
  /// ---
  /// [EN]
  /// ---
  /// Chatroom has been reset
  /// ---
  reset,

  /// [ZH]
  /// ---
  /// 用户调用IM Server API 手动销毁聊天室
  /// ---
  /// [EN]
  /// ---
  /// The user invokes the IM Server API to manually destroy a chatroom.
  /// ---
  destroyManual,

  /// [ZH]
  /// ---
  /// IM Server 自动销毁聊天室
  /// ---
  /// [EN]
  /// ---
  /// IM Server automatically destroys chatrooms.
  /// ---
  destroyAuto,
}

enum RCIMIWConversationType {
  /// [ZH]
  /// ---
  /// 暂不支持，SDK 保留类型，开发者不可使用
  /// ---
  /// [EN]
  /// ---
  /// Not supported. Reserved type for SDK, not available for developers.
  /// ---
  invalid,

  /// [ZH]
  /// ---
  /// 单聊会话
  /// ---
  /// [EN]
  /// ---
  /// One-to-One Chat Conversation
  /// ---
  private,

  /// [ZH]
  /// ---
  /// 群聊会话
  /// ---
  /// [EN]
  /// ---
  /// Group Chat Conversation
  /// ---
  group,

  /// [ZH]
  /// ---
  /// 聊天室会话
  /// ---
  /// [EN]
  /// ---
  /// Chatroom Conversation
  /// ---
  chatroom,

  /// [ZH]
  /// ---
  /// 系统会话
  /// ---
  /// [EN]
  /// ---
  /// System Conversation
  /// ---
  system,

  /// [ZH]
  /// ---
  /// 超级群会话
  /// ---
  /// [EN]
  /// ---
  /// Ultra Group Conversation
  /// ---
  ultraGroup,
}

enum RCIMIWErrorCode {
  /// [ZH]
  /// ---
  /// 成功
  /// ---
  /// [EN]
  /// ---
  /// Success
  /// ---
  success,

  /// [ZH]
  /// ---
  /// 参数错误
  /// ---
  /// [EN]
  /// ---
  /// Parameter Error
  /// ---
  paramError,

  /// [ZH]
  /// ---
  /// 引擎已销毁
  /// ---
  /// [EN]
  /// ---
  /// Engine has been destroyed
  /// ---
  engineDestroyed,

  /// [ZH]
  /// ---
  /// 原生层操作错误
  /// ---
  /// [EN]
  /// ---
  /// Native Layer Operation Error
  /// ---
  nativeOperationError,
  resultUnknown,
}

enum RCIMIWChatRoomSyncStatusReason {
  /// 自己主动离开
  leaveonmyown,

  /// 多端加入互踢导致离开
  otherdevicelogin,
}

enum RCIMIWUltraGroupTypingStatus {
  /// [ZH]
  /// ---
  /// 正在输入文本
  /// ---
  /// [EN]
  /// ---
  /// Typing in progress
  /// ---
  text,
}

enum RCIMIWMentionedType {
  /// [ZH]
  /// ---
  /// @ 所有人
  /// ---
  /// [EN]
  /// ---
  /// @everyone
  /// ---
  all,

  /// [ZH]
  /// ---
  /// @ 指定的人
  /// ---
  /// [EN]
  /// ---
  /// @ Mentioned User
  /// ---
  part,
}

enum RCIMIWAreaCode {
  /// [ZH]
  /// ---
  /// 北京数据中心，默认值
  /// ---
  /// [EN]
  /// ---
  /// Beijing Data Center, default value
  /// ---
  bj,

  /// [ZH]
  /// ---
  /// 新加坡数据中心
  /// [EN]
  /// ---
  /// Singapore Data Center
  /// ---
  sg,

  /// [ZH]
  /// ---
  /// 北美数据中心
  /// [EN]
  /// ---
  /// North America Data Center
  /// ---
  na,

  /// [ZH]
  /// ---
  /// 新加坡 B 企业合作数据中心
  /// ---
  /// [EN]
  /// ---
  /// Singapore B Enterprise Collaboration Data Center
  /// ---
  sgB,

  /// [ZH]
  /// ---
  /// 沙特数据中心
  /// ---
  /// [EN]
  /// ---
  /// China (Beijing) Data Center
  /// ---
  sa,
}

enum RCIMIWChatRoomEntriesOperationType {
  /// [ZH]
  /// ---
  /// 更新操作
  /// ---
  /// [EN]
  /// ---
  /// Update Operation
  /// ---
  update,

  /// [ZH]
  /// ---
  /// 删除操作
  /// ---
  /// [EN]
  /// ---
  /// Delete Operation
  /// ---
  remove,
}

enum RCIMIWLogLevel {
  /// [ZH]
  /// ---
  /// 不输出任何日志
  /// ---
  /// [EN]
  /// ---
  /// Do not output any logs.
  /// ---
  none,

  /// [ZH]
  /// ---
  /// 只输出错误的日志
  /// ---
  /// [EN]
  /// ---
  /// Only output error logs.
  /// ---
  error,

  /// [ZH]
  /// ---
  /// 输出错误和警告的日志
  /// ---
  /// [EN]
  /// ---
  /// Logs output errors and warnings.
  /// ---
  warn,

  /// [ZH]
  /// ---
  /// 输出错误、警告和一般的日志
  /// ---
  /// [EN]
  /// ---
  /// Output errors, warnings, and general logs.
  /// ---
  info,

  /// [ZH]
  /// ---
  /// 输出错误、警告和一般的日志以及 debug 日志
  /// ---
  /// [EN]
  /// ---
  /// Output errors, warnings, general logs, and debug logs.
  /// ---
  debug,

  /// [ZH]
  /// ---
  /// 输出所有日志
  /// ---
  /// [EN]
  /// ---
  /// Output All Logs
  /// ---
  verbose,
}

enum RCIMIWBlacklistStatus {
  /// [ZH]
  /// ---
  /// 未知
  /// ---
  /// [EN]
  /// ---
  /// Unknown
  /// ---
  unknown,

  /// [ZH]
  /// ---
  /// 在黑名单中
  /// ---
  /// [EN]
  /// ---
  /// In the blocklist
  /// ---
  inBlacklist,

  /// [ZH]
  /// ---
  /// 不在黑名单
  /// ---
  /// [EN]
  /// ---
  /// Not in the blocklist
  /// ---
  notInBlacklist,
}

enum RCIMIWImportanceHonor {
  /// [ZH]
  /// ---
  /// 表示消息为服务与通讯类。消息提醒方式为锁屏+铃声+震动。
  /// ---
  /// [EN]
  /// ---
  /// Indicates that the message is related to service and communication. The notification method includes lock screen, ringtone, and vibration.
  /// ---
  normal,

  /// [ZH]
  /// ---
  /// 表示消息为资讯营销类。消息提醒方式为静默通知，仅在下拉通知栏展示。
  /// ---
  /// [EN]
  /// ---
  /// Indicates that the message is of marketing or informational type. The notification method is silent, and it is only displayed in the notification dropdown bar.
  /// ---
  low,
}

enum RCIMIWConnectionStatus {
  /// [ZH]
  /// ---
  /// 网络不可用
  /// ---
  /// [EN]
  /// ---
  /// Network unavailable
  /// ---
  networkUnavailable,

  /// [ZH]
  /// ---
  /// 连接成功
  /// ---
  /// [EN]
  /// ---
  /// Connection established
  /// ---
  connected,

  /// [ZH]
  /// ---
  /// 连接中
  /// ---
  /// [EN]
  /// ---
  /// Connecting
  /// ---
  connecting,

  /// [ZH]
  /// ---
  /// 未连接
  /// ---
  /// [EN]
  /// ---
  /// Not connected
  /// ---
  unconnected,

  /// [ZH]
  /// ---
  /// 用户账户在其他设备登录，本机会被踢掉线
  /// ---
  /// [EN]
  /// ---
  /// The current device will be kicked offline if the user account logs in from another device.
  /// ---
  kickedOfflineByOtherClient,

  /// [ZH]
  /// ---
  /// Token 不正确
  /// ---
  /// [EN]
  /// ---
  /// Token is invalid.
  /// ---
  tokenIncorrect,

  /// [ZH]
  /// ---
  /// 用户被开发者后台封禁
  /// ---
  /// [EN]
  /// ---
  /// The user has been banned by the developer backend.
  /// ---
  connUserBlocked,

  /// [ZH]
  /// ---
  /// 用户主动调用 disconnect 或 logout 接口断开连接
  /// ---
  /// [EN]
  /// ---
  /// The user actively calls the `disconnect` or `logout` interface to terminate the connection.
  /// ---
  signOut,

  /// [ZH]
  /// ---
  /// 连接暂时挂起（多是由于网络问题导致），SDK 会在合适时机进行自动重连
  /// ---
  /// [EN]
  /// ---
  /// The connection is temporarily suspended (usually due to network issues). The SDK will automatically reconnect at an appropriate time.
  /// ---
  suspend,

  /// [ZH]
  /// ---
  /// 自动连接超时，SDK 将不会继续连接，用户需要做超时处理，再自行调用 connectWithToken 接口进行连接
  /// ---
  /// [EN]
  /// ---
  /// Automatic connection timeout: The SDK will not continue to connect. The user needs to handle the timeout and manually call the `connectWithToken` interface to reconnect.
  /// ---
  timeout,

  /// [ZH]
  /// ---
  /// 异常情况
  /// ---
  /// [EN]
  /// ---
  /// Exception Handling
  /// ---
  unknown,
}

enum RCIMIWPlatform {
  /// [ZH]
  /// ---
  /// 其它平台
  /// ---
  /// [EN]
  /// ---
  /// Other platforms
  /// ---
  other,

  /// [ZH]
  /// ---
  /// iOS
  /// ---
  /// [EN]
  /// ---
  /// iOS
  /// ---
  ios,

  /// [ZH]
  /// ---
  /// Android
  /// ---
  /// [EN]
  /// ---
  /// Android
  /// ---
  android,

  /// [ZH]
  /// ---
  /// Web
  /// ---
  /// [EN]
  /// ---
  /// Web
  /// ---
  web,

  /// [ZH]
  /// ---
  /// PC
  /// ---
  /// [EN]
  /// ---
  /// PC
  /// ---
  pc,

  /// [ZH]
  /// ---
  /// 小程序
  /// ---
  /// [EN]
  /// ---
  /// Mini Program
  /// ---
  miniweb,

  /// [ZH]
  /// ---
  /// 鸿蒙
  /// ---
  /// [EN]
  /// ---
  /// HarmonyOS
  /// ---
  harmonyos,
}

enum RCIMIWSubscribeOperationType {
  /// [ZH]
  /// ---
  /// 订阅
  /// ---
  /// [EN]
  /// ---
  /// Subscribe
  /// ---
  subscribe,

  /// [ZH]
  /// ---
  /// 取消订阅
  /// ---
  /// [EN]
  /// ---
  /// Unsubscribe
  /// ---
  unsubscribe,
}

enum RCIMIWSubscribeType {
  /// [ZH]
  /// ---
  /// 无效类型
  /// ---
  /// [EN]
  /// ---
  /// Invalid type
  /// ---
  invalid,

  /// [ZH]
  /// ---
  /// 在线状态
  /// ---
  /// [EN]
  /// ---
  /// Online status
  /// ---
  onlineStatus,

  /// [ZH]
  /// ---
  /// 用户信息
  /// ---
  /// [EN]
  /// ---
  /// User profile
  /// ---
  userProfile,

  /// [ZH]
  /// ---
  /// 好友在线状态
  /// ---
  /// [EN]
  /// ---
  /// Friend's online status
  /// ---
  friendOnlineStatus,

  /// [ZH]
  /// ---
  /// 好友用户信息
  /// ---
  /// [EN]
  /// ---
  /// Friend profile
  /// ---
  friendUserProfile,
}

enum RCIMIWUserProfileVisibility {
  /// [ZH]
  /// ---
  /// 未设置
  /// ---
  /// [EN]
  /// ---
  /// Not set
  /// ---
  notSet,

  /// [ZH]
  /// ---
  /// 不可见
  /// ---
  /// [EN]
  /// ---
  /// Invisible
  /// ---
  invisible,

  /// [ZH]
  /// ---
  /// 所有人可见
  /// ---
  /// [EN]
  /// ---
  /// Visible to all
  /// ---
  everyone,

  /// [ZH]
  /// ---
  /// 仅好友可见
  /// ---
  /// [EN]
  /// ---
  /// Friends only
  /// ---
  friendVisible,
}

enum RCIMIWUserGender {
  /// [ZH]
  /// ---
  /// 未知
  /// ---
  /// [EN]
  /// ---
  /// Unknown
  /// ---
  unknown,

  /// [ZH]
  /// ---
  /// 男
  /// ---
  /// [EN]
  /// ---
  /// Male
  /// ---
  male,

  /// [ZH]
  /// ---
  /// 女
  /// ---
  /// [EN]
  /// ---
  /// Female
  /// ---
  female,
}
