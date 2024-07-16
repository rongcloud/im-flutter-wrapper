import 'package:rongcloud_im_wrapper_plugin_example/strings/hint_string.dart';
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';
import '../../auto/engine_auto_funtion.dart' as engine_fun;

const loadConversations = {
  "title": "加载某些会话",
  "params": [
    {
      "key": "conversationTypes",
      "type": "number",
      "hint": HintString.conversationTypes,
      "lable": LableString.conversationType,
    },
    {
      "key": "channelId",
      "type": "String",
      "lable": LableString.editChannelIdString,
      "hint": HintString.channelIdString,
    },
    {
      "key": "count",
      "type": "number",
      "lable": "请输入查询数量",
      "hint": "大于 0 小于等于 50",
    },
    {
      "key": "startTime",
      "type": "number",
      "lable": "请输入开始时间(时间戳单位: 毫秒)",
      "hint": "0: 查询所有",
    },
  ],
  "action": engine_fun.getConversations,
};

const getUnreadConversations = {
  "title": "加载未读的会话列表",
  "params": [
    {
      "key": "conversationTypes",
      "type": "number",
      "hint": HintString.conversationTypes,
      "lable": LableString.conversationType,
    },
  ],
  "action": engine_fun.getUnreadConversations,
};

const loadConversation = {
  "title": "加载某个会话",
  "params": [
    {
      "key": "type",
      "type": "number",
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
  "action": engine_fun.getConversation,
};

const removeConversation = {
  "title": "移除某个会话",
  "params": [
    {
      "key": "type",
      "type": "number",
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
  "action": engine_fun.removeConversation,
};

const removeConversations = {
  "title": "根据会话类型移除会话",
  "params": [
    {
      "key": "conversationTypes",
      "type": "number",
      "hint": HintString.conversationTypes,
      "lable": LableString.conversationType,
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
  ],
  "action": engine_fun.removeConversations,
};

const saveDraftMessage = {
  "title": "保存会话草稿信息",
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
      "key": "draft",
      "type": "String",
      "hint": "",
      "lable": "请输入草稿内容",
    },
  ],
  "action": engine_fun.saveDraftMessage,
};

const loadDraftMessage = {
  "title": "获取会话中的草稿信息",
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
  "action": engine_fun.getDraftMessage,
};

const clearDraftMessage = {
  "title": "删除指定会话中的草稿信息",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": LableString.conversationType
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString
    },
  ],
  "action": engine_fun.clearDraftMessage,
};

const changeConversationNotificationLevel = {
  "title": "设置会话的消息提醒状态",
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
      "key": "level",
      "type": "number",
      "hint": "",
      "lable": "请输入提醒状态值 \n 0:全部消息通知（接收全部消息通知--显示指定关闭免打扰功能 "
          "\n 1:未设置（向上查询群或者APP级别设置）//存量数据中0表示未设置"
          "\n 2:群聊，超级群@所有人或者@成员列表有自己时通知；单聊代表消息不通知"
          "\n 3:群聊，超级群@成员列表有自己时通知，@所有人不通知；单聊代表消息不通知"
          "\n 4:群聊，超级群@所有人通知，其他情况都不通知；单聊代表消息不通知"
          "\n 5:消息通知被屏蔽，即不接收消息通知",
    },
  ],
  "action": engine_fun.changeConversationNotificationLevel,
};

//加载会话的提醒状态
const loadConversationNotificationLevel = {
  "title": "获取会话的消息提醒状态",
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
  "action": engine_fun.getConversationNotificationLevel,
};

const loadBlockedConversations = {
  "title": "获取免打扰的会话列表",
  "params": [
    {
      "key": "conversationTypes",
      "type": "String",
      "hint": HintString.conversationTypes,
      "lable": LableString.conversationType,
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
  ],
  "action": engine_fun.getBlockedConversations,
};

const changeConversationTopStatus = {
  "title": "设置会话的置顶状态",
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
      "key": "top",
      "type": "number",
      "hint": "0: 取消置顶  1: 置顶",
      "lable": "是否置顶",
    },
  ],
  "action": engine_fun.changeConversationTopStatus,
};

const loadConversationTopStatus = {
  "title": "获取会话的置顶状态",
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
  "action": engine_fun.getConversationTopStatus,
};

const syncConversationReadStatus = {
  "title": "同步会话阅读状态",
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
      "type": "number",
      "hint": "会话中已读的最后一条消息的发送时间戳",
      "lable": "请输入同步的时间(时间戳单位: 毫秒)",
    },
  ],
  "action": engine_fun.syncConversationReadStatus,
};

const searchConversations = {
  "title": "根据关键字搜索会话",
  "params": [
    {
      "key": "conversationTypes",
      "type": "String",
      "hint": HintString.conversationTypes,
      "lable": LableString.conversationType,
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "messageTypes",
      "type": "String",
      "hint": "1:自定义, 2:文本",
      "lable": "请输入查询的消息类型,多个以英文\",\"分割",
    },
    {
      "key": "keyword",
      "type": "String",
      "hint": "",
      "lable": "请输入关键字",
    },
  ],
  "action": engine_fun.searchConversations,
};

const loadMessageCount = {
  "title": "获取指定会话的消息总数",
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
  "action": engine_fun.getMessageCount,
};

const loadTopConversations = {
  "title": "根据会话类型,获取置顶会话列表",
  "params": [
    {
      "key": "conversationTypes",
      "type": "String",
      "hint": HintString.conversationTypes,
      "lable": LableString.conversationType,
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": HintString.channelIdString,
      "lable": LableString.editChannelIdString,
    },
  ],
  "action": engine_fun.getTopConversations,
};

const changeConversationTypeNotificationLevel = {
  "title": "设置会话类型的消息提醒状态",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": LableString.conversationType,
    },
    {
      "key": "level",
      "type": "String",
      "hint": "",
      "lable": "请输入提醒状态值 \n 0:全部消息通知（接收全部消息通知--显示指定关闭免打扰功能 "
          "\n 1:未设置（向上查询群或者APP级别设置）//存量数据中0表示未设置"
          "\n 2:群聊，超级群@所有人或者@成员列表有自己时通知；单聊代表消息不通知"
          "\n 3:群聊，超级群@成员列表有自己时通知，@所有人不通知；单聊代表消息不通知"
          "\n 4:群聊，超级群@所有人通知，其他情况都不通知；单聊代表消息不通知"
          "\n 5:消息通知被屏蔽，即不接收消息通知",
    },
  ],
  "action": engine_fun.changeConversationTypeNotificationLevel,
};

const loadConversationTypeNotificationLevel = {
  "title": "获取会话类型的消息提醒状态",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": "请输入会话类型",
    },
  ],
  "action": engine_fun.getConversationTypeNotificationLevel,
};
