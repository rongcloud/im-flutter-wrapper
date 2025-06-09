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

enum RCIMIWImportanceHW {
  /// 表示消息为服务与通讯类。消息提醒方式为锁屏+铃声+震动。
  normal,

  /// 表示消息为资讯营销类。消息提醒方式为静默通知，仅在下拉通知栏展示。
  low,
}

enum RCIMIWMessageOperationPolicy {
  /// 本地
  local,

  /// 远端
  remote,

  /// 本地和远端
  localRemote,
}

enum RCIMIWNativeCustomMessagePersistentFlag {
  /// 不存储，不计数
  none,

  /// 在本地只存储，但不计入未读数
  persisted,

  /// 在本地进行存储并计入未读数
  counted,

  /// 在本地不存储，不计入未读数，并且如果对方不在线，服务器会直接丢弃该消息，对方如果之后再上线也不会再收到此消息。一般用于发送输入状态之类的消息。
  status,
}

enum RCIMIWVIVOPushType {
  /// 运营消息
  operate,

  /// 系统消息
  system,
}

enum RCIMIWSentStatus {
  /// 发送中
  sending,

  /// 发送失败
  failed,

  /// 已发送
  sent,

  /// 对方已接收
  received,

  /// 对方已读
  read,

  /// 对方已销毁
  destroyed,

  /// 本地已取消
  canceled,
}

enum RCIMIWChatRoomSyncStatus { quit, join }

enum RCIMIWPushNotificationQuietHoursLevel {
  /// 未设置。如未设置，SDK会依次查询消息所属群的用户级别免打扰设置及其他非用户级别设置，再判断是否需要推送通知。
  none,

  /// 与融云服务端断开连接后，当前用户仅在指定时段内针对指定会话中提及（@）当前用户和全体群成员的消息接收通知。
  mentionMessage,

  /// 当前用户在指定时段内针对任何消息都不接收推送通知。
  blocked,
}

enum RCIMIWMessageDirection {
  /// 发送方
  send,

  /// 接收方
  receive,
}

enum RCIMIWReceivedStatus {
  /// 未读
  unread,

  /// 已读
  read,

  /// 已听
  listened,

  /// 已下载
  downloaded,

  /// 该消息已经被其他登录的多端收取过。（即该消息已经被其他端收取过后。当前端才登录，并重新拉取了这条消息。客户可以通过这个状态更新UI，比如不再提示）
  retrieved,

  /// 该消息是被多端同时收取的。（即其他端正同时登录，一条消息被同时发往多端。客户可以通过这个状态值更新自己的某些UI状态）。
  multipleReceive,
}

enum RCIMIWChatRoomMemberActionType {
  /// 未知
  unknown,

  /// 已加入
  join,

  /// 已离开
  leave,
}

enum RCIMIWPushNotificationLevel {
  /// 与融云服务端断开连接后，当前用户可针对指定类型会话中的所有消息接收通知。
  allMessage,

  /// 未设置。未设置时均为此初始状态。
  none,

  /// 与融云服务端断开连接后，当前用户仅针对指定类型的会话中提及（@）当前用户和全体群成员的消息接收通知。
  mention,

  /// 与融云服务端断开连接后，当前用户仅针对指定类型的会话中提及（@）当前用户的消息接收通知。例如：张三只会接收“@张三Hello”的消息的通知。
  mentionUsers,

  /// 与融云服务端断开连接后，当前用户仅针对指定类型的会话中提及（@）全部群成员的消息接收通知。
  mentionAll,

  /// 当前用户针对指定类型的会话中的任何消息都不接收推送通知。
  blocked,
}

enum RCIMIWMessageType {
  /// 无效类型
  unknown,

  /// 自定义
  custom,

  /// 文本
  text,

  /// 语音
  voice,

  /// 图片
  image,

  /// 文件
  file,

  /// 小视频
  sight,

  /// GIF图
  gif,

  /// 撤回
  recall,

  /// 引用
  reference,

  /// 命令
  command,

  /// 命令通知
  commandNotification,

  /// 位置消息
  location,

  /// 用户自定义消息
  userCustom,

  /// 原生自定义普通消息
  nativeCustom,

  /// 原生自定义媒体消息
  nativeCustomMedia,

  /// 群通知消息
  groupNotification,
}

enum RCIMIWMessageBlockType {
  /// 未知
  unknown,

  /// 全局敏感词：命中了融云内置的全局敏感词
  global,

  /// 自定义敏感词拦截：命中了客户在融云自定义的敏感词
  custom,

  /// 第三方审核拦截：命中了第三方（数美）或模板路由决定不下发的状态
  thirdParty,
}

enum RCIMIWMessageAuditType {
  /// 不需要送审，默认值
  disallow,

  /// 需要送审
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
  /// 时间递减
  before,

  /// 时间递增
  after,
}

enum RCIMIWCustomMessagePolicy {
  /// 客户端不存储，支持离线消息机制，不计入未读消息数
  command,

  /// 客户端存储，支持离线消息机制，且存入服务端历史消息，计入未读消息数
  normal,

  /// 客户端不存储，服务端不存储，不计入未读消息数
  status,

  /// 客户端存储，支持离线消息机制，且存入服务端历史消息，不计入未读消息数
  storage,
}

enum RCIMIWChatRoomStatus {
  /// 聊天室被重置
  reset,

  /// 用户调用IMServerAPI手动销毁聊天室
  destroyManual,

  /// IMServer自动销毁聊天室
  destroyAuto,
}

enum RCIMIWConversationType {
  /// 暂不支持，SDK保留类型，开发者不可使用
  invalid,

  /// 单聊会话
  private,

  /// 群聊会话
  group,

  /// 聊天室会话
  chatroom,

  /// 系统会话
  system,

  /// 超级群会话
  ultraGroup,
}

enum RCIMIWErrorCode { success, paramError, engineDestroyed, nativeOperationError, resultUnknown }

enum RCIMIWChatRoomSyncStatusReason {
  /// 自己主动离开
  leaveonmyown,

  /// 多端加入互踢导致离开
  otherdevicelogin,
}

enum RCIMIWUltraGroupTypingStatus {
  /// 正在输入文本
  text,
}

enum RCIMIWMentionedType {
  /// @所有人
  all,

  /// @指定的人
  part,
}

enum RCIMIWAreaCode {
  /// 北京数据中心，默认值
  bj,

  /// 新加坡数据中心
  sg,

  /// 北美数据中心
  na,

  /// 新加坡B企业合作数据中心
  sgB,

  /// 沙特数据中心
  sa,
}

enum RCIMIWChatRoomEntriesOperationType {
  /// 更新操作
  update,

  /// 删除操作
  remove,
}

enum RCIMIWLogLevel {
  /// 不输出任何日志
  none,

  /// 只输出错误的日志
  error,

  /// 输出错误和警告的日志
  warn,

  /// 输出错误、警告和一般的日志
  info,

  /// 输出输出错误、警告和一般的日志以及debug日志
  debug,

  /// 输出所有日志
  verbose,
}

enum RCIMIWBlacklistStatus {
  /// 未知
  unknown,

  /// 在黑名单中
  inBlacklist,

  /// 不在黑名单
  notInBlacklist,
}

enum RCIMIWImportanceHonor {
  /// 表示消息为服务与通讯类。消息提醒方式为锁屏+铃声+震动。
  normal,

  /// 表示消息为资讯营销类。消息提醒方式为静默通知，仅在下拉通知栏展示。
  low,
}

enum RCIMIWConnectionStatus {
  /// 网络不可用
  networkUnavailable,

  /// 连接成功
  connected,

  /// 连接中
  connecting,

  /// 未连接
  unconnected,

  /// 用户账户在其他设备登录，本机会被踢掉线
  kickedOfflineByOtherClient,

  /// Token不正确
  tokenIncorrect,

  /// 用户被开发者后台封禁
  connUserBlocked,

  /// 用户主动调用disconnect或logout接口断开连接
  signOut,

  /// 连接暂时挂起（多是由于网络问题导致），SDK会在合适时机进行自动重连
  suspend,

  /// 自动连接超时，SDK将不会继续连接，用户需要做超时处理，再自行调用connectWithToken接口进行连接
  timeout,

  /// 异常情况
  unknown,
}
