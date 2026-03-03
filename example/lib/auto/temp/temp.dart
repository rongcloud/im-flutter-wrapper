/*

const registerNativeCustomMessage = {
  "title": "registerNativeCustomMessage",
  "params": [
    {"key": "messageIdentifier", "type": "String", "hint": "", "lable": "请输入messageIdentifier",},{"key": "persistentFlag", "type": "String", "hint": "", "lable": "请输入persistentFlag",},
  ],
  "action": engine_fun.registerNativeCustomMessage,
};

const registerNativeCustomMediaMessage = {
  "title": "registerNativeCustomMediaMessage",
  "params": [
    {"key": "messageIdentifier", "type": "String", "hint": "", "lable": "请输入messageIdentifier",},{"key": "persistentFlag", "type": "String", "hint": "", "lable": "请输入persistentFlag",},
  ],
  "action": engine_fun.registerNativeCustomMediaMessage,
};

const connect = {
  "title": "connect",
  "params": [
    {"key": "token", "type": "String", "hint": "", "lable": "请输入token",},{"key": "timeout", "type": "String", "hint": "", "lable": "请输入timeout",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.connect,
};

const disconnect = {
  "title": "disconnect",
  "params": [
    {"key": "receivePush", "type": "String", "hint": "", "lable": "请输入receivePush",},
  ],
  "action": engine_fun.disconnect,
};

const createTextMessage = {
  "title": "createTextMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "text", "type": "String", "hint": "", "lable": "请输入text",},
  ],
  "action": engine_fun.createTextMessage,
};

const createImageMessage = {
  "title": "createImageMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "path", "type": "String", "hint": "", "lable": "请输入path",},
  ],
  "action": engine_fun.createImageMessage,
};

const createFileMessage = {
  "title": "createFileMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "path", "type": "String", "hint": "", "lable": "请输入path",},
  ],
  "action": engine_fun.createFileMessage,
};

const createSightMessage = {
  "title": "createSightMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "path", "type": "String", "hint": "", "lable": "请输入path",},{"key": "duration", "type": "String", "hint": "", "lable": "请输入duration",},
  ],
  "action": engine_fun.createSightMessage,
};

const createVoiceMessage = {
  "title": "createVoiceMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "path", "type": "String", "hint": "", "lable": "请输入path",},{"key": "duration", "type": "String", "hint": "", "lable": "请输入duration",},
  ],
  "action": engine_fun.createVoiceMessage,
};

const createCombineV2Message = {
  "title": "createCombineV2Message",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "conversationType", "type": "String", "hint": "", "lable": "请输入conversationType",},{"key": "summaryList", "type": "String", "hint": "", "lable": "请输入summaryList",},{"key": "nameList", "type": "String", "hint": "", "lable": "请输入nameList",},{"key": "msgList", "type": "String", "hint": "", "lable": "请输入msgList",},
  ],
  "action": engine_fun.createCombineV2Message,
};

const createReferenceMessage = {
  "title": "createReferenceMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "referenceMessage", "type": "String", "hint": "", "lable": "请输入referenceMessage",},{"key": "text", "type": "String", "hint": "", "lable": "请输入text",},
  ],
  "action": engine_fun.createReferenceMessage,
};

const createGIFMessage = {
  "title": "createGIFMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "path", "type": "String", "hint": "", "lable": "请输入path",},
  ],
  "action": engine_fun.createGIFMessage,
};

const createCustomMessage = {
  "title": "createCustomMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "policy", "type": "String", "hint": "", "lable": "请输入policy",},{"key": "messageIdentifier", "type": "String", "hint": "", "lable": "请输入messageIdentifier",},{"key": "fields", "type": "String", "hint": "", "lable": "请输入fields",},
  ],
  "action": engine_fun.createCustomMessage,
};

const createLocationMessage = {
  "title": "createLocationMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "longitude", "type": "String", "hint": "", "lable": "请输入longitude",},{"key": "latitude", "type": "String", "hint": "", "lable": "请输入latitude",},{"key": "poiName", "type": "String", "hint": "", "lable": "请输入poiName",},{"key": "thumbnailPath", "type": "String", "hint": "", "lable": "请输入thumbnailPath",},
  ],
  "action": engine_fun.createLocationMessage,
};

const createNativeCustomMessage = {
  "title": "createNativeCustomMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageIdentifier", "type": "String", "hint": "", "lable": "请输入messageIdentifier",},{"key": "fields", "type": "String", "hint": "", "lable": "请输入fields",},
  ],
  "action": engine_fun.createNativeCustomMessage,
};

const createNativeCustomMediaMessage = {
  "title": "createNativeCustomMediaMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageIdentifier", "type": "String", "hint": "", "lable": "请输入messageIdentifier",},{"key": "path", "type": "String", "hint": "", "lable": "请输入path",},{"key": "fields", "type": "String", "hint": "", "lable": "请输入fields",},
  ],
  "action": engine_fun.createNativeCustomMediaMessage,
};

const sendMessage = {
  "title": "sendMessage",
  "params": [
    {"key": "message", "type": "String", "hint": "", "lable": "请输入message",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.sendMessage,
};

const sendMediaMessage = {
  "title": "sendMediaMessage",
  "params": [
    {"key": "message", "type": "String", "hint": "", "lable": "请输入message",},{"key": "listener", "type": "String", "hint": "", "lable": "请输入listener",},
  ],
  "action": engine_fun.sendMediaMessage,
};

const loadConversation = {
  "title": "loadConversation",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadConversation,
};

const getConversation = {
  "title": "getConversation",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversation,
};

const loadConversations = {
  "title": "loadConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},
  ],
  "action": engine_fun.loadConversations,
};

const getConversations = {
  "title": "getConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversations,
};

const getConversationsWithPriority = {
  "title": "getConversationsWithPriority",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "topPriority", "type": "String", "hint": "", "lable": "请输入topPriority",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversationsWithPriority,
};

const getUnreadConversations = {
  "title": "getUnreadConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadConversations,
};

const getRemoteConversationList = {
  "title": "getRemoteConversationList",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getRemoteConversationList,
};

const removeConversationWithDeleteRemote = {
  "title": "removeConversationWithDeleteRemote",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "deleteRemote", "type": "String", "hint": "", "lable": "请输入deleteRemote",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeConversationWithDeleteRemote,
};

const removeConversation = {
  "title": "removeConversation",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeConversation,
};

const removeConversations = {
  "title": "removeConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeConversations,
};

const loadUnreadCount = {
  "title": "loadUnreadCount",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadUnreadCount,
};

const getUnreadCount = {
  "title": "getUnreadCount",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadCount,
};

const loadTotalUnreadCount = {
  "title": "loadTotalUnreadCount",
  "params": [
    {"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadTotalUnreadCount,
};

const getTotalUnreadCount = {
  "title": "getTotalUnreadCount",
  "params": [
    {"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getTotalUnreadCount,
};

const loadUnreadMentionedCount = {
  "title": "loadUnreadMentionedCount",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadUnreadMentionedCount,
};

const getUnreadMentionedCount = {
  "title": "getUnreadMentionedCount",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadMentionedCount,
};

const loadUltraGroupAllUnreadCount = {
  "title": "loadUltraGroupAllUnreadCount",
  "params": [
    
  ],
  "action": engine_fun.loadUltraGroupAllUnreadCount,
};

const getUltraGroupAllUnreadCount = {
  "title": "getUltraGroupAllUnreadCount",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUltraGroupAllUnreadCount,
};

const loadUltraGroupAllUnreadMentionedCount = {
  "title": "loadUltraGroupAllUnreadMentionedCount",
  "params": [
    
  ],
  "action": engine_fun.loadUltraGroupAllUnreadMentionedCount,
};

const getUltraGroupAllUnreadMentionedCount = {
  "title": "getUltraGroupAllUnreadMentionedCount",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUltraGroupAllUnreadMentionedCount,
};

const loadUltraGroupUnreadCount = {
  "title": "loadUltraGroupUnreadCount",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},
  ],
  "action": engine_fun.loadUltraGroupUnreadCount,
};

const getUltraGroupUnreadCount = {
  "title": "getUltraGroupUnreadCount",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUltraGroupUnreadCount,
};

const loadUltraGroupUnreadMentionedCount = {
  "title": "loadUltraGroupUnreadMentionedCount",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},
  ],
  "action": engine_fun.loadUltraGroupUnreadMentionedCount,
};

const getUltraGroupUnreadMentionedCount = {
  "title": "getUltraGroupUnreadMentionedCount",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUltraGroupUnreadMentionedCount,
};

const loadUnreadCountByConversationTypes = {
  "title": "loadUnreadCountByConversationTypes",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "contain", "type": "String", "hint": "", "lable": "请输入contain",},
  ],
  "action": engine_fun.loadUnreadCountByConversationTypes,
};

const getUnreadCountByConversationTypes = {
  "title": "getUnreadCountByConversationTypes",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "contain", "type": "String", "hint": "", "lable": "请输入contain",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadCountByConversationTypes,
};

const getUnreadCountByLevels = {
  "title": "getUnreadCountByLevels",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "levels", "type": "String", "hint": "", "lable": "请输入levels",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadCountByLevels,
};

const clearUnreadCount = {
  "title": "clearUnreadCount",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.clearUnreadCount,
};

const saveDraftMessage = {
  "title": "saveDraftMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "draft", "type": "String", "hint": "", "lable": "请输入draft",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.saveDraftMessage,
};

const loadDraftMessage = {
  "title": "loadDraftMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadDraftMessage,
};

const getDraftMessage = {
  "title": "getDraftMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getDraftMessage,
};

const clearDraftMessage = {
  "title": "clearDraftMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.clearDraftMessage,
};

const loadBlockedConversations = {
  "title": "loadBlockedConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadBlockedConversations,
};

const getBlockedConversations = {
  "title": "getBlockedConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getBlockedConversations,
};

const changeConversationTopStatus = {
  "title": "changeConversationTopStatus",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "top", "type": "String", "hint": "", "lable": "请输入top",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeConversationTopStatus,
};

const changeConversationTopStatusWithUpdateTme = {
  "title": "changeConversationTopStatusWithUpdateTme",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "top", "type": "String", "hint": "", "lable": "请输入top",},{"key": "updateOperationTime", "type": "String", "hint": "", "lable": "请输入updateOperationTime",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeConversationTopStatusWithUpdateTme,
};

const loadConversationTopStatus = {
  "title": "loadConversationTopStatus",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadConversationTopStatus,
};

const getConversationTopStatus = {
  "title": "getConversationTopStatus",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversationTopStatus,
};

const syncConversationReadStatus = {
  "title": "syncConversationReadStatus",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.syncConversationReadStatus,
};

const sendTypingStatus = {
  "title": "sendTypingStatus",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "currentType", "type": "String", "hint": "", "lable": "请输入currentType",},
  ],
  "action": engine_fun.sendTypingStatus,
};

const loadMessages = {
  "title": "loadMessages",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "sentTime", "type": "String", "hint": "", "lable": "请输入sentTime",},{"key": "order", "type": "String", "hint": "", "lable": "请输入order",},{"key": "policy", "type": "String", "hint": "", "lable": "请输入policy",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},
  ],
  "action": engine_fun.loadMessages,
};

const getMessages = {
  "title": "getMessages",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "sentTime", "type": "String", "hint": "", "lable": "请输入sentTime",},{"key": "order", "type": "String", "hint": "", "lable": "请输入order",},{"key": "policy", "type": "String", "hint": "", "lable": "请输入policy",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getMessages,
};

const getMessagesAroundTime = {
  "title": "getMessagesAroundTime",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "sentTime", "type": "String", "hint": "", "lable": "请输入sentTime",},{"key": "beforeCount", "type": "String", "hint": "", "lable": "请输入beforeCount",},{"key": "afterCount", "type": "String", "hint": "", "lable": "请输入afterCount",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getMessagesAroundTime,
};

const getLocalMessagesByMessageTypes = {
  "title": "getLocalMessagesByMessageTypes",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageTypes", "type": "String", "hint": "", "lable": "请输入messageTypes",},{"key": "sentTime", "type": "String", "hint": "", "lable": "请输入sentTime",},{"key": "order", "type": "String", "hint": "", "lable": "请输入order",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getLocalMessagesByMessageTypes,
};

const loadFirstUnreadMessage = {
  "title": "loadFirstUnreadMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadFirstUnreadMessage,
};

const getFirstUnreadMessage = {
  "title": "getFirstUnreadMessage",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getFirstUnreadMessage,
};

const loadUnreadMentionedMessages = {
  "title": "loadUnreadMentionedMessages",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadUnreadMentionedMessages,
};

const getUnreadMentionedMessages = {
  "title": "getUnreadMentionedMessages",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadMentionedMessages,
};

const clearMessages = {
  "title": "clearMessages",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "policy", "type": "String", "hint": "", "lable": "请输入policy",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.clearMessages,
};

const deleteLocalMessageByIds = {
  "title": "deleteLocalMessageByIds",
  "params": [
    {"key": "messageIds", "type": "String", "hint": "", "lable": "请输入messageIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.deleteLocalMessageByIds,
};

const sendPrivateReadReceiptMessage = {
  "title": "sendPrivateReadReceiptMessage",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.sendPrivateReadReceiptMessage,
};

const updateMessageExpansion = {
  "title": "updateMessageExpansion",
  "params": [
    {"key": "messageUId", "type": "String", "hint": "", "lable": "请输入messageUId",},{"key": "expansion", "type": "String", "hint": "", "lable": "请输入expansion",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.updateMessageExpansion,
};

const removeMessageExpansionForKeys = {
  "title": "removeMessageExpansionForKeys",
  "params": [
    {"key": "messageUId", "type": "String", "hint": "", "lable": "请输入messageUId",},{"key": "keys", "type": "String", "hint": "", "lable": "请输入keys",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeMessageExpansionForKeys,
};

const changeMessageSentStatus = {
  "title": "changeMessageSentStatus",
  "params": [
    {"key": "messageId", "type": "String", "hint": "", "lable": "请输入messageId",},{"key": "sentStatus", "type": "String", "hint": "", "lable": "请输入sentStatus",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeMessageSentStatus,
};

const changeMessageReceiveStatus = {
  "title": "changeMessageReceiveStatus",
  "params": [
    {"key": "messageId", "type": "String", "hint": "", "lable": "请输入messageId",},{"key": "receivedStatus", "type": "String", "hint": "", "lable": "请输入receivedStatus",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeMessageReceiveStatus,
};

const changeMessageReceiveStatusInfo = {
  "title": "changeMessageReceiveStatusInfo",
  "params": [
    {"key": "messageId", "type": "String", "hint": "", "lable": "请输入messageId",},{"key": "receivedStatusInfo", "type": "String", "hint": "", "lable": "请输入receivedStatusInfo",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeMessageReceiveStatusInfo,
};

const updateMessageLocalExtra = {
  "title": "updateMessageLocalExtra",
  "params": [
    {"key": "messageId", "type": "String", "hint": "", "lable": "请输入messageId",},{"key": "extra", "type": "String", "hint": "", "lable": "请输入extra",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.updateMessageLocalExtra,
};

const joinChatRoom = {
  "title": "joinChatRoom",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "messageCount", "type": "String", "hint": "", "lable": "请输入messageCount",},{"key": "autoCreate", "type": "String", "hint": "", "lable": "请输入autoCreate",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.joinChatRoom,
};

const leaveChatRoom = {
  "title": "leaveChatRoom",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.leaveChatRoom,
};

const loadChatRoomMessages = {
  "title": "loadChatRoomMessages",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "order", "type": "String", "hint": "", "lable": "请输入order",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},
  ],
  "action": engine_fun.loadChatRoomMessages,
};

const getChatRoomMessages = {
  "title": "getChatRoomMessages",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "order", "type": "String", "hint": "", "lable": "请输入order",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getChatRoomMessages,
};

const addChatRoomEntry = {
  "title": "addChatRoomEntry",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "key", "type": "String", "hint": "", "lable": "请输入key",},{"key": "value", "type": "String", "hint": "", "lable": "请输入value",},{"key": "deleteWhenLeft", "type": "String", "hint": "", "lable": "请输入deleteWhenLeft",},{"key": "overwrite", "type": "String", "hint": "", "lable": "请输入overwrite",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.addChatRoomEntry,
};

const addChatRoomEntries = {
  "title": "addChatRoomEntries",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "entries", "type": "String", "hint": "", "lable": "请输入entries",},{"key": "deleteWhenLeft", "type": "String", "hint": "", "lable": "请输入deleteWhenLeft",},{"key": "overwrite", "type": "String", "hint": "", "lable": "请输入overwrite",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.addChatRoomEntries,
};

const loadChatRoomEntry = {
  "title": "loadChatRoomEntry",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "key", "type": "String", "hint": "", "lable": "请输入key",},
  ],
  "action": engine_fun.loadChatRoomEntry,
};

const getChatRoomEntry = {
  "title": "getChatRoomEntry",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "key", "type": "String", "hint": "", "lable": "请输入key",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getChatRoomEntry,
};

const loadChatRoomAllEntries = {
  "title": "loadChatRoomAllEntries",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},
  ],
  "action": engine_fun.loadChatRoomAllEntries,
};

const getChatRoomAllEntries = {
  "title": "getChatRoomAllEntries",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getChatRoomAllEntries,
};

const removeChatRoomEntry = {
  "title": "removeChatRoomEntry",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "key", "type": "String", "hint": "", "lable": "请输入key",},{"key": "force", "type": "String", "hint": "", "lable": "请输入force",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeChatRoomEntry,
};

const removeChatRoomEntries = {
  "title": "removeChatRoomEntries",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "keys", "type": "String", "hint": "", "lable": "请输入keys",},{"key": "force", "type": "String", "hint": "", "lable": "请输入force",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeChatRoomEntries,
};

const addToBlacklist = {
  "title": "addToBlacklist",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.addToBlacklist,
};

const removeFromBlacklist = {
  "title": "removeFromBlacklist",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeFromBlacklist,
};

const loadBlacklistStatus = {
  "title": "loadBlacklistStatus",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},
  ],
  "action": engine_fun.loadBlacklistStatus,
};

const getBlacklistStatus = {
  "title": "getBlacklistStatus",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getBlacklistStatus,
};

const loadBlacklist = {
  "title": "loadBlacklist",
  "params": [
    
  ],
  "action": engine_fun.loadBlacklist,
};

const getBlacklist = {
  "title": "getBlacklist",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getBlacklist,
};

const searchMessages = {
  "title": "searchMessages",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "keyword", "type": "String", "hint": "", "lable": "请输入keyword",},{"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchMessages,
};

const searchMessagesByTimeRange = {
  "title": "searchMessagesByTimeRange",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "keyword", "type": "String", "hint": "", "lable": "请输入keyword",},{"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "endTime", "type": "String", "hint": "", "lable": "请输入endTime",},{"key": "offset", "type": "String", "hint": "", "lable": "请输入offset",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchMessagesByTimeRange,
};

const searchMessagesByUserId = {
  "title": "searchMessagesByUserId",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchMessagesByUserId,
};

const searchMessagesByMessageTypes = {
  "title": "searchMessagesByMessageTypes",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageTypes", "type": "String", "hint": "", "lable": "请输入messageTypes",},{"key": "keyword", "type": "String", "hint": "", "lable": "请输入keyword",},{"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchMessagesByMessageTypes,
};

const searchConversations = {
  "title": "searchConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageTypes", "type": "String", "hint": "", "lable": "请输入messageTypes",},{"key": "keyword", "type": "String", "hint": "", "lable": "请输入keyword",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchConversations,
};

const changeNotificationQuietHours = {
  "title": "changeNotificationQuietHours",
  "params": [
    {"key": "startTime", "type": "String", "hint": "", "lable": "请输入startTime",},{"key": "spanMinutes", "type": "String", "hint": "", "lable": "请输入spanMinutes",},{"key": "level", "type": "String", "hint": "", "lable": "请输入level",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeNotificationQuietHours,
};

const removeNotificationQuietHours = {
  "title": "removeNotificationQuietHours",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeNotificationQuietHours,
};

const loadNotificationQuietHours = {
  "title": "loadNotificationQuietHours",
  "params": [
    
  ],
  "action": engine_fun.loadNotificationQuietHours,
};

const getNotificationQuietHours = {
  "title": "getNotificationQuietHours",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getNotificationQuietHours,
};

const changeConversationNotificationLevel = {
  "title": "changeConversationNotificationLevel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "level", "type": "String", "hint": "", "lable": "请输入level",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeConversationNotificationLevel,
};

const loadConversationNotificationLevel = {
  "title": "loadConversationNotificationLevel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadConversationNotificationLevel,
};

const getConversationNotificationLevel = {
  "title": "getConversationNotificationLevel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversationNotificationLevel,
};

const changeConversationTypeNotificationLevel = {
  "title": "changeConversationTypeNotificationLevel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "level", "type": "String", "hint": "", "lable": "请输入level",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeConversationTypeNotificationLevel,
};

const loadConversationTypeNotificationLevel = {
  "title": "loadConversationTypeNotificationLevel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},
  ],
  "action": engine_fun.loadConversationTypeNotificationLevel,
};

const getConversationTypeNotificationLevel = {
  "title": "getConversationTypeNotificationLevel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversationTypeNotificationLevel,
};

const changeUltraGroupDefaultNotificationLevel = {
  "title": "changeUltraGroupDefaultNotificationLevel",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "level", "type": "String", "hint": "", "lable": "请输入level",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeUltraGroupDefaultNotificationLevel,
};

const loadUltraGroupDefaultNotificationLevel = {
  "title": "loadUltraGroupDefaultNotificationLevel",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},
  ],
  "action": engine_fun.loadUltraGroupDefaultNotificationLevel,
};

const getUltraGroupDefaultNotificationLevel = {
  "title": "getUltraGroupDefaultNotificationLevel",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUltraGroupDefaultNotificationLevel,
};

const changeUltraGroupChannelDefaultNotificationLevel = {
  "title": "changeUltraGroupChannelDefaultNotificationLevel",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "level", "type": "String", "hint": "", "lable": "请输入level",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeUltraGroupChannelDefaultNotificationLevel,
};

const loadUltraGroupChannelDefaultNotificationLevel = {
  "title": "loadUltraGroupChannelDefaultNotificationLevel",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadUltraGroupChannelDefaultNotificationLevel,
};

const getUltraGroupChannelDefaultNotificationLevel = {
  "title": "getUltraGroupChannelDefaultNotificationLevel",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUltraGroupChannelDefaultNotificationLevel,
};

const changePushContentShowStatus = {
  "title": "changePushContentShowStatus",
  "params": [
    {"key": "showContent", "type": "String", "hint": "", "lable": "请输入showContent",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changePushContentShowStatus,
};

const changePushLanguage = {
  "title": "changePushLanguage",
  "params": [
    {"key": "language", "type": "String", "hint": "", "lable": "请输入language",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changePushLanguage,
};

const changePushReceiveStatus = {
  "title": "changePushReceiveStatus",
  "params": [
    {"key": "receive", "type": "String", "hint": "", "lable": "请输入receive",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changePushReceiveStatus,
};

const loadMessageCount = {
  "title": "loadMessageCount",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadMessageCount,
};

const getMessageCount = {
  "title": "getMessageCount",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getMessageCount,
};

const loadTopConversations = {
  "title": "loadTopConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},
  ],
  "action": engine_fun.loadTopConversations,
};

const getTopConversations = {
  "title": "getTopConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getTopConversations,
};

const syncUltraGroupReadStatus = {
  "title": "syncUltraGroupReadStatus",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.syncUltraGroupReadStatus,
};

const loadConversationsForAllChannel = {
  "title": "loadConversationsForAllChannel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},
  ],
  "action": engine_fun.loadConversationsForAllChannel,
};

const getConversationsForAllChannel = {
  "title": "getConversationsForAllChannel",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversationsForAllChannel,
};

const clearUltraGroupMessages = {
  "title": "clearUltraGroupMessages",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "policy", "type": "String", "hint": "", "lable": "请输入policy",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.clearUltraGroupMessages,
};

const sendUltraGroupTypingStatus = {
  "title": "sendUltraGroupTypingStatus",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "typingStatus", "type": "String", "hint": "", "lable": "请输入typingStatus",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.sendUltraGroupTypingStatus,
};

const clearUltraGroupMessagesForAllChannel = {
  "title": "clearUltraGroupMessagesForAllChannel",
  "params": [
    {"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.clearUltraGroupMessagesForAllChannel,
};

const getBatchRemoteUltraGroupMessages = {
  "title": "getBatchRemoteUltraGroupMessages",
  "params": [
    {"key": "messages", "type": "String", "hint": "", "lable": "请输入messages",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getBatchRemoteUltraGroupMessages,
};

const updateUltraGroupMessageExpansion = {
  "title": "updateUltraGroupMessageExpansion",
  "params": [
    {"key": "messageUId", "type": "String", "hint": "", "lable": "请输入messageUId",},{"key": "expansion", "type": "String", "hint": "", "lable": "请输入expansion",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.updateUltraGroupMessageExpansion,
};

const removeUltraGroupMessageExpansionForKeys = {
  "title": "removeUltraGroupMessageExpansionForKeys",
  "params": [
    {"key": "messageUId", "type": "String", "hint": "", "lable": "请输入messageUId",},{"key": "keys", "type": "String", "hint": "", "lable": "请输入keys",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeUltraGroupMessageExpansionForKeys,
};

const changeLogLevel = {
  "title": "changeLogLevel",
  "params": [
    {"key": "level", "type": "String", "hint": "", "lable": "请输入level",},
  ],
  "action": engine_fun.changeLogLevel,
};

const getDeltaTime = {
  "title": "getDeltaTime",
  "params": [
    
  ],
  "action": engine_fun.getDeltaTime,
};

const getAppSettings = {
  "title": "getAppSettings",
  "params": [
    
  ],
  "action": engine_fun.getAppSettings,
};

const createTag = {
  "title": "createTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "tagName", "type": "String", "hint": "", "lable": "请输入tagName",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.createTag,
};

const removeTag = {
  "title": "removeTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeTag,
};

const updateTagNameById = {
  "title": "updateTagNameById",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "newName", "type": "String", "hint": "", "lable": "请输入newName",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.updateTagNameById,
};

const getTags = {
  "title": "getTags",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getTags,
};

const addConversationToTag = {
  "title": "addConversationToTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.addConversationToTag,
};

const removeConversationFromTag = {
  "title": "removeConversationFromTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeConversationFromTag,
};

const removeTagsFromConversation = {
  "title": "removeTagsFromConversation",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "tagIds", "type": "String", "hint": "", "lable": "请输入tagIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeTagsFromConversation,
};

const getTagsFromConversation = {
  "title": "getTagsFromConversation",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getTagsFromConversation,
};

const getConversationsFromTagByPage = {
  "title": "getConversationsFromTagByPage",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "timestamp", "type": "String", "hint": "", "lable": "请输入timestamp",},{"key": "count", "type": "String", "hint": "", "lable": "请输入count",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversationsFromTagByPage,
};

const getUnreadCountByTag = {
  "title": "getUnreadCountByTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "contain", "type": "String", "hint": "", "lable": "请输入contain",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadCountByTag,
};

const changeConversationTopStatusInTag = {
  "title": "changeConversationTopStatusInTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "top", "type": "String", "hint": "", "lable": "请输入top",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.changeConversationTopStatusInTag,
};

const getConversationTopStatusInTag = {
  "title": "getConversationTopStatusInTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getConversationTopStatusInTag,
};

const clearMessagesUnreadStatusByTag = {
  "title": "clearMessagesUnreadStatusByTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.clearMessagesUnreadStatusByTag,
};

const clearConversationsByTag = {
  "title": "clearConversationsByTag",
  "params": [
    {"key": "tagId", "type": "String", "hint": "", "lable": "请输入tagId",},{"key": "deleteMessage", "type": "String", "hint": "", "lable": "请输入deleteMessage",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.clearConversationsByTag,
};

const setModuleName = {
  "title": "setModuleName",
  "params": [
    {"key": "moduleName", "type": "String", "hint": "", "lable": "请输入moduleName",},{"key": "version", "type": "String", "hint": "", "lable": "请输入version",},
  ],
  "action": engine_fun.setModuleName,
};

const writeLog = {
  "title": "writeLog",
  "params": [
    {"key": "method", "type": "String", "hint": "", "lable": "请输入method",},{"key": "callMethod", "type": "String", "hint": "", "lable": "请输入callMethod",},{"key": "codeValue", "type": "String", "hint": "", "lable": "请输入codeValue",},{"key": "message", "type": "String", "hint": "", "lable": "请输入message",},
  ],
  "action": engine_fun.writeLog,
};

const getGroupsInfo = {
  "title": "getGroupsInfo",
  "params": [
    {"key": "groupIds", "type": "String", "hint": "", "lable": "请输入groupIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getGroupsInfo,
};

const joinGroup = {
  "title": "joinGroup",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.joinGroup,
};

const quitGroup = {
  "title": "quitGroup",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "config", "type": "String", "hint": "", "lable": "请输入config",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.quitGroup,
};

const dismissGroup = {
  "title": "dismissGroup",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.dismissGroup,
};

const transferGroupOwner = {
  "title": "transferGroupOwner",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "newOwnerId", "type": "String", "hint": "", "lable": "请输入newOwnerId",},{"key": "quitGroup", "type": "String", "hint": "", "lable": "请输入quitGroup",},{"key": "config", "type": "String", "hint": "", "lable": "请输入config",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.transferGroupOwner,
};

const getGroupMembers = {
  "title": "getGroupMembers",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getGroupMembers,
};

const getGroupMembersByRole = {
  "title": "getGroupMembersByRole",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "role", "type": "String", "hint": "", "lable": "请输入role",},{"key": "option", "type": "String", "hint": "", "lable": "请输入option",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getGroupMembersByRole,
};

const getJoinedGroupsByRole = {
  "title": "getJoinedGroupsByRole",
  "params": [
    {"key": "role", "type": "String", "hint": "", "lable": "请输入role",},{"key": "option", "type": "String", "hint": "", "lable": "请输入option",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getJoinedGroupsByRole,
};

const getJoinedGroups = {
  "title": "getJoinedGroups",
  "params": [
    {"key": "groupIds", "type": "String", "hint": "", "lable": "请输入groupIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getJoinedGroups,
};

const setGroupRemark = {
  "title": "setGroupRemark",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "remark", "type": "String", "hint": "", "lable": "请输入remark",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.setGroupRemark,
};

const setGroupMemberInfo = {
  "title": "setGroupMemberInfo",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "nickname", "type": "String", "hint": "", "lable": "请输入nickname",},{"key": "extra", "type": "String", "hint": "", "lable": "请输入extra",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.setGroupMemberInfo,
};

const searchJoinedGroups = {
  "title": "searchJoinedGroups",
  "params": [
    {"key": "groupName", "type": "String", "hint": "", "lable": "请输入groupName",},{"key": "option", "type": "String", "hint": "", "lable": "请输入option",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchJoinedGroups,
};

const searchGroupMembers = {
  "title": "searchGroupMembers",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "name", "type": "String", "hint": "", "lable": "请输入name",},{"key": "option", "type": "String", "hint": "", "lable": "请输入option",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchGroupMembers,
};

const addGroupManagers = {
  "title": "addGroupManagers",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.addGroupManagers,
};

const removeGroupManagers = {
  "title": "removeGroupManagers",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeGroupManagers,
};

const inviteUsersToGroup = {
  "title": "inviteUsersToGroup",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.inviteUsersToGroup,
};

const acceptGroupInvite = {
  "title": "acceptGroupInvite",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.acceptGroupInvite,
};

const refuseGroupInvite = {
  "title": "refuseGroupInvite",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId",},{"key": "reason", "type": "String", "hint": "", "lable": "请输入reason",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.refuseGroupInvite,
};

const acceptGroupApplication = {
  "title": "acceptGroupApplication",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId",},{"key": "applicantId", "type": "String", "hint": "", "lable": "请输入applicantId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.acceptGroupApplication,
};

const refuseGroupApplication = {
  "title": "refuseGroupApplication",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "inviterId", "type": "String", "hint": "", "lable": "请输入inviterId",},{"key": "applicantId", "type": "String", "hint": "", "lable": "请输入applicantId",},{"key": "reason", "type": "String", "hint": "", "lable": "请输入reason",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.refuseGroupApplication,
};

const getGroupApplications = {
  "title": "getGroupApplications",
  "params": [
    {"key": "option", "type": "String", "hint": "", "lable": "请输入option",},{"key": "directions", "type": "String", "hint": "", "lable": "请输入directions",},{"key": "status", "type": "String", "hint": "", "lable": "请输入status",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getGroupApplications,
};

const addGroupFollows = {
  "title": "addGroupFollows",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.addGroupFollows,
};

const removeGroupFollows = {
  "title": "removeGroupFollows",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.removeGroupFollows,
};

const getGroupFollows = {
  "title": "getGroupFollows",
  "params": [
    {"key": "groupId", "type": "String", "hint": "", "lable": "请输入groupId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getGroupFollows,
};

const setCheckChatRoomDuplicateMessage = {
  "title": "setCheckChatRoomDuplicateMessage",
  "params": [
    {"key": "enableCheck", "type": "String", "hint": "", "lable": "请输入enableCheck",},
  ],
  "action": engine_fun.setCheckChatRoomDuplicateMessage,
};

const translateMessagesWithParams = {
  "title": "translateMessagesWithParams",
  "params": [
    {"key": "params", "type": "String", "hint": "", "lable": "请输入params",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.translateMessagesWithParams,
};

const translateTextsWithParams = {
  "title": "translateTextsWithParams",
  "params": [
    {"key": "params", "type": "String", "hint": "", "lable": "请输入params",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.translateTextsWithParams,
};

const setTranslationLanguage = {
  "title": "setTranslationLanguage",
  "params": [
    {"key": "language", "type": "String", "hint": "", "lable": "请输入language",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.setTranslationLanguage,
};

const getTranslationLanguage = {
  "title": "getTranslationLanguage",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getTranslationLanguage,
};

const setAutoTranslateEnable = {
  "title": "setAutoTranslateEnable",
  "params": [
    {"key": "isEnable", "type": "String", "hint": "", "lable": "请输入isEnable",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.setAutoTranslateEnable,
};

const getAutoTranslateEnabled = {
  "title": "getAutoTranslateEnabled",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getAutoTranslateEnabled,
};

const batchSetConversationTranslateStrategy = {
  "title": "batchSetConversationTranslateStrategy",
  "params": [
    {"key": "types", "type": "String", "hint": "", "lable": "请输入types",},{"key": "targetIds", "type": "String", "hint": "", "lable": "请输入targetIds",},{"key": "channelIds", "type": "String", "hint": "", "lable": "请输入channelIds",},{"key": "strategy", "type": "String", "hint": "", "lable": "请输入strategy",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.batchSetConversationTranslateStrategy,
};

const calculateTextMD5 = {
  "title": "calculateTextMD5",
  "params": [
    {"key": "text", "type": "String", "hint": "", "lable": "请输入text",},
  ],
  "action": engine_fun.calculateTextMD5,
};

const updateMyUserProfileVisibility = {
  "title": "updateMyUserProfileVisibility",
  "params": [
    {"key": "visibility", "type": "String", "hint": "", "lable": "请输入visibility",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.updateMyUserProfileVisibility,
};

const getMyUserProfileVisibility = {
  "title": "getMyUserProfileVisibility",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getMyUserProfileVisibility,
};

const updateMyUserProfile = {
  "title": "updateMyUserProfile",
  "params": [
    {"key": "profile", "type": "String", "hint": "", "lable": "请输入profile",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.updateMyUserProfile,
};

const getMyUserProfile = {
  "title": "getMyUserProfile",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getMyUserProfile,
};

const getUserProfiles = {
  "title": "getUserProfiles",
  "params": [
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUserProfiles,
};

const searchUserProfileByUniqueId = {
  "title": "searchUserProfileByUniqueId",
  "params": [
    {"key": "uniqueId", "type": "String", "hint": "", "lable": "请输入uniqueId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchUserProfileByUniqueId,
};

const subscribeEvent = {
  "title": "subscribeEvent",
  "params": [
    {"key": "request", "type": "String", "hint": "", "lable": "请输入request",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.subscribeEvent,
};

const unSubscribeEvent = {
  "title": "unSubscribeEvent",
  "params": [
    {"key": "request", "type": "String", "hint": "", "lable": "请输入request",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.unSubscribeEvent,
};

const querySubscribeEvent = {
  "title": "querySubscribeEvent",
  "params": [
    {"key": "request", "type": "String", "hint": "", "lable": "请输入request",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.querySubscribeEvent,
};

const querySubscribeEventByPage = {
  "title": "querySubscribeEventByPage",
  "params": [
    {"key": "request", "type": "String", "hint": "", "lable": "请输入request",},{"key": "pageSize", "type": "String", "hint": "", "lable": "请输入pageSize",},{"key": "startIndex", "type": "String", "hint": "", "lable": "请输入startIndex",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.querySubscribeEventByPage,
};

const requestSpeechToTextForMessage = {
  "title": "requestSpeechToTextForMessage",
  "params": [
    {"key": "messageUId", "type": "String", "hint": "", "lable": "请输入messageUId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.requestSpeechToTextForMessage,
};

const setMessageSpeechToTextVisible = {
  "title": "setMessageSpeechToTextVisible",
  "params": [
    {"key": "messageId", "type": "String", "hint": "", "lable": "请输入messageId",},{"key": "visible", "type": "String", "hint": "", "lable": "请输入visible",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.setMessageSpeechToTextVisible,
};

const addFriend = {
  "title": "addFriend",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "friendType", "type": "String", "hint": "", "lable": "请输入friendType",},{"key": "extra", "type": "String", "hint": "", "lable": "请输入extra",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.addFriend,
};

const deleteFriends = {
  "title": "deleteFriends",
  "params": [
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "friendType", "type": "String", "hint": "", "lable": "请输入friendType",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.deleteFriends,
};

const acceptFriendApplication = {
  "title": "acceptFriendApplication",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.acceptFriendApplication,
};

const refuseFriendApplication = {
  "title": "refuseFriendApplication",
  "params": [
    {"key": "userId", "type": "String", "hint": "", "lable": "请输入userId",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.refuseFriendApplication,
};

const setFriendInfo = {
  "title": "setFriendInfo",
  "params": [
    {"key": "friendInfo", "type": "String", "hint": "", "lable": "请输入friendInfo",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.setFriendInfo,
};

const checkFriendsRelation = {
  "title": "checkFriendsRelation",
  "params": [
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "friendType", "type": "String", "hint": "", "lable": "请输入friendType",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.checkFriendsRelation,
};

const getFriends = {
  "title": "getFriends",
  "params": [
    {"key": "friendType", "type": "String", "hint": "", "lable": "请输入friendType",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getFriends,
};

const getFriendApplications = {
  "title": "getFriendApplications",
  "params": [
    {"key": "applicationTypes", "type": "String", "hint": "", "lable": "请输入applicationTypes",},{"key": "status", "type": "String", "hint": "", "lable": "请输入status",},{"key": "queryOption", "type": "String", "hint": "", "lable": "请输入queryOption",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getFriendApplications,
};

const getFriendsInfo = {
  "title": "getFriendsInfo",
  "params": [
    {"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getFriendsInfo,
};

const searchFriendsInfo = {
  "title": "searchFriendsInfo",
  "params": [
    {"key": "keyword", "type": "String", "hint": "", "lable": "请输入keyword",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.searchFriendsInfo,
};

const setFriendAllowType = {
  "title": "setFriendAllowType",
  "params": [
    {"key": "allowType", "type": "String", "hint": "", "lable": "请输入allowType",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.setFriendAllowType,
};

const getFriendAllowType = {
  "title": "getFriendAllowType",
  "params": [
    {"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getFriendAllowType,
};

const sendReadReceiptResponseV5 = {
  "title": "sendReadReceiptResponseV5",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageUIds", "type": "String", "hint": "", "lable": "请输入messageUIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.sendReadReceiptResponseV5,
};

const getMessageReadReceiptInfoV5 = {
  "title": "getMessageReadReceiptInfoV5",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageUIds", "type": "String", "hint": "", "lable": "请输入messageUIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getMessageReadReceiptInfoV5,
};

const getMessagesReadReceiptByUsersV5 = {
  "title": "getMessagesReadReceiptByUsersV5",
  "params": [
    {"key": "type", "type": "String", "hint": "", "lable": "请输入type",},{"key": "targetId", "type": "String", "hint": "", "lable": "请输入targetId",},{"key": "channelId", "type": "String", "hint": "", "lable": "请输入channelId",},{"key": "messageUId", "type": "String", "hint": "", "lable": "请输入messageUId",},{"key": "userIds", "type": "String", "hint": "", "lable": "请输入userIds",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getMessagesReadReceiptByUsersV5,
};

*/
