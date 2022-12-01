import '../../auto/engine_auto_funtion.dart' as engine_fun;
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';

const joinChatRoom = {
  "title": "加入聊天室",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "必填",
      "lable": "请输入聊天室房间 ID",
    },
    {
      "key": "messageCount",
      "type": "String",
      "hint": "必填",
      "lable": "请输入加入时拉取的历史消息数",
    },
    {
      "key": "autoCreate",
      "type": "number",
      "hint": "0: 不创建 1: 创建",
      "lable": "聊天室不存在时是否自动创建",
    },
  ],
  "action": engine_fun.joinChatRoom,
};

const leaveChatRoom = {
  "title": "退出聊天室",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "必填",
      "lable": "请输入聊天室房间 ID",
    },
  ],
  "action": engine_fun.leaveChatRoom,
};

const loadChatRoomMessages = {
  "title": "获取聊天室历史消息记录",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "必填",
      "lable": "请输入聊天室房间 ID",
    },
    {
      "key": "timestamp",
      "type": "number",
      "hint": "起始的消息发送时间戳",
      "lable": "请输入时间戳",
    },
    {
      "key": "order",
      "type": "number",
      "hint": "拉取顺序 0:倒序，1:正序",
      "lable": "请输入order",
    },
    {
      "key": "count",
      "type": "number",
      "hint": "要获取的消息数量，0 < count <= 50。",
      "lable": "请输入count",
    },
  ],
  "action": engine_fun.getChatRoomMessages,
};

const addChatRoomEntry = {
  "title": "设置聊天室自定义属性",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "key",
      "type": "String",
      "hint": "",
      "lable": "请输入key",
    },
    {
      "key": "value",
      "type": "String",
      "hint": "",
      "lable": "请输入value",
    },
    {
      "key": "deleteWhenLeft",
      "type": "number",
      "hint": "",
      "lable": "用户掉线或退出时，是否自动删除该 Key、Value 值",
    },
    {
      "key": "overwrite",
      "type": "number",
      "hint": "",
      "lable": "如果当前 key 存在，是否进行覆盖",
    },
  ],
  "action": engine_fun.addChatRoomEntry,
};

const addChatRoomEntries = {
  "title": "批量设置聊天室自定义属性",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
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
    {
      "key": "deleteWhenLeft",
      "type": "number",
      "hint": "",
      "lable": "用户掉线或退出时，是否自动删除该 Key、Value 值",
    },
    {
      "key": "overwrite",
      "type": "number",
      "hint": "",
      "lable": "如果当前 key 存在，是否进行覆盖",
    },
  ],
  "action": engine_fun.addChatRoomEntries,
};

const loadChatRoomEntry = {
  "title": "获取聊天室单个属性",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "key",
      "type": "String",
      "hint": "",
      "lable": "请输入key",
    },
  ],
  "action": engine_fun.getChatRoomEntry,
};

const loadAllChatRoomEntries = {
  "title": "获取聊天室所有属性",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
  ],
  "action": engine_fun.getChatRoomAllEntries,
};

const removeChatRoomEntry = {
  "title": "删除聊天室自定义属性",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "key",
      "type": "String",
      "hint": "",
      "lable": "请输入key",
    },
    {
      "key": "force",
      "type": "number",
      "hint": "",
      "lable": "是否强制删除",
    },
  ],
  "action": engine_fun.removeChatRoomEntry,
};

const removeChatRoomEntries = {
  "title": "批量删除聊天室自定义属性",
  "params": [
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": LableString.editTargetIdString,
    },
    {
      "key": "keys",
      "type": "String",
      "hint": "",
      "lable": "请输入keys",
    },
    {
      "key": "force",
      "type": "number",
      "hint": "",
      "lable": "是否强制删除",
    },
  ],
  "action": engine_fun.removeChatRoomEntries,
};
