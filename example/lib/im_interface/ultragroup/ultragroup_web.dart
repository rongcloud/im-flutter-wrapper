import '../../auto/engine_auto_funtion.dart' as engine_auto_fun;
import '../function/engine_function_web.dart' as engine_fun_web;
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
  ],
  "action": engine_fun_web.syncUltraGroupReadStatus,
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
  "action": engine_auto_fun.loadConversationsForAllChannel,
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
  "action": engine_auto_fun.loadUltraGroupUnreadMentionedCount,
};

const modifyUltraGroupMessage = {
  "title": "修改超级群消息",
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
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入messageUId",
    },
  ],
  "action": engine_fun_web.modifyUltraGroupMessage,
};

const recallUltraGroupMessage = {
  "title": "撤回超级群消息",
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
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入需要撤回的消息 Uid",
    },
    {
      "key": "deleteRemote",
      "type": "number",
      "hint": "0:不删除 1:删除",
      "lable": "是否需要删除远端消息",
    },
  ],
  "action": engine_fun_web.recallUltraGroupMessage,
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

const loadBatchRemoteUltraGroupMessages = {
  "title": "从服务获取批量消息",
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
      "key": "messageUIds",
      "type": "String",
      "hint": "",
      "lable": "请输入 messageUIds, 以英文逗号分隔",
    },
  ],
  "action": engine_fun_web.getBatchRemoteUltraGroupMessages,
};

const updateUltraGroupMessageExpansion = {
  "title": "更新消息扩展信息",
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
  "action": engine_fun_web.updateUltraGroupMessageExpansion,
};

const removeUltraGroupMessageExpansion = {
  "title": "删除消息扩展信息中特定的键值对",
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
  "action": engine_fun_web.removeUltraGroupMessageExpansionForKeys,
};
