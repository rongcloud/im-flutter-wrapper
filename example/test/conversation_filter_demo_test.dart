import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';
import 'package:rongcloud_im_wrapper_plugin/src/rongcloud_im_wrapper_method_channel.dart';
import 'package:rongcloud_im_wrapper_plugin_example/auto/im_engine.dart';
import 'package:rongcloud_im_wrapper_plugin_example/engine/event_bus.dart';
import 'package:rongcloud_im_wrapper_plugin_example/im_interface/function/engine_function.dart';
import 'package:rongcloud_im_wrapper_plugin_example/im_interface/options.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('cn.rongcloud.im.flutter/RCIMIWEngine');

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    IMEngineManager().engine = null;
    bus.off('rong_im_listener');
  });

  test('会话菜单可以查询逐日消息数和从日期首条查看', () {
    final actions = subList['会话相关']!.map((entry) => entry['action']);
    expect(actions, contains(getMessageCountDetail));
    expect(actions, contains(getMessagesFromCalendarDate));
  });

  test('日期浏览包含零点消息并使用本地读取、升序展示', () async {
    const dateMs = 1792512000000;
    int? handler;
    final events = <Map>[];
    bus.on('rong_im_listener', (event) => events.add(event as Map));
    IMEngineManager().engine = RCIMIWEngine();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          expect(call.method, 'engine:getMessages');
          final args = call.arguments as Map;
          expect(args['sentTime'], dateMs - 1);
          expect(args['policy'], RCIMIWMessageOperationPolicy.local.index);
          expect(args['order'], RCIMIWTimeOrder.after.index);
          expect(args['count'], 20);
          expect(args['channelId'], 'channel-a');
          handler = args['cb_handler'] as int;
          return 0;
        });
    await getMessagesFromCalendarDate({
      'type': '${RCIMIWConversationType.private.index}',
      'targetId': 'target',
      'channelId': 'channel-a',
      'dateMs': '$dateMs',
    });
    final callback =
        RCIMWrapperMethodChannel.takeCallback<IRCIMIWGetMessagesCallback>(
          handler!,
        );
    callback!.onSuccess(
      [
        RCIMIWTextMessage.fromJson({'sentTime': dateMs + 1, 'text': 'later'}),
        RCIMIWTextMessage.fromJson({'sentTime': dateMs, 'text': 'midnight'}),
        RCIMIWTextMessage.fromJson({
          'sentTime': dateMs + 86400000,
          'text': 'next-day',
        }),
      ],
      0,
      false,
    );
    final result = events.singleWhere(
      (event) => event['listener'] == 'getMessagesFromCalendarDate-onSuccess',
    );
    final messages = jsonDecode(result['messages'] as String) as List;
    expect(messages.map((message) => message['sentTime']), [
      dateMs,
      dateMs + 1,
    ]);
  });

  test('撤回菜单提供通知开关并保留实际入口', () {
    final entries = subList.values.expand((entries) => entries);
    final entry = entries.singleWhere(
      (entry) => entry['action'] == recallMessageWithOption,
    );
    final keys = (entry['params'] as List).map((param) => param['key']);
    expect(keys, containsAll(['messageId', 'isDelete', 'disableNotification']));
  });

  for (final notificationInput in [null, '', '0', '1']) {
    test('撤回示例通知开关 $notificationInput 透传且保留删除选项', () async {
      IMEngineManager().engine = RCIMIWEngine();
      var recalled = false;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            final args = call.arguments as Map;
            if (call.method == 'engine:getMessageById') {
              final callback =
                  RCIMWrapperMethodChannel.takeCallback<
                    IRCIMIWGetMessageCallback
                  >(args['cb_handler'] as int);
              callback!.onSuccess(
                RCIMIWTextMessage.fromJson({
                  'messageId': 42,
                  'messageUId': 'recall-uid',
                  'text': 'test',
                }),
              );
            } else {
              expect(call.method, 'engine:recallMessageWithOption');
              expect(args['isDelete'], true);
              expect(args['disableNotification'], notificationInput == '1');
              recalled = true;
            }
            return 0;
          });
      await recallMessageWithOption({
        'messageId': '42',
        'isDelete': '1',
        'use_cb': '0',
        if (notificationInput != null) 'disableNotification': notificationInput,
      });
      expect(recalled, isTrue);
    });
  }

  test('未填写或空白 channelIds 按类型补 null', () {
    final missing = conversationTypeFiltersForDemo({});
    final blank = conversationTypeFiltersForDemo({'channelIds': '  '});

    expect(missing, hasLength(3));
    expect(missing.map((filter) => filter.channelId), everyElement(isNull));
    expect(blank.map((filter) => filter.channelId), everyElement(isNull));
  });

  test('保留字和频道 ID 分别表达默认频道与指定频道', () {
    final filters = conversationTypeFiltersForDemo({
      'conversationTypes': '1,2,4',
      'channelIds': '@default,channel-a,',
    });

    expect(filters.map((filter) => filter.channelId), ['', 'channel-a', null]);
  });

  test('频道条件少于会话类型时剩余项不隐式过滤默认频道', () {
    final filters = conversationTypeFiltersForDemo({
      'conversationTypes': '1,2,4',
      'channelIds': 'channel-a',
    });

    expect(filters.map((filter) => filter.channelId), [
      'channel-a',
      null,
      null,
    ]);
  });
}
