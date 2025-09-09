# 5.24.5
* 更新了 Android IMLib SDK 依赖为 5.24.4。

# 5.24.4
* 更新了英文注释

# 5.24.3
* 更新了 Android IMLib SDK 依赖为 5.24.3。
* 更新了 iOS IMLib SDK 依赖为 5.24.2。
* 增加了用户信息托管功能。
* 增加了个人状态订阅功能。

# 5.24.1
* 更新了 Android IMLib SDK 依赖为 5.24.1。
* 更新了 iOS IMLib SDK 依赖为 5.24.1。

# 5.24.0
* 更新了 Android IMLib SDK 依赖为 5.24.0。
* 更新了 iOS IMLib SDK 依赖为 5.24.0。
* 增加了消息翻译功能。

# 5.20.1
* 更新了 Android IMLib SDK 依赖为 5.20.1。
* 更新了 iOS IMLib SDK 依赖为 5.20.1。
* 修复 5.18.0 版本媒体消息回调中，发送状态不对的问题，5.18.0 版本废弃。
* 增加了群组通知消息类型。
* 增加了按消息类型查询与搜索接口。

# 5.18.0
* 更新了 Android IMLib SDK 依赖为 5.18.0。
* 更新了 iOS IMLib SDK 依赖为 5.18.0。
* 增加了群组托管功能。
* 增加了聊天室回调。
* 增加了是否允许聊天室消息排重接口。

# 5.12.1+2
* 更新了安卓打包环境为 Gradle8+。
* 提升安卓运行环境最低要求为 23。

# 5.12.1+1
* 修复 Android 获取本地消息崩溃问题。

# 5.12.1
* 更新了 Android IMLib SDK 依赖为 5.12.1。
* 更新了 iOS IMLib SDK 依赖为 5.12.1。
* 新增自定义消息注册方式，并支持和原生 SDK 进行互通。


# 5.6.11
* 更新了 Android IMLib SDK 依赖为 5.6.10。
* 更新了 iOS IMLib SDK 依赖为 5.6.11。
* 新增导航区域码支持。
* 新增会话标签支持。
* 新增多引擎支持，修复 callbak 在触发后台任务失效问题。
* 新增获取未读会话列表功能。


# 5.6.2
* 更新了 Android IMLib SDK 依赖为 5.6.2。
* 更新了 iOS IMLib SDK 依赖为 5.6.2。
* 修复最后一条消息为自定义消息时，消息无法解析的问题。

# 5.4.5

* 更新了 Android IMLib SDK 依赖为 5.4.5。
* 更新了 iOS IMLib SDK 依赖为 5.4.5。
* 会话新增操作时间字段。


# 5.4.3

* 更新了 Android IMLib SDK 依赖为 5.4.3。
* 更新了 iOS IMLib SDK 依赖为 5.4.2。
* 新增 Vivo 推送通道的 Category 参数配置。
* 新增会话提醒状态变更的回调。

# 5.4.0

* 新增对 Web 平台支持。
* 新增华为推送通道的 Category 参数配置。
* 新增引擎配置项 logLevel。
* 新增获取本地与服务时间差接口，可以用于校准本地时间和服务时间的偏差，避免因为时间不同步导致的问题。
* 修复 Android 会话 lastMessage 中 userInfo 为空的问题。
* 修复 Android base64 缩略图中含有换行符的问题。

# 5.3.3

* 更新了 SDK 依赖包。

# 5.3.1

* 新增接口 callback 回调。
* 新增超级群列表同步完成回调。
* 优化部分接口逻辑。

# 5.2.5

* 会话中新增第一条未读消息的发送时间。

# 5.2.4+2

* 修复 iOS 会话类型异常问题。

# 5.2.4+1

* 更新了 SDK 依赖包。

# 5.2.4

* 全新的 SDK 版本，优化接口使用。
* 提供完整的 SDK 生命周期。
* 新增超级群会话类型。[参考文档](https://doc.rongcloud.cn/im/Flutter/5.X/noui/ultragroup/intro)
* 新的自定义消息支持方式。 [参考文档](https://doc.rongcloud.cn/im/Flutter/5.X/noui/message/introduction#自定义消息)
