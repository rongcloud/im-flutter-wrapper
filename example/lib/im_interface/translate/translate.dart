import '../../auto/engine_auto_funtion.dart' as engine_fun;
import '../function/engine_function.dart' as engine_cus_fun;

const translateMessagesWithParams = {
  "title": "批量翻译消息",
  "params": [
    {
      "key": "force",
      "type": "number",
      "hint": "0:不强制 1:强制",
      "lable": "是否强制重新翻译",
    },
    {
      "key": "mode",
      "type": "number",
      "hint": "0:机械翻译 非0:智能翻译",
      "lable": "翻译模式",
    },
    {
      "key": "messageUid",
      "type": "String",
      "hint": "请输入消息 UID，用逗号分隔",
      "lable": "消息 UID",
    },
    {
      "key": "sourceLanguage",
      "type": "String",
      "hint": "请输入源语言，用逗号分隔",
      "lable": "源语言",
    },
    {
      "key": "targetLanguage",
      "type": "String",
      "hint": "请输入目标语言，用逗号分隔",
      "lable": "目标语言",
    },
  ],
  "action": engine_cus_fun.translateMessagesWithParams,
};

const translateTextsWithParams = {
  "title": "翻译文本",
  "params": [
    {
      "key": "mode",
      "type": "number",
      "hint": "0:机械翻译 非0:智能翻译",
      "lable": "翻译模式",
    },
    {"key": "text", "type": "String", "hint": "请输入文本，用逗号分隔", "lable": "文本"},
    {
      "key": "sourceLanguage",
      "type": "String",
      "hint": "请输入源语言，用逗号分隔",
      "lable": "源语言",
    },
    {
      "key": "targetLanguage",
      "type": "String",
      "hint": "请输入目标语言，用逗号分隔",
      "lable": "目标语言",
    },
  ],
  "action": engine_cus_fun.translateTextsWithParams,
};

const setTranslationLanguage = {
  "title": "设置翻译语言",
  "params": [
    {"key": "language", "type": "String", "hint": "请输入语言", "lable": "语言代号"},
  ],
  "action": engine_fun.setTranslationLanguage,
};

const getTranslationLanguage = {
  "title": "获取翻译语言",
  "params": [],
  "action": engine_fun.getTranslationLanguage,
};

const setAutoTranslateEnable = {
  "title": "设置自动翻译开关",
  "params": [
    {
      "key": "isEnable",
      "type": "number",
      "hint": "0:关闭 非0:开启",
      "lable": "是否开启自动翻译",
    },
  ],
  "action": engine_fun.setAutoTranslateEnable,
};

const getAutoTranslateEnabled = {
  "title": "获取自动翻译开关状态",
  "params": [],
  "action": engine_fun.getAutoTranslateEnabled,
};

const batchSetConversationTranslateStrategy = {
  "title": "批量设置会话翻译策略",
  "params": [
    {
      "key": "types",
      "type": "String",
      "hint": "请输入会话类型，用逗号分隔",
      "lable": "会话类型",
    },
    {
      "key": "targetIds",
      "type": "String",
      "hint": "请输入会话ID，用逗号分隔",
      "lable": "会话ID",
    },
    {
      "key": "channelIds",
      "type": "String",
      "hint": "请输入频道ID，用逗号分隔",
      "lable": "频道ID",
    },
    {
      "key": "strategy",
      "type": "number",
      "hint": "0:跟随用户级配置 1:开启自动翻译 2:关闭自动翻译",
      "lable": "翻译策略",
    },
  ],
  "action": engine_cus_fun.batchSetConversationTranslateStrategy,
};
