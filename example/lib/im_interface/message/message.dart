import 'package:rongcloud_im_wrapper_plugin_example/strings/hint_string.dart';
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';

import '../function/engine_function.dart' as engine_fun;
import '../../auto/engine_auto_funtion.dart' as engine_auto_fun;

const sendTextMessage = {
  "title": "发送文本消息",
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
      "key": "text",
      "type": "String",
      "hint": "",
      "lable": "请输入发送文本",
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
      "key": "extra",
      "type": "String",
      "hint": "",
      "lable": "消息的扩展信息",
    },
    {
      "key": "userId",
      "type": "String",
      "hint": "",
      "lable": "用户信息ID",
    },
    {
      "key": "name",
      "type": "String",
      "hint": "",
      "lable": "用户信息名称",
    },
    {
      "key": "portrait",
      "type": "String",
      "hint": "",
      "lable": "用户信息头像",
    },
    {
      "key": "alias",
      "type": "String",
      "hint": "",
      "lable": "用户信息别名",
    },
    {
      "key": "userinfo_extra",
      "type": "String",
      "hint": "",
      "lable": "用户信息扩展",
    },
    {
      "key": "Mentioned",
      "type": "number",
      "hint": "",
      "lable": "选择@类型\n 0:@ 所有人, 1: @指定的用户",
    },
    {
      "key": "MentionedUser",
      "type": "String",
      "hint": "多个以英文,分割  eg:user1,user2",
      "lable": "请输入@的用户",
    },
    {
      "key": "MentionedText",
      "type": "String",
      "hint": "",
      "lable": "请输入@文本",
    },
  ],
  "action": engine_fun.sendTextMessage,
};

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
  "action": engine_fun.sendImageMessage,
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
  "action": engine_fun.sendFileMessage,
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
  "action": engine_fun.sendSightMessage,
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
  "action": engine_fun.sendVoiceMessage,
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
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入引用的消息 Id",
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
  "action": engine_fun.sendReferenceMessage,
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
  "action": engine_fun.sendGIFMessage,
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
  "action": engine_fun.sendLocationMessage,
};

const sendUserCustomMessage = {
  "title": "给 sealtalk 发送自定义消息",
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
    {"key": "content", "type": "String", "hint": "", "lable": "备注内容 "}
  ],
  "action": engine_fun.sendUserCustomMessage,
};

const sendCustomMessage = {
  "title": "发送自定义消息",
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
      "key": "policy",
      "type": "String",
      "hint": "",
      "lable": "请输入存储策略 \n 0: 客户端不存储，支持离线消息机制，不计入未读消息数 "
          "\n 1:客户端存储，支持离线消息机制，且存入服务端历史消息，计入未读消息数"
          "\n 2:客户端不存储，服务端不存储，不计入未读消息数"
          "\n 3:客户端存储，支持离线消息机制，且存入服务端历史消息，不计入未读消息数",
    },
    {
      "key": "messageIdentifier",
      "type": "String",
      "hint": "",
      "lable": "请输入标识符",
    },
    {
      "key": "keys",
      "type": "String",
      "hint": "多个以英文 , 分割  eg: key1,key2",
      "lable": "请输入自定义内容的键",
    },
    {
      "key": "values",
      "type": "String",
      "hint": "多个以英文 , 分割  eg: value1,value2",
      "lable": "请输入自定义内容的值",
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
  "action": engine_fun.sendCustomMessage,
};

const cancelSendingMediaMessage = {
  "title": "取消发送中的媒体消息",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入取消发送的消息 Id",
    },
  ],
  "action": engine_fun.cancelSendingMediaMessage,
};

const downloadMediaMessage = {
  "title": "下载媒体消息",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入下载的消息 Id",
    },
  ],
  "action": engine_fun.downloadMediaMessage,
};

const cancelDownloadingMediaMessage = {
  "title": "取消下载媒体消息",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入需要取消的消息 Id",
    },
  ],
  "action": engine_fun.cancelDownloadingMediaMessage,
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
      "hint": "0: 仅本地 1: 仅远端  2: 本地和远端",
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

const getMessageById = {
  "title": "根据消息ID加载消息",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入消息 Id",
    },
  ],
  "action": engine_fun.getMessageById,
};

const getMessageByUId = {
  "title": "根据远端 UID 加载消息",
  "params": [
    {
      "key": "messageUId",
      "type": "String",
      "hint": "",
      "lable": "请输入消息 UId",
    },
  ],
  "action": engine_fun.getMessageByUId,
};

const loadFirstUnreadMessage = {
  "title": "加载某个会话的第一条未读消息",
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
  "action": engine_auto_fun.getFirstUnreadMessage,
};

const loadUnreadMentionedMessages = {
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
  "action": engine_auto_fun.getUnreadMentionedMessages,
};

const insertMessage = {
  "title": "插入一条消息",
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
  "action": engine_fun.insertMessage,
};

const insertMessages = {
  "title": "插入多条消息",
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
  "action": engine_fun.insertMessages,
};

const clearMessages = {
  "title": "删除消息",
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
      "lable": "清除消息截止时间戳，0 <= recordTime <= 当前会话最后一条消息的 sentTime, 0 清除所有消息，其他值清除小于等于 recordTime 的消息",
    },
    {
      "key": "policy",
      "type": "String",
      "hint": "0: 仅本地 1: 仅远端  2: 本地和远端",
      "lable": "请输入policy",
    },
  ],
  "action": engine_auto_fun.clearMessages,
};

const deleteLocalMessages = {
  "title": "删除本地消息",
  "params": [
    {
      "key": "messageIds",
      "type": "String",
      "hint": "多个以英文 , 分割  eg: 1,2",
      "lable": "请输入需要删除的消息 Id",
    },
  ],
  "action": engine_fun.deleteLocalMessages,
};

const deleteMessages = {
  "title": "删除消息（本地远端同时删除)",
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
      "key": "messageIds",
      "type": "String",
      "hint": "多个以英文 , 分割  eg: 1,2",
      "lable": "请输入需要删除的消息 Id",
    },
  ],
  "action": engine_fun.deleteMessages,
};

const recallMessage = {
  "title": "撤回某条消息",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入撤回的消息 Id",
    },
  ],
  "action": engine_fun.recallMessage,
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
  ],
  "action": engine_auto_fun.sendPrivateReadReceiptMessage,
};

const sendGroupReadReceiptRequest = {
  "title": "发送群聊的已读回执请求",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入需要回执的消息 Id",
    },
  ],
  "action": engine_fun.sendGroupReadReceiptRequest,
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
      "key": "messageIds",
      "type": "String",
      "hint": "多个以英文 , 分割  eg: 1,2",
      "lable": "请输入响应的消息 Id",
    },
  ],
  "action": engine_fun.sendGroupReadReceiptResponse,
};

const updateMessageExpansion = {
  "title": "更新消息扩展",
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
  "action": engine_auto_fun.updateMessageExpansion,
};

const removeMessageExpansionForKeys = {
  "title": "根据 key 移除消息扩展",
  "params": [
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
  "action": engine_auto_fun.removeMessageExpansionForKeys,
};

const changeMessageSentStatus = {
  "title": "修改消息的发送状态",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入消息 Id",
    },
    {
      "key": "sentStatus",
      "type": "number",
      "hint": "",
      "lable": "请输入发送状态 0:发送中 1:发送失败 2:已发送 3:对方已接收 4:对方已读 5:对方已销毁 6:对方已取消",
    },
  ],
  "action": engine_auto_fun.changeMessageSentStatus,
};

const changeMessageReceiveStatus = {
  "title": "修改消息的接收状态",
  "params": [
    {
      "key": "messageId",
      "type": "String",
      "hint": "",
      "lable": "请输入消息 Id",
    },
    {
      "key": "receivedStatus",
      "type": "String",
      "hint": "",
      "lable": "请输入接收状态 0:未读 1:已读 3:已听 4:已下载",
    },
  ],
  "action": engine_auto_fun.changeMessageReceiveStatus,
};

const searchMessages = {
  "title": "搜索消息",
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
      "key": "keyword",
      "type": "String",
      "hint": "",
      "lable": "请输入关键字",
    },
    {
      "key": "startTime",
      "type": "String",
      "hint": "",
      "lable": "请输入查询的开始时间",
    },
    {
      "key": "count",
      "type": "String",
      "hint": "",
      "lable": "请输入查询数量",
    },
  ],
  "action": engine_auto_fun.searchMessages,
};

const searchMessagesByTimeRange = {
  "title": "根据时间段搜索消息",
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
      "key": "keyword",
      "type": "String",
      "hint": "",
      "lable": "请输入关键字",
    },
    {
      "key": "startTime",
      "type": "String",
      "hint": "",
      "lable": "请输入查询的开始时间",
    },
    {
      "key": "endTime",
      "type": "String",
      "hint": "",
      "lable": "请输入查询的结束时间",
    },
    {
      "key": "offset",
      "type": "String",
      "hint": "",
      "lable": "请输入偏移量",
    },
    {
      "key": "count",
      "type": "String",
      "hint": "",
      "lable": "请输入查询数量",
    },
  ],
  "action": engine_auto_fun.searchMessagesByTimeRange,
};

const searchMessagesByUserId = {
  "title": "根据用户ID 搜索消息",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": "",
      "lable": "请输入用户 ID",
    },
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
      "key": "startTime",
      "type": "String",
      "hint": "",
      "lable": "请输入查询的开始时间",
    },
    {
      "key": "count",
      "type": "String",
      "hint": "",
      "lable": "请输入查询数量",
    },
  ],
  "action": engine_auto_fun.searchMessagesByUserId,
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
