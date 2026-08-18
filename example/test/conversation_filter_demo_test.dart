import 'package:flutter_test/flutter_test.dart';
import 'package:rongcloud_im_wrapper_plugin_example/im_interface/function/engine_function.dart';

void main() {
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

    expect(filters.map((filter) => filter.channelId), [
      '',
      'channel-a',
      null,
    ]);
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
