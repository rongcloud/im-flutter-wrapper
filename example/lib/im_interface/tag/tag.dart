import '../../auto/engine_auto_funtion.dart' as engine_fun;

const createTag = {
  "title": "createTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "tagName",
      "type": "String",
      "hint": "",
      "lable": "请输入tagName",
    },
  ],
  "action": engine_fun.createTag,
};

const removeTag = {
  "title": "removeTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
  ],
  "action": engine_fun.removeTag,
};

const updateTagNameById = {
  "title": "updateTagNameById",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "newName",
      "type": "String",
      "hint": "",
      "lable": "请输入newName",
    },
  ],
  "action": engine_fun.updateTagNameById,
};

const getTags = {
  "title": "getTags",
  "params": [],
  "action": engine_fun.getTags,
};

const addConversationToTag = {
  "title": "addConversationToTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": "请输入type",
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
  ],
  "action": engine_fun.addConversationToTag,
};

const removeConversationFromTag = {
  "title": "removeConversationFromTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": "请输入type",
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
  ],
  "action": engine_fun.removeConversationFromTag,
};

const removeTagsFromConversation = {
  "title": "removeTagsFromConversation",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": "请输入type",
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
    {
      "key": "tagIds",
      "type": "String",
      "hint": "",
      "lable": "请输入tagIds",
    },
  ],
  "action": engine_fun.removeTagsFromConversation,
};

const getTagsFromConversation = {
  "title": "getTagsFromConversation",
  "params": [
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": "请输入type",
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
  ],
  "action": engine_fun.getTagsFromConversation,
};

const getConversationsFromTagByPage = {
  "title": "getConversationsFromTagByPage",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "timestamp",
      "type": "String",
      "hint": "",
      "lable": "请输入timestamp",
    },
    {
      "key": "count",
      "type": "String",
      "hint": "",
      "lable": "请输入count",
    },
  ],
  "action": engine_fun.getConversationsFromTagByPage,
};

const getUnreadCountByTag = {
  "title": "getUnreadCountByTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "contain",
      "type": "String",
      "hint": "",
      "lable": "请输入contain",
    },
  ],
  "action": engine_fun.getUnreadCountByTag,
};

const changeConversationTopStatusInTag = {
  "title": "changeConversationTopStatusInTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": "请输入type",
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
    {
      "key": "top",
      "type": "String",
      "hint": "",
      "lable": "请输入top",
    },
  ],
  "action": engine_fun.changeConversationTopStatusInTag,
};

const getConversationTopStatusInTag = {
  "title": "getConversationTopStatusInTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "type",
      "type": "String",
      "hint": "",
      "lable": "请输入type",
    },
    {
      "key": "targetId",
      "type": "String",
      "hint": "",
      "lable": "请输入targetId",
    },
  ],
  "action": engine_fun.getConversationTopStatusInTag,
};

const clearMessagesUnreadStatusByTag = {
  "title": "clearMessagesUnreadStatusByTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
  ],
  "action": engine_fun.clearMessagesUnreadStatusByTag,
};

const clearConversationsByTag = {
  "title": "clearConversationsByTag",
  "params": [
    {
      "key": "tagId",
      "type": "String",
      "hint": "",
      "lable": "请输入tagId",
    },
    {
      "key": "deleteMessage",
      "type": "String",
      "hint": "",
      "lable": "请输入deleteMessage",
    },
  ],
  "action": engine_fun.clearConversationsByTag,
};
