import '../../auto/engine_auto_funtion.dart' as engine_auto_fun;

const requestSpeechToTextForMessage = {
  "title": "语音转文字请求",
  "params": [
    {"key": "messageUId", "type": "String", "hint": "消息唯一ID", "lable": "消息Id"},
  ],
  "action": engine_auto_fun.requestSpeechToTextForMessage,
};

const setMessageSpeechToTextVisible = {
  "title": "语音转文字可见性设置",
  "params": [
    {"key": "messageId", "type": "number", "hint": "消息本地ID", "lable": "消息Id"},
    {
      "key": "visible",
      "type": "number",
      "hint": "是否可见 0:不可见 非0:可见",
      "lable": "是否可见"
    },
  ],
  "action": engine_auto_fun.setMessageSpeechToTextVisible,
};
