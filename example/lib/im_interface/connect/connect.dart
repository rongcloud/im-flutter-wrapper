import '../function/engine_function.dart' as engine_cus_fun;
import '../../auto/engine_auto_funtion.dart' as engine_fun;

const initEngine = {
  "title": "初始化引擎",
  "params": [
    {
      "key": "appkey",
      "type": "String",
      "hint": "必填",
      "lable": "请输入 AppKey",
    },
    {
      "key": "naviServer",
      "type": "String",
      "hint": "非必填",
      "lable": "请输入导航地址",
    },
    {
      "key": "fileServer",
      "type": "String",
      "hint": "非必填",
      "lable": "请输入文件地址",
    },
    {
      "key": "statisticServer",
      "type": "String",
      "hint": "非必填",
      "lable": "请输入状态上传地址",
    },
    {
      "key": "kickReconnectDevice",
      "type": "number",
      "hint": "非必填 0:不踢出 1:踢出",
      "lable": "是否踢出其他重连设备",
    },
    {
      "key": "enablePush",
      "type": "number",
      "hint": "非必填 0:不开启 1:开启",
      "lable": "是否开启推送",
    },
    {
      "key": "enableIPC",
      "type": "number",
      "hint": "非必填 0:不开启 1:开启",
      "lable": "是否开启单进程模式",
    },
    {
      "key": "areaCode",
      "type": "number",
      "hint": "非必填 0:北京 1:新加坡 2:北美 3:新加坡B企业合作 4:沙特",
      "lable": "区域码",
    },
    {
      "key": "originalImageQuality",
      "type": "number",
      "hint": "非必填",
      "lable": "原图压缩比",
    },
    {
      "key": "originalImageMaxSize",
      "type": "number",
      "hint": "非必填",
      "lable": "原图大小限制 配置发送图片时，如果图片大小不超过则发送原图",
    },
    {
      "key": "originalImageSize",
      "type": "number",
      "hint": "非必填",
      "lable": "原图最长边的最大宽度",
    },
    {
      "key": "thumbnailQuality",
      "type": "number",
      "hint": "非必填",
      "lable": "缩略图压缩比例",
    },
    {
      "key": "thumbnailMaxSize",
      "type": "number",
      "hint": "非必填",
      "lable": "缩略图压缩宽、高",
    },
    {
      "key": "thumbnailMinSize",
      "type": "number",
      "hint": "非必填",
      "lable": "缩略图压缩最小宽、高",
    },
    {
      "key": "sightCompressWidth",
      "type": "number",
      "hint": "非必填",
      "lable": "小视频压缩宽度,建议使用16的倍数",
    },
    {
      "key": "sightCompressHeight",
      "type": "number",
      "hint": "非必填",
      "lable": "小视频压缩高度，建议使用16的倍数",
    },
    {
      "key": "locationThumbnailQuality",
      "type": "number",
      "hint": "非必填",
      "lable": "位置消息缩略图压缩比例",
    },
    {
      "key": "locationThumbnailHeight",
      "type": "number",
      "hint": "非必填",
      "lable": "位置消息缩略图高度",
    },
    {
      "key": "locationThumbnailWidth",
      "type": "number",
      "hint": "非必填",
      "lable": "位置消息缩略图宽度",
    },
  ],
  "action": engine_cus_fun.initEngine,
};

const destroy = {
  "title": "销毁引擎",
  "action": engine_cus_fun.destroy,
};

const setListener = {
  "title": "设置监听",
  "action": engine_cus_fun.setListener,
};

const connect = {
  "title": "连接",
  "params": [
    {
      "key": "token",
      "type": "String",
      "hint": "必填",
      "lable": "请输入 Token",
    },
    {
      "key": "timeout",
      "type": "number",
      "hint": "0 为一直重连, 非 0 为最多连接多少秒",
      "lable": "请输入超时时间",
    },
  ],
  "action": engine_cus_fun.connect,
};

const disconnect = {
  "title": "断开连接",
  "params": [
    {
      "key": "receivePush",
      "type": "number",
      "hint": "0:不接收推送 , 1:接收推送",
      "lable": "断开后是否接收推送",
    },
  ],
  "action": engine_fun.disconnect,
};
