本教程是为了让新手快速了解融云 Flutter 即时通讯能力库。在本教程中，您可以体验集成 SDK 的基本流程和基础通信能力。

## 融云开发者账户

融云开发者账户是使用融云 SDK 产品的必要条件。

在开始之前，请先[前往融云官网注册开发者账户]。注册后，开发者后台将自动为您创建一个应用，默认为开发环境应用，使用国内数据中心。请获取该应用的 App Key，在本教程中使用。

>App Secret 用于生成数据签名，仅在请求融云服务端 API 接口时使用。本教程中暂不涉及。

如果您已拥有融云开发者账户，您可以直接选择合适的环境，创建应用。

应用的 App Key / Secret 是获取连接融云服务器身份凭证的必要条件，请注意不要泄露。

### 导入 SDK {#import}

1. 在项目的 `pubspec.yaml` 中添加依赖

```yaml
dependencies:
  flutter:
    sdk: flutter

rongcloud_im_wrapper_plugin: 5.4.0
```


2. 在项目路径执行 `flutter pub get` 来下载相关插件

### 初始化 {#init}

1. 使用 SDK 功能前，需要 `import` 下面的头文件

```dart
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
```


2. 开发者在使用融云 SDK 所有功能之前，开发者必须先调用此方法初始化 SDK 并配置相关引擎参数。

```dart
RCIMIWEngineOptions options = RCIMIWEngineOptions.create();
RCIMIWEngine engine = await RCIMIWEngine.create(appkey, options);
```

注意：请使用开发功能之前从[融云开发者后台](https://developer.rongcloud.cn/app/appkey/iwj1eg7Wb9M437VP1w==)注册得到的 `Appkey`

### 连接融云 {#connect}


1. `Token` 即用户令牌，相当于您 APP 上当前用户连接融云的身份凭证。在您连接融云服务器之前，您需要请求您的 App Server，您的 App Server 通过融云 [Server API 获取 Token](/imserver/server/v1/user/register) 并返回给您的客户端，客户端获取到这个 Token 即可连接融云服务器。
2. `timeout` 连接超时时间，单位：秒。

注：如果 `code == 31004` 即过 `Token` 无效，是因为您在开发者后台设置了 `Token` 过期时间或者 `Token` 和初始化的 `AppKey` 不同环境，您需要请求您的服务器重新获取 `Token` 并再次用新的 `Token` 建立连接。

```dart
engine.connect(
        token,
        timeout,
      );
```

1. `code` 连接状态码，0 代表连接成功。
2. `userId` 连接成功的用户 id。

```dart
engine.onConnected = (
  int? code,
  String? userId,
) {};
```

### 监听消息 {#msg-listener}

实现此功能需要开发者实现消息监听回调。

##### 代码示例 {#msg-code}

设置消息接收监听器，用于接收所有类型的实时或者离线消息。

1. `message` 接收到的消息对象
2. `left`  当客户端连接成功后，服务端会将所有补偿消息以消息包的形式下发给客户端，最多每 200 条消息为一个消息包，即一个 Package, 客户端接受到消息包后，会逐条解析并通知应用。left 为当前消息包（Package）里还剩余的消息条数
3. `offline` 消息是否离线消息
4. `hasPackage` 是否在服务端还存在未下发的消息包

```dart
engine.onMessageReceived = (
  RCIMIWMessage? message,
  int? left,
  bool? offline,
  bool? hasPackage,
) {
};
```

### 发送消息 {#sendmessage}

```dart
RCIMIWTextMessage? textMessage = await engine.createTextMessage(
        conversationType,
        targetId,
        channelId,
        text,
      );
engine.sendMessage(textMessage);
```

### 监听消息发送结果 {#msgreceiver}

```dart
engine.onMessageAttached = (
  RCIMIWMessage? message,
) {};

engine.onMessageSent = (
  int? code,
  RCIMIWMessage? message,
) {};
```

### 退出登录

```dart
engine.disconnect(receivePush);
```

### 引擎销毁

```dart
engine.destroy();
```
