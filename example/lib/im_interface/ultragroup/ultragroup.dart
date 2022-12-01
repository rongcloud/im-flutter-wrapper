import '../../auto/engine_auto_funtion.dart' as engine_auto_fun;
import '../function/engine_function.dart' as engine_fun;
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';
import 'package:rongcloud_im_wrapper_plugin_example/strings/hint_string.dart';

const syncUltraGroupReadStatus = {
  "title": "上报超级群的已读时间",
  "params": [
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
  "action": engine_auto_fun.syncUltraGroupReadStatus,
};

const loadConversationsForAllChannel = {
  "title": "获取特定会话下所有频道的会话列表",
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
  ],
  "action": engine_auto_fun.getConversationsForAllChannel,
};

const loadUltraGroupUnreadMentionedCount = {
  "title": "获取超级群会话中被 @ 的消息数",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
  ],
  "action": engine_auto_fun.getUltraGroupUnreadMentionedCount,
};

const modifyUltraGroupMessage = {
  "title": "修改超级群消息",
  "params": [
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入messageUId",
    },
  ],
  "action": engine_fun.modifyUltraGroupMessage,
};

const recallUltraGroupMessage = {
  "title": "撤回超级群消息",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入需要撤回的消息 id",
    },
    {
      "key": "deleteRemote",
      "type": "number",
      "hint": "0:不删除 1:删除",
      "lable": "是否需要删除远端消息",
    },
  ],
  "action": engine_fun.recallUltraGroupMessage,
};

const clearUltraGroupMessages = {
  "title": "删除本地特定 channel 特点时间之前的消息",
  "params": [
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
    {
      "key": "policy",
      "type": "String",
      "hint": "0：本地 1：远端 2：本地远端",
      "lable": "请输入清除策略",
    },
  ],
  "action": engine_auto_fun.clearUltraGroupMessages,
};

const sendUltraGroupTypingStatus = {
  "title": "发送超级群输入状态",
  "params": [
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
      "key": "typingStatus",
      "type": "number",
      "hint": "0:文本",
      "lable": "请输入输入状态",
    },
  ],
  "action": engine_auto_fun.sendUltraGroupTypingStatus,
};

const clearUltraGroupMessagesForAllChannel = {
  "title": "删除本地所有 channel 特定时间之前的消息",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "timestamp",
      "type": "String",
      "hint": "",
      "lable": "请输入时间戳",
    },
  ],
  "action": engine_auto_fun.clearUltraGroupMessagesForAllChannel,
};

const loadBatchRemoteUltraGroupMessages = {
  "title": "从服务获取批量消息",
  "params": [
    {
      "key": "messageIds",
      "type": "String",
      "hint": "",
      "lable": "请输入 messageIds",
    },
  ],
  "action": engine_fun.loadBatchRemoteUltraGroupMessages,
};

const updateUltraGroupMessageExpansion = {
  "title": "更新消息扩展信息",
  "params": [
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入messageUId",
    },
    {
      "key": "keys",
      "type": "String",
      "hint": "",
      "lable": "请输入keys",
    },
    {
      "key": "values",
      "type": "String",
      "hint": "",
      "lable": "请输入values",
    },
  ],
  "action": engine_auto_fun.updateUltraGroupMessageExpansion,
};

const removeUltraGroupMessageExpansion = {
  "title": "删除消息扩展信息中特定的键值对",
  "params": [
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入messageUId",
    },
    {
      "key": "keys",
      "type": "String",
      "hint": "",
      "lable": "请输入keys",
    },
  ],
  "action": engine_auto_fun.removeUltraGroupMessageExpansionForKeys,
};

const changeUltraGroupDefaultNotificationLevel = {
  "title": "设置超级群的默认消息状态",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
    {
      "key": "level",
      "type": "String",
      "hint": "",
      "lable": "0:全部消息通知（接收全部消息通知--显示指定关闭免打扰功能）"
          "1:未设置（向上查询群或者APP级别设置）//存量数据中0表示未设置"
          "2:群聊，超级群@所有人或者@成员列表有自己时通知；单聊代表消息不通知"
          "3:群聊，超级群@成员列表有自己时通知，@所有人不通知；单聊代表消息不通知"
          "4:群聊，超级群@所有人通知，其他情况都不通知；单聊代表消息不通知"
          "5:消息通知被屏蔽，即不接收消息通知",
    },
  ],
  "action": engine_auto_fun.changeUltraGroupDefaultNotificationLevel,
};

const loadUltraGroupDefaultNotificationLevel = {
  "title": "获取超级群的默认消息状态",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
  ],
  "action": engine_auto_fun.getUltraGroupDefaultNotificationLevel,
};

const changeUltraGroupChannelDefaultNotificationLevel = {
  "title": "设置超级群频道的默认消息状态",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": "",
      "lable": "请输入channelId",
    },
    {
      "key": "level",
      "type": "String",
      "hint": "",
      "lable": "0:全部消息通知（接收全部消息通知--显示指定关闭免打扰功能）"
          "1:未设置（向上查询群或者APP级别设置）//存量数据中0表示未设置"
          "2:群聊，超级群@所有人或者@成员列表有自己时通知；单聊代表消息不通知"
          "3:群聊，超级群@成员列表有自己时通知，@所有人不通知；单聊代表消息不通知"
          "4:群聊，超级群@所有人通知，其他情况都不通知；单聊代表消息不通知"
          "5:消息通知被屏蔽，即不接收消息通知",
    },
  ],
  "action": engine_auto_fun.changeUltraGroupChannelDefaultNotificationLevel,
};

const loadUltraGroupChannelDefaultNotificationLevel = {
  "title": "获取超级群频道的默认消息状态",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
    {
      "key": "channelId",
      "type": "String",
      "hint": "",
      "lable": "请输入channelId",
    },
  ],
  "action": engine_auto_fun.getUltraGroupChannelDefaultNotificationLevel,
};

const loadUltraGroupAllUnreadCount = {
  "title": "所有超级群会话的未读消息数的总和",
  "action": engine_auto_fun.getUltraGroupAllUnreadCount,
};

const loadUltraGroupAllUnreadMentionedCount = {
  "title": "所有超级群会话中的未读 @ 消息数的总和",
  "action": engine_auto_fun.getUltraGroupAllUnreadMentionedCount,
};

const loadUltraGroupUnreadCount = {
  "title": "获取指定会话的未读消息数",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
  ],
  "action": engine_auto_fun.getUltraGroupUnreadCount,
};
