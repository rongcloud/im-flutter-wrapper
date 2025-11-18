import '../../../strings/hint_string.dart';
import '../../../strings/lable_string.dart';
import '../../auto/engine_auto_funtion.dart' as engine_fun;
import '../function/engine_function.dart' as custom_engine_fun;

const _useCallbackParam = {
  "key": "use_cb",
  "type": "number",
  "hint": HintString.useCallback,
  "lable": LableString.useCallback,
};

const addFriend = {
  "title": "添加好友",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": HintString.friendUserId,
      "lable": LableString.friendUserId
    },
    {
      "key": "friendType",
      "type": "number",
      "hint": HintString.friendType,
      "lable": LableString.friendType
    },
    {
      "key": "extra",
      "type": "String",
      "hint": HintString.friendExtra,
      "lable": LableString.friendExtra
    },
    _useCallbackParam,
  ],
  "action": custom_engine_fun.addFriend,
};

const deleteFriends = {
  "title": "批量删除好友",
  "params": [
    {
      "key": "userIds",
      "type": "String",
      "hint": HintString.friendUserIds,
      "lable": LableString.friendUserIds
    },
    {
      "key": "friendType",
      "type": "number",
      "hint": HintString.friendType,
      "lable": LableString.friendType
    },
    _useCallbackParam,
  ],
  "action": engine_fun.deleteFriends,
};

const acceptFriendApplication = {
  "title": "同意好友申请",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": HintString.friendUserId,
      "lable": LableString.friendUserId
    },
    _useCallbackParam,
  ],
  "action": engine_fun.acceptFriendApplication,
};

const refuseFriendApplication = {
  "title": "拒绝好友申请",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": HintString.friendUserId,
      "lable": LableString.friendUserId
    },
    _useCallbackParam,
  ],
  "action": engine_fun.refuseFriendApplication,
};

const setFriendInfo = {
  "title": "设置好友信息",
  "params": [
    {
      "key": "userId",
      "type": "String",
      "hint": HintString.friendUserId,
      "lable": LableString.friendUserId
    },
    {
      "key": "remark",
      "type": "String",
      "hint": HintString.friendRemark,
      "lable": LableString.friendRemark
    },
    {
      "key": "extFields",
      "type": "String",
      "hint": HintString.friendExtFields,
      "lable": LableString.friendExtFields
    },
    _useCallbackParam,
  ],
  "action": custom_engine_fun.setFriendInfo,
};

const checkFriendsRelation = {
  "title": "检查好友关系",
  "params": [
    {
      "key": "userIds",
      "type": "String",
      "hint": HintString.friendUserIds,
      "lable": LableString.friendUserIds
    },
    {
      "key": "friendType",
      "type": "number",
      "hint": HintString.friendType,
      "lable": LableString.friendType
    },
    _useCallbackParam,
  ],
  "action": engine_fun.checkFriendsRelation,
};

const getFriends = {
  "title": "获取好友列表",
  "params": [
    {
      "key": "friendType",
      "type": "number",
      "hint": HintString.friendType,
      "lable": LableString.friendType
    },
    _useCallbackParam,
  ],
  "action": custom_engine_fun.getFriends,
};

const getFriendApplications = {
  "title": "分页获取好友申请",
  "params": [
    {
      "key": "applicationTypes",
      "type": "String",
      "hint": HintString.friendApplicationType,
      "lable": LableString.friendApplicationType,
    },
    {
      "key": "status",
      "type": "String",
      "hint": HintString.friendApplicationStatus,
      "lable": LableString.friendApplicationStatus
    },
    {
      "key": "pageToken",
      "type": "String",
      "hint": HintString.pageToken,
      "lable": LableString.pageToken
    },
    {
      "key": "count",
      "type": "number",
      "hint": HintString.pageCount,
      "lable": LableString.pageCount
    },
    {
      "key": "order",
      "type": "number",
      "hint": HintString.order,
      "lable": LableString.order
    },
    _useCallbackParam,
  ],
  "action": custom_engine_fun.getFriendApplications,
};

// const deleteFriendApplication = {
//   "title": "删除好友申请",
//   "params": [
//     {
//       "key": "userId",
//       "type": "String",
//       "hint": HintString.friendUserId,
//       "lable": LableString.friendUserId
//     },
//     {
//       "key": "applicationType",
//       "type": "number",
//       "hint": HintString.friendApplicationType,
//       "lable": LableString.friendApplicationType,
//     },
//     {
//       "key": "operationTime",
//       "type": "number",
//       "hint": HintString.operationTime,
//       "lable": LableString.operationTime
//     },
//     _useCallbackParam,
//   ],
//   "action": engine_fun.deleteFriendApplication,
// };

const getFriendsInfo = {
  "title": "根据用户ID获取好友信息",
  "params": [
    {
      "key": "userIds",
      "type": "String",
      "hint": HintString.friendUserIds,
      "lable": LableString.friendUserIds
    },
    _useCallbackParam,
  ],
  "action": engine_fun.getFriendsInfo,
};

const searchFriendsInfo = {
  "title": "搜索好友信息",
  "params": [
    {
      "key": "keyword",
      "type": "String",
      "hint": HintString.friendKeyword,
      "lable": LableString.friendKeyword
    },
    _useCallbackParam,
  ],
  "action": custom_engine_fun.searchFriendsInfo,
};

const setFriendAllowType = {
  "title": "设置加好友权限",
  "params": [
    {
      "key": "allowType",
      "type": "number",
      "hint": HintString.friendAllowType,
      "lable": LableString.friendAllowType
    },
    _useCallbackParam,
  ],
  "action": engine_fun.setFriendAllowType,
};

const getFriendAllowType = {
  "title": "获取加好友权限",
  "params": [_useCallbackParam],
  "action": engine_fun.getFriendAllowType,
};
