import '../../auto/engine_auto_funtion.dart' as engine_fun;
import '../function/engine_function_web.dart' as engine_fun_web;
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';
import 'package:rongcloud_im_wrapper_plugin_example/strings/hint_string.dart';

const loadTotalUnreadCount = {
  "title": "加载所有未读数",
  "params": [],
  "action": engine_fun.getTotalUnreadCount,
};

const loadUnreadCountByConversationTypes = {
  "title": "根据会话类型加载未读数",
  "params": [
    {
      "key": "conversationTypes",
      "type": "String",
      "hint": "多个以英文 , 分割，注：如果包含超级群，那么仅返回超级群会话未读数",
      "lable": LableString.conversationType,
    },
    {
      "key": "contain",
      "type": "String",
      "hint": "0:不包含 1:包含",
      "lable": "是否包含免打扰消息的未读消息数",
    },
  ],
  "action": engine_fun.getUnreadCountByConversationTypes,
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
  ],
  "action": engine_fun_web.clearUnreadCount,
};
