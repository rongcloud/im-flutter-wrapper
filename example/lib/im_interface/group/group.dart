import 'package:rongcloud_im_wrapper_plugin_example/strings/hint_string.dart';
import 'package:rongcloud_im_wrapper_plugin_example/strings/lable_string.dart';

import '../function/engine_function.dart' as engine_fun;
import '../../auto/engine_auto_funtion.dart' as engine_auto_fun;

const createGroup = {
  "title": "创建群组",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "群Id"},
    {"key": "groupName", "type": "String", "hint": "", "lable": "群名称"},
    {"key": "portraitUri", "type": "String", "hint": "", "lable": "群头像 URL 地址"},
    {"key": "introduction", "type": "String", "hint": "", "lable": "群简介"},
    {"key": "notice", "type": "String", "hint": "", "lable": "群公告"},
    {
      "key": "extProfile",
      "type": "String",
      "hint": "例子：{\"title\":\"JSON在线解析\"}",
      "lable": "请输入extProfile, JSON 字符串,可以到 https://www.json.cn/ 进行格式检查",
    },
    {
      "key": "joinPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入主动加入群权限权限",
    },
    {
      "key": "removeMemberPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入将群成员移出群组设置权限",
    },
    {
      "key": "invitePermission",
      "type": "number",
      "hint": "",
      "lable": "请输入邀请他人入群权限",
    },
    {
      "key": "inviteHandlePermission",
      "type": "number",
      "hint": "",
      "lable": "请输入被邀请入群权限",
    },
    {
      "key": "groupInfoEditPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入群信息更新权限",
    },
    {
      "key": "memberInfoEditPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入群成员信息更新权限",
    },
    {
      "key": "inviteeUserIds",
      "type": "String",
      "hint": "",
      "lable": "请输入inviteeUserIds",
    },
  ],
  "action": engine_fun.createGroup,
};

const updateGroupInfo = {
  "title": "群组资料设置",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "群Id"},
    {"key": "groupName", "type": "String", "hint": "", "lable": "群名称"},
    {"key": "portraitUri", "type": "String", "hint": "", "lable": "群头像 URL 地址"},
    {"key": "introduction", "type": "String", "hint": "", "lable": "群简介"},
    {"key": "notice", "type": "String", "hint": "", "lable": "群公告"},
    {
      "key": "extProfile",
      "type": "String",
      "hint": "例子：{\"title\":\"JSON在线解析\"}",
      "lable": "请输入extProfile, JSON 字符串,可以到 https://www.json.cn/ 进行格式检查",
    },
    {
      "key": "joinPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入主动加入群权限权限",
    },
    {
      "key": "removeMemberPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入将群成员移出群组设置权限",
    },
    {
      "key": "invitePermission",
      "type": "number",
      "hint": "",
      "lable": "请输入邀请他人入群权限",
    },
    {
      "key": "inviteHandlePermission",
      "type": "number",
      "hint": "",
      "lable": "请输入被邀请入群权限",
    },
    {
      "key": "groupInfoEditPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入群信息更新权限",
    },
    {
      "key": "memberInfoEditPermission",
      "type": "number",
      "hint": "",
      "lable": "请输入群成员信息更新权限",
    },
  ],
  "action": engine_fun.updateGroupInfo,
};

const getGroupsInfo = {
  "title": "批量获取群组资料",
  "params": [
    {"key": "groupIds", "type": "String", "hint": "", "lable": "请输入groupIds"},
  ],
  "action": engine_auto_fun.getGroupsInfo,
};

const kickGroupMembers = {
  "title": "踢出群组",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds"},
    {
      "key": "removeMuteStatus",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeMuteStatus",
    },
    {
      "key": "removeWhiteList",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeWhiteList",
    },
    {
      "key": "removeFollow",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeFollow",
    },
  ],
  "action": engine_fun.kickGroupMembers,
};

const joinGroup = {
  "title": "加入群组",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
  ],
  "action": engine_auto_fun.joinGroup,
};

const quitGroup = {
  "title": "退出群组",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {
      "key": "removeMuteStatus",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeMuteStatus",
    },
    {
      "key": "removeWhiteList",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeWhiteList",
    },
    {
      "key": "removeFollow",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeFollow",
    },
  ],
  "action": engine_fun.quitGroup,
};

const dismissGroup = {
  "title": "解散群组",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
  ],
  "action": engine_auto_fun.dismissGroup,
};

const transferGroupOwner = {
  "title": "转移群主",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {
      "key": "newOwnerId",
      "type": "String",
      "hint": "",
      "lable": "请输入newOwnerId",
    },
    {"key": "quitGroup", "type": "String", "hint": "", "lable": "请输入quitGroup"},
    {
      "key": "removeMuteStatus",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeMuteStatus",
    },
    {
      "key": "removeWhiteList",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeWhiteList",
    },
    {
      "key": "removeFollow",
      "type": "number",
      "hint": "0为不使用 1为使用,默认不填为使用",
      "lable": "请输入removeFollow",
    },
  ],
  "action": engine_fun.transferGroupOwner,
};

const getGroupMembers = {
  "title": "获取指定群成员信息",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds"},
  ],
  "action": engine_auto_fun.getGroupMembers,
};

const getGroupMembersByRole = {
  "title": "分页获取群成员信息",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "role", "type": "String", "hint": "", "lable": "请输入role"},
    {"key": "pageToken", "type": "String", "hint": "", "lable": "请输入pageToken"},
    {"key": "count", "type": "number", "hint": "", "lable": "请输入count"},
    {
      "key": "order",
      "type": "number",
      "hint": "0为倒序 1为正序,默认不填为倒序",
      "lable": "请输入order",
    },
  ],
  "action": engine_fun.getGroupMembersByRole,
};

const getJoinedGroupsByRole = {
  "title": "按角色获取已加入群组的资料",
  "params": [
    {"key": "role", "type": "String", "hint": "", "lable": "请输入role"},
    {"key": "pageToken", "type": "String", "hint": "", "lable": "请输入pageToken"},
    {"key": "count", "type": "number", "hint": "", "lable": "请输入count"},
    {
      "key": "order",
      "type": "number",
      "hint": "0为倒序 1为正序,默认不填为倒序",
      "lable": "请输入order",
    },
  ],
  "action": engine_fun.getJoinedGroupsByRole,
};

const getJoinedGroups = {
  "title": "获取指定已加入群组的资料",
  "params": [
    {"key": "groupIds", "type": "String", "hint": "", "lable": "请输入groupIds"},
  ],
  "action": engine_auto_fun.getJoinedGroups,
};

const setGroupRemark = {
  "title": "设置群组备注名",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "remark", "type": "String", "hint": "", "lable": "请输入remark"},
  ],
  "action": engine_auto_fun.setGroupRemark,
};

const setGroupMemberInfo = {
  "title": "设置群成员信息",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId"},
    {"key": "nickname", "type": "String", "hint": "", "lable": "请输入nickname"},
    {"key": "extra", "type": "String", "hint": "", "lable": "请输入extra"},
  ],
  "action": engine_fun.setGroupMemberInfo,
};

const searchJoinedGroups = {
  "title": "按群名称搜索已加入群组的资料",
  "params": [
    {"key": "groupName", "type": "String", "hint": "", "lable": "请输入groupName"},
    {"key": "pageToken", "type": "String", "hint": "", "lable": "请输入pageToken"},
    {"key": "count", "type": "number", "hint": "", "lable": "请输入count"},
    {
      "key": "order",
      "type": "number",
      "hint": "0为倒序 1为正序,默认不填为倒序",
      "lable": "请输入order",
    },
  ],
  "action": engine_fun.searchJoinedGroups,
};

const searchGroupMembers = {
  "title": "根据群成员昵称分页获取群成员信息",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "name", "type": "String", "hint": "", "lable": "请输入name"},
    {"key": "pageToken", "type": "String", "hint": "", "lable": "请输入pageToken"},
    {"key": "count", "type": "number", "hint": "", "lable": "请输入count"},
    {
      "key": "order",
      "type": "number",
      "hint": "0为倒序 1为正序,默认不填为倒序",
      "lable": "请输入order",
    },
  ],
  "action": engine_fun.searchGroupMembers,
};

const addGroupManagers = {
  "title": "添加群管理员",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds"},
  ],
  "action": engine_auto_fun.addGroupManagers,
};

const removeGroupManagers = {
  "title": "移除群管理员",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds"},
  ],
  "action": engine_auto_fun.removeGroupManagers,
};

const inviteUsersToGroup = {
  "title": "邀请他人加入群组",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds"},
  ],
  "action": engine_auto_fun.inviteUsersToGroup,
};

const acceptGroupInvite = {
  "title": "接受群组邀请",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId"},
  ],
  "action": engine_auto_fun.acceptGroupInvite,
};

const refuseGroupInvite = {
  "title": "拒绝群组邀请",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId"},
    {"key": "reason", "type": "String", "hint": "", "lable": "请输入reason"},
  ],
  "action": engine_auto_fun.refuseGroupInvite,
};

const acceptGroupApplication = {
  "title": "接受群组申请",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId"},
    {
      "key": "applicantId",
      "type": "String",
      "hint": "",
      "lable": "请输入applicantId",
    },
  ],
  "action": engine_fun.acceptGroupApplication,
};

const refuseGroupApplication = {
  "title": "拒绝群组申请",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId"},
    {
      "key": "applicantId",
      "type": "String",
      "hint": "",
      "lable": "请输入applicantId",
    },
    {"key": "reason", "type": "String", "hint": "", "lable": "请输入reason"},
  ],
  "action": engine_auto_fun.refuseGroupApplication,
};

const getGroupApplications = {
  "title": "分页获取群申请列表",
  "params": [
    {"key": "pageToken", "type": "String", "hint": "", "lable": "请输入pageToken"},
    {"key": "count", "type": "number", "hint": "", "lable": "请输入count"},
    {
      "key": "order",
      "type": "number",
      "hint": "0为倒序 1为正序,默认不填为倒序",
      "lable": "请输入order",
    },
    {
      "key": "directions",
      "type": "String",
      "hint": "",
      "lable": "请输入directions",
    },
    {"key": "status", "type": "String", "hint": "", "lable": "请输入status"},
  ],
  "action": engine_fun.getGroupApplications,
};

const addGroupFollows = {
  "title": "添加特别关注群成员",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds"},
  ],
  "action": engine_auto_fun.addGroupFollows,
};

const removeGroupFollows = {
  "title": "移除特别关注群成员",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds"},
  ],
  "action": engine_auto_fun.removeGroupFollows,
};

const getGroupFollows = {
  "title": "查询特别关注群成员",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId"},
  ],
  "action": engine_auto_fun.getGroupFollows,
};
