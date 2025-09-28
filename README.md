# 融云 Flutter IMLib

融云 IMLib 是即时通讯核心 SDK，支持单聊、群聊、聊天室、系统通知、超级群等功能。通过集成 IM Wrapper Plugin，您可以在 Flutter 应用中快速实现完整的即时通讯功能。

[融云 iOS IMLib 文档](https://docs.rongcloud.cn/ios-imlib)

[融云 Android IMLib 文档](https://docs.rongcloud.cn/android-imlib)

## 准备工作

1. 如果您还没有融云开发者账号，在[融云控制台](https://console.rongcloud.cn/)注册一个。
2. 在控制台，通过**应用配置**>**基本信息**>**App Key**，获取您的 App Key。
3. 通过服务端 API，[获取用户 Token](https://docs.rongcloud.cn/platform-chat-api/user/register)。

> App Secret 用于生成数据签名，仅在请求融云服务端 API 接口时使用。

## 依赖 IM Wrapper Plugin

在项目的 `pubspec.yaml` 中写如下依赖：

```yaml
dependencies:
  flutter:
    sdk: flutter
  rongcloud_im_wrapper_plugin: 5.24.6
```

## 快速开始

详细的集成步骤、API 使用说明、功能配置等内容，请参考 [融云 IMLib Flutter 完整开发文档](https://docs.rongcloud.cn/flutter-imlib)。

文档包含以下完整内容：
- [初始化](https://docs.rongcloud.cn/flutter-imlib/init) - SDK 初始化和引擎创建
- [连接与断开](https://docs.rongcloud.cn/flutter-imlib/connect) - 建立和断开 IM 连接
- [消息管理](https://docs.rongcloud.cn/flutter-imlib/message) - 发送、接收、存储消息
- [会话管理](https://docs.rongcloud.cn/flutter-imlib/conversation) - 会话列表和会话操作
- [群组管理](https://docs.rongcloud.cn/flutter-imlib/group) - 群组创建、管理和操作
- [聊天室管理](https://docs.rongcloud.cn/flutter-imlib/chatroom) - 聊天室加入和管理
- [推送服务](https://docs.rongcloud.cn/flutter-imlib/push) - 离线推送配置
- 完整的 API 参考和错误码说明

## 基本使用示例

### 1. 初始化和连接
```dart
// 导入 SDK
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

// 初始化 SDK
RCIMIWEngineOptions options = RCIMIWEngineOptions.create();
RCIMIWEngine engine = await RCIMIWEngine.create(appkey, options);

// 连接 IM 服务
engine.connect(token, timeout);
```

### 2. 监听连接状态
```dart
engine.onConnected = (int? code, String? userId) {
  if (code == 0) {
    // 连接成功
  }
};
```

### 3. 发送和接收消息
```dart
// 发送文本消息
RCIMIWTextMessage? textMessage = await engine.createTextMessage(
  conversationType, targetId, channelId, text,
);
engine.sendMessage(textMessage);

// 监听接收消息
engine.onMessageReceived = (
  RCIMIWMessage? message,
  int? left,
  bool? offline,
  bool? hasPackage,
) {
  // 处理接收到的消息
};
```

## 支持

如有任何问题，请通过以下方式获取帮助：
- 查阅[官方完整文档](https://docs.rongcloud.cn/flutter-imlib)
- [提交工单](https://console.rongcloud.cn/agile/formwork/ticket/create)，联系融云技术支持

---

# Introducing RC IMLib for Flutter

RC IMLib is the core instant messaging SDK, supporting private chat, group chat, chatroom, system notifications, ultra groups, and more. By integrating the IM Wrapper Plugin, you can quickly implement complete instant messaging functionality in your Flutter applications.

[RC iOS IMLib Documentation](https://docs.rongcloud.io/ios-imlib)

[RC Android IMLib Documentation](https://docs.rongcloud.io/android-imlib)

## Preparations

1. If you don't have a RC developer account yet, register one at [RongCloud Console](https://console.rongcloud.io/).
2. In the console, get your App Key through **Application Configuration** > **Basic Information** > **App Key**.
3. Get user Token through server-side API, [register user](https://docs.rongcloud.io/platform-chat-api/user/register).

> App Secret is used to generate data signatures and is only required when calling RC's server API.

## Dependencies on IM Wrapper Plugin

Add the following dependencies to your project's `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  rongcloud_im_wrapper_plugin: 5.24.6
```

## Quick Start

For detailed integration steps, API usage instructions, feature configurations, and more, please refer to [RC IMLib Flutter Complete Development Documentation](https://docs.rongcloud.io/flutter-imlib).

The documentation includes comprehensive content on:
- [Initialization](https://docs.rongcloud.io/flutter-imlib/init) - SDK initialization and engine creation
- [Connect & Disconnect](https://docs.rongcloud.io/flutter-imlib/connect) - Establish and disconnect IM connections
- [Message Management](https://docs.rongcloud.io/flutter-imlib/message) - Send, receive, and store messages
- [Conversation Management](https://docs.rongcloud.io/flutter-imlib/conversation) - Conversation lists and operations
- [Group Management](https://docs.rongcloud.io/flutter-imlib/group) - Group creation, management, and operations
- [Chatroom Management](https://docs.rongcloud.io/flutter-imlib/chatroom) - Join and manage chatrooms
- [Push Service](https://docs.rongcloud.io/flutter-imlib/push) - Offline push configuration
- Complete API reference and error code explanations

## Basic Usage Examples

### 1. Initialize and Connect
```dart
// Import SDK
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

// Initialize SDK
RCIMIWEngineOptions options = RCIMIWEngineOptions.create();
RCIMIWEngine engine = await RCIMIWEngine.create(appkey, options);

// Connect to IM service
engine.connect(token, timeout);
```

### 2. Listen for Connection Status
```dart
engine.onConnected = (int? code, String? userId) {
  if (code == 0) {
    // Connection successful
  }
};
```

### 3. Send and Receive Messages
```dart
// Send text message
RCIMIWTextMessage? textMessage = await engine.createTextMessage(
  conversationType, targetId, channelId, text,
);
engine.sendMessage(textMessage);

// Listen for received messages
engine.onMessageReceived = (
  RCIMIWMessage? message,
  int? left,
  bool? offline,
  bool? hasPackage,
) {
  // Handle received message
};
```

## Support

For any questions, please get help through:
- Consult the [Official Complete Documentation](https://docs.rongcloud.io/flutter-imlib)
- [Submit a ticket](https://console.rongcloud.io/agile/formwork/ticket/create) to contact RC technical support
