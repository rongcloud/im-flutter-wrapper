import '../../auto/engine_auto_funtion.dart' as engine_fun;
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';
import 'package:rongcloud_im_wrapper_plugin_example/strings/hint_string.dart';

const loadUnreadCount = {
  "title": "加载某个会话的未读数",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": LableString.conversationType,
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
  ],
  "action": engine_fun.loadUnreadCount,
};

const loadTotalUnreadCount = {
  "title": "加载所有未读数",
  "params": [
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
  ],
  "action": engine_fun.loadTotalUnreadCount,
};

const loadUnreadMentionedCount = {
  "title": "获取会话中未读的 @ 消息",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": LableString.conversationType,
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
  ],
  "action": engine_fun.loadUnreadMentionedCount,
};

const loadUnreadCountByConversationTypes = {
  "title": "根据会话类型加载未读数",
  "params": [
    {
      "key": "conversationTypes",
      "type": "String",
      "hint": "",
      "lable": "请输入会话类型",
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "contain",
      "type": "String",
      "hint": "0:不包含 1:包含",
      "lable": "是否包含免打扰消息的未读消息数",
    },
  ],
  "action": engine_fun.loadUnreadCountByConversationTypes,
};

const clearUnreadCount = {
  "title": "清除某个会话中的未读消息数",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": LableString.conversationType,
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "timestamp",
      "type": "String",
      "hint": "",
      "lable": "请输入时间戳",
    },
  ],
  "action": engine_fun.clearUnreadCount,
};
