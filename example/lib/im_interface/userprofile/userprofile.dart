import '../../auto/engine_auto_funtion.dart' as engine_fun;
import '../function/engine_function.dart' as engine_cus_fun;

const updateMyUserProfileVisibility = {
  "title": "更新用户信息可见性",
  "params": [
    {
      "key": "visibility",
      "type": "number",
      "hint": "0:未设置 1:不可见 2:所有人可见 3:仅好友可见",
      "lable": "可见性",
    },
  ],
  "action": engine_fun.updateMyUserProfileVisibility,
};

const getMyUserProfileVisibility = {
  "title": "获取用户信息可见性",
  "params": [],
  "action": engine_fun.getMyUserProfileVisibility,
};

const updateMyUserProfile = {
  "title": "更新用户信息",
  "params": [
    {"key": "name", "type": "String", "hint": "请输入用户名", "lable": "用户名"},
    {
      "key": "portraitUri",
      "type": "String",
      "hint": "请输入用户头像",
      "lable": "用户头像",
    },
    {"key": "email", "type": "String", "hint": "请输入用户邮箱", "lable": "用户邮箱"},
    {"key": "birthday", "type": "String", "hint": "请输入用户生日", "lable": "用户生日"},
    {
      "key": "gender",
      "type": "number",
      "hint": "请输入用户性别 0:未知 1:男 2:女",
      "lable": "用户性别",
    },
    {"key": "location", "type": "String", "hint": "请输入用户位置", "lable": "用户位置"},
    {"key": "role", "type": "number", "hint": "请输入用户角色", "lable": "用户角色"},
    {"key": "level", "type": "number", "hint": "请输入用户等级", "lable": "用户等级"},
    {
      "key": "userExtProfile",
      "type": "String",
      "hint": "请输入用户扩展信息",
      "lable": "用户扩展信息，格式为{\"ext_key1\":\"1\"}",
    },
  ],
  "action": engine_cus_fun.updateMyUserProfile,
};

const getMyUserProfile = {
  "title": "获取用户信息",
  "params": [],
  "action": engine_fun.getMyUserProfile,
};

const getUserProfiles = {
  "title": "批量获取用户信息",
  "params": [
    {
      "key": "userIds",
      "type": "String",
      "hint": "请输入用户ID，用逗号分隔",
      "lable": "用户ID",
    },
  ],
  "action": engine_fun.getUserProfiles,
};

const searchUserProfileByUniqueId = {
  "title": "搜索用户信息",
  "params": [
    {
      "key": "uniqueId",
      "type": "String",
      "hint": "请输入用户唯一ID",
      "lable": "用户唯一ID",
    },
  ],
  "action": engine_fun.searchUserProfileByUniqueId,
};

const subscribeEvent = {
  "title": "订阅用户信息",
  "params": [
    {
      "key": "subscribeType",
      "type": "number",
      "hint": "请输入订阅类型 0:无效类型 1:在线状态 2:用户信息 3:好友在线状态 4:好友用户信息",
      "lable": "订阅类型,安卓填0=在线状态",
    },
    {"key": "expiry", "type": "number", "hint": "请输入订阅过期时间", "lable": "订阅过期时间"},
    {
      "key": "userIds",
      "type": "String",
      "hint": "请输入用户ID，用逗号分隔",
      "lable": "用户ID",
    },
  ],
  "action": engine_cus_fun.subscribeEvent,
};

const unSubscribeEvent = {
  "title": "取消订阅用户信息",
  "params": [
    {
      "key": "subscribeType",
      "type": "number",
      "hint": "请输入订阅类型 0:无效类型 1:在线状态 2:用户信息 3:好友在线状态 4:好友用户信息",
      "lable": "订阅类型,安卓填0=在线状态",
    },
    {
      "key": "userIds",
      "type": "String",
      "hint": "请输入用户ID，用逗号分隔",
      "lable": "用户ID",
    },
  ],
  "action": engine_cus_fun.unSubscribeEvent,
};

const querySubscribeEvent = {
  "title": "查询订阅用户信息",
  "params": [
    {
      "key": "subscribeType",
      "type": "number",
      "hint": "请输入订阅类型 0:无效类型 1:在线状态 2:用户信息 3:好友在线状态 4:好友用户信息",
      "lable": "订阅类型,安卓填0=在线状态",
    },
    {
      "key": "userIds",
      "type": "String",
      "hint": "请输入用户ID，用逗号分隔",
      "lable": "用户ID",
    },
  ],
  "action": engine_cus_fun.querySubscribeEvent,
};

const querySubscribeEventByPage = {
  "title": "分页查询订阅用户信息",
  "params": [
    {
      "key": "subscribeType",
      "type": "number",
      "hint": "请输入订阅类型 0:无效类型 1:在线状态 2:用户信息 3:好友在线状态 4:好友用户信息",
      "lable": "订阅类型,安卓填0=在线状态",
    },
    {"key": "pageSize", "type": "number", "hint": "请输入每页条数", "lable": "每页条数"},
    {"key": "startIndex", "type": "number", "hint": "请输入起始索引", "lable": "起始索引"},
  ],
  "action": engine_cus_fun.querySubscribeEventByPage,
};
