import '../../auto/engine_auto_funtion.dart' as engine_fun;

const addToBlacklist = {
  "title": "将某个用户加入黑名单",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": "",
      "lable": "请输入用户 ID",
    },
  ],
  "action": engine_fun.addToBlacklist,
};

const removeFromBlacklist = {
  "title": "将某个用户从黑名单中移出",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": "",
      "lable": "请输入用户 ID",
    },
  ],
  "action": engine_fun.removeFromBlacklist,
};

const loadBlacklistStatus = {
  "title": "获取某用户是否在黑名单中",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": "",
      "lable": "请输入用户 ID",
    },
  ],
  "action": engine_fun.getBlacklistStatus,
};

const loadBlacklist = {
  "title": "获取当前用户设置的黑名单列表",
  "action": engine_fun.getBlacklist,
};

const changeNotificationQuietHours = {
  "title": "屏蔽某个时间段的消息提醒",
  "params": [
    {
      "key": "startTime",
      "type": "String",
      "hint": "HH:MM:SS",
      "lable": "请输入开始时间",
    },
    {
      "key": "spanMinutes",
      "type": "String",
      "hint": "0 < spanMinutes < 1440",
      "lable": "请输入需要消息免打扰分钟数",
    },
    {
      "key": "level",
      "type": "String",
      "hint": "",
      "lable":
          "请输入通知级别 \n 0:未设置（向上查询群或者APP级别设置）存量数据中0表示未设置\n 1:群聊超级群仅@消息通知，单聊代表消息不通知 \n 2:消息通知被屏蔽，即不接收消息通知",
    },
  ],
  "action": engine_fun.changeNotificationQuietHours,
};
const removeNotificationQuietHours = {
  "title": "删除已设置的全局时间段消息提醒屏蔽",
  "action": engine_fun.removeNotificationQuietHours,
};

const loadNotificationQuietHours = {
  "title": "查询已设置的时间段消息提醒屏蔽",
  "action": engine_fun.getNotificationQuietHours,
};

const changePushContentShowStatus = {
  "title": "设置是否显示远程推送内容详情",
  "params": [
    {
      "key": "showContent",
      "type": "number",
      "hint": "",
      "lable": "是否显示推送状态",
    },
  ],
  "action": engine_fun.changePushContentShowStatus,
};

const changePushLanguage = {
  "title": "修改推送语言",
  "params": [
    {
      "key": "language",
      "type": "String",
      "hint": "en_us、zh_cn、ar_sa",
      "lable": "请输入推送语言",
    },
  ],
  "action": engine_fun.changePushLanguage,
};

const changePushReceiveStatus = {
  "title": "设置是否接收远程推送",
  "params": [
    {
      "key": "receive",
      "type": "String",
      "hint": "",
      "lable": "是否接收",
    },
  ],
  "action": engine_fun.changePushReceiveStatus,
};

const changeLogLevel = {
  "title": "修改日志级别",
  "params": [
    {
      "key": "level",
      "type": "number",
      "hint": "0 ~ 5",
      "lable": "请输入日志级别",
    },
  ],
  "action": engine_fun.changeLogLevel,
};

const getDeltaTime = {
  "title": "获取时间差",
  "action": engine_fun.getDeltaTime,
};
