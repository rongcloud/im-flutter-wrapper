import '../function/engine_function.dart' as engine_fun;

const getAllRobots = {
  "title": "获取应用下的所有机器人信息列表",
  "params": [],
  "action": engine_fun.getAllRobots,
};

const getRobotById = {
  "title": "获取单个机器人信息",
  "params": [
    {"key": "robotId", "type": "String", "hint": "", "lable": "请输入robotId"},
  ],
  "action": engine_fun.getRobotById,
};

const getConversationsIncludingRobots = {
  "title": "获取包含机器人的会话列表",
  "params": [
    {
      "key": "conversationTypes",
      "type": "String",
      "hint": "多个类型间使用,分割。仅支持单聊(1)、系统(4)",
      "lable": "请输入conversationTypes",
    },
    {
      "key": "timestamp",
      "type": "number",
      "hint": "默认 0，表示从最新的会话开始获取",
      "lable": "请输入timestamp",
    },
    {"key": "count", "type": "number", "hint": "有效范围 [1, 100]", "lable": "请输入count"},
    {
      "key": "topPriority",
      "type": "number",
      "hint": "0为否 1为是,默认否",
      "lable": "请输入topPriority",
    },
  ],
  "action": engine_fun.getConversationsIncludingRobots,
};
