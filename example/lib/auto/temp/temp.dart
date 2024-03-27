/*

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

const getUnreadConversations = {
  "title": "getUnreadConversations",
  "params": [
    {"key": "conversationTypes", "type": "String", "hint": "", "lable": "请输入conversationTypes",},{"key": "callback", "type": "String", "hint": "", "lable": "请输入callback",},
  ],
  "action": engine_fun.getUnreadConversations,
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

*/
