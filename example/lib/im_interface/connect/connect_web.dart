import '../function/engine_function.dart' as engine_cus_fun;
import '../function/engine_function_web.dart' as engine_fun_web;

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
      "key": "thumbnailQuality",
      "type": "number",
      "hint": "非必填",
      "lable": "缩略图压缩比例",
    },
  ],
  "action": engine_cus_fun.initEngine,
};

const setListener = {
  "title": "设置监听",
  "action": engine_fun_web.setListener,
};

const disconnect = {
  "title": "断开连接",
  "params": [
    {
      "key": "receivePush",
      "type": "number",
      "hint": "0:不接收推送 , 1:接收推送",
      "lable": "断开后是否接收推送（web 端此参数无效不用填）",
    },
  ],
  "action": engine_fun_web.disconnect,
};
