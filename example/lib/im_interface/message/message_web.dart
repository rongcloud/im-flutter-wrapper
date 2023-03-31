import 'package:rongcloud_im_wrapper_plugin_example/strings/hint_string.dart';
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';

import '../function/engine_function.dart' as engine_fun;
import '../function/engine_function_web.dart' as engine_fun_web;
import '../../auto/engine_auto_funtion.dart' as engine_auto_fun;

const sendImageMessage = {
  "title": "发送图片消息",
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
    {
      "key": "pushContent",
      "type": "String",
      "hint": "",
      "lable": LableString.pushContent,
    },
    {
      "key": "pushData",
      "type": "String",
      "hint": "",
      "lable": LableString.pushData,
    },
    {
      "key": "original",
      "type": "number",
      "hint": "1：是 0：否 ",
      "lable": "是否发送原图",
    },
  ],
  "action": engine_fun_web.sendImageMessage,
};

const sendFileMessage = {
  "title": "发送文件消息",
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
    {
      "key": "pushContent",
      "type": "String",
      "hint": "",
      "lable": LableString.pushContent,
    },
    {
      "key": "pushData",
      "type": "String",
      "hint": "",
      "lable": LableString.pushData,
    },
  ],
  "action": engine_fun_web.sendFileMessage,
};

const sendSightMessage = {
  "title": "发送小视频消息",
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
    {
      "key": "pushContent",
      "type": "String",
      "hint": "",
      "lable": LableString.pushContent,
    },
    {
      "key": "pushData",
      "type": "String",
      "hint": "",
      "lable": LableString.pushData,
    },
  ],
  "action": engine_fun_web.sendSightMessage,
};

const sendVoiceMessage = {
  "title": "发送语音消息",
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
    {
      "key": "pushContent",
      "type": "String",
      "hint": "",
      "lable": LableString.pushContent,
    },
    {
      "key": "pushData",
      "type": "String",
      "hint": "",
      "lable": LableString.pushData,
    },
  ],
  "action": engine_fun_web.sendVoiceMessage,
};

const sendGIFMessage = {
  "title": "发送GIF消息",
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
    {
      "key": "pushContent",
      "type": "String",
      "hint": "",
      "lable": LableString.pushContent,
    },
    {
      "key": "pushData",
      "type": "String",
      "hint": "",
      "lable": LableString.pushData,
    },
  ],
  "action": engine_fun_web.sendGIFMessage,
};

const sendLocationMessage = {
  "title": "发送位置消息",
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
    {
      "key": "pushContent",
      "type": "String",
      "hint": "",
      "lable": LableString.pushContent,
    },
    {
      "key": "pushData",
      "type": "String",
      "hint": "",
      "lable": LableString.pushData,
    },
    {
      "key": "longitude",
      "type": "String",
      "hint": "必填",
      "lable": "经度",
    },
    {
      "key": "latitude",
      "type": "String",
      "hint": "必填",
      "lable": "纬度",
    },
    {
      "key": "poiName",
      "type": "String",
      "hint": "必填",
      "lable": "地理位置信息",
    },
  ],
  "action": engine_fun_web.sendLocationMessage,
};

const sendReferenceMessage = {
  "title": "发送引用消息",
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
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入引用的消息 UId",
    },
    {
      "key": "text",
      "type": "String",
      "hint": "",
      "lable": "请输入引用文本",
    },
    {
      "key": "pushContent",
      "type": "String",
      "hint": "",
      "lable": LableString.pushContent,
    },
    {
      "key": "pushData",
      "type": "String",
      "hint": "",
      "lable": LableString.pushData,
    },
  ],
  "action": engine_fun_web.sendReferenceMessage,
};

const recallMessage = {
  "title": "撤回某条消息",
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
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入撤回的消息 UId",
    },
  ],
  "action": engine_fun_web.recallMessage,
};

const sendPrivateReadReceiptMessage = {
  "title": "发送单聊的已读回执",
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
      "hint": "",
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "timestamp",
      "type": "String",
      "hint": "",
      "lable": "该会话中已读的最后一条消息的发送时间戳",
    },
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "已读消息的UId",
    },
  ],
  "action": engine_fun_web.sendPrivateReadReceiptMessage,
};

const sendGroupReadReceiptRequest = {
  "title": "发送群聊的已读回执请求",
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
      "hint": "",
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入需要回执的消息 UId",
    },
  ],
  "action": engine_fun_web.sendGroupReadReceiptRequest,
};

const sendGroupReadReceiptResponse = {
  "title": "发送群聊的已读回执响应",
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
      "hint": "",
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "messageUIds",
      "type": "String",
      "hint": "多个以英文 , 分割  eg: 1,2",
      "lable": "请输入响应的消息 UId",
    },
  ],
  "action": engine_fun_web.sendGroupReadReceiptResponse,
};

const updateMessageExpansion = {
  "title": "更新消息扩展",
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
      "hint": "",
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
      "hint": "Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字",
      "lable": "请输入keys",
    },
    {
      "key": "values",
      "type": "String",
      "hint": "",
      "lable": "请输入values",
    },
  ],
  "action": engine_fun_web.updateMessageExpansion,
};

const removeMessageExpansionForKeys = {
  "title": "根据 key 移除消息扩展",
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
      "hint": "",
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入消息 UId",
    },
    {
      "key": "keys",
      "type": "String",
      "hint": "",
      "lable": "请输入keys",
    },
  ],
  "action": engine_fun_web.removeMessageExpansionForKeys,
};

const sendGroupMessageToDesignatedUsers = {
  "title": "发送群聊定向消息",
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
      "hint": "",
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "userIds",
      "type": "String",
      "hint": "",
      "lable": "请输入需要接收的用户",
    },
  ],
  "action": engine_fun.sendGroupMessageToDesignatedUsers,
};

const sendTypingStatus = {
  "title": "发送输入状态消息",
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
      "key": "currentType",
      "type": "String",
      "hint": "",
      "lable": "请输入当前的状态",
    },
  ],
  "action": engine_auto_fun.sendTypingStatus,
};

const loadMessages = {
  "title": "加载消息",
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
      "key": "sentTime",
      "type": "number",
      "hint": "",
      "lable": "请输入开始时间(时间戳单位: 毫秒)",
    },
    {
      "key": "order",
      "type": "number",
      "hint": "",
      "lable": "请输入时间策略 \n 0:获取小于 sentTime 的消息 \n1:获取大于 sentTime 的消息",
    },
    {
      "key": "policy",
      "type": "number",
      "hint": "1: 仅远端",
      "lable": "请输入加载策略",
    },
    {
      "key": "count",
      "type": "number",
      "hint": "最多获取 20 条",
      "lable": "请输入获取数量",
    },
  ],
  "action": engine_auto_fun.getMessages,
};

const clearMessages = {
  "title": "删除消息（通过时间戳删除）",
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
      "hint": "",
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "timestamp",
      "type": "String",
      "hint": "",
      "lable":
          "清除消息截止时间戳，0 <= recordTime <= 当前会话最后一条消息的 sentTime, 0 清除所有消息，其他值清除小于等于 recordTime 的消息",
    },
    {
      "key": "policy",
      "type": "String",
      "hint": "1: 仅远端（web 只支持 1）",
      "lable": "请输入policy",
    },
  ],
  "action": engine_auto_fun.clearMessages,
};

const deleteMessages = {
  "title": "删除消息 （通过消息删除)",
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
      "hint": "",
      "lable": LableString.editChannelIdString,
    },
    {
      "key": "messageUIds",
      "type": "String",
      "hint": "多个以英文 , 分割  eg: 1,2",
      "lable": "请输入需要删除的消息 UId",
    },
  ],
  "action": engine_fun_web.deleteMessages,
};
