/*
 * WebIMWrapper - v0.0.1-alpha.5
 * CommitId - 777c38aa907e6a93ba30a5f130c69e5243c476a7
 * Thu Oct 27 2022 17:24:10 GMT+0800 (中国标准时间)
 * ©2016 RongCloud, Inc. All rights reserved.
 */
(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports) :
    typeof define === 'function' && define.amd ? define(['exports'], factory) :
    (global = typeof globalThis !== 'undefined' ? globalThis : global || self, factory(global.WebIMWrapper = {}));
})(this, (function (exports) { 'use strict';

    var e;!function(e){e[e.READ=1]="READ",e[e.LISTENED=2]="LISTENED",e[e.DOWNLOADED=4]="DOWNLOADED",e[e.RETRIEVED=8]="RETRIEVED",e[e.UNREAD=0]="UNREAD";}(e||(e={}));var t,n=e,a=["https://nav.cn.ronghub.com","https://nav2-cn.ronghub.com"],c=["wsproxy.cn.ronghub.com","wsap-cn.ronghub.com"],u=["cometproxy-cn.ronghub.com","mini-cn.ronghub.com"],T={"RC:TxtMsg":{isCounted:!0,isPersited:!0},"RC:ImgMsg":{isCounted:!0,isPersited:!0},"RC:VcMsg":{isCounted:!0,isPersited:!0},"RC:ImgTextMsg":{isCounted:!0,isPersited:!0},"RC:FileMsg":{isCounted:!0,isPersited:!0},"RC:HQVCMsg":{isCounted:!0,isPersited:!0},"RC:LBSMsg":{isCounted:!0,isPersited:!0},"RC:PSImgTxtMsg":{isCounted:!0,isPersited:!0},"RC:PSMultiImgTxtMsg":{isCounted:!0,isPersited:!0},"RCJrmf:RpMsg":{isCounted:!0,isPersited:!0},"RCJrmf:RpOpendMsg":{isCounted:!0,isPersited:!0},"RC:CombineMsg":{isCounted:!0,isPersited:!0},"RC:ReferenceMsg":{isCounted:!0,isPersited:!0},"RC:SightMsg":{isCounted:!0,isPersited:!0},"RC:GIFMsg":{isCounted:!0,isPersited:!0},"RC:InfoNtf":{isCounted:!1,isPersited:!0},"RC:ContactNtf":{isCounted:!1,isPersited:!0},"RC:ProfileNtf":{isCounted:!1,isPersited:!0},"RC:CmdNtf":{isCounted:!1,isPersited:!0},"RC:GrpNtf":{isCounted:!1,isPersited:!0},"RC:RcCmd":{isCounted:!1,isPersited:!0},"RC:CmdMsg":{isCounted:!1,isPersited:!1},"RC:TypSts":{isCounted:!1,isPersited:!1},"RC:PSCmd":{isCounted:!1,isPersited:!1},"RC:SRSMsg":{isCounted:!1,isPersited:!1},"RC:RRReqMsg":{isCounted:!1,isPersited:!1},"RC:RRRspMsg":{isCounted:!1,isPersited:!1},"RC:CsChaR":{isCounted:!1,isPersited:!1},"RC:CSCha":{isCounted:!1,isPersited:!1},"RC:CsEva":{isCounted:!1,isPersited:!1},"RC:CsContact":{isCounted:!1,isPersited:!1},"RC:CsHs":{isCounted:!1,isPersited:!1},"RC:CsHsR":{isCounted:!1,isPersited:!1},"RC:CsSp":{isCounted:!1,isPersited:!1},"RC:CsEnd":{isCounted:!1,isPersited:!1},"RC:CsUpdate":{isCounted:!1,isPersited:!1},"RC:ReadNtf":{isCounted:!1,isPersited:!1},"RC:chrmKVNotiMsg":{isCounted:!1,isPersited:!1},"RC:VCAccept":{isCounted:!1,isPersited:!1},"RC:VCRinging":{isCounted:!1,isPersited:!1},"RC:VCSummary":{isCounted:!1,isPersited:!1},"RC:VCHangup":{isCounted:!1,isPersited:!1},"RC:VCInvite":{isCounted:!1,isPersited:!1},"RC:VCModifyMedia":{isCounted:!1,isPersited:!1},"RC:VCModifyMem":{isCounted:!1,isPersited:!1},"RC:MsgExMsg":{isCounted:!1,isPersited:!1},"RC:RRMsg":{isCounted:!1,isPersited:!1},"RC:LogCmdMsg":{isCounted:!1,isPersited:!1},"RC:InterceptMsg":{isCounted:!1,isPersited:!1}},C=["RC:TypSts","RC:InterceptMsg"];!function(e){e.WEBSOCKET="websocket",e.COMET="comet";}(t||(t={}));var R,U=function(e){return R||(R={set:function(t,n){e.localStorage.setItem(t,JSON.stringify(n));},get:function(t){var n;try{n=JSON.parse(e.localStorage.getItem(t));}catch(e){n=null;}return n},remove:function(t){return e.localStorage.removeItem(t)},getKeys:function(){var t=[];for(var n in e.localStorage)t.push(n);return t}}),R},A=function(){function e(e){this._caches={},e&&(this._caches=e);}return e.prototype.set=function(e,t){this._caches[e]=t;},e.prototype.remove=function(e){var t=this.get(e);return delete this._caches[e],t},e.prototype.get=function(e){return this._caches[e]},e.prototype.getKeys=function(){var e=[];for(var t in this._caches)e.push(t);return e},e}(),L$1=function(){function e(e,t){var n,i=t?"".concat("RCV4-").concat(t):"RCV4-";this._rootStorage=U(e);var r=this._rootStorage.get(i)||{};this._cache=new A(((n={})[i]=r,n)),this._storageKey=i;}return e.prototype._get=function(){var e=this._storageKey;return this._cache.get(e)||{}},e.prototype._set=function(e){var t=this._storageKey;e=e||{},this._cache.set(t,e),this._rootStorage.set(t,e);},e.prototype.set=function(e,t){var n=this._get();n[e]=t,this._set(n);},e.prototype.remove=function(e){var t=this._get();delete t[e],this._set(t);},e.prototype.clear=function(){var e=this._storageKey;this._rootStorage.remove(e),this._cache.remove(e);},e.prototype.get=function(e){return this._get()[e]},e.prototype.getKeys=function(){var e=this._get(),t=[];for(var n in e)t.push(n);return t},e.prototype.getValues=function(){return this._get()||{}},e}(),w=function(e,t){return w=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(e,t){e.__proto__=t;}||function(e,t){for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);},w(e,t)};function b$1(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Class extends value "+String(t)+" is not a constructor or null");function n(){this.constructor=e;}w(e,t),e.prototype=null===t?Object.create(t):(n.prototype=t.prototype,new n);}var P$1=function(){return P$1=Object.assign||function(e){for(var t,n=1,i=arguments.length;n<i;n++)for(var r in t=arguments[n])Object.prototype.hasOwnProperty.call(t,r)&&(e[r]=t[r]);return e},P$1.apply(this,arguments)};function D$1(e,t,n,i){return new(n||(n=Promise))((function(r,o){function s(e){try{c(i.next(e));}catch(e){o(e);}}function a(e){try{c(i.throw(e));}catch(e){o(e);}}function c(e){var t;e.done?r(e.value):(t=e.value,t instanceof n?t:new n((function(e){e(t);}))).then(s,a);}c((i=i.apply(e,t||[])).next());}))}function V$1(e,t){var n,i,r,o,s={label:0,sent:function(){if(1&r[0])throw r[1];return r[1]},trys:[],ops:[]};return o={next:a(0),throw:a(1),return:a(2)},"function"==typeof Symbol&&(o[Symbol.iterator]=function(){return this}),o;function a(o){return function(a){return function(o){if(n)throw new TypeError("Generator is already executing.");for(;s;)try{if(n=1,i&&(r=2&o[0]?i.return:o[0]?i.throw||((r=i.return)&&r.call(i),0):i.next)&&!(r=r.call(i,o[1])).done)return r;switch(i=0,r&&(o=[2&o[0],r.value]),o[0]){case 0:case 1:r=o;break;case 4:return s.label++,{value:o[1],done:!1};case 5:s.label++,i=o[1],o=[0];continue;case 7:o=s.ops.pop(),s.trys.pop();continue;default:if(!(r=s.trys,(r=r.length>0&&r[r.length-1])||6!==o[0]&&2!==o[0])){s=0;continue}if(3===o[0]&&(!r||o[1]>r[0]&&o[1]<r[3])){s.label=o[1];break}if(6===o[0]&&s.label<r[1]){s.label=r[1],r=o;break}if(r&&s.label<r[2]){s.label=r[2],s.ops.push(o);break}r[2]&&s.ops.pop(),s.trys.pop();continue}o=t.call(e,s);}catch(e){o=[6,e],i=0;}finally{n=r=0;}if(5&o[0])throw o[1];return {value:o[0]?o[1]:void 0,done:!0}}([o,a])}}}function k$1(e,t,n){if(n||2===arguments.length)for(var i,r=0,o=t.length;r<o;r++)!i&&r in t||(i||(i=Array.prototype.slice.call(t,0,r)),i[r]=t[r]);return e.concat(i||Array.prototype.slice.call(t))}var G$1;(function(e){function t(t){return e.call(this,"TODO => ".concat(t))||this}return b$1(t,e),t})(Error);var F$1=function(e,t,n){if(void 0===t||void 0===n)return e.toUpperCase();var i=e.slice(t,n);return e=e.replace(i,(function(e){return e.toUpperCase()}))},K$1=function(e,t){void 0===t&&(t="utf-8");var n,i=0;if("utf-16"===t)for(var r=0,o=e.length;r<o;r++)i+=(n=e.charCodeAt(r))<=65535?2:4;else for(r=0,o=e.length;r<o;r++)i+=(n=e.charCodeAt(r))<127?1:n<=2047?2:n<=65535?3:4;return i},H$1=function(e,t){if(e=e.replace(/\?$/,""),!t)return e;var n=Object.keys(t).map((function(e){return "".concat(e,"=").concat(t[e])})).filter((function(e){return !!e}));return n.length?[e,n.join("&")].join("?"):e},q$1=function(e){return e.match(/\d+(\.\d+){2}/)[0]};!function(e){e[e.IMAGE=1]="IMAGE",e[e.AUDIO=2]="AUDIO",e[e.VIDEO=3]="VIDEO",e[e.FILE=4]="FILE",e[e.SIGHT=5]="SIGHT",e[e.COMBINE_HTML=6]="COMBINE_HTML";}(G$1||(G$1={}));var Y$1,j$1=G$1;!function(e){e[e.SEND=1]="SEND",e[e.RECEIVE=2]="RECEIVE";}(Y$1||(Y$1={}));var Q$1,W$1=Y$1;!function(e){e[e.TIMEOUT=-1]="TIMEOUT",e[e.UNKNOWN=-2]="UNKNOWN",e[e.PARAMETER_ERROR=-3]="PARAMETER_ERROR",e[e.EXTRA_METHOD_UNDEFINED=-4]="EXTRA_METHOD_UNDEFINED",e[e.MAIN_PROCESS_ERROR=-5]="MAIN_PROCESS_ERROR",e[e.PARAMETER_CHANGED=-6]="PARAMETER_CHANGED",e[e.SUCCESS=0]="SUCCESS",e[e.RC_DISCUSSION_GROUP_ID_INVALID=20407]="RC_DISCUSSION_GROUP_ID_INVALID",e[e.SEND_FREQUENCY_TOO_FAST=20604]="SEND_FREQUENCY_TOO_FAST",e[e.NOT_IN_DISCUSSION=21406]="NOT_IN_DISCUSSION",e[e.FORBIDDEN_IN_GROUP=22408]="FORBIDDEN_IN_GROUP",e[e.RECALL_MESSAGE=25101]="RECALL_MESSAGE",e[e.NOT_IN_GROUP=22406]="NOT_IN_GROUP",e[e.NOT_IN_CHATROOM=23406]="NOT_IN_CHATROOM",e[e.FORBIDDEN_IN_CHATROOM=23408]="FORBIDDEN_IN_CHATROOM",e[e.RC_CHATROOM_USER_KICKED=23409]="RC_CHATROOM_USER_KICKED",e[e.RC_CHATROOM_NOT_EXIST=23410]="RC_CHATROOM_NOT_EXIST",e[e.RC_CHATROOM_IS_FULL=23411]="RC_CHATROOM_IS_FULL",e[e.RC_CHATROOM_PATAMETER_INVALID=23412]="RC_CHATROOM_PATAMETER_INVALID",e[e.CHATROOM_GET_HISTORYMSG_ERROR=23413]="CHATROOM_GET_HISTORYMSG_ERROR",e[e.CHATROOM_NOT_OPEN_HISTORYMSG_STORE=23414]="CHATROOM_NOT_OPEN_HISTORYMSG_STORE",e[e.CHATROOM_KV_EXCEED=23423]="CHATROOM_KV_EXCEED",e[e.CHATROOM_KV_OVERWRITE_INVALID=23424]="CHATROOM_KV_OVERWRITE_INVALID",e[e.CHATROOM_KV_STORE_NOT_OPEN=23426]="CHATROOM_KV_STORE_NOT_OPEN",e[e.CHATROOM_KEY_NOT_EXIST=23427]="CHATROOM_KEY_NOT_EXIST",e[e.CHATROOM_KV_SET_ERROR=23431]="CHATROOM_KV_SET_ERROR",e[e.SENSITIVE_SHIELD=21501]="SENSITIVE_SHIELD",e[e.SENSITIVE_REPLACE=21502]="SENSITIVE_REPLACE",e[e.JOIN_IN_DISCUSSION=21407]="JOIN_IN_DISCUSSION",e[e.CREATE_DISCUSSION=21408]="CREATE_DISCUSSION",e[e.INVITE_DICUSSION=21409]="INVITE_DICUSSION",e[e.GET_USERINFO_ERROR=23407]="GET_USERINFO_ERROR",e[e.REJECTED_BY_BLACKLIST=405]="REJECTED_BY_BLACKLIST",e[e.RC_NET_CHANNEL_INVALID=30001]="RC_NET_CHANNEL_INVALID",e[e.RC_NET_UNAVAILABLE=30002]="RC_NET_UNAVAILABLE",e[e.RC_MSG_RESP_TIMEOUT=30003]="RC_MSG_RESP_TIMEOUT",e[e.RC_HTTP_SEND_FAIL=30004]="RC_HTTP_SEND_FAIL",e[e.RC_HTTP_REQ_FAIL=30005]="RC_HTTP_REQ_FAIL",e[e.RC_HTTP_RECV_FAIL=30006]="RC_HTTP_RECV_FAIL",e[e.RC_NAVI_RESOURCE_ERROR=30007]="RC_NAVI_RESOURCE_ERROR",e[e.RC_NODE_NOT_FOUND=30008]="RC_NODE_NOT_FOUND",e[e.RC_DOMAIN_NOT_RESOLVE=30009]="RC_DOMAIN_NOT_RESOLVE",e[e.RC_SOCKET_NOT_CREATED=30010]="RC_SOCKET_NOT_CREATED",e[e.RC_SOCKET_DISCONNECTED=30011]="RC_SOCKET_DISCONNECTED",e[e.RC_PING_SEND_FAIL=30012]="RC_PING_SEND_FAIL",e[e.RC_PONG_RECV_FAIL=30013]="RC_PONG_RECV_FAIL",e[e.RC_MSG_SEND_FAIL=30014]="RC_MSG_SEND_FAIL",e[e.RC_MSG_CONTENT_EXCEED_LIMIT=30016]="RC_MSG_CONTENT_EXCEED_LIMIT",e[e.RC_CONN_ACK_TIMEOUT=31e3]="RC_CONN_ACK_TIMEOUT",e[e.RC_CONN_PROTO_VERSION_ERROR=31001]="RC_CONN_PROTO_VERSION_ERROR",e[e.RC_CONN_ID_REJECT=31002]="RC_CONN_ID_REJECT",e[e.RC_CONN_SERVER_UNAVAILABLE=31003]="RC_CONN_SERVER_UNAVAILABLE",e[e.RC_CONN_USER_OR_PASSWD_ERROR=31004]="RC_CONN_USER_OR_PASSWD_ERROR",e[e.RC_CONN_NOT_AUTHRORIZED=31005]="RC_CONN_NOT_AUTHRORIZED",e[e.RC_CONN_REDIRECTED=31006]="RC_CONN_REDIRECTED",e[e.RC_CONN_PACKAGE_NAME_INVALID=31007]="RC_CONN_PACKAGE_NAME_INVALID",e[e.RC_CONN_APP_BLOCKED_OR_DELETED=31008]="RC_CONN_APP_BLOCKED_OR_DELETED",e[e.RC_CONN_USER_BLOCKED=31009]="RC_CONN_USER_BLOCKED",e[e.RC_DISCONN_KICK=31010]="RC_DISCONN_KICK",e[e.RC_DISCONN_EXCEPTION=31011]="RC_DISCONN_EXCEPTION",e[e.RC_DISCONN_SAME_CLIENT_ON_LINE=31023]="RC_DISCONN_SAME_CLIENT_ON_LINE",e[e.RC_APP_AUTH_NOT_PASS=31026]="RC_APP_AUTH_NOT_PASS",e[e.RC_OTP_USED=31027]="RC_OTP_USED",e[e.RC_PLATFORM_ERROR=31028]="RC_PLATFORM_ERROR",e[e.RC_QUERY_ACK_NO_DATA=32001]="RC_QUERY_ACK_NO_DATA",e[e.RC_MSG_DATA_INCOMPLETE=32002]="RC_MSG_DATA_INCOMPLETE",e[e.BIZ_ERROR_CLIENT_NOT_INIT=33001]="BIZ_ERROR_CLIENT_NOT_INIT",e[e.BIZ_ERROR_DATABASE_ERROR=33002]="BIZ_ERROR_DATABASE_ERROR",e[e.BIZ_ERROR_INVALID_PARAMETER=33003]="BIZ_ERROR_INVALID_PARAMETER",e[e.BIZ_ERROR_NO_CHANNEL=33004]="BIZ_ERROR_NO_CHANNEL",e[e.BIZ_ERROR_RECONNECT_SUCCESS=33005]="BIZ_ERROR_RECONNECT_SUCCESS",e[e.BIZ_ERROR_CONNECTING=33006]="BIZ_ERROR_CONNECTING",e[e.MSG_ROAMING_SERVICE_UNAVAILABLE=33007]="MSG_ROAMING_SERVICE_UNAVAILABLE",e[e.MSG_INSERT_ERROR=33008]="MSG_INSERT_ERROR",e[e.MSG_DEL_ERROR=33009]="MSG_DEL_ERROR",e[e.TAG_EXISTS=33101]="TAG_EXISTS",e[e.TAG_NOT_EXIST=33100]="TAG_NOT_EXIST",e[e.NO_TAG_IN_CONVER=33102]="NO_TAG_IN_CONVER",e[e.CONVER_REMOVE_ERROR=34001]="CONVER_REMOVE_ERROR",e[e.CONVER_GETLIST_ERROR=34002]="CONVER_GETLIST_ERROR",e[e.CONVER_SETOP_ERROR=34003]="CONVER_SETOP_ERROR",e[e.CONVER_TOTAL_UNREAD_ERROR=34004]="CONVER_TOTAL_UNREAD_ERROR",e[e.CONVER_TYPE_UNREAD_ERROR=34005]="CONVER_TYPE_UNREAD_ERROR",e[e.CONVER_ID_TYPE_UNREAD_ERROR=34006]="CONVER_ID_TYPE_UNREAD_ERROR",e[e.EXPANSION_LIMIT_EXCEET=34010]="EXPANSION_LIMIT_EXCEET",e[e.MESSAGE_KV_NOT_SUPPORT=34008]="MESSAGE_KV_NOT_SUPPORT",e[e.CONVER_OUT_LIMIT_ERROR=34013]="CONVER_OUT_LIMIT_ERROR",e[e.CONVER_GET_ERROR=35021]="CONVER_GET_ERROR",e[e.GROUP_SYNC_ERROR=35001]="GROUP_SYNC_ERROR",e[e.GROUP_MATCH_ERROR=35002]="GROUP_MATCH_ERROR",e[e.READ_RECEIPT_ERROR=35003]="READ_RECEIPT_ERROR",e[e.PACKAGE_ENVIRONMENT_ERROR=35006]="PACKAGE_ENVIRONMENT_ERROR",e[e.CAN_NOT_RECONNECT=35007]="CAN_NOT_RECONNECT",e[e.SERVER_UNAVAILABLE=35008]="SERVER_UNAVAILABLE",e[e.HOSTNAME_ERROR=35009]="HOSTNAME_ERROR",e[e.HAS_OHTER_SAME_CLIENT_ON_LINE=35010]="HAS_OHTER_SAME_CLIENT_ON_LINE",e[e.METHOD_NOT_AVAILABLE=35011]="METHOD_NOT_AVAILABLE",e[e.METHOD_NOT_SUPPORT=35012]="METHOD_NOT_SUPPORT",e[e.MSG_LIMIT_ERROR=35013]="MSG_LIMIT_ERROR",e[e.METHOD_ONLY_SUPPORT_ULTRA_GROUP=35014]="METHOD_ONLY_SUPPORT_ULTRA_GROUP",e[e.UPLOAD_FILE_FAILED=35020]="UPLOAD_FILE_FAILED",e[e.CHATROOM_ID_ISNULL=36001]="CHATROOM_ID_ISNULL",e[e.CHARTOOM_JOIN_ERROR=36002]="CHARTOOM_JOIN_ERROR",e[e.CHATROOM_HISMESSAGE_ERROR=36003]="CHATROOM_HISMESSAGE_ERROR",e[e.CHATROOM_KV_NOT_FOUND=36004]="CHATROOM_KV_NOT_FOUND",e[e.BLACK_ADD_ERROR=37001]="BLACK_ADD_ERROR",e[e.BLACK_GETSTATUS_ERROR=37002]="BLACK_GETSTATUS_ERROR",e[e.BLACK_REMOVE_ERROR=37003]="BLACK_REMOVE_ERROR",e[e.DRAF_GET_ERROR=38001]="DRAF_GET_ERROR",e[e.DRAF_SAVE_ERROR=38002]="DRAF_SAVE_ERROR",e[e.DRAF_REMOVE_ERROR=38003]="DRAF_REMOVE_ERROR",e[e.SUBSCRIBE_ERROR=39001]="SUBSCRIBE_ERROR",e[e.NOT_SUPPORT=39002]="NOT_SUPPORT",e[e.QNTKN_FILETYPE_ERROR=41001]="QNTKN_FILETYPE_ERROR",e[e.QNTKN_GET_ERROR=41002]="QNTKN_GET_ERROR",e[e.COOKIE_ENABLE=51001]="COOKIE_ENABLE",e[e.HAVNODEVICEID=24001]="HAVNODEVICEID",e[e.DEVICEIDISHAVE=24002]="DEVICEIDISHAVE",e[e.FEILD=24009]="FEILD",e[e.VOIPISNULL=24013]="VOIPISNULL",e[e.NOENGINETYPE=24010]="NOENGINETYPE",e[e.NULLCHANNELNAME=24011]="NULLCHANNELNAME",e[e.VOIPDYANMICERROR=24012]="VOIPDYANMICERROR",e[e.NOVOIP=24014]="NOVOIP",e[e.INTERNALERRROR=24015]="INTERNALERRROR",e[e.VOIPCLOSE=24016]="VOIPCLOSE",e[e.ULTRA_GROUP_USER_NOT_IN_PRIVATE_CHANNEL=24416]="ULTRA_GROUP_USER_NOT_IN_PRIVATE_CHANNEL",e[e.CANCEL=1]="CANCEL",e[e.REJECT=2]="REJECT",e[e.HANGUP=3]="HANGUP",e[e.BUSYLINE=4]="BUSYLINE",e[e.NO_RESPONSE=5]="NO_RESPONSE",e[e.ENGINE_UN_SUPPORTED=6]="ENGINE_UN_SUPPORTED",e[e.NETWORK_ERROR=7]="NETWORK_ERROR",e[e.REMOTE_CANCEL=11]="REMOTE_CANCEL",e[e.REMOTE_REJECT=12]="REMOTE_REJECT",e[e.REMOTE_HANGUP=13]="REMOTE_HANGUP",e[e.REMOTE_BUSYLINE=14]="REMOTE_BUSYLINE",e[e.REMOTE_NO_RESPONSE=15]="REMOTE_NO_RESPONSE",e[e.REMOTE_ENGINE_UN_SUPPORTED=16]="REMOTE_ENGINE_UN_SUPPORTED",e[e.REMOTE_NETWORK_ERROR=17]="REMOTE_NETWORK_ERROR",e[e.VOIP_NOT_AVALIABLE=18]="VOIP_NOT_AVALIABLE",e[e.CHATROOM_KV_STORE_NOT_ALL_SUCCESS=23428]="CHATROOM_KV_STORE_NOT_ALL_SUCCESS",e[e.CHATROOM_KV_STORE_OUT_LIMIT=23429]="CHATROOM_KV_STORE_OUT_LIMIT",e[e.SEARCH_PROPS_LIMIT_ERROR=35022]="SEARCH_PROPS_LIMIT_ERROR";}(Q$1||(Q$1={}));var J$1,z$1=Q$1;!function(e){e[e.NONE=0]="NONE",e[e.PRIVATE=1]="PRIVATE",e[e.DISCUSSION=2]="DISCUSSION",e[e.GROUP=3]="GROUP",e[e.CHATROOM=4]="CHATROOM",e[e.CUSTOMER_SERVICE=5]="CUSTOMER_SERVICE",e[e.SYSTEM=6]="SYSTEM",e[e.APP_PUBLIC_SERVICE=7]="APP_PUBLIC_SERVICE",e[e.PUBLIC_SERVICE=8]="PUBLIC_SERVICE",e[e.ULTRA_GROUP=10]="ULTRA_GROUP",e[e.RTC_ROOM=12]="RTC_ROOM";}(J$1||(J$1={}));var Z$1,X$1=J$1;!function(e){e[e.CONNECTED=0]="CONNECTED",e[e.CONNECTING=1]="CONNECTING",e[e.DISCONNECTED=2]="DISCONNECTED",e[e.NETWORK_UNAVAILABLE=3]="NETWORK_UNAVAILABLE",e[e.CONNECTION_CLOSED=4]="CONNECTION_CLOSED",e[e.KICKED_OFFLINE_BY_OTHER_CLIENT=6]="KICKED_OFFLINE_BY_OTHER_CLIENT",e[e.WEBSOCKET_UNAVAILABLE=7]="WEBSOCKET_UNAVAILABLE",e[e.WEBSOCKET_ERROR=8]="WEBSOCKET_ERROR",e[e.BLOCKED=9]="BLOCKED",e[e.DOMAIN_INCORRECT=12]="DOMAIN_INCORRECT",e[e.DISCONNECT_BY_SERVER=13]="DISCONNECT_BY_SERVER",e[e.REDIRECT=14]="REDIRECT",e[e.APPKEY_IS_FAKE=20]="APPKEY_IS_FAKE",e[e.FORBID_RECONNECT_BY_OTHER_SAME_CLIENT=31023]="FORBID_RECONNECT_BY_OTHER_SAME_CLIENT",e[e.ULTRALIMIT=1101]="ULTRALIMIT",e[e.REQUEST_NAVI=201]="REQUEST_NAVI",e[e.RESPONSE_NAVI=202]="RESPONSE_NAVI",e[e.RESPONSE_NAVI_ERROR=203]="RESPONSE_NAVI_ERROR",e[e.RESPONSE_NAVI_TIMEOUT=204]="RESPONSE_NAVI_TIMEOUT";}(Z$1||(Z$1={}));var $$1,ee$1=Z$1,te$1={ACCEPTED:0,UNACCEPTABLE_PROTOCOL_VERSION:1,IDENTIFIER_REJECTED:2,SERVER_UNAVAILABLE:3,TOKEN_INCORRECT:4,NOT_AUTHORIZED:5,REDIRECT:6,PACKAGE_ERROR:7,APP_BLOCK_OR_DELETE:8,BLOCK:9,TOKEN_EXPIRE:10,DEVICE_ERROR:11,HOSTNAME_ERROR:12,HASOHTERSAMECLIENTONLINE:13,IN_OTHER_CLUSTER:15,APP_AUTH_NOT_PASS:16,OTP_USED:17,PLATFORM_ERROR:18};!function(e){e.TextMessage="RC:TxtMsg",e.VOICE="RC:VcMsg",e.HQ_VOICE="RC:HQVCMsg",e.IMAGE="RC:ImgMsg",e.GIF="RC:GIFMsg",e.RICH_CONTENT="RC:ImgTextMsg",e.LOCATION="RC:LBSMsg",e.FILE="RC:FileMsg",e.SIGHT="RC:SightMsg",e.COMBINE="RC:CombineMsg",e.CHRM_KV_NOTIFY="RC:chrmKVNotiMsg",e.LOG_COMMAND="RC:LogCmdMsg",e.EXPANSION_NOTIFY="RC:MsgExMsg",e.REFERENCE="RC:ReferenceMsg",e.RECALL="RC:RcCmd",e.READ_RECEIPT="RC:ReadNtf",e.READ_RECEIPT_REQUEST="RC:RRReqMsg",e.READ_RECEIPT_RESPONSE="RC:RRRspMsg",e.SYNC_READ_STATUS="RC:SRSMsg",e.GROUP_READ_RECEIPT_REQUEST="RC:RRMsg",e.CHATROOM_JOIN="RC:ChrmJoinNtf",e.CHATROOM_LEFT="RC:ChrmQuitNtf",e.CHATROOM_MERGE_CHANGE="RC:ChrmMemChange",e.TYPING_STATUS="RC:TypSts",e.INTERCEPT="RC:InterceptMsg";}($$1||($$1={}));var ne$1,ie$1=$$1;!function(e){e[e.OPEN=1]="OPEN",e[e.CLOSE=2]="CLOSE";}(ne$1||(ne$1={}));var re$1,oe$1=ne$1;!function(e){e[e.ALL_MESSAGE=-1]="ALL_MESSAGE",e[e.NOT_SET=0]="NOT_SET",e[e.AT_MESSAGE_NOTIFICATION=1]="AT_MESSAGE_NOTIFICATION",e[e.AT_USER_NOTIFICATION=2]="AT_USER_NOTIFICATION",e[e.AT_GROUP_ALL_USER_NOTIFICATION=4]="AT_GROUP_ALL_USER_NOTIFICATION",e[e.NOT_MESSAGE_NOTIFICATION=5]="NOT_MESSAGE_NOTIFICATION";}(re$1||(re$1={}));var se$1,ae$1=re$1;!function(e){e[e.ALL=1]="ALL",e[e.SINGAL=2]="SINGAL";}(se$1||(se$1={}));var ce$1,ue$1=se$1;!function(e){e[e.QINIU=1]="QINIU",e[e.ALI=2]="ALI",e[e.AWS=3]="AWS",e[e.STC=4]="STC";}(ce$1||(ce$1={}));var le$1,he$1=ce$1;!function(e){e[e.UPDATE=1]="UPDATE",e[e.DELETE=2]="DELETE";}(le$1||(le$1={}));var de$1,fe$1,pe$1,ge$1,_e$1=le$1;!function(e){e[e.LOG=0]="LOG",e[e.DEBUG=0]="DEBUG",e[e.INFO=1]="INFO",e[e.WARN=2]="WARN",e[e.ERROR=3]="ERROR",e[e.FATAL=4]="FATAL",e[e.STATISTICS=6]="STATISTICS",e[e.NONE=1e3]="NONE";}(de$1||(de$1={})),function(e){e.IM="IM",e.RTC="RTC";}(fe$1||(fe$1={})),function(e){e.L_IMSDK_VER_O="L-imsdk_ver-O",e.A_INIT_O="A-init-O",e.L_INIT_O="L-init-O",e.P_INIT_O="P-init-O",e.A_CONNECT_T="A-connect-T",e.A_CONNECT_R="A-connect-R",e.A_CONNECT_S="A-connect-S",e.A_DISCONNECT_O="A-disconnect-O",e.A_RECONNECT_T="A-reconnect-T",e.A_RECONNECT_R="A_RECONNECT_R",e.L_CONNECT_T="L-connect-T",e.L_CONNECT_R="L-connect-R",e.L_CONNECT_S="L-connect-S",e.P_CONNECT_O="P-connect-O",e.P_CONNECT_S="P-connect-S",e.L_NOTIFY_ULTRA_ONLINE_S="L-notify-ultra-online-S",e.L_ULTRA_SYNC_DONE_S="L-ultra-sync-done-S",e.A_SEND_MSG_T="A-send_msg-T",e.A_SEND_MSG_R="A-send_msg-R",e.P_SEND_MSG_T="P-send_msg-T",e.P_SEND_MSG_R="P-send_msg-R",e.L_SEND_MSG_T="L-send_msg-T",e.L_SEND_MSG_R="L-send_msg-R",e.L_PULL_MSG_T="L-pull_msg-T",e.L_PULL_MSG_R="L-pull_msg-R",e.L_PULL_MSG_O="L-pull_msg-O",e.A_PULL_MSG_O="A-pull_msg-O",e.L_PULL_ULTRA_MSG_T="L-pull_ultra_msg-T",e.L_PULL_ULTRA_MSG_R="L-pull_ultra_msg-R",e.L_PULL_CHATROOM_KV_T="L-pull_chatroom_kv-T",e.L_PULL_CHATROOM_KV_R="L-pull_chatroom_kv-R",e.L_PULL_CHATROOM_MSG_T="L-pull_chatroom_msg-T",e.L_PULL_CHATROOM_MSG_R="L-pull_chatroom_msg-R",e.L_RECEIVE_MSG_O="L-receive_msg-O",e.L_RECEIVE_SYNC_MSG_O="L-receive_sync_msg-O",e.A_DELETE_MESSAGES_S="A-delete_messages-S",e.P_DELETE_MSG_S="P-delete_msg-S",e.L_PULL_CONVERSATION_S="L-pull_conversation-S",e.L_RECALL_ULTRA_MSG_S="L-recall_ultra_msg-S",e.A_REGTYP_O="A-regtyp-O",e.P_REGTYP_O="P-regtype-O",e.P_REGTYP_E="P-regtype-E",e.L_GET_NAVI_T="L-get_navi-T",e.L_GET_NAVI_R="L-get_navi-R",e.L_ENV_S="L-Env-S",e.L_GET_INDEX_NAVI_S="L-get_index_navi-S",e.A_JOIN_CHATROOM_T="A-join_chatroom-T",e.A_JOIN_CHATROOM_R="A-join_chatroom-R",e.L_JOIN_CHATROOM_T="L-join_chatroom-T",e.L_JOIN_CHATROOM_R="L-join_chatroom-R",e.A_QUIT_CHATROOM_T="A-quit_chatroom-T",e.A_QUIT_CHATROOM_R="A-quit_chatroom-R",e.L_REJOIN_CHATROOM_T="L-rejoin_chatroom-T",e.L_REJOIN_CHATROOM_R="L-rejoin_chatroom-R",e.L_MEDIA_S="L-media-S",e.L_MEDIA_UPLOAD_T="L-media_upload-T",e.L_MEDIA_UPLOAD_R="L-media_upload-R",e.G_UPLOAD_LOG_S="G-upload_log-S",e.G_UPLOAD_LOG_E="G-upload_log-E",e.G_GET_REAL_TIMELOG_COMMAND_S="G-get_real_timelog_command-S",e.L_CHECK_ALIVE_IM_T="L-check_alive_im-T",e.L_CHECK_ALIVE_IM_R="L-check_alive_im-R",e.A_GET_HISTORY_MSG_T="A-get_history_msg-T",e.A_GET_HISTORY_MSG_R="A-get_history_msg-R",e.L_GET_HISTORY_MSG_T="L-get_history_msg-T",e.L_GET_HISTORY_MSG_R="L-get_history_msg-R",e.A_CALLBACK_O="A-callback-O",e.A_CALLBACK_E="A-callback-E",e.L_CALLBACK_E="L-callback-E",e.L_PB_ENCODE_E="L-pb-encode-E",e.L_PB_DECODE_E="L-pb-decode-E",e.L_NOTIFY_NAVI_CHANGE_E="L-notify_navi_change-E",e.L_REPORT_FULL_LOG_O="L-report_full_log-O",e.L_REPORT_FULL_LOG_T="L-report_full_log-T",e.L_REPORT_FULL_LOG_R="L-report_full_log-R";}(pe$1||(pe$1={})),function(e){e[e.QUIT=0]="QUIT",e[e.JOIN=1]="JOIN";}(ge$1||(ge$1={}));var me$1,ve$1,ye$1=ge$1;!function(e){e[e.GLOBAL=1]="GLOBAL",e[e.CUSTOM=2]="CUSTOM",e[e.THIRD_PARTY=3]="THIRD_PARTY";}(me$1||(me$1={})),function(e){e[e.MSG_ORIGINAL=0]="MSG_ORIGINAL",e[e.MSG_EXPANSION=1]="MSG_EXPANSION",e[e.MSG_MODIFY=2]="MSG_MODIFY";}(ve$1||(ve$1={}));var Ee$1,Te$1=me$1;!function(e){e[e.typing=0]="typing";}(Ee$1||(Ee$1={}));var Ie$1,Ce$1,Re$1,Se$1,Oe$1,Ne$1,Me$1;!function(e){e[e.PUBLIC=0]="PUBLIC",e[e.PRIVATE=1]="PRIVATE";}(Ie$1||(Ie$1={})),function(e){e[e.PUBLIC_TO_PRIVATE=2]="PUBLIC_TO_PRIVATE",e[e.PRIVATE_TO_PUBLIC=3]="PRIVATE_TO_PUBLIC",e[e.PUBLIC_TO_PRIVATE_USER_NOT_IN=6]="PUBLIC_TO_PRIVATE_USER_NOT_IN";}(Ce$1||(Ce$1={})),function(e){e[e.MSG_EXPANSION=1]="MSG_EXPANSION",e[e.MSG_MODIFY=2]="MSG_MODIFY",e[e.MSG_RECALL=3]="MSG_RECALL",e[e.CHANNEL_CHANGE=4]="CHANNEL_CHANGE";}(Re$1||(Re$1={})),function(e){e[e.CHANNEL_DELETE=1]="CHANNEL_DELETE",e[e.PUBLIC_TO_PRIVATE=2]="PUBLIC_TO_PRIVATE",e[e.PRIVATE_TO_PUBLIC=3]="PRIVATE_TO_PUBLIC",e[e.PRIVATE_CHANNEL_USER_JOIN_PUBLIC=4]="PRIVATE_CHANNEL_USER_JOIN_PUBLIC",e[e.CHANNEL_USER_KICKED=5]="CHANNEL_USER_KICKED",e[e.PUBLIC_TO_PRIVATE_USER_NOT_IN=6]="PUBLIC_TO_PRIVATE_USER_NOT_IN";}(Se$1||(Se$1={})),function(e){e[e.RTC=0]="RTC",e[e.LIVE=2]="LIVE",e[e.CROSS_MUTI=7]="CROSS_MUTI",e[e.CROSS_LIVE=8]="CROSS_LIVE";}(Oe$1||(Oe$1={})),function(e){e[e.AUDIO_AND_VIDEO=0]="AUDIO_AND_VIDEO",e[e.AUDIO=1]="AUDIO";}(Ne$1||(Ne$1={})),function(e){e[e.ANCHOR=1]="ANCHOR",e[e.AUDIENCE=2]="AUDIENCE";}(Me$1||(Me$1={}));var Ae$1,Le$1,we$1,be$1={"RC:VCAccept":"RC:VCAccept","RC:VCRinging":"RC:VCRinging","RC:VCSummary":"RC:VCSummary","RC:VCHangup":"RC:VCHangup","RC:VCInvite":"RC:VCInvite","RC:VCModifyMedia":"RC:VCModifyMedia","RC:VCModifyMem":"RC:VCModifyMem"};!function(e){e[e.ROOM=1]="ROOM",e[e.PERSON=2]="PERSON";}(Ae$1||(Ae$1={})),function(e){e[e.AnchorToViewer=1]="AnchorToViewer",e[e.ViewerToAnchor=2]="ViewerToAnchor";}(Le$1||(Le$1={})),function(e){e[e.KICK=0]="KICK",e[e.REFUSE=1]="REFUSE",e[e.COEXIST=2]="COEXIST";}(we$1||(we$1={}));var Pe$1=function(e){return "string"==typeof e},De$1=function(e){return "boolean"==typeof e},Ve$1=function(e){return "number"==typeof e&&!Number.isNaN(e)},ke$1=function(e){return -1!==Object.prototype.toString.call(e).indexOf("Array")},Ge$1=function(e){return "[object ArrayBuffer]"===Object.prototype.toString.call(e)},Be$1=function(e){return Pe$1(e)&&e.length>0},Fe$1=function(e){return "[object Object]"===Object.prototype.toString.call(e)},Ke$1=function(e){return "[object Function]"===Object.prototype.toString.call(e)},He$1=function(e){return void 0===e||"[object Undefined]"===Object.prototype.toString.call(e)},qe$1=function(e){return "[object Null]"===Object.prototype.toString.call(e)},Ye$1=function(e){return Pe$1(e)&&/https?:\/\//.test(e)},je$1=function(e){for(var t in e)return !0;return !1},Qe$1=function(e){return Ve$1(e)&&Object.prototype.hasOwnProperty.call(X$1,e)},We$1=function(e){return Ve$1(e)&&Object.prototype.hasOwnProperty.call(ae$1,e)},Je$1=function(e){var t=!1;return Pe$1(e)&&!/_/g.test(e)&&e.length<=20&&(t=!0),t},ze$1=function(e){return Ve$1(e)&&Object.prototype.hasOwnProperty.call(j$1,e)},Ze$1=function(e){var t=!1,n=!1,i=!1;if(Fe$1(e)){var r=Object.keys(e).length;for(var o in t=r>20,e)if(n||(n=Pe$1(o)&&!/^[A-Za-z0-9_=+-]+$/.test(o)),!i){var s=e[o];i=o.length>32||s.length>4096;}}return {isExceedLimit:t,isIllgalEx:n,isExKeyOrValLengthExceedLimit:i}},Xe$1="RC_Logs";function $e$1(e){var t=e.target.result;if(1===e.oldVersion)try{t.deleteObjectStore(Xe$1);}catch(e){console.warn("version 1 indexDB delete error, name: ".concat(e.name,", message: ").concat(e.message,", stack: ").concat(e.stack));}!function(e,t,n){var i;if(!e.objectStoreNames.contains(t)){var r=P$1({},n.objectStoreParams);i=e.createObjectStore(t,r),n.indexs&&n.indexs.length>0&&n.indexs.forEach((function(e){i.createIndex(e.indexName,e.key,{unique:e.unique});}));}}(t,Xe$1,{indexs:[{indexName:"time",key:"time",unique:!1}],objectStoreParams:{autoIncrement:!0}});}var et$1,tt$1=function(){function e(){}return e.init=function(){if("undefined"!=typeof window&&window&&window.indexedDB){if(e.indexDBSwitch&&!e.opening){e.opening=!0;var t=window.indexedDB.open("RC_ENGINE_DB",2);t.onerror=function(t){e.opening=!1,console.warn("open indexDB request failed ".concat(t.target.error));},t.onsuccess=function(t){e.opening=!1,e._db=t.target.result,e._db&&(e._db.onclose=function(t){var n;console.warn("The database ".concat(null===(n=e._db)||void 0===n?void 0:n.name," has unexpectedly closed."),t),e._db=null,e._instance=null;},e._db.onerror=function(t){var n;console.warn("The database ".concat(null===(n=e._db)||void 0===n?void 0:n.name," has opening error."),t),e._db=null,e._instance=null;},e._db.onabort=function(t){var n;console.warn("The database ".concat(null===(n=e._db)||void 0===n?void 0:n.name," has opening aborted."),t),e._db=null,e._instance=null;}),e._instance=new e;},t.onupgradeneeded=function(t){e.opening=!1,e._db=t.target.result,$e$1(t);};}}else console.debug("IndexDB is not currently supported in the environment!");},e.getInstance=function(){return e._instance},e.prototype.addList=function(t,n){return new Promise((function(i){if(e._db){var r=e._db.transaction([t],"readwrite"),o=r.objectStore(t);n.forEach((function(e){null==o||o.add(e);})),r.oncomplete=function(e){i(!0);},r.onerror=function(e){i(!1);};}else i(!1);}))},e.prototype.getRangeData=function(t,n,i,r){return new Promise((function(o){if(e._db){var s=e._db.transaction([t],"readwrite").objectStore(t),a=IDBKeyRange.bound(i,r),c=s.index(n),u=[],l=c.openCursor(a);l.onsuccess=function(e){var t=e.target.result;t?(u.push(t.value),t.continue()):o(u);},l.onerror=function(e){console.error(e),o([]);};}else o([]);}))},e.prototype.getCount=function(t,n){return new Promise((function(n){if(e._db){var i=e._db.transaction([t],"readonly").objectStore(t).count();i.onsuccess=function(){n(i.result);},i.onerror=function(e){console.error(e),n(0);};}else n(0);}))},e.prototype.removeFirstData=function(t,n,i){return new Promise((function(n){if(e._db){var r=e._db.transaction([t],"readwrite").objectStore(t),o=r.getAllKeys(IDBKeyRange.lowerBound(0),i);o.onsuccess=function(){var e=o.result;e.length>0&&(r.delete(IDBKeyRange.bound(e[0],e[e.length-1])).onsuccess=function(){n(!0);});};}else n(!1);}))},e._db=null,e.indexDBSwitch=!0,e.opening=!1,e}(),it$1=function(){return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,(function(e){var t=16*Math.random()|0;return ("x"===e?t:3&t|8).toString(16)}))},rt$1=function(){var e=it$1();if(e="".concat(e.replace(/-/g,""),"a"),(e=function(e){var t="0123456789abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZa0".split(""),n=t.length+1,i=+e,r=[];do{var o=i%n;i=(i-o)/n,r.unshift(t[o]);}while(i);return r.join("")}(e=parseInt(e,16))).length>22&&(e=e.slice(0,22)),e.length<22)for(var t=22-e.length,n=0;n<t;n++)e+="0";return e},ot$1=rt$1(),st$1={};function at$1(e){return 4-e}console&&((et$1={})[de$1.DEBUG]=console.debug.bind(console),et$1[de$1.INFO]=console.info.bind(console),et$1[de$1.WARN]=console.warn.bind(console),et$1[de$1.ERROR]=console.error.bind(console),et$1[de$1.FATAL]=console.log.bind(console),st$1=et$1);var ct$1=[],ut$1=function(e){return Pe$1(e)||Ve$1(e)||He$1(e)||De$1(e)?e:e instanceof Error?JSON.stringify({name:e.name,message:e.message,stack:e.stack}):JSON.stringify(e)};function lt$1(e,t,n,i){t=/^[\w]+-[\w]+-[\w]+?/.test(t)?t:"L-".concat(t,"-O"),i||(i=["RCRTCLog","RCCall","RCRTC","RTC-A"].includes(t)?fe$1.RTC:fe$1.IM);var r=Date.now(),o="";try{var s=JSON.stringify(n);K$1(s)>=1e3?(s=function(e,t,n){if(void 0===n&&(n="utf-8"),!e||!t)return "";var i="utf-8"===n?3:2,r=0,o=0,s="";for(o=0;o<e.length;o++){if(e.charCodeAt(o)>255?r+=i:r++,r>t)return s;s+=e.charAt(o);}return e}(s,1e3),It$1(pe$1.G_UPLOAD_LOG_S,{msg:"Log length exceeds 1K",tagId:t})):s=n,o=(o=JSON.stringify({message:s,userId:dt$1.userId})).replace(/"/g,'""'),o='"'.concat(o,'"');}catch(e){Ct$1(pe$1.G_UPLOAD_LOG_E,{name:e.name,message:e.message,stack:e.stack});}var a=at$1(e),c={sessionId:ot$1,time:r,level:a,content:"".concat(ot$1,",").concat(Date.now(),",").concat(i,",").concat(a,",").concat(t,",").concat(o,"\n"),userId:dt$1.userId};return ct$1.push(c),c}function ht$1(e,t){for(var n=[],i=2;i<arguments.length;i++)n[i-2]=arguments[i];console&&st$1[e]&&st$1[e].apply(st$1,k$1(["".concat(t,":")],n,!1));}var dt$1={localLogLevel:de$1.WARN,userId:""},ft$1=-1;ft$1>=0&&(clearInterval(ft$1),ft$1=-1),"undefined"!=typeof window&&window&&window.indexedDB&&(ft$1=setInterval((function(){ct$1.length&&function(e){return D$1(this,void 0,void 0,(function(){var t,n,i;return V$1(this,(function(r){switch(r.label){case 0:if(!(t=tt$1.getInstance()))return [3,6];r.label=1;case 1:return r.trys.push([1,4,,5]),[4,t.addList(Xe$1,e)];case 2:return n=r.sent(),[4,t.getCount(Xe$1,"time")];case 3:return r.sent()>1e5&&t.removeFirstData(Xe$1,"time",2e3),[2,n];case 4:return i=r.sent(),Ct$1(pe$1.G_UPLOAD_LOG_E,{name:i.name,message:i.message,stack:i.stack}),[2,!1];case 5:return [3,7];case 6:return tt$1.init(),[2,!1];case 7:return [2]}}))}))}(ct$1.slice()).then((function(e){e&&(ct$1=[]);}));}),3e3));var pt$1=Date.now(),gt$1=0;function _t$1(){var e=Date.now();return pt$1!==e&&(pt$1=e,gt$1=0),"".concat(pt$1,"-").concat(gt$1++)}function mt$1(e){e.customLogPrint||delete e.customLogPrint,dt$1=Object.assign(dt$1,e);}function vt$1(e,t,n,i){if(void 0===n&&(n={}),void 0===i&&(i={}),e>de$1.DEBUG&&(i&&(n=Object.assign(n,i)),lt$1(e,t,n,null==i?void 0:i.logSource)),e>=dt$1.localLogLevel){var r="".concat((new Date).toISOString(),"[").concat(t,"][").concat(de$1[e],"]"),o="".concat(r," - ").concat(ut$1(n));dt$1.customLogPrint?dt$1.customLogPrint(e,o):ht$1(e,r,ut$1(n));}}var yt$1,Et$1=vt$1.bind(null,de$1.DEBUG),Tt$1=vt$1.bind(null,de$1.INFO),It$1=vt$1.bind(null,de$1.WARN),Ct$1=vt$1.bind(null,de$1.ERROR),Rt$1=vt$1.bind(null,de$1.FATAL),St$1=Object.freeze({__proto__:null,sessionId:ot$1,logLevelTransformer:at$1,formatLogObj:ut$1,insertIntoLogCache:lt$1,_defaultStdout:ht$1,ID:_t$1,init:mt$1,log:vt$1,debug:Et$1,info:Tt$1,warn:It$1,error:Ct$1,fatal:Rt$1}),Ot$1=function(e){if("browser"!==e.tag)return {type:e.tag,version:"UnKonw"};var t,n,i=navigator.userAgent,r={IE:/rv:([\d.]+)\) like Gecko|MSIE ([\d.]+)/,Edge:/Edge\/([\d.]+)/,Firefox:/Firefox\/([\d.]+)/,Opera:/(?:OPERA|OPR).([\d.]+)/,WeChat:/MicroMessenger\/([\d.]+)/,QQBrowser:/QQBrowser\/([\d.]+)/,Chrome:/Chrome\/([\d.]+)/,Safari:/Version\/([\d.]+).*Safari/,iOSChrome:/Mobile\/([\d.]+).*Safari/};for(var o in r)if(r.hasOwnProperty(o)){var s=i.match(r[o]);if(s){n=o,t=s[1]||s[2];break}}return {type:n||"UnKonw",version:t||"UnKonw"}},Nt$1=function(e){var t="RCDeviceId",n=U(e),i="",r=n.get(t);return r?i=r:(i=rt$1(),n.set(t,i)),i},Mt$1=function(){function e(){}return e.compress=function(e){for(var t=this,n={},i=0;i<e.length-1;i++){var r=e.charAt(i)+e.charAt(i+1);n.hasOwnProperty(r)?n[r].push(i):n[r]=[i];}for(var o=[],s=[],a=function(){if(s.length>0){var e=s.join("");if(s=[],e.length>26){var n=t.numberEncode(e.length),i=String.fromCharCode(t.dataType.NormalExt|n.length);o.push(i+n);}else {var r=String.fromCharCode(t.dataType.Normal|e.length);o.push(r);}o.push(e);}},c=0;c<e.length;){var u=t.indexOf(n,e,c);if(u.length<2)s.push(e.charAt(c++));else if(u.length<4)s.push(e.substr(c,u.length)),c+=u.length;else {var l=t.numberEncode(c-u.offset),h=t.numberEncode(u.length);if(l.length+h.length>=u.length)s.push(e.substr(c,u.length)),c+=u.length;else {a();var d=String.fromCharCode(t.dataType.Compressed|l.length<<2|h.length);o.push(d+l+h),c+=u.length;}}}a();var f=t.numberEncode(e.length),p=String.fromCharCode(t.dataType.Tail|f.length);return o.push(p+f),o.join("")},e.uncompress=function(e){var t=this,n=0,i="";e:do{var r=e.charCodeAt(n++),o=r&t.dataType.Mark,s=15&r,a=void 0;switch(o){case t.dataType.Compressed:var c=s>>2,u=3&s;if(0===c||0===u)throw new Error("Data parsing error,at "+n);var l=t.numberDecode(e.substr(n,c)),h=t.numberDecode(e.substr(n+=c,u));if((l=i.length-l)+h>i.length)throw new Error("Data parsing error,at "+n);n+=u,i+=i.substr(l,h);break;case t.dataType.Tail:if((a=t.numberDecode(e.substr(n,s)))!==i.length)throw console.log(i.length),console.log(a),new Error("Data parsing error,at "+n);n+=s;break e;case t.dataType.NormalExt:a=t.numberDecode(e.substr(n,s)),i+=e.substr(n+=s,a),n+=a;break;case t.dataType.Normal:i+=e.substr(n,s),n+=s;break;case t.dataType.Mark:if(s>10)throw new Error("Data parsing error,at "+n);i+=e.substr(n,16+s),n+=16+s;break;default:throw new Error("Data parsing error,at "+n+" header:"+o)}}while(n<e.length);return i},e.indexOf=function(e,t,n){var i={length:0,offset:-1};if(t.length,n>=t.length-1)return i;var r=e[t.charAt(n)+t.charAt(n+1)];if(r[0]===n)return i;for(var o=t.length-n,s=0,a=r.length;s<a;s++){var c=r[s],u=n-c;if(!(u>this.max)){var l=Math.min(o,u);if(l<=i.length)break;if(!(i.length>2&&t.charAt(c+i.length-1)!==t.charAt(n+i.length-1))){for(var h=2,d=h;d<l&&t.charAt(c+d)===t.charAt(n+d);d++)h++;h>=i.length&&(i.length=h,i.offset=c);}}}return i},e.numberEncode=function(e){var t=this,n=[],i=0;do{i=e%t.scale,n.push(t.chars.charAt(i)),e=(e-i)/t.scale;}while(e>0);return n.join("")},e.numberDecode=function(e){for(var t=0,n=0,i=e.length-1;i>=0;i--){if(-1===(n=this.chars.indexOf(e.charAt(i))))throw new Error('decode number error, data is "'+e+'"');t=t*this.scale+n;}return t},e.dataType={Tail:48,Compressed:64,NormalExt:80,Normal:96,Mark:112},e.chars="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",e.scale=e.chars.length,e.max=238327,e}(),Ut$1=function(e){return Pe$1(e)&&/https?:\/\//.test(e)},At$1=function(){function e(e){this.info=e,this.logUrl="logcollection.ronghub.com",this.level=1,this.itv=30,this.times=5,this.deviceId="",this.deviceInfo="",this.logSwitch=0,this.logUrl=e.logPolicy.url||this.logUrl,this.level=e.logPolicy.level||this.level,this.itv=e.logPolicy.itv||this.itv,this.times=e.logPolicy.times||this.times,this.deviceId=Nt$1(e.runtime),this.logSwitch=e.logSwitch;var t=Ot$1(e.runtime);this.deviceInfo="".concat(t.type,"|").concat(t.version,"|").concat(null==e?void 0:e.sessionId);}return e.prototype.updateUploadLogAttr=function(e){var t=e.logPolicy,n=e.logSwitch,i=e.runtime,r=e.sessionId,o=void 0===r?"":r,s=e.userId;if(t){var a=t.url,c=t.level,u=t.itv,l=t.times;this.logUrl=a||this.logUrl,this.level=c||this.level,this.itv=u||this.itv,this.times=l||this.times;}if(n&&(this.logSwitch=n),i){this.deviceId=Nt$1(i);var h=Ot$1(i);this.deviceInfo="".concat(h.type,"|").concat(h.version,"|").concat(o);}s&&(this.info.userId=s);},e.init=function(t){return e.reportSwitch=!0,e._instance||(e._instance=new e(t)),e._instance},e.getInstance=function(){return e._instance},e.prototype.reportRealtimeLog=function(t){var n=this;if(0===t.length||!this.logUrl)return Promise.resolve();var i=Mt$1.compress(t.map((function(e){return e.content})).join("")),r=Ut$1(this.logUrl)?"":"https://",o="".concat(r).concat(this.logUrl,"?version=").concat(this.info.version,"&appkey=").concat(this.info.appkey,"&userId=").concat(this.info.userId,"&deviceId=").concat(this.deviceId,"&deviceInfo=").concat(this.deviceInfo,"&platform=Web");return this.info.runtime.httpReq({method:"POST",url:o,body:i}).then((function(t){var i=t.data;i&&(i=JSON.parse(i),n.itv=i.nextTime,n.level=i.level,n.logSwitch=i.logSwitch,e.currentRTTimes=1);}))},e.prototype.reportFullLog=function(t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a,c,u,l,h,d,f=this;return V$1(this,(function(p){switch(p.label){case 0:return e.reportSwitch||It$1(pe$1.L_REPORT_FULL_LOG_O,{reportSwitch:!1}),n=t.startTime,i=t.endTime,r=t.platform,o=t.logId,s=t.uri,a=tt$1.getInstance(),"web"===r.toLowerCase()&&a?n>i?[2]:[4,a.getRangeData(Xe$1,"time",n,i)]:[2];case 1:return c=(c=p.sent()).filter((function(e){return !e.userId||e.userId===f.info.userId})),u=c.length,l=Mt$1.compress(c.map((function(e){return e.content})).join("")||"no data"),h=1,d=function(){if(h>3||!e.reportSwitch)return Promise.resolve();var t=s||f.logUrl,n=Ut$1(t)?"":"https://",i="".concat(n).concat(t,"?version=").concat(f.info.version,"&appkey=").concat(f.info.appkey,"&userId=").concat(f.info.userId,"&logId=").concat(o,"&deviceId=").concat(f.deviceId,"&deviceInfo=").concat(f.deviceInfo,"&platform=Web"),r=5e3*(h-1);return h++,new Promise((function(n){setTimeout((function(){var r=_t$1();Tt$1(pe$1.L_REPORT_FULL_LOG_T,{currentTimes:h-1,reportSwitch:e.reportSwitch,uri:t,length:u},{traceId:r}),e.reportSwitch&&f.info.runtime.httpReq({url:i,method:"POST",body:l}).then((function(e){var t=e.status,i=e.data;200!==t?(It$1(pe$1.L_REPORT_FULL_LOG_R,{status:t,data:i},{traceId:r}),n(d())):(Tt$1(pe$1.L_REPORT_FULL_LOG_R,{status:t,data:i},{traceId:r}),n());}));}),r);}))},[2,d()]}}))}))},e.prototype.distroy=function(){e.currentRTTimes=1,e.reportSwitch=!1;},e.currentRTTimes=1,e.reportSwitch=!1,e}(),Lt$1=[],wt$1=-1;function bt$1(e){null==yt$1||yt$1.updateUploadLogAttr(e);}function Pt$1(e,t,n,i){lt$1(4-e,t,n);var r=JSON.stringify({message:n});r=r.replace(/"/g,'""'),r='"'.concat(r,'"');var o={level:e,content:"".concat([ot$1,Date.now(),i||fe$1.IM,e,t,r].join(),"\n")};Lt$1.push(o),Lt$1.length>=600&&(Lt$1=Lt$1.slice(-500));}function Dt$1(){if(wt$1>=0&&(clearTimeout(wt$1),wt$1=-1),yt$1&&yt$1.logSwitch&&At$1.reportSwitch){var e=yt$1.itv*Math.pow(2,At$1.currentRTTimes-1);At$1.currentRTTimes<yt$1.times&&At$1.currentRTTimes++,wt$1=setTimeout((function(){var e=Lt$1.filter((function(e){return e.level<=yt$1.level}));0===e.length?Dt$1():yt$1.reportRealtimeLog(e).then((function(){Lt$1=[],Tt$1(pe$1.G_UPLOAD_LOG_S,"report real-time log success"),Dt$1();})).catch((function(e){Tt$1(pe$1.G_UPLOAD_LOG_E,"report real-time log error -> ".concat(e)),Dt$1();}));}),1e3*e);}}var Vt$1=function(){function e(e,t,n){this.tagId=e,this.logSource=t,this.initiator=n,this._localLogLevel=de$1.WARN,this.debug=this.log.bind(this,de$1.DEBUG),this.info=this.log.bind(this,de$1.INFO),this.warn=this.log.bind(this,de$1.WARN),this.error=this.log.bind(this,de$1.ERROR),this.fatal=this.log.bind(this,de$1.FATAL),this.reportLog=Pt$1;}return e.prototype.setLogLevel=function(e){this._localLogLevel="number"!=typeof e?de$1.WARN:e;},e.prototype.setLogStdout=function(e){this._customLogPrint=e;},e.prototype.log=function(e){for(var t=[],n=1;n<arguments.length;n++)t[n-1]=arguments[n];if(e>de$1.DEBUG&&lt$1(e,this.tagId,t.map(ut$1).join(" ")),!(e<this._localLogLevel)){var i="".concat((new Date).toISOString(),"[").concat(this.tagId,"][").concat(de$1[e],"]"),r="".concat(i," - ").concat(t.map(ut$1).join(" "));this._customLogPrint?this._customLogPrint(e,r):this._stdout?this._stdout(e,r):ht$1.apply(void 0,k$1([e,i],t,!1));}},e.prototype.set=function(e,t){this.warn("logger.set has being deprecated!");},e.prototype.setStdout=function(e){this._stdout=e;},e}(),kt$1=new Vt$1("RCEngine"),Gt$1=function(){function e(){this._map={};}return e.prototype.on=function(e,t,n){var i=this._map[e]||(this._map[e]=[]);i.some((function(e){return e.listener===t&&e.target===n}))||i.push({listener:t,target:n});},e.prototype.once=function(e,t,n){var i=this._map[e]||(this._map[e]=[]);i.some((function(e){return e.listener===t&&e.target===n}))||i.push({listener:t,target:n,once:!0});},e.prototype.off=function(e,t,n){var i=this._map[e];i&&((i=i.filter((function(e){return e.listener!==t||e.target!==n}))).length?this._map[e]=i:delete this._map[e]);},e.prototype.emit=function(e){for(var t=[],n=1;n<arguments.length;n++)t[n-1]=arguments[n];var i=this._map[e];if(i)for(var r=i.length-1;r>=0;r-=1){var o=i[r],s=o.target,a=o.once,c=o.listener;a&&i.splice(r,1);try{c.call.apply(c,k$1([s],t,!1));}catch(e){kt$1.error(e);}}},e.prototype.removeAll=function(e){delete this._map[e];},e.prototype.clear=function(){Object.keys(this._map).forEach(this.removeAll,this);},e}(),Bt$1="undefined"!=typeof window&&window?(window.__RCVersionInfo||(window.__RCVersionInfo={}),window.__RCVersionInfo):{};Bt$1.engine="5.5.5";var xt$1,Ft$1,Kt$1=function(){function e(){}return e.add=function(e,t){Bt$1[e]=t;},e.validEngine=function(e){var t=e.match(/\d+\.\d+\.\d+/);if(!t)return kt$1.warn("The validation engine version '".concat(e,"' is invalid!")),!1;var n=t[0].split(".").map((function(e){return e.padStart(3,"0")})).join("");return Bt$1.engine.match(/\d+\.\d+\.\d+/)[0].split(".").map((function(e){return e.padStart(3,"0")})).join("")>=n},e.getInfo=function(){return Bt$1},e}();!function(e){e[e.STRING=0]="STRING",e[e.ONLY_STRING=1]="ONLY_STRING",e[e.NUMBER=2]="NUMBER",e[e.BOOLEAN=3]="BOOLEAN",e[e.OBJECT=4]="OBJECT",e[e.ARRAY=5]="ARRAY",e[e.CALLBACK=6]="CALLBACK",e[e.CHANNEL_ID=7]="CHANNEL_ID",e[e.CONVERSATION=8]="CONVERSATION";}(Ft$1||(Ft$1={}));var Ht$1,qt$1,Yt$1,jt$1,Qt$1,Wt$1=((xt$1={})[Ft$1.STRING]=Be$1,xt$1[Ft$1.ONLY_STRING]=Pe$1,xt$1[Ft$1.NUMBER]=Ve$1,xt$1[Ft$1.BOOLEAN]=function(e){return "boolean"==typeof e},xt$1[Ft$1.OBJECT]=Fe$1,xt$1[Ft$1.ARRAY]=ke$1,xt$1[Ft$1.CALLBACK]=function(e){var t=!0;return Fe$1(e)||(t=!1),(e=e||{}).onSuccess&&!Ke$1(e.onSuccess)&&(t=!1),e.onError&&!Ke$1(e.onError)&&(t=!1),t},xt$1[Ft$1.CHANNEL_ID]=Je$1,xt$1[Ft$1.CONVERSATION]=function(e){var t=!0;return Fe$1(e)||(t=!1),Pe$1(e.targetId)||(t=!1),Qe$1(e.conversationType)||(t=!1),He$1(e.channelId)||Je$1(e.channelId)||(t=!1),t},xt$1),Jt$1=function(e){function t(t){var n=e.call(this,t)||this;return n.name="RCAssertError",n}return b$1(t,e),t}(Error),zt$1=function(e,t,n,i){if(void 0===i&&(i=!1),!Zt$1(e,t,n,i))throw new Jt$1("'".concat(e,"' is invalid: ").concat(JSON.stringify(t)))},Zt$1=function(e,t,n,i){void 0===i&&(i=!1),n=Wt$1[n]||n;var r=i&&!n(t)||!i&&!(He$1(t)||null===t||n(t));return r&&kt$1.error("'".concat(e,"' is invalid: ").concat(JSON.stringify(t))),!r},Xt$1=function(e){if(!Fe$1(e)||void 0===e.low||void 0===e.high)return e;var t=e.low;return t<0&&(t+=4294967296),t=t.toString(16),parseInt(e.high.toString(16)+"00000000".replace(new RegExp("0{".concat(t.length,"}$")),t),16)},$t$1=function(e,t){var n=Math.floor(1e3*Math.random()%1e4),i=it$1(),r=function(e){e=e||"-";var t=new Date,n=t.getFullYear(),i=t.getMonth()+1,r=t.getDate();return "".concat(n).concat(e).concat(i).concat(e).concat(r)}(),o=(new Date).getTime(),s="";if(t){var a=t.split(".");s=".".concat(a[a.length-1]);}return "".concat(e,"__RC-").concat(r,"_").concat(n,"_").concat(o).concat(i).concat(s)},tn$1=function(e,t){void 0===e&&(e={}),void 0===t&&(t={});var n=e.threadId,i=e.apnsCollapseId,r=e.category,o=e.richMediaUri,s=t.channelIdMi,a=t.channelIdHW,c=t.channelIdOPPO,u=t.typeVivo,l=t.googleConfig,h={};h["thread-id"]=n||"",h["apns-collapse-id"]=i||"",h.category=r||"",h.richMediaUri=o||"";var d={};d.collapse_key=null==l?void 0:l.collapseKey,d.imageUrl=null==l?void 0:l.imageUrl;var f=null==l?void 0:l.priority;f&&!["high","normal"].includes(f)&&(f="normal"),d.priority=f;var p=[{HW:{channelId:a||""}},{MI:{channelId:s||""}},{OPPO:{channelId:c||""}},{VIVO:{classification:u||""}},{APNS:h},{FCM:d}];return JSON.stringify(p)},nn$1=function(e,t){var n={},i={notificationId:t||""};if(!e)return {iOSConfig:n,androidConfig:i};try{var r=JSON.parse(e);null==r||r.forEach((function(e){var t,r,o,s,a=Object.keys(e);if(0!==a.length){var c=a[0];switch(c){case"HW":return void(i.channelIdHW=null===(t=e[c])||void 0===t?void 0:t.channelId);case"MI":return void(i.channelIdMi=null===(r=e[c])||void 0===r?void 0:r.channelId);case"OPPO":return void(i.channelIdOPPO=null===(o=e[c])||void 0===o?void 0:o.channelId);case"VIVO":return void(i.typeVivo=null===(s=e[c])||void 0===s?void 0:s.classification);case"APNS":return n.threadId=e[c]["thread-id"],n.apnsCollapseId=e[c]["apns-collapse-id"],n.category=e[c].category,void(n.richMediaUri=e[c].richMediaUri);case"FCM":i.googleConfig={collapseKey:e[c].collapse_key||"",imageUrl:e[c].imageUrl||"",priority:e[c].priority||""};}}}));}catch(t){kt$1.error("Wrong format for pushConfigs field! content: ".concat(e));}return {iOSConfig:n,androidConfig:i}},rn$1=function(e){var t=/^[A-Za-z0-9_=+-]+$/.test(e),n=e.length;return t&&(n<=128&&n>=1)},on$1=function(e){var t=e.length;return t<=4096&&t>=1},sn$1=(Ht$1=0,function(){var e=((4294967295&Date.now())>>>0).toString(2),t=Math.floor(Math.random()*(Math.pow(2,20)-1)),n=e+Ht$1.toString(2).padStart(11,"0")+t.toString(2).padStart(20,"0");return Ht$1=2047&++Ht$1,parseInt(n,2)}),an$1=function(e,t,n){var i=null==n?void 0:n.isReverse;Fe$1(e)&&function(){for(var n in e)t(e[n],n,e);}(),(ke$1(e)||Pe$1(e))&&function(){if(i)for(var n=e.length-1;n>=0;n--)t(e[n],n);else for(var r=0,o=e.length;r<o;r++)t(e[r],r);}();},cn$1=function(e,t){return an$1(e,(function(n,i){e[i]=t(n,i);})),e},un$1=function(e,t){if(e.indexOf)return e.indexOf(t);var n=-1;return an$1(e,(function(e,i){t===e&&(n=i);})),n},hn$1=function(e,t){var n=[];return an$1(e,(function(e){n.push(e);})),-1!==un$1(n,t)},dn$1=function(e){return JSON.parse(JSON.stringify(e))},fn$1=function(){return "undefined"!=typeof RCCppEngine},gn$1=function(e){switch(e){case te$1.SERVER_UNAVAILABLE:return z$1.SERVER_UNAVAILABLE;case te$1.TOKEN_INCORRECT:return z$1.RC_CONN_USER_OR_PASSWD_ERROR;case te$1.REDIRECT:return z$1.RC_CONN_REDIRECTED;case te$1.APP_BLOCK_OR_DELETE:return z$1.RC_CONN_APP_BLOCKED_OR_DELETED;case te$1.BLOCK:return z$1.RC_CONN_USER_BLOCKED;case te$1.TOKEN_EXPIRE:return z$1.RC_CONN_USER_OR_PASSWD_ERROR;case te$1.HOSTNAME_ERROR:return z$1.HOSTNAME_ERROR;case te$1.HASOHTERSAMECLIENTONLINE:return z$1.HAS_OHTER_SAME_CLIENT_ON_LINE;case te$1.APP_AUTH_NOT_PASS:return z$1.RC_APP_AUTH_NOT_PASS;case te$1.OTP_USED:return z$1.RC_OTP_USED;case te$1.PLATFORM_ERROR:return z$1.RC_PLATFORM_ERROR;default:return z$1.RC_NET_UNAVAILABLE}},_n$1=function(e){var t;if("object"==typeof e&&null!==e)if(Array.isArray(e))for(var n in t=[],e)t.push(_n$1(e[n]));else for(var n in t={},e)t[n]=_n$1(e[n]);else t=e;return t},mn$1=function(e){var t;try{t=_n$1(e);}catch(n){kt$1.error("clone err:",n),t=JSON.parse(JSON.stringify(e));}return t},vn$1=function(e){var t={},n=JSON.parse(e);return an$1(n,(function(e,n){t[n]=e.v;})),t},yn$1={_delayTime:0,setTime:function(e){var t=(new Date).getTime();yn$1._delayTime=t-e;},getTime:function(){var e=yn$1._delayTime;return (new Date).getTime()-e}},En$1=function(e,t){var n=0;return e.isAutoDelete&&(n|=1),e.isOverwrite&&(n|=2),2===t&&(n|=4),n};!function(e){e[e.AT_MOST_ONCE=0]="AT_MOST_ONCE",e[e.AT_LEAST_ONCE=1]="AT_LEAST_ONCE",e[e.EXACTLY_ONCE=2]="EXACTLY_ONCE",e[e.DEFAULT=3]="DEFAULT";}(qt$1||(qt$1={})),function(e){e[e.SYMMETRIC=0]="SYMMETRIC",e[e.CONNECT=1]="CONNECT",e[e.CONN_ACK=2]="CONN_ACK",e[e.PUBLISH=3]="PUBLISH",e[e.PUB_ACK=4]="PUB_ACK",e[e.QUERY=5]="QUERY",e[e.QUERY_ACK=6]="QUERY_ACK",e[e.QUERY_CONFIRM=7]="QUERY_CONFIRM",e[e.SUBSCRIBE=8]="SUBSCRIBE",e[e.SUB_ACK=9]="SUB_ACK",e[e.UNSUBSCRIBE=10]="UNSUBSCRIBE",e[e.UNSUB_ACK=11]="UNSUB_ACK",e[e.PING_REQ=12]="PING_REQ",e[e.PING_RESP=13]="PING_RESP",e[e.DISCONNECT=14]="DISCONNECT",e[e.RESERVER2=15]="RESERVER2";}(Yt$1||(Yt$1={})),function(e){e.PUB="pub",e.QUERY="qry";}(jt$1||(jt$1={})),function(e){e[e.V4=4]="V4",e[e.V3=3]="V3";}(Qt$1||(Qt$1={}));var Tn$1,In$1=function(){function e(e,t,n,i){void 0===t&&(t=!1),void 0===n&&(n=qt$1.AT_LEAST_ONCE),void 0===i&&(i=!1),this._retain=!1,this.qos=qt$1.AT_LEAST_ONCE,this._dup=!1,this.syncMsg=!1;var r=e>0;e&&r&&1===arguments.length?(this._retain=(1&e)>0,this.qos=(6&e)>>1,this._dup=(8&e)>0,this.type=e>>4&15,this.syncMsg=8==(8&e)):(this.type=e,this._retain=t,this.qos=n,this._dup=i);}return e.prototype.encode=function(){var e=this.type<<4;return e|=this._retain?1:0,e|=this.qos<<1,e|=this._dup?8:0},e}(),Cn$1=function(){function e(){}return e.writeUTF=function(e,t){var n=[],i=0;if(Pe$1(e))for(var r=0,o=e.length;r<o;r++){var s=e.charCodeAt(r);s>=0&&s<=127?(i+=1,n.push(s)):s>=128&&s<=2047?(i+=2,n.push(192|31&s>>6),n.push(128|63&s)):s>=2048&&s<=65535&&(i+=3,n.push(224|15&s>>12),n.push(128|63&s>>6),n.push(128|63&s));}for(r=0,o=n.length;r<o;r++)n[r]>255&&(n[r]&=255);return t?n:i<=255?[0,i].concat(n):[i>>8,255&i].concat(n)},e.readUTF=function(e){for(var t,n,i=[],r=-1,o=e,s="";++r<o.length;){var a=Number(o[r]);if(a===(127&a)||(240==(240&a)?a=(a=(a=(a^=240)<<6|128^o[++r])<<6|128^o[++r])<<6|128^o[++r]:224==(224&a)?a=(a=(a^=224)<<6|128^o[++r])<<6|128^o[++r]:192==(192&a)&&(a=(a^=192)<<6|128^o[++r])),!Number.isFinite(a)||a<0||a>1114111||Math.floor(a)!==a)throw RangeError("Invalid code point: ".concat(a));a<=65535?i.push(a):(t=(a-=65536)>>10|55296,n=a%1024|56320,i.push(t,n)),(r+1===o.length||i.length>16384)&&(s+=String.fromCharCode.apply(null,i),i.length=0);}return s},e}(),Rn$1=function(){function e(e){this._position=0,this._poolLen=0,this._pool=e,this._poolLen=e.length;}return e.prototype.check=function(){return this._position>=this._pool.length},e.prototype.read2Byte=function(){var e=this;if(e.check())return -1;for(var t="",n=0;n<2;n++){var i=e._pool[e._position++].toString(16);1===i.length&&(i="0".concat(i)),t+=i.toString();}return parseInt(t,16)},e.prototype.readInt=function(){var e=this;if(e.check())return -1;for(var t="",n=0;n<4;n++){var i=e._pool[e._position++].toString(16);1===i.length&&(i="0".concat(i)),t+=i.toString();}return parseInt(t,16)},e.prototype.readLong=function(){var e=this;if(e.check())return -1;for(var t="",n=0;n<8;n++){var i=e._pool[e._position++].toString(16);1===i.length&&(i="0".concat(i)),t+=i;}return parseInt(t,16)},e.prototype.readByte=function(){if(this.check())return -1;var e=this._pool[this._position++];return e>255&&(e&=255),e},e.prototype.readUTF=function(){if(this.check())return "";var e=this.readByte()<<8|this.readByte(),t=this._pool.subarray(this._position,this._position+=e);return Cn$1.readUTF(t)},e.prototype.readAll=function(){return this._pool.subarray(this._position,this._poolLen)},e}(),Sn$1=function(){function e(){this._pool=[],this._position=0,this._writen=0;}return e.prototype.write=function(e){return -1!==Object.prototype.toString.call(e).indexOf("Array")?this._pool=this._pool.concat(e):e>=0&&(e>255&&(e&=255),this._pool.push(e),this._writen++),e},e.prototype.writeArr=function(e){return this._pool=this._pool.concat(e),e},e.prototype.writeUTF=function(e){var t=Cn$1.writeUTF(e);this._pool=this._pool.concat(t),this._writen+=t.length;},e.prototype.getBytesArray=function(){return this._pool},e}(),On$1="UpStreamMessage",Nn$1="PushExtra",Mn$1="DownStreamMessage",Un$1="DownStreamMessages",An$1="SessionsAttQryInput",Ln$1="SessionsAttOutput",wn$1="SyncRequestMsg",bn$1="ChrmPullMsg",Pn$1="NotifyMsg",Dn$1="HistoryMsgInput",Vn$1="HistoryMsgOuput",kn$1="RelationQryInput",Gn$1="RelationsOutput",Bn$1="UnreadMsgInfo",xn$1="DeleteSessionsInput",Fn$1="SessionInfo",Kn$1="DeleteSessionsOutput",Hn$1="RelationsInput",qn$1="DeleteMsgInput",Yn$1="CleanHisMsgInput",jn$1="SessionMsgReadInput",Qn$1="ChrmInput",Wn$1="ChrmOutput",Jn$1="QueryChatRoomInfoInput",zn$1="QueryChatRoomInfoOutput",Zn$1="GetQNupTokenInput",Xn$1="GetQNupTokenOutput",$n$1="GetQNdownloadUrlInput",ei="GetDownloadUrlInput",ti="GetQNdownloadUrlOutput",ni="GetDownloadUrlOutput",ii="ChrmKVEntity",ri="SetChrmKV",oi="SetChrmKVS",si="DeleteChrmKVS",ai="ChrmKVOutput",ci="ChrmKVSOutput",ui="ChrmKVSVersionEntity",li="ChrmKVSOutputEntity",hi="QueryChrmKV",di="SetUserSettingInput",fi="SetUserSettingOutput",pi="PullUserSettingInput",gi="PullUserSettingOutput",_i="UserSettingNotification",mi="SessionReq",vi="SessionStates",yi="SessionState",Ei="SessionStateItem",Ti="SessionStateModifyReq",Ii="SessionStateModifyResp",Ci="GroupUnpushQuery",Ri="GroupUnpushSet",Si="QryRemindListReq",Oi="QryRemindListResp",Ni="GroupUnpushResult",Mi="GrpReadReceiptMsg",Ui="GrpReadReceiptQryReq",Ai="GrpReadReceiptQryResp",Li="GrpMsgReadUser",wi="SessionTagAddInput",bi="SessionTagItem",Pi="SessionTagDelInput",Di="SessionDisTagReq",Vi="ReportSDKInput",ki="ReportSDKOutput",Gi="UltraGrpPullSes",Bi="UltraGrpPullMsg",xi="MsgChangeReq",Fi="QueryMsgChange",Ki="MsgChange",Hi="MsgChangeList",qi="MsgQuery",Yi="MessageQueryInfo",ji="MsgQueryAck",Qi="OperateStatus",Wi="OperateStatusNotify",Ji="OperateInfo",zi="OperateSummary",Zi="SetRtcRoomIdInput",Xi="SetRtcRoomIdOutput",$i=((Tn$1={})[On$1]=["sessionId","classname","content","pushText","userId","configFlag","clientUniqueId","appData","extraContent","pushExt","busChannel"],Tn$1[Un$1]=["list","syncTime","finished","broadcastSyncTime"],Tn$1[Mn$1]=["fromUserId","type","groupId","classname","content","dataTime","status","msgId","extraContent","pushContent","configFlag","pushExt","busChannel","extStatus","toUserId","groupUnpush"],Tn$1[Nn$1]=["title","templateIdNoUse","pushId","pushConfigs","templateId"],Tn$1[An$1]=["nothing"],Tn$1[Ln$1]=["inboxTime","sendboxTime","totalUnreadCount"],Tn$1[wn$1]=["syncTime","ispolling","isweb","isPullSend","isKeeping","sendBoxSyncTime","broadcastSyncTime"],Tn$1[bn$1]=["syncTime","count"],Tn$1[Pn$1]=["type","time","chrmId"],Tn$1[Dn$1]=["targetId","time","count","order","busChannel"],Tn$1[Vn$1]=["list","syncTime","hasMsg"],Tn$1[kn$1]=["type","count","startTime","order"],Tn$1[Gn$1]=["info","isFinished"],Tn$1[Bn$1]=["msgId","msgTime","remindType"],Tn$1[xn$1]=["sessions"],Tn$1[Fn$1]=["type","channelId","busChannel"],Tn$1[Kn$1]=["nothing"],Tn$1[Hn$1]=["type","msg","count","busChannel","startTime","endTime"],Tn$1[qn$1]=["type","conversationId","msgs","busChannel"],Tn$1[Yn$1]=["targetId","dataTime","conversationType","busChannel"],Tn$1[jn$1]=["type","msgTime","channelId","busChannel"],Tn$1[Qn$1]=["nothing"],Tn$1[Wn$1]=["nothing","sessionId","joinTime"],Tn$1[Jn$1]=["count","order"],Tn$1[zn$1]=["userTotalNums","userInfos"],Tn$1[Zn$1]=["type","key","httpMethod","queryString"],Tn$1[$n$1]=["type","key","fileName"],Tn$1[ei]=["type","key","fileName"],Tn$1[Xn$1]=["deadline","token","bosToken","bosDate","path","osskeyId","ossPolicy","ossSign","ossBucketName"],Tn$1[ti]=["downloadUrl"],Tn$1[ni]=["downloadUrl"],Tn$1[ii]=["key","value","status","timestamp","uid","version"],Tn$1[ri]=["entry","bNotify","notification","type"],Tn$1[oi]=["entry","bNotify","notification","type"],Tn$1[si]=["entry","bNotify","notification","type"],Tn$1[ai]=["entries","bFullUpdate","syncTime"],Tn$1[ci]=["timestamp","errorKeys","keysVersion"],Tn$1[ui]=["version","key"],Tn$1[li]=["key","errorCode"],Tn$1[hi]=["timestamp"],Tn$1[di]=["version","value"],Tn$1[fi]=["version","reserve"],Tn$1[pi]=["version","reserve"],Tn$1[gi]=["items","version"],Tn$1.UserSettingItem=["targetId","type","key","value","version","status","tags"],Tn$1[mi]=["time"],Tn$1[vi]=["version","state"],Tn$1[yi]=["type","channelId","time","stateItem","busChannel"],Tn$1[Ei]=["sessionStateType","value","tags"],Tn$1[Ti]=["version","state"],Tn$1[Ii]=["version"],Tn$1[Ri]=["busChannel","unpushLevel"],Tn$1[Si]=["groupId","busChannel","msgTime","size"],Tn$1[Ci]=["busChannel"],Tn$1[Ni]=["groupId","busChannel","unpushLevel"],Tn$1[Mi]=["msgId","busChannel"],Tn$1[Ui]=["msgId","busChannel"],Tn$1[Ai]=["totalMemberNum","list"],Tn$1[Li]=["readTime","userId"],Tn$1[wi]=["version","tags"],Tn$1[bi]=["tagId","name","createdTime","isTop"],Tn$1[Pi]=["version","tags"],Tn$1[Di]=["tagId"],Tn$1[_i]=["version","reserve"],Tn$1[Vi]=["sdkInfo"],Tn$1[ki]=["nothing"],Tn$1[Gi]=["syncTime","isEraseMsgContent"],Tn$1[Bi]=["syncTime"],Tn$1[xi]=["fromUserId","targetId","type","busChannel","msgUID","msgTime","content"],Tn$1[Fi]=["syncTime"],Tn$1[Hi]=["list","syncTime","hasNext"],Tn$1[Ki]=["targetId","type","time","changeType","msgUID","msgTime","busChannel","isAdmin","isDel","operatorId","subChangeType"],Tn$1[qi]=["targetId","type","query"],Tn$1[Yi]=["msgTime","msgUID","busChannel"],Tn$1[ji]=["list"],Tn$1[Qi]=["targetId","type","opType","busChannel"],Tn$1[Wi]=["type","notifyType","info","summary"],Tn$1[Ji]=["targetId","busChannel","userId","opType","optime"],Tn$1[zi]=["targetId","busChannel","count","opType"],Tn$1[Zi]=["rtcRoomId"],Tn$1[Xi]=["nothing"],Tn$1),er="\npackage Modules;\nmessage probuf {\n  message SetUserStatusOutput\n  {\n    optional int32 nothing=1;\n  }\n\n  message GetUserStatusInput\n  {\n    optional int32 nothing=1;\n  }\n\n  message GetUserStatusOutput\n  {\n    optional string status=1;\n    optional string subUserId=2;\n  }\n\n  message SubUserStatusInput\n  {\n    repeated string userid =1;\n  }\n\n  message SubUserStatusOutput\n  {\n    optional int32 nothing=1;\n  }\n  message VoipDynamicInput\n  {\n    required int32  engineType = 1;\n    required string channelName = 2;\n    optional string channelExtra = 3;\n  }\n\n  message VoipDynamicOutput\n  {\n      required string dynamicKey=1;\n  }\n  message ".concat(Pn$1," {\n    required int32 type = 1;\n    optional int64 time = 2;\n    optional string chrmId=3;\n  }\n  message ").concat(wn$1," {\n    required int64 syncTime = 1;\n    required bool ispolling = 2;\n    optional bool isweb=3;\n    optional bool isPullSend=4;\n    optional bool isKeeping=5;\n    optional int64 sendBoxSyncTime=6;\n    optional int64 broadcastSyncTime=7;\n  }\n  message ").concat(On$1," {\n    required int32 sessionId = 1;\n    required string classname = 2;\n    required bytes content = 3;\n    optional string pushText = 4;\n    optional string appData = 5;\n    repeated string userId = 6;\n    optional int64 delMsgTime = 7;\n    optional string delMsgId = 8;\n    optional int32 configFlag = 9;\n    optional int64 clientUniqueId = 10;\n    optional string extraContent = 11;\n    optional PushExtra pushExt = 12;\n    optional string busChannel = 13; // 该消息所属会话的业务标识\n  }\n  message ").concat(Nn$1," {\n    optional string title = 1;\n    optional int32  templateIdNoUse= 2;\n    optional string pushId = 3;\n    optional string pushConfigs = 4;\n    optional string templateId = 5;\n  }\n  message ").concat(Un$1," {\n    repeated DownStreamMessage list = 1;\n    required int64 syncTime = 2;\n    optional bool finished = 3;\n    optional int64 broadcastSyncTime = 4;\n  }\n  message ").concat(Mn$1," {\n    required string fromUserId = 1;\n    required ChannelType type = 2;\n    optional string groupId = 3;\n    required string classname = 4;\n    required bytes content = 5;\n    required int64 dataTime = 6;\n    required int64 status = 7;\n    optional int64 extra = 8;\n    optional string msgId = 9;\n    optional int32 direction = 10;\n    optional int32 plantform =11;\n    optional int32 isRemoved = 12;\n    optional string source = 13;\n    optional int64 clientUniqueId = 14;\n    optional string extraContent = 15;\n    optional string pushContent = 16;\n    optional int32 configFlag = 17;\n    optional PushExtra pushExt = 18;\n    optional string busChannel = 19; // 该消息所属会话的业务标识，限制20字符以内\n    // 消息的扩展标记\n    // 第0位,表示送达状态: 0x01 表示已送达;\n    // 断档: 0x02 表示是否需要执行断档策略;\n    // 消息修改: 0x04 拉取历史消息时表示该消息是否修改过\n    // 0x08 每条消息携带的频道类型\n    optional int64 extStatus = 20;\n    repeated string toUserId = 21;  //指定接收者（限定群和讨论组）//增加聊天室定向成员\n    optional int32 groupUnpush = 22; //群聊默认免打扰级别\n  }\n  enum ChannelType {\n    PERSON = 1;\n    PERSONS = 2;\n    GROUP = 3;\n    TEMPGROUP = 4;\n    CUSTOMERSERVICE = 5;\n    NOTIFY = 6;\n    MC=7;\n    MP=8;\n    ULTRAGROUP = 10;\n  }\n  message CreateDiscussionInput {\n    optional string name = 1;\n  }\n  message CreateDiscussionOutput {\n    required string id = 1;\n  }\n  message ChannelInvitationInput {\n    repeated string users = 1;\n  }\n  message LeaveChannelInput {\n    required int32 nothing = 1;\n  }\n  message ChannelEvictionInput {\n    required string user = 1;\n  }\n  message RenameChannelInput {\n    required string name = 1;\n  }\n  message ChannelInfoInput {\n    required int32 nothing = 1;\n  }\n  message ChannelInfoOutput {\n    required ChannelType type = 1;\n    required string channelId = 2;\n    required string channelName = 3;\n    required string adminUserId = 4;\n    repeated string firstTenUserIds = 5;\n    required int32 openStatus = 6;\n  }\n  message ChannelInfosInput {\n    required int32 page = 1;\n    optional int32 number = 2;\n  }\n  message ChannelInfosOutput {\n    repeated ChannelInfoOutput channels = 1;\n    required int32 total = 2;\n  }\n  message MemberInfo {\n    required string userId = 1;\n    required string userName = 2;\n    required string userPortrait = 3;\n    required string extension = 4;\n  }\n  message GroupMembersInput {\n    required int32 page = 1;\n    optional int32 number = 2;\n  }\n  message GroupMembersOutput {\n    repeated MemberInfo members = 1;\n    required int32 total = 2;\n  }\n  message GetUserInfoInput {\n    required int32 nothing = 1;\n  }\n  message GetUserInfoOutput {\n    required string userId = 1;\n    required string userName = 2;\n    required string userPortrait = 3;\n  }\n  message GetSessionIdInput {\n    required int32 nothing = 1;\n  }\n  message GetSessionIdOutput {\n    required int32 sessionId = 1;\n  }\n  enum FileType {\n    image = ").concat(j$1.IMAGE,";\n    audio = ").concat(j$1.AUDIO,";\n    video = ").concat(j$1.VIDEO,";\n    file = ").concat(j$1.FILE,";\n  }\n  message ").concat(Zn$1," {\n    required FileType type = 1;\n    optional string key = 2;\n    optional string httpMethod = 3;\n    optional string queryString = 4;\n  }\n  message ").concat($n$1," {\n    required FileType type = 1;\n    required string key = 2;\n    optional string  fileName = 3;\n  }\n  message ").concat(ei," {\n    required FileType type = 1;\n    required string key = 2;\n    optional string fileName = 3;\n   }\n  message ").concat(Xn$1," {\n    required int64 deadline = 1;\n    required string token = 2;\n    optional string bosToken = 3;\n    optional string bosDate = 4;\n    optional string path = 5;\n    optional string osskeyId = 6;\n    optional string ossPolicy = 7;\n    optional string ossSign = 8;\n    optional string ossBucketName = 9;\n    optional string s3Credential = 10;\n    optional string s3Algorithm = 11;\n    optional string s3Date = 12;\n    optional string s3Policy = 13;\n    optional string s3Signature = 14;\n    optional string s3BucketName = 15;\n    optional string stcAuthorization = 16;\n    optional string stcContentSha256 = 17;\n    optional string stcDate = 18;\n    optional string stcBucketName = 19;\n  }\n  message ").concat(ti," {\n    required string downloadUrl = 1;\n  }\n  message ").concat(ni," {\n    required string downloadUrl = 1;\n  }\n  message Add2BlackListInput {\n    required string userId = 1;\n  }\n  message RemoveFromBlackListInput {\n    required string userId = 1;\n  }\n  message QueryBlackListInput {\n    required int32 nothing = 1;\n  }\n  message QueryBlackListOutput {\n    repeated string userIds = 1;\n  }\n  message BlackListStatusInput {\n    required string userId = 1;\n  }\n  message BlockPushInput {\n    required string blockeeId = 1;\n  }\n  message ModifyPermissionInput {\n    required int32 openStatus = 1;\n  }\n  message GroupInput {\n    repeated GroupInfo groupInfo = 1;\n  }\n  message GroupOutput {\n    required int32 nothing = 1;\n  }\n  message GroupInfo {\n    required string id = 1;\n    required string name = 2;\n  }\n  message GroupHashInput {\n    required string userId = 1;\n    required string groupHashCode = 2;\n  }\n  message GroupHashOutput {\n    required GroupHashType result = 1;\n  }\n  enum GroupHashType {\n    group_success = 0x00;\n    group_failure = 0x01;\n  }\n  message ").concat(Qn$1," {\n    required int32 nothing = 1;\n  }\n  message ").concat(Wn$1," {\n    required int32 nothing = 1;\n    optional string sessionId = 2;\n    optional int64 joinTime = 3;\n  }\n  message ").concat(bn$1," {\n    required int64 syncTime = 1;\n    required int32 count = 2;\n  }\n\n  message ChrmPullMsgNew\n  {\n    required int32 count = 1;\n    required int64 syncTime = 2;\n    optional string chrmId=3;\n  }\n  message ").concat(kn$1,"\n  {\n    optional ChannelType type = 1;\n    optional int32 count = 2;\n    optional int64 startTime = 3;\n    optional int32 order = 4;\n  }\n  message ").concat(Hn$1,"\n  {\n    required ChannelType type = 1;\n    optional DownStreamMessage msg =2;\n    optional int32 count = 3;\n    repeated string busChannel = 4;\n    optional int64 startTime = 5;\n    optional int64 endTime = 6;\n  }\n  message ").concat(Gn$1,"\n  {\n    repeated RelationInfo info = 1;\n    optional bool isFinished = 2;//是否结束\n  }\n  message RelationInfo\n  {\n    required ChannelType type = 1;\n    required string userId = 2;\n    optional DownStreamMessage msg =3;\n    optional int64 readMsgTime= 4;\n    optional int64 unreadCount= 5;\n    optional string busChannel = 6;//该消息所属会话的业务标识\n    optional int64 versionTime = 7;//会话项变更时间戳，注意:非排序时间戳\n    optional int64 remindCount = 8;//被@的未读数\n    optional int32 busChannelType = 9; // 0: 公有频道; 1: 私有频道;\n    optional ").concat(Bn$1," msgInfo = 10;// 新增 首条未读消息信息，可为空\n  }\n  message ").concat(Bn$1," //未读消息摘要信息\n  {\n    required string msgId = 1;  //消息唯一标示\n    required int64 msgTime= 2;//消息时间\n    optional int32 remindType= 3;//@类型。查询会话时无此字段。查询未读@列表时返回\n  }\n  message ").concat(Si," // 新增 查询未读@列表入参\n  {\n    required string groupId =  1; // 群 ID\n    optional string busChannel = 2; // 频道(channelId,可以为空)\n    optional int64 msgTime = 3; // 消息时间戳\n    optional int32 size = 4; // 单页长度，默认20，最大20\n  }\n  message ").concat(Oi," //查询未读@列表出参\n  {\n    repeated ").concat(Bn$1," msgInfo = 1;  //未读@消息摘要列表\n  }\n  message RelationInfoReadTime\n  {\n    required ChannelType type = 1;\n    required int64 readMsgTime= 2;\n    required string targetId = 3;\n  }\n  message ").concat(Yn$1,"\n  {\n      required string targetId = 1;\n      required int64 dataTime = 2;\n      optional int32 conversationType= 3;\n      optional string busChannel = 4; //该消息所属会话的业务标识，限制20字符以内\n  }\n  message HistoryMessageInput\n  {\n    required string targetId = 1;\n    required int64 dataTime =2;\n    required int32 size  = 3;\n  }\n\n  message HistoryMessagesOuput\n  {\n    repeated DownStreamMessage list = 1;\n    required int64 syncTime = 2;\n    required int32 hasMsg = 3;\n  }\n  message ").concat(Jn$1,"\n  {\n    required int32 count= 1;\n    optional int32 order= 2;\n  }\n\n  message ").concat(zn$1,"\n  {\n    optional int32 userTotalNums = 1;\n    repeated ChrmMember userInfos = 2;\n  }\n  message ChrmMember\n  {\n    required int64 time = 1;\n    required string id = 2;\n  }\n  message MPFollowInput\n  {\n    required string id = 1;\n  }\n\n  message MPFollowOutput\n  {\n    required int32 nothing = 1;\n    optional MpInfo info =2;\n  }\n\n  message MCFollowOutput\n  {\n    required int32 nothing = 1;\n    optional MpInfo info =2;\n  }\n\n  message MpInfo\n  {\n    required string mpid=1;\n    required string name = 2;\n    required string type = 3;\n    required int64 time=4;\n    optional string portraitUrl=5;\n    optional string extra =6;\n  }\n\n  message SearchMpInput\n  {\n    required int32 type=1;\n    required string id=2;\n  }\n\n  message SearchMpOutput\n  {\n    required int32 nothing=1;\n    repeated MpInfo info = 2;\n  }\n\n  message PullMpInput\n  {\n    required int64 time=1;\n    required string mpid=2;\n  }\n\n  message PullMpOutput\n  {\n    required int32 status=1;\n    repeated MpInfo info = 2;\n  }\n  message ").concat(Dn$1,"\n  {\n    optional string targetId = 1;\n    optional int64 time = 2;\n    optional int32 count  = 3;\n    optional int32 order = 4;\n    optional string busChannel = 5; //该消息所属会话的业务标识，限制20字符以内\n  }\n\n  message ").concat(Vn$1,"\n  {\n    repeated DownStreamMessage list=1;\n    required int64 syncTime=2;\n    required int32 hasMsg=3;\n  }\n  message ").concat(An$1,"{\n    required int32 nothing = 1;\n  }\n  message ").concat(Ln$1,"{\n    required int64 inboxTime = 1;\n    required int64 sendboxTime = 2;\n    required int64 totalUnreadCount = 3;\n  }\n  message ").concat(jn$1,"\n  {\n    required ChannelType type = 1;\n    required int64 msgTime = 2;\n    required string channelId = 3;\n    optional string busChannel = 4;//该消息所属会话的业务标识\n  }\n  message SessionMsgReadOutput\n  {\n    optional int32 nothing=1;\n  }\n  message ").concat(xn$1,"\n  {\n    repeated SessionInfo sessions = 1;\n  }\n  message ").concat(Fn$1,"\n  {\n    required ChannelType type = 1;\n    required string channelId = 2;\n    optional string busChannel = 3;//所属会话业务标识\n  }\n  message ").concat(Kn$1,"\n  {\n    optional int32 nothing=1;\n  }\n  message ").concat(qn$1,"\n  {\n    optional ChannelType type = 1;\n    optional string conversationId = 2;\n    repeated DeleteMsg msgs = 3;\n    optional string busChannel = 4; //该消息所属会话的业务标识，限制20字符以内\n  }\n  message DeleteMsg\n  {\n    optional string msgId = 1;\n    optional int64 msgDataTime = 2;\n    optional int32 direct = 3;\n  }\n  message ChrmKVEntity {\n    required string key = 1;\n    required string value = 2;\n    optional int32 status = 3;\n    optional int64 timestamp = 4;\n    optional string uid = 5;\n    optional int64 version = 6;\n  }\n  message ").concat(ri," {\n    required ChrmKVEntity entry = 1;\n    optional bool bNotify = 2;\n    optional UpStreamMessage notification = 3;\n    optional ChannelType type = 4;\n  }\n  message ").concat(oi," {\n    repeated ChrmKVEntity entry = 1;\n    optional bool bNotify = 2;\n    optional UpStreamMessage notification = 3;\n    optional ChannelType type = 4;\n  }\n  message ").concat(si," {\n    repeated ChrmKVEntity entry = 1;\n    optional bool bNotify = 2;\n    optional UpStreamMessage notification = 3;\n    optional ChannelType type = 4;\n  }\n  message ").concat(ai," {\n    repeated ChrmKVEntity entries = 1;\n    optional bool bFullUpdate = 2;\n    optional int64 syncTime = 3;\n  }\n  message ChrmKVSVersionEntity {\n    optional int64 version = 1;\n    optional string key = 2;\n  }\n\n  message ").concat(ci," {\n    repeated ChrmKVSOutputEntity errorKeys = 1;\n    repeated ChrmKVSVersionEntity keysVersion = 2;\n  }\n  message ").concat(li,"\n  {\n    optional string key = 1;\n    optional int32 errorCode = 2;\n  }\n  message ").concat(hi," {\n    required int64 timestamp = 1;\n  }\n  message ").concat(di," {\n    required int64 version=1;\n    required string value=2;\n  }\n  message ").concat(fi," {\n    required int64 version=1;\n    required bool reserve=2;\n  }\n  message ").concat(pi," {\n    required int64 version=1;\n    optional bool reserve=2;\n  }\n  message ").concat(gi," {\n    repeated UserSettingItem items = 1;\n    required int64 version=2;\n  }\n  message UserSettingItem {\n    required string targetId= 1;\n    required ChannelType type = 2;\n    required string key = 4;\n    required bytes value = 5;\n    required int64 version=6;\n    required int32 status=7;\n    repeated SessionTagItem tags= 8;\n  }\n  message ").concat(mi," {\n    required int64 time = 1;\n  }\n  message ").concat(vi," {\n    required int64 version=1;\n    repeated SessionState state= 2;\n  }\n  message ").concat(yi," {\n    required ChannelType type = 1;\n    required string channelId = 2;\n    optional int64 time = 3;\n    repeated SessionStateItem stateItem = 4;\n    optional string busChannel = 5;//该消息所属会话的业务标识\n  }\n  message ").concat(Ei," {\n    required SessionStateType sessionStateType = 1;\n    required string value = 2;\n    repeated SessionTagItem tags = 3;\n  }\n  enum SessionStateType {\n    IsSilent = 1;\n    IsTop = 2;\n    Tags = 3;\n  }\n  message ").concat(Ti," {\n    required int64 version=1;\n    repeated SessionState state= 2;\n  }\n  message ").concat(Ci," {\n    optional string busChannel = 1;\n  }\n  message ").concat(Ri,"{\n    optional string busChannel = 1;\n    required int32 unpushLevel = 2;\n  }\n  message ").concat(Ni," {\n    required string groupId = 1;\n    optional string busChannel = 2;\n    required int32 unpushLevel = 3;\n  }\n  message ").concat(Ii," {\n    required int64 version=1;\n  }\n  message ").concat(Mi," {\n    repeated string msgId=1; //已读消息ID\n    optional string channelId = 2; // 该消息所属会话的业务标识\n  }\n  message ").concat(Ui," {\n    repeated string msgId=1; //已读消息ID\n    optional string channelId = 2; // 该消息所属会话的业务标识\n  }\n  message ").concat(Ai," {\n    required int32 totalMemberNum = 1;//群内总人数\n    repeated GrpMsgReadUser list = 2;//已读用户列表（list复类型）\n  }\n  message ").concat(Li," {\n    required int64 readTime = 1;//已读时间\n    required string userId = 2;//已读用户id\n  }\n  message ").concat(wi," {\n    required int64 version=1;\n    repeated SessionTagItem tags=2;\n  }\n  message ").concat(bi," {\n    required string tagId=1;\n    optional string name=2;\n    optional int64 createdTime=3;\n    optional bool isTop=4;\n  }\n  message ").concat(Pi," {\n    required int64 version=1;\n    repeated SessionTagItem tags=2;\n  }\n  message ").concat(Di," {\n    repeated string tagId=1;\n  }\n  message ").concat(_i," {\n    required int64 version=1;\n    required bool reserve=2;\n  }\n  message ").concat(Vi,' {\n    required string sdkInfo=1; // 用户集成的 sdk 信息,json 格式 {"web-rtc": "4.0.3.7"}\n  }\n  message ').concat(ki,"\n  {\n    optional int32 nothing=1; //占位\n  }\n  message ").concat(Gi,"\n  {\n      required int64 syncTime = 1;//同步时间戳\n      optional bool isEraseMsgContent = 2;//拉取会话时，是否屏蔽掉消息内容\n  }\n  message ").concat(Bi,"\n  {\n    required int64 syncTime = 1;//同步时间戳\n  }\n  message  ").concat(xi,"\n  {\n    required string fromUserId = 1;//（谁发的）\n    required string targetId = 2;// 目标Id(超级群Id)\n    required ChannelType type = 3;//发送类型如：（P2P,GROUP,ULTRAGROUP）\n    required string msgUID = 4; // 扩展消息的内容体\n    required int64 msgTime = 5; //原始消息时间\n    optional string busChannel = 6; // 该消息所属会话的业务标识，限制20字符以内\n    optional string content = 7; // 即extraContent消息扩展内容,下表格说明\n  }\n  message ").concat(Fi,"  //查询入参\n  {\n    required int64 syncTime = 1;//同步时间戳\n  }\n  message ").concat(Hi,"  //应答结果\n  {\n    repeated MsgChange list = 1; //变更\n    required int64 syncTime = 2; //同步时间(用于下次同步入参)\n    optional bool  hasNext = 3 ;\n  }\n  message ").concat(Ki,"  //变更详情\n  {\n    required string targetId = 1; //  目标Id(超级群Id)\n    required ChannelType type = 2; //  会话类型\n    required int64 time = 3;  // 变更时间\n    required int32 changeType = 4;  // 消息变更类型(1:扩展,2:修改,3:撤回,4:频道变更)\n    required string msgUID  = 5;  // 消息ID\n    required int64 msgTime = 6;  //  消息时间\n    optional string busChannel = 7; // 频道ID\n    optional bool isAdmin = 8; //是否为管理员，默认为 0, 设为 1 时, IMKit 收到此条消息后，小灰条默认显示为“管理员 撤回了一条消息”。\n    optional bool isDel = 9; //默认为 0 撤回该条消息同时，用户端将该条消息删除并替换为一条小灰条撤回提示消息；为 1 时，该条消息删除后，不替换为小灰条提示消息。\n    optional string operatorId = 10; // 消息变更的操作人 Id; subChangeType 为 5 时，operatorId 表示被踢出超级群私有频道白名单的用户\n    // 当 changeType 为 4 时，该参数有意义;\n    // 1: 删除频道;\n    // 2: 公有频道变为私有频道;\n    // 3: 私有频道变为公有频道;\n    // 4: 私有频道成员变更-加入, SDK 不通知业务层;\n    // 5: 私有频道成员变更-退出;\n    // 6: 公有频道变为私有频道，当前用户不在白名单中;\n    optional int32 subChangeType = 11;\n  }\n  message ").concat(qi,"  //请求\n  {\n    required string targetId = 1; //  目标Id(超级群Id)\n    required ChannelType type = 2; //  会话类型\n    repeated MessageQueryInfo query = 3; //\n  }\n  message MessageQueryInfo\n  {\n    required int64 msgTime = 1;  // 消息时间\n    required string msgUID  = 2;  // 消息ID\n    optional string busChannel = 3; // 频道ID\n  }\n  message ").concat(ji,"  //应答\n  {\n    repeated DownStreamMessage list = 1;//消息\n  }\n  message ").concat(Qi,"  //客户端发送\n  {\n    optional string targetId =  1;// targetId\n    optional ChannelType type = 2;//发送会话类型如：（P2P,GROUP） \n    optional int32 opType = 3;  //0 , 正在输入, 1 正在XXX  \n    optional string busChannel = 4; // 频道(channelId,可以为空)\n  }\n  message ").concat(Wi,"  //服务端发送\n  {\n      optional ChannelType type = 1;//发送会话类型如（P2P,GROUP） \n      optional int64 notifyType = 2; //0x1 表示明细, 0x2 表示汇总 0x3 表示明细+汇总\n      repeated OperateInfo info = 3 ; //明细列表 当notifyType 为 1和3时,有效\n      repeated OperateSummary summary = 4 ; //汇总列表, 当notifyType 为2和3 时,有效\n  }\n  message ").concat(Ji," {\n    // XX 正在做什么\n    optional string targetId = 1; // 超级群Id  会话id\n    optional string busChannel = 2; // 频道(channelId,可以为空)\n    optional string userId = 3; // userId\n    optional int32 opType = 4;  //0 , 正在输入, 1 正在XX \n    optional int64 optime = 5;  //服务端收到用户操作的上行时间. \n  }\n      \n  message ").concat(zi," {\n    // 几个人 正在干什么\n    optional string targetId = 1; // 超级群Id  会话id\n    optional string busChannel = 2; // 频道(channelId,可以为空)\n    optional int32 count  = 3; // 操作人数\n    optional int32 opType = 4; //0, 正在输入, 1 正在XX \n  }\n\n  message ").concat(Zi,"\n  {\n    required string  rtcRoomId= 1;  //rtc房间ID;\n  }\n  message ").concat(Xi,"\n  {\n    required int32 nothing = 1;   //用于占位\n  }\n}\n"),tr={},nr=function(e){var t=$i[e];tr[e]=function(){for(var e={},n={getArrayData:function(){return e}},i=function(i){var r=t[i],o="set".concat(F$1(r,0,1));n[o]=function(t){e[r]=t;};},r=0;r<t.length;r++)i(r);return n},tr[e].decode=function(e){var t={};Pe$1(e)&&(e=JSON.parse(e));var n=function(n){var i="get".concat(F$1(n,0,1));t[n]=e[n],t[i]=function(){return e[n]};};for(var i in e)n(i);return t};};for(var ir in $i)nr(ir);function rr(e){var t=function(){function e(e,t,n){this.low=0|e,this.high=0|t,this.unsigned=!!n;}function t(e){return !0===(e&&e.__isLong__)}function n(e,t){var n,i,o;return t?(o=(e>>>=0)>=0&&e<256)&&(i=c[e])?i:(n=r(e,(0|e)<0?-1:0,!0),o&&(c[e]=n),n):(o=(e|=0)>=-128&&e<128)&&(i=a[e])?i:(n=r(e,e<0?-1:0,!1),o&&(a[e]=n),n)}function i(e,t){if(isNaN(e)||!isFinite(e))return t?g:p;if(t){if(e<0)return g;if(e>=h)return E}else {if(-d>=e)return T;if(e+1>=d)return y}return e<0?i(-e,t).neg():r(0|e%l,0|e/l,t)}function r(t,n,i){return new e(t,n,i)}function o(e,t,n){var r,s,a,c,l,h,d;if(0===e.length)throw Error("empty string");if("NaN"===e||"Infinity"===e||"+Infinity"===e||"-Infinity"===e)return p;if("number"==typeof t?(n=t,t=!1):t=!!t,(n=n||10)<2||n>36)throw RangeError("radix");if((r=e.indexOf("-"))>0)throw Error("interior hyphen");if(0===r)return o(e.substring(1),t,n).neg();for(s=i(u(n,8)),a=p,c=0;c<e.length;c+=8)l=Math.min(8,e.length-c),h=parseInt(e.substring(c,c+l),n),l<8?(d=i(u(n,l)),a=a.mul(d).add(i(h))):a=(a=a.mul(s)).add(i(h));return a.unsigned=t,a}function s(t){return t instanceof e?t:"number"==typeof t?i(t):"string"==typeof t?o(t):r(t.low,t.high,t.unsigned)}var a,c,u,l,h,d,f,p,g,_,m,v,y,E,T,I;return e.prototype.__isLong__,Object.defineProperty(e.prototype,"__isLong__",{value:!0,enumerable:!1,configurable:!1}),e.isLong=t,a={},c={},e.fromInt=n,e.fromNumber=i,e.fromBits=r,u=Math.pow,e.fromString=o,e.fromValue=s,d=(h=(l=4294967296)*l)/2,f=n(16777216),p=n(0),e.ZERO=p,g=n(0,!0),e.UZERO=g,_=n(1),e.ONE=_,m=n(1,!0),e.UONE=m,v=n(-1),e.NEG_ONE=v,y=r(-1,2147483647,!1),e.MAX_VALUE=y,E=r(-1,-1,!0),e.MAX_UNSIGNED_VALUE=E,T=r(0,-2147483648,!1),e.MIN_VALUE=T,(I=e.prototype).toInt=function(){return this.unsigned?this.low>>>0:this.low},I.toNumber=function(){return this.unsigned?(this.high>>>0)*l+(this.low>>>0):this.high*l+(this.low>>>0)},I.toString=function(e){var t,n,r,o,s,a,c,l;if((e=e||10)<2||e>36)throw RangeError("radix");if(this.isZero())return "0";if(this.isNegative())return this.eq(T)?(t=i(e),r=(n=this.div(t)).mul(t).sub(this),n.toString(e)+r.toInt().toString(e)):"-"+this.neg().toString(e);for(o=i(u(e,6),this.unsigned),s=this,a="";;){if(c=s.div(o),l=(s.sub(c.mul(o)).toInt()>>>0).toString(e),(s=c).isZero())return l+a;for(;l.length<6;)l="0"+l;a=""+l+a;}},I.getHighBits=function(){return this.high},I.getHighBitsUnsigned=function(){return this.high>>>0},I.getLowBits=function(){return this.low},I.getLowBitsUnsigned=function(){return this.low>>>0},I.getNumBitsAbs=function(){var e,t;if(this.isNegative())return this.eq(T)?64:this.neg().getNumBitsAbs();for(e=0!=this.high?this.high:this.low,t=31;t>0&&0==(e&1<<t);t--);return 0!=this.high?t+33:t+1},I.isZero=function(){return 0===this.high&&0===this.low},I.isNegative=function(){return !this.unsigned&&this.high<0},I.isPositive=function(){return this.unsigned||this.high>=0},I.isOdd=function(){return 1==(1&this.low)},I.isEven=function(){return 0==(1&this.low)},I.equals=function(e){return t(e)||(e=s(e)),(this.unsigned===e.unsigned||this.high>>>31!=1||e.high>>>31!=1)&&(this.high===e.high&&this.low===e.low)},I.eq=I.equals,I.notEquals=function(e){return !this.eq(e)},I.neq=I.notEquals,I.lessThan=function(e){return this.comp(e)<0},I.lt=I.lessThan,I.lessThanOrEqual=function(e){return this.comp(e)<=0},I.lte=I.lessThanOrEqual,I.greaterThan=function(e){return this.comp(e)>0},I.gt=I.greaterThan,I.greaterThanOrEqual=function(e){return this.comp(e)>=0},I.gte=I.greaterThanOrEqual,I.compare=function(e){if(t(e)||(e=s(e)),this.eq(e))return 0;var n=this.isNegative(),i=e.isNegative();return n&&!i?-1:!n&&i?1:this.unsigned?e.high>>>0>this.high>>>0||e.high===this.high&&e.low>>>0>this.low>>>0?-1:1:this.sub(e).isNegative()?-1:1},I.comp=I.compare,I.negate=function(){return !this.unsigned&&this.eq(T)?T:this.not().add(_)},I.neg=I.negate,I.add=function(e){var n,i,o,a,c,u,l,h,d,f,p;return t(e)||(e=s(e)),n=this.high>>>16,i=65535&this.high,o=this.low>>>16,a=65535&this.low,c=e.high>>>16,u=65535&e.high,l=e.low>>>16,h=0,d=0,f=0,p=0,f+=(p+=a+(65535&e.low))>>>16,d+=(f+=o+l)>>>16,h+=(d+=i+u)>>>16,h+=n+c,r((f&=65535)<<16|(p&=65535),(h&=65535)<<16|(d&=65535),this.unsigned)},I.subtract=function(e){return t(e)||(e=s(e)),this.add(e.neg())},I.sub=I.subtract,I.multiply=function(e){var n,o,a,c,u,l,h,d,g,_,m,v;return this.isZero()?p:(t(e)||(e=s(e)),e.isZero()?p:this.eq(T)?e.isOdd()?T:p:e.eq(T)?this.isOdd()?T:p:this.isNegative()?e.isNegative()?this.neg().mul(e.neg()):this.neg().mul(e).neg():e.isNegative()?this.mul(e.neg()).neg():this.lt(f)&&e.lt(f)?i(this.toNumber()*e.toNumber(),this.unsigned):(n=this.high>>>16,o=65535&this.high,a=this.low>>>16,c=65535&this.low,u=e.high>>>16,l=65535&e.high,h=e.low>>>16,g=0,_=0,m=0,v=0,m+=(v+=c*(d=65535&e.low))>>>16,_+=(m+=a*d)>>>16,m&=65535,_+=(m+=c*h)>>>16,g+=(_+=o*d)>>>16,_&=65535,g+=(_+=a*h)>>>16,_&=65535,g+=(_+=c*l)>>>16,g+=n*d+o*h+a*l+c*u,r((m&=65535)<<16|(v&=65535),(g&=65535)<<16|(_&=65535),this.unsigned)))},I.mul=I.multiply,I.divide=function(e){var n,r,o,a,c,l,h;if(t(e)||(e=s(e)),e.isZero())throw Error("division by zero");if(this.isZero())return this.unsigned?g:p;if(this.unsigned){if(e.unsigned||(e=e.toUnsigned()),e.gt(this))return g;if(e.gt(this.shru(1)))return m;o=g;}else {if(this.eq(T))return e.eq(_)||e.eq(v)?T:e.eq(T)?_:(n=this.shr(1).div(e).shl(1)).eq(p)?e.isNegative()?_:v:(r=this.sub(e.mul(n)),o=n.add(r.div(e)));if(e.eq(T))return this.unsigned?g:p;if(this.isNegative())return e.isNegative()?this.neg().div(e.neg()):this.neg().div(e).neg();if(e.isNegative())return this.div(e.neg()).neg();o=p;}for(r=this;r.gte(e);){for(n=Math.max(1,Math.floor(r.toNumber()/e.toNumber())),c=(a=Math.ceil(Math.log(n)/Math.LN2))<=48?1:u(2,a-48),h=(l=i(n)).mul(e);h.isNegative()||h.gt(r);)h=(l=i(n-=c,this.unsigned)).mul(e);l.isZero()&&(l=_),o=o.add(l),r=r.sub(h);}return o},I.div=I.divide,I.modulo=function(e){return t(e)||(e=s(e)),this.sub(this.div(e).mul(e))},I.mod=I.modulo,I.not=function(){return r(~this.low,~this.high,this.unsigned)},I.and=function(e){return t(e)||(e=s(e)),r(this.low&e.low,this.high&e.high,this.unsigned)},I.or=function(e){return t(e)||(e=s(e)),r(this.low|e.low,this.high|e.high,this.unsigned)},I.xor=function(e){return t(e)||(e=s(e)),r(this.low^e.low,this.high^e.high,this.unsigned)},I.shiftLeft=function(e){return t(e)&&(e=e.toInt()),0==(e&=63)?this:e<32?r(this.low<<e,this.high<<e|this.low>>>32-e,this.unsigned):r(0,this.low<<e-32,this.unsigned)},I.shl=I.shiftLeft,I.shiftRight=function(e){return t(e)&&(e=e.toInt()),0==(e&=63)?this:e<32?r(this.low>>>e|this.high<<32-e,this.high>>e,this.unsigned):r(this.high>>e-32,this.high>=0?0:-1,this.unsigned)},I.shr=I.shiftRight,I.shiftRightUnsigned=function(e){var n;return t(e)&&(e=e.toInt()),0===(e&=63)?this:(n=this.high,e<32?r(this.low>>>e|n<<32-e,n>>>e,this.unsigned):r(32===e?n:n>>>e-32,0,this.unsigned))},I.shru=I.shiftRightUnsigned,I.toSigned=function(){return this.unsigned?r(this.low,this.high,!1):this},I.toUnsigned=function(){return this.unsigned?this:r(this.low,this.high,!0)},I.toBytes=function(e){return e?this.toBytesLE():this.toBytesBE()},I.toBytesLE=function(){var e=this.high,t=this.low;return [255&t,255&t>>>8,255&t>>>16,255&t>>>24,255&e,255&e>>>8,255&e>>>16,255&e>>>24]},I.toBytesBE=function(){var e=this.high,t=this.low;return [255&e>>>24,255&e>>>16,255&e>>>8,255&e,255&t>>>24,255&t>>>16,255&t>>>8,255&t]},e}(),n=function(e){function t(e){var t=0;return function(){return t<e.length?e.charCodeAt(t++):null}}function n(){var e=[],t=[];return function(){return 0===arguments.length?t.join("")+a.apply(String,e):(e.length+arguments.length>1024&&(t.push(a.apply(String,e)),e.length=0),void Array.prototype.push.apply(e,arguments))}}function i(e,t,n,i,r){var o,s,a=8*r-i-1,c=(1<<a)-1,u=c>>1,l=-7,h=n?r-1:0,d=n?-1:1,f=e[t+h];for(h+=d,o=f&(1<<-l)-1,f>>=-l,l+=a;l>0;o=256*o+e[t+h],h+=d,l-=8);for(s=o&(1<<-l)-1,o>>=-l,l+=i;l>0;s=256*s+e[t+h],h+=d,l-=8);if(0===o)o=1-u;else {if(o===c)return s?NaN:1/0*(f?-1:1);s+=Math.pow(2,i),o-=u;}return (f?-1:1)*s*Math.pow(2,o-i)}function r(e,t,n,i,r,o){var s,a,c,u=8*o-r-1,l=(1<<u)-1,h=l>>1,d=23===r?Math.pow(2,-24)-Math.pow(2,-77):0,f=i?0:o-1,p=i?1:-1,g=t<0||0===t&&1/t<0?1:0;for(t=Math.abs(t),isNaN(t)||1/0===t?(a=isNaN(t)?1:0,s=l):(s=Math.floor(Math.log(t)/Math.LN2),t*(c=Math.pow(2,-s))<1&&(s--,c*=2),(t+=s+h>=1?d/c:d*Math.pow(2,1-h))*c>=2&&(s++,c/=2),s+h>=l?(a=0,s=l):s+h>=1?(a=(t*c-1)*Math.pow(2,r),s+=h):(a=t*Math.pow(2,h-1)*Math.pow(2,r),s=0));r>=8;e[n+f]=255&a,f+=p,a/=256,r-=8);for(s=s<<r|a,u+=r;u>0;e[n+f]=255&s,f+=p,s/=256,u-=8);e[n+f-p]|=128*g;}var o,s,a,c,u,l=function(e,t,n){if(void 0===e&&(e=l.DEFAULT_CAPACITY),void 0===t&&(t=l.DEFAULT_ENDIAN),void 0===n&&(n=l.DEFAULT_NOASSERT),!n){if((e|=0)<0)throw RangeError("Illegal capacity");t=!!t,n=!!n;}this.buffer=0===e?s:new ArrayBuffer(e),this.view=0===e?null:new Uint8Array(this.buffer),this.offset=0,this.markedOffset=-1,this.limit=e,this.littleEndian=t,this.noAssert=n;};return l.VERSION="5.0.1",l.LITTLE_ENDIAN=!0,l.BIG_ENDIAN=!1,l.DEFAULT_CAPACITY=16,l.DEFAULT_ENDIAN=l.BIG_ENDIAN,l.DEFAULT_NOASSERT=!1,l.Long=e||null,(o=l.prototype).__isByteBuffer__,Object.defineProperty(o,"__isByteBuffer__",{value:!0,enumerable:!1,configurable:!1}),s=new ArrayBuffer(0),a=String.fromCharCode,l.accessor=function(){return Uint8Array},l.allocate=function(e,t,n){return new l(e,t,n)},l.concat=function(e,t,n,i){var r,o,s,a,c,u;for(("boolean"==typeof t||"string"!=typeof t)&&(i=n,n=t,t=void 0),r=0,s=0,a=e.length;a>s;++s)l.isByteBuffer(e[s])||(e[s]=l.wrap(e[s],t)),(o=e[s].limit-e[s].offset)>0&&(r+=o);if(0===r)return new l(0,n,i);for(u=new l(r,n,i),s=0;a>s;)(o=(c=e[s++]).limit-c.offset)<=0||(u.view.set(c.view.subarray(c.offset,c.limit),u.offset),u.offset+=o);return u.limit=u.offset,u.offset=0,u},l.isByteBuffer=function(e){return !0===(e&&e.__isByteBuffer__)},l.type=function(){return ArrayBuffer},l.wrap=function(e,t,n,i){var r,s;if("string"!=typeof t&&(i=n,n=t,t=void 0),"string"==typeof e)switch(void 0===t&&(t="utf8"),t){case"base64":return l.fromBase64(e,n);case"hex":return l.fromHex(e,n);case"binary":return l.fromBinary(e,n);case"utf8":return l.fromUTF8(e,n);case"debug":return l.fromDebug(e,n);default:throw Error("Unsupported encoding: "+t)}if(null===e||"object"!=typeof e)throw TypeError("Illegal buffer");if(l.isByteBuffer(e))return (r=o.clone.call(e)).markedOffset=-1,r;if(e instanceof Uint8Array)r=new l(0,n,i),e.length>0&&(r.buffer=e.buffer,r.offset=e.byteOffset,r.limit=e.byteOffset+e.byteLength,r.view=new Uint8Array(e.buffer));else if(e instanceof ArrayBuffer)r=new l(0,n,i),e.byteLength>0&&(r.buffer=e,r.offset=0,r.limit=e.byteLength,r.view=e.byteLength>0?new Uint8Array(e):null);else {if("[object Array]"!==Object.prototype.toString.call(e))throw TypeError("Illegal buffer");for((r=new l(e.length,n,i)).limit=e.length,s=0;s<e.length;++s)r.view[s]=e[s];}return r},o.writeBitSet=function(e,t){var n,i,r,o,s,a,c=void 0===t;if(c&&(t=this.offset),!this.noAssert){if(!(e instanceof Array))throw TypeError("Illegal BitSet: Not an array");if("number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}for(i=t,o=(r=e.length)>>3,s=0,t+=this.writeVarint32(r,t);o--;)n=1&!!e[s++]|(1&!!e[s++])<<1|(1&!!e[s++])<<2|(1&!!e[s++])<<3|(1&!!e[s++])<<4|(1&!!e[s++])<<5|(1&!!e[s++])<<6|(1&!!e[s++])<<7,this.writeByte(n,t++);if(r>s){for(a=0,n=0;r>s;)n|=(1&!!e[s++])<<a++;this.writeByte(n,t++);}return c?(this.offset=t,this):t-i},o.readBitSet=function(e){var t,n,i,r,o,s,a,c=void 0===e;for(c&&(e=this.offset),r=(i=(n=this.readVarint32(e)).value)>>3,o=0,s=[],e+=n.length;r--;)t=this.readByte(e++),s[o++]=!!(1&t),s[o++]=!!(2&t),s[o++]=!!(4&t),s[o++]=!!(8&t),s[o++]=!!(16&t),s[o++]=!!(32&t),s[o++]=!!(64&t),s[o++]=!!(128&t);if(i>o)for(a=0,t=this.readByte(e++);i>o;)s[o++]=!!(1&t>>a++);return c&&(this.offset=e),s},o.readBytes=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+e>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+"+e+") <= "+this.buffer.byteLength)}return n=this.slice(t,t+e),i&&(this.offset+=e),n},o.writeBytes=o.append,o.writeInt8=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e|=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=1)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=1,this.view[t]=e,i&&(this.offset+=1),this},o.writeByte=o.writeInt8,o.readInt8=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+1>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+1) <= "+this.buffer.byteLength)}return 128==(128&(t=this.view[e]))&&(t=-(255-t+1)),n&&(this.offset+=1),t},o.readByte=o.readInt8,o.writeUint8=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=1)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=1,this.view[t]=e,i&&(this.offset+=1),this},o.writeUInt8=o.writeUint8,o.readUint8=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+1>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+1) <= "+this.buffer.byteLength)}return t=this.view[e],n&&(this.offset+=1),t},o.readUInt8=o.readUint8,o.writeInt16=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e|=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=2)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=2,this.littleEndian?(this.view[t+1]=(65280&e)>>>8,this.view[t]=255&e):(this.view[t]=(65280&e)>>>8,this.view[t+1]=255&e),i&&(this.offset+=2),this},o.writeShort=o.writeInt16,o.readInt16=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+2>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+2) <= "+this.buffer.byteLength)}return t=0,this.littleEndian?(t=this.view[e],t|=this.view[e+1]<<8):(t=this.view[e]<<8,t|=this.view[e+1]),32768==(32768&t)&&(t=-(65535-t+1)),n&&(this.offset+=2),t},o.readShort=o.readInt16,o.writeUint16=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=2)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=2,this.littleEndian?(this.view[t+1]=(65280&e)>>>8,this.view[t]=255&e):(this.view[t]=(65280&e)>>>8,this.view[t+1]=255&e),i&&(this.offset+=2),this},o.writeUInt16=o.writeUint16,o.readUint16=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+2>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+2) <= "+this.buffer.byteLength)}return t=0,this.littleEndian?(t=this.view[e],t|=this.view[e+1]<<8):(t=this.view[e]<<8,t|=this.view[e+1]),n&&(this.offset+=2),t},o.readUInt16=o.readUint16,o.writeInt32=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e|=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=4)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=4,this.littleEndian?(this.view[t+3]=255&e>>>24,this.view[t+2]=255&e>>>16,this.view[t+1]=255&e>>>8,this.view[t]=255&e):(this.view[t]=255&e>>>24,this.view[t+1]=255&e>>>16,this.view[t+2]=255&e>>>8,this.view[t+3]=255&e),i&&(this.offset+=4),this},o.writeInt=o.writeInt32,o.readInt32=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+4>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+4) <= "+this.buffer.byteLength)}return t=0,this.littleEndian?(t=this.view[e+2]<<16,t|=this.view[e+1]<<8,t|=this.view[e],t+=this.view[e+3]<<24>>>0):(t=this.view[e+1]<<16,t|=this.view[e+2]<<8,t|=this.view[e+3],t+=this.view[e]<<24>>>0),t|=0,n&&(this.offset+=4),t},o.readInt=o.readInt32,o.writeUint32=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=4)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=4,this.littleEndian?(this.view[t+3]=255&e>>>24,this.view[t+2]=255&e>>>16,this.view[t+1]=255&e>>>8,this.view[t]=255&e):(this.view[t]=255&e>>>24,this.view[t+1]=255&e>>>16,this.view[t+2]=255&e>>>8,this.view[t+3]=255&e),i&&(this.offset+=4),this},o.writeUInt32=o.writeUint32,o.readUint32=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+4>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+4) <= "+this.buffer.byteLength)}return t=0,this.littleEndian?(t=this.view[e+2]<<16,t|=this.view[e+1]<<8,t|=this.view[e],t+=this.view[e+3]<<24>>>0):(t=this.view[e+1]<<16,t|=this.view[e+2]<<8,t|=this.view[e+3],t+=this.view[e]<<24>>>0),n&&(this.offset+=4),t},o.readUInt32=o.readUint32,e&&(o.writeInt64=function(t,n){var i,r,o,s=void 0===n;if(s&&(n=this.offset),!this.noAssert){if("number"==typeof t)t=e.fromNumber(t);else if("string"==typeof t)t=e.fromString(t);else if(!(t&&t instanceof e))throw TypeError("Illegal value: "+t+" (not an integer or Long)");if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}return "number"==typeof t?t=e.fromNumber(t):"string"==typeof t&&(t=e.fromString(t)),(n+=8)>(i=this.buffer.byteLength)&&this.resize((i*=2)>n?i:n),n-=8,r=t.low,o=t.high,this.littleEndian?(this.view[n+3]=255&r>>>24,this.view[n+2]=255&r>>>16,this.view[n+1]=255&r>>>8,this.view[n]=255&r,n+=4,this.view[n+3]=255&o>>>24,this.view[n+2]=255&o>>>16,this.view[n+1]=255&o>>>8,this.view[n]=255&o):(this.view[n]=255&o>>>24,this.view[n+1]=255&o>>>16,this.view[n+2]=255&o>>>8,this.view[n+3]=255&o,n+=4,this.view[n]=255&r>>>24,this.view[n+1]=255&r>>>16,this.view[n+2]=255&r>>>8,this.view[n+3]=255&r),s&&(this.offset+=8),this},o.writeLong=o.writeInt64,o.readInt64=function(t){var n,i,r,o=void 0===t;if(o&&(t=this.offset),!this.noAssert){if("number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+8>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+8) <= "+this.buffer.byteLength)}return n=0,i=0,this.littleEndian?(n=this.view[t+2]<<16,n|=this.view[t+1]<<8,n|=this.view[t],n+=this.view[t+3]<<24>>>0,t+=4,i=this.view[t+2]<<16,i|=this.view[t+1]<<8,i|=this.view[t],i+=this.view[t+3]<<24>>>0):(i=this.view[t+1]<<16,i|=this.view[t+2]<<8,i|=this.view[t+3],i+=this.view[t]<<24>>>0,t+=4,n=this.view[t+1]<<16,n|=this.view[t+2]<<8,n|=this.view[t+3],n+=this.view[t]<<24>>>0),r=new e(n,i,!1),o&&(this.offset+=8),r},o.readLong=o.readInt64,o.writeUint64=function(t,n){var i,r,o,s=void 0===n;if(s&&(n=this.offset),!this.noAssert){if("number"==typeof t)t=e.fromNumber(t);else if("string"==typeof t)t=e.fromString(t);else if(!(t&&t instanceof e))throw TypeError("Illegal value: "+t+" (not an integer or Long)");if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}return "number"==typeof t?t=e.fromNumber(t):"string"==typeof t&&(t=e.fromString(t)),(n+=8)>(i=this.buffer.byteLength)&&this.resize((i*=2)>n?i:n),n-=8,r=t.low,o=t.high,this.littleEndian?(this.view[n+3]=255&r>>>24,this.view[n+2]=255&r>>>16,this.view[n+1]=255&r>>>8,this.view[n]=255&r,n+=4,this.view[n+3]=255&o>>>24,this.view[n+2]=255&o>>>16,this.view[n+1]=255&o>>>8,this.view[n]=255&o):(this.view[n]=255&o>>>24,this.view[n+1]=255&o>>>16,this.view[n+2]=255&o>>>8,this.view[n+3]=255&o,n+=4,this.view[n]=255&r>>>24,this.view[n+1]=255&r>>>16,this.view[n+2]=255&r>>>8,this.view[n+3]=255&r),s&&(this.offset+=8),this},o.writeUInt64=o.writeUint64,o.readUint64=function(t){var n,i,r,o=void 0===t;if(o&&(t=this.offset),!this.noAssert){if("number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+8>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+8) <= "+this.buffer.byteLength)}return n=0,i=0,this.littleEndian?(n=this.view[t+2]<<16,n|=this.view[t+1]<<8,n|=this.view[t],n+=this.view[t+3]<<24>>>0,t+=4,i=this.view[t+2]<<16,i|=this.view[t+1]<<8,i|=this.view[t],i+=this.view[t+3]<<24>>>0):(i=this.view[t+1]<<16,i|=this.view[t+2]<<8,i|=this.view[t+3],i+=this.view[t]<<24>>>0,t+=4,n=this.view[t+1]<<16,n|=this.view[t+2]<<8,n|=this.view[t+3],n+=this.view[t]<<24>>>0),r=new e(n,i,!0),o&&(this.offset+=8),r},o.readUInt64=o.readUint64),o.writeFloat32=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e)throw TypeError("Illegal value: "+e+" (not a number)");if("number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=4)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=4,r(this.view,e,t,this.littleEndian,23,4),i&&(this.offset+=4),this},o.writeFloat=o.writeFloat32,o.readFloat32=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+4>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+4) <= "+this.buffer.byteLength)}return t=i(this.view,e,this.littleEndian,23,4),n&&(this.offset+=4),t},o.readFloat=o.readFloat32,o.writeFloat64=function(e,t){var n,i=void 0===t;if(i&&(t=this.offset),!this.noAssert){if("number"!=typeof e)throw TypeError("Illegal value: "+e+" (not a number)");if("number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}return (t+=8)>(n=this.buffer.byteLength)&&this.resize((n*=2)>t?n:t),t-=8,r(this.view,e,t,this.littleEndian,52,8),i&&(this.offset+=8),this},o.writeDouble=o.writeFloat64,o.readFloat64=function(e){var t,n=void 0===e;if(n&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+8>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+8) <= "+this.buffer.byteLength)}return t=i(this.view,e,this.littleEndian,52,8),n&&(this.offset+=8),t},o.readDouble=o.readFloat64,l.MAX_VARINT32_BYTES=5,l.calculateVarint32=function(e){return (e>>>=0)<128?1:e<16384?2:1<<21>e?3:1<<28>e?4:5},l.zigZagEncode32=function(e){return ((e|=0)<<1^e>>31)>>>0},l.zigZagDecode32=function(e){return 0|e>>>1^-(1&e)},o.writeVarint32=function(e,t){var n,i,r,o=void 0===t;if(o&&(t=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e|=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+0) <= "+this.buffer.byteLength)}for((t+=i=l.calculateVarint32(e))>(r=this.buffer.byteLength)&&this.resize((r*=2)>t?r:t),t-=i,e>>>=0;e>=128;)n=128|127&e,this.view[t++]=n,e>>>=7;return this.view[t++]=e,o?(this.offset=t,this):i},o.writeVarint32ZigZag=function(e,t){return this.writeVarint32(l.zigZagEncode32(e),t)},o.readVarint32=function(e){var t,n,i,r,o=void 0===e;if(o&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+1>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+1) <= "+this.buffer.byteLength)}n=0,i=0;do{if(!this.noAssert&&e>this.limit)throw (r=Error("Truncated")).truncated=!0,r;t=this.view[e++],n<5&&(i|=(127&t)<<7*n),++n;}while(0!=(128&t));return i|=0,o?(this.offset=e,i):{value:i,length:n}},o.readVarint32ZigZag=function(e){var t=this.readVarint32(e);return "object"==typeof t?t.value=l.zigZagDecode32(t.value):t=l.zigZagDecode32(t),t},e&&(l.MAX_VARINT64_BYTES=10,l.calculateVarint64=function(t){"number"==typeof t?t=e.fromNumber(t):"string"==typeof t&&(t=e.fromString(t));var n=t.toInt()>>>0,i=t.shiftRightUnsigned(28).toInt()>>>0,r=t.shiftRightUnsigned(56).toInt()>>>0;return 0==r?0==i?n<16384?n<128?1:2:1<<21>n?3:4:i<16384?i<128?5:6:1<<21>i?7:8:r<128?9:10},l.zigZagEncode64=function(t){return "number"==typeof t?t=e.fromNumber(t,!1):"string"==typeof t?t=e.fromString(t,!1):!1!==t.unsigned&&(t=t.toSigned()),t.shiftLeft(1).xor(t.shiftRight(63)).toUnsigned()},l.zigZagDecode64=function(t){return "number"==typeof t?t=e.fromNumber(t,!1):"string"==typeof t?t=e.fromString(t,!1):!1!==t.unsigned&&(t=t.toSigned()),t.shiftRightUnsigned(1).xor(t.and(e.ONE).toSigned().negate()).toSigned()},o.writeVarint64=function(t,n){var i,r,o,s,a,c=void 0===n;if(c&&(n=this.offset),!this.noAssert){if("number"==typeof t)t=e.fromNumber(t);else if("string"==typeof t)t=e.fromString(t);else if(!(t&&t instanceof e))throw TypeError("Illegal value: "+t+" (not an integer or Long)");if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}switch("number"==typeof t?t=e.fromNumber(t,!1):"string"==typeof t?t=e.fromString(t,!1):!1!==t.unsigned&&(t=t.toSigned()),i=l.calculateVarint64(t),r=t.toInt()>>>0,o=t.shiftRightUnsigned(28).toInt()>>>0,s=t.shiftRightUnsigned(56).toInt()>>>0,(n+=i)>(a=this.buffer.byteLength)&&this.resize((a*=2)>n?a:n),n-=i,i){case 10:this.view[n+9]=1&s>>>7;case 9:this.view[n+8]=9!==i?128|s:127&s;case 8:this.view[n+7]=8!==i?128|o>>>21:127&o>>>21;case 7:this.view[n+6]=7!==i?128|o>>>14:127&o>>>14;case 6:this.view[n+5]=6!==i?128|o>>>7:127&o>>>7;case 5:this.view[n+4]=5!==i?128|o:127&o;case 4:this.view[n+3]=4!==i?128|r>>>21:127&r>>>21;case 3:this.view[n+2]=3!==i?128|r>>>14:127&r>>>14;case 2:this.view[n+1]=2!==i?128|r>>>7:127&r>>>7;case 1:this.view[n]=1!==i?128|r:127&r;}return c?(this.offset+=i,this):i},o.writeVarint64ZigZag=function(e,t){return this.writeVarint64(l.zigZagEncode64(e),t)},o.readVarint64=function(t){var n,i,r,o,s,a,c=void 0===t;if(c&&(t=this.offset),!this.noAssert){if("number"!=typeof t||t%1!=0)throw TypeError("Illegal offset: "+t+" (not an integer)");if((t>>>=0)<0||t+1>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+t+" (+1) <= "+this.buffer.byteLength)}if(n=t,i=0,r=0,o=0,s=0,i=127&(s=this.view[t++]),128&s&&(i|=(127&(s=this.view[t++]))<<7,(128&s||this.noAssert&&void 0===s)&&(i|=(127&(s=this.view[t++]))<<14,(128&s||this.noAssert&&void 0===s)&&(i|=(127&(s=this.view[t++]))<<21,(128&s||this.noAssert&&void 0===s)&&(r=127&(s=this.view[t++]),(128&s||this.noAssert&&void 0===s)&&(r|=(127&(s=this.view[t++]))<<7,(128&s||this.noAssert&&void 0===s)&&(r|=(127&(s=this.view[t++]))<<14,(128&s||this.noAssert&&void 0===s)&&(r|=(127&(s=this.view[t++]))<<21,(128&s||this.noAssert&&void 0===s)&&(o=127&(s=this.view[t++]),(128&s||this.noAssert&&void 0===s)&&(o|=(127&(s=this.view[t++]))<<7,128&s||this.noAssert&&void 0===s))))))))))throw Error("Buffer overrun");return a=e.fromBits(i|r<<28,r>>>4|o<<24,!1),c?(this.offset=t,a):{value:a,length:t-n}},o.readVarint64ZigZag=function(t){var n=this.readVarint64(t);return n&&n.value instanceof e?n.value=l.zigZagDecode64(n.value):n=l.zigZagDecode64(n),n}),o.writeCString=function(e,n){var i,r,o,s=void 0===n;if(s&&(n=this.offset),r=e.length,!this.noAssert){if("string"!=typeof e)throw TypeError("Illegal str: Not a string");for(i=0;r>i;++i)if(0===e.charCodeAt(i))throw RangeError("Illegal str: Contains NULL-characters");if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}return r=u.calculateUTF16asUTF8(t(e))[1],n+=r+1,o=this.buffer.byteLength,n>o&&this.resize((o*=2)>n?o:n),n-=r+1,u.encodeUTF16toUTF8(t(e),function(e){this.view[n++]=e;}.bind(this)),this.view[n++]=0,s?(this.offset=n,this):r},o.readCString=function(e){var t,i,r,o=void 0===e;if(o&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+1>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+1) <= "+this.buffer.byteLength)}return t=e,r=-1,u.decodeUTF8toUTF16(function(){if(0===r)return null;if(e>=this.limit)throw RangeError("Illegal range: Truncated data, "+e+" < "+this.limit);return 0===(r=this.view[e++])?null:r}.bind(this),i=n(),!0),o?(this.offset=e,i()):{string:i(),length:e-t}},o.writeIString=function(e,n){var i,r,o,s=void 0===n;if(s&&(n=this.offset),!this.noAssert){if("string"!=typeof e)throw TypeError("Illegal str: Not a string");if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}if(r=n,i=u.calculateUTF16asUTF8(t(e),this.noAssert)[1],n+=4+i,o=this.buffer.byteLength,n>o&&this.resize((o*=2)>n?o:n),n-=4+i,this.littleEndian?(this.view[n+3]=255&i>>>24,this.view[n+2]=255&i>>>16,this.view[n+1]=255&i>>>8,this.view[n]=255&i):(this.view[n]=255&i>>>24,this.view[n+1]=255&i>>>16,this.view[n+2]=255&i>>>8,this.view[n+3]=255&i),n+=4,u.encodeUTF16toUTF8(t(e),function(e){this.view[n++]=e;}.bind(this)),n!==r+4+i)throw RangeError("Illegal range: Truncated data, "+n+" == "+(n+4+i));return s?(this.offset=n,this):n-r},o.readIString=function(e){var t,n,i,r=void 0===e;if(r&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+4>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+4) <= "+this.buffer.byteLength)}return t=e,n=this.readUint32(e),i=this.readUTF8String(n,l.METRICS_BYTES,e+=4),e+=i.length,r?(this.offset=e,i.string):{string:i.string,length:e-t}},l.METRICS_CHARS="c",l.METRICS_BYTES="b",o.writeUTF8String=function(e,n){var i,r,o,s=void 0===n;if(s&&(n=this.offset),!this.noAssert){if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}return r=n,i=u.calculateUTF16asUTF8(t(e))[1],n+=i,o=this.buffer.byteLength,n>o&&this.resize((o*=2)>n?o:n),n-=i,u.encodeUTF16toUTF8(t(e),function(e){this.view[n++]=e;}.bind(this)),s?(this.offset=n,this):n-r},o.writeString=o.writeUTF8String,l.calculateUTF8Chars=function(e){return u.calculateUTF16asUTF8(t(e))[0]},l.calculateUTF8Bytes=function(e){return u.calculateUTF16asUTF8(t(e))[1]},l.calculateString=l.calculateUTF8Bytes,o.readUTF8String=function(e,t,i){var r,o,s,a,c;if("number"==typeof t&&(i=t,t=void 0),(r=void 0===i)&&(i=this.offset),void 0===t&&(t=l.METRICS_CHARS),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal length: "+e+" (not an integer)");if(e|=0,"number"!=typeof i||i%1!=0)throw TypeError("Illegal offset: "+i+" (not an integer)");if((i>>>=0)<0||i+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+i+" (+0) <= "+this.buffer.byteLength)}if(s=0,a=i,t===l.METRICS_CHARS){if(o=n(),u.decodeUTF8(function(){return e>s&&i<this.limit?this.view[i++]:null}.bind(this),(function(e){++s,u.UTF8toUTF16(e,o);})),s!==e)throw RangeError("Illegal range: Truncated data, "+s+" == "+e);return r?(this.offset=i,o()):{string:o(),length:i-a}}if(t===l.METRICS_BYTES){if(!this.noAssert){if("number"!=typeof i||i%1!=0)throw TypeError("Illegal offset: "+i+" (not an integer)");if((i>>>=0)<0||i+e>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+i+" (+"+e+") <= "+this.buffer.byteLength)}if(c=i+e,u.decodeUTF8toUTF16(function(){return c>i?this.view[i++]:null}.bind(this),o=n(),this.noAssert),i!==c)throw RangeError("Illegal range: Truncated data, "+i+" == "+c);return r?(this.offset=i,o()):{string:o(),length:i-a}}throw TypeError("Unsupported metrics: "+t)},o.readString=o.readUTF8String,o.writeVString=function(e,n){var i,r,o,s,a=void 0===n;if(a&&(n=this.offset),!this.noAssert){if("string"!=typeof e)throw TypeError("Illegal str: Not a string");if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}if(o=n,i=u.calculateUTF16asUTF8(t(e),this.noAssert)[1],r=l.calculateVarint32(i),n+=r+i,s=this.buffer.byteLength,n>s&&this.resize((s*=2)>n?s:n),n-=r+i,n+=this.writeVarint32(i,n),u.encodeUTF16toUTF8(t(e),function(e){this.view[n++]=e;}.bind(this)),n!==o+i+r)throw RangeError("Illegal range: Truncated data, "+n+" == "+(n+i+r));return a?(this.offset=n,this):n-o},o.readVString=function(e){var t,n,i,r=void 0===e;if(r&&(e=this.offset),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+1>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+1) <= "+this.buffer.byteLength)}return t=e,n=this.readVarint32(e),i=this.readUTF8String(n.value,l.METRICS_BYTES,e+=n.length),e+=i.length,r?(this.offset=e,i.string):{string:i.string,length:e-t}},o.append=function(e,t,n){var i,r,o;if(("number"==typeof t||"string"!=typeof t)&&(n=t,t=void 0),(i=void 0===n)&&(n=this.offset),!this.noAssert){if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}return e instanceof l||(e=l.wrap(e,t)),(r=e.limit-e.offset)<=0||((n+=r)>(o=this.buffer.byteLength)&&this.resize((o*=2)>n?o:n),n-=r,this.view.set(e.view.subarray(e.offset,e.limit),n),e.offset+=r,i&&(this.offset+=r)),this},o.appendTo=function(e,t){return e.append(this,t),this},o.assert=function(e){return this.noAssert=!e,this},o.capacity=function(){return this.buffer.byteLength},o.clear=function(){return this.offset=0,this.limit=this.buffer.byteLength,this.markedOffset=-1,this},o.clone=function(e){var t=new l(0,this.littleEndian,this.noAssert);return e?(t.buffer=new ArrayBuffer(this.buffer.byteLength),t.view=new Uint8Array(t.buffer)):(t.buffer=this.buffer,t.view=this.view),t.offset=this.offset,t.markedOffset=this.markedOffset,t.limit=this.limit,t},o.compact=function(e,t){var n,i,r;if(void 0===e&&(e=this.offset),void 0===t&&(t=this.limit),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal begin: Not an integer");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal end: Not an integer");if(t>>>=0,e<0||e>t||t>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+e+" <= "+t+" <= "+this.buffer.byteLength)}return 0===e&&t===this.buffer.byteLength?this:0===(n=t-e)?(this.buffer=s,this.view=null,this.markedOffset>=0&&(this.markedOffset-=e),this.offset=0,this.limit=0,this):(i=new ArrayBuffer(n),(r=new Uint8Array(i)).set(this.view.subarray(e,t)),this.buffer=i,this.view=r,this.markedOffset>=0&&(this.markedOffset-=e),this.offset=0,this.limit=n,this)},o.copy=function(e,t){if(void 0===e&&(e=this.offset),void 0===t&&(t=this.limit),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal begin: Not an integer");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal end: Not an integer");if(t>>>=0,e<0||e>t||t>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+e+" <= "+t+" <= "+this.buffer.byteLength)}if(e===t)return new l(0,this.littleEndian,this.noAssert);var n=t-e,i=new l(n,this.littleEndian,this.noAssert);return i.offset=0,i.limit=n,i.markedOffset>=0&&(i.markedOffset-=e),this.copyTo(i,0,e,t),i},o.copyTo=function(e,t,n,i){var r,o,s;if(!this.noAssert&&!l.isByteBuffer(e))throw TypeError("Illegal target: Not a ByteBuffer");if(t=(o=void 0===t)?e.offset:0|t,n=(r=void 0===n)?this.offset:0|n,i=void 0===i?this.limit:0|i,t<0||t>e.buffer.byteLength)throw RangeError("Illegal target range: 0 <= "+t+" <= "+e.buffer.byteLength);if(n<0||i>this.buffer.byteLength)throw RangeError("Illegal source range: 0 <= "+n+" <= "+this.buffer.byteLength);return 0===(s=i-n)?e:(e.ensureCapacity(t+s),e.view.set(this.view.subarray(n,i),t),r&&(this.offset+=s),o&&(e.offset+=s),this)},o.ensureCapacity=function(e){var t=this.buffer.byteLength;return e>t?this.resize((t*=2)>e?t:e):this},o.fill=function(e,t,n){var i=void 0===t;if(i&&(t=this.offset),"string"==typeof e&&e.length>0&&(e=e.charCodeAt(0)),void 0===t&&(t=this.offset),void 0===n&&(n=this.limit),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal value: "+e+" (not an integer)");if(e|=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal begin: Not an integer");if(t>>>=0,"number"!=typeof n||n%1!=0)throw TypeError("Illegal end: Not an integer");if(n>>>=0,t<0||t>n||n>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+t+" <= "+n+" <= "+this.buffer.byteLength)}if(t>=n)return this;for(;n>t;)this.view[t++]=e;return i&&(this.offset=t),this},o.flip=function(){return this.limit=this.offset,this.offset=0,this},o.mark=function(e){if(e=void 0===e?this.offset:e,!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal offset: "+e+" (not an integer)");if((e>>>=0)<0||e+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+e+" (+0) <= "+this.buffer.byteLength)}return this.markedOffset=e,this},o.order=function(e){if(!this.noAssert&&"boolean"!=typeof e)throw TypeError("Illegal littleEndian: Not a boolean");return this.littleEndian=!!e,this},o.LE=function(e){return this.littleEndian=void 0===e||!!e,this},o.BE=function(e){return this.littleEndian=void 0!==e&&!e,this},o.prepend=function(e,t,n){var i,r,o,s,a;if(("number"==typeof t||"string"!=typeof t)&&(n=t,t=void 0),(i=void 0===n)&&(n=this.offset),!this.noAssert){if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: "+n+" (not an integer)");if((n>>>=0)<0||n+0>this.buffer.byteLength)throw RangeError("Illegal offset: 0 <= "+n+" (+0) <= "+this.buffer.byteLength)}return e instanceof l||(e=l.wrap(e,t)),(r=e.limit-e.offset)<=0||((o=r-n)>0?(s=new ArrayBuffer(this.buffer.byteLength+o),(a=new Uint8Array(s)).set(this.view.subarray(n,this.buffer.byteLength),r),this.buffer=s,this.view=a,this.offset+=o,this.markedOffset>=0&&(this.markedOffset+=o),this.limit+=o,n+=o):new Uint8Array(this.buffer),this.view.set(e.view.subarray(e.offset,e.limit),n-r),e.offset=e.limit,i&&(this.offset-=r)),this},o.prependTo=function(e,t){return e.prepend(this,t),this},o.printDebug=function(e){"function"!=typeof e&&(e=console.log.bind(console)),e(this.toString()+"\n-------------------------------------------------------------------\n"+this.toDebug(!0));},o.remaining=function(){return this.limit-this.offset},o.reset=function(){return this.markedOffset>=0?(this.offset=this.markedOffset,this.markedOffset=-1):this.offset=0,this},o.resize=function(e){var t,n;if(!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal capacity: "+e+" (not an integer)");if((e|=0)<0)throw RangeError("Illegal capacity: 0 <= "+e)}return this.buffer.byteLength<e&&(t=new ArrayBuffer(e),(n=new Uint8Array(t)).set(this.view),this.buffer=t,this.view=n),this},o.reverse=function(e,t){if(void 0===e&&(e=this.offset),void 0===t&&(t=this.limit),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal begin: Not an integer");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal end: Not an integer");if(t>>>=0,e<0||e>t||t>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+e+" <= "+t+" <= "+this.buffer.byteLength)}return e===t||Array.prototype.reverse.call(this.view.subarray(e,t)),this},o.skip=function(e){if(!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal length: "+e+" (not an integer)");e|=0;}var t=this.offset+e;if(!this.noAssert&&(t<0||t>this.buffer.byteLength))throw RangeError("Illegal length: 0 <= "+this.offset+" + "+e+" <= "+this.buffer.byteLength);return this.offset=t,this},o.slice=function(e,t){if(void 0===e&&(e=this.offset),void 0===t&&(t=this.limit),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal begin: Not an integer");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal end: Not an integer");if(t>>>=0,e<0||e>t||t>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+e+" <= "+t+" <= "+this.buffer.byteLength)}var n=this.clone();return n.offset=e,n.limit=t,n},o.toBuffer=function(e){var t,n=this.offset,i=this.limit;if(!this.noAssert){if("number"!=typeof n||n%1!=0)throw TypeError("Illegal offset: Not an integer");if(n>>>=0,"number"!=typeof i||i%1!=0)throw TypeError("Illegal limit: Not an integer");if(i>>>=0,n<0||n>i||i>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+n+" <= "+i+" <= "+this.buffer.byteLength)}return e||0!==n||i!==this.buffer.byteLength?n===i?s:(t=new ArrayBuffer(i-n),new Uint8Array(t).set(new Uint8Array(this.buffer).subarray(n,i),0),t):this.buffer},o.toArrayBuffer=o.toBuffer,o.toString=function(e,t,n){if(void 0===e)return "ByteBufferAB(offset="+this.offset+",markedOffset="+this.markedOffset+",limit="+this.limit+",capacity="+this.capacity()+")";switch("number"==typeof e&&(n=t=e="utf8"),e){case"utf8":return this.toUTF8(t,n);case"base64":return this.toBase64(t,n);case"hex":return this.toHex(t,n);case"binary":return this.toBinary(t,n);case"debug":return this.toDebug();case"columns":return this.toColumns();default:throw Error("Unsupported encoding: "+e)}},c=function(){var e,t,n={},i=[65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,48,49,50,51,52,53,54,55,56,57,43,47],r=[];for(e=0,t=i.length;t>e;++e)r[i[e]]=e;return n.encode=function(e,t){for(var n,r;null!==(n=e());)t(i[63&n>>2]),r=(3&n)<<4,null!==(n=e())?(t(i[63&((r|=15&n>>4)|15&n>>4)]),r=(15&n)<<2,null!==(n=e())?(t(i[63&(r|3&n>>6)]),t(i[63&n])):(t(i[63&r]),t(61))):(t(i[63&r]),t(61),t(61));},n.decode=function(e,t){function n(e){throw Error("Illegal character code: "+e)}for(var i,o,s;null!==(i=e());)if(void 0===(o=r[i])&&n(i),null!==(i=e())&&(void 0===(s=r[i])&&n(i),t(o<<2>>>0|(48&s)>>4),null!==(i=e()))){if(void 0===(o=r[i])){if(61===i)break;n(i);}if(t((15&s)<<4>>>0|(60&o)>>2),null!==(i=e())){if(void 0===(s=r[i])){if(61===i)break;n(i);}t((3&o)<<6>>>0|s);}}},n.test=function(e){return /^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?$/.test(e)},n}(),o.toBase64=function(e,t){if(void 0===e&&(e=this.offset),void 0===t&&(t=this.limit),t|=0,(e|=0)<0||t>this.capacity||e>t)throw RangeError("begin, end");var i;return c.encode(function(){return t>e?this.view[e++]:null}.bind(this),i=n()),i()},l.fromBase64=function(e,n){if("string"!=typeof e)throw TypeError("str");var i=new l(e.length/4*3,n),r=0;return c.decode(t(e),(function(e){i.view[r++]=e;})),i.limit=r,i},l.btoa=function(e){return l.fromBinary(e).toBase64()},l.atob=function(e){return l.fromBase64(e).toBinary()},o.toBinary=function(e,t){if(void 0===e&&(e=this.offset),void 0===t&&(t=this.limit),t|=0,(e|=0)<0||t>this.capacity()||e>t)throw RangeError("begin, end");if(e===t)return "";for(var n=[],i=[];t>e;)n.push(this.view[e++]),n.length>=1024&&(i.push(String.fromCharCode.apply(String,n)),n=[]);return i.join("")+String.fromCharCode.apply(String,n)},l.fromBinary=function(e,t){if("string"!=typeof e)throw TypeError("str");for(var n,i=0,r=e.length,o=new l(r,t);r>i;){if((n=e.charCodeAt(i))>255)throw RangeError("illegal char code: "+n);o.view[i++]=n;}return o.limit=r,o},o.toDebug=function(e){for(var t,n=-1,i=this.buffer.byteLength,r="",o="",s="";i>n;){if(-1!==n&&(r+=(t=this.view[n])<16?"0"+t.toString(16).toUpperCase():t.toString(16).toUpperCase(),e&&(o+=t>32&&t<127?String.fromCharCode(t):".")),++n,e&&n>0&&n%16==0&&n!==i){for(;r.length<51;)r+=" ";s+=r+o+"\n",r=o="";}r+=n===this.offset&&n===this.limit?n===this.markedOffset?"!":"|":n===this.offset?n===this.markedOffset?"[":"<":n===this.limit?n===this.markedOffset?"]":">":n===this.markedOffset?"'":e||0!==n&&n!==i?" ":"";}if(e&&" "!==r){for(;r.length<51;)r+=" ";s+=r+o+"\n";}return e?s:r},l.fromDebug=function(e,t,n){for(var i,r,o=e.length,s=new l(0|(o+1)/3,t,n),a=0,c=0,u=!1,h=!1,d=!1,f=!1,p=!1;o>a;){switch(i=e.charAt(a++)){case"!":if(!n){if(h||d||f){p=!0;break}h=d=f=!0;}s.offset=s.markedOffset=s.limit=c,u=!1;break;case"|":if(!n){if(h||f){p=!0;break}h=f=!0;}s.offset=s.limit=c,u=!1;break;case"[":if(!n){if(h||d){p=!0;break}h=d=!0;}s.offset=s.markedOffset=c,u=!1;break;case"<":if(!n){if(h){p=!0;break}h=!0;}s.offset=c,u=!1;break;case"]":if(!n){if(f||d){p=!0;break}f=d=!0;}s.limit=s.markedOffset=c,u=!1;break;case">":if(!n){if(f){p=!0;break}f=!0;}s.limit=c,u=!1;break;case"'":if(!n){if(d){p=!0;break}d=!0;}s.markedOffset=c,u=!1;break;case" ":u=!1;break;default:if(!n&&u){p=!0;break}if(r=parseInt(i+e.charAt(a++),16),!n&&(isNaN(r)||r<0||r>255))throw TypeError("Illegal str: Not a debug encoded string");s.view[c++]=r,u=!0;}if(p)throw TypeError("Illegal str: Invalid symbol at "+a)}if(!n){if(!h||!f)throw TypeError("Illegal str: Missing offset or limit");if(c<s.buffer.byteLength)throw TypeError("Illegal str: Not a debug encoded string (is it hex?) "+c+" < "+o)}return s},o.toHex=function(e,t){if(e=void 0===e?this.offset:e,t=void 0===t?this.limit:t,!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal begin: Not an integer");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal end: Not an integer");if(t>>>=0,e<0||e>t||t>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+e+" <= "+t+" <= "+this.buffer.byteLength)}for(var n,i=new Array(t-e);t>e;)(n=this.view[e++])<16?i.push("0",n.toString(16)):i.push(n.toString(16));return i.join("")},l.fromHex=function(e,t,n){var i,r,o,s,a;if(!n){if("string"!=typeof e)throw TypeError("Illegal str: Not a string");if(e.length%2!=0)throw TypeError("Illegal str: Length not a multiple of 2")}for(r=e.length,o=new l(0|r/2,t),s=0,a=0;r>s;s+=2){if(i=parseInt(e.substring(s,s+2),16),!n&&(!isFinite(i)||i<0||i>255))throw TypeError("Illegal str: Contains non-hex characters");o.view[a++]=i;}return o.limit=a,o},u=function(){var e={MAX_CODEPOINT:1114111,encodeUTF8:function(e,t){var n=null;for("number"==typeof e&&(n=e,e=function(){return null});null!==n||null!==(n=e());)n<128?t(127&n):n<2048?(t(192|31&n>>6),t(128|63&n)):n<65536?(t(224|15&n>>12),t(128|63&n>>6),t(128|63&n)):(t(240|7&n>>18),t(128|63&n>>12),t(128|63&n>>6),t(128|63&n)),n=null;},decodeUTF8:function(e,t){for(var n,i,r,o,s=function(e){e=e.slice(0,e.indexOf(null));var t=Error(e.toString());throw t.name="TruncatedError",t.bytes=e,t};null!==(n=e());)if(0==(128&n))t(n);else if(192==(224&n))null===(i=e())&&s([n,i]),t((31&n)<<6|63&i);else if(224==(240&n))(null===(i=e())||null===(r=e()))&&s([n,i,r]),t((15&n)<<12|(63&i)<<6|63&r);else {if(240!=(248&n))throw RangeError("Illegal starting byte: "+n);(null===(i=e())||null===(r=e())||null===(o=e()))&&s([n,i,r,o]),t((7&n)<<18|(63&i)<<12|(63&r)<<6|63&o);}},UTF16toUTF8:function(e,t){for(var n,i=null;null!==(n=null!==i?i:e());)n>=55296&&n<=57343&&null!==(i=e())&&i>=56320&&i<=57343?(t(1024*(n-55296)+i-56320+65536),i=null):t(n);null!==i&&t(i);},UTF8toUTF16:function(e,t){var n=null;for("number"==typeof e&&(n=e,e=function(){return null});null!==n||null!==(n=e());)n<=65535?t(n):(t(55296+((n-=65536)>>10)),t(n%1024+56320)),n=null;},encodeUTF16toUTF8:function(t,n){e.UTF16toUTF8(t,(function(t){e.encodeUTF8(t,n);}));},decodeUTF8toUTF16:function(t,n){e.decodeUTF8(t,(function(t){e.UTF8toUTF16(t,n);}));},calculateCodePoint:function(e){return e<128?1:e<2048?2:e<65536?3:4},calculateUTF8:function(e){for(var t,n=0;null!==(t=e());)n+=t<128?1:t<2048?2:t<65536?3:4;return n},calculateUTF16asUTF8:function(t){var n=0,i=0;return e.UTF16toUTF8(t,(function(e){++n,i+=e<128?1:e<2048?2:e<65536?3:4;})),[n,i]}};return e}(),o.toUTF8=function(e,t){if(void 0===e&&(e=this.offset),void 0===t&&(t=this.limit),!this.noAssert){if("number"!=typeof e||e%1!=0)throw TypeError("Illegal begin: Not an integer");if(e>>>=0,"number"!=typeof t||t%1!=0)throw TypeError("Illegal end: Not an integer");if(t>>>=0,e<0||e>t||t>this.buffer.byteLength)throw RangeError("Illegal range: 0 <= "+e+" <= "+t+" <= "+this.buffer.byteLength)}var i;try{u.decodeUTF8toUTF16(function(){return t>e?this.view[e++]:null}.bind(this),i=n());}catch(n){if(e!==t)throw RangeError("Illegal range: Truncated data, "+e+" != "+t)}return i()},l.fromUTF8=function(e,n,i){if(!i&&"string"!=typeof e)throw TypeError("Illegal str: Not a string");var r=new l(u.calculateUTF16asUTF8(t(e),!0)[1],n,i),o=0;return u.encodeUTF16toUTF8(t(e),(function(e){r.view[o++]=e;})),r.limit=o,r},l}(t),i=function(t,n){var i,r,o={};return o.ByteBuffer=t,o.c=t,i=t,o.Long=n||null,o.VERSION="5.0.1",o.WIRE_TYPES={},o.WIRE_TYPES.VARINT=0,o.WIRE_TYPES.BITS64=1,o.WIRE_TYPES.LDELIM=2,o.WIRE_TYPES.STARTGROUP=3,o.WIRE_TYPES.ENDGROUP=4,o.WIRE_TYPES.BITS32=5,o.PACKABLE_WIRE_TYPES=[o.WIRE_TYPES.VARINT,o.WIRE_TYPES.BITS64,o.WIRE_TYPES.BITS32],o.TYPES={int32:{name:"int32",wireType:o.WIRE_TYPES.VARINT,defaultValue:0},uint32:{name:"uint32",wireType:o.WIRE_TYPES.VARINT,defaultValue:0},sint32:{name:"sint32",wireType:o.WIRE_TYPES.VARINT,defaultValue:0},int64:{name:"int64",wireType:o.WIRE_TYPES.VARINT,defaultValue:o.Long?o.Long.ZERO:void 0},uint64:{name:"uint64",wireType:o.WIRE_TYPES.VARINT,defaultValue:o.Long?o.Long.UZERO:void 0},sint64:{name:"sint64",wireType:o.WIRE_TYPES.VARINT,defaultValue:o.Long?o.Long.ZERO:void 0},bool:{name:"bool",wireType:o.WIRE_TYPES.VARINT,defaultValue:!1},double:{name:"double",wireType:o.WIRE_TYPES.BITS64,defaultValue:0},string:{name:"string",wireType:o.WIRE_TYPES.LDELIM,defaultValue:""},bytes:{name:"bytes",wireType:o.WIRE_TYPES.LDELIM,defaultValue:null},fixed32:{name:"fixed32",wireType:o.WIRE_TYPES.BITS32,defaultValue:0},sfixed32:{name:"sfixed32",wireType:o.WIRE_TYPES.BITS32,defaultValue:0},fixed64:{name:"fixed64",wireType:o.WIRE_TYPES.BITS64,defaultValue:o.Long?o.Long.UZERO:void 0},sfixed64:{name:"sfixed64",wireType:o.WIRE_TYPES.BITS64,defaultValue:o.Long?o.Long.ZERO:void 0},float:{name:"float",wireType:o.WIRE_TYPES.BITS32,defaultValue:0},enum:{name:"enum",wireType:o.WIRE_TYPES.VARINT,defaultValue:0},message:{name:"message",wireType:o.WIRE_TYPES.LDELIM,defaultValue:null},group:{name:"group",wireType:o.WIRE_TYPES.STARTGROUP,defaultValue:null}},o.MAP_KEY_TYPES=[o.TYPES.int32,o.TYPES.sint32,o.TYPES.sfixed32,o.TYPES.uint32,o.TYPES.fixed32,o.TYPES.int64,o.TYPES.sint64,o.TYPES.sfixed64,o.TYPES.uint64,o.TYPES.fixed64,o.TYPES.bool,o.TYPES.string,o.TYPES.bytes],o.ID_MIN=1,o.ID_MAX=536870911,o.convertFieldsToCamelCase=!1,o.populateAccessors=!0,o.populateDefaults=!0,o.Util=function(){var e={};return e.IS_NODE=!("object"!=typeof process||process+""!="[object process]"||process.browser),e.XHR=function(){var e,t=[function(){return new XMLHttpRequest},function(){return new ActiveXObject("Msxml2.XMLHTTP")},function(){return new ActiveXObject("Msxml3.XMLHTTP")},function(){return new ActiveXObject("Microsoft.XMLHTTP")}],n=null;for(e=0;e<t.length;e++){try{n=t[e]();}catch(e){continue}break}if(!n)throw Error("XMLHttpRequest is not supported");return n},e.fetch=function(t,n){if(n&&"function"!=typeof n&&(n=null),e.IS_NODE)if(n)g.readFile(t,(function(e,t){n(e?null:""+t);}));else try{return g.readFileSync(t)}catch(e){return null}else {var i=e.XHR();if(i.open("GET",t,!!n),i.setRequestHeader("Accept","text/plain"),"function"==typeof i.overrideMimeType&&i.overrideMimeType("text/plain"),!n)return i.send(null),200==i.status||0==i.status&&"string"==typeof i.responseText?i.responseText:null;if(i.onreadystatechange=function(){4==i.readyState&&(200==i.status||0==i.status&&"string"==typeof i.responseText?n(i.responseText):n(null));},4==i.readyState)return;i.send(null);}},e.toCamelCase=function(e){return e.replace(/_([a-zA-Z])/g,(function(e,t){return t.toUpperCase()}))},e}(),o.Lang={DELIM:/[\s\{\}=;:\[\],'"\(\)<>]/g,RULE:/^(?:required|optional|repeated|map)$/,TYPE:/^(?:double|float|int32|uint32|sint32|int64|uint64|sint64|fixed32|sfixed32|fixed64|sfixed64|bool|string|bytes)$/,NAME:/^[a-zA-Z_][a-zA-Z_0-9]*$/,TYPEDEF:/^[a-zA-Z][a-zA-Z_0-9]*$/,TYPEREF:/^(?:\.?[a-zA-Z_][a-zA-Z_0-9]*)+$/,FQTYPEREF:/^(?:\.[a-zA-Z][a-zA-Z_0-9]*)+$/,NUMBER:/^-?(?:[1-9][0-9]*|0|0[xX][0-9a-fA-F]+|0[0-7]+|([0-9]*(\.[0-9]*)?([Ee][+-]?[0-9]+)?)|inf|nan)$/,NUMBER_DEC:/^(?:[1-9][0-9]*|0)$/,NUMBER_HEX:/^0[xX][0-9a-fA-F]+$/,NUMBER_OCT:/^0[0-7]+$/,NUMBER_FLT:/^([0-9]*(\.[0-9]*)?([Ee][+-]?[0-9]+)?|inf|nan)$/,BOOL:/^(?:true|false)$/i,ID:/^(?:[1-9][0-9]*|0|0[xX][0-9a-fA-F]+|0[0-7]+)$/,NEGID:/^\-?(?:[1-9][0-9]*|0|0[xX][0-9a-fA-F]+|0[0-7]+)$/,WHITESPACE:/\s/,STRING:/(?:"([^"\\]*(?:\\.[^"\\]*)*)")|(?:'([^'\\]*(?:\\.[^'\\]*)*)')/g,STRING_DQ:/(?:"([^"\\]*(?:\\.[^"\\]*)*)")/g,STRING_SQ:/(?:'([^'\\]*(?:\\.[^'\\]*)*)')/g},o.DotProto=function(e,t){function n(e,n){var i=-1,r=1;if("-"==e.charAt(0)&&(r=-1,e=e.substring(1)),t.NUMBER_DEC.test(e))i=parseInt(e);else if(t.NUMBER_HEX.test(e))i=parseInt(e.substring(2),16);else {if(!t.NUMBER_OCT.test(e))throw Error("illegal id value: "+(r<0?"-":"")+e);i=parseInt(e.substring(1),8);}if(i=0|r*i,!n&&i<0)throw Error("illegal id value: "+(r<0?"-":"")+e);return i}function i(e){var n=1;if("-"==e.charAt(0)&&(n=-1,e=e.substring(1)),t.NUMBER_DEC.test(e))return n*parseInt(e,10);if(t.NUMBER_HEX.test(e))return n*parseInt(e.substring(2),16);if(t.NUMBER_OCT.test(e))return n*parseInt(e.substring(1),8);if("inf"===e)return 1/0*n;if("nan"===e)return NaN;if(t.NUMBER_FLT.test(e))return n*parseFloat(e);throw Error("illegal number value: "+(n<0?"-":"")+e)}function r(e,t,n){void 0===e[t]?e[t]=n:(Array.isArray(e[t])||(e[t]=[e[t]]),e[t].push(n));}var o,s,a={},c=function(e){this.source=e+"",this.index=0,this.line=1,this.stack=[],this._stringOpen=null;},u=c.prototype;return u._readString=function(){var e,n='"'===this._stringOpen?t.STRING_DQ:t.STRING_SQ;if(n.lastIndex=this.index-1,!(e=n.exec(this.source)))throw Error("unterminated string");return this.index=n.lastIndex,this.stack.push(this._stringOpen),this._stringOpen=null,e[1]},u.next=function(){var e,n,i,r,o;if(this.stack.length>0)return this.stack.shift();if(this.index>=this.source.length)return null;if(null!==this._stringOpen)return this._readString();do{for(e=!1;t.WHITESPACE.test(i=this.source.charAt(this.index));)if("\n"===i&&++this.line,++this.index===this.source.length)return null;if("/"===this.source.charAt(this.index))if(++this.index,"/"===this.source.charAt(this.index)){for(;"\n"!==this.source.charAt(++this.index);)if(this.index==this.source.length)return null;++this.index,++this.line,e=!0;}else {if("*"!==(i=this.source.charAt(this.index)))return "/";do{if("\n"===i&&++this.line,++this.index===this.source.length)return null;n=i,i=this.source.charAt(this.index);}while("*"!==n||"/"!==i);++this.index,e=!0;}}while(e);if(this.index===this.source.length)return null;if(r=this.index,t.DELIM.lastIndex=0,!t.DELIM.test(this.source.charAt(r++)))for(;r<this.source.length&&!t.DELIM.test(this.source.charAt(r));)++r;return ('"'===(o=this.source.substring(this.index,this.index=r))||"'"===o)&&(this._stringOpen=o),o},u.peek=function(){if(0===this.stack.length){var e=this.next();if(null===e)return null;this.stack.push(e);}return this.stack[0]},u.skip=function(e){var t=this.next();if(t!==e)throw Error("illegal '"+t+"', '"+e+"' expected")},u.omit=function(e){return this.peek()===e&&(this.next(),!0)},u.toString=function(){return "Tokenizer ("+this.index+"/"+this.source.length+" at line "+this.line+")"},a.Tokenizer=c,o=function(e){this.tn=new c(e),this.proto3=!1;},(s=o.prototype).parse=function(){var e,n={name:"[ROOT]",package:null,messages:[],enums:[],imports:[],options:{},services:[]},i=!0;try{for(;e=this.tn.next();)switch(e){case"package":if(!i||null!==n.package)throw Error("unexpected 'package'");if(e=this.tn.next(),!t.TYPEREF.test(e))throw Error("illegal package name: "+e);this.tn.skip(";"),n.package=e;break;case"import":if(!i)throw Error("unexpected 'import'");"public"===(e=this.tn.peek())&&this.tn.next(),e=this._readString(),this.tn.skip(";"),n.imports.push(e);break;case"syntax":if(!i)throw Error("unexpected 'syntax'");this.tn.skip("="),"proto3"===(n.syntax=this._readString())&&(this.proto3=!0),this.tn.skip(";");break;case"message":this._parseMessage(n,null),i=!1;break;case"enum":this._parseEnum(n),i=!1;break;case"option":this._parseOption(n);break;case"service":this._parseService(n);break;case"extend":this._parseExtend(n);break;default:throw Error("unexpected '"+e+"'")}}catch(e){throw e.message="Parse error at line "+this.tn.line+": "+e.message,e}return delete n.name,n},o.parse=function(e){return new o(e).parse()},s._readString=function(){var e,t,n="";do{if("'"!==(t=this.tn.next())&&'"'!==t)throw Error("illegal string delimiter: "+t);n+=this.tn.next(),this.tn.skip(t),e=this.tn.peek();}while('"'===e||'"'===e);return n},s._readValue=function(e){var n=this.tn.peek();if('"'===n||"'"===n)return this._readString();if(this.tn.next(),t.NUMBER.test(n))return i(n);if(t.BOOL.test(n))return "true"===n.toLowerCase();if(e&&t.TYPEREF.test(n))return n;throw Error("illegal value: "+n)},s._parseOption=function(e,n){var i,r=this.tn.next(),o=!1;if("("===r&&(o=!0,r=this.tn.next()),!t.TYPEREF.test(r))throw Error("illegal option name: "+r);i=r,o&&(this.tn.skip(")"),i="("+i+")",r=this.tn.peek(),t.FQTYPEREF.test(r)&&(i+=r,this.tn.next())),this.tn.skip("="),this._parseOptionValue(e,i),n||this.tn.skip(";");},s._parseOptionValue=function(e,n){var i=this.tn.peek();if("{"!==i)r(e.options,n,this._readValue(!0));else for(this.tn.skip("{");"}"!==(i=this.tn.next());){if(!t.NAME.test(i))throw Error("illegal option name: "+n+"."+i);this.tn.omit(":")?r(e.options,n+"."+i,this._readValue(!0)):this._parseOptionValue(e,n+"."+i);}},s._parseService=function(e){var n,i=this.tn.next();if(!t.NAME.test(i))throw Error("illegal service name at line "+this.tn.line+": "+i);for(n={name:i,rpc:{},options:{}},this.tn.skip("{");"}"!==(i=this.tn.next());)if("option"===i)this._parseOption(n);else {if("rpc"!==i)throw Error("illegal service token: "+i);this._parseServiceRPC(n);}this.tn.omit(";"),e.services.push(n);},s._parseServiceRPC=function(e){var n,i,r="rpc",o=this.tn.next();if(!t.NAME.test(o))throw Error("illegal rpc service method name: "+o);if(n=o,i={request:null,response:null,request_stream:!1,response_stream:!1,options:{}},this.tn.skip("("),"stream"===(o=this.tn.next()).toLowerCase()&&(i.request_stream=!0,o=this.tn.next()),!t.TYPEREF.test(o))throw Error("illegal rpc service request type: "+o);if(i.request=o,this.tn.skip(")"),"returns"!==(o=this.tn.next()).toLowerCase())throw Error("illegal rpc service request type delimiter: "+o);if(this.tn.skip("("),"stream"===(o=this.tn.next()).toLowerCase()&&(i.response_stream=!0,o=this.tn.next()),i.response=o,this.tn.skip(")"),"{"===(o=this.tn.peek())){for(this.tn.next();"}"!==(o=this.tn.next());){if("option"!==o)throw Error("illegal rpc service token: "+o);this._parseOption(i);}this.tn.omit(";");}else this.tn.skip(";");void 0===e[r]&&(e[r]={}),e[r][n]=i;},s._parseMessage=function(e,i){var r=!!i,o=this.tn.next(),s={name:"",fields:[],enums:[],messages:[],options:{},services:[],oneofs:{}};if(!t.NAME.test(o))throw Error("illegal "+(r?"group":"message")+" name: "+o);for(s.name=o,r&&(this.tn.skip("="),i.id=n(this.tn.next()),s.isGroup=!0),"["===(o=this.tn.peek())&&i&&this._parseFieldOptions(i),this.tn.skip("{");"}"!==(o=this.tn.next());)if(t.RULE.test(o))this._parseMessageField(s,o);else if("oneof"===o)this._parseMessageOneOf(s);else if("enum"===o)this._parseEnum(s);else if("message"===o)this._parseMessage(s);else if("option"===o)this._parseOption(s);else if("service"===o)this._parseService(s);else if("extensions"===o)s.extensions=this._parseExtensionRanges();else if("reserved"===o)this._parseIgnored();else if("extend"===o)this._parseExtend(s);else {if(!t.TYPEREF.test(o))throw Error("illegal message token: "+o);if(!this.proto3)throw Error("illegal field rule: "+o);this._parseMessageField(s,"optional",o);}return this.tn.omit(";"),e.messages.push(s),s},s._parseIgnored=function(){for(;";"!==this.tn.peek();)this.tn.next();this.tn.skip(";");},s._parseMessageField=function(e,i,r){var o,s,a;if(!t.RULE.test(i))throw Error("illegal message field rule: "+i);if(o={rule:i,type:"",name:"",options:{},id:0},"map"===i){if(r)throw Error("illegal type: "+r);if(this.tn.skip("<"),s=this.tn.next(),!t.TYPE.test(s)&&!t.TYPEREF.test(s))throw Error("illegal message field type: "+s);if(o.keytype=s,this.tn.skip(","),s=this.tn.next(),!t.TYPE.test(s)&&!t.TYPEREF.test(s))throw Error("illegal message field: "+s);if(o.type=s,this.tn.skip(">"),s=this.tn.next(),!t.NAME.test(s))throw Error("illegal message field name: "+s);o.name=s,this.tn.skip("="),o.id=n(this.tn.next()),"["===(s=this.tn.peek())&&this._parseFieldOptions(o),this.tn.skip(";");}else if("group"===(r=void 0!==r?r:this.tn.next())){if(a=this._parseMessage(e,o),!/^[A-Z]/.test(a.name))throw Error("illegal group name: "+a.name);o.type=a.name,o.name=a.name.toLowerCase(),this.tn.omit(";");}else {if(!t.TYPE.test(r)&&!t.TYPEREF.test(r))throw Error("illegal message field type: "+r);if(o.type=r,s=this.tn.next(),!t.NAME.test(s))throw Error("illegal message field name: "+s);o.name=s,this.tn.skip("="),o.id=n(this.tn.next()),"["===(s=this.tn.peek())&&this._parseFieldOptions(o),this.tn.skip(";");}return e.fields.push(o),o},s._parseMessageOneOf=function(e){var n,i,r,o=this.tn.next();if(!t.NAME.test(o))throw Error("illegal oneof name: "+o);for(i=o,r=[],this.tn.skip("{");"}"!==(o=this.tn.next());)(n=this._parseMessageField(e,"optional",o)).oneof=i,r.push(n.id);this.tn.omit(";"),e.oneofs[i]=r;},s._parseFieldOptions=function(e){this.tn.skip("[");for(var t=!0;"]"!==this.tn.peek();)t||this.tn.skip(","),this._parseOption(e,!0),t=!1;this.tn.next();},s._parseEnum=function(e){var i,r={name:"",values:[],options:{}},o=this.tn.next();if(!t.NAME.test(o))throw Error("illegal name: "+o);for(r.name=o,this.tn.skip("{");"}"!==(o=this.tn.next());)if("option"===o)this._parseOption(r);else {if(!t.NAME.test(o))throw Error("illegal name: "+o);this.tn.skip("="),i={name:o,id:n(this.tn.next(),!0)},"["===(o=this.tn.peek())&&this._parseFieldOptions({options:{}}),this.tn.skip(";"),r.values.push(i);}this.tn.omit(";"),e.enums.push(r);},s._parseExtensionRanges=function(){var t,n,r,o=[];do{for(n=[];;){switch(t=this.tn.next()){case"min":r=e.ID_MIN;break;case"max":r=e.ID_MAX;break;default:r=i(t);}if(n.push(r),2===n.length)break;if("to"!==this.tn.peek()){n.push(r);break}this.tn.next();}o.push(n);}while(this.tn.omit(","));return this.tn.skip(";"),o},s._parseExtend=function(e){var n,i=this.tn.next();if(!t.TYPEREF.test(i))throw Error("illegal extend reference: "+i);for(n={ref:i,fields:[]},this.tn.skip("{");"}"!==(i=this.tn.next());)if(t.RULE.test(i))this._parseMessageField(n,i);else {if(!t.TYPEREF.test(i))throw Error("illegal extend token: "+i);if(!this.proto3)throw Error("illegal field rule: "+i);this._parseMessageField(n,"optional",i);}return this.tn.omit(";"),e.messages.push(n),n},s.toString=function(){return "Parser at line "+this.tn.line},a.Parser=o,a}(o,o.Lang),o.Reflect=function(e){function n(t,n){if(t&&"number"==typeof t.low&&"number"==typeof t.high&&"boolean"==typeof t.unsigned&&t.low==t.low&&t.high==t.high)return new e.Long(t.low,t.high,void 0===n?t.unsigned:n);if("string"==typeof t)return e.Long.fromString(t,n||!1,10);if("number"==typeof t)return e.Long.fromNumber(t,n||!1);throw Error("not convertible to Long")}function r(t,n){var i=n.readVarint32(),o=7&i,s=i>>>3;switch(o){case e.WIRE_TYPES.VARINT:do{i=n.readUint8();}while(128==(128&i));break;case e.WIRE_TYPES.BITS64:n.offset+=8;break;case e.WIRE_TYPES.LDELIM:i=n.readVarint32(),n.offset+=i;break;case e.WIRE_TYPES.STARTGROUP:r(s,n);break;case e.WIRE_TYPES.ENDGROUP:if(s===t)return !1;throw Error("Illegal GROUPEND after unknown group: "+s+" ("+t+" expected)");case e.WIRE_TYPES.BITS32:n.offset+=4;break;default:throw Error("Illegal wire type in unknown group "+t+": "+o)}return !0}var o,s,a,c,u,l,h,d,f,p,g,_,m,v,y,E,T={},I=function(e,t,n){this.builder=e,this.parent=t,this.name=n,this.className;},C=I.prototype;return C.fqn=function(){for(var e=this.name,t=this;null!=(t=t.parent);)e=t.name+"."+e;return e},C.toString=function(e){return (e?this.className+" ":"")+this.fqn()},C.build=function(){throw Error(this.toString(!0)+" cannot be built directly")},T.T=I,o=function(e,t,n,i,r){I.call(this,e,t,n),this.className="Namespace",this.children=[],this.options=i||{},this.syntax=r||"proto2";},(s=o.prototype=Object.create(I.prototype)).getChildren=function(e){var t,n,i;if(null==(e=e||null))return this.children.slice();for(t=[],n=0,i=this.children.length;i>n;++n)this.children[n]instanceof e&&t.push(this.children[n]);return t},s.addChild=function(e){var t;if(t=this.getChild(e.name))if(t instanceof u.Field&&t.name!==t.originalName&&null===this.getChild(t.originalName))t.name=t.originalName;else {if(!(e instanceof u.Field&&e.name!==e.originalName&&null===this.getChild(e.originalName)))throw Error("Duplicate name in namespace "+this.toString(!0)+": "+e.name);e.name=e.originalName;}this.children.push(e);},s.getChild=function(e){var t,n,i="number"==typeof e?"id":"name";for(t=0,n=this.children.length;n>t;++t)if(this.children[t][i]===e)return this.children[t];return null},s.resolve=function(e,t){var n,i="string"==typeof e?e.split("."):e,r=this,o=0;if(""===i[o]){for(;null!==r.parent;)r=r.parent;o++;}do{do{if(!(r instanceof T.Namespace)){r=null;break}if(!((n=r.getChild(i[o]))&&n instanceof T.T&&(!t||n instanceof T.Namespace))){r=null;break}r=n,o++;}while(o<i.length);if(null!=r)break;if(null!==this.parent)return this.parent.resolve(e,t)}while(null!=r);return r},s.qn=function(e){var t,n,i=[],r=e;do{i.unshift(r.name),r=r.parent;}while(null!==r);for(t=1;t<=i.length;t++)if(n=i.slice(i.length-t),e===this.resolve(n,e instanceof T.Namespace))return n.join(".");return e.fqn()},s.build=function(){var e,t,n,i={},r=this.children;for(t=0,n=r.length;n>t;++t)(e=r[t])instanceof o&&(i[e.name]=e.build());return Object.defineProperty&&Object.defineProperty(i,"$options",{value:this.buildOpt()}),i},s.buildOpt=function(){var e,t,n,i,r={},o=Object.keys(this.options);for(e=0,t=o.length;t>e;++e)n=o[e],i=this.options[o[e]],r[n]=i;return r},s.getOption=function(e){return void 0===e?this.options:void 0!==this.options[e]?this.options[e]:null},T.Namespace=o,a=function(t,n,i,r){if(this.type=t,this.resolvedType=n,this.isMapKey=i,this.syntax=r,i&&e.MAP_KEY_TYPES.indexOf(t)<0)throw Error("Invalid map key type: "+t.name)},c=a.prototype,a.defaultFieldValue=function(t){if("string"==typeof t&&(t=e.TYPES[t]),void 0===t.defaultValue)throw Error("default value for type "+t.name+" is not supported");return t==e.TYPES.bytes?new i(0):t.defaultValue},c.verifyValue=function(i){var r,o,s,a=function(e,t){throw Error("Illegal value for "+this.toString(!0)+" of type "+this.type.name+": "+e+" ("+t+")")}.bind(this);switch(this.type){case e.TYPES.int32:case e.TYPES.sint32:case e.TYPES.sfixed32:return ("number"!=typeof i||i==i&&i%1!=0)&&a(typeof i,"not an integer"),i>4294967295?0|i:i;case e.TYPES.uint32:case e.TYPES.fixed32:return ("number"!=typeof i||i==i&&i%1!=0)&&a(typeof i,"not an integer"),i<0?i>>>0:i;case e.TYPES.int64:case e.TYPES.sint64:case e.TYPES.sfixed64:if(e.Long)try{return n(i,!1)}catch(e){a(typeof i,e.message);}else a(typeof i,"requires Long.js");case e.TYPES.uint64:case e.TYPES.fixed64:if(e.Long)try{return n(i,!0)}catch(e){a(typeof i,e.message);}else a(typeof i,"requires Long.js");case e.TYPES.bool:return "boolean"!=typeof i&&a(typeof i,"not a boolean"),i;case e.TYPES.float:case e.TYPES.double:return "number"!=typeof i&&a(typeof i,"not a number"),i;case e.TYPES.string:return "string"==typeof i||i&&i instanceof String||a(typeof i,"not a string"),""+i;case e.TYPES.bytes:return t.isByteBuffer(i)?i:t.wrap(i);case e.TYPES.enum:for(r=this.resolvedType.getChildren(e.Reflect.Enum.Value),s=0;s<r.length;s++){if(r[s].name==i)return r[s].id;if(r[s].id==i)return r[s].id}if("proto3"===this.syntax)return ("number"!=typeof i||i==i&&i%1!=0)&&a(typeof i,"not an integer"),(i>4294967295||i<0)&&a(typeof i,"not in range for uint32"),i;a(i,"not a valid enum value");case e.TYPES.group:case e.TYPES.message:if(i&&"object"==typeof i||a(typeof i,"object expected"),i instanceof this.resolvedType.clazz)return i;if(i instanceof e.Builder.Message){for(s in o={},i)i.hasOwnProperty(s)&&(o[s]=i[s]);i=o;}return new this.resolvedType.clazz(i)}throw Error("[INTERNAL] Illegal value for "+this.toString(!0)+": "+i+" (undefined type "+this.type+")")},c.calculateLength=function(t,n){if(null===n)return 0;var r;switch(this.type){case e.TYPES.int32:return n<0?i.calculateVarint64(n):i.calculateVarint32(n);case e.TYPES.uint32:return i.calculateVarint32(n);case e.TYPES.sint32:return i.calculateVarint32(i.zigZagEncode32(n));case e.TYPES.fixed32:case e.TYPES.sfixed32:case e.TYPES.float:return 4;case e.TYPES.int64:case e.TYPES.uint64:return i.calculateVarint64(n);case e.TYPES.sint64:return i.calculateVarint64(i.zigZagEncode64(n));case e.TYPES.fixed64:case e.TYPES.sfixed64:return 8;case e.TYPES.bool:return 1;case e.TYPES.enum:return i.calculateVarint32(n);case e.TYPES.double:return 8;case e.TYPES.string:return r=i.calculateUTF8Bytes(n),i.calculateVarint32(r)+r;case e.TYPES.bytes:if(n.remaining()<0)throw Error("Illegal value for "+this.toString(!0)+": "+n.remaining()+" bytes remaining");return i.calculateVarint32(n.remaining())+n.remaining();case e.TYPES.message:return r=this.resolvedType.calculate(n),i.calculateVarint32(r)+r;case e.TYPES.group:return (r=this.resolvedType.calculate(n))+i.calculateVarint32(t<<3|e.WIRE_TYPES.ENDGROUP)}throw Error("[INTERNAL] Illegal value to encode in "+this.toString(!0)+": "+n+" (unknown type)")},c.encodeValue=function(t,n,r){var o,s;if(null===n)return r;switch(this.type){case e.TYPES.int32:n<0?r.writeVarint64(n):r.writeVarint32(n);break;case e.TYPES.uint32:r.writeVarint32(n);break;case e.TYPES.sint32:r.writeVarint32ZigZag(n);break;case e.TYPES.fixed32:r.writeUint32(n);break;case e.TYPES.sfixed32:r.writeInt32(n);break;case e.TYPES.int64:case e.TYPES.uint64:r.writeVarint64(n);break;case e.TYPES.sint64:r.writeVarint64ZigZag(n);break;case e.TYPES.fixed64:r.writeUint64(n);break;case e.TYPES.sfixed64:r.writeInt64(n);break;case e.TYPES.bool:"string"==typeof n?r.writeVarint32("false"===n.toLowerCase()?0:!!n):r.writeVarint32(n?1:0);break;case e.TYPES.enum:r.writeVarint32(n);break;case e.TYPES.float:r.writeFloat32(n);break;case e.TYPES.double:r.writeFloat64(n);break;case e.TYPES.string:r.writeVString(n);break;case e.TYPES.bytes:if(n.remaining()<0)throw Error("Illegal value for "+this.toString(!0)+": "+n.remaining()+" bytes remaining");o=n.offset,r.writeVarint32(n.remaining()),r.append(n),n.offset=o;break;case e.TYPES.message:s=(new i).LE(),this.resolvedType.encode(n,s),r.writeVarint32(s.offset),r.append(s.flip());break;case e.TYPES.group:this.resolvedType.encode(n,r),r.writeVarint32(t<<3|e.WIRE_TYPES.ENDGROUP);break;default:throw Error("[INTERNAL] Illegal value to encode in "+this.toString(!0)+": "+n+" (unknown type)")}return r},c.decode=function(t,n,i){if(n!=this.type.wireType)throw Error("Unexpected wire type for element");var r,o;switch(this.type){case e.TYPES.int32:return 0|t.readVarint32();case e.TYPES.uint32:return t.readVarint32()>>>0;case e.TYPES.sint32:return 0|t.readVarint32ZigZag();case e.TYPES.fixed32:return t.readUint32()>>>0;case e.TYPES.sfixed32:return 0|t.readInt32();case e.TYPES.int64:return t.readVarint64();case e.TYPES.uint64:return t.readVarint64().toUnsigned();case e.TYPES.sint64:return t.readVarint64ZigZag();case e.TYPES.fixed64:return t.readUint64();case e.TYPES.sfixed64:return t.readInt64();case e.TYPES.bool:return !!t.readVarint32();case e.TYPES.enum:return t.readVarint32();case e.TYPES.float:return t.readFloat();case e.TYPES.double:return t.readDouble();case e.TYPES.string:return t.readVString();case e.TYPES.bytes:if(o=t.readVarint32(),t.remaining()<o)throw Error("Illegal number of bytes for "+this.toString(!0)+": "+o+" required but got only "+t.remaining());return (r=t.clone()).limit=r.offset+o,t.offset+=o,r;case e.TYPES.message:return o=t.readVarint32(),this.resolvedType.decode(t,o);case e.TYPES.group:return this.resolvedType.decode(t,-1,i)}throw Error("[INTERNAL] Illegal decode type")},c.valueFromString=function(t){if(!this.isMapKey)throw Error("valueFromString() called on non-map-key element");switch(this.type){case e.TYPES.int32:case e.TYPES.sint32:case e.TYPES.sfixed32:case e.TYPES.uint32:case e.TYPES.fixed32:return this.verifyValue(parseInt(t));case e.TYPES.int64:case e.TYPES.sint64:case e.TYPES.sfixed64:case e.TYPES.uint64:case e.TYPES.fixed64:return this.verifyValue(t);case e.TYPES.bool:return "true"===t;case e.TYPES.string:return this.verifyValue(t);case e.TYPES.bytes:return i.fromBinary(t)}},c.valueToString=function(t){if(!this.isMapKey)throw Error("valueToString() called on non-map-key element");return this.type===e.TYPES.bytes?t.toString("binary"):t.toString()},T.Element=a,u=function(e,t,n,i,r,s){o.call(this,e,t,n,i,s),this.className="Message",this.extensions=void 0,this.clazz=null,this.isGroup=!!r,this._fields=null,this._fieldsById=null,this._fieldsByName=null;},(l=u.prototype=Object.create(o.prototype)).build=function(n){var r,o,s,a;if(this.clazz&&!n)return this.clazz;for(r=function(e,n){function r(t,n,o,s){var a,c,u,l,h,d,f;if(null===t||"object"!=typeof t)return s&&s instanceof e.Reflect.Enum&&null!==(a=e.Reflect.Enum.getName(s.object,t))?a:t;if(i.isByteBuffer(t))return n?t.toBase64():t.toBuffer();if(e.Long.isLong(t))return o?t.toString():e.Long.fromValue(t);if(Array.isArray(t))return c=[],t.forEach((function(e,t){c[t]=r(e,n,o,s);})),c;if(c={},t instanceof e.Map){for(l=(u=t.entries()).next();!l.done;l=u.next())c[t.keyElem.valueToString(l.value[0])]=r(l.value[1],n,o,t.valueElem.resolvedType);return c}for(f in h=t.$type,d=void 0,t)t.hasOwnProperty(f)&&(c[f]=h&&(d=h.getChild(f))?r(t[f],n,o,d.resolvedType):r(t[f],n,o));return c}var o,s,a=n.getChildren(e.Reflect.Message.Field),c=n.getChildren(e.Reflect.Message.OneOf),u=function(t){var r,o,s,l;for(e.Builder.Message.call(this),r=0,o=c.length;o>r;++r)this[c[r].name]=null;for(r=0,o=a.length;o>r;++r)this[(s=a[r]).name]=s.repeated?[]:s.map?new e.Map(s):null,!s.required&&"proto3"!==n.syntax||null===s.defaultValue||(this[s.name]=s.defaultValue);if(arguments.length>0)if(1!==arguments.length||null===t||"object"!=typeof t||!("function"!=typeof t.encode||t instanceof u)||Array.isArray(t)||t instanceof e.Map||i.isByteBuffer(t)||t instanceof ArrayBuffer||e.Long&&t instanceof e.Long)for(r=0,o=arguments.length;o>r;++r)void 0!==(l=arguments[r])&&this.$set(a[r].name,l);else this.$set(t);},l=u.prototype=Object.create(e.Builder.Message.prototype);for(l.add=function(t,i,r){var o=n._fieldsByName[t];if(!r){if(!o)throw Error(this+"#"+t+" is undefined");if(!(o instanceof e.Reflect.Message.Field))throw Error(this+"#"+t+" is not a field: "+o.toString(!0));if(!o.repeated)throw Error(this+"#"+t+" is not a repeated field");i=o.verifyValue(i,!0);}return null===this[t]&&(this[t]=[]),this[t].push(i),this},l.$add=l.add,l.set=function(t,i,r){var o,s,a;if(t&&"object"==typeof t){for(o in r=i,t)t.hasOwnProperty(o)&&void 0!==(i=t[o])&&this.$set(o,i,r);return this}if(s=n._fieldsByName[t],r)this[t]=i;else {if(!s)throw Error(this+"#"+t+" is not a field: undefined");if(!(s instanceof e.Reflect.Message.Field))throw Error(this+"#"+t+" is not a field: "+s.toString(!0));this[s.name]=i=s.verifyValue(i);}return s&&s.oneof&&(a=this[s.oneof.name],null!==i?(null!==a&&a!==s.name&&(this[a]=null),this[s.oneof.name]=s.name):a===t&&(this[s.oneof.name]=null)),this},l.$set=l.set,l.get=function(t,i){if(i)return this[t];var r=n._fieldsByName[t];if(!(r&&r instanceof e.Reflect.Message.Field))throw Error(this+"#"+t+" is not a field: undefined");if(!(r instanceof e.Reflect.Message.Field))throw Error(this+"#"+t+" is not a field: "+r.toString(!0));return this[r.name]},l.$get=l.get,o=0;o<a.length;o++)(s=a[o])instanceof e.Reflect.Message.ExtensionField||n.builder.options.populateAccessors&&function(e){var t,i,r,o=e.originalName.replace(/(_[a-zA-Z])/g,(function(e){return e.toUpperCase().replace("_","")}));o=o.substring(0,1).toUpperCase()+o.substring(1),t=e.originalName.replace(/([A-Z])/g,(function(e){return "_"+e})),i=function(t,n){return this[e.name]=n?t:e.verifyValue(t),this},r=function(){return this[e.name]},null===n.getChild("set"+o)&&(l["set"+o]=i),null===n.getChild("set_"+t)&&(l["set_"+t]=i),null===n.getChild("get"+o)&&(l["get"+o]=r),null===n.getChild("get_"+t)&&(l["get_"+t]=r);}(s);return l.encode=function(e,i){var r,o;"boolean"==typeof e&&(i=e,e=void 0),r=!1,e||(e=new t,r=!0),o=e.littleEndian;try{return n.encode(this,e.LE(),i),(r?e.flip():e).LE(o)}catch(t){throw e.LE(o),t}},u.encode=function(e,t,n){return new u(e).encode(t,n)},l.calculate=function(){return n.calculate(this)},l.encodeDelimited=function(e){var t,r=!1;return e||(e=new i,r=!0),t=(new i).LE(),n.encode(this,t).flip(),e.writeVarint32(t.remaining()),e.append(t),r?e.flip():e},l.encodeAB=function(){try{return this.encode().toArrayBuffer()}catch(e){throw e.encoded&&(e.encoded=e.encoded.toArrayBuffer()),e}},l.toArrayBuffer=l.encodeAB,l.encodeNB=function(){try{return this.encode().toBuffer()}catch(e){throw e.encoded&&(e.encoded=e.encoded.toBuffer()),e}},l.toBuffer=l.encodeNB,l.encode64=function(){try{return this.encode().toBase64()}catch(e){throw e.encoded&&(e.encoded=e.encoded.toBase64()),e}},l.toBase64=l.encode64,l.encodeHex=function(){try{return this.encode().toHex()}catch(e){throw e.encoded&&(e.encoded=e.encoded.toHex()),e}},l.toHex=l.encodeHex,l.toRaw=function(e,t){return r(this,!!e,!!t,this.$type)},l.encodeJSON=function(){return JSON.stringify(r(this,!0,!0,this.$type))},u.decode=function(e,t){var r,o;"string"==typeof e&&(e=i.wrap(e,t||"base64")),r=(e=i.isByteBuffer(e)?e:i.wrap(e)).littleEndian;try{return o=n.decode(e.LE()),e.LE(r),o}catch(t){throw e.LE(r),t}},u.decodeDelimited=function(e,t){var r,o,s;if("string"==typeof e&&(e=i.wrap(e,t||"base64")),(e=i.isByteBuffer(e)?e:i.wrap(e)).remaining()<1)return null;if(r=e.offset,o=e.readVarint32(),e.remaining()<o)return e.offset=r,null;try{return s=n.decode(e.slice(e.offset,e.offset+o).LE()),e.offset+=o,s}catch(t){throw e.offset+=o,t}},u.decode64=function(e){return u.decode(e,"base64")},u.decodeHex=function(e){return u.decode(e,"hex")},u.decodeJSON=function(e){return new u(JSON.parse(e))},l.toString=function(){return n.toString()},Object.defineProperty&&(Object.defineProperty(u,"$options",{value:n.buildOpt()}),Object.defineProperty(l,"$options",{value:u.$options}),Object.defineProperty(u,"$type",{value:n}),Object.defineProperty(l,"$type",{value:n})),u}(e,this),this._fields=[],this._fieldsById={},this._fieldsByName={},s=0,a=this.children.length;a>s;s++)if((o=this.children[s])instanceof g||o instanceof u||o instanceof v){if(r.hasOwnProperty(o.name))throw Error("Illegal reflect child of "+this.toString(!0)+": "+o.toString(!0)+" cannot override static property '"+o.name+"'");r[o.name]=o.build();}else if(o instanceof u.Field)o.build(),this._fields.push(o),this._fieldsById[o.id]=o,this._fieldsByName[o.name]=o;else if(!(o instanceof u.OneOf||o instanceof m))throw Error("Illegal reflect child of "+this.toString(!0)+": "+this.children[s].toString(!0));return this.clazz=r},l.encode=function(e,t,n){var i,r,o,s,a,c=null;for(o=0,s=this._fields.length;s>o;++o)r=e[(i=this._fields[o]).name],i.required&&null===r?null===c&&(c=i):i.encode(n?r:i.verifyValue(r),t,e);if(null!==c)throw (a=Error("Missing at least one required field for "+this.toString(!0)+": "+c)).encoded=t,a;return t},l.calculate=function(e){for(var t,n,i=0,r=0,o=this._fields.length;o>r;++r){if(n=e[(t=this._fields[r]).name],t.required&&null===n)throw Error("Missing at least one required field for "+this.toString(!0)+": "+t);i+=t.calculate(n,e);}return i},l.decode=function(t,n,i){var o,s,a,c,u,l,h,d,f,p,g,_;for(n="number"==typeof n?n:-1,u=t.offset,l=new this.clazz;t.offset<u+n||-1===n&&t.remaining()>0;){if(a=(o=t.readVarint32())>>>3,(s=7&o)===e.WIRE_TYPES.ENDGROUP){if(a!==i)throw Error("Illegal group end indicator for "+this.toString(!0)+": "+a+" ("+(i?i+" expected":"not a group")+")");break}if(c=this._fieldsById[a])c.repeated&&!c.options.packed?l[c.name].push(c.decode(s,t)):c.map?(d=c.decode(s,t),l[c.name].set(d[0],d[1])):(l[c.name]=c.decode(s,t),c.oneof&&(null!==(f=l[c.oneof.name])&&f!==c.name&&(l[f]=null),l[c.oneof.name]=c.name));else switch(s){case e.WIRE_TYPES.VARINT:t.readVarint32();break;case e.WIRE_TYPES.BITS32:t.offset+=4;break;case e.WIRE_TYPES.BITS64:t.offset+=8;break;case e.WIRE_TYPES.LDELIM:h=t.readVarint32(),t.offset+=h;break;case e.WIRE_TYPES.STARTGROUP:for(;r(a,t););break;default:throw Error("Illegal wire type for unknown field "+a+" in "+this.toString(!0)+"#decode: "+s)}}for(p=0,g=this._fields.length;g>p;++p)if(null===l[(c=this._fields[p]).name])if("proto3"===this.syntax)l[c.name]=c.defaultValue;else {if(c.required)throw (_=Error("Missing at least one required field for "+this.toString(!0)+": "+c.name)).decoded=l,_;e.populateDefaults&&null!==c.defaultValue&&(l[c.name]=c.defaultValue);}return l},T.Message=u,h=function(t,n,i,r,o,s,a,c,l,h){I.call(this,t,n,s),this.className="Message.Field",this.required="required"===i,this.repeated="repeated"===i,this.map="map"===i,this.keyType=r||null,this.type=o,this.resolvedType=null,this.id=a,this.options=c||{},this.defaultValue=null,this.oneof=l||null,this.syntax=h||"proto2",this.originalName=this.name,this.element=null,this.keyElement=null,!this.builder.options.convertFieldsToCamelCase||this instanceof u.ExtensionField||(this.name=e.Util.toCamelCase(this.name));},(d=h.prototype=Object.create(I.prototype)).build=function(){this.element=new a(this.type,this.resolvedType,!1,this.syntax),this.map&&(this.keyElement=new a(this.keyType,void 0,!0,this.syntax)),"proto3"!==this.syntax||this.repeated||this.map?void 0!==this.options.default&&(this.defaultValue=this.verifyValue(this.options.default)):this.defaultValue=a.defaultFieldValue(this.type);},d.verifyValue=function(t,n){var i,r,o;if(n=n||!1,i=function(e,t){throw Error("Illegal value for "+this.toString(!0)+" of type "+this.type.name+": "+e+" ("+t+")")}.bind(this),null===t)return this.required&&i(typeof t,"required"),"proto3"===this.syntax&&this.type!==e.TYPES.message&&i(typeof t,"proto3 field without field presence cannot be null"),null;if(this.repeated&&!n){for(Array.isArray(t)||(t=[t]),o=[],r=0;r<t.length;r++)o.push(this.element.verifyValue(t[r]));return o}return this.map&&!n?t instanceof e.Map?t:(t instanceof Object||i(typeof t,"expected ProtoBuf.Map or raw object for map field"),new e.Map(this,t)):(!this.repeated&&Array.isArray(t)&&i(typeof t,"no array expected"),this.element.verifyValue(t))},d.hasWirePresence=function(t,n){if("proto3"!==this.syntax)return null!==t;if(this.oneof&&n[this.oneof.name]===this.name)return !0;switch(this.type){case e.TYPES.int32:case e.TYPES.sint32:case e.TYPES.sfixed32:case e.TYPES.uint32:case e.TYPES.fixed32:return 0!==t;case e.TYPES.int64:case e.TYPES.sint64:case e.TYPES.sfixed64:case e.TYPES.uint64:case e.TYPES.fixed64:return 0!==t.low||0!==t.high;case e.TYPES.bool:return t;case e.TYPES.float:case e.TYPES.double:return 0!==t;case e.TYPES.string:return t.length>0;case e.TYPES.bytes:return t.remaining()>0;case e.TYPES.enum:return 0!==t;case e.TYPES.message:return null!==t;default:return !0}},d.encode=function(t,n,r){var o,s,a,c,u;if(null===this.type||"object"!=typeof this.type)throw Error("[INTERNAL] Unresolved type in "+this.toString(!0)+": "+this.type);if(null===t||this.repeated&&0==t.length)return n;try{if(this.repeated)if(this.options.packed&&e.PACKABLE_WIRE_TYPES.indexOf(this.type.wireType)>=0){for(n.writeVarint32(this.id<<3|e.WIRE_TYPES.LDELIM),n.ensureCapacity(n.offset+=1),s=n.offset,o=0;o<t.length;o++)this.element.encodeValue(this.id,t[o],n);a=n.offset-s,(c=i.calculateVarint32(a))>1&&(u=n.slice(s,n.offset),s+=c-1,n.offset=s,n.append(u)),n.writeVarint32(a,s-c);}else for(o=0;o<t.length;o++)n.writeVarint32(this.id<<3|this.type.wireType),this.element.encodeValue(this.id,t[o],n);else this.map?t.forEach((function(t,r){var o=i.calculateVarint32(8|this.keyType.wireType)+this.keyElement.calculateLength(1,r)+i.calculateVarint32(16|this.type.wireType)+this.element.calculateLength(2,t);n.writeVarint32(this.id<<3|e.WIRE_TYPES.LDELIM),n.writeVarint32(o),n.writeVarint32(8|this.keyType.wireType),this.keyElement.encodeValue(1,r,n),n.writeVarint32(16|this.type.wireType),this.element.encodeValue(2,t,n);}),this):this.hasWirePresence(t,r)&&(n.writeVarint32(this.id<<3|this.type.wireType),this.element.encodeValue(this.id,t,n));}catch(e){throw Error("Illegal value for "+this.toString(!0)+": "+t+" ("+e+")")}return n},d.calculate=function(t,n){var r,o,s;if(t=this.verifyValue(t),null===this.type||"object"!=typeof this.type)throw Error("[INTERNAL] Unresolved type in "+this.toString(!0)+": "+this.type);if(null===t||this.repeated&&0==t.length)return 0;r=0;try{if(this.repeated)if(this.options.packed&&e.PACKABLE_WIRE_TYPES.indexOf(this.type.wireType)>=0){for(r+=i.calculateVarint32(this.id<<3|e.WIRE_TYPES.LDELIM),s=0,o=0;o<t.length;o++)s+=this.element.calculateLength(this.id,t[o]);r+=i.calculateVarint32(s),r+=s;}else for(o=0;o<t.length;o++)r+=i.calculateVarint32(this.id<<3|this.type.wireType),r+=this.element.calculateLength(this.id,t[o]);else this.map?t.forEach((function(t,n){var o=i.calculateVarint32(8|this.keyType.wireType)+this.keyElement.calculateLength(1,n)+i.calculateVarint32(16|this.type.wireType)+this.element.calculateLength(2,t);r+=i.calculateVarint32(this.id<<3|e.WIRE_TYPES.LDELIM),r+=i.calculateVarint32(o),r+=o;}),this):this.hasWirePresence(t,n)&&(r+=i.calculateVarint32(this.id<<3|this.type.wireType),r+=this.element.calculateLength(this.id,t));}catch(e){throw Error("Illegal value for "+this.toString(!0)+": "+t+" ("+e+")")}return r},d.decode=function(t,n,i){var r,o,s,c,u,l,h;if(!(!this.map&&t==this.type.wireType||!i&&this.repeated&&this.options.packed&&t==e.WIRE_TYPES.LDELIM||this.map&&t==e.WIRE_TYPES.LDELIM))throw Error("Illegal wire type for field "+this.toString(!0)+": "+t+" ("+this.type.wireType+" expected)");if(t==e.WIRE_TYPES.LDELIM&&this.repeated&&this.options.packed&&e.PACKABLE_WIRE_TYPES.indexOf(this.type.wireType)>=0&&!i){for(o=n.readVarint32(),o=n.offset+o,s=[];n.offset<o;)s.push(this.decode(this.type.wireType,n,!0));return s}if(this.map){if(c=a.defaultFieldValue(this.keyType),r=a.defaultFieldValue(this.type),o=n.readVarint32(),n.remaining()<o)throw Error("Illegal number of bytes for "+this.toString(!0)+": "+o+" required but got only "+n.remaining());for((u=n.clone()).limit=u.offset+o,n.offset+=o;u.remaining()>0;)if(t=7&(l=u.readVarint32()),1===(h=l>>>3))c=this.keyElement.decode(u,t,h);else {if(2!==h)throw Error("Unexpected tag in map field key/value submessage");r=this.element.decode(u,t,h);}return [c,r]}return this.element.decode(n,t,this.id)},T.Message.Field=h,f=function(e,t,n,i,r,o,s){h.call(this,e,t,n,null,i,r,o,s),this.extension;},f.prototype=Object.create(h.prototype),T.Message.ExtensionField=f,p=function(e,t,n){I.call(this,e,t,n),this.fields=[];},T.Message.OneOf=p,g=function(e,t,n,i,r){o.call(this,e,t,n,i,r),this.className="Enum",this.object=null;},g.getName=function(e,t){var n,i,r=Object.keys(e);for(i=0;i<r.length;++i)if(e[n=r[i]]===t)return n;return null},(g.prototype=Object.create(o.prototype)).build=function(t){var n,i,r,o;if(this.object&&!t)return this.object;for(n=new e.Builder.Enum,r=0,o=(i=this.getChildren(g.Value)).length;o>r;++r)n[i[r].name]=i[r].id;return Object.defineProperty&&Object.defineProperty(n,"$options",{value:this.buildOpt(),enumerable:!1}),this.object=n},T.Enum=g,_=function(e,t,n,i){I.call(this,e,t,n),this.className="Enum.Value",this.id=i;},_.prototype=Object.create(I.prototype),T.Enum.Value=_,m=function(e,t,n,i){I.call(this,e,t,n),this.field=i;},m.prototype=Object.create(I.prototype),T.Extension=m,v=function(e,t,n,i){o.call(this,e,t,n,i),this.className="Service",this.clazz=null;},(v.prototype=Object.create(o.prototype)).build=function(t){return this.clazz&&!t?this.clazz:this.clazz=function(e,t){var n,r=function(t){e.Builder.Service.call(this),this.rpcImpl=t||function(e,t,n){setTimeout(n.bind(this,Error("Not implemented, see: https://github.com/dcodeIO/ProtoBuf.js/wiki/Services")),0);};},o=r.prototype=Object.create(e.Builder.Service.prototype),s=t.getChildren(e.Reflect.Service.RPCMethod);for(n=0;n<s.length;n++)!function(e){o[e.name]=function(n,r){try{try{n=e.resolvedRequestType.clazz.decode(i.wrap(n));}catch(e){if(!(e instanceof TypeError))throw e}if(null===n||"object"!=typeof n)throw Error("Illegal arguments");n instanceof e.resolvedRequestType.clazz||(n=new e.resolvedRequestType.clazz(n)),this.rpcImpl(e.fqn(),n,(function(n,i){if(!n){try{i=e.resolvedResponseType.clazz.decode(i);}catch(e){}return i&&i instanceof e.resolvedResponseType.clazz?void r(null,i):void r(Error("Illegal response type received in service method "+t.name+"#"+e.name))}r(n);}));}catch(e){setTimeout(r.bind(this,e),0);}},r[e.name]=function(t,n,i){new r(t)[e.name](n,i);},Object.defineProperty&&(Object.defineProperty(r[e.name],"$options",{value:e.buildOpt()}),Object.defineProperty(o[e.name],"$options",{value:r[e.name].$options}));}(s[n]);return Object.defineProperty&&(Object.defineProperty(r,"$options",{value:t.buildOpt()}),Object.defineProperty(o,"$options",{value:r.$options}),Object.defineProperty(r,"$type",{value:t}),Object.defineProperty(o,"$type",{value:t})),r}(e,this)},T.Service=v,y=function(e,t,n,i){I.call(this,e,t,n),this.className="Service.Method",this.options=i||{};},(y.prototype=Object.create(I.prototype)).buildOpt=s.buildOpt,T.Service.Method=y,E=function(e,t,n,i,r,o,s,a){y.call(this,e,t,n,a),this.className="Service.RPCMethod",this.requestName=i,this.responseName=r,this.requestStream=o,this.responseStream=s,this.resolvedRequestType=null,this.resolvedResponseType=null;},E.prototype=Object.create(y.prototype),T.Service.RPCMethod=E,T}(o),o.Builder=function(e,t,n){function i(e){e.messages&&e.messages.forEach((function(t){t.syntax=e.syntax,i(t);})),e.enums&&e.enums.forEach((function(t){t.syntax=e.syntax;}));}var r=function(e){this.ns=new n.Namespace(this,null,""),this.ptr=this.ns,this.resolved=!1,this.result=null,this.files={},this.importRoot=null,this.options=e||{};},o=r.prototype;return r.isMessage=function(e){return "string"==typeof e.name&&(void 0===e.values&&void 0===e.rpc)},r.isMessageField=function(e){return "string"==typeof e.rule&&"string"==typeof e.name&&"string"==typeof e.type&&void 0!==e.id},r.isEnum=function(e){return "string"==typeof e.name&&!(void 0===e.values||!Array.isArray(e.values)||0===e.values.length)},r.isService=function(e){return !("string"!=typeof e.name||"object"!=typeof e.rpc||!e.rpc)},r.isExtend=function(e){return "string"==typeof e.ref},o.reset=function(){return this.ptr=this.ns,this},o.define=function(e){if("string"!=typeof e||!t.TYPEREF.test(e))throw Error("illegal namespace: "+e);return e.split(".").forEach((function(e){var t=this.ptr.getChild(e);null===t&&this.ptr.addChild(t=new n.Namespace(this,this.ptr,e)),this.ptr=t;}),this),this},o.create=function(t){var i,o,s,a,c;if(!t)return this;if(Array.isArray(t)){if(0===t.length)return this;t=t.slice();}else t=[t];for(i=[t];i.length>0;){if(t=i.pop(),!Array.isArray(t))throw Error("not a valid namespace: "+JSON.stringify(t));for(;t.length>0;){if(o=t.shift(),r.isMessage(o)){if(s=new n.Message(this,this.ptr,o.name,o.options,o.isGroup,o.syntax),a={},o.oneofs&&Object.keys(o.oneofs).forEach((function(e){s.addChild(a[e]=new n.Message.OneOf(this,s,e));}),this),o.fields&&o.fields.forEach((function(e){if(null!==s.getChild(0|e.id))throw Error("duplicate or invalid field id in "+s.name+": "+e.id);if(e.options&&"object"!=typeof e.options)throw Error("illegal field options in "+s.name+"#"+e.name);var t=null;if("string"==typeof e.oneof&&!(t=a[e.oneof]))throw Error("illegal oneof in "+s.name+"#"+e.name+": "+e.oneof);e=new n.Message.Field(this,s,e.rule,e.keytype,e.type,e.name,e.id,e.options,t,o.syntax),t&&t.fields.push(e),s.addChild(e);}),this),c=[],o.enums&&o.enums.forEach((function(e){c.push(e);})),o.messages&&o.messages.forEach((function(e){c.push(e);})),o.services&&o.services.forEach((function(e){c.push(e);})),o.extensions&&(s.extensions="number"==typeof o.extensions[0]?[o.extensions]:o.extensions),this.ptr.addChild(s),c.length>0){i.push(t),t=c,c=null,this.ptr=s,s=null;continue}c=null;}else if(r.isEnum(o))s=new n.Enum(this,this.ptr,o.name,o.options,o.syntax),o.values.forEach((function(e){s.addChild(new n.Enum.Value(this,s,e.name,e.id));}),this),this.ptr.addChild(s);else if(r.isService(o))s=new n.Service(this,this.ptr,o.name,o.options),Object.keys(o.rpc).forEach((function(e){var t=o.rpc[e];s.addChild(new n.Service.RPCMethod(this,s,e,t.request,t.response,!!t.request_stream,!!t.response_stream,t.options));}),this),this.ptr.addChild(s);else {if(!r.isExtend(o))throw Error("not a valid definition: "+JSON.stringify(o));if(s=this.ptr.resolve(o.ref,!0))o.fields.forEach((function(t){var i,r,o,a;if(null!==s.getChild(0|t.id))throw Error("duplicate extended field id in "+s.name+": "+t.id);if(s.extensions&&(i=!1,s.extensions.forEach((function(e){t.id>=e[0]&&t.id<=e[1]&&(i=!0);})),!i))throw Error("illegal extended field id in "+s.name+": "+t.id+" (not within valid ranges)");r=t.name,this.options.convertFieldsToCamelCase&&(r=e.Util.toCamelCase(r)),o=new n.Message.ExtensionField(this,s,t.rule,t.type,this.ptr.fqn()+"."+r,t.id,t.options),a=new n.Extension(this,this.ptr,t.name,o),o.extension=a,this.ptr.addChild(a),s.addChild(o);}),this);else if(!/\.?google\.protobuf\./.test(o.ref))throw Error("extended message "+o.ref+" is not defined")}o=null,s=null;}t=null,this.ptr=this.ptr.parent;}return this.resolved=!1,this.result=null,this},o.import=function(t,n){var r,o,s,a,c,u,l,h,d="/";if("string"==typeof n){if(e.Util.IS_NODE,!0===this.files[n])return this.reset();this.files[n]=!0;}else if("object"==typeof n){if(r=n.root,e.Util.IS_NODE,(r.indexOf("\\")>=0||n.file.indexOf("\\")>=0)&&(d="\\"),o=r+d+n.file,!0===this.files[o])return this.reset();this.files[o]=!0;}if(t.imports&&t.imports.length>0){for(a=!1,"object"==typeof n?(this.importRoot=n.root,a=!0,s=this.importRoot,n=n.file,(s.indexOf("\\")>=0||n.indexOf("\\")>=0)&&(d="\\")):"string"==typeof n?this.importRoot?s=this.importRoot:n.indexOf("/")>=0?""===(s=n.replace(/\/[^\/]*$/,""))&&(s="/"):n.indexOf("\\")>=0?(s=n.replace(/\\[^\\]*$/,""),d="\\"):s=".":s=null,c=0;c<t.imports.length;c++)if("string"==typeof t.imports[c]){if(!s)throw Error("cannot determine import root");if("google/protobuf/descriptor.proto"===(u=t.imports[c]))continue;if(u=s+d+u,!0===this.files[u])continue;if(/\.proto$/i.test(u)&&!e.DotProto&&(u=u.replace(/\.proto$/,".json")),null===(l=e.Util.fetch(u)))throw Error("failed to import '"+u+"' in '"+n+"': file not found");/\.json$/i.test(u)?this.import(JSON.parse(l+""),u):this.import(e.DotProto.Parser.parse(l),u);}else n?/\.(\w+)$/.test(n)?this.import(t.imports[c],n.replace(/^(.+)\.(\w+)$/,(function(e,t,n){return t+"_import"+c+"."+n}))):this.import(t.imports[c],n+"_import"+c):this.import(t.imports[c]);a&&(this.importRoot=null);}return t.package&&this.define(t.package),t.syntax&&i(t),h=this.ptr,t.options&&Object.keys(t.options).forEach((function(e){h.options[e]=t.options[e];})),t.messages&&(this.create(t.messages),this.ptr=h),t.enums&&(this.create(t.enums),this.ptr=h),t.services&&(this.create(t.services),this.ptr=h),t.extends&&this.create(t.extends),this.reset()},o.resolveAll=function(){var i;if(null==this.ptr||"object"==typeof this.ptr.type)return this;if(this.ptr instanceof n.Namespace)this.ptr.children.forEach((function(e){this.ptr=e,this.resolveAll();}),this);else if(this.ptr instanceof n.Message.Field){if(t.TYPE.test(this.ptr.type))this.ptr.type=e.TYPES[this.ptr.type];else {if(!t.TYPEREF.test(this.ptr.type))throw Error("illegal type reference in "+this.ptr.toString(!0)+": "+this.ptr.type);if(!(i=(this.ptr instanceof n.Message.ExtensionField?this.ptr.extension.parent:this.ptr.parent).resolve(this.ptr.type,!0)))throw Error("unresolvable type reference in "+this.ptr.toString(!0)+": "+this.ptr.type);if(this.ptr.resolvedType=i,i instanceof n.Enum){if(this.ptr.type=e.TYPES.enum,"proto3"===this.ptr.syntax&&"proto3"!==i.syntax)throw Error("proto3 message cannot reference proto2 enum")}else {if(!(i instanceof n.Message))throw Error("illegal type reference in "+this.ptr.toString(!0)+": "+this.ptr.type);this.ptr.type=i.isGroup?e.TYPES.group:e.TYPES.message;}}if(this.ptr.map){if(!t.TYPE.test(this.ptr.keyType))throw Error("illegal key type for map field in "+this.ptr.toString(!0)+": "+this.ptr.keyType);this.ptr.keyType=e.TYPES[this.ptr.keyType];}}else if(this.ptr instanceof e.Reflect.Service.Method){if(!(this.ptr instanceof e.Reflect.Service.RPCMethod))throw Error("illegal service type in "+this.ptr.toString(!0));if(!((i=this.ptr.parent.resolve(this.ptr.requestName,!0))&&i instanceof e.Reflect.Message))throw Error("Illegal type reference in "+this.ptr.toString(!0)+": "+this.ptr.requestName);if(this.ptr.resolvedRequestType=i,!((i=this.ptr.parent.resolve(this.ptr.responseName,!0))&&i instanceof e.Reflect.Message))throw Error("Illegal type reference in "+this.ptr.toString(!0)+": "+this.ptr.responseName);this.ptr.resolvedResponseType=i;}else if(!(this.ptr instanceof e.Reflect.Message.OneOf||this.ptr instanceof e.Reflect.Extension||this.ptr instanceof e.Reflect.Enum.Value))throw Error("illegal object in namespace: "+typeof this.ptr+": "+this.ptr);return this.reset()},o.build=function(e){var t,n,i;if(this.reset(),this.resolved||(this.resolveAll(),this.resolved=!0,this.result=null),null===this.result&&(this.result=this.ns.build()),!e)return this.result;for(t="string"==typeof e?e.split("."):e,n=this.result,i=0;i<t.length;i++){if(!n[t[i]]){n=null;break}n=n[t[i]];}return n},o.lookup=function(e,t){return e?this.ns.resolve(e,t):this.ns},o.toString=function(){return "Builder"},r.Message=function(){},r.Enum=function(){},r.Service=function(){},r}(o,o.Lang,o.Reflect),o.Map=function(e,t){function n(e){var t=0;return {next:function(){return t<e.length?{done:!1,value:e[t++]}:{done:!0}}}}var i=function(e,n){var i,r,o,s;if(!e.map)throw Error("field is not a map");if(this.field=e,this.keyElem=new t.Element(e.keyType,null,!0,e.syntax),this.valueElem=new t.Element(e.type,e.resolvedType,!1,e.syntax),this.map={},Object.defineProperty(this,"size",{get:function(){return Object.keys(this.map).length}}),n)for(i=Object.keys(n),r=0;r<i.length;r++)o=this.keyElem.valueFromString(i[r]),s=this.valueElem.verifyValue(n[i[r]]),this.map[this.keyElem.valueToString(o)]={key:o,value:s};},r=i.prototype;return r.clear=function(){this.map={};},r.delete=function(e){var t=this.keyElem.valueToString(this.keyElem.verifyValue(e)),n=t in this.map;return delete this.map[t],n},r.entries=function(){var e,t,i=[],r=Object.keys(this.map);for(t=0;t<r.length;t++)i.push([(e=this.map[r[t]]).key,e.value]);return n(i)},r.keys=function(){var e,t=[],i=Object.keys(this.map);for(e=0;e<i.length;e++)t.push(this.map[i[e]].key);return n(t)},r.values=function(){var e,t=[],i=Object.keys(this.map);for(e=0;e<i.length;e++)t.push(this.map[i[e]].value);return n(t)},r.forEach=function(e,t){var n,i,r=Object.keys(this.map);for(i=0;i<r.length;i++)e.call(t,(n=this.map[r[i]]).value,n.key,this);},r.set=function(e,t){var n=this.keyElem.verifyValue(e),i=this.valueElem.verifyValue(t);return this.map[this.keyElem.valueToString(n)]={key:n,value:i},this},r.get=function(e){var t=this.keyElem.valueToString(this.keyElem.verifyValue(e));return t in this.map?this.map[t].value:void 0},r.has=function(e){return this.keyElem.valueToString(this.keyElem.verifyValue(e))in this.map},i}(0,o.Reflect),o.loadProto=function(e,t,n){return ("string"==typeof t||t&&"string"==typeof t.file&&"string"==typeof t.root)&&(n=t,t=void 0),o.loadJson(o.DotProto.Parser.parse(e),t,n)},o.protoFromString=o.loadProto,o.loadProtoFile=function(e,t,n){if(t&&"object"==typeof t?(n=t,t=null):t&&"function"==typeof t||(t=null),t)return o.Util.fetch("string"==typeof e?e:e.root+"/"+e.file,(function(i){if(null!==i)try{t(null,o.loadProto(i,n,e));}catch(e){t(e);}else t(Error("Failed to fetch file"));}));var i=o.Util.fetch("object"==typeof e?e.root+"/"+e.file:e);return null===i?null:o.loadProto(i,n,e)},o.protoFromFile=o.loadProtoFile,o.newBuilder=function(e){return void 0===(e=e||{}).convertFieldsToCamelCase&&(e.convertFieldsToCamelCase=o.convertFieldsToCamelCase),void 0===e.populateAccessors&&(e.populateAccessors=o.populateAccessors),new o.Builder(e)},o.loadJson=function(e,t,n){return ("string"==typeof t||t&&"string"==typeof t.file&&"string"==typeof t.root)&&(n=t,t=null),t&&"object"==typeof t||(t=o.newBuilder()),"string"==typeof e&&(e=JSON.parse(e)),t.import(e,n),t.resolveAll(),t},o.loadJsonFile=function(e,t,n){if(t&&"object"==typeof t?(n=t,t=null):t&&"function"==typeof t||(t=null),t)return o.Util.fetch("string"==typeof e?e:e.root+"/"+e.file,(function(i){if(null!==i)try{t(null,o.loadJson(JSON.parse(i),n,e));}catch(e){t(e);}else t(Error("Failed to fetch file"));}));var i=o.Util.fetch("object"==typeof e?e.root+"/"+e.file:e);return null===i?null:o.loadJson(JSON.parse(i),n,e)},r=e,o.loadProto(r,void 0,"").build("Modules").probuf}(n,t);return i}tr.getModule=function(e){return tr[e]()};var or,sr,ar,cr=rr(er);cr.getModule=function(e){var t=new cr[e];return t.getArrayData=function(){var e=t.toArrayBuffer();return e=Ge$1(e)?[].slice.call(new Int8Array(e)):e},t};var ur,lr,hr="pgMsgP",dr="chatMsg",fr="pcMsgP",pr={PRIVATE:"ppMsgS",GROUP:"pgMsgS",CHATROOM:"chatMsgS"},gr="delMsg",_r="joinChrm",mr="joinChrmR",vr="exitChrm",yr="setKV",Er="delKV",Tr="setKVS",Ir="delKVS",Cr="qryRelationR",Rr="delRelation",Sr="setSeAtt",Or={PRIVATE:"cleanPMsg",GROUP:"cleanGMsg",ULTRA_GROUP:"cleanGMsg",CUSTOMER_SERVICE:"cleanCMsg",SYSTEM:"cleanSMsg"},Nr="qryPMsg",Mr="qryGMsg",Ur="qryCHMsg",Ar="qryCMsg",Lr="qrySMsg",wr=((or={})["ppMsgP"]=X$1.PRIVATE,or[hr]=X$1.GROUP,or[dr]=X$1.CHATROOM,or[fr]=X$1.CUSTOMER_SERVICE,or),br=((sr={})[X$1.PRIVATE]=Nr,sr[X$1.GROUP]=Mr,sr[X$1.CHATROOM]=Ur,sr[X$1.CUSTOMER_SERVICE]=Ar,sr[X$1.SYSTEM]=Lr,sr),Pr=((ar={})[X$1.PRIVATE]=Or.PRIVATE,ar[X$1.GROUP]=Or.GROUP,ar[X$1.ULTRA_GROUP]=Or.ULTRA_GROUP,ar[X$1.CUSTOMER_SERVICE]=Or.CUSTOMER_SERVICE,ar[X$1.SYSTEM]=Or.SYSTEM,ar),Dr="1",Vr="0",kr=1,Gr=2,Br=3,xr=function(){function e(e){this._codec="websocket"===e?cr:tr,this._connectType=e;}return e.prototype.decodeByPBName=function(e,t,n){var i,r=this,o=e,s=((i={})[Un$1]=r._formatSyncMessages,i[Mn$1]=r._formatReceivedMessage,i[On$1]=r._formatSentMessage,i[Vn$1]=r._formatHistoryMessages,i[Gn$1]=r._formatConversationList,i[zn$1]=r._formatChatRoomInfos,i[ai]=r._formatChatRoomKVList,i[gi]=r._formatUserSetting,i[vi]=r._formatConversationStatus,i[Ai]=r._formatGrpReadReceiptQryResp,i[fi]=r._formatSetUserSettingOutput,i[_i]=r._formatUserSettingNotification,i[Hi]=r._formatUltraMsgChangeList,i[Wi]=r._formatUltraOperateStatusNotifyList,i[ji]=r._formatUltraMsgList,i[Oi]=r._formatUltraGroupUnreadMentionedList,i[Wn$1]=r._formatChrmKVVersion,i)[t];try{o=e.length>0&&r._codec[t].decode(e),Fe$1(o)&&(o=function(e){for(var t in e)Fe$1(e[t])&&(e[t]=Xt$1(e[t]));return e}(o)),Ke$1(s)&&(o=s.call(this,o,n));}catch(n){kt$1.error("PB parse error\n",n,e,t);}return o},e.prototype._readBytes=function(e){var t=e.offset,n=e.buffer,i=e.limit;if(t)try{var r=Ge$1(n)?new Uint8Array(n):n;return Cn$1.readUTF(r.subarray(t,i))}catch(e){kt$1.info("readBytes error\n",e);}return e},e.prototype._formatBytes=function(e){if(!e)return e;var t=this._readBytes(e);try{t=JSON.parse(t);}catch(e){kt$1.info("formatBytes error\n",e);}return t||e},e.prototype._formatSyncMessages=function(e,t){t=t||{};var n=this,i=e.list,r=e.syncTime,o=e.finished;return (He$1(o)||null===o)&&(e.finished=!0),e.syncTime=Xt$1(r),e.list=cn$1(i,(function(e){return n._formatReceivedMessage(e,t)})),e},e.prototype._formatReceivedMessage=function(e,t){if(!e)return e;var i=(t=t||{}).currentUserId,r=t.connectedTime,o=e.content,s=e.fromUserId,a=e.type,c=e.groupId,u=e.status,l=e.dataTime,h=e.classname,d=e.msgId,f=e.extraContent,p=e.pushContent,g=e.pushExt,_=e.configFlag,m=e.extStatus;e.toUserId,e.groupUnpush;var v=e.clientUniqueId,y=(e.direction||W$1.RECEIVE)===W$1.SEND,E=function(e){var t=n.READ;return {isPersited:!!(16&e),isCounted:!!(32&e),isMentioned:!!(64&e),disableNotification:!!(512&e),receivedStatus:t=2&e?n.RETRIEVED:t,canIncludeExpansion:!!(1024&e)}}(u),T=E.isPersited,I=E.isCounted,C=E.isMentioned,R=E.disableNotification,S=E.receivedStatus,O=E.canIncludeExpansion,N=!!(2&(m||0)),M=!!(4&(m||0)),U=!!(8&(m||0))?Ie$1.PRIVATE:Ie$1.PUBLIC,A=[X$1.GROUP,X$1.CHATROOM,X$1.RTC_ROOM,X$1.ULTRA_GROUP].indexOf(a)>-1?c:s,L=y?i:s,w=Xt$1(l),b=w<r,D=a===X$1.CHATROOM,V=this._formatBytes(o),k={};if(g&&(k=nn$1(g.pushConfigs,g.pushId)),V.user){var G=V.user,B=G.portrait,x=G.portraitUri,F=B||x;F&&(V.user.portrait=V.user.portraitUri=F);}var K,H=P$1(P$1({},k),{pushTitle:null==g?void 0:g.title,pushContent:p,pushData:p,disablePushTitle:!!_&&Boolean(4&_),forceShowDetailContent:!!_&&Boolean(8&_),templateId:null==g?void 0:g.templateId}),q=y?W$1.SEND:W$1.RECEIVE;D&&s===i&&(q=W$1.SEND),f&&(K={},K=vn$1(f));var Y={conversationType:a,targetId:A,senderUserId:L,messageType:h,messageUId:d,isPersited:T,isCounted:I,isMentioned:C,sentTime:w,messageDirection:q,receivedTime:yn$1.getTime(),disableNotification:R,receivedStatus:S,canIncludeExpansion:O,content:V,expansion:K,configFlag:_,pushConfig:H,channelId:e.busChannel||"",isInterrupt:N,isModifyMessage:M,messageId:Xt$1(v)||0};return a!==X$1.ULTRA_GROUP&&(Y.isOffLineMessage=b),a===X$1.ULTRA_GROUP&&(Y.channelType=U),Y},e.prototype._formatSentMessage=function(e,t){var n,i=e.content,r=e.classname,o=e.sessionId,s=e.msgId,a=e.extraContent,c=e.pushExt,u=e.pushContent,l=e.configFlag,h=e.extStatus,d=e.clientUniqueId,f=t.signal,p=t.currentUserId,g=f.date,_=f.topic,m=f.targetId,v=!!(2&(h||0)),y=function(e){return {isPersited:!!(1&e),isCounted:!!(2&e),disableNotification:!!(32&e),canIncludeExpansion:!!(64&e)}}(o),E=y.isPersited,T=y.isCounted,I=y.disableNotification,C=y.canIncludeExpansion,R=wr[_]||X$1.PRIVATE,S=hn$1(pr,_),O=this._formatBytes(i),N=m;r===ie$1.RECALL&&(R=O.conversationType||R,N=O.targetId||m),a&&(n={},n=vn$1(a));var M={};c&&(M=nn$1(c.pushConfigs,c.pushId));var U=P$1(P$1({},M),{pushTitle:null==c?void 0:c.title,pushContent:u,pushData:u,disablePushTitle:!!l&&Boolean(4&l),forceShowDetailContent:!!l&&Boolean(8&l),templateId:null==c?void 0:c.templateId});return {conversationType:R,targetId:N,messageType:r,messageUId:s,isPersited:E,isCounted:T,isStatusMessage:S,senderUserId:p,content:this._formatBytes(i),sentTime:1e3*g,receivedTime:yn$1.getTime(),messageDirection:W$1.SEND,isOffLineMessage:!1,disableNotification:I,canIncludeExpansion:C,expansion:n,pushConfig:U,channelId:e.busChannel||"",isInterrupt:v,messageId:Xt$1(d)||0}},e.prototype._formatHistoryMessages=function(e,t){var n=this,i=t.conversation||{},r=e.list,o=e.hasMsg,s=i.targetId,a=Xt$1(e.syncTime),c=[];return an$1(r,(function(e){var r=n._formatReceivedMessage(e,t);i.conversationType===X$1.ULTRA_GROUP?r.targetId=e.groupId||i.targetId:r.targetId=s,c.push(r);}),{isReverse:!0}),{syncTime:a,list:c,hasMore:!!o}},e.prototype._formatUltraMsgChangeList=function(e){var t=e.list,n=e.syncTime,i=e.hasNext;return {syncTime:n,list:t&&t.map((function(e){var t=e.targetId,n=e.type,i=e.time,r=e.changeType,o=e.msgUID,s=e.msgTime,a=e.busChannel,c=e.isAdmin,u=e.isDel,l=e.operatorId,h=e.subChangeType;return {targetId:t,conversationType:n,changeType:r,messageUId:o,changeTime:Xt$1(i),sendTime:Xt$1(s),channelId:a||"",isAdmin:c,isDel:u,operatorId:l,subChangeType:h}})),hasNext:i}},e.prototype._formatUltraOperateStatusNotifyList=function(e){var t=e.type,n=e.notifyType,i=e.info,r=e.summary,o=[],s=[],a=2==(2&n),c=1==(1&n);return c&&Array.isArray(i)&&i.forEach((function(e){var t=e.targetId,n=e.busChannel,i=e.userId,r=e.opType,s=e.optime,a=Xt$1(s);o.push({targetId:t,channelId:n,userId:i,operationType:r,operationTime:a});})),a&&Array.isArray(r)&&r.forEach((function(e){var t=e.targetId,n=e.busChannel,i=e.count,r=e.opType;s.push({targetId:t,channelId:n,count:i,operationType:r});})),{conversationType:t,info:o,summary:s,hasInfo:c,hasSummary:a}},e.prototype._formatUltraMsgList=function(e,t){var n=this,i=e.list;return {list:i&&i.map((function(e){return n._formatReceivedMessage(e,t)}))}},e.prototype._formatUltraGroupUnreadMentionedList=function(e){var t=e.msgInfo;return (void 0===t?[]:t).map((function(e){return {messageUId:e.msgId,senTtime:Xt$1(e.msgTime),mentionedType:e.remindType}}))},e.prototype._formatConversationList=function(e,t){var n=this,i=e.info,r=t.afterDecode,o={list:(i=cn$1(i,(function(e){var i=e.msg,o=e.userId,s=e.type,a=e.unreadCount,c=e.busChannel,u=e.versionTime,l=e.remindCount,h=e.busChannelType;e.readMsgTime;var d=e.msgInfo,f=null;i&&((f=n._formatReceivedMessage(i,t)).targetId=o);var p={targetId:o,conversationType:s,unreadMessageCount:Xt$1(a)||0,latestMessage:f||{},channelId:c||""};return s===X$1.ULTRA_GROUP&&(p.versionTime=Xt$1(u)||0,p.unreadMentionedCount=Xt$1(l)||0,p.channelType=h||Ie$1.PUBLIC,p.lastReadTime=0,d&&(p.firstUnreadMessage={sentTime:Xt$1(d.msgTime)},p.lastReadTime=Xt$1(d.msgTime)-1)),(null==r?void 0:r(p))||p})))||[]};return ((null==t?void 0:t.conversationType)||X$1.NONE)===X$1.ULTRA_GROUP&&(o.isFinished=e.isFinished),o},e.prototype._formatSetUserSettingOutput=function(e){return e},e.prototype._formatChatRoomInfos=function(e){var t=e.userTotalNums,n=e.userInfos;return {userCount:t,userInfos:cn$1(n,(function(e){var t=e.id,n=e.time;return {id:t,time:Xt$1(n)}}))}},e.prototype._formatChatRoomKVList=function(e){var t=e.entries,n=e.bFullUpdate,i=e.syncTime;return t=cn$1(t=t||[],(function(e){var t=e.key,n=e.value,i=e.status,r=e.timestamp,o=e.uid,s=e.version,a=function(e){return {isAutoDelete:!!(1&e),isOverwrite:!!(2&e),type:4&e?_e$1.DELETE:_e$1.UPDATE}}(i);return {key:t,value:n,isAutoDelete:a.isAutoDelete,isOverwrite:a.isOverwrite,type:a.type,userId:o,timestamp:Xt$1(r),version:Xt$1(s)}})),{kvEntries:t,isFullUpdate:n,syncTime:i}},e.prototype._formatUserSetting=function(e){var t=this,n=e.items,i=e.version,r={};return an$1(n||[],(function(e){var n=e.key,i=e.version,o=e.value;e.version=Xt$1(i),e.value=t._readBytes(o),"Tag"===n&&e.tags.forEach((function(e){e.createdTime=Xt$1(e.createdTime),e.tagName=e.name;})),r[n]=e;})),{settings:r,version:i}},e.prototype._formatConversationStatus=function(e){var t=e.state,n=[];return an$1(t,(function(e){var t=e.type,i=e.channelId,r=e.time,o=e.stateItem,s=e.busChannel,a=oe$1.CLOSE,c=ae$1.NOT_SET,u=!1,l=[];an$1(o,(function(e){var t=e.sessionStateType,n=e.value,i=e.tags;switch(t){case kr:a=n===Dr?oe$1.OPEN:oe$1.CLOSE,c=Number(n)||ae$1.NOT_SET;break;case Gr:u=n===Dr;break;case Br:l=i;}})),n.push({conversationType:t,type:t,targetId:i,notificationStatus:a,notificationLevel:c,isTop:u,updatedTime:Xt$1(r),tags:l,channelId:s||""});})),n},e.prototype._formatGrpReadReceiptQryResp=function(e){var t=e.totalMemberNum,n=e.list;return n.forEach((function(e){e.readTime=Xt$1(e.readTime);})),{totalMemberCount:t,list:n}},e.prototype._formatUserSettingNotification=function(e){return e},e.prototype._formatChrmKVVersion=function(e){return e},e.prototype._formatRTCJoinedUserInfo=function(e){return (e.info||[]).map((function(e){return {deviceId:e.deviceId,roomId:e.roomId,joinTime:Xt$1(e.joinTime)}}))},e.prototype.encodeServerConfParams=function(){var e=this._codec.getModule(An$1);return e.setNothing(1),e.getArrayData()},e.prototype._getUpMsgModule=function(e,t){var n,i,r,o="comet"===this._connectType,s=e.conversationType,a=t.messageType,c=t.isMentioned,u=t.mentionedType,l=t.mentionedUserIdList,h=t.content,d=t.pushContent,f=t.pushData,p=t.directionalUserIdList,g=t.isFilerWhiteBlacklist,_=t.isVoipPush,m=t.canIncludeExpansion,v=t.expansion,y=t.pushConfig,E=t.channelId,T=t.messageId,I=void 0===T?0:T;[X$1.GROUP,X$1.ULTRA_GROUP].includes(s);var C=this._codec.getModule(On$1),R=function(e){var t=e.isStatusMessage,n=e.isPersited,i=e.isCounted;t&&(n=i=!1);var r=0;return n&&(r|=1),i&&(r|=2),e.isMentioned&&(r|=4),e.disableNotification&&(r|=32),e.canIncludeExpansion&&(r|=64),r}(t),S=y||{},O=S.pushTitle,N=S.pushContent,M=S.pushData,U=S.iOSConfig,A=S.androidConfig,L=S.templateId,w=S.disablePushTitle,b=S.forceShowDetailContent,P=0;C.setSessionId(R),c&&h&&(h.mentionedInfo={userIdList:(null===(n=h.mentionedInfo)||void 0===n?void 0:n.userIdList)||l||[],type:(null===(i=h.mentionedInfo)||void 0===i?void 0:i.type)||u||ue$1.ALL,mentionedContent:(null===(r=h.mentionedInfo)||void 0===r?void 0:r.mentionedContent)||""});var D=N||d||"",V=M||f||"";if(D&&C.setPushText(D),V&&C.setAppData(V),p&&C.setUserId(p),P|=_?1:0,P|=g?2:0,P|=w?4:0,P|=b?8:0,C.setConfigFlag(P),C.setClassname(a),h.user&&h.user.portraitUri&&(h.user.portrait=h.user.portraitUri),C.setContent(JSON.stringify(h)),m&&v){var k={};an$1(v,(function(e,t){k[t]={v:e};})),C.setExtraContent(JSON.stringify(k));}if(y){var G=this._codec.getModule(Nn$1);if(O&&G.setTitle(O),U&&A){var B=tn$1(U,A);G.setPushConfigs(B);}(null==A?void 0:A.notificationId)&&G.setPushId(null==A?void 0:A.notificationId),G.setTemplateId(L||""),C.setPushExt(o?G.getArrayData():G);}return C.setClientUniqueId(I),He$1(E)||C.setBusChannel(E),C},e.prototype.encodeUpMsg=function(e,t){return this._getUpMsgModule(e,t).getArrayData()},e.prototype.encodeSyncMsg=function(e){var t=e.sendboxTime,n=e.inboxTime,i=e.broadcastSyncTime,r=this._codec.getModule(wn$1);return r.setIspolling(!1),r.setIsPullSend(!0),r.setSendBoxSyncTime(t),r.setSyncTime(n),r.setBroadcastSyncTime(i),r.getArrayData()},e.prototype.encodeChrmSyncMsg=function(e,t){e=e||0,t=t||0;var n=this._codec.getModule(bn$1);return n.setCount(t),n.setSyncTime(e),n.getArrayData()},e.prototype.encodeGetHistoryMsg=function(e,t){var n=t.count,i=t.order,r=t.timestamp,o=t.channelId,s=this._codec.getModule(Dn$1);return s.setTargetId(e),s.setTime(r),s.setCount(n),s.setOrder(i),s.setBusChannel(o||""),s.getArrayData()},e.prototype.encodeSuperSyncMsg=function(e){var t=this._codec.getModule(Bi);return t.setSyncTime(e),t.getArrayData()},e.prototype.encodeGetConversationList=function(e){var t=(e=e||{}).count,n=e.startTime,i=this._codec.getModule(kn$1);return i.setType(1),i.setCount(t),i.setStartTime(n),i.getArrayData()},e.prototype.encodeOldConversationList=function(e){var t=(e=e||{}).count,n=e.type,i=e.startTime,r=e.order;t=t||0,i=i||0,r=r||0;var o=this._codec.getModule(kn$1);return o.setType(n),o.setCount(t),o.setStartTime(i),o.setOrder(r),o.getArrayData()},e.prototype.encodeRemoveOldConversationList=function(e){var t=(e=e||{}).conversationType,n=e.channelId,i=this._codec.getModule(Hn$1);return i.setType(t),n&&i.setBusChannel([n]),i.getArrayData()},e.prototype.encodeRemoveConversationList=function(e){var t=this,n=this._codec.getModule(xn$1),i=[];return an$1(e,(function(e){var n=e.conversationType,r=e.targetId,o=t._codec.getModule(Fn$1);o.setType(n),o.setChannelId(r),i.push(o);})),n.setSessions(i),n.getArrayData()},e.prototype.encodeDeleteMessages=function(e,t,n,i){var r=this._codec.getModule(qn$1),o=[];return an$1(n,(function(e){o.push({msgId:e.messageUId,msgDataTime:e.sentTime,direct:e.messageDirection});})),r.setType(e),r.setConversationId(t),r.setMsgs(o),r.setBusChannel(i),r.getArrayData()},e.prototype.encodeClearMessages=function(e,t,n,i){var r=this._codec.getModule(Yn$1);return t=t||(new Date).getTime(),r.setDataTime(t),r.setTargetId(e),r.setBusChannel(n),r.setConversationType(i),r.getArrayData()},e.prototype.encodeClearUnreadCount=function(e,t){var n=e.conversationType,i=e.targetId,r=e.channelId,o=t.timestamp,s=this._codec.getModule(jn$1);return o=o||+new Date,s.setType(n),s.setChannelId(i),s.setMsgTime(o),s.setBusChannel(r),s.getArrayData()},e.prototype.encodeExpandUltraMessage=function(e,t){var n=e.targetId,i=e.conversationType,r=e.channelId,o=e.messageUId,s=e.sendTime,a=e.keys,c={mid:o,put:e.expansion,del:a,clear:e.removeAll?1:0},u=this._codec.getModule(xi);return u.setFromUserId(t),u.setTargetId(n),u.setType(i),u.setBusChannel(r||""),u.setMsgUID(o),u.setMsgTime(s),u.setContent(JSON.stringify(c)),u.getArrayData()},e.prototype.encodemodifyMessage=function(e,t){var n=e.targetId,i=e.conversationType,r=e.channelId,o=e.messageUId,s=e.sendTime,a=e.content,c=this._codec.getModule(xi);return c.setFromUserId(t),c.setTargetId(n),c.setType(i),c.setBusChannel(r||""),c.setMsgUID(o),c.setMsgTime(s),c.setContent(JSON.stringify(a)),c.getArrayData()},e.prototype.encodeQueryMsgChange=function(e){var t=this._codec.getModule(Fi);return t.setSyncTime(e),t.getArrayData()},e.prototype.encodeMsgQuery=function(e){var t=e.targetId,n=e.conversationType,i=e.messages,r=this._codec.getModule(qi),o=i.map((function(e){return {msgTime:e.sendTime,msgUID:e.messageUId,busChannel:e.channelId}}));return r.setTargetId(t),r.setType(n),r.setQuery(o),r.getArrayData()},e.prototype.encodeUnreadMentionedMsgQuery=function(e){var t=e.targetId,n=e.channelId,i=e.sentTime,r=e.count,o=this._codec.getModule(Si);return o.setGroupId(t),o.setBusChannel(n),o.setMsgTime(i),o.setSize(r),o.getArrayData()},e.prototype.encodeOperateStatus=function(e,t,n,i){var r=this._codec.getModule(Qi);return r.setTargetId(e),r.setType(t),r.setBusChannel(n),r.setOpType(i),r.getArrayData()},e.prototype.encodeJoinOrQuitChatRoom=function(){var e=this._codec.getModule(Qn$1);return e.setNothing(1),e.getArrayData()},e.prototype.encodeGetChatRoomInfo=function(e,t){var n=this._codec.getModule(Jn$1);return n.setCount(e),n.setOrder(t),n.getArrayData()},e.prototype.encodeSetUltraGroupDefaultNotificationLevel=function(e,t){var n=this._codec.getModule(Ri);return n.setUnpushLevel(e),n.setBusChannel(t),n.getArrayData()},e.prototype.encodeGetUltraGroupDefaultNotificationLevel=function(e){var t=this._codec.getModule(Ci);return t.setBusChannel(e),t.getArrayData()},e.prototype.encodeGetFileToken=function(e,t,n,i){var r=this._codec.getModule(Zn$1);return r.setType(e),r.setKey(t),r.setHttpMethod(n),r.setQueryString(i),r.getArrayData()},e.prototype.encodeGetFileUrl=function(e,t,n,i){var r=this._codec.getModule(e);return r.setType(t),r.setKey(n),i&&r.setFileName(i),r.getArrayData()},e.prototype.encodeModifyChatRoomKV=function(e,t,n){var i="comet"===this._connectType,r=this._codec.getModule(ri),o=t.key,s=t.value,a=t.notificationExtra,c=t.isSendNotification,u=t.type,l=t.timestamp,h=u||_e$1.UPDATE,d=En$1(t,h),f={key:o,value:s||"",uid:n,version:l};if(He$1(d)||(f.status=d),r.setEntry(f),c){var p={conversationType:X$1.CHATROOM,targetId:e},g={key:o,value:s,extra:a,type:h},_=this._getUpMsgModule(p,{messageType:ie$1.CHRM_KV_NOTIFY,content:g,isPersited:!1,isCounted:!1}),m=i?_.getArrayData():_;r.setNotification(m),r.setBNotify(!0),r.setType(X$1.CHATROOM);}return r.getArrayData()},e.prototype.encodeModifyChatRoomKVS=function(e,t,n){this._connectType;var i=this._codec.getModule(oi),r=t.entries,o=t.type||_e$1.UPDATE,s=En$1(t,o),a=[];return r.forEach((function(e){var t={key:e.key,value:e.value||"",uid:n,version:e.timestamp};He$1(s)||(t.status=s),a.push(t);})),i.setEntry(a),i.getArrayData()},e.prototype.encodePullChatRoomKV=function(e){var t=this._codec.getModule(hi);return t.setTimestamp(e),t.getArrayData()},e.prototype.encodePullUserSetting=function(e){var t=this._codec.getModule(pi);return t.setVersion(e),t.getArrayData()},e.prototype.encodeGetConversationStatus=function(e){var t=this._codec.getModule(mi);return t.setTime(e),t.getArrayData()},e.prototype.encodeSetConversationStatus=function(e,t){var n=this,i="comet"===this._connectType,r=this._codec.getModule(Ti),o=yn$1.getTime(),s=[];return an$1(e,(function(e){var t=n._codec.getModule(yi),r=e.conversationType,a=e.targetId,c=e.notificationStatus,u=e.isTop,l=e.channelId,h=e.notificationLevel,d=[];t.setType(r),t.setChannelId(a),t.setTime(o),t.setBusChannel(l);var f=c===oe$1.OPEN,p={};He$1(c)||(p[kr]=f),He$1(h)||(p[kr]=h),He$1(u)||(p[Gr]=u),an$1(p,(function(e,t){if(!He$1(e)){var r=n._codec.getModule(Ei);e=e?Dr:Vr,He$1(h)||Number(t)!==kr||(e=String(h)),r.setSessionStateType(Number(t)),r.setValue(e);var o=i?r.getArrayData():r;d.push(o);}})),t.setStateItem(d);var g=i?t.getArrayData():t;s.push(g);})),r.setVersion(t||o),r.setState(s),r.getArrayData()},e.prototype.encodeReadReceipt=function(e,t){var n=this._codec.getModule(Mi);return n.setMsgId(e),t&&n.setChannelId(t),n.getArrayData()},e.prototype.encodeCreateTag=function(e,t){var n=this,i="comet"===this._connectType,r=this._codec.getModule(wi),o=[];return e.forEach((function(e){var t=n._codec.getModule(bi);t.setTagId(e.tagId),t.setName(e.tagName),o.push(i?t.getArrayData():t);})),r.setTags(o),r.setVersion(t),r.getArrayData()},e.prototype.encodeMessageReader=function(e,t){var n=this._codec.getModule(Mi);return n.setMsgId(e),t&&n.setChannelId(t),n.getArrayData()},e.prototype.encodeRemoveTag=function(e,t){var n=this,i="comet"===this._connectType,r=this._codec.getModule(Pi),o=[];return e.forEach((function(e){var t=n._codec.getModule(bi);t.setTagId(e),o.push(i?t.getArrayData():t);})),r.setTags(o),r.setVersion(t),r.getArrayData()},e.prototype.encodeDisConversationTag=function(e){var t=this._codec.getModule(Di);return t.setTagId(e),t.getArrayData()},e.prototype.encodeUpdateConversationTag=function(e,t){var n=this,i="comet"===this._connectType,r=this._codec.getModule(Ti),o=[];return t.forEach((function(t){var r=n._codec.getModule(yi),s=n._codec.getModule(Ei),a=[];e.forEach((function(e){var t=n._codec.getModule(bi);t.setTagId(e.tagId),He$1(e.isTop)||t.setIsTop(e.isTop),a.push(i?t.getArrayData():t);})),s.setSessionStateType(Br),s.setValue(JSON.stringify(a)),s.setTags(a),r.setType(t.conversationType),r.setChannelId(t.targetId),r.setTime(Date.now()),r.setStateItem([i?s.getArrayData():s]),o.push(i?r.getArrayData():r);})),r.setState(o),r.setVersion(yn$1.getTime()),r.getArrayData()},e.prototype.encodeReportSDKInfo=function(e){var t=this._codec.getModule(Vi);return t.setSdkInfo(e),t.getArrayData()},e.prototype.encodeUltraGroup=function(e,t){var n=this._codec.getModule(Gi);return n.setSyncTime(e),n.setIsEraseMsgContent(t),n.getArrayData()},e.prototype.encodebindRTCRoomForChatroom=function(e){var t=this._codec.getModule(Zi);return t.setRtcRoomId(e.rtcRoomId),t.getArrayData()},e}(),Fr=function(e,t){this._watcher=t,this.codec=new xr(e);};function Kr(e,t,n){if(e&&yt$1){var i=lt$1(at$1(de$1.STATISTICS),e,t,n);return yt$1.reportRealtimeLog([i]).then((function(){Tt$1(pe$1.G_UPLOAD_LOG_S,"big data realtime report success");})).catch((function(e){Tt$1(pe$1.G_UPLOAD_LOG_E,"big data realtime report error -> ".concat(e));}))}}!function(e){e[e.PRIVATE=1]="PRIVATE",e[e.OPEN=0]="OPEN";}(ur||(ur={})),function(e){e[e.NAVI=1]="NAVI",e[e.TCP=2]="TCP",e[e.WS=3]="WS";}(lr||(lr={}));var Hr,qr,Yr={},jr={sdkPrivate:ur.OPEN,serverPrivate:ur.OPEN,bundleId:"lib-next"};function Qr(e){jr.sdkPrivate=e.sdkPrivate===ur.PRIVATE?ur.PRIVATE:ur.OPEN,jr.serverPrivate=e.serverPrivate===ur.PRIVATE?ur.PRIVATE:ur.OPEN,e.bundleId&&(jr.bundleId=e.bundleId);}function Wr(){return jr}function Jr(e,t,n){void 0===t&&(t={}),void 0===n&&(n=!1),Fe$1(t)&&e&&(Yr[e]&&!n||(Yr[e]={}),Yr[e]=P$1(P$1({},Yr[e]),t));}function zr(e){return Yr[e]||{}}!function(e){e.GET="GET",e.POST="POST";}(Hr||(Hr={})),function(e){e.WIFI="wifi",e.FOUR_G="4g",e.THREE_G="3g",e.TWO_G="2g",e.FIVE_G="2g",e.THREE_GENT="3gnet",e.UNKONWN="unknown";}(qr||(qr={}));var Zr,Xr=function(e,t){return e&&t?"".concat(t,"_").concat(e):e||Date.now()},$r=function(){function e(e){this.header=e,this.messageId=0,this.timestamp=0,this.syncMsg=!1,this.identifier="";}return e.prototype.getIdentifier=function(){var e=this.messageId,t=this.identifier;return Xr(e,t)},e.prototype.read=function(e,t,n){this.readMessage(e,t,n);},e.prototype.readMessage=function(e,t,n){return {stream:e,length:t}},e}(),eo$1=function(){function e(e){this.lengthSize=0,this.messageId=0,this.topic="",this.targetId="",this.identifier="",this._header=new In$1(e,!1,qt$1.AT_MOST_ONCE,!1);}return e.prototype.getIdentifier=function(){var e=this.messageId,t=this.identifier;return Xr(e,t)},e.prototype.write=function(e){var t=this.getHeaderFlag();e.write(t),this.writeMessage(e);},e.prototype.setHeaderQos=function(e){this._header.qos=e;},e.prototype.getHeaderFlag=function(){return this._header.encode()},e.prototype.getLengthSize=function(){return this.lengthSize},e.prototype.getBufferData=function(){var e=new Sn$1;this.write(e);var t=e.getBytesArray();return new Int8Array(t)},e.prototype.getCometData=function(){var e=this.data||{};return JSON.stringify(e)},e}(),to$1=function(e){function t(){var t=null!==e&&e.apply(this,arguments)||this;return t.status=null,t.userId=null,t.timestamp=0,t}return b$1(t,e),t.prototype.readMessage=function(e,n,i){if(e.readByte(),this.status=+e.readByte(),n<=t.MESSAGE_LENGTH)return {stream:e,length:n};if(i===Qt$1.V4){var r=e.readByte();1&r&&(this.userId=e.readUTF()),2&r&&e.readUTF(),4&r&&(this.timestamp=e.readLong()),8&r&&(this.messageId=e.read2Byte());}else {this.userId=e.readUTF();var o=e.readUTF();kt$1.debug("server sessionId -> ".concat(o)),this.timestamp=e.readLong();}return {stream:e,length:n}},t.MESSAGE_LENGTH=2,t}($r),no$1=function(e){function t(){var t=null!==e&&e.apply(this,arguments)||this;return t.status=0,t}return b$1(t,e),t.prototype.readMessage=function(e,t){return e.readByte(),this.status=+e.readByte(),{stream:e,length:t}},t.MESSAGE_LENGTH=2,t}($r),io$1=function(e){function t(){return e.call(this,Yt$1.PING_REQ)||this}return b$1(t,e),t.prototype.writeMessage=function(e){},t}(eo$1),ro$1=function(e){function t(t){return e.call(this,t)||this}return b$1(t,e),t}($r),oo$1=function(e){function t(){var t=null!==e&&e.apply(this,arguments)||this;return t.messageId=0,t}return b$1(t,e),t.prototype.readMessage=function(e,t){var n=256*e.readByte()+e.readByte();return this.messageId=parseInt(n.toString(),10),{stream:e,length:t}},t}($r),so$1=function(e){function t(){return null!==e&&e.apply(this,arguments)||this}return b$1(t,e),t.prototype.writeMessage=function(e){var t=this.messageId,n=255&t,i=(65280&t)>>8;e.write(i),e.write(n);},t}(eo$1),ao$1=function(e){function t(){var t=null!==e&&e.apply(this,arguments)||this;return t.topic="",t.targetId="",t.syncMsg=!1,t.identifier=jt$1.PUB,t}return b$1(t,e),t.prototype.readMessage=function(t,n){return this.date=t.readInt(),this.topic=t.readUTF(),this.targetId=t.readUTF(),e.prototype.readMessage.call(this,t,n),this.data=t.readAll(),{stream:t,length:n}},t}(oo$1),co$1=function(e){function t(t,n,i){var r=e.call(this,Yt$1.PUBLISH)||this;return r.syncMsg=!1,r.identifier=jt$1.PUB,r.topic=t,r.data=Pe$1(n)?Cn$1.writeUTF(n):n,r.targetId=i,r}return b$1(t,e),t.prototype.writeMessage=function(t){t.writeUTF(this.topic),t.writeUTF(this.targetId),e.prototype.writeMessage.call(this,t),t.write(this.data);},t}(so$1),uo$1=function(e){function t(){var t=null!==e&&e.apply(this,arguments)||this;return t.status=0,t.date=0,t.millisecond=0,t.messageUId="",t.timestamp=0,t.identifier=jt$1.PUB,t.topic="",t.targetId="",t}return b$1(t,e),t.prototype.readMessage=function(t,n){return e.prototype.readMessage.call(this,t,n),this.date=t.readInt(),this.status=256*t.readByte()+t.readByte(),this.millisecond=256*t.readByte()+t.readByte(),this.timestamp=1e3*this.date+this.millisecond,this.messageUId=t.readUTF(),{stream:t,length:n}},t}(oo$1),lo$1=function(e){function t(t){var n=e.call(this,Yt$1.PUB_ACK)||this;return n.status=0,n.date=0,n.millisecond=0,n.messageUId="",n.timestamp=0,n.messageId=t,n}return b$1(t,e),t.prototype.writeMessage=function(t){e.prototype.writeMessage.call(this,t);},t}(so$1),ho$1=function(e){function t(t,n,i){var r=e.call(this,Yt$1.QUERY)||this;return r.identifier=jt$1.QUERY,r.topic=t,r.data=Pe$1(n)?Cn$1.writeUTF(n):n,r.targetId=i,r}return b$1(t,e),t.prototype.writeMessage=function(t){t.writeUTF(this.topic),t.writeUTF(this.targetId),e.prototype.writeMessage.call(this,t),t.write(this.data);},t}(so$1),fo$1=function(e){function t(t){var n=e.call(this,Yt$1.QUERY_CONFIRM)||this;return n.messageId=t,n}return b$1(t,e),t}(so$1),po$1=function(e){function t(){var t=null!==e&&e.apply(this,arguments)||this;return t.status=0,t.identifier=jt$1.QUERY,t.topic="",t.targetId="",t}return b$1(t,e),t.prototype.readMessage=function(t,n){return e.prototype.readMessage.call(this,t,n),this.date=t.readInt(),this.status=256*t.readByte()+t.readByte(),this.data=t.readAll(),{stream:t,length:n}},t}(oo$1),go$1=function(e){var t,n=e.type;switch(n){case Yt$1.CONN_ACK:t=new to$1(e);break;case Yt$1.PUBLISH:(t=new ao$1(e)).syncMsg=e.syncMsg;break;case Yt$1.PUB_ACK:t=new uo$1(e);break;case Yt$1.QUERY_ACK:t=new po$1(e);break;case Yt$1.SUB_ACK:case Yt$1.UNSUB_ACK:case Yt$1.PING_RESP:t=new ro$1(e);break;case Yt$1.DISCONNECT:t=new no$1(e);break;default:t=new $r(e),kt$1.error("No support for deserializing ".concat(n," messages"));}return t};!function(e){e[e.ppMsgP=1]="ppMsgP",e[e.ppMsgN=2]="ppMsgN",e[e.ppMsgS=3]="ppMsgS",e[e.pgMsgP=4]="pgMsgP",e[e.chatMsg=5]="chatMsg",e[e.pcMsgP=6]="pcMsgP",e[e.qryPMsg=7]="qryPMsg",e[e.qryGMsg=8]="qryGMsg",e[e.qryCHMsg=9]="qryCHMsg",e[e.qryCMsg=10]="qryCMsg",e[e.qrySMsg=11]="qrySMsg",e[e.recallMsg=12]="recallMsg",e[e.prMsgS=13]="prMsgS",e[e.rrMsg=14]="rrMsg",e[e.rrList=15]="rrList",e[e.s_ntf=16]="s_ntf",e[e.s_msg=17]="s_msg",e[e.s_stat=18]="s_stat",e[e.s_cmd=19]="s_cmd",e[e.s_us=20]="s_us",e[e.pullUS=21]="pullUS",e[e.pgMsgS=22]="pgMsgS",e[e.chatMsgS=23]="chatMsgS",e[e.qrySessionsAtt=24]="qrySessionsAtt",e[e.pullMsg=25]="pullMsg",e[e.qrySessions=26]="qrySessions",e[e.delSessions=27]="delSessions",e[e.delMsg=28]="delMsg",e[e.updRRTime=29]="updRRTime",e[e.chrmPull=30]="chrmPull",e[e.joinChrm=31]="joinChrm",e[e.joinChrmR=32]="joinChrmR",e[e.exitChrm=33]="exitChrm",e[e.queryChrmI=34]="queryChrmI",e[e.setKV=35]="setKV",e[e.delKV=36]="delKV",e[e.pullKV=37]="pullKV",e[e.qryRelation=38]="qryRelation",e[e.delRelation=39]="delRelation",e[e.pullSeAtts=40]="pullSeAtts",e[e.setSeAtt=41]="setSeAtt",e[e.qnTkn=42]="qnTkn",e[e.qnUrl=43]="qnUrl",e[e.aliUrl=44]="aliUrl",e[e.s3Url=45]="s3Url",e[e.stcUrl=46]="stcUrl",e[e.cleanPMsg=47]="cleanPMsg",e[e.cleanGMsg=48]="cleanGMsg",e[e.cleanCMsg=49]="cleanCMsg",e[e.cleanSMsg=50]="cleanSMsg",e[e.rtcPing=51]="rtcPing",e[e.rtc_ntf=52]="rtc_ntf",e[e.rtcSetOutData=53]="rtcSetOutData",e[e.rtcQryUserOutData=54]="rtcQryUserOutData",e[e.addSeTag=55]="addSeTag",e[e.delSeTag=56]="delSeTag",e[e.addTag=57]="addTag",e[e.delTag=58]="delTag",e[e.disTag=59]="disTag",e[e.reportsdk=60]="reportsdk",e[e.pullUgSes=61]="pullUgSes",e[e.pullUgMsg=62]="pullUgMsg",e[e.ugMsg=63]="ugMsg",e[e.qryUgMsg=64]="qryUgMsg",e[e.updUgRTime=65]="updUgRTime",e[e.upMsgEx=66]="upMsgEx",e[e.modifyMsg=67]="modifyMsg",e[e.qryMsgChange=68]="qryMsgChange",e[e.qryMsg=69]="qryMsg",e[e.operate=70]="operate",e[e.s_opNtf=71]="s_opNtf",e[e.ugUnpushQuery=72]="ugUnpushQuery",e[e.ugUnpushSet=73]="ugUnpushSet",e[e.setRtcRoomId=74]="setRtcRoomId",e[e.qryUgUal=75]="qryUgUal";}(Zr||(Zr={}));var _o$1,mo$1,vo$1,yo$1=Zr,Eo$1=function(e,t,n,i,r,o,s,a){return "".concat(e,"://").concat(t,"/websocket?appId=").concat(n,"&token=").concat(encodeURIComponent(i),"&sdkVer=").concat(o,"&pid=").concat(s,"&apiVer=").concat(r.isFromUniapp?"uniapp":"normal").concat(r.connectPlatform?"&platform=".concat(r.connectPlatform):"").concat(a?"&protocolVer=".concat(a):"")},To$1=function(e){return [yo$1.ppMsgS,yo$1.pgMsgS,yo$1.chatMsgS].map((function(e){return yo$1[e]})).indexOf(e)>=0};!function(e){e[e.REDIRECT=0]="REDIRECT",e[e.OTHER_DEVICE_LOGIN=1]="OTHER_DEVICE_LOGIN",e[e.BLOCK=2]="BLOCK",e[e.REMOTE_CLOSE=3]="REMOTE_CLOSE",e[e.LOGOUT=4]="LOGOUT",e[e.BLOCK_NEW=5]="BLOCK_NEW",e[e.REDIRECT_NEW=6]="REDIRECT_NEW";}(_o$1||(_o$1={})),function(e){e.IM_NAVI="IM-stats_navi-S",e.IM_WEBSOCKET="IM-stats_websocket-S",e.IM_COMET="IM-stats_comet-S",e.IM_CONNECTION_DURATION="IM-stats_con_dur-S";}(mo$1||(mo$1={}));var Io$1,Co$1="rtcRJoin_data",Ro$1="rtcRExit",So$1="rtcRInfo",Oo="rtcUData",No$1="rtcUPut",Mo="rtcUDel",Uo$1="rtcSetData",Ao="userSetData",Lo="rtcQryData",wo="rtcDelData",bo="rtcToken",Po="rtcUserState",Do="rtcUList",Vo="viewerJoinR",ko="viewerExitR",Go="rtcPullKv",Bo="rtcIdentityChange",xo="rtcInvite",Fo="rtcCancelInvite",Ko="rtcInviteAnswer",Ho="rtcEndInvite",qo="rtcQueryJoined";!function(e){e.RtcInput="RtcInput",e.RtcUserListOutput="RtcUserListOutput",e.SetUserStatusInput="SetUserStatusInput",e.RtcSetDataInput="RtcSetDataInput",e.RtcUserSetDataInput="RtcUserSetDataInput",e.RtcDataInput="RtcDataInput",e.RtcSetOutDataInput="RtcSetOutDataInput",e.MCFollowInput="MCFollowInput",e.RtcTokenOutput="RtcTokenOutput",e.RtcQryOutput="RtcQryOutput",e.RtcQryUserOutDataInput="RtcQryUserOutDataInput",e.RtcUserOutDataOutput="RtcUserOutDataOutput",e.RtcQueryListInput="RtcQueryListInput",e.RtcRoomInfoOutput="RtcRoomInfoOutput",e.RtcValueInfo="RtcValueInfo",e.RtcKeyDeleteInput="RtcKeyDeleteInput",e.RtcNotifyMsg="RtcNotifyMsg",e.RtcPullKV="RtcPullKV",e.RtcKVOutput="RtcKVOutput",e.RtcQueryUserJoinedInput="RtcQueryUserJoinedInput",e.RtcQueryUserJoinedOutput="RtcQueryUserJoinedOutput",e.RtcViewerJoinedOutput="RtcViewerJoinedOutput",e.RtcInviteInput="RtcInviteInput",e.RtcCancelInviteInput="RtcCancelInviteInput",e.RtcInviteAnswerInput="RtcInviteAnswerInput",e.RtcEndInviteInput="RtcEndInviteInput";}(Io$1||(Io$1={}));var Yo=((vo$1={})[Io$1.RtcInput]=["roomType","broadcastType","extraInnerData","needSysChatroom","identityChangeType","joinType","innerDatas","outerDatas"],vo$1[Io$1.RtcUserListOutput]=["users","token","sessionId","roomInfo"],vo$1[Io$1.SetUserStatusInput]=["status"],vo$1[Io$1.RtcSetDataInput]=["interior","target","key","value","objectName","content"],vo$1[Io$1.RtcUserSetDataInput]=["valueInfo","objectName","content"],vo$1[Io$1.RtcDataInput]=["interior","target","key","objectName","content"],vo$1[Io$1.RtcSetOutDataInput]=["target","valueInfo","objectName","content"],vo$1[Io$1.MCFollowInput]=["state"],vo$1[Io$1.RtcTokenOutput]=["rtcToken"],vo$1[Io$1.RtcQryOutput]=["outInfo"],vo$1[Io$1.RtcQryUserOutDataInput]=["userId"],vo$1[Io$1.RtcUserOutDataOutput]=["user"],vo$1[Io$1.RtcQueryListInput]=["order"],vo$1[Io$1.RtcRoomInfoOutput]=["roomId","roomData","userCount","list"],vo$1[Io$1.RtcValueInfo]=["key","value"],vo$1[Io$1.RtcKeyDeleteInput]=["key"],vo$1[Io$1.RtcNotifyMsg]=["type","time","roomId"],vo$1[Io$1.RtcPullKV]=["timestamp","roomId"],vo$1[Io$1.RtcKVOutput]=["entries","bFullUpdate","syncTime"],vo$1[Io$1.RtcQueryUserJoinedInput]=["userId"],vo$1[Io$1.RtcQueryUserJoinedOutput]=["info"],vo$1[Io$1.RtcInviteInput]=["invitedUserId","timeoutTime","invitedRoomId","inviteInfo","inviteSessionId"],vo$1[Io$1.RtcCancelInviteInput]=["invitedUserId","invitedRoomId","inviteInfo","inviteSessionId"],vo$1[Io$1.RtcInviteAnswerInput]=["inviteUserId","answerCode","inviteRoomId","inviteSessionId","content","key","value"],vo$1[Io$1.RtcEndInviteInput]=["inviteRoomId","inviteSessionId","inviteContent","inviteRoomKeys"],vo$1),jo="\npackage Modules;\nmessage probuf {\n  enum JoinType {\n    KICK = 0; //踢前一个设备\n    REFUSE = 1; //当前加入拒绝\n    COEXIST = 2; //两个设备共存\n  }\n  enum targetType {\n    ROOM =1 ;\n    PERSON = 2;\n  }\n  message ".concat(Io$1.SetUserStatusInput,"\n  {\n    optional int32 status=1;\n  }\n  message ").concat(Io$1.MCFollowInput,"\n  {\n    required string state = 1;\n  }\n  message ").concat(Io$1.RtcQueryListInput,"{\n    optional int32 order=1;\n  }\n  message ").concat(Io$1.RtcKeyDeleteInput,"{\n    repeated string key=1;\n  }\n  message ").concat(Io$1.RtcValueInfo,"{\n    required string key=1;\n    required string value=2;\n  }\n  message RtcUserInfo{\n    required string userId=1;\n    repeated ").concat(Io$1.RtcValueInfo," userData=2; //用户资源信息\n  }\n  message ").concat(Io$1.RtcUserListOutput,"{\n    repeated RtcUserInfo users=1;\n    optional string token=2;\n    optional string sessionId=3;\n    repeated RtcValueInfo roomInfo = 4; //房间key value\n    repeated RtcKVEntity entries = 5;//直播KV属性对象集合\n    optional int64 syncTime = 6;//所有属性的最大时间戳（下次拉取KV时用）。\n    optional int32 offlineKickTime = 7;//server超时踢人时间，默认60s\n  }\n  message RtcRoomInfoOutput{\n    optional string roomId = 1;\n    repeated ").concat(Io$1.RtcValueInfo," roomData = 2;\n    optional int32 userCount = 3;\n    repeated RtcUserInfo list=4;\n  }\n  message ").concat(Io$1.RtcInput,"{\n    required int32 roomType=1;\n    optional int32 broadcastType=2;\n    optional RtcValueInfo extraInnerData = 3;\n    optional bool needSysChatroom = 4; //是否需要同步聊天室\n    optional IdentityChangeType identityChangeType = 5; //身份变更类型\n    optional JoinType joinType = 6; // 加入房间类型\n    repeated ").concat(Io$1.RtcValueInfo," innerDatas = 7; //用户内部inner数据，角色或者连麦信息等\n    repeated ").concat(Io$1.RtcValueInfo," outerDatas = 8; //用户内部outer数据，自定义数据结构RtcInput。\n  }\n  message ").concat(Io$1.RtcQryOutput,"{\n    repeated ").concat(Io$1.RtcValueInfo," outInfo=1;\n  }\n  message ").concat(Io$1.RtcDataInput,"{\n    required bool interior=1;\n    required targetType target=2;\n    repeated string key=3;\n    optional string objectName=4;\n    optional string content=5;\n  }\n  message ").concat(Io$1.RtcSetDataInput,"{\n    required bool interior=1;\n    required targetType target=2;\n    required string key=3;\n    required string value=4;\n    optional string objectName=5;\n    optional string content=6;\n  }\n  message ").concat(Io$1.RtcUserSetDataInput," {\n    repeated ").concat(Io$1.RtcValueInfo," valueInfo = 1;\n    required string objectName = 2;\n    repeated ").concat(Io$1.RtcValueInfo," content = 3;\n  }\n  message RtcQryInput{\n    required bool isInterior=1;\n    required targetType target=2;\n    repeated string key=3;\n  }\n  message RtcDelDataInput{\n    repeated string key=1;\n    required bool isInterior=2;\n    required targetType target=3;\n  }\n  message RtcOutput\n  {\n    optional int32 nothing=1;\n  }\n  message ").concat(Io$1.RtcTokenOutput,"{\n    required string rtcToken=1;\n  }\n  message ").concat(Io$1.RtcSetOutDataInput,"{\n    required targetType target=1;\n    repeated ").concat(Io$1.RtcValueInfo," valueInfo=2;\n    optional string objectName=3;\n    optional string content=4;\n  }\n  message ").concat(Io$1.RtcQryUserOutDataInput,"{\n    repeated string userId = 1;\n  }\n  message ").concat(Io$1.RtcUserOutDataOutput,"{\n    repeated RtcUserInfo user = 1;\n  }\n  message ").concat(Io$1.RtcNotifyMsg," \n  {\n    required int32 type= 1;   //(通知类型 1:rtc房间状态KV变更通知)\n    optional int64 time= 2;   //消息产生时间\n    optional string roomId=3; //主播房间id\n  }\n  message ").concat(Io$1.RtcPullKV,"\n  {\n    required int64 timestamp = 1;\n    required string roomId = 2;\n  }\n  message RtcKVEntity \n  {\n    required string key = 1;\n    required string value = 2;\n    optional int32 status = 3;\n    optional int64 timestamp = 4;\n    optional string uid = 5;\n  }\n  message ").concat(Io$1.RtcKVOutput,"\n  {\n    repeated RtcKVEntity entries = 1;\n    optional bool bFullUpdate = 2;\n    optional int64 syncTime = 3; \n  }\n  enum IdentityChangeType \n  {\n    AnchorToViewer = 1; //1为主播变观众\n    ViewerToAnchor = 2; //2为观众变主播\n  }\n  message ").concat(Io$1.RtcQueryUserJoinedInput,"\n  {\n    required string userId = 1;\n  }\n  message RtcJoinedInfo\n  {\n    required string deviceId = 1; //设备ID\n    required string roomId = 2;   //加入的房间ID\n    optional int64 joinTime = 3;  //加入的时间\n  }\n  message ").concat(Io$1.RtcQueryUserJoinedOutput,"\n  {\n    repeated RtcJoinedInfo info = 1;\n  }\n  message ").concat(Io$1.RtcViewerJoinedOutput,"\n  {\n    required string rtcToken=1;\n    repeated RtcKVEntity entries = 2;//KV属性对象集合\n    optional int64 syncTime = 3;//所有属性的最大时间戳（下次拉取KV时用）。\n  }\n  message ").concat(Io$1.RtcInviteInput,"\n  {\n    required string invitedUserId=1;    //被邀请的人的uid\n    optional int32  timeoutTime=2;       //邀请超时时间(秒),默认三十秒\n    required string invitedRoomId=3;    //被邀请的房间\n    required string inviteInfo=4;       //邀请的信息(包含邀请人,被邀请人,各自userid)客户端定义好.协议栈和server透传\n    required string inviteSessionId= 5; //客户端保证唯一性(建议roomid_userid_时间戳_随机数)\n  }\n  message ").concat(Io$1.RtcCancelInviteInput,"\n  {\n    required string invitedUserId=1;   //被邀请的人的uid\n    required string invitedRoomId=2;   //被邀请的房间\n    required string inviteInfo=3;      //取消邀请的信息(包含邀请人,被邀请人,各自userid)客户端定义好.协议栈和server透传\n    required string inviteSessionId=4; //邀请的sessionId,客户端发起邀请时产生\n  }\n  message ").concat(Io$1.RtcInviteAnswerInput,"\n  {\n    required string inviteUserId=1;    //邀请的人的uid\n    required int32  answerCode=2;      //是否接受连麦邀请.0为拒绝,1为接受\n    required string inviteRoomId=3;    //邀请的房间\n    required string inviteSessionId=4; //邀请的sessionId\n    required string content=5;         //需要转发的content\n    optional string key=6;             //如果接受的话,需要加这个字段,放在room级别的k和v,新加入房间的能拉取到\n    optional string value=7;           //如果接受的话,需要加这个字段,放在room级别的k和v,新加入房间的能拉取到\n  }\n  message ").concat(Io$1.RtcEndInviteInput,"\n  {\n    required string inviteRoomId=1;    //邀请的房间\n    required string inviteSessionId=2; //邀请的sessionId\n    required string inviteContent=3;   //结束连麦的信息(需要透传给房间内其他人)\n    repeated string inviteRoomKeys=4;  //需要删除连麦的信息的key\n  }\n}\n"),Qo=function(e,t){kt$1.info("websocket send -> messageId: ".concat(e.messageId," topic: ").concat(e.topic));var n=e.getBufferData();t.send(n.buffer);};var Wo=function(e){function t(t,n){var i=e.call(this,"websocket",n)||this;return i._runtime=t,i._socket=null,i._messageIds={},i._syncMessageIds={},i._failedCount=0,i.ALLOW_FAILED_TIMES=2,i._timer=null,i._idCount=0,i._generateMessageId=function(){return i._idCount>=65535&&(i._idCount=0),++i._idCount},i}return b$1(t,e),t.prototype.connect=function(e,t,n,i,r,o){return D$1(this,void 0,void 0,(function(){var s=this;return V$1(this,(function(a){return [2,new Promise((function(a){var c=n.slice(),u=!1,l=function(){return D$1(s,void 0,void 0,(function(){var n,s,h;return V$1(this,(function(d){switch(d.label){case 0:return 0===c.length||u?[2]:(u=!0,n=c.shift(),Jr(mo$1.IM_WEBSOCKET,{startTime:(new Date).getTime(),host:n,protocol:lr.WS}),[4,this._connect(e,t,n,i,r,o)]);case 1:if(s=d.sent(),h=s===z$1.SUCCESS||s===te$1.REDIRECT?s:gn$1(s),Jr(mo$1.IM_WEBSOCKET,{endTime:(new Date).getTime(),code:h}),function(e){D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h,d,f,p;return V$1(this,(function(g){switch(g.label){case 0:t=mo$1.IM_WEBSOCKET,n=Wr(),i=n.sdkPrivate,r=n.serverPrivate,o=n.bundleId,s=zr(t),a=s.protocol,c=s.startTime,u=s.endTime,l=s.code,h=s.host,d=qr.UNKONWN,g.label=1;case 1:return g.trys.push([1,3,,4]),[4,e.getNetworkType()];case 2:return d=g.sent(),[3,4];case 3:return f=g.sent(),kt$1.info(f.message),[3,4];case 4:return p=0,Ve$1(c)&&Ve$1(u)&&u>c&&c&&(p=u-c),Kr(t,{spr:i,pr:r,bid:o,ptc:a,dur:p,cod:l,hos:h,net:d}),[2]}}))}));}(this._runtime),s===z$1.SUCCESS)this._checkAlive(),a(s);else if(s===te$1.REDIRECT)a(s);else {if(0===c.length)return a(gn$1(s)),[2];u=!1,l();}return [2]}}))}))};r=q$1(r),s._watcher.status(ee$1.CONNECTING),l();}))]}))}))},t.prototype._connect=function(e,t,n,i,r,o){return D$1(this,void 0,void 0,(function(){var s,a,c,u,l,h=this;return V$1(this,(function(d){switch(d.label){case 0:return s=i.replace("http","ws"),a=Eo$1(s,n,e,t,this._runtime,r,"",o),kt$1.info("conenct start -> ".concat(a)),this.sendConnectTime=Date.now(),c=this._runtime.createWebSocket(a),u=function(e){h._timer&&(clearTimeout(h._timer),h._timer=null),h._socket===c&&(h._socket=null,h._watcher.status(e));},[4,new Promise((function(e){c.onMessage((function(t){if("[object ArrayBuffer]"===Object.prototype.toString.call(t)){var n=function(e,t){var n=new Uint8Array(e),i=new Rn$1(n),r=i.readByte(),o=new In$1(r),s=go$1(o);return s.read(i,n.length-1,t),s}(t,o);if(n instanceof ro$1&&h._pingResolve)return h._pingResolve(z$1.SUCCESS),void(h._pingResolve=void 0);if(n instanceof to$1)return kt$1.info("recv connect ack -> ".concat(n.status)),n.status!==te$1.ACCEPTED?(kt$1.warn("connect failed: ".concat(n.status)),void e(n.status)):(kt$1.info("connect success -> ".concat(a)),h.connectedTime=n.timestamp,h.userId=n.userId||"",h._idCount=n.messageId,void e(z$1.SUCCESS));if(n instanceof no$1){var i=n.status;switch(kt$1.warn("recv disconnect signal -> status: ".concat(i)),i){case _o$1.BLOCK_NEW:case _o$1.BLOCK:h._watcher.status(ee$1.BLOCKED);break;case _o$1.OTHER_DEVICE_LOGIN:h._watcher.status(ee$1.KICKED_OFFLINE_BY_OTHER_CLIENT);break;case _o$1.REDIRECT_NEW:case _o$1.REDIRECT:h._watcher.status(ee$1.REDIRECT);break;default:h._watcher.status(ee$1.DISCONNECT_BY_SERVER);}}else h._onReceiveSignal(n);}else kt$1.error("Socket received invalid data:",t);})),c.onClose((function(t,n){for(var i in kt$1.warn("websocket closed! code:",t,"reason:",n),u(ee$1.CONNECTION_CLOSED),h._messageIds){var r=h._messageIds[i];delete h._messageIds[i],r(z$1.RC_NET_CHANNEL_INVALID);}e(t);})),c.onError((function(t){for(var n in kt$1.error("websocket error!",null==t?void 0:t.stack),u(ee$1.WEBSOCKET_ERROR),h._messageIds){var i=h._messageIds[n];delete h._messageIds[n],i(z$1.RC_NET_CHANNEL_INVALID);}e(z$1.NETWORK_ERROR);})),c.onOpen((function(){return kt$1.info("websocket open =>",a)})),setTimeout((function(){e(z$1.TIMEOUT);}),5e3);}))];case 1:return (l=d.sent())===z$1.SUCCESS?this._socket=c:(kt$1.warn("connect result -> code: ".concat(l,", url: ").concat(a)),c.close()),[2,l]}}))}))},t.prototype._checkAlive=function(){var e;return D$1(this,void 0,void 0,(function(){var t,n,i=this;return V$1(this,(function(r){switch(r.label){case 0:return this._socket?(t=_t$1(),Tt$1(pe$1.L_CHECK_ALIVE_IM_T,{},{traceId:t}),this.sendOnly(new io$1),[4,new Promise((function(e){i._pingResolve=e,i._timer&&clearTimeout(i._timer),i._timer=setTimeout((function(){i._pingResolve=void 0,e(z$1.TIMEOUT);}),15e3);}))]):[2];case 1:return n=r.sent(),(n===z$1.SUCCESS?Tt$1:It$1)(pe$1.L_CHECK_ALIVE_IM_R,{isSuccess:n===z$1.SUCCESS},{traceId:t}),n!==z$1.SUCCESS?(this._failedCount+=1,kt$1.warn("ping failed count: ".concat(this._failedCount,", code: ").concat(n)),this._failedCount>=this.ALLOW_FAILED_TIMES?(this._failedCount=0,kt$1.warn("ping timeout, close current websocket to reconnect!"),null===(e=this._socket)||void 0===e||e.close(),this._socket=null,this._watcher.status(ee$1.NETWORK_UNAVAILABLE)):this._checkAlive(),[2]):(this._failedCount=0,setTimeout((function(){return i._checkAlive()}),15e3),[2])}}))}))},t.prototype._onReceiveSignal=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a=this;return V$1(this,(function(c){switch(c.label){case 0:return t=e.messageId,e.header&&e.header.qos!==qt$1.AT_MOST_ONCE&&(e instanceof ao$1&&!e.syncMsg&&(kt$1.info("send pubAck -> ".concat(t," ").concat(e.topic)),this.sendOnly(new lo$1(t))),e instanceof po$1&&(kt$1.info("send queryCon -> ".concat(t," ").concat(e.topic)),this.sendOnly(new fo$1(t)))),t>0&&(e instanceof uo$1||e instanceof po$1)&&(kt$1.info("recv ack -> messageId: ".concat(t," ").concat(e.topic)),(n=this._messageIds[t])&&(n(e),delete this._messageIds[t]),(i=this._syncMessageIds[t])&&(delete this._syncMessageIds[t],i(e))),e instanceof ao$1?(r=e.syncMsg,o=e.topic,kt$1.info("recv PublishReader -> messageId: ".concat(t," ").concat(o)),o===Ao?[2]:!r||To$1(o)?(this._watcher.signal(e),[2]):[4,new Promise((function(e){a._syncMessageIds[t]=e;}))]):[3,2];case 1:s=c.sent(),delete this._syncMessageIds[t],this._watcher.signal(e,s),c.label=2;case 2:return [2]}}))}))},t.prototype.sendOnly=function(e){this._socket&&((e instanceof co$1||e instanceof ho$1)&&(e.messageId=this._generateMessageId()),Qo(e,this._socket));},t.prototype.send=function(e,t,n,i){return void 0===i&&(i=3e4),D$1(this,void 0,void 0,(function(){var r,o,s,a,c=this;return V$1(this,(function(u){switch(u.label){case 0:return this._socket?(r=this._generateMessageId(),e.messageId=r,Qo(e,this._socket),[4,new Promise((function(e){c._messageIds[r]=e,setTimeout((function(){c._messageIds[r]&&delete c._messageIds[r],e();}),i);}))]):[3,2];case 1:return (o=u.sent())?o instanceof po$1||o instanceof uo$1?(s=t&&o.data&&[z$1.SUCCESS,z$1.CHATROOM_KV_STORE_NOT_ALL_SUCCESS].indexOf(o.status)>=0,a=s?this.codec.decodeByPBName(o.data,t,n):o,0!==o.status?(kt$1.warn("send failed -> message: ".concat(r,", respPBName: ").concat(t,", status: ").concat(o.status)),[2,{code:o.status,data:t&&o.data?a:null}]):[2,{code:z$1.SUCCESS,data:a}]):[2,{code:o}]:(kt$1.warn("send timeout -> message: ".concat(r,", respPBName: ").concat(t,", timeout: ").concat(i)),[2,{code:z$1.TIMEOUT}]);case 2:return [2,{code:z$1.RC_NET_CHANNEL_INVALID}]}}))}))},t.prototype.close=function(){this._socket&&(this._socket.close(),this._socket=null);},t}(Fr);var Jo=function(e){function t(t,n){var i=e.call(this,"comet",n)||this;return i._runtime=t,i._messageIds={},i._syncMessageIds={},i._idCount=0,i._generateMessageId=function(){return ++i._idCount},i._pid=encodeURIComponent("".concat((new Date).getTime()+Math.random())),i}return b$1(t,e),t.prototype.handleCometRes=function(e){var t=this;if(200!==e.status&&202!==e.status)return !1;var n=Pe$1(e.data)?JSON.parse(e.data):e.data;return n?!ke$1(n)||(an$1(n,(function(e){return D$1(t,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h,d,f,p=this;return V$1(this,(function(g){switch(g.label){case 0:if((t=e.sessionid)&&(this._sessionid=t),n=function(e){var t=e.headerCode,n=new In$1(t),i=go$1(n);for(var r in e)i[r]=e[r];return i}(e),i=n.messageId,r=n._header,o=n.status,n.identifier,s=r&&r.qos!==qt$1.AT_MOST_ONCE,i&&n.getIdentifier&&(null==(a=this._messageIds[i])||a(n),null===(f=(d=this._syncMessageIds)[i])||void 0===f||f.call(d,n)),s&&(n instanceof ao$1&&!n.syncMsg&&(c=new lo$1(i),this.sendOnly(c)),n instanceof po$1&&(c=new fo$1(i),this.sendOnly(c))),n instanceof no$1){switch(o){case _o$1.OTHER_DEVICE_LOGIN:this._watcher.status(ee$1.KICKED_OFFLINE_BY_OTHER_CLIENT);break;case _o$1.BLOCK:case _o$1.BLOCK_NEW:this._watcher.status(ee$1.BLOCKED);break;case _o$1.REDIRECT_NEW:case _o$1.REDIRECT:this._watcher.status(ee$1.REDIRECT);break;default:this._watcher.status(ee$1.DISCONNECT_BY_SERVER);}return [2]}return n instanceof ao$1?(u=n.syncMsg,l=n.topic,!u||To$1(l)?(this._watcher.signal(n),[2,!1]):[4,new Promise((function(e){p._syncMessageIds[i]=e;}))]):[3,2];case 1:h=g.sent(),delete this._syncMessageIds[i],this._watcher.signal(n,h),g.label=2;case 2:return [2]}}))}))})),!0):(kt$1.error("received data is not a validJson",n),!1)},t.prototype._startPullSignal=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return t=(new Date).getTime(),n="".concat(e,"://").concat(this._domain,"/pullmsg.js?sessionid=").concat(this._sessionid,"&timestrap=").concat(t,"&pid=").concat(this._pid),i=_t$1(),Tt$1(pe$1.L_CHECK_ALIVE_IM_T,{},{traceId:i}),[4,this._runtime.httpReq({url:n,body:{pid:this._pid},timeout:45e3})];case 1:return r=s.sent(),o=this.handleCometRes(r),(o?Tt$1:It$1)(pe$1.L_CHECK_ALIVE_IM_R,{isSuccess:o},{traceId:i}),this._isDisconnected||(o?this._startPullSignal(e):(this._isDisconnected=!0,this._watcher.status(ee$1.NETWORK_UNAVAILABLE))),[2]}}))}))},t.prototype.connect=function(e,t,n,i,r,o){return D$1(this,void 0,void 0,(function(){var o,s,a=this;return V$1(this,(function(c){return r=q$1(r),this._protocol=i,this._isDisconnected=!1,this._watcher.status(ee$1.CONNECTING),o=n.slice(),s=!1,[2,new Promise((function(n){var c=function(){return D$1(a,void 0,void 0,(function(){var a,u,l;return V$1(this,(function(h){switch(h.label){case 0:return 0===o.length||s?[2]:(s=!0,a=o.shift(),Jr(mo$1.IM_COMET,{startTime:(new Date).getTime(),host:a,protocol:lr.NAVI}),[4,this._connect(e,t,a,i,r)]);case 1:if(u=h.sent(),l=u===z$1.SUCCESS||u===te$1.REDIRECT?u:gn$1(u),Jr(mo$1.IM_COMET,{endTime:(new Date).getTime(),code:l}),function(e){D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h,d,f,p;return V$1(this,(function(g){switch(g.label){case 0:t=mo$1.IM_COMET,n=Wr(),i=n.sdkPrivate,r=n.serverPrivate,o=n.bundleId,s=zr(t),a=s.protocol,c=s.startTime,u=s.endTime,l=s.code,h=s.host,d=qr.UNKONWN,g.label=1;case 1:return g.trys.push([1,3,,4]),[4,e.getNetworkType()];case 2:return d=g.sent(),[3,4];case 3:return f=g.sent(),kt$1.info(f.message),[3,4];case 4:return p=0,Ve$1(c)&&Ve$1(u)&&u>c&&c&&(p=u-c),Kr(t,{spr:i,pr:r,bid:o,ptc:a,dur:p,cod:l,hos:h,net:d}),[2]}}))}));}(this._runtime),u===z$1.SUCCESS)this._startPullSignal(i),n(u);else if(u===te$1.REDIRECT)n(u);else {if(0===o.length)return n(gn$1(u)),[2];s=!1,c();}return [2]}}))}))};a._watcher.status(ee$1.CONNECTING),c();}))]}))}))},t.prototype._connect=function(e,t,n,i,r){return D$1(this,void 0,void 0,(function(){var o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return o=function(e){return 200!==e.status&&202!==e.status?(kt$1.error("handle comet res -> res: ".concat(JSON.stringify(e||{}))),!1):!!e.data&&(function(e){if(Fe$1(e))return !0;var t=!1;try{var n=JSON.parse(e);t=JSON.stringify(n)===e;}catch(e){t=!1;}return t}(e.data)?Fe$1(e.data)?e.data:JSON.parse(e.data):(kt$1.error("received data is not a validJson",e.data),!1))},s=Eo$1(i,n,e,t,this._runtime,r,this._pid),this.sendConnectTime=Date.now(),kt$1.info("conenct start -> ".concat(s)),[4,this._runtime.httpReq({url:s,body:{pid:this._pid},timeout:5e3})];case 1:return a=u.sent(),c=o(a),this._domain=n,c&&0===c.status?(this._sessionid=c.sessionid,this.userId=c.userId,this.connectedTime=c.timestamp,Tt$1("connect success -> userId: ".concat(c.userId,", url: ").concat(s))):kt$1.warn("connect result -> code: ".concat(null==c?void 0:c.status,", url: ").concat(s)),[2,null==c?void 0:c.status]}}))}))},t.prototype.sendCometData=function(e,t){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l;return V$1(this,(function(h){switch(h.label){case 0:return n=(t=this)._domain,i=t._sessionid,r=t._pid,o=e.messageId,s=e.topic,a=e.targetId,e.identifier,c=e.getHeaderFlag(),u=s?"".concat(this._protocol,"://").concat(n,"/websocket?messageid=").concat(o,"&header=").concat(c,"&sessionid=").concat(i,"&topic=").concat(s,"&targetid=").concat(a,"&pid=").concat(r):"".concat(this._protocol,"://").concat(n,"/websocket?messageid=").concat(o,"&header=").concat(c,"&sessionid=").concat(i,"&pid=").concat(r),[4,this._runtime.httpReq({url:u,method:Hr.POST,body:e.getCometData()})];case 1:return l=h.sent(),this.handleCometRes(l),[2]}}))}))},t.prototype.sendOnly=function(e){this.sendCometData(e);},t.prototype.send=function(e,t,n,i){return void 0===i&&(i=3e4),D$1(this,void 0,void 0,(function(){var r,o,s,a,c=this;return V$1(this,(function(u){switch(u.label){case 0:return r=this._generateMessageId(),e.messageId=r,this.sendCometData(e),[4,new Promise((function(e){c._messageIds[r]=e,setTimeout((function(){delete c._messageIds[r],e();}),i);}))];case 1:return (o=u.sent())?(s=t&&o.data&&[z$1.SUCCESS,z$1.CHATROOM_KV_STORE_NOT_ALL_SUCCESS].indexOf(o.status)>=0,a=s?this.codec.decodeByPBName(o.data,t,n):o,0!==o.status?[2,{code:o.status,data:t&&o.data?a:null}]:[2,{code:z$1.SUCCESS,data:a}]):[2,{code:z$1.TIMEOUT}]}}))}))},t.prototype.close=function(){this._isDisconnected=!0,this._watcher.status(ee$1.DISCONNECTED);},t}(Fr),zo=function(e){return ["navi",e].join("_")},Zo=function(e,t,n,i){var r,o=zo(e);try{var s=i.getItem(o);r=s?JSON.parse(s):[];}catch(e){r=[];}var a=Date.now();r.length>0&&(r=r.filter((function(e){return a-e.timestamp<72e5&&t!==e.token}))),r.push({timestamp:a,naviInfo:n,token:t}),i.setItem(o,JSON.stringify(r));};function Xo(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h,d,f,p;return V$1(this,(function(g){switch(g.label){case 0:t=mo$1.IM_NAVI,n=Wr(),i=n.sdkPrivate,r=n.serverPrivate,o=n.bundleId,s=zr(t),a=s.protocol,c=s.startTime,u=s.endTime,l=s.code,h=s.host,d=qr.UNKONWN,g.label=1;case 1:return g.trys.push([1,3,,4]),[4,e.getNetworkType()];case 2:return d=g.sent(),[3,4];case 3:return f=g.sent(),kt$1.debug(f.message),[3,4];case 4:return p=0,Ve$1(c)&&Ve$1(u)&&u>c&&c&&(p=u-c),Kr(t,{spr:i,pr:r,bid:o,ptc:a,dur:p,cod:l,hos:h,net:d}),[2]}}))}))}var $o=function(){function e(e){this._pullQueue=[],this._isPulling=!1,this._pullTime=0,this._engine=e;}return e.prototype._startPull=function(){return D$1(this,void 0,void 0,(function(){var e,t,n,i,r,o,s;return V$1(this,(function(a){switch(a.label){case 0:return this._isPulling||0===this._pullQueue.length?[2]:(this._isPulling=!0,e=this._pullQueue.splice(0,1)[0],t=e.roomId,n=e.timestamp,(i=this._pullTime)>n?(this._isPulling=!1,this._startPull(),[2]):[4,this._engine.pullRTCRoomEntry(t,i)]);case 1:return r=a.sent(),o=r.code,s=r.data,o===z$1.SUCCESS?(this._isPulling=!1,this._pullTime=s.syncTime||0,this._startPull()):this._startPull(),[2]}}))}))},e.prototype.pullEntry=function(e,t){this._pullQueue.push({roomId:e,timestamp:t}),this._startPull();},e.prototype.reset=function(){this._pullTime=0,this._isPulling=!1;},e}(),es=function(e,t,n,i,r,o){var s=r?Object.keys(r).map((function(t){return e.encode(Io$1.RtcValueInfo,{key:t,value:r[t]},!0)})):void 0,a=o?Object.keys(o).map((function(t){return e.encode(Io$1.RtcValueInfo,{key:t,value:o[t]},!0)})):void 0;return e.encode(Io$1.RtcInput,{roomType:t,broadcastType:n,joinType:i,innerDatas:s,outerDatas:a})},ts=function(e,t){var n=e.decode(Io$1.RtcUserListOutput,t),i=n.users,r=n.token,o=n.sessionId,s=n.roomInfo,a=n.entries,c=n.offlineKickTime,u={};return an$1(i,(function(e){var t=e.userId,n=e.userData,i={};an$1(n,(function(e){var t=e.key,n=e.value;i[t]=n;})),u[t]=i;})),{users:u,token:r,sessionId:o,roomInfo:s,kvEntries:a,offlineKickTime:c}},ns=function(){function e(e,t,n,i){this.runtime=e,this.rtcCodec=t,this._watcher=n,this._options=i,this._appkey=this._options.appkey,this._apiVer=this._options.apiVersion,this._apiVersion=q$1(this._options.apiVersion),this._rtcKVManager=new $o(this);}return e.prototype.registerRTCSignalingListener=function(e){this._rtcSignalingListener=e;},e.prototype.getNaviInfo=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o;return V$1(this,(function(s){switch(s.label){case 0:return n&&this._clear(e),r=function(e,t,n){var i,r,o=zo(e);try{var s=n.getItem(o);r=s?JSON.parse(s):[];}catch(e){r=[];}var a=Date.now();return r.length>0&&(r=r.filter((function(e){return a-e.timestamp<72e5}))),0===r.length?n.removeItem(o):n.setItem(o,JSON.stringify(r)),(null===(i=r.find((function(e){return e.token===t})))||void 0===i?void 0:i.naviInfo)||null}(this._appkey,e,this.runtime.localStorage),r?[2,r]:(o=this._options.navigators.slice(),t.length&&t.forEach((function(e){o.indexOf(e)<0&&o.unshift(e);})),[4,this.requestNaviInfo(o,this._appkey,e,i)]);case 1:return (r=s.sent())?(this.setNaviInfo2Cache(e,r),[2,r]):[2,r]}}))}))},e.prototype.setNaviInfo2Cache=function(e,t){Zo(this._appkey,e,t,this.runtime.localStorage);},e.prototype._clear=function(e){!function(e,t,n){var i,r=zo(e);try{var o=n.getItem(r);i=o?JSON.parse(o):[];}catch(e){i=[];}var s=Date.now();i.length>0&&(i=i.filter((function(e){return s-e.timestamp<72e5&&t!==e.token}))),0===i.length?n.removeItem(r):n.setItem(r,JSON.stringify(i));}(this._appkey,e,this.runtime.localStorage);},e.prototype.joinRTCRoom=function(e,t,n,i,r,o){return D$1(this,void 0,void 0,(function(){var s,a,c,u,l;return V$1(this,(function(h){switch(h.label){case 0:return s=es(this.rtcCodec,t,n,i,r,o),[4,this.rtcSignaling(e,Co$1,!0,s)];case 1:return a=h.sent(),c=a.code,u=a.buffer,c===z$1.SUCCESS&&u&&(l=ts(this.rtcCodec,u)),[2,{code:c,data:l}]}}))}))},e.prototype.quitRTCRoom=function(e){return D$1(this,void 0,void 0,(function(){var t;return V$1(this,(function(n){switch(n.label){case 0:return t=this.rtcCodec.encode(Io$1.SetUserStatusInput,{status:0}),[4,this.rtcSignaling(e,Ro$1,!0,t)];case 1:return [2,n.sent().code]}}))}))},e.prototype.getRTCRoomInfo=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return t=this.rtcCodec.encode(Io$1.RtcQueryListInput,{order:2}),[4,this.rtcSignaling(e,So$1,!0,t)];case 1:return n=s.sent(),i=n.code,r=n.buffer,i===z$1.SUCCESS&&r&&(o=this.rtcCodec.decode(Io$1.RtcRoomInfoOutput,r)),[2,{code:i,data:o}]}}))}))},e.prototype.getRTCUserInfoList=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s;return V$1(this,(function(a){switch(a.label){case 0:return t=this.rtcCodec.encode(Io$1.RtcQueryListInput,{order:2}),[4,this.rtcSignaling(e,Oo,!0,t)];case 1:return n=a.sent(),i=n.code,r=n.buffer,i===z$1.SUCCESS&&r&&(s=ts(this.rtcCodec,r),o={users:s.users}),[2,{code:i,data:o}]}}))}))},e.prototype.getRTCUserInfo=function(e){throw new Error("Method not implemented.")},e.prototype.setRTCUserInfo=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i;return V$1(this,(function(r){switch(r.label){case 0:return i=this.rtcCodec.encode(Io$1.RtcValueInfo,{key:t,value:n}),[4,this.rtcSignaling(e,No$1,!0,i)];case 1:return [2,r.sent().code]}}))}))},e.prototype.removeRTCUserInfo=function(e,t){return D$1(this,void 0,void 0,(function(){var n;return V$1(this,(function(i){switch(i.label){case 0:return n=this.rtcCodec.encode(Io$1.RtcKeyDeleteInput,{key:t}),[4,this.rtcSignaling(e,Mo,!1,n)];case 1:return [2,i.sent().code]}}))}))},e.prototype.setRTCData=function(e,t,n,i,r,o){return D$1(this,void 0,void 0,(function(){var s;return V$1(this,(function(a){switch(a.label){case 0:return s=this.rtcCodec.encode(Io$1.RtcSetDataInput,{interior:i,target:r,key:t,value:n,objectName:null==o?void 0:o.name,content:null==o?void 0:o.content}),[4,this.rtcSignaling(e,Uo$1,!1,s)];case 1:return [2,a.sent().code]}}))}))},e.prototype.setRTCTotalRes=function(e,t,n,i,r){return D$1(this,void 0,void 0,(function(){var o,s;return V$1(this,(function(a){switch(a.label){case 0:return o={objectName:i,content:this.rtcCodec.encode(Io$1.RtcValueInfo,{key:t.name,value:t.content},!0),valueInfo:[this.rtcCodec.encode(Io$1.RtcValueInfo,{key:"uris",value:n},!0),this.rtcCodec.encode(Io$1.RtcValueInfo,{key:"mcu_uris",value:r},!0)]},s=this.rtcCodec.encode(Io$1.RtcUserSetDataInput,o),[4,this.rtcSignaling(e,Ao,!0,s)];case 1:return [2,a.sent().code]}}))}))},e.prototype.getRTCData=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u;return V$1(this,(function(l){switch(l.label){case 0:return r=this.rtcCodec.encode(Io$1.RtcDataInput,{interior:n,target:i,key:t}),[4,this.rtcSignaling(e,Lo,!0,r)];case 1:return o=l.sent(),s=o.code,a=o.buffer,s===z$1.SUCCESS&&a?(c=this.rtcCodec.decode(Io$1.RtcQryOutput,a).outInfo,u={},c.forEach((function(e){u[e.key]=e.value;})),[2,{code:s,data:u}]):[2,{code:s}]}}))}))},e.prototype.removeRTCData=function(e,t,n,i,r){return D$1(this,void 0,void 0,(function(){var o;return V$1(this,(function(s){switch(s.label){case 0:return o=this.rtcCodec.encode(Io$1.RtcDataInput,{interior:n,target:i,key:t,objectName:null==r?void 0:r.name,content:null==r?void 0:r.content}),[4,this.rtcSignaling(e,wo,!1,o)];case 1:return [2,s.sent().code]}}))}))},e.prototype.setRTCOutData=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){throw new Error("JSEngine's method not implemented.")}))}))},e.prototype.getRTCOutData=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){throw new Error("JSEngine's method not implemented.")}))}))},e.prototype.getRTCToken=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return i=es(this.rtcCodec,t,n),[4,this.rtcSignaling(e,bo,!0,i)];case 1:return r=c.sent(),o=r.code,s=r.buffer,o===z$1.SUCCESS&&s?(a=this.rtcCodec.decode(Io$1.RtcTokenOutput,s).rtcToken,[2,{code:o,data:{rtcToken:a}}]):[2,{code:o}]}}))}))},e.prototype.setRTCState=function(e,t){return D$1(this,void 0,void 0,(function(){var n;return V$1(this,(function(i){switch(i.label){case 0:return n=this.rtcCodec.encode(Io$1.MCFollowInput,{state:t}),[4,this.rtcSignaling(e,Po,!0,n)];case 1:return [2,i.sent().code]}}))}))},e.prototype.getRTCUserList=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return t=this.rtcCodec.encode(Io$1.RtcQueryListInput,{order:2}),[4,this.rtcSignaling(e,Do,!0,t)];case 1:return n=s.sent(),i=n.code,r=n.buffer,i===z$1.SUCCESS&&r?(o=ts(this.rtcCodec,r),[2,{code:i,data:o}]):[2,{code:i}]}}))}))},e.prototype.joinLivingRoomAsAudience=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a,c,u;return V$1(this,(function(l){switch(l.label){case 0:return i=es(this.rtcCodec,t,n),[4,this.rtcSignaling(e,Vo,!0,i)];case 1:return r=l.sent(),o=r.code,s=r.buffer,o===z$1.SUCCESS&&s?(a=this.rtcCodec.decode(Io$1.RtcViewerJoinedOutput,s),c=a.rtcToken,u=a.entries,[2,{code:o,data:{token:c,kvEntries:u}}]):[2,{code:o}]}}))}))},e.prototype.pullRTCRoomEntry=function(e,t){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return t=this.rtcCodec.encode(Io$1.RtcPullKV,{timestamp:0,roomId:e}),[4,this.rtcSignaling(e,Go,!0,t)];case 1:return n=c.sent(),i=n.code,r=n.buffer,i!==z$1.SUCCESS?[2,{code:i}]:(o=this.rtcCodec.decode(Io$1.RtcKVOutput,r),s=o.entries,o.bFullUpdate,a=o.syncTime,s=(s||[]).map((function(e){return P$1(P$1({},e),{timestamp:Xt$1(e.timestamp)})})),this._watcher.onRTCDataChange(s,e),[2,{code:i,data:{kvEntries:s,syncTime:Xt$1(a)}}])}}))}))},e.prototype.quitLivingRoomAsAudience=function(e){return D$1(this,void 0,void 0,(function(){var t,n;return V$1(this,(function(i){switch(i.label){case 0:return t=this.rtcCodec.encode(Io$1.SetUserStatusInput,{status:0}),[4,this.rtcSignaling(e,ko,!0,t)];case 1:return n=i.sent().code,this._rtcKVManager.reset(),[2,n]}}))}))},e.prototype.rtcIdentityChange=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return i=this.rtcCodec.encode(Io$1.RtcInput,{roomType:Oe$1.LIVE,broadcastType:n,identityChangeType:t,needSysChatroom:!1}),[4,this.rtcSignaling(e,Bo,!0,i)];case 1:return r=c.sent(),o=r.code,s=r.buffer,o===z$1.SUCCESS&&s?(a=ts(this.rtcCodec,s),[2,{code:o,data:a}]):[2,{code:o}]}}))}))},e.prototype.getRTCJoinedUserInfo=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return t=this.rtcCodec.encode(Io$1.RtcQueryUserJoinedInput,{userId:e}),[4,this.rtcSignaling("",qo,!0,t)];case 1:return n=s.sent(),i=n.code,r=n.buffer,i===z$1.SUCCESS&&r?(o=this.rtcCodec.decode(Io$1.RtcQueryUserJoinedOutput,r).info||[],[2,{code:i,data:o.map((function(e){return {deviceId:e.deviceId,roomId:e.roomId,joinTime:Xt$1(e.joinTime)}}))}]):[2,{code:i}]}}))}))},e.prototype.setRTCCDNUris=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i;return V$1(this,(function(r){switch(r.label){case 0:return i=this.rtcCodec.encode(Io$1.RtcUserSetDataInput,{objectName:t,valueInfo:this.rtcCodec.encode(Io$1.RtcValueInfo,{key:"cdn_uris",value:n},!0)}),[4,this.rtcSignaling(e,Ao,!0,i)];case 1:return [2,r.sent().code]}}))}))},e.prototype.requestRoomPK=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return t=e.invitedRoomId,n=e.invitedUserId,i=e.inviteSessionId,r=e.inviteTimeout,o=e.inviteInfo,s=e.roomId,a=this.rtcCodec.encode(Io$1.RtcInviteInput,{invitedRoomId:t,invitedUserId:n,inviteSessionId:i,timeoutTime:r,inviteInfo:o}),[4,this.rtcSignaling(s,xo,!0,a)];case 1:return c=u.sent().code,this._rtcKVManager.reset(),[2,c]}}))}))},e.prototype.cancelRoomPK=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return t=e.invitedRoomId,n=e.invitedUserId,i=e.inviteSessionId,r=e.inviteInfo,o=e.roomId,s=this.rtcCodec.encode(Io$1.RtcCancelInviteInput,{invitedRoomId:t,invitedUserId:n,inviteSessionId:i,inviteInfo:r}),[4,this.rtcSignaling(o,Fo,!0,s)];case 1:return a=c.sent().code,this._rtcKVManager.reset(),[2,a]}}))}))},e.prototype.responseRoomPK=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l;return V$1(this,(function(h){switch(h.label){case 0:return t=e.inviteUserId,n=e.inviteRoomId,i=e.inviteSessionId,r=e.content,o=e.key,s=e.value,a=e.agree,c=e.roomId,u=this.rtcCodec.encode(Io$1.RtcInviteAnswerInput,{inviteUserId:t,inviteRoomId:n,inviteSessionId:i,content:r,key:o,value:s,answerCode:a?1:0}),[4,this.rtcSignaling(c,Ko,!0,u)];case 1:return l=h.sent().code,this._rtcKVManager.reset(),[2,l]}}))}))},e.prototype.endRoomPK=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return t=e.endRoomId,n=e.sessionId,i=e.content,r=e.keys,o=e.roomId,s=this.rtcCodec.encode(Io$1.RtcEndInviteInput,{inviteRoomId:t,inviteSessionId:n,inviteContent:i,inviteRoomKeys:r}),[4,this.rtcSignaling(o,Ho,!0,s)];case 1:return a=c.sent().code,this._rtcKVManager.reset(),[2,a]}}))}))},e.prototype._receiveRtcKv=function(e){if(this._rtcSignalingListener)this._rtcSignalingListener(e);else {var t=this.rtcCodec.decode(Io$1.RtcNotifyMsg,e),n=t.time,i=t.type,r=t.roomId;if(1===i)this._rtcKVManager.pullEntry(r,Xt$1(n));}},e}(),is=function(e){this.pbmaps=e;},rs=function(e){function t(t,n){var i=e.call(this,t)||this;return i.codec=rr(n),i}return b$1(t,e),t.prototype.getModule=function(e){return new this.codec[e]},t.prototype.encode=function(e,t,n){var i=new this.codec[e];if(t)try{this.pbmaps[e].forEach((function(e){var n=t[e];void 0!==n&&i["set".concat(F$1(e,0,1))](n);}));}catch(t){Ct$1(pe$1.L_PB_ENCODE_E,{pbname:e});}return n?i:i.toArrayBuffer()},t.prototype.decode=function(e,t){return this.codec[e].decode(t)},t}(is),os=function(e){function t(){return null!==e&&e.apply(this,arguments)||this}return b$1(t,e),t.prototype.encode=function(e,t){var n=this.pbmaps[e],i={};return t&&n.forEach((function(e){void 0!==t[e]&&(i[e]=t[e]);})),i},t.prototype.decode=function(e,t){try{return JSON.parse(t)}catch(n){Ct$1(pe$1.L_PB_DECODE_E,{pbname:e,data:t});}},t}(is),ss=!1,as=[],cs=function(){function e(e){this._context=e;}return e.prototype.refetchNaviInfo=function(){return D$1(this,void 0,void 0,(function(){var e;return V$1(this,(function(t){switch(t.label){case 0:return ss?[2,new Promise((function(e){as.push(e);}))]:(ss=!0,[4,this._context.reqNaviInfo(!0)]);case 1:return e=t.sent(),as.forEach((function(t){return t(e)})),as.length=0,ss=!1,[2,e]}}))}))},e.prototype.__getContext=function(){return this._context},e.prototype.createCodec=function(e,t){return this._context.createCodec(e,t)},e.prototype.getNaviInfo=function(){return this._context.getInfoFromCache()},e.prototype.getCoreVersion=function(){return this._context.coreVersion},e.prototype.getAPIVersion=function(){return this._context.apiVersion},e.prototype.getAppkey=function(){return this._context.appkey},e.prototype.getCurrentId=function(){return this._context.getCurrentUserId()},e.prototype.getConnectionStatus=function(){return this._context.getConnectionStatus()},e.prototype.getDeviceId=function(){return this._context.getDeviceId()},e.prototype.sendMessage=function(e,t,n){return this._context.sendMessage(e,t,n)},e.prototype.registerMessageType=function(e,t,n,i){void 0===i&&(i=[]),this._context.registerMessageType(e,t,n,i);},e.prototype.getServerTime=function(){return this._context.getServerTime()},e.prototype.getOSInfo=function(){return this._context.getOSInfo()},e.prototype.getProcessInfo=function(){return this._context.getProcessInfo()},e.prototype.getMainProcessInfo=function(){return this._context.getMainProcessInfo()},e}(),us=function(e,t,n){return [e,t,n].join("_")},ls=function(){function e(e,t){this._runtime=e,this._appkey=t,this._users={};}return e.prototype._getMemData=function(e){return this._users[e]=this._users[e]||{inboxTime:0,outboxTime:0,broadcastSyncTime:0},this._users[e]},e.prototype.setInboxTime=function(e,t){var n=this._getMemData(t);if(!(n.inboxTime>e)){n.inboxTime=e;var i=us("inbox",this._appkey,t);this._runtime.localStorage.setItem(i,e.toString());}},e.prototype.getInboxTime=function(e){var t=this._getMemData(e);if(0===t.inboxTime){var n=us("inbox",this._appkey,e);t.inboxTime=parseInt(this._runtime.localStorage.getItem(n),10)||0;}return t.inboxTime},e.prototype.setBroadcastSyncTime=function(e,t){var n=this._getMemData(t);if(!(n.broadcastSyncTime>=e||He$1(e))){n.broadcastSyncTime=e;var i=us("broadcastbox",this._appkey,t);this._runtime.localStorage.setItem(i,e.toString());}},e.prototype.getBroadcastSyncTime=function(e){var t=this._getMemData(e);if(!t||0===t.broadcastSyncTime){var n=us("broadcastbox",this._appkey,e);t.broadcastSyncTime=parseInt(this._runtime.localStorage.getItem(n),10)||1;}return t.broadcastSyncTime},e.prototype.setOutboxTime=function(e,t){var n=this._getMemData(t);if(!(n.outboxTime>=e)){n.outboxTime=e;var i=us("outbox",this._appkey,t);this._runtime.localStorage.setItem(i,e.toString());}},e.prototype.getOutboxTime=function(e){var t=this._getMemData(e);if(0===t.outboxTime){var n=us("outbox",this._appkey,e);t.outboxTime=parseInt(this._runtime.localStorage.getItem(n),10)||0;}return t.outboxTime},e}(),hs={_caches:{},set:function(e,t){this._caches[e]=t;},get:function(e){return this._caches[e]||0},clear:function(e){this._caches[e]=0;}},ds=function(){function e(e,t){this._kvCaches={},this._chatroomId=e,this._currentUserId=t;}return e.prototype._add=function(e){var t=e.key;e.isDeleted=!1,this._kvCaches[t]=e;},e.prototype._remove=function(e){var t=e.key,n=this._kvCaches[t];n&&(n.isDeleted=!0,this._kvCaches[t]=n);},e.prototype._setEntry=function(e,t){var n=e.key,i=e.type,r=e.isOverwrite,o=e.userId,s=this._getSetUserId(n),a=i===_e$1.DELETE,c=s===o,u=!this._isExisted(n),l=a?this._remove:this._add;(t||r||c||u)&&l.call(this,e);},e.prototype.getValue=function(e){var t=this._kvCaches[e]||{};return t.isDeleted?null:t.value},e.prototype.getVersion=function(e){var t=this._kvCaches[e]||{};return t.isDeleted?null:t.version},e.prototype.getAllValue=function(){var e={};for(var t in this._kvCaches)this._kvCaches[t].isDeleted||(e[t]=this._kvCaches[t].value);return e},e.prototype._getSetUserId=function(e){return (this._kvCaches[e]||{}).userId},e.prototype._isExisted=function(e){var t=this._kvCaches[e]||{},n=t.value,i=t.isDeleted;return n&&!i},e.prototype.setEntries=function(e){var t=this,n=e.kvEntries,i=e.isFullUpdate;n=n||[],(i=i||!1)&&this.clear(),n.forEach((function(e){t._setEntry(e,i);})),kt$1.debug("end setEntries");},e.prototype.clear=function(){this._kvCaches={};},e}(),fs=function(){function e(e){this._pullQueue=[],this._isPulling=!1,this._storeCaches={},this._engine=e;}return e.prototype._startPull=function(){return D$1(this,void 0,void 0,(function(){var e,t,n,i,r,o,s;return V$1(this,(function(a){switch(a.label){case 0:return this._isPulling||0===this._pullQueue.length?[2]:(this._isPulling=!0,e=this._pullQueue.splice(0,1)[0],t=e.chrmId,n=e.timestamp,(i=hs.get(t))>n?(this._isPulling=!1,this._startPull(),[2]):[4,this._engine.pullChatroomEntry(t,i)]);case 1:return r=a.sent(),o=r.code,s=r.data,this._isPulling=!1,o===z$1.SUCCESS?(hs.set(t,s.syncTime||0),this._startPull()):this._startPull(),[2]}}))}))},e.prototype.reset=function(e){hs.clear(e);var t=this._storeCaches[e];null==t||t.clear();},e.prototype.pullEntry=function(e,t){this._pullQueue.push({chrmId:e,timestamp:t}),this._startPull();},e.prototype.setLocal=function(e,t,n){var i=this._storeCaches[e];je$1(i)||(i=new ds(e,n)),i.setEntries(t),this._storeCaches[e]=i;},e.prototype.getValue=function(e,t){var n=this._storeCaches[e];return n?n.getValue(t):null},e.prototype.getVersion=function(e,t){var n=this._storeCaches[e];return n?n.getVersion(t):null},e.prototype.getAll=function(e){var t=this._storeCaches[e],n={};return t&&(n=t.getAllValue()),n},e}(),ps=function(){function e(e,t,n,i){this._runtime=e,this._appkey=t,this._userId=n,this._canJoinMulipleChrm=i,this._sessionKey="",this._joinedChrmsInfo={},this._sessionKey="sync-chrm-".concat(this._appkey,"-").concat(this._userId);}return e.prototype.set=function(e,t){void 0===t&&(t=10),this._canJoinMulipleChrm||(this._joinedChrmsInfo={}),this._joinedChrmsInfo[e]=t,this._runtime.sessionStorage.setItem(this._sessionKey,JSON.stringify(this._joinedChrmsInfo));},e.prototype.get=function(){var e,t;try{t=this._runtime.sessionStorage.getItem(this._sessionKey),e=JSON.parse(t||"{}");}catch(n){kt$1.error("parse rejoined chrm infos error -> ".concat(t)),e={};}return e},e.prototype.remove=function(e){delete this._joinedChrmsInfo[e],je$1(this._joinedChrmsInfo)?this._runtime.sessionStorage.setItem(this._sessionKey,JSON.stringify(this._joinedChrmsInfo)):this.clear();},e.prototype.clear=function(){this._joinedChrmsInfo={},this._runtime.sessionStorage.removeItem(this._sessionKey);},e}(),gs="converStatusChanged",_s=function(){function e(e,t,n){this._eventEmitter=new Gt$1,this._pullQueue=[],this._isPulling=!1,this._storagePullTimeKey="con-s-".concat(t,"-").concat(n),this._oldStorage=U(e.runtime),this._storage=new L$1(e.runtime,this._storagePullTimeKey),this._appkey=t,this._currentUserId=n,this._engine=e,this.adaptOldStatus();}return e.prototype.adaptOldStatus=function(){try{if(this._storage.get(this._storagePullTimeKey)||0)return;var e=this._oldStorage.get(this._storagePullTimeKey)||0;if(!e)return;this._storage.set(this._storagePullTimeKey,e),this._oldStorage.remove(this._storagePullTimeKey);}catch(e){Ct$1(pe$1.A_CALLBACK_E,"adaptOldStatus error: ".concat(e.message));}},e.prototype._set=function(e){var t=this;if(!He$1(e)&&Array.isArray(e)){var n=this._storage.get(this._storagePullTimeKey)||0,i=e.length;e.forEach((function(e,r){var o=e.updatedTime||0;n=o>n?o:n,e.conversationType=e.type,t._eventEmitter.emit(gs,{statusItem:e,isLastPull:r===i-1});})),this._storage.set(this._storagePullTimeKey,n);}},e.prototype._startPull=function(){return D$1(this,void 0,void 0,(function(){var e,t,n,i;return V$1(this,(function(r){switch(r.label){case 0:return this._isPulling||0===this._pullQueue.length?[2]:(this._isPulling=!0,e=this._pullQueue.splice(0,1)[0],[4,this._engine.pullConversationStatus(e)]);case 1:return t=r.sent(),n=t.code,i=t.data,n===z$1.SUCCESS?(this._isPulling=!1,this._set(i),this._startPull()):this._startPull(),[2]}}))}))},e.prototype.pull=function(e){var t=this._storage.get(this._storagePullTimeKey)||0;(e>t||0===e)&&(this._pullQueue.push(t),this._startPull());},e.prototype.watch=function(e){this._eventEmitter.on(gs,(function(t){e(t);}));},e.prototype.setConversationUpdatedTime=function(e){var t=this._storage.get(this._storagePullTimeKey)||0;return e&&e>t?(this._storage.set(this._storagePullTimeKey,e),e):t},e.prototype.getConversationUpdatedTime=function(){return this._storage.get(this._storagePullTimeKey)||0},e}(),ms={c:{keyName:"unreadMessageCount",defaultVal:0},hm:{keyName:"hasMentioned",defaultVal:!1},m:{keyName:"mentionedInfo",defaultVal:null},t:{keyName:"lastUnreadTime",defaultVal:0},lt:{keyName:"lastReadTime",defaultVal:0},nc:{keyName:"notificationStatus",defaultVal:2},nl:{keyName:"notificationLevel",defaultVal:0},to:{keyName:"isTop",defaultVal:!1},tg:{keyName:"tags",defaultVal:{}},mc:{keyName:"unreadMentionedCount",defaultVal:0}},vs={};for(var ys in ms){var Es=ms[ys].keyName;vs[Es]=ys;}var Ts,Is=function(){function e(e,t,n){this._appkey=t,this._currentUserId=n;var i="con-".concat(t,"-").concat(n);this.storage=new L$1(e,i),this._localStore=new L$1(e,"CONVER-".concat(t,"-").concat(n));}return e.prototype._getStoreKey=function(e,t,n){return "".concat(n,"_").concat(e,"_").concat(t)},e.prototype._getConOptionByKey=function(e){var t=(e=e||"").split("_");if(t.length>=2){var n=t.shift(),i=t.shift(),r=t.join("_");return {conversationType:Number(i),targetId:r,channelId:n}}return {conversationType:X$1.PRIVATE,targetId:"",channelId:""}},e.prototype.updateMentionedData=function(e){var t=this,n=e.conversationType,i=e.targetId,r=e.messageType,o=e.isMentioned,s=e.content,a=e.senderUserId,c=e.channelId,u=this._getStoreKey(n,i,c),l=this._localStore.get(u)||{},h=vs.mentionedInfo,d=vs.hasMentioned,f=l[h]||{},p=f.userIdList||[],g=s.mentionedInfo;if(g){if(o&&n===X$1.GROUP)(g.userIdList||[]).forEach((function(e){e===t._currentUserId&&p.indexOf(a)<0&&p.push(a);})),g.type===ue$1.ALL&&p.indexOf(a)<0&&p.push(a);if(r===ie$1.RECALL&&n===X$1.GROUP){var _=p.indexOf(a);_>=0&&p.splice(_,1);}g={userIdList:p,type:(null==g?void 0:g.type)||f.type},0!==p.length?(l[h]=g,l[d]=!0):(delete l[h],delete l[d]),je$1(l)?this._localStore.set(u,l):this._localStore.remove(u);}},e.prototype.set=function(e,t,n,i){var r=this._getStoreKey(e,t,i),o=this._localStore.get(r)||{};for(var s in n){var a=vs[s],c=n[s];if(!He$1(a)&&!He$1(c)&&"hasMentioned"!==s&&"MentionedInfo"!==s){if(c===ms[a].defaultVal||"tags"===s&&!je$1(c))delete o[a];else if("tags"===s){var u=c;for(var l in u)u[l].isTop||delete u[l].isTop;o[a]=c;}else o[a]=c;o.c||(delete o.t,delete o.hm,delete o.m,delete o.mc);}}je$1(o)?this._localStore.set(r,o):this._localStore.remove(r);},e.prototype.get=function(e,t,n){void 0===n&&(n="");var i=this._getStoreKey(e,t,n),r=this._localStore.get(i)||{},o={};for(var s in ms){var a=ms[s],c=a.keyName,u=a.defaultVal;o[c]=r[s]||dn$1(u);}return o},e.prototype.getValue=function(e){var t=this._localStore.getValues()||{},n=[];for(var i in t){var r=this._getConOptionByKey(i),o={conversationType:r.conversationType,targetId:r.targetId,channelId:r.channelId},s=t[i];for(var a in s)if(ms[a]){var c=ms[a],u=c.keyName,l=c.defaultVal;o[u]=s[a]||dn$1(l);}o=e?e(o):o,n.push(o);}return n},e.prototype.getValueForTag=function(){var e=this._localStore.getValues()||{},t={};for(var n in e){var i=this._getConOptionByKey(n),r=i.conversationType,o=i.targetId,s={},a=e[n];for(var c in a){var u=ms[c],l=u.keyName,h=u.defaultVal;s[l]=a[c]||dn$1(h);}for(var d in s.tags){He$1(t[d])&&(t[d]=[]);var f=P$1(P$1({},s),{conversationType:r,targetId:o});delete f.tags,t[d].push(f);}}return t},e.prototype.adaptOldStore=function(){try{var e=this.storage.getValues();if(0===Object.keys(e).length)return;for(var t in e){var n="_".concat(t);this._localStore.set(n,e[t]);}this.storage.clear();}catch(e){kt$1.error("adaptOldStore error: ".concat(e.message));}},e}(),Cs=[X$1.PRIVATE,X$1.GROUP,X$1.SYSTEM,X$1.PUBLIC_SERVICE,X$1.APP_PUBLIC_SERVICE],Rs="conversationChanged",Ss="conTagStatusChanged",Os=function(){function e(e,t,n,i,r){var o=this;this._updatedConversations={},this._conTagStatusChanged=!1,this._eventEmitter=new Gt$1,this._draftMap={},this._recallMsgTimeMap={},this._appkey=t,this._loginUserId=n,this._store=new Is(e.runtime,t,n),this._statusManager=new _s(e,t,n),this._statusManager.watch((function(e){var t=e.statusItem,n=e.isLastPull;o.addStatus(t,n);})),this._eventEmitter.on(Rs,(function(e){i(e);})),this._eventEmitter.on(Ss,(function(){r();}));}return e.prototype._calcUnreadCount=function(e,t){var n=e.content,i=e.messageType,r=e.sentTime,o=e.isCounted,s=e.messageDirection,a=e.senderUserId,c=s===W$1.SEND&&a===this._loginUserId,u=i===ie$1.RECALL,l=Fe$1(n),h=!1,d={},f=t.lastUnreadTime||0,p=t.lastReadTime||0,g=t.unreadMessageCount||0;if(f>r||c)return {hasChanged:h,localConversation:t,updateItems:d};if(o&&(t.unreadMessageCount=g+1,t.lastUnreadTime=r,h=!0),u&&l){var _="".concat(e.conversationType,"_").concat(e.channelId,"_").concat(e.targetId),m=!this._recallMsgTimeMap[_]||this._recallMsgTimeMap[_]&&!this._recallMsgTimeMap[_].find((function(e){return e===n.sentTime})),v=f>=n.sentTime;p&&(v=p<n.sentTime),v&&g&&m&&(this._recallMsgTimeMap[_]||(this._recallMsgTimeMap[_]=[]),this._recallMsgTimeMap[_].push(n.sentTime),t.unreadMessageCount=g-1,h=!0);}return h&&(d.unreadMessageCount={val:t.unreadMessageCount,time:r}),{hasChanged:h,localConversation:t,updateItems:d}},e.prototype._calcMentionedInfo=function(e,t){var n=e.content,i=(e.messageDirection,e.isMentioned),r=e.sentTime;W$1.SEND;var o=Fe$1(n),s=!1,a={};return i&&o&&n.mentionedInfo&&(t.hasMentioned=!0,s=!0,a.hasMentioned={val:!0,time:r},a.mentionedInfo={val:n.mentionedInfo,time:r}),{hasChanged:s,localConversation:t,updateItems:a}},e.prototype._calcMentionedCount=function(e,t){var n=e.content,i=e.messageDirection,r=!1;if(e.isMentioned&&i===W$1.RECEIVE&&(null==n?void 0:n.mentionedInfo)){var o=n.mentionedInfo,s=o.type,a=o.userIdList;if(s===ue$1.ALL||(a||[]).includes(this._loginUserId)){r=!0;var c=t.unreadMentionedCount||0;t.unreadMentionedCount=c+1;}}return {hasChanged:r,localConversation:t}},e.prototype._setUpdatedConversation=function(e){if(Fe$1(e)){var t=e.conversationType,n=e.targetId,i=e.channelId,r="".concat(t,"_").concat(n),o=this._store.get(t,n,i)||{};this._updatedConversations[r]=Object.assign(o,e);}},e.prototype._setConTagStatusChanged=function(e,t,n,i){var r=(this._store.get(e,t,i)||{}).tags||{};if(Object.keys(r).length===Object.keys(n).length){for(var o in r)if(!n[o]||!!r[o].isTop!=!!n[o].isTop)return void(this._conTagStatusChanged=!0)}else this._conTagStatusChanged=!0;},e.prototype.addStatus=function(e,t){var n=e.conversationType,i=e.targetId,r=e.updatedTime,o=e.notificationStatus,s=e.notificationLevel,a=e.isTop,c=e.tags,u=e.channelId,l={},h={};n!==X$1.ULTRA_GROUP&&(He$1(o)||(h.notificationStatus={time:r,val:o}),He$1(s)||(h.notificationLevel={time:r,val:s}),He$1(a)||(h.isTop={time:r,val:a}),He$1(c)||(h.tags={time:r,val:c},null==c||c.forEach((function(e){l[e.tagId]={isTop:e.isTop};}))),this._setConTagStatusChanged(n,i,l,u),this._store.set(n,i,{notificationStatus:o,notificationLevel:s,isTop:a,tags:l},u),this._setUpdatedConversation({conversationType:n,targetId:i,updatedItems:h,channelId:u}),t&&this._notifyConversationChanged());},e.prototype._notifyConversationChanged=function(){var e=[];for(var t in this._updatedConversations)e.push(this._updatedConversations[t]);0!==e.length&&(this._eventEmitter.emit(Rs,e),this._updatedConversations={},this._conTagStatusChanged&&(this._eventEmitter.emit(Ss),this._conTagStatusChanged=!1));},e.prototype.setConversationCacheByMessage=function(e,t){var n=this,i=e.conversationType,r=e.isPersited,o=e.targetId,s=e.channelId;if(Cs.indexOf(i)>=0){var a=!1,c=this._store.get(i,o,s),u={};if([this._calcUnreadCount,this._calcMentionedInfo,this._calcMentionedCount].forEach((function(t){var i=t.call(n,e,c),r=i.hasChanged,o=i.localConversation,s=i.updateItems;a=a||r,u=P$1(P$1({},u),s),c=dn$1(o);})),a&&this._store.set(i,o,c,s),this._store.updateMentionedData(e),r){var l=this._store.get(i,o,s);l.updatedItems=P$1({latestMessage:{time:e.sentTime,val:e}},u),l.latestMessage=e;var h=Object.assign(l,{conversationType:i,targetId:o,channelId:s});this._setUpdatedConversation(h);}(a||r)&&this._notifyConversationChanged();}},e.prototype.get=function(e,t,n){return void 0===n&&(n=""),this._store.get(e,t,n)},e.prototype.getAllUnreadCount=function(e,t,n){var i=this._store.getValue(),r=0;return i.forEach((function(e){var i=e.unreadMessageCount,o=e.notificationStatus,s=e.notificationLevel,a=e.conversationType;i=i||0,(n||1!==o||s===ae$1.NOT_SET||s===ae$1.ALL_MESSAGE)&&(t.length>0?t.includes(Number(a))&&(r+=Number(i)):r+=Number(i));})),r},e.prototype.getTotalUnreadCountByLevels=function(e,t,n){var i=this._store.getValue(),r=0;return i.forEach((function(i){var o=i.unreadMessageCount,s=i.notificationLevel,a=void 0===s?0:s,c=i.conversationType,u=i.unreadMentionedCount;e.includes(c)&&(0===t.length||t.includes(a))&&(r+=(n?u:o)||0);})),r},e.prototype.getUnreadCountByTag=function(e,t){var n=this._store.getValueForTag()[e]||[],i=0;return n.forEach((function(e){var n=e.unreadMessageCount,r=e.notificationStatus,o=e.notificationLevel;(t||1!==r||-1===o||0===o)&&(n=n||0,i+=Number(n));})),i},e.prototype.getUnreadCount=function(e,t,n){return this._store.get(e,t,n).unreadMessageCount||0},e.prototype.clearUnreadCount=function(e,t,n,i){void 0===i&&(i=!0);var r=this._store.get(e,t,n);r.lastReadTime=r.lastUnreadTime,this._recallMsgTimeMap["".concat(e,"_").concat(n,"_").concat(t)]=[];var o=r.unreadMessageCount,s=r.hasMentioned,a={};if(o&&(r.unreadMessageCount=0,a.unreadMessageCount={val:0,time:Date.now()}),s&&(r.hasMentioned=!1,r.unreadMentionedCount=0,r.mentionedInfo=void 0,a.hasMentioned={val:!1,time:Date.now()},a.mentionedInfo={val:void 0,time:Date.now()}),this._store.set(e,t,r,n),i&&0!==Object.keys(a).length){var c=Object.assign(r,{conversationType:e,targetId:t,channelId:n,updatedItems:a});this._setUpdatedConversation(c),this._notifyConversationChanged();}},e.prototype.clearAllUnreadCount=function(){var e=this;this._store.getValue().forEach((function(t){t.unreadMessageCount&&(t.unreadMessageCount=0,t.lastReadTime=t.lastUnreadTime,e._recallMsgTimeMap={},e._store.set(t.conversationType,t.targetId,t,t.channelId));}));},e.prototype.startPullConversationStatus=function(e){this._statusManager.pull(e);},e.prototype.setDraft=function(e,t,n,i){var r="".concat(e,"_").concat(t,"_").concat(i);this._draftMap[r]=n;},e.prototype.getDraft=function(e,t,n){var i="".concat(e,"_").concat(t,"_").concat(n);return this._draftMap[i]},e.prototype.clearDraft=function(e,t,n){var i="".concat(e,"_").concat(t,"_").concat(n);delete this._draftMap[i];},e.prototype.addTagStatus=function(e,t,n,i){void 0===i&&(i="");var r=this._store.get(e,t,i).tags;r=Object.assign(r,n),this._store.set(e,t,{tags:r},i);},e.prototype.deleteTagStatus=function(e,t,n,i){void 0===i&&(i="");var r=this._store.get(e,t,i).tags;n.forEach((function(e){delete r[e];})),this._store.set(e,t,{tags:r},i);},e.prototype.getConversationListForTag=function(){return this._store.getValueForTag()},e.prototype.getBlockConversationList=function(){return this._store.getValue().filter((function(e){return e.notificationStatus===oe$1.OPEN||-1!==e.notificationLevel&&0!==e.notificationLevel})).map((function(e){return {conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId}}))},e.prototype.getTopConversationList=function(){return (this._store.getValue()||{}).filter((function(e){return e.isTop})).map((function(e){return {conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId}}))},e.prototype.adaptOldStore=function(){this._store.adaptOldStore();},e.prototype.getUnreadMentionedCount=function(e,t,n){return void 0===e&&(e=""),this.get(t,n,e).unreadMentionedCount||0},e.prototype.getAllUnreadMentionedCount=function(){var e=this._store.getValue(),t=0;return e.forEach((function(e){var n=e.unreadMentionedCount;n=n||0,t+=Number(n);})),t},e.prototype.getAllConversationState=function(){return this._store.getValue().filter((function(e){return e.unreadMessageCount||e.unreadMentionedCount})).map((function(e){return {conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId,unreadCount:e.unreadMessageCount||0,unreadMentionedCount:e.unreadMentionedCount||0}}))},e.prototype.setConversationUpdatedTime=function(e){return this._statusManager.setConversationUpdatedTime(e)},e.prototype.getConversationUpdatedTime=function(){return this._statusManager.getConversationUpdatedTime()},e}(),Ns=function(){function e(e,t,n,i){this._pullQueue=[],this._isPulling=!1,this._storageTagKey="tag-".concat(t,"-").concat(n),this._storagePullTimeKey="us-s-".concat(t,"-").concat(n),this._storage=U(e.runtime),this._engine=e,this._tagWatcherFunc=i;}return e.prototype._updateTag=function(e){var t=e.tags,n={};t.forEach((function(e){n[e.tagId]={tagName:e.tagName,createdTime:e.createdTime};})),this._storage.set(this._storageTagKey,n),this._tagWatcherFunc();},e.prototype.addTag=function(e,t){var n=this._storage.get(this._storageTagKey)||{};e.forEach((function(e){var t,i=(null===(t=n[e.tagId])||void 0===t?void 0:t.createdTime)||e.createdTime||0;n[e.tagId]={tagName:e.tagName,createdTime:i};})),this._storage.set(this._storageTagKey,n),this._storage.set(this._storagePullTimeKey,t);},e.prototype.deleteTag=function(e,t){var n=this._storage.get(this._storageTagKey)||{};e.forEach((function(e){delete n[e];})),this._storage.set(this._storageTagKey,n),this._storage.set(this._storagePullTimeKey,t);},e.prototype.getTagsInfo=function(){return this._storage.get(this._storageTagKey)||{}},e.prototype.getTags=function(){var e=this._storage.get(this._storageTagKey)||{},t=[];for(var n in e)t.push({tagId:n,tagName:e[n].tagName,createdTime:e[n].createdTime,conversationCount:0});return t.sort((function(e,t){return (e.createdTime||0)-(t.createdTime||0)}))},e.prototype.getTagById=function(e){var t=this._storage.get(this._storageTagKey)||{};return t[e]?{tagId:e,tagName:t[e].tagName,createdTime:t[e].createdTime,conversationCount:0}:null},e.prototype._startPull=function(){return D$1(this,void 0,void 0,(function(){var e,t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return this._isPulling||0===this._pullQueue.length?[2]:(this._isPulling=!0,e=this._pullQueue.splice(0,1)[0],[4,this._engine.pullUserSettings(e)]);case 1:return t=c.sent(),n=t.code,i=t.data,n!==z$1.SUCCESS||He$1(i)?(this._isPulling=!1,this._startPull()):(o=(r=i).settings,s=r.version,a=o.Tag,He$1(a)||this._updateTag(a),this._storage.set(this._storagePullTimeKey,s),this._isPulling=!1,this._startPull()),[2]}}))}))},e.prototype.pullUserSettings=function(e){var t=this._storage.get(this._storagePullTimeKey)||0;(e>t||0===e)&&(this._pullQueue.push(t),this._startPull());},e.prototype.getVersion=function(){return this._storage.get(this._storagePullTimeKey)||0},e}(),Ms=function(e,t){return ["send_msg",e,t].join("_")},Us=function(){function e(e,t){this._runtime=e,this._appkey=t,this._sendMessageMap={},this._userId="";}return e.prototype.init=function(e){this._userId=e;var t=Ms(this._appkey,e);this._sendMessageMap=this._getLocalInfo(t);},e.prototype._getLocalInfo=function(e){var t=this._runtime.localStorage.getItem(e);try{return t?JSON.parse(t):{}}catch(e){return {}}},e.prototype.setMessage=function(e,t){this._sendMessageMap[e]=t;var n=Ms(this._appkey,this._userId),i=this._getLocalInfo(n);i[e]=t,this._runtime.localStorage.setItem(n,JSON.stringify(i));},e.prototype.getSendMessageMap=function(){return this._sendMessageMap},e.prototype.removeByUID=function(e){delete this._sendMessageMap[e];},e.prototype.removeByTimestamp=function(e){var t=Ms(this._appkey,this._userId),n=this._getLocalInfo(t);Object.keys(n).forEach((function(t){n[t]<e&&delete n[t];})),this._runtime.localStorage.setItem(t,JSON.stringify(n));},e}();(Ts={})[X$1.PRIVATE]=yo$1.qryPMsg,Ts[X$1.GROUP]=yo$1.qryGMsg,Ts[X$1.CHATROOM]=yo$1.qryCHMsg,Ts[X$1.CUSTOMER_SERVICE]=yo$1.qryCMsg,Ts[X$1.SYSTEM]=yo$1.qrySMsg;var As=[yo$1[yo$1.recallMsg],yo$1[yo$1.ppMsgS],yo$1[yo$1.pgMsgS],yo$1[yo$1.ppMsgP],yo$1[yo$1.pgMsgP],yo$1[yo$1.chatMsg],yo$1[yo$1.pcMsgP],yo$1[yo$1.prMsgS],yo$1[yo$1.updUgRTime]],Ls=function(){function e(e,t,n){this.ULTRA_GROUP_CONVERSATION="ultragroupconversation";var i="".concat(this.ULTRA_GROUP_CONVERSATION,"-").concat(t,"-").concat(n);this._localStore=new L$1(e,i);}return e.prototype.set=function(e,t,n,i){var r=this._getStoreKey(e,t,i),o=this._localStore.get(r)||{};for(var s in n){var a=bs[s],c=n[s];if(!He$1(a)&&!He$1(c))c===ws[a].defaultVal?delete o[a]:o[a]=c;}je$1(o)?this._localStore.set(r,o):this._localStore.remove(r);},e.prototype.get=function(e,t,n){void 0===n&&(n="");var i=this._getStoreKey(e,t,n),r=this._localStore.get(i)||{},o={};for(var s in ws){var a=ws[s],c=a.keyName,u=a.defaultVal;o[c]=r[s]||dn$1(u);}return o},e.prototype._getStoreKey=function(e,t,n){return "".concat(n,"_").concat(e,"_").concat(t)},e}(),ws={nc:{keyName:"notificationStatus",defaultVal:2},nl:{keyName:"notificationLevel",defaultVal:0}},bs={};for(var Ps in ws){var Ds=ws[Ps].keyName;bs[Ds]=Ps;}var Vs=function(){function e(e,t,n){this._store=new Ls(e.runtime,t,n);}return e.prototype.addUltraGroupStatus=function(e){var t=e.conversationType,n=e.targetId,i=e.notificationStatus,r=e.notificationLevel,o=e.channelId;t===X$1.ULTRA_GROUP&&this._store.set(t,n,{notificationStatus:i,notificationLevel:r},o);},e.prototype.get=function(e,t,n){return void 0===n&&(n=""),this._store.get(e,t,n)},e}(),ks=function(e,t,i,r,o,s,a){return {conversationType:e,targetId:t,senderUserId:s,messageDirection:W$1.SEND,isCounted:!!i.isCounted,isMentioned:!!i.isMentioned,content:i.content,messageType:i.messageType,isOffLineMessage:!1,isPersited:!!i.isPersited,messageUId:r,sentTime:o,receivedTime:0,disableNotification:!!i.disableNotification,isStatusMessage:!!i.isStatusMessage,canIncludeExpansion:!!i.canIncludeExpansion,expansion:i.canIncludeExpansion?i.expansion:null,receivedStatus:n.UNREAD,pushConfig:i.pushConfig,channelId:i.channelId,isInterrupt:i.isInterrupt,messageId:a||0}},Gs=function(e){return e.sort((function(e,t){var n,i,r=(null===(n=e.latestMessage)||void 0===n?void 0:n.sentTime)||0;return ((null===(i=t.latestMessage)||void 0===i?void 0:i.sentTime)||0)-r}))},Bs=function(e){function t(t,n,i,r){var o=e.call(this,t,n,i,r)||this;return o.naviInfo=null,o._customMessageType={},o._reconnectTimer=-1,o._pullOfflineFinished=!1,o._miniConnectUrl="",o.currentUserId="",o._connectedTime=0,o._localConnectedTime=0,o._status=ee$1.DISCONNECTED,o._pullingMsg=!1,o._pullQueue=[],o._chrmsQueue={},o._latestSyncTimestamp=0,o._intervalTimer=-1,o._intervalTimerForChrmPull=-1,o._lastSyncUltraMsgTimeStamp=0,o._lastSyncUltraMsgLocalTimeStamp=0,o._ultraGroupTimer=-1,o._isUltraPulling=!1,o._ultraGroupTimeQue=[],o._isUltraGroupListExist=!1,o._ultraGroupMap={},o._ultraMsgMap={},o._pullUltraChangeMessageQue=[],o._isPullingUltraChangeMessage=!1,o._lastPullingUltraChangeMessageTime=0,o._ultraMsgChangeMap={},o._letterbox=new ls(t,r.appkey),o._sendMessageStore=new Us(t,r.appkey),o._chrmEntryHandler=new fs(o),o._connectType=r.connectionType,o}return b$1(t,e),t.prototype._formatJSONPUrl=function(e,t,n,i){var r=this.runtime.isSupportSocket()&&"websocket"===this._connectType?"navi":"cometnavi";return "".concat(e,"/").concat(r,".js?appId=").concat(n,"&token=").concat(encodeURIComponent(t),"&callBack=").concat(i,"&v=").concat(this._apiVersion,"&r=").concat(Date.now())},t.prototype.getNaviInfo=function(t,n,i){var r;return D$1(this,void 0,void 0,(function(){var o;return V$1(this,(function(s){return this.runtime.useNavi||(o=void 0,o=this.runtime.isSupportSocket()&&"websocket"===this._connectType?c.join(","):u.join(","),this._miniConnectUrl=(null===(r=this._options.miniCMPProxy)||void 0===r?void 0:r.length)?this._options.miniCMPProxy.join(","):o||"",n=[]),[2,e.prototype.getNaviInfo.call(this,t,n,i)]}))}))},t.prototype.updateNaviInfo=function(e){this.naviInfo=e;},t.prototype.requestNaviInfo=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a,c,u,l,h,d,f;return V$1(this,(function(p){switch(p.label){case 0:i="getServerEndpoint",r=0,o=e.length,p.label=1;case 1:return r<o?(s=this._formatJSONPUrl(e[r],n,t,i),Et$1("req navi => ".concat(s)),[4,this.runtime.httpReq({url:s,timeout:1e4,dataType:"text"})]):[3,4];case 2:if(a=p.sent(),c=(new Date).getTime(),Jr(mo$1.IM_NAVI,{endTime:c}),200!==a.status)return u=void 0,403===a.status?(u=z$1.RC_CONN_USER_OR_PASSWD_ERROR,Ct$1("request navi error: ".concat(u))):401===a.status&&(u=z$1.RC_CONN_APP_BLOCKED_OR_DELETED,Ct$1("request navi error: ".concat(u))),Jr(mo$1.IM_NAVI,{code:u}),Xo(this.runtime),[3,3];try{return l=a.data.match(/{[\d\D]+}/),0===(h=l&&l[0]?l[0]:"").indexOf('{\\"code\\":')&&(h=JSON.parse('"'.concat(h,'"'))),f=JSON.parse(h),d=/^https/.test(s)?"https":"http",f.protocol=d,this.runtime.useNavi||(f.server="",f.backupServer=this._miniConnectUrl,f.logSwitch=0),Qr({serverPrivate:f.type===ur.PRIVATE?ur.PRIVATE:ur.OPEN}),Jr(mo$1.IM_NAVI,{code:z$1.SUCCESS}),f.userId&&(bt$1({userId:f.userId}),mt$1({userId:f.userId})),Xo(this.runtime),[2,f]}catch(e){Ct$1("parse navi err =>",e);}p.label=3;case 3:return r+=1,[3,1];case 4:return this.runtime.useNavi?[2,null]:(f={code:200,protocol:"https",server:"",voipCallInfo:"",kvStorage:0,openHttpDNS:!1,historyMsg:!1,chatroomMsg:!1,uploadServer:"https://upload.qiniup.com",bosAddr:"https://gz.bcebos.com",location:"",monitor:0,joinMChrm:!1,openMp:0,openUS:0,grpMsgLimit:0,isFormatted:0,gifSize:2048,logSwitch:0,logPolicy:"",compDays:0,msgAck:"",activeServer:"",qnAddr:"",extkitSwitch:0,alone:!1,voipServer:"",offlinelogserver:"",backupServer:this._miniConnectUrl},Jr(mo$1.IM_NAVI,{code:f.code,startTime:0,endTime:0,host:""}),Xo(this.runtime),[2,f])}}))}))},t.prototype.getNaviInfoFromCache=function(){return this.naviInfo?P$1({},this.naviInfo):null},t.prototype.getConnectedTime=function(){return this._connectedTime},t.prototype.connect=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a=this;return V$1(this,(function(c){switch(c.label){case 0:return n=[],this.naviInfo=t,t.server?n.push(t.server):kt$1.warn("navi.server is invalid"),null==(i=t.backupServer)||i.split(",").forEach((function(e){n.indexOf(e)<0&&n.push(e);})),0===n.length?(kt$1.error("navi invaild.",n),[2,z$1.UNKNOWN]):(r=this.runtime.createDataChannel({status:function(i){a._connectionStatusHandler(i,e,n,t.protocol);},signal:this._signalHandler.bind(this)},this._options.connectionType),o=Qt$1.V3,1===t.openAnti&&(o=Qt$1.V4),[4,r.connect(this._appkey,e,n,t.protocol,this._apiVer,o)]);case 1:return (s=c.sent())===z$1.SUCCESS?(this._channel=r,this.currentUserId=r.userId,this._connectedTime=r.connectedTime,this._localConnectedTime=Math.floor((Date.now()+r.sendConnectTime)/2),this._watcher.status(ee$1.CONNECTED),this._status=ee$1.CONNECTED,this._pullOfflineFinished=!1,this._conversationManager=new Os(this,this._appkey,this.currentUserId,this._watcher.conversation,this._watcher.conversationTag),this._ultraGroupManager=new Vs(this,this._appkey,this.currentUserId),this._conversationManager.startPullConversationStatus(0),this._userSettingManager=new Ns(this,this._appkey,this.currentUserId,this._watcher.tag),this._userSettingManager.pullUserSettings(0),this._sendMessageStore.init(this.currentUserId),this._conversationManager.adaptOldStore(),this._joinedChrmManager=new ps(this.runtime,this._appkey,this.currentUserId,t.joinMChrm),this._startSyncInterval(),1===t.ugMsg&&this._notificationOnline()):r.close(),[2,s]}}))}))},t.prototype._connectionStatusHandler=function(e,t,n,i){switch(kt$1.warn("connection status changed:",e),this._status=e,e){case ee$1.CONNECTING:case ee$1.CONNECTED:this._watcher.status(e);break;case ee$1.REDIRECT:case ee$1.BLOCKED:case ee$1.KICKED_OFFLINE_BY_OTHER_CLIENT:case ee$1.DISCONNECT_BY_SERVER:this._resetMemoryState(),this._watcher.status(e);break;default:this._watcher.status(e),this._try2Reconnect(t,n,i);}},t.prototype._try2Reconnect=function(e,t,n){var i,r;return D$1(this,void 0,void 0,(function(){var o,s=this;return V$1(this,(function(a){switch(a.label){case 0:return this._channel?(o=Qt$1.V3,1===(null===(i=this.naviInfo)||void 0===i?void 0:i.openAnti)&&(o=Qt$1.V4),[4,this._channel.connect(this._appkey,e,t,n,this._apiVer,o)]):[2];case 1:return a.sent()===z$1.SUCCESS?(this._pullOfflineFinished=!1,this._startSyncInterval(),this._watcher.status(ee$1.CONNECTED),this._status=ee$1.CONNECTED,1===(null===(r=this.naviInfo)||void 0===r?void 0:r.ugMsg)&&this._notificationOnline(),this._rejoinChrm(),[2]):(this._watcher.status(ee$1.WEBSOCKET_UNAVAILABLE),this._status=ee$1.WEBSOCKET_UNAVAILABLE,this._reconnectTimer=setTimeout((function(){s._reconnectTimer=-1,s._try2Reconnect(e,t,n);}),5e3),[2])}}))}))},t.prototype._signalHandler=function(e,t){var n=e.syncMsg,i=e.topic;if(n)this._receiveSyncMsg(e,t);else {var r=yo$1[i];if(r)switch(r){case yo$1.s_ntf:kt$1.info("recv s_ntf -> signal.messageId: ".concat(e.messageId)),this._pullMsg(e);break;case yo$1.s_msg:this._receiveMsg(e);break;case yo$1.s_cmd:this._receiveStateNotify(e);break;case yo$1.s_us:this._receiveSettingNotify(e);break;case yo$1.rtc_ntf:this._receiveRtcKv(e.data);break;case yo$1.s_opNtf:this._pullOperateStatusNotify(e);}else kt$1.error("unknown topic:",i);}},t.prototype._receiveStateNotify=function(e){var t,n=null===(t=this._channel)||void 0===t?void 0:t.codec.decodeByPBName(e.data,Pn$1),i=n.time,r=n.type,o=n.chrmId;switch(r){case 2:this._chrmEntryHandler.pullEntry(o,i);break;case 3:this._conversationManager.startPullConversationStatus(i);break;case 4:this._chrmEntryHandler.reset(o),this._watcher.chatroom({chatroomDestroyed:e.targetId});break;case 6:this._ultraGroupTimeQue.push(i),this._syncUltraMsg(this._lastSyncUltraMsgTimeStamp);break;case 7:this._pullUltraChangeMessageQue.push(i),this._pullUltraChangeMessageList(this._lastPullingUltraChangeMessageTime);}},t.prototype._receiveSettingNotify=function(e){var t,n=(null===(t=this._channel)||void 0===t?void 0:t.codec.decodeByPBName(e.data,_i)).version;this._userSettingManager.pullUserSettings(n);},t.prototype._receiveMessageExpansion=function(e){var t=e.content,n=t.put,i=t.del,r=t.mid;n&&this._watcher.expansion({updatedExpansion:{messageUId:r,expansion:n}}),i&&this._watcher.expansion({deletedExpansion:{messageUId:r,deletedKeys:i}});},t.prototype._receiveSyncMsg=function(e,t){var n,i;if(As.includes(e.topic)){if(e.topic===yo$1[yo$1.updUgRTime]){var r=null===(n=this._channel)||void 0===n?void 0:n.codec.decodeByPBName(e.data,jn$1),o=r.channelId,s=r.busChannel,a=this._ultraGroupMap["".concat(s,"_").concat(o)];return a&&(a.unreadMessageCount=0,a.unreadMentionedCount=0,a.firstUnreadMessage&&(a.firstUnreadMessage=null),a.lastReadTime=t.timestamp,this._watcher.conversation(mn$1([a]))),void(t&&(this._ultraMsgMap[t.messageUId]=t.timestamp))}var c=null===(i=this._channel)||void 0===i?void 0:i.codec.decodeByPBName(e.data,On$1,{currentUserId:this.currentUserId,signal:e});c=this._handleMsgProperties(c),t&&(c.sentTime=t.timestamp,c.messageUId=t.messageUId),Tt$1(pe$1.L_RECEIVE_MSG_O,{messageUId:c.messageUId,messgeId:c.messageId,sentTime:c.sentTime}),this._pullingMsg?this._pullQueue.push((null==t?void 0:t.timestamp)||c.sentTime):(t&&this._sendMessageStore.setMessage(t.messageUId,t.timestamp),c.messageType!==ie$1.EXPANSION_NOTIFY?(c.messageType===ie$1.SYNC_READ_STATUS&&this._conversationManager.clearUnreadCount(c.conversationType,c.targetId,c.channelId),this._conversationManager.setConversationCacheByMessage(c,!0),this._watcher.batchMessage([c])):this._receiveMessageExpansion(c));}},t.prototype._pullMsg=function(e){if(this._channel){var t=this._channel.codec.decodeByPBName(e.data,Pn$1),n=t.type,i=t.chrmId,r=t.time;if(kt$1.info("s_ntf -> type: ".concat(n,", chrmId: ").concat(i,", time: ").concat(r)),2===n){var o=this._chrmsQueue[i];if(!o)return;o.queue.push(r),this._pullChrmMsg(i);}else this._pullQueue.push(r),this._syncMsg();}},t.prototype._startSyncInterval=function(){var e=this;this._stopSyncInterval();this._intervalTimer=setInterval((function(){Date.now()-e._latestSyncTimestamp>=18e4&&e._syncMsg();}),3e4),this._latestSyncTimestamp=Date.now(),this._syncMsg();},t.prototype._stopSyncInterval=function(){-1!==this._intervalTimer&&(clearInterval(this._intervalTimer),this._intervalTimer=-1);},t.prototype._syncMsg=function(){return D$1(this,void 0,void 0,(function(){var e,t,n,i,r,o,s,a,c,u,l,h,d,f,p,g,_,m,v,y,E=this;return V$1(this,(function(T){switch(T.label){case 0:return this._pullingMsg?[2]:this._channel?(this._pullingMsg=!0,e=this._letterbox.getOutboxTime(this.currentUserId),t=this._letterbox.getInboxTime(this.currentUserId),n=this._letterbox.getBroadcastSyncTime(this.currentUserId),kt$1.info("pullMsg -> sendboxTime: ".concat(e,", inboxTime: ").concat(t,", broadcastSyncTime: ").concat(n)),i=this._channel.codec.encodeSyncMsg({sendboxTime:e,inboxTime:t,broadcastSyncTime:n}),r=new ho$1(yo$1[yo$1.pullMsg],i,this.currentUserId),o=_t$1(),Tt$1(pe$1.L_PULL_MSG_T,{outboxTime:e,inboxTime:t,broadcastSyncTime:n},{traceId:o}),[4,this._channel.send(r,Un$1,{connectedTime:this._channel.connectedTime,currentUserId:this.currentUserId})]):(this._pullingMsg=!1,[2]);case 1:return s=T.sent(),a=s.code,c=s.data,this._latestSyncTimestamp=Date.now(),a!==z$1.SUCCESS||!c||He$1(c.finished)||He$1(c.list)||He$1(c.syncTime)?(kt$1.warn("pullMsg failed -> code:",a,", data: ",c),It$1(pe$1.L_PULL_MSG_R,{code:a,timestamp:this._latestSyncTimestamp},{traceId:o}),this._pullingMsg=!1,[2]):(u=c.list,l=c.finished,h=c.syncTime,d=c.broadcastSyncTime,f=void 0===d?1:d,p=u.map((function(e){return {messageUId:e.messageUId,messageId:e.messageId,sentTime:e.sentTime}})),kt$1.info("pullMsg success -> syncTime: ".concat(h,", finished: ").concat(l,", messages: ").concat(JSON.stringify(p))),g=0,_=[],m=[],u.forEach((function(e){if((_.push(e.messageUId),e.messageDirection===W$1.SEND)&&(g=Math.max(e.sentTime,g),E._sendMessageStore.getSendMessageMap()[e.messageUId]))return void E._sendMessageStore.removeByUID(e.messageUId);if(e.messageType!==ie$1.EXPANSION_NOTIFY){if(e.messageType===ie$1.SYNC_READ_STATUS){if(e.senderUserId!==E.currentUserId)return;E._conversationManager.clearUnreadCount(e.conversationType,e.targetId,e.channelId);}var t=E._handleMsgProperties(e);E._conversationManager.setConversationCacheByMessage(t,!0),m.push(t);}else E._receiveMessageExpansion(e);})),Tt$1(pe$1.L_PULL_MSG_O,{messages:m.map((function(e){return e.messageUId}))}),this._watcher.batchMessage(m),this._letterbox.setInboxTime(h,this.currentUserId),this._letterbox.setOutboxTime(g,this.currentUserId),this._letterbox.setBroadcastSyncTime(f,this.currentUserId),this._sendMessageStore.removeByTimestamp(g),this._pullingMsg=!1,v=this._pullQueue.filter((function(e){return e>h})),this._pullQueue.length=0,(y=this._pullQueue).push.apply(y,v),l&&!this._pullOfflineFinished&&(this._pullOfflineFinished=!0,this._watcher.pullFinished()),Tt$1(pe$1.L_PULL_MSG_R,{code:a,messageUIds:_.join(","),timestamp:this._latestSyncTimestamp,hasmore:!l},{traceId:o}),(!l||v.length>0)&&this._syncMsg(),[2])}}))}))},t.prototype._receiveMsg=function(e){if(this._channel){var t=this._channel.codec.decodeByPBName(e.data,Mn$1,{currentUserId:this.currentUserId,connectedTime:this._channel.connectedTime});if(t=this._handleMsgProperties(t),Tt$1(pe$1.L_RECEIVE_MSG_O,{messageUId:t.messageUId,messgeId:t.messageId,sentTime:t.sentTime}),t.conversationType!==X$1.RTC_ROOM){if(this._pullingMsg)return;if(this._pullQueue.length>0)return void this._syncMsg()}t.senderUserId===this.currentUserId&&this._sendMessageStore.setMessage(t.messageUId,t.sentTime),t.isStatusMessage||t.senderUserId===this.currentUserId||this._letterbox.setInboxTime(t.sentTime,this.currentUserId),t.messageType!==ie$1.EXPANSION_NOTIFY?t.messageType===ie$1.SYNC_READ_STATUS&&t.senderUserId!==this.currentUserId||(this._conversationManager.setConversationCacheByMessage(t,!0),this._watcher.batchMessage([t])):this._receiveMessageExpansion(t);}},t.prototype._handleMsgProperties=function(e,t){void 0===t&&(t=!1);var n,i=e.messageType,r=e.isCounted,o=e.isPersited,s=e.isStatusMessage,a=i in T,c=i in this._customMessageType;if(n=a?P$1(P$1({},T[i]),{isStatusMessage:C.includes(i)}):c?this._customMessageType[i]:{isCounted:!qe$1(r)&&r,isPersited:!qe$1(o)&&o,isStatusMessage:!1},Object.assign(e,n),t&&!He$1(s)&&(e.isStatusMessage=s),!t){var u=e.content.user;if(u){var l=u.portrait,h=u.portraitUri,d=l||h;d&&(u.portrait=u.portraitUri=d);}}return e},t.prototype.getHistoryMessage=function(e,t,n,i,r,o,s,a){var c;return void 0===o&&(o=""),D$1(this,void 0,void 0,(function(){var s,u,l,h,d,f,p,g,_,m;return V$1(this,(function(v){switch(v.label){case 0:return u=(s=this).currentUserId,l=s._channel,h=br[e]||Nr,d=1===i&&0===n,l?(f=l.codec.encodeGetHistoryMsg(t,{timestamp:n,count:d?2:i,order:r,channelId:o}),Tt$1(pe$1.L_GET_HISTORY_MSG_T,{targetId:t,conversationType:e,channelId:o,timestamp:n,count:i,order:r},{traceId:a}),[4,l.send(new ho$1(h,f,u),Vn$1,{currentUserId:u,connectedTime:l.connectedTime,conversation:{targetId:t}})]):[3,2];case 1:return p=v.sent(),(g=p.code)===z$1.SUCCESS&&f?(_=p.data,d&&2===_.list.length&&(_.hasMore=!0,0===r?_.list.shift():_.list.pop()),m=[],null===(c=_.list)||void 0===c||c.forEach((function(e){e&&m.push(e.messageUId);})),Tt$1(pe$1.L_GET_HISTORY_MSG_R,{code:g,messageUIds:m.join(",")},{traceId:a}),[2,{code:g,data:{list:_.list,hasMore:_.hasMore}}]):(It$1(pe$1.L_GET_HISTORY_MSG_R,{code:g,messageUIds:""},{traceId:a}),[2,{code:g}]);case 2:return [2,{code:z$1.RC_NET_CHANNEL_INVALID}]}}))}))},t.prototype.reportSDKInfo=function(e){var t=this.currentUserId,n=this._channel;if(n){kt$1.info("reportSDKInfo ->",e);var i=n.codec.encodeReportSDKInfo(JSON.stringify(e)),r=new ho$1(yo$1[yo$1.reportsdk],i,t);n.send(r).then((function(e){var t=e.code;t!==z$1.SUCCESS&&kt$1.warn("reportSDKInfo failed -> code: ".concat(t));}));}},t.prototype.deleteRemoteMessage=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u,l;return V$1(this,(function(h){switch(h.label){case 0:return o=(r=this).currentUserId,(s=r._channel)?(a=s.codec.encodeDeleteMessages(e,t,n,i),c=new ho$1(gr,a,o),[4,s.send(c)]):[3,2];case 1:return u=h.sent(),l=u.code,z$1.SUCCESS,[2,l];case 2:return [2,z$1.RC_NET_CHANNEL_INVALID]}}))}))},t.prototype.deleteRemoteMessageByTimestamp=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u,l,h;return V$1(this,(function(d){switch(d.label){case 0:return o=(r=this).currentUserId,(s=r._channel)?(a=s.codec.encodeClearMessages(t,n,i,e),c=Pr[e],u=new ho$1(c,a,o),[4,s.send(u)]):[3,2];case 1:return l=d.sent(),h=l.code,z$1.SUCCESS,[2,h];case 2:return [2,z$1.RC_NET_CHANNEL_INVALID]}}))}))},t.prototype.getConversationList=function(e,t,n,i,r){return void 0===e&&(e=300),D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u,l,h,d=this;return V$1(this,(function(f){switch(f.label){case 0:return o=(r=this).currentUserId,s=r._channel,t=t||X$1.PRIVATE,s?(a=s.codec.encodeOldConversationList({count:e,type:t,startTime:n,order:i}),c=new ho$1(Cr,a,o),[4,s.send(c,Gn$1,{currentUserId:o,connectedTime:s.connectedTime,afterDecode:function(e){var t=e.conversationType,n=e.targetId,i=e.channelId,r=d._conversationManager.get(t,n,i);return Object.assign(e,r),e}})]):[3,2];case 1:return u=f.sent(),l=u.code,h=u.data,l!==z$1.SUCCESS?[2,{code:l}]:[2,{code:l,data:null==h?void 0:h.list}];case 2:return [2,{code:z$1.RC_NET_CHANNEL_INVALID}]}}))}))},t.prototype.removeConversation=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return (i=this._channel)?(r=i.codec.encodeRemoveOldConversationList({conversationType:e,channelId:n,targetId:t}),o=new ho$1(Rr,r,t),[4,i.send(o)]):[3,2];case 1:return s=c.sent(),kt$1.info("RemoveConversation =>",s),a=s.code,z$1.SUCCESS,[2,a];case 2:return [2,z$1.RC_NET_CHANNEL_INVALID]}}))}))},t.prototype.getConversation=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return e!==X$1.ULTRA_GROUP?[3,1]:(i=this._ultraGroupMap["".concat(n,"_").concat(t)])?[3,3]:[2,{code:z$1.CONVER_GET_ERROR}];case 1:return (r=this._conversationManager.get(e,t,n))?[4,this.getHistoryMessage(e,t,0,1,0)]:[2,{code:z$1.CONVER_GET_ERROR}];case 2:if(o=u.sent(),s=o.code,a=o.data,s!==z$1.SUCCESS)return [2,{code:z$1.CONVER_GET_ERROR}];c=(null==a?void 0:a.list[0])||null,i={conversationType:e,targetId:t,channelId:n,unreadMessageCount:r.unreadMessageCount||0,latestMessage:c,notificationStatus:r.notificationStatus||oe$1.CLOSE,notificationLevel:r.notificationLevel||ae$1.NOT_SET,isTop:r.isTop||!1,lastUnreadTime:r.lastUnreadTime||0,unreadMentionedCount:r.unreadMentionedCount||0},u.label=3;case 3:return [2,{code:z$1.SUCCESS,data:i}]}}))}))},t.prototype.getAllConversationUnreadCount=function(e,t,n){var i=this._conversationManager.getAllUnreadCount(e,t,n);return Promise.resolve({code:z$1.SUCCESS,data:i})},t.prototype.getTotalUnreadCountByLevels=function(e,t,n){void 0===n&&(n=!1);var i=0;if(e.includes(X$1.ULTRA_GROUP)){if(!this._isUltraGroupListExist)return Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE});for(var r in this._ultraGroupMap){var o=this._ultraGroupMap[r];(0===t.length||t.includes(o.notificationLevel))&&(i+=n?o.unreadMentionedCount:o.unreadMessageCount);}}return i+=this._conversationManager.getTotalUnreadCountByLevels(e,t,n),Promise.resolve({code:z$1.SUCCESS,data:i})},t.prototype.getConversationUnreadCount=function(e,t,n){var i,r;return r=e===X$1.ULTRA_GROUP?(null===(i=this._ultraGroupMap["".concat(n,"_").concat(t)])||void 0===i?void 0:i.unreadMessageCount)||0:this._conversationManager.getUnreadCount(e,t,n),Promise.resolve({code:z$1.SUCCESS,data:r})},t.prototype.clearConversationUnreadCount=function(e,t,n){return this._conversationManager.clearUnreadCount(e,t,n,!1),Promise.resolve(z$1.SUCCESS)},t.prototype.clearAllUnreadCount=function(){return this._conversationManager.clearAllUnreadCount(),Promise.resolve(z$1.SUCCESS)},t.prototype.getFirstUnreadMessage=function(e,t){throw new Error("Method not implemented.")},t.prototype.saveConversationMessageDraft=function(e,t,n,i){return this._conversationManager.setDraft(e,t,n,i),Promise.resolve(z$1.SUCCESS)},t.prototype.getConversationMessageDraft=function(e,t,n){var i=this._conversationManager.getDraft(e,t,n);return Promise.resolve({code:z$1.SUCCESS,data:i})},t.prototype.clearConversationMessageDraft=function(e,t,n){return this._conversationManager.clearDraft(e,t,n),Promise.resolve(z$1.SUCCESS)},t.prototype.pullConversationStatus=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l=this;return V$1(this,(function(h){switch(h.label){case 0:return n=(t=this)._channel,i=t.currentUserId,n?(r=n.codec.encodeGetConversationStatus(e),o=new ho$1(yo$1[yo$1.pullSeAtts],r,i),[4,n.send(o,vi)]):[3,2];case 1:return s=h.sent(),a=s.code,c=s.data,Tt$1(pe$1.L_PULL_CONVERSATION_S,{timestamp:e,userId:i}),a!==z$1.SUCCESS?[2,{code:a}]:(u=[],Array.isArray(c)&&c.forEach((function(e){var t=e.conversationType,n=e.targetId,i=e.notificationStatus,r=e.channelId,o=e.isTop,s=e.notificationLevel,a=e.updatedTime;a&&l._conversationManager.setConversationUpdatedTime(a);var c=l._ultraGroupMap["".concat(r,"_").concat(n)];t===X$1.ULTRA_GROUP?c&&(void 0!==i&&(c.notificationStatus=i),void 0!==s&&(c.notificationLevel=s),void 0===s&&void 0===i||l._ultraGroupManager.addUltraGroupStatus(e),"boolean"==typeof o&&(c.isTop=o)):u.push(e);})),[2,{code:a,data:u}]);case 2:return [2,{code:z$1.RC_NET_CHANNEL_INVALID}]}}))}))},t.prototype.batchSetConversationStatus=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h,d,f=this;return V$1(this,(function(p){switch(p.label){case 0:return n=(t=this).currentUserId,(i=t._channel)?(r=this._conversationManager.getConversationUpdatedTime(),o=i.codec.encodeSetConversationStatus(e,r),s=new ho$1(Sr,o,n),[4,i.send(s,Ii)]):[3,2];case 1:return a=p.sent(),c=a.code,u=a.data,c===z$1.SUCCESS?(l=u,this._conversationManager.setConversationUpdatedTime(l.version),h=[],e.forEach((function(e){var t=e.conversationType,n=e.targetId,i=e.notificationStatus,r=e.notificationLevel,o=e.channelId,s=e.isTop;if(t===X$1.ULTRA_GROUP){var a=f._ultraGroupMap["".concat(o,"_").concat(n)];a&&(void 0!==i&&(a.notificationStatus=i),void 0!==r&&(a.notificationLevel=r),void 0===r&&void 0===i||f._ultraGroupManager.addUltraGroupStatus(a),void 0!==s&&(a.isTop=s),h.push(a));}else f._conversationManager.addStatus(P$1(P$1({},e),{updatedTime:l.version}),!0);})),h.length>0&&(d=mn$1(h),d=Gs(d),this._watcher.conversation(d)),[2,c]):[2,c];case 2:return [2,z$1.RC_NET_CHANNEL_INVALID]}}))}))},t.prototype._joinChrm=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u,l,h;return V$1(this,(function(d){switch(d.label){case 0:return (r=this._channel)?(o=r.codec.encodeJoinOrQuitChatRoom(),a=new ho$1(s=n?mr:_r,o,e),Tt$1(pe$1.L_JOIN_CHATROOM_T,{chatroomId:e,count:t,topic:s},{traceId:i}),[4,r.send(a,Wn$1)]):[2,z$1.RC_NET_CHANNEL_INVALID];case 1:return c=d.sent(),u=c.code,l=c.data,(u===z$1.SUCCESS?Tt$1:It$1)(pe$1.L_JOIN_CHATROOM_R,{code:u,timestamp:(new Date).getTime()},{traceId:i}),u===z$1.SUCCESS&&(h=l.joinTime,this._chrmsQueue[e]||(this._chrmsQueue[e]={pulling:!1,queue:[],timestamp:0}),this._pullChrmMsg(e,t,h),this.naviInfo.kvStorage&&this._chrmEntryHandler.pullEntry(e,0),this._joinedChrmManager.set(e,t),this._startSyncIntervalForChrmPull()),[2,u]}}))}))},t.prototype._rejoinChrm=function(){return D$1(this,void 0,void 0,(function(){var e,t,n,i,r,o,s;return V$1(this,(function(a){switch(a.label){case 0:for(n in e=this._joinedChrmManager.get(),t=[],e)t.push(n);i=0,a.label=1;case 1:return i<t.length?(r=t[i],Tt$1(pe$1.L_REJOIN_CHATROOM_T,{chatroomId:r,count:e[r]||10,topic:mr}),o=_t$1(),[4,this._joinChrm(r,e[r]||10,!0,o)]):[3,4];case 2:s=a.sent(),(s===z$1.SUCCESS?Tt$1:It$1)(pe$1.L_REJOIN_CHATROOM_R,{code:s,timestamp:(new Date).getTime()},{traceId:o}),s===z$1.SUCCESS?this._watcher.chatroom({rejoinedRoom:{chatroomId:r,count:e[r]}}):this._watcher.chatroom({rejoinedRoom:{chatroomId:r,errorCode:s}}),a.label=3;case 3:return i++,[3,1];case 4:return [2]}}))}))},t.prototype._pullChrmMsg=function(e,t,n){return void 0===t&&(t=10),void 0===n&&(n=0),D$1(this,void 0,void 0,(function(){var i,r,o,s,a,c,u,l,h,d,f,p,g;return V$1(this,(function(_){switch(_.label){case 0:return this._channel?(i=this._chrmsQueue[e],r=i.pulling,o=i.timestamp,r?[2]:(i.pulling=!0,s=this._channel.codec.encodeChrmSyncMsg(o,t),a=new ho$1(yo$1[yo$1.chrmPull],s,e),Tt$1(pe$1.L_PULL_CHATROOM_MSG_T,{chatroomId:e,timestamp:o}),[4,this._channel.send(a,Un$1,{connectedTime:this._channel.connectedTime,currentUserId:this.currentUserId})])):[2];case 1:return c=_.sent(),u=c.code,l=c.data,i.pulling=!1,u===z$1.SUCCESS&&l?(h=l.list,d=l.syncTime,f=l.finished,i.timestamp=n?Math.max(d,n):d,i.queue=i.queue.filter((function(e){return e>d})),p=[],g=[],h.forEach((function(e){e.sentTime<o||(p.push(e.messageUId),g.push(e));})),this._watcher.batchMessage(g),Tt$1(pe$1.L_PULL_CHATROOM_MSG_R,{code:u,timestamp:o,messageUIds:p.join(",")}),(!f||i.queue.length>0)&&this._pullChrmMsg(e),[2]):(It$1(pe$1.L_PULL_CHATROOM_MSG_R,{code:u,timestamp:o,messageUIds:""}),kt$1.warn("pull chatroom msg failed, code:",u,", data:",l),[2])}}))}))},t.prototype.joinChatroom=function(e,t,n){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(i){return [2,this._joinChrm(e,t,!1,n)]}))}))},t.prototype.joinExistChatroom=function(e,t,n){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(i){return [2,this._joinChrm(e,t,!0,n)]}))}))},t.prototype.quitChatroom=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return (t=this._channel)?(n=t.codec.encodeJoinOrQuitChatRoom(),i=new ho$1(vr,n,e),[4,t.send(i)]):[2,z$1.RC_NET_CHANNEL_INVALID];case 1:return r=s.sent(),(o=r.code)===z$1.SUCCESS&&(delete this._chrmsQueue[e],this._chrmEntryHandler.reset(e),this._joinedChrmManager.remove(e)),[2,o]}}))}))},t.prototype.getChatroomInfo=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return (i=this._channel)?(r=i.codec.encodeGetChatRoomInfo(t,n),o=new ho$1(yo$1[yo$1.queryChrmI],r,e),[4,i.send(o,zn$1)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return s=u.sent(),a=s.code,c=s.data,a!==z$1.SUCCESS?[2,{code:a}]:[2,{code:a,data:c}]}}))}))},t.prototype.getChatroomHistoryMessages=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u;return V$1(this,(function(l){switch(l.label){case 0:return (r=this._channel)?(o=r.codec.encodeGetHistoryMsg(e,{timestamp:t,count:n,order:i}),s=new ho$1(Ur,o,e),[4,r.send(s,Vn$1,{conversation:{targetId:e}})]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return a=l.sent(),c=a.code,u=a.data,c!==z$1.SUCCESS?[2,{code:c}]:[2,{code:c,data:{list:u.list,hasMore:u.hasMore}}]}}))}))},t.prototype._modifyChatroomKV=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a,c,u,l;return V$1(this,(function(h){switch(h.label){case 0:return i=(n=this)._channel,r=n.currentUserId,i?(o=this._chrmEntryHandler.getVersion(e,t.key),t.version=null==o?this.getServerTime():o,s=i.codec.encodeModifyChatRoomKV(e,t,r),a=t.type===_e$1.UPDATE?yr:Er,c=new ho$1(a,s,e),[4,i.send(c,Wn$1)]):[2,z$1.RC_NET_CHANNEL_INVALID];case 1:return u=h.sent(),(l=u.code)===z$1.SUCCESS?(this._chrmEntryHandler.setLocal(e,{kvEntries:[t],syncTime:(new Date).getTime()},r),[2,l]):[2,l]}}))}))},t.prototype._modifyChatroomKVS=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a,c,u,l,h,d,f,p=this;return V$1(this,(function(g){switch(g.label){case 0:return i=(n=this)._channel,r=n.currentUserId,i?(t.entries.forEach((function(t){var n=p._chrmEntryHandler.getVersion(e,t.key);t.version=null==n?p.getServerTime():n;})),o=i.codec.encodeModifyChatRoomKVS(e,t,r),s=t.type===_e$1.UPDATE?Tr:Ir,a=new ho$1(s,o,e),[4,i.send(a,ci)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return c=g.sent(),u=c.code,-1!==[z$1.SUCCESS,z$1.CHATROOM_KV_STORE_NOT_ALL_SUCCESS].indexOf(u)&&(h=[],delete(d=P$1({},t)).entries,t.entries.forEach((function(e){h.push(P$1(P$1({},e),d));})),u===z$1.CHATROOM_KV_STORE_NOT_ALL_SUCCESS&&(f=c.data,kt$1.warn("设置失败的属性：",f.errorKeys),l=f.errorKeys,f&&Array.isArray(f.errorKeys)&&f.errorKeys.forEach((function(e){var t=h.findIndex((function(t){return e.key===t.key}));-1!==t&&h.splice(t,1);}))),kt$1.warn("设置成功的属性：",h),this._chrmEntryHandler.setLocal(e,{kvEntries:h,syncTime:(new Date).getTime()},r)),[2,{code:u,data:l}]}}))}))},t.prototype.setChatroomEntry=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return t.type=_e$1.UPDATE,t.userId=t.userId||this.currentUserId,[2,this._modifyChatroomKV(e,t)]}))}))},t.prototype.setChatroomEntries=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return t.type=_e$1.UPDATE,t.userId=t.userId||this.currentUserId,[2,this._modifyChatroomKVS(e,t)]}))}))},t.prototype.forceSetChatroomEntry=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return t.type=_e$1.UPDATE,t.isOverwrite=!0,t.userId=t.userId||this.currentUserId,[2,this._modifyChatroomKV(e,t)]}))}))},t.prototype.removeChatroomEntry=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return t.type=_e$1.DELETE,t.userId=t.userId||this.currentUserId,[2,this._modifyChatroomKV(e,t)]}))}))},t.prototype.removeChatroomEntries=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return t.type=_e$1.DELETE,t.userId=t.userId||this.currentUserId,[2,this._modifyChatroomKVS(e,t)]}))}))},t.prototype.forceRemoveChatroomEntry=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return t.type=_e$1.DELETE,t.isOverwrite=!0,t.userId=t.userId||this.currentUserId,[2,this._modifyChatroomKV(e,t)]}))}))},t.prototype.getChatroomEntry=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return (n=this._chrmEntryHandler.getValue(e,t))?[2,Promise.resolve({code:z$1.SUCCESS,data:n})]:(i=this._channel)?(r=i.codec.encodePullChatRoomKV(0),o=new ho$1(yo$1[yo$1.pullKV],r,e),[4,i.send(o,ai)]):[2,Promise.resolve({code:z$1.RC_NET_CHANNEL_INVALID})];case 1:return s=u.sent(),(a=s.data||{})&&a.kvEntries&&a.kvEntries.length&&(c=a.kvEntries.find((function(e){return e.key===t})),void 0!==c)?[2,Promise.resolve({code:z$1.SUCCESS,data:null==c?void 0:c.value})]:[2,Promise.resolve({code:z$1.CHATROOM_KEY_NOT_EXIST})]}}))}))},t.prototype.getAllChatroomEntry=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s;return V$1(this,(function(a){switch(a.label){case 0:return (t=this._chrmEntryHandler.getAll(e))&&Object.keys(t).length?[2,Promise.resolve({code:z$1.SUCCESS,data:t})]:(n=this._channel)?(t={},i=n.codec.encodePullChatRoomKV(0),r=new ho$1(yo$1[yo$1.pullKV],i,e),[4,n.send(r,ai)]):[2,Promise.resolve({code:z$1.RC_NET_CHANNEL_INVALID})];case 1:return o=a.sent(),(s=o.data||{})&&s.kvEntries&&s.kvEntries.length&&s.kvEntries.forEach((function(e){e.key&&(t[e.key]=e.value||"");})),[2,Promise.resolve({code:z$1.SUCCESS,data:t})]}}))}))},t.prototype.pullChatroomEntry=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a,c,u,l,h,d;return V$1(this,(function(f){switch(f.label){case 0:return i=(n=this)._channel,r=n.currentUserId,i?(o=i.codec.encodePullChatRoomKV(t),s=new ho$1(yo$1[yo$1.pullKV],o,e),Tt$1(pe$1.L_PULL_CHATROOM_KV_T,{chatroomId:e,timestamp:t}),[4,i.send(s,ai)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return a=f.sent(),c=a.code,u=a.data,(c===z$1.SUCCESS?Tt$1:It$1)(pe$1.L_PULL_CHATROOM_KV_R,{code:c,timestamp:t}),c===z$1.SUCCESS?(kt$1.info("Pull success ChrmKV, ".concat(JSON.stringify(a))),this._chrmEntryHandler.setLocal(e,u,r),kt$1.info("Save into cache success!"),h=(l=u).kvEntries,l.syncTime,d=[],h.length>0&&(h.forEach((function(t){var n=t.key,i=t.value,r=t.type,o=t.timestamp;d.push({key:n,value:i,type:r,timestamp:o,chatroomId:e});})),this._watcher.chatroom({updatedEntries:d})),[2,{code:c,data:u}]):[2,{code:c}]}}))}))},t.prototype._startSyncIntervalForChrmPull=function(){var e=this;this._stopSyncIntervalForChrmPull(),this._intervalTimerForChrmPull=setInterval((function(){var t=Object.keys(e._chrmsQueue);0!==t.length&&e._channel?t.forEach((function(t){e._pullChrmMsg(t),e.naviInfo.kvStorage&&e._chrmEntryHandler.pullEntry(t,0);})):e._stopSyncIntervalForChrmPull();}),18e4);},t.prototype._stopSyncIntervalForChrmPull=function(){"number"!=typeof this._intervalTimerForChrmPull&&(clearInterval(this._intervalTimerForChrmPull),this._intervalTimerForChrmPull=-1);},t.prototype.sendMessage=function(e,t,n,i,r){return D$1(this,void 0,void 0,(function(){var o,s,a,c,u,l,h,d,f,p,g;return V$1(this,(function(_){switch(_.label){case 0:return this._channel?(n=function(e,t){return "RC:SRSMsg"===e.messageType&&Object.assign(e,{directionalUserIdList:[t]}),e}(n,this.currentUserId),n=this._handleMsgProperties(n,!0),o=!![X$1.PRIVATE,X$1.GROUP].includes(e)&&n.isStatusMessage,s=o?function(e){var t;return (t={},t[X$1.PRIVATE]=yo$1.ppMsgS,t[X$1.GROUP]=yo$1.pgMsgS,t)[e]}(e):function(e){var t;return (t={},t[X$1.PRIVATE]=yo$1.ppMsgP,t[X$1.GROUP]=yo$1.pgMsgP,t[X$1.CHATROOM]=yo$1.chatMsg,t[X$1.CUSTOMER_SERVICE]=yo$1.pcMsgP,t[X$1.RTC_ROOM]=yo$1.prMsgS,t)[e]}(e)||yo$1.ppMsgP,o&&(n.isPersited=!1,n.isCounted=!1),a=n.messageId?n.messageId:sn$1(),n.messageId=a,c=this._channel.codec.encodeUpMsg({conversationType:e,targetId:t},n),(u=new co$1(yo$1[s],c,t)).setHeaderQos(qt$1.AT_LEAST_ONCE),o?(this._channel.sendOnly(u),[2,{code:z$1.SUCCESS,data:ks(e,t,P$1({},n),"",0,this.currentUserId,a)}]):(l=Date.now()-this._localConnectedTime+this._connectedTime,h=ks(e,t,P$1({},n),"",l,this.currentUserId,a),null==i||i(a),Tt$1(pe$1.L_SEND_MSG_T,{messageType:n.messageType,conversationType:e,targetId:t,channelId:n.channelId},{traceId:r}),[4,this._channel.send(u)])):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return d=_.sent(),f=d.code,p=d.data,f!==z$1.SUCCESS?(It$1(pe$1.L_SEND_MSG_R,{code:f,messageUId:h.messageUId,messageId:h.messageId},{traceId:r}),[2,{code:f,data:h}]):(Tt$1(pe$1.L_SEND_MSG_R,{code:f,messageUId:null==p?void 0:p.messageUId,messageId:null==p?void 0:p.messageId},{traceId:r}),g=p,this._sendMessageStore.setMessage(g.messageUId,g.timestamp),h.sentTime=g.timestamp,h.messageUId=g.messageUId,this._conversationManager.setConversationCacheByMessage(h,!0),[2,{code:z$1.SUCCESS,data:h}])}}))}))},t.prototype.recallMsg=function(e,t,n,i,r){var o;return D$1(this,void 0,void 0,(function(){var s,a,c,u,l,h,d,f,p,g,_,m,v;return V$1(this,(function(y){switch(y.label){case 0:return this._channel?(s=r.user,a=r.extra,c=r.isDelete,u={conversationType:e,targetId:t,messageUId:n,sentTime:i,channelId:r.channelId||"",isDelete:c||!1},s&&(u.user=s),a&&(u.extra=a),l={content:u,messageType:"RC:RcCmd",disableNotification:null==r?void 0:r.disableNotification,pushConfig:null==r?void 0:r.pushConfig,pushContent:(null===(o=r.pushConfig)||void 0===o?void 0:o.pushContent)||r.pushContent||"",channelId:r.channelId},h=yo$1[yo$1.recallMsg],d=this._channel.codec.encodeUpMsg({conversationType:e,targetId:t},l),(f=new co$1(h,d,this.currentUserId)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(f)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return p=y.sent(),g=p.code,_=p.data,e===X$1.ULTRA_GROUP&&Et$1(pe$1.L_RECALL_ULTRA_MSG_S,{code:g,conversationType:e,targetId:t,channelId:r.channelId}),g!==z$1.SUCCESS?[2,{code:g}]:(m=_,e===X$1.ULTRA_GROUP?(this._ultraMsgMap[m.messageUId]=m.timestamp,this._updateUltraGroupWhenRecallMsg(t,r.channelId||"",n),[2,{code:z$1.SUCCESS}]):(this._sendMessageStore.setMessage(m.messageUId,m.timestamp),v=ks(e,t,P$1(P$1({},l),{isPersited:!0}),m.messageUId,m.timestamp,this.currentUserId),this._conversationManager.setConversationCacheByMessage(v,!0),[2,{code:z$1.SUCCESS,data:v}]))}}))}))},t.prototype.sendReadReceiptMessage=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r;return V$1(this,(function(o){return this._channel?(i=this._channel.codec.encodeReadReceipt(t,n),r=new ho$1(yo$1[yo$1.rrMsg],i,e),[2,this._channel.send(r)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}]}))}))},t.prototype.getMessageReader=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r;return V$1(this,(function(o){return this._channel?(i=this._channel.codec.encodeMessageReader(t,n),r=new ho$1(yo$1[yo$1.rrList],i,e),[2,this._channel.send(r,Ai)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}]}))}))},t.prototype.pullUserSettings=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return this._channel?(t=this._channel.codec.encodePullUserSetting(e),n=new ho$1(yo$1[yo$1.pullUS],t,this.currentUserId),[4,this._channel.send(n,gi)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return i=s.sent(),r=i.code,o=i.data,r===z$1.SUCCESS&&this._naviChangeHandler(o),[2,{code:r,data:o}]}}))}))},t.prototype._naviChangeHandler=function(e){var t;if(e){var n=e.settings,i=null===(t=null==n?void 0:n.VoipInfo)||void 0===t?void 0:t.value;if(i&&this.naviInfo&&this.naviInfo.voipCallInfo!==i){var r=P$1(P$1({},this.naviInfo),{voipCallInfo:i});this.naviInfo=r,this._watcher.onNaviDataChange(P$1({},r));}}else It$1(pe$1.L_NOTIFY_NAVI_CHANGE_E,{data:e});},t.prototype.getFileToken=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u;return V$1(this,(function(l){switch(l.label){case 0:return this._channel?(r=i&&"uploads"!==i?t||"":$t$1(e,t),o=this._channel.codec.encodeGetFileToken(e,r,n||"",i||""),s=new ho$1(yo$1[yo$1.qnTkn],o,this.currentUserId),[4,this._channel.send(s,Xn$1)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return a=l.sent(),c=a.code,u=a.data,u=Object.assign(u,{fileName:r}),c===z$1.SUCCESS?[2,{code:c,data:u}]:[2,{code:c}]}}))}))},t.prototype.getFileUrl=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u,l,h,d;return V$1(this,(function(f){switch(f.label){case 0:return this._channel?(r="",o="",s="",t===he$1.QINIU?(o=$n$1,s=ti):(o=ei,s=ni),r=t===he$1.QINIU?yo$1[yo$1.qnUrl]:t===he$1.AWS?yo$1[yo$1.s3Url]:t===he$1.STC?yo$1[yo$1.stcUrl]:yo$1[yo$1.aliUrl],a=this._channel.codec.encodeGetFileUrl(o,e,n,i),c=new ho$1(r,a,this.currentUserId),[4,this._channel.send(c,s)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return u=f.sent(),l=u.code,h=u.data,d=h,l===z$1.SUCCESS?[2,{code:l,data:d}]:[2,{code:l}]}}))}))},t.prototype.disconnect=function(){this._resetMemoryState(),this._watcher.status(ee$1.DISCONNECTED);},t.prototype._resetMemoryState=function(){-1!==this._reconnectTimer&&(clearTimeout(this._reconnectTimer),this._reconnectTimer=-1),this._channel&&(this._channel.close(),this._channel=void 0),this._pullQueue.length=0,this._stopSyncInterval(),this.resetUltraGroupData();},t.prototype.resetUltraGroupData=function(){this._stopUltraSyncInterval(),this._lastSyncUltraMsgTimeStamp=0,this._lastSyncUltraMsgLocalTimeStamp=0,this._isUltraPulling=!1,this._ultraGroupTimeQue=[],this._isUltraGroupListExist=!1,this._ultraGroupMap={};},t.prototype.destroy=function(){throw new Error("JSEngine's method not implemented.")},t.prototype.registerMessageType=function(e,t,n,i,r){this._customMessageType[e]={isPersited:t,isCounted:n,isStatusMessage:r};},t.prototype.getServerTime=function(){return Date.now()-this._localConnectedTime+this._connectedTime},t.prototype.getCurrentUserId=function(){return this.currentUserId},t.prototype.createTag=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return this._channel?(t=this._userSettingManager.getVersion(),n=this._channel.codec.encodeCreateTag([e],t),i=new ho$1(yo$1[yo$1.addSeTag],n,this.currentUserId),[4,this._channel.send(i,fi)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return r=c.sent(),o=r.code,s=r.data,o!==z$1.SUCCESS?[2,{code:o}]:(a=s.version,this._userSettingManager.addTag([P$1(P$1({},e),{createdTime:a})],a),[2,{code:z$1.SUCCESS,data:s}])}}))}))},t.prototype.removeTag=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return this._channel?(t=this._userSettingManager.getVersion(),n=this._channel.codec.encodeRemoveTag([e],t),i=new ho$1(yo$1[yo$1.delSeTag],n,this.currentUserId),[4,this._channel.send(i,fi)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return r=c.sent(),o=r.code,s=r.data,o!==z$1.SUCCESS?[2,{code:o}]:(a=s.version,this._userSettingManager.deleteTag([e],a),[2,{code:z$1.SUCCESS}])}}))}))},t.prototype.updateTag=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return this._channel?(t=this._userSettingManager.getVersion(),n=this._channel.codec.encodeCreateTag([e],t),i=new ho$1(yo$1[yo$1.addSeTag],n,this.currentUserId),[4,this._channel.send(i,fi)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return r=c.sent(),o=r.code,s=r.data,o!==z$1.SUCCESS?[2,{code:o}]:(a=s.version,this._userSettingManager.addTag([e],a),[2,{code:z$1.SUCCESS,data:s}])}}))}))},t.prototype.getTagList=function(){return D$1(this,void 0,void 0,(function(){var e,t;return V$1(this,(function(n){return e=this._userSettingManager.getTags(),t=this._conversationManager.getConversationListForTag(),e.forEach((function(e){e.conversationCount=t[e.tagId]?t[e.tagId].length:0;})),[2,{code:z$1.SUCCESS,data:e}]}))}))},t.prototype.addTagForConversations=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s=this;return V$1(this,(function(a){switch(a.label){case 0:return this._channel?this._userSettingManager.getTagById(e)?(n=this._channel.codec.encodeUpdateConversationTag([{tagId:e}],t),i=new ho$1(yo$1[yo$1.addTag],n,this.currentUserId),[4,this._channel.send(i)]):[2,{code:z$1.TAG_NOT_EXIST}]:[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return (r=a.sent().code)!==z$1.SUCCESS?[2,{code:r}]:((o={})[e]={},t.forEach((function(e){s._conversationManager.addTagStatus(e.conversationType,e.targetId,o,e.channelId);})),[2,{code:z$1.SUCCESS}])}}))}))},t.prototype.removeTagForConversations=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o=this;return V$1(this,(function(s){switch(s.label){case 0:return this._channel?(n=this._channel.codec.encodeUpdateConversationTag([{tagId:e}],t),i=new ho$1(yo$1[yo$1.delTag],n,this.currentUserId),[4,this._channel.send(i)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return (r=s.sent().code)!==z$1.SUCCESS?[2,{code:r}]:(t.forEach((function(t){o._conversationManager.deleteTagStatus(t.conversationType,t.targetId,[e],t.channelId);})),[2,{code:z$1.SUCCESS}])}}))}))},t.prototype.removeTagsForConversation=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return this._channel?(n=e.conversationType,i=e.targetId,r=e.channelId,o=t.map((function(e){return {tagId:e}})),s=this._channel.codec.encodeUpdateConversationTag(o,[e]),a=new ho$1(yo$1[yo$1.delTag],s,this.currentUserId),[4,this._channel.send(a)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return (c=u.sent().code)!==z$1.SUCCESS?[2,{code:c}]:(this._conversationManager.deleteTagStatus(n,i,t,r),[2,{code:z$1.SUCCESS}])}}))}))},t.prototype.getConversationListByTag=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a,c,u,l,h;return V$1(this,(function(d){switch(d.label){case 0:return r=(i=this).currentUserId,(o=i._channel)?(s=o.codec.encodeOldConversationList({count:n,type:X$1.PRIVATE,startTime:t}),a=new ho$1(Cr,s,r),[4,o.send(a,Gn$1,{currentUserId:r,connectedTime:o.connectedTime})]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return c=d.sent(),u=c.code,l=c.data,h=this._conversationHasTagFilter(e,null==l?void 0:l.list),kt$1.info("GetConversationListByTag",h),u!==z$1.SUCCESS?[2,{code:u}]:[2,{code:u,data:h}]}}))}))},t.prototype._conversationHasTagFilter=function(e,t){var n=this,i=[],r=[];function o(e,t){return e.latestMessage&&t.latestMessage?e.latestMessage.sentTime-t.latestMessage.sentTime:0}return t.forEach((function(t){var o=t.conversationType,s=t.targetId,a=t.channelId,c=n._conversationManager.get(o,s,a),u=c.hasMentioned,l=c.mentionedInfo,h=c.lastUnreadTime,d=c.notificationStatus,f=c.isTop,p=c.tags,g=c.unreadMessageCount,_=p&&p[e];if(_){var m=P$1(P$1({},t),{hasMentioned:u,mentionedInfo:l,lastUnreadTime:h,notificationStatus:d,isTop:f,unreadMessageCount:g});_.isTop?i.push(P$1(P$1({},m),{isTopInTag:!0})):r.push(P$1(P$1({},m),{isTopInTag:!1}));}})),k$1(k$1([],i.sort(o),!0),r.sort(o),!0)},t.prototype.getUnreadCountByTag=function(e,t){return D$1(this,void 0,void 0,(function(){var n;return V$1(this,(function(i){return this._channel?(n=this._conversationManager.getUnreadCountByTag(e,t),[2,{code:z$1.SUCCESS,data:n}]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}]}))}))},t.prototype.setConversationStatusInTag=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a,c,u,l,h,d;return V$1(this,(function(f){switch(f.label){case 0:return this._channel?(i=t.targetId,r=t.conversationType,o=t.channelId,s=n.isTop,a=[{tagId:e,isTop:s}],(c=this._conversationManager.get(r,i,o)).tags&&Object.hasOwnProperty.call(c.tags,e)?(u=this._channel.codec.encodeUpdateConversationTag(a,[t]),l=new ho$1(yo$1[yo$1.addTag],u,this.currentUserId),[4,this._channel.send(l)]):[2,{code:z$1.NO_TAG_IN_CONVER}]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return (h=f.sent().code)!==z$1.SUCCESS?[2,{code:h}]:((d={})[e]={},s&&(d[e].isTop=!0),this._conversationManager.addTagStatus(r,i,d,o),[2,{code:z$1.SUCCESS}])}}))}))},t.prototype.getTagsForConversation=function(e){var t;return D$1(this,void 0,void 0,(function(){var n,i,r,o;return V$1(this,(function(s){if(!this._channel)return [2,{code:z$1.RC_NET_CHANNEL_INVALID}];if(n=this._conversationManager.get(e.conversationType,e.targetId,e.channelId),i=this._userSettingManager.getTagsInfo(),r=[],n.tags)for(o in n.tags)r.push({tagId:o,tagName:null===(t=i[o])||void 0===t?void 0:t.tagName});return [2,{code:z$1.SUCCESS,data:r}]}))}))},t.prototype.getBlockConversationList=function(){var e=this._conversationManager.getBlockConversationList();return Promise.resolve({code:z$1.SUCCESS,data:e})},t.prototype.getTopConversationList=function(){var e=this._conversationManager.getTopConversationList();return Promise.resolve({code:z$1.SUCCESS,data:e})},t.prototype.getUnreadMentionedCount=function(e){var t,n;return n=e.conversationType===X$1.ULTRA_GROUP?(null===(t=this._ultraGroupMap["".concat(e.channelId,"_").concat(e.targetId)])||void 0===t?void 0:t.unreadMentionedCount)||0:this._conversationManager.getUnreadMentionedCount(e.channelId,e.conversationType,e.targetId),Promise.resolve({code:z$1.SUCCESS,data:n})},t.prototype.getAllUnreadMentionedCount=function(){var e=this._conversationManager.getAllUnreadMentionedCount();return Promise.resolve({code:z$1.SUCCESS,data:e})},t.prototype.getConversationNotificationLevel=function(e,t,n){if(!this._isUltraGroupListExist&&e===X$1.ULTRA_GROUP)return Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE});var i;if(!(i=e===X$1.ULTRA_GROUP?this._ultraGroupManager.get(X$1.ULTRA_GROUP,t,n):this._conversationManager.get(e,t,n)))return Promise.resolve({code:z$1.SUCCESS,data:ae$1.NOT_SET});var r=i.notificationLevel;return He$1(i.notificationLevel)&&!He$1(i.notificationStatus)&&(r=oe$1.OPEN===i.notificationStatus?1:0),Promise.resolve({code:z$1.SUCCESS,data:r})},t.prototype.getConversationNotificationStatus=function(e,t,n){var i;return (i=e===X$1.ULTRA_GROUP?this._ultraGroupManager.get(X$1.ULTRA_GROUP,t,n):this._conversationManager.get(e,t,n))?Promise.resolve({code:z$1.SUCCESS,data:i.notificationStatus}):Promise.resolve({code:z$1.SUCCESS,data:oe$1.CLOSE})},t.prototype.getRemoteHistoryMessages=function(e,t,n,i,r,o){return this.getHistoryMessage(e,t,n,i,r,o)},t.prototype.getUltraGroupList=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r;return V$1(this,(function(o){return t=e.targetId,n=e.channelType,this._isUltraGroupListExist?(i=Object.values(this._ultraGroupMap).filter((function(e){return !(e.targetId!==t&&t||e.channelType!==n&&Ve$1(n))})),i=Gs(i),r=mn$1(i),[2,{code:z$1.SUCCESS,data:r}]):[2,{code:z$1.METHOD_NOT_AVAILABLE}]}))}))},t.prototype.getBlockUltraGroupList=function(){if(!this._isUltraGroupListExist)return Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE});var e=Object.values(this._ultraGroupMap),t=[];return e.forEach((function(e){e.notificationStatus===oe$1.OPEN&&t.push({conversationType:X$1.ULTRA_GROUP,targetId:e.targetId,channelId:e.channelId});})),Promise.resolve({code:z$1.SUCCESS,data:t})},t.prototype.getTopUltraGroupList=function(){if(!this._isUltraGroupListExist)return Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE});var e=Object.values(this._ultraGroupMap),t=[];return e.forEach((function(e){!0===e.isTop&&t.push({conversationType:X$1.ULTRA_GROUP,targetId:e.targetId,channelId:e.channelId});})),Promise.resolve({code:z$1.SUCCESS,data:t})},t.prototype.getUltraGroupUnreadMentionedCountByTargetId=function(e,t){if(!this._isUltraGroupListExist)return Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE});var n=0;for(var i in this._ultraGroupMap){i.match(/_.*/g)[0].substring(1)!==e||t&&0!==t.length&&!t.includes(this._ultraGroupMap[i].notificationLevel)||(n+=this._ultraGroupMap[i].unreadMentionedCount);}return Promise.resolve({code:z$1.SUCCESS,data:n})},t.prototype.getUltraGroupUnreadCountByTargetId=function(e,t){var n=0;for(var i in this._ultraGroupMap){var r=this._ultraGroupMap[i];r.targetId!==e||t&&0!==t.length&&!t.includes(this._ultraGroupMap[i].notificationLevel)||(n+=r.unreadMessageCount||0);}return Promise.resolve({code:z$1.SUCCESS,data:n})},t.prototype.getAllUltraGroupUnreadCount=function(e){if(void 0===e&&(e=!1),!this._isUltraGroupListExist)return Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE});var t=0;for(var n in this._ultraGroupMap)t+=e?this._ultraGroupMap[n].unreadMentionedCount||0:this._ultraGroupMap[n].unreadMessageCount||0;return Promise.resolve({code:z$1.SUCCESS,data:t})},t.prototype.clearUltraUnreadcount=function(e,t){return void 0===t&&(t=""),D$1(this,void 0,void 0,(function(){var n,i,r,o,s;return V$1(this,(function(a){switch(a.label){case 0:return this._isUltraGroupListExist?this._channel?this._status!==ee$1.CONNECTED?[2,z$1.RC_NET_UNAVAILABLE]:(n=Date.now(),i=this._channel.codec.encodeClearUnreadCount({conversationType:X$1.ULTRA_GROUP,targetId:e,channelId:t},{timestamp:n}),(r=new co$1(yo$1[yo$1.updUgRTime],i,this.currentUserId)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(r)]):[2,z$1.RC_NET_CHANNEL_INVALID]:[2,Promise.resolve(z$1.METHOD_NOT_AVAILABLE)];case 1:return (o=a.sent().code)===z$1.SUCCESS&&((s=this._ultraGroupMap["".concat(t,"_").concat(e)])&&(s.unreadMessageCount=0,s.unreadMentionedCount=0,s.lastReadTime=n),s.firstUnreadMessage&&(s.firstUnreadMessage=null)),[2,o]}}))}))},t.prototype._getUltraGroupList=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h,d,f,p=this;return V$1(this,(function(g){switch(g.label){case 0:return this._channel&&this._status===ee$1.CONNECTED?(t=this._channel.codec.encodeUltraGroup(e,false),n=new ho$1(yo$1[yo$1.pullUgSes],t,this.currentUserId),[4,this._channel.send(n,Gn$1,{currentUserId:this.currentUserId,conversationType:X$1.ULTRA_GROUP})]):[2];case 1:return i=g.sent(),r=i.code,o=i.data,r===z$1.SUCCESS&&o?(a=o.list,c=o.isFinished,a.forEach((function(e){e.notificationStatus=oe$1.CLOSE,e.notificationLevel=ae$1.NOT_SET,e.isTop=!1,p._ultraGroupMap["".concat(e.channelId,"_").concat(e.targetId)]=e,p._ultraGroupManager.addUltraGroupStatus(e);})),!1!==c?[3,2]:(u=a.length>0&&a[a.length-1].versionTime||0,this._getUltraGroupList(u),[3,4])):(It$1(pe$1.L_ULTRA_SYNC_DONE_S,"Pull ultra group conversation failured, code: ".concat(r,", try again")),s=setTimeout((function(){p._getUltraGroupList(e),clearTimeout(s);}),3e3),[2]);case 2:return Tt$1(pe$1.L_ULTRA_SYNC_DONE_S,"Pull ultra group conversation success"),[4,this.pullConversationStatus(0)];case 3:l=g.sent(),h=l.code,d=l.data,h!==z$1.SUCCESS&&kt$1.warn("pullConversationStatus fail code: ".concat(h,", data: ").concat(d)),f=Object.values(this._ultraGroupMap),f=Gs(f),this._isUltraGroupListExist=!0,this._watcher.ultraGroupEnable(mn$1(f)),this._syncUltraMsg(this._lastSyncUltraMsgTimeStamp),g.label=4;case 4:return [2]}}))}))},t.prototype._startUltraSyncInterval=function(){var e=this,t=function(){e._ultraGroupTimer=setTimeout((function(){Date.now()-e._lastSyncUltraMsgLocalTimeStamp>=18e4&&e._syncUltraMsg(e._lastSyncUltraMsgTimeStamp),e._stopUltraSyncInterval(),t();}),3e4);};this._lastSyncUltraMsgLocalTimeStamp=Date.now(),t();},t.prototype._stopUltraSyncInterval=function(){-1!==this._ultraGroupTimer&&(clearTimeout(this._ultraGroupTimer),this._ultraGroupTimer=-1);},t.prototype._notificationOnline=function(){return D$1(this,void 0,void 0,(function(){var e,t,n,i=this;return V$1(this,(function(r){switch(r.label){case 0:return this._channel&&this._status===ee$1.CONNECTED?[4,this._fetchUltraMsg(0)]:[2];case 1:return e=r.sent(),t=e.code,n=e.data,t===z$1.SUCCESS&&n?(Tt$1(pe$1.L_NOTIFY_ULTRA_ONLINE_S,"Notify ultra group online success."),this._getUltraGroupList(0),-1===this._ultraGroupTimer&&this._startUltraSyncInterval(),[2]):(It$1(pe$1.L_NOTIFY_ULTRA_ONLINE_S,"Notify ultra group online failured, try again."),setTimeout((function(){i._notificationOnline();}),3e3),[2])}}))}))},t.prototype._fetchUltraMsg=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u;return V$1(this,(function(l){switch(l.label){case 0:return t=this._channel.codec.encodeSuperSyncMsg(e),n=new ho$1(yo$1[yo$1.pullUgMsg],t,this.currentUserId),i=_t$1(),Tt$1(pe$1.L_PULL_ULTRA_MSG_T,{timestamp:e},{traceId:i}),[4,this._channel.send(n,Un$1,{currentUserId:this.currentUserId,conversation:{conversationType:X$1.ULTRA_GROUP}})];case 1:return r=l.sent(),o=r.code,s=r.data,o===z$1.SUCCESS&&s?(a=s.list,c=s.syncTime,u=a.map((function(e){return e.messageUId})).join(","),Tt$1(pe$1.L_PULL_ULTRA_MSG_R,{code:o,messageUIds:u,timestamp:e,syncTime:c},{traceId:i})):It$1(pe$1.L_PULL_ULTRA_MSG_R,{code:o,timestamp:e},{traceId:i}),[2,{code:o,data:s}]}}))}))},t.prototype._syncUltraMsg=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h=this;return V$1(this,(function(d){switch(d.label){case 0:return this._channel&&this._status===ee$1.CONNECTED?this._isUltraPulling?[2]:(this._isUltraPulling=!0,[4,this._fetchUltraMsg(e)]):[2];case 1:return t=d.sent(),n=t.code,i=t.data,this._lastSyncUltraMsgLocalTimeStamp=Date.now(),this._isUltraPulling=!1,n===z$1.SUCCESS&&i?(r=i.list,o=i.syncTime,s=i.finished,a=[],c={},u=[],r.forEach((function(e){var t,n,i,r=e.targetId,s=e.content,l=e.messageType,d=e.messageUId,f=e.channelId,p=e.isCounted,g=e.channelType;e.isMentioned;var _=e.sentTime;if(a.push(d),h._ultraMsgMap[d])delete h._ultraMsgMap[d];else {var m=0;((null===(t=null==s?void 0:s.mentionedInfo)||void 0===t?void 0:t.type)===ue$1.ALL||(null===(i=null===(n=null==s?void 0:s.mentionedInfo)||void 0===n?void 0:n.userIdList)||void 0===i?void 0:i.includes(h.currentUserId)))&&(m=1);var v=h._ultraGroupMap["".concat(f,"_").concat(r)];if(v)p&&(l===ie$1.RECALL?v.unreadMessageCount>0&&(v.unreadMessageCount-=1):(v.unreadMessageCount+=1,v.unreadMentionedCount+=m,v.firstUnreadMessage||(v.firstUnreadMessage={sentTime:_}))),v.versionTime=o,v.latestMessage=e,v.channelType=g,c["".concat(f,"_").concat(r)]=v,h._ultraGroupManager.addUltraGroupStatus(v);else {var y={conversationType:X$1.ULTRA_GROUP,targetId:r,channelId:f,unreadMessageCount:p?1:0,unreadMentionedCount:p?m:0,versionTime:o,latestMessage:e,notificationStatus:oe$1.CLOSE,notificationLevel:ae$1.NOT_SET,isTop:!1,channelType:g,firstUnreadMessage:{sentTime:_}};h._ultraGroupMap["".concat(f,"_").concat(r)]=y,c["".concat(f,"_").concat(r)]=y,h._ultraGroupManager.addUltraGroupStatus(y);}u.push(e);}})),Object.keys(c).length>0&&(kt$1.info("notice ultragroups"),l=Object.values(c),l=Gs(l),this._watcher.conversation(mn$1(l))),kt$1.info("notice ultragroup message"),this._watcher.batchMessage(u),this._ultraGroupTimeQue=this._ultraGroupTimeQue.filter((function(e){return e>o})),this._lastSyncUltraMsgTimeStamp=o,(!s||this._ultraGroupTimeQue.length>0)&&this._syncUltraMsg(o),[2]):[2]}}))}))},t.prototype.sendUltraMessage=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u,l,h,d,f,p;return V$1(this,(function(g){switch(g.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:("RC:SRSMsg"===t.messageType&&kt$1.warn("ultra group -> direction message convert to message"),t=this._handleMsgProperties(t,!0),r=t.messageId?t.messageId:sn$1(),t.messageId=r,o=this._channel.codec.encodeUpMsg({conversationType:X$1.ULTRA_GROUP,targetId:e},t),(s=new co$1(yo$1[yo$1.ugMsg],o,e)).setHeaderQos(qt$1.AT_LEAST_ONCE),a=Date.now()-this._localConnectedTime+this._connectedTime,c=ks(X$1.ULTRA_GROUP,e,P$1({},t),"",a,this.currentUserId,r),n&&n(r),Tt$1(pe$1.L_SEND_MSG_T,{messageType:t.messageType,conversationType:X$1.ULTRA_GROUP,targetId:e,channelId:t.channelId},{traceId:i}),[4,this._channel.send(s)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return u=g.sent(),l=u.code,h=u.data,l!==z$1.SUCCESS?(It$1(pe$1.L_SEND_MSG_R,{code:l,messageUId:c.messageUId,messageId:c.messageId},{traceId:i}),[2,{code:l,data:c}]):(Tt$1(pe$1.L_SEND_MSG_R,{code:l,messageUId:null==h?void 0:h.messageUId,messageId:null==h?void 0:h.messageId},{traceId:i}),d=h,c.sentTime=d.timestamp,c.messageUId=d.messageUId,this._ultraMsgMap[d.messageUId]=d.timestamp,f=t.channelId||"",(p=this._ultraGroupMap["".concat(f,"_").concat(e)])?(p.latestMessage=c,Ve$1(p.channelType)&&(c.channelType=p.channelType)):(p={conversationType:X$1.ULTRA_GROUP,targetId:e,channelId:f,unreadMessageCount:0,unreadMentionedCount:0,versionTime:c.sentTime,latestMessage:c,notificationStatus:oe$1.CLOSE,notificationLevel:ae$1.NOT_SET,isTop:!1},this._ultraGroupMap["".concat(f,"_").concat(e)]=p,this._ultraGroupManager.addUltraGroupStatus(p)),this._watcher.conversation(mn$1([p])),[2,{code:l,data:c}])}}))}))},t.prototype.sendUltraGroupTypingStatus=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:(n=e.conversationType,i=e.channelId,r=e.targetId,o=this._channel.codec.encodeOperateStatus(r,n,i||"",t||0),(s=new co$1(yo$1[yo$1.operate],o,r)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(s)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return (a=c.sent().code)!==z$1.SUCCESS?[2,{code:a,msg:z$1[a]}]:[2,{code:a}]}}))}))},t.prototype.getUltraGroupMessageListByMessageUId=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:e.messages&&e.messages.length<1||e.messages&&e.messages.length>20?[2,{code:z$1.MSG_LIMIT_ERROR}]:(t={},e.messages.forEach((function(e){t[e.messageUId]=void 0;})),n=this._channel.codec.encodeMsgQuery(e),(i=new ho$1(yo$1[yo$1.qryMsg],n,this.currentUserId)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(i,ji,{connectedTime:this._channel.connectedTime,currentUserId:this.currentUserId})]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return r=c.sent(),o=r.code,s=r.data,o!==z$1.SUCCESS?[2,{code:o,msg:z$1[o]}]:(a=(s||{}).list,Array.isArray(a)&&a.forEach((function(e){var n=e.messageUId;t[n]=e;})),[2,{code:0,data:t}])}}))}))},t.prototype._pullOperateStatusNotify=function(e){if(this._channel){var t=this._channel.codec.decodeByPBName(e.data,Wi),n=t.conversationType,i=t.info,r=t.summary;kt$1.info("s_opNtf -> type: ".concat(n,", info: ").concat(i,", summary: ").concat(r)),this._watcher.operateStatus(t);}},t.prototype.expandUltraMessage=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r;return V$1(this,(function(o){switch(o.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:(t=this._channel.codec.encodeExpandUltraMessage(e,this.currentUserId),(n=new ho$1(yo$1[yo$1.upMsgEx],t,e.targetId)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(n)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return i=o.sent(),r=i.code,i.data,r!==z$1.SUCCESS?[2,{code:r,msg:z$1[r]}]:[2,{code:r}]}}))}))},t.prototype.modifyMessage=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s;return V$1(this,(function(a){switch(a.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:(t=this._channel.codec.encodemodifyMessage(e,this.currentUserId),(n=new ho$1(yo$1[yo$1.modifyMsg],t,e.targetId)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(n)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return i=a.sent(),r=i.code,o=i.data,r!==z$1.SUCCESS?[2,{code:r,msg:z$1[r]}]:(s=o,this._ultraMsgMap[s.messageUId]=s.timestamp,[2,{code:r}])}}))}))},t.prototype._pullUltraChangeMessageList=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l;return V$1(this,(function(h){switch(h.label){case 0:return this._channel?this._status!==ee$1.CONNECTED||this._isPullingUltraChangeMessage?[2]:(this._isPullingUltraChangeMessage=!0,t=this._channel.codec.encodeQueryMsgChange(e),(n=new ho$1(yo$1[yo$1.qryMsgChange],t,this.currentUserId)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(n,Hi)]):[2];case 1:return i=h.sent(),r=i.code,o=i.data,this._isPullingUltraChangeMessage=!1,r===z$1.SUCCESS&&o?(s=o.hasNext,a=o.list,c=(null==o?void 0:o.syncTime)||0,this._ultraChannelTypeChangeNotice(a),this._ultraChannelUserKickedNotice(a),this._ultraChannelDeleteNotice(a),this._ultraRecalledNotice(a),this._ultraMsgUpdateNotice([Re$1.MSG_EXPANSION,Re$1.MSG_MODIFY],a),u=this._pullUltraChangeMessageQue.filter((function(e){return e>c})),this._pullUltraChangeMessageQue.length=0,(l=this._pullUltraChangeMessageQue).push.apply(l,u),s?this._pullUltraChangeMessageList(c):this._lastPullingUltraChangeMessageTime=c,[2]):[2]}}))}))},t.prototype._ultraChannelTypeChangeNotice=function(e){var t=this,n=[];e.forEach((function(e){var i=e.targetId,r=e.changeType,o=e.subChangeType,s=e.channelId,a=void 0===s?"":s;if(r===Re$1.CHANNEL_CHANGE&&t._ultraGroupMap["".concat(a,"_").concat(i)]){var c=Se$1.PUBLIC_TO_PRIVATE,u=Se$1.PRIVATE_TO_PUBLIC,l=Se$1.PUBLIC_TO_PRIVATE_USER_NOT_IN;o===u&&(t._ultraGroupMap["".concat(a,"_").concat(i)].channelType=Ie$1.PUBLIC),o===c&&(t._ultraGroupMap["".concat(a,"_").concat(i)].channelType=Ie$1.PRIVATE);var h=t._ultraGroupMap["".concat(a,"_").concat(i)].channelType,d=void 0===h?Ie$1.PUBLIC:h;[c,u,l].includes(o)&&n.push({targetId:i,channelId:a,changeType:o,channelType:d}),o===l&&delete t._ultraGroupMap["".concat(a,"_").concat(i)];}})),n.length>0&&this._watcher.ultraGroupChannelChangeType(n);},t.prototype._ultraChannelDeleteNotice=function(e){var t=this,n=[];Array.isArray(e)&&e.forEach((function(e){var i=e.targetId,r=e.sendTime,o=e.changeType,s=e.subChangeType,a=e.channelId,c=void 0===a?"":a;if(o===Re$1.CHANNEL_CHANGE&&t._ultraGroupMap["".concat(c,"_").concat(i)]){var u=t._ultraGroupMap["".concat(c,"_").concat(i)].channelType,l=void 0===u?Ie$1.PUBLIC:u;s===Se$1.CHANNEL_DELETE&&(n.push({targetId:i,channelId:c,channelType:l,deleteTime:r}),delete t._ultraGroupMap["".concat(c,"_").concat(i)]);}})),n.length>0&&this._watcher.ultraGroupChannelDelete(n);},t.prototype._ultraChannelUserKickedNotice=function(e){var t=this,n=[];e.forEach((function(e){var i=e.targetId,r=e.changeType,o=e.operatorId,s=e.subChangeType,a=e.channelId,c=void 0===a?"":a;r===Re$1.CHANNEL_CHANGE&&t._ultraGroupMap["".concat(c,"_").concat(i)]&&(s===Se$1.CHANNEL_USER_KICKED&&n.push({targetId:i,channelId:c,userId:o,channelType:Ie$1.PRIVATE}),o===t.currentUserId&&s===Se$1.CHANNEL_USER_KICKED&&delete t._ultraGroupMap["".concat(c,"_").concat(i)]);})),n.length>0&&this._watcher.ultraGroupChannelUserKicked(n);},t.prototype._ultraRecalledNotice=function(e){var t=this,n=[];e.forEach((function(e){var i=e.targetId,r=e.conversationType,o=e.sendTime,s=e.messageUId,a=e.changeType,c=e.operatorId,u=e.channelId,l=void 0===u?"":u;a===Re$1.MSG_RECALL&&(t._updateUltraGroupWhenRecallMsg(i,l,s,o),n.push({targetId:i,conversationType:r,sendTime:o,messageUId:s,senderUserId:c,channelId:l}));})),n.length>0&&this._watcher.ultraGroupMessageRecalled(n);},t.prototype._ultraMsgUpdateNotice=function(e,t){var n=this;if(!!t.find((function(t){return e.includes(t.changeType)}))){var i={};t.forEach((function(t){var r=t.targetId,o=t.conversationType,s=t.sendTime,a=t.messageUId,c=t.changeType,u=t.channelId,l=void 0===u?"":u,h="".concat(o,"_").concat(r),d="".concat(a,"_").concat(l,"_").concat(s),f=i[h];if(f)f.add(d);else {var p=new Set([d]);i[h]=p;}e.includes(c)&&(n._ultraMsgChangeMap[a]=c);}));var r=function(e){var t=e.split("_"),n=t.shift(),r=t.join("_"),s=i[e],a=[];s.forEach((function(e){var t=e.split("_"),n=t[0],i=t[1],r=t[2];a.push({sendTime:Number(r),messageUId:n,channelId:i});}));var c={targetId:r,conversationType:Number(n),messages:a};o._pullUltraMessageList(c);},o=this;for(var s in i)r(s);}},t.prototype._pullUltraMessageList=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u=this;return V$1(this,(function(l){switch(l.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:(t=this._channel.codec.encodeMsgQuery(e),(n=new ho$1(yo$1[yo$1.qryMsg],t,this.currentUserId)).setHeaderQos(qt$1.AT_LEAST_ONCE),[4,this._channel.send(n,ji,{connectedTime:this._channel.connectedTime,currentUserId:this.currentUserId})]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return i=l.sent(),r=i.code,o=i.data,r!==z$1.SUCCESS?[2,{code:r,msg:z$1[r]}]:(s=(o||{}).list,a=[],c=[],Array.isArray(s)&&s.forEach((function(e){var t=e.targetId,n=e.channelId,i=e.messageUId,r=u._ultraGroupMap["".concat(n,"_").concat(t)];r&&r.latestMessage.messageUId===e.messageUId&&(r.latestMessage=e);var o=u._ultraMsgChangeMap["".concat(i)];o===Re$1.MSG_EXPANSION?a.push(e):o===Re$1.MSG_MODIFY&&c.push(e);})),a.length>0&&this._watcher.ultraGroupMessageExpansionUpdated(a||[]),c.length>0&&this._watcher.ultraGroupMessageModified(c||[]),[2])}}))}))},t.prototype.getUltraHistoryMsg=function(e,t,n){var i;return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u;return V$1(this,(function(l){switch(l.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:(r=this._channel.codec.encodeGetHistoryMsg(e,t),o=new ho$1(yo$1[yo$1.qryUgMsg],r,this.currentUserId),Tt$1(pe$1.L_GET_HISTORY_MSG_T,{targetId:e,conversationType:X$1.ULTRA_GROUP,channelId:t.channelId,timestamp:null==t?void 0:t.timestamp,count:null==t?void 0:t.count},{traceId:n}),[4,this._channel.send(o,Vn$1,{currentUserId:this.currentUserId,conversation:{conversationType:X$1.ULTRA_GROUP,targetId:e}})]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return s=l.sent(),a=s.code,c=s.data,a===z$1.SUCCESS&&c?(u=[],null===(i=c.list)||void 0===i||i.forEach((function(e){e&&u.push(e.messageUId);})),Tt$1(pe$1.L_GET_HISTORY_MSG_R,{code:a,messageUIds:u.join(",")},{traceId:n}),[2,{code:a,data:c}]):(It$1(pe$1.L_GET_HISTORY_MSG_R,{code:a,messageUIds:""},{traceId:n}),kt$1.warn("get super history message  failed, code:",a,", data:",c),[2,{code:a}])}}))}))},t.prototype.searchUltraGroupMessages=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:[2,{code:z$1.SUCCESS}]:[2,{code:z$1.RC_NET_CHANNEL_INVALID}]}))}))},t.prototype.setUltraGroupDefaultNotificationLevel=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return this._isUltraGroupListExist?(i=this._channel)?(r=i.codec.encodeSetUltraGroupDefaultNotificationLevel(t,n),o=new ho$1(yo$1[yo$1.ugUnpushSet],r,e),[4,i.send(o)]):[3,2]:[2,Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE})];case 1:return s=c.sent(),a=s.code,z$1.SUCCESS,[2,{code:a}];case 2:return [2,{code:z$1.RC_NET_CHANNEL_INVALID}]}}))}))},t.prototype.getUltraGroupDefaultNotificationLevel=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return this._isUltraGroupListExist?(n=this._channel)?(i=n.codec.encodeGetUltraGroupDefaultNotificationLevel(t),r=new ho$1(yo$1[yo$1.ugUnpushQuery],i,e),[4,n.send(r,Ni)]):[3,2]:[2,Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE})];case 1:return o=u.sent(),s=o.code,a=o.data,s===z$1.SUCCESS&&a?(c=a.unpushLevel,[2,{code:s,data:c}]):[2,{code:s}];case 2:return [2,{code:z$1.RC_NET_CHANNEL_INVALID}]}}))}))},t.prototype._updateUltraGroupWhenRecallMsg=function(e,t,n,i){var r="".concat(t,"_").concat(e);if(this._ultraGroupMap[r]){var o=this._ultraGroupMap[r],s=o.latestMessage;o.lastReadTime,s&&s.messageUId===n&&(o.latestMessage=null);}},t.prototype.getAllConversationState=function(){return Promise.resolve({code:z$1.SUCCESS,data:this._conversationManager.getAllConversationState()})},t.prototype.getUltraGroupUnreadMentionedMessages=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:this._isUltraGroupListExist?(t=this._channel.codec.encodeUnreadMentionedMsgQuery(e),n=new ho$1(yo$1[yo$1.qryUgUal],t,this.currentUserId),[4,this._channel.send(n,Oi)]):[2,Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE})]:[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return i=s.sent(),r=i.code,o=i.data,r===z$1.SUCCESS&&o?[2,{code:r,data:o}]:[2,{code:r}]}}))}))},t.prototype.getUltraGroupFirstUnreadMessageTimestamp=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r;return V$1(this,(function(o){return this._channel?this._status!==ee$1.CONNECTED?[2,{code:z$1.RC_NET_UNAVAILABLE}]:this._isUltraGroupListExist?(t=e.targetId,n=e.channelId,i=this._ultraGroupMap["".concat(n,"_").concat(t)]||{},r=i.firstUnreadMessage||null,[2,{code:z$1.SUCCESS,data:r}]):[2,Promise.resolve({code:z$1.METHOD_NOT_AVAILABLE})]:[2,{code:z$1.RC_NET_CHANNEL_INVALID}]}))}))},t.prototype.bindRTCRoomForChatroom=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r;return V$1(this,(function(o){switch(o.label){case 0:return this._channel?(t=e.chatRoomId,n=this._channel.codec.encodebindRTCRoomForChatroom(e),i=new ho$1(yo$1[yo$1.setRtcRoomId],n,t),[4,this._channel.send(i)]):[2,z$1.RC_NET_CHANNEL_INVALID];case 1:return r=o.sent(),[2,r.code]}}))}))},t.prototype.rtcSignaling=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c;return V$1(this,(function(u){switch(u.label){case 0:return this._channel?(r=i instanceof ArrayBuffer?Array.prototype.slice.call(new Int8Array(i)):i,o=n?new ho$1(t,r,e):new co$1(t,r,e),[4,this._channel.send(o)]):[2,{code:z$1.RC_NET_CHANNEL_INVALID}];case 1:return s=u.sent(),a=s.code,c=s.data,[2,{code:a,buffer:null==c?void 0:c.data}]}}))}))},t.prototype.rtcPing=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i;return V$1(this,(function(r){switch(r.label){case 0:return i=es(this.rtcCodec,t,n),[4,this.rtcSignaling(e,yo$1[yo$1.rtcPing],!0,i)];case 1:return [2,r.sent().code]}}))}))},t.prototype.getDeviceId=function(){return Nt$1(this.runtime)},t.prototype.getOSInfo=function(){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return [2,{code:z$1.NOT_SUPPORT}]}))}))},t.prototype.getProcessInfo=function(){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return [2,{code:z$1.NOT_SUPPORT}]}))}))},t.prototype.getMainProcessInfo=function(){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return [2,{code:z$1.NOT_SUPPORT}]}))}))},t.prototype.callExtra=function(e){return Promise.resolve({code:z$1.EXTRA_METHOD_UNDEFINED})},t.prototype.getConversationListWithAllChannel=function(){throw new Error("Method not implemented.")},t.prototype.getConversationListWithAllChannelByPage=function(e,t){throw new Error("Method not implemented.")},t.prototype.getConversationsByPage=function(e,t,n,i){throw new Error("Method not implemented.")},t.prototype.getHistoryMessagesByObjectNames=function(e,t,n,i,r,o,s){throw new Error("Method not implemented.")},t.prototype.clearConversations=function(){throw new Error("Method not implemented.")},t.prototype.setUserStatusListener=function(e,t){throw new Error("Method not implemented.")},t.prototype.setUserStatus=function(e){throw new Error("Method not implemented.")},t.prototype.subscribeUserStatus=function(e){throw new Error("Method not implemented.")},t.prototype.getUserStatus=function(e){throw new Error("Method not implemented.")},t.prototype.addToBlacklist=function(e){throw new Error("Method not implemented.")},t.prototype.removeFromBlacklist=function(e){throw new Error("Method not implemented.")},t.prototype.getBlacklist=function(){throw new Error("Method not implemented.")},t.prototype.getBlacklistStatus=function(e){throw new Error("Method not implemented.")},t.prototype.insertMessage=function(e,t,n){throw new Error("Method not implemented.")},t.prototype.deleteMessages=function(e){throw new Error("Method not implemented.")},t.prototype.deleteMessagesByTimestamp=function(e,t,n,i,r){throw new Error("Method not implemented.")},t.prototype.clearMessages=function(e,t,n){throw new Error("Method not implemented.")},t.prototype.getMessage=function(e){throw new Error("Method not implemented.")},t.prototype.setMessageContent=function(e,t,n){throw new Error("Method not implemented.")},t.prototype.setMessageSearchField=function(e,t,n){throw new Error("Method not implemented.")},t.prototype.searchConversationByContent=function(e,t,n,i){throw new Error("Method not implemented.")},t.prototype.searchConversationByContentWithAllChannel=function(e,t,n){throw new Error("Method not implemented.")},t.prototype.searchMessageByContent=function(e,t,n,i,r,o){throw new Error("Method not implemented.")},t.prototype.searchMessageByContentWithAllChannel=function(e,t,n,i,r){throw new Error("Method not implemented.")},t.prototype.searchMessageByContentInTimeRangeWithAllChannel=function(e,t,n,i,r,o,s){throw new Error("Method not implemented.")},t.prototype.getUnreadMentionedMessages=function(e,t){throw new Error("Method not implemented.")},t.prototype.setMessageSentStatus=function(e,t){throw new Error("Method not implemented.")},t.prototype.updateMessageReceiptStatus=function(e,t,n,i){throw new Error("Method not implemented.")},t.prototype.setMessageReceivedStatus=function(e,t){throw new Error("Method not implemented.")},t.prototype.clearData=function(){throw new Error("Method not implemented.")},t.prototype.clearUnreadCountByTimestamp=function(e,t,n,i){throw new Error("Method not implemented.")},t}(ns),xs=function(e){function t(){return null!==e&&e.apply(this,arguments)||this}return b$1(t,e),t.prototype.joinRTCRoom=function(e,t,n,i,r,o){return this._context.joinRTCRoom(e,t,n,i,r,o)},t.prototype.quitRTCRoom=function(e){return this._context.quitRTCRoom(e)},t.prototype.rtcPing=function(e,t,n){return this._context.rtcPing(e,t,n)},t.prototype.getRTCRoomInfo=function(e){return this._context.getRTCRoomInfo(e)},t.prototype.getRTCUserInfoList=function(e){return this._context.getRTCUserInfoList(e)},t.prototype.getRTCUserInfo=function(e){return this._context.getRTCUserInfo(e)},t.prototype.setRTCUserInfo=function(e,t,n){return this._context.setRTCUserInfo(e,t,n)},t.prototype.removeRTCUserInfo=function(e,t){return this._context.removeRTCUserInfo(e,t)},t.prototype.setRTCData=function(e,t,n,i,r,o){return this._context.setRTCData(e,t,n,i,r,o)},t.prototype.setRTCTotalRes=function(e,t,n,i,r){return this._context.setRTCTotalRes(e,t,n,i,r)},t.prototype.setRTCCDNUris=function(e,t,n){return this._context.setRTCCDNUris(e,t,n)},t.prototype.getRTCData=function(e,t,n,i){return this._context.getRTCData(e,t,n,i)},t.prototype.removeRTCData=function(e,t,n,i,r){return this._context.removeRTCData(e,t,n,i,r)},t.prototype.setRTCOutData=function(e,t,n,i){return this._context.setRTCOutData(e,t,n,i)},t.prototype.getRTCOutData=function(e,t){return this._context.getRTCOutData(e,t)},t.prototype.getRTCToken=function(e,t,n){return this._context.getRTCToken(e,t,n)},t.prototype.setRTCState=function(e,t){return this._context.setRTCState(e,t)},t.prototype.getRTCUserList=function(e){return this._context.getRTCUserList(e)},t.prototype.joinLivingRoomAsAudience=function(e,t,n){return this._context.joinLivingRoomAsAudience(e,t,n)},t.prototype.quitLivingRoomAsAudience=function(e){return this._context.quitLivingRoomAsAudience(e)},t.prototype.rtcIdentityChange=function(e,t,n){return this._context.rtcIdentityChange(e,t,n)},t.prototype.requestRoomPK=function(e){return this._context.requestRoomPK(e)},t.prototype.cancelRoomPK=function(e){return this._context.cancelRoomPK(e)},t.prototype.responseRoomPK=function(e){return this._context.responseRoomPK(e)},t.prototype.endRoomPK=function(e){return this._context.endRoomPK(e)},t.prototype.registerRTCSignalListener=function(e){this._context.registerRTCSignalingListener(e);},t.prototype.rtcSignaling=function(e,t,n,i){return this._context.rtcSignaling(e,t,n,i)},t.prototype.getRTCJoinedUserInfo=function(e){return this._context.getRTCJoinedUserInfo(e)},t}(cs);function Fs(e){return P$1({},e)}var Ks,Hs=function(){function e(e,t){var n;this._runtime=e,this._token="",this._pluginContextQueue=[],this._pluginInstanseMap={},this.coreVersion="5.5.5",this._versionInfo={},this._typingInfo={},this._isInternalConnected=!1,this._connectionStatus=ee$1.DISCONNECTED,this._canRedirectConnect=!1,this._watcher={message:void 0,batchMessage:void 0,conversationState:void 0,chatroomState:void 0,connectionState:void 0,rtcInnerWatcher:void 0,expansion:void 0,tag:void 0,conversationTagChanged:void 0,pullFinished:void 0,onConnecting:void 0,onConnected:void 0,onDisconnect:void 0,onSuspend:void 0,readReceiptReceived:void 0,messageReceiptRequest:void 0,messageReceiptResponse:void 0,typingState:void 0,messageBlocked:void 0,ultraGroupEnable:void 0,operateStatus:void 0,ultraGroupMessageExpansionUpdated:void 0,ultraGroupMessageModified:void 0,ultraGroupMessageRecalled:void 0,ultraGroupChannelChangeType:void 0,ultraGroupChannelUserKicked:void 0,ultraGroupChannelDelete:void 0},this._typingInternalTimer=-1,this._typingExpireTime=2e3,this._typingChangedList=[],this._registerMessageSearchPropsMapping={},this.getChatRoomHistoryMessages=this.getChatroomHistoryMessages,this._options=P$1({},t),this.appkey=this._options.appkey,this.apiVersion=this._options.apiVersion,this.apiPKGName=this._options.apiPKGName||"",this._options.typingExpireTime&&(this._options.typingExpireTime<2e3?this._typingExpireTime=2e3:this._options.typingExpireTime>6e3?this._typingExpireTime=6e3:this._typingExpireTime=this._options.typingExpireTime),this._options.navigators=this._options.navigators.filter((function(e){return /^https?:\/\//.test(e)})),this._options.navigators=this._options.navigators.map((function(e){return e.replace(/\/$/g,"")})),0===this._options.navigators.length&&(n=this._options.navigators).push.apply(n,a),Qr({bundleId:this.apiPKGName}),function(e){yt$1=At$1.init(P$1(P$1({},e),{sessionId:ot$1})),Dt$1();}({runtime:this._runtime,logSwitch:1,logPolicy:JSON.parse("{}"),appkey:this.appkey,version:this.apiVersion});var i={status:this._connectionStatusListener.bind(this),batchMessage:this._batchMessageReceiver.bind(this),chatroom:this._chatroomInfoListener.bind(this),conversation:this._conversationInfoListener.bind(this),expansion:this._expansionInfoListener.bind(this),tag:this._tagListener.bind(this),conversationTag:this._conversationTagListener.bind(this),onRTCDataChange:this._rtcDataChange.bind(this),pullFinished:this._pullFinishedListener.bind(this),ultraGroupEnable:this._ultraGroupEnableListener.bind(this),operateStatus:this._operateStatusListener.bind(this),ultraGroupMessageExpansionUpdated:this._ultraGroupMessageExpansionUpdatedListener.bind(this),ultraGroupMessageModified:this._ultraGroupMessageModifiedListener.bind(this),ultraGroupMessageRecalled:this._ultraGroupMessageRecalledListener.bind(this),ultraGroupChannelChangeType:this._ultraGroupChannelChangeTypeListener.bind(this),ultraGroupChannelUserKicked:this._ultraGroupChannelUserKickedListener.bind(this),ultraGroupChannelDelete:this._ultraGroupChannelDeleteListener.bind(this),onNaviDataChange:this._naviDataChange.bind(this)};this._rtcCodec=this.createCodec(Yo,jo),this._engine=fn$1()?new RCCppEngine(e,this._rtcCodec,i,this._options):new Bs(e,this._rtcCodec,i,this._options);}return e.init=function(t,n){return mt$1({customLogPrint:n.logStdout,localLogLevel:n.logLevel}),kt$1.setLogLevel(n.logLevel),kt$1.setLogStdout(n.logStdout),Tt$1(pe$1.L_INIT_O,{appkey:n.appkey,navigators:n.navigators,connectionType:n.connectionType,logLevel:n.logLevel,typingExpireTime:n.typingExpireTime}),!1===n.indexDBSwitch&&(tt$1.indexDBSwitch=!1),Tt$1(pe$1.L_IMSDK_VER_O,{commitId:"5e3050d31ddf15dafa75b1604b3d5cf2eeeede0e",version:"5.5.5"}),kt$1.debug("APIContext.init =>",n.appkey,n.navigators),this._context?(kt$1.error("Repeat initialize!"),this._context):(kt$1.warn("RCEngine Commit:","5e3050d31ddf15dafa75b1604b3d5cf2eeeede0e"),this._context=new e(t,n),this._context)},e.destroy=function(){this._context&&(this._context._destroy(),this._context=void 0);},e.prototype.createCodec=function(e,t){return "comet"!==this._options.connectionType||fn$1()?new rs(e,t):new os(e)},e.prototype.install=function(e,t){if(this._pluginInstanseMap[e.tag])return kt$1.warn("Repeat install plugin: ".concat(e.tag)),this._pluginInstanseMap[e.tag];var n="RCRTC"===e.tag?new xs(this):new cs(this),i=null;try{if(!e.verify(this._runtime))return null;i=e.setup(n,this._runtime,t);}catch(e){kt$1.error("install plugin error!\n",e);}return ["RCRTC","RCCall"].includes(e.tag)&&e.version&&e.name&&(this._versionInfo[e.name]=e.version),i&&(this._pluginContextQueue.push(n),this._pluginInstanseMap[e.tag]=i),i},e.prototype._handleRedirect=function(){return D$1(this,void 0,void 0,(function(){var e,t=this;return V$1(this,(function(n){switch(n.label){case 0:return kt$1.debug("_handleRedirct",this._token),[4,this.connect(this._token,!0)];case 1:return (e=n.sent().code)!==z$1.SUCCESS&&this._canRedirectConnect&&(this._handleSuspend(e),setTimeout((function(){t._handleRedirect();}),5e3)),[2]}}))}))},e.prototype._connectionStatusListener=function(e){var t,n,i,r;return D$1(this,void 0,void 0,(function(){return V$1(this,(function(o){switch(Tt$1(pe$1.L_CONNECT_S,{status:e}),[ee$1.REDIRECT,ee$1.BLOCKED,ee$1.KICKED_OFFLINE_BY_OTHER_CLIENT,ee$1.DISCONNECT_BY_SERVER,ee$1.DISCONNECTED,ee$1.NETWORK_UNAVAILABLE].includes(e)&&(Jr(mo$1.IM_CONNECTION_DURATION,{endTime:(new Date).getTime(),code:e}),function(e){D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u;return V$1(this,(function(l){switch(l.label){case 0:t=mo$1.IM_CONNECTION_DURATION,n=Wr().bundleId,i=zr(t),r=i.startTime,o=i.endTime,s=i.code,a=qr.UNKONWN,l.label=1;case 1:return l.trys.push([1,3,,4]),[4,e.getNetworkType()];case 2:return a=l.sent(),[3,4];case 3:return c=l.sent(),kt$1.debug(c.message),[3,4];case 4:return u=0,Ve$1(r)&&Ve$1(o)&&o>r&&r&&(u=o-r),Kr(t,{bid:n,cod:s,dur:u,net:a}),[2]}}))}));}(this._runtime)),this._connectionStatus=e,e){case ee$1.REDIRECT:this._canRedirectConnect=!0,this._handleSuspend(e),this._handleRedirect();break;case ee$1.BLOCKED:case ee$1.KICKED_OFFLINE_BY_OTHER_CLIENT:case ee$1.DISCONNECT_BY_SERVER:case ee$1.FORBID_RECONNECT_BY_OTHER_SAME_CLIENT:this._canRedirectConnect=!1,this._handleDisconnect(e);break;case ee$1.CONNECTING:this._handleConnecting();break;case ee$1.CONNECTED:this._handleConnected();break;case ee$1.DISCONNECTED:this._handleDisconnect(e);break;default:this._handleSuspend(e);}return null===(n=null===(t=this._watcher.rtcInnerWatcher)||void 0===t?void 0:t.status)||void 0===n||n.call(t,e),this._pluginContextQueue.forEach((function(t){var n;null===(n=t.onconnectionstatechange)||void 0===n||n.call(t,e);})),null===(r=(i=this._watcher).connectionState)||void 0===r||r.call(i,e),[2]}))}))},e.prototype._handleConnecting=function(){this._watcher.onConnecting&&this._watcher.onConnecting();},e.prototype._handleConnected=function(){this._watcher.onConnected&&this._watcher.onConnected();},e.prototype._handleDisconnect=function(e){this._watcher.onDisconnect&&this._watcher.onDisconnect(e);},e.prototype._handleSuspend=function(e){this._watcher.onSuspend&&this._watcher.onSuspend(e);},e.prototype._messageReceiver=function(e,t,n){var i,r,o,s,a;if((e.conversationType===X$1.RTC_ROOM||Object.prototype.hasOwnProperty.call(be$1,e.messageType))&&this._watcher.rtcInnerWatcher&&this._watcher.rtcInnerWatcher.message)this._watcher.rtcInnerWatcher.message(Fs(e));else if(-1===["RC:ChrmJoinNtf","RC:ChrmQuitNtf"].indexOf(e.messageType)||"function"!=typeof this._watcher.chatroomState){if("RC:ChrmMemChange"!==e.messageType){if(e.messageType!==ie$1.TYPING_STATUS||(this._addTypingInfo(Fs(e)),!this._watcher.typingState)){if(e.messageType===ie$1.LOG_COMMAND&&"rongcloudsystem"===e.senderUserId){var c=e.content,u=c.startTime,l=c.endTime,h=c.platform,d=c.logId,f=c.uri,p=c.packageName,g={startTime:parseInt(u,10),endTime:parseInt(l,10),platform:h,logId:d,uri:f,packageName:p};return Tt$1(pe$1.L_REPORT_FULL_LOG_O,g),void(null===(r=At$1.getInstance())||void 0===r||r.reportFullLog(g))}if(e.messageType!==ie$1.INTERCEPT){if(!this._pluginContextQueue.some((function(t){if(!t.onmessage)return !1;try{return t.onmessage(Fs(e))}catch(e){return kt$1.error("plugin error =>",e),!1}})))if(null===(s=(o=this._watcher).message)||void 0===s||s.call(o,Fs(e),t,n),"RC:ReadNtf"!==e.messageType)if("RC:RRReqMsg"!==e.messageType){if("RC:RRRspMsg"!==e.messageType)return e;var _=null===(a=e.content)||void 0===a?void 0:a.receiptMessageDic,m=this._engine.getCurrentUserId();_&&Array.isArray(_[m])&&"function"==typeof this._watcher.messageReceiptResponse&&this._watcher.messageReceiptResponse({conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId},e.senderUserId,_[m]);}else "function"==typeof this._watcher.messageReceiptRequest&&this._watcher.messageReceiptRequest({conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId},e.content.messageUId,e.senderUserId);else "function"==typeof this._watcher.readReceiptReceived&&this._watcher.readReceiptReceived({conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId},e.content.messageUId,e.content.lastMessageSendTime);}else {var v={conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId||"",blockType:e.content.interceptType,blockedMessageUId:e.content.msgUId,extra:e.content.extra};if(e.conversationType===X$1.ULTRA_GROUP){var y=e.content.sourceType;if(v.sourceType=y,(y===ve$1.MSG_EXPANSION||y===ve$1.MSG_MODIFY)&&e.content.sourceContent)try{v.sourceContent=JSON.parse(e.content.sourceContent);}catch(e){It$1(pe$1.L_CALLBACK_E,{source:"message.content.sourceContent",msg:e.message});}}this._MessageBlockedListener(v);}}}else if("function"==typeof this._watcher.chatroomState){var E={};Array.isArray(e.content.userList)&&e.content.userList.forEach((function(e){E[e.userId]=e.status;})),this._watcher.chatroomState({userChange:{users:E,chatroomId:e.targetId}});}}else this._watcher.chatroomState({userChange:{users:(i={},i[e.senderUserId]="RC:ChrmQuitNtf"===e.messageType?ye$1.QUIT:ye$1.JOIN,i),chatroomId:e.targetId}});},e.prototype._batchMessageReceiver=function(e,t,n){var i=this,r=[];e.forEach((function(e){var o=i._messageReceiver(e,t,n);o&&r.push(o);})),r.length&&this._watcher.batchMessage&&(kt$1.info("pullMsg apiContext filtered -> ".concat(JSON.stringify(r.map((function(e){return e.messageUId}))))),this._watcher.batchMessage(r));},e.prototype._chatroomInfoListener=function(e){var t,n;null===(n=(t=this._watcher).chatroomState)||void 0===n||n.call(t,e);},e.prototype._conversationInfoListener=function(e){var t,n;null===(n=(t=this._watcher).conversationState)||void 0===n||n.call(t,e);},e.prototype._expansionInfoListener=function(e){var t,n;null===(n=(t=this._watcher).expansion)||void 0===n||n.call(t,e);},e.prototype._tagListener=function(){var e,t;null===(t=(e=this._watcher).tag)||void 0===t||t.call(e);},e.prototype._conversationTagListener=function(){var e,t;null===(t=(e=this._watcher).conversationTagChanged)||void 0===t||t.call(e);},e.prototype._typingStatusListener=function(e){var t,n;null===(n=(t=this._watcher).typingState)||void 0===n||n.call(t,e);},e.prototype._pullFinishedListener=function(){var e,t;null===(t=(e=this._watcher).pullFinished)||void 0===t||t.call(e);},e.prototype._MessageBlockedListener=function(e){var t,n;null===(n=(t=this._watcher).messageBlocked)||void 0===n||n.call(t,e);},e.prototype._ultraGroupEnableListener=function(e){var t,n;null===(n=(t=this._watcher).ultraGroupEnable)||void 0===n||n.call(t,e);},e.prototype._operateStatusListener=function(e){var t,n;null===(n=(t=this._watcher).operateStatus)||void 0===n||n.call(t,e);},e.prototype._ultraGroupMessageExpansionUpdatedListener=function(e){var t,n;null===(n=(t=this._watcher).ultraGroupMessageExpansionUpdated)||void 0===n||n.call(t,e);},e.prototype._ultraGroupMessageModifiedListener=function(e){var t,n;null===(n=(t=this._watcher).ultraGroupMessageModified)||void 0===n||n.call(t,e);},e.prototype._ultraGroupMessageRecalledListener=function(e){var t,n;null===(n=(t=this._watcher).ultraGroupMessageRecalled)||void 0===n||n.call(t,e);},e.prototype._ultraGroupChannelChangeTypeListener=function(e){var t,n;null===(n=(t=this._watcher).ultraGroupChannelChangeType)||void 0===n||n.call(t,e);},e.prototype._ultraGroupChannelUserKickedListener=function(e){var t,n;null===(n=(t=this._watcher).ultraGroupChannelUserKicked)||void 0===n||n.call(t,e);},e.prototype._ultraGroupChannelDeleteListener=function(e){var t,n;null===(n=(t=this._watcher).ultraGroupChannelDelete)||void 0===n||n.call(t,e);},e.prototype._rtcDataChange=function(e,t){this._pluginContextQueue.forEach((function(n){var i;null===(i=n.onrtcdatachange)||void 0===i||i.call(n,e,t);}));},e.prototype._naviDataChange=function(e){Zo(this.appkey,this._getTokenWithoutNavi(),e,this._runtime.localStorage),this._pluginContextQueue.forEach((function(t){var n;null===(n=t.onnavidatachange)||void 0===n||n.call(t,e);}));},e.prototype.assignWatcher=function(e){var t=this;Object.keys(this._watcher).forEach((function(n){if(Object.prototype.hasOwnProperty.call(e,n)){var i=e[n];t._watcher[n]=Ke$1(i)||Fe$1(i)?i:void 0;}}));},e.prototype.resetWatcher=function(){var e=this;Object.keys(this._watcher).forEach((function(t){e._watcher[t]=void 0;}));},e.prototype._addTypingInfo=function(e){var t=e.senderUserId,n=e.conversationType,i=e.targetId,r=e.content,o=e.channelId,s=r.typingContentType,a=o||"",c="".concat(n,"#").concat(i,"#").concat(a);this._typingInfo[c]||(this._typingInfo[c]=[]);var u=this._typingInfo[c].findIndex((function(e){return e.userId===t}));u>=0&&this._typingInfo[c][u].messageType===s?this._typingInfo[c][u].timestamp=Date.now():(u>=0&&this._typingInfo[c].splice(u,1),this._typingInfo[c].push({userId:t,messageType:s,timestamp:Date.now()}),this._typingChangedList.includes(c)||this._typingChangedList.push(c),this._startCheckTypingInfo());},e.prototype._startCheckTypingInfo=function(){var e=this;-1===this._typingInternalTimer&&0!==Object.keys(this._typingInfo).length&&(this._typingInternalTimer=setInterval((function(){for(var t in e._typingInfo){var n=e._typingInfo[t].length;e._typingInfo[t]=e._typingInfo[t].filter((function(t){return Date.now()-t.timestamp<e._typingExpireTime})),e._typingInfo[t].length===n||e._typingChangedList.includes(t)||e._typingChangedList.push(t),0===e._typingInfo[t].length&&delete e._typingInfo[t];}if(e._typingChangedList.length>0){var i=e._typingChangedList.map((function(t){return {conversationType:Number(t.split("#")[0]),targetId:t.split("#")[1],channelId:t.split("#")[2],list:e._typingInfo[t]||[]}}));e._typingStatusListener(i),e._typingChangedList=[];}0===Object.keys(e._typingInfo).length&&(clearInterval(e._typingInternalTimer),e._typingInternalTimer=-1);}),500));},e.prototype.getConnectedTime=function(){return this._engine.getConnectedTime()},e.prototype.getServerTime=function(){return this._engine.getServerTime()},e.prototype.getDeviceId=function(){return this._engine.getDeviceId()},e.prototype.getCurrentUserId=function(){return this._engine.getCurrentUserId()},e.prototype.getConnectionStatus=function(){return this._connectionStatus},Object.defineProperty(e.prototype,"token",{get:function(){return this._token},enumerable:!1,configurable:!0}),e.prototype.connect=function(e,t,n,i){var r,o;return void 0===t&&(t=!1),D$1(this,void 0,void 0,(function(){var s,a,c,u,l,h;return V$1(this,(function(d){switch(d.label){case 0:return this._connectionStatus===ee$1.CONNECTED?[2,{code:z$1.SUCCESS,userId:this._engine.getCurrentUserId()}]:this._connectionStatus===ee$1.CONNECTING?[2,{code:z$1.BIZ_ERROR_CONNECTING}]:"string"!=typeof e||0===e.length?[2,{code:z$1.RC_CONN_USER_OR_PASSWD_ERROR}]:(this._token=e,[4,this.reqNaviInfo(t,i)]);case 1:return s=d.sent(),a=s.code,c=s.data,a!==z$1.SUCCESS?[2,{code:a}]:(Tt$1(pe$1.L_ENV_S,{isEnterprise:1===(null==c?void 0:c.type)},{traceId:i}),1===(null==c?void 0:c.type)?[2,{code:z$1.PACKAGE_ENVIRONMENT_ERROR}]:(u=Kt$1.getInfo(),Tt$1(pe$1.L_CONNECT_T,{token:e,refreshNavi:t,reconnectKickEnable:n},{traceId:i}),[4,this._engine.connect(this._getTokenWithoutNavi(),c,n,i)]));case 2:return l=d.sent(),(l===z$1.SUCCESS?Tt$1:It$1)(pe$1.L_CONNECT_R,{code:l,userId:this._engine.getCurrentUserId()},{traceId:i}),l===te$1.REDIRECT?(this._connectionStatus=ee$1.REDIRECT,[2,this.connect(e,!0)]):(h=this._engine.getCurrentUserId(),l===z$1.SUCCESS&&(Jr(mo$1.IM_CONNECTION_DURATION,{startTime:(new Date).getTime()},!0),kt$1.info("connect success, userId: ".concat(h)),1!==(null==c?void 0:c.type)&&(null===(o=(r=this._engine).reportSDKInfo)||void 0===o||o.call(r,u)),bt$1({runtime:this._runtime,logSwitch:(null==c?void 0:c.logSwitch)||0,logPolicy:JSON.parse((null==c?void 0:c.logPolicy)||"{}"),appkey:this.appkey,version:this.apiVersion,userId:h}),mt$1({userId:h}),this._isInternalConnected=!0),l!==z$1.SUCCESS||fn$1()||1===c.openUS&&this._pullUserSettings(),l!==z$1.SUCCESS&&(this._connectionStatus=ee$1.CONNECTION_CLOSED),[2,{code:l,userId:h}])}}))}))},e.prototype._pullUserSettings=function(){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return [2]}))}))},e.prototype.disconnect=function(){var e;return this._isInternalConnected=!1,clearInterval(this._typingInternalTimer),this._typingInternalTimer=-1,this._typingInfo={},null===(e=At$1.getInstance())||void 0===e||e.distroy(),mt$1({userId:""}),this._engine.disconnect(),this._pluginContextQueue.forEach((function(e){if(e.ondisconnect)try{e.ondisconnect();}catch(e){kt$1.error("plugin error =>",e);}})),Promise.resolve()},e.prototype.reconnect=function(e){return this._isInternalConnected?Promise.resolve({code:z$1.CAN_NOT_RECONNECT}):this.connect(this._getTokenWithoutNavi(),!1,e)},e.prototype._getTokenWithoutNavi=function(){return this._token.replace(/@.+$/,"@")},e.prototype.getInfoFromCache=function(){return this._engine.getNaviInfoFromCache()},e.prototype.reqNaviInfo=function(e,t){return D$1(this,void 0,void 0,(function(){var n,i,r,o;return V$1(this,(function(s){switch(s.label){case 0:return n=this._token.split("@"),i=n[1],r=i?i.split(";").map((function(e){return /^https?:/.test(e)?e:"https://".concat(e)})):[],t||(t=_t$1()),Tt$1(pe$1.L_GET_NAVI_T,{token:this._token,uris:r},{traceId:t}),[4,this._engine.getNaviInfo(this._getTokenWithoutNavi(),r,e,this._options.checkCA)];case 1:return (o=s.sent())?(this._engine.updateNaviInfo(o),Tt$1(pe$1.L_GET_NAVI_R,{code:z$1.SUCCESS,naviInfo:o},{traceId:t}),[2,{code:z$1.SUCCESS,data:P$1({},o)}]):(It$1(pe$1.L_GET_NAVI_R,{code:z$1.RC_NAVI_RESOURCE_ERROR},{traceId:t}),[2,{code:z$1.RC_NAVI_RESOURCE_ERROR,msg:z$1[z$1.RC_NAVI_RESOURCE_ERROR]}])}}))}))},e.prototype.registerMessageType=function(e,t,n,i,r){void 0===i&&(i=[]),void 0===r&&(r=!1),ke$1(i)&&i.length>0&&(this._registerMessageSearchPropsMapping[e]=i),this._engine.registerMessageType(e,t,n,i,r);},e.prototype.registerRTCSignalingListener=function(e){this._engine.registerRTCSignalingListener(e);},e.prototype.checkSearchPropsMsg=function(e,t){var n=this._registerMessageSearchPropsMapping[e],i={};return n&&Fe$1(t)&&Object.keys(t).forEach((function(e){if(n.includes(e)){var r=t[e];Ve$1(r)&&(r>-Math.pow(2,64)&&r<Math.pow(2,64)&&Number.isInteger(r)||(i[e]=r));}})),Object.keys(i).length>0?{msg:JSON.stringify(i),code:z$1.SEARCH_PROPS_LIMIT_ERROR}:{code:z$1.SUCCESS}},e.prototype.sendMessage=function(e,t,n,i,r){var o=this.checkSearchPropsMsg(n.messageType,n.content),s=o.code,a=o.msg;if(s!==z$1.SUCCESS)return Promise.resolve({code:s,msg:a});if(e!==X$1.ULTRA_GROUP){var c=this.getInfoFromCache();if(1===((null==c?void 0:c.grpRRVer)||0)&&n.messageType===ie$1.READ_RECEIPT_RESPONSE)return Promise.resolve({code:z$1.READ_RECEIPT_ERROR})}var u=n.canIncludeExpansion,l=void 0!==u&&u,h=n.expansion;if(l){var d=Ze$1(h),f=d.isIllgalEx,p=d.isExKeyOrValLengthExceedLimit;if(d.isExceedLimit||p)return Promise.resolve({code:z$1.EXPANSION_LIMIT_EXCEET});if(f)return Promise.resolve({code:z$1.BIZ_ERROR_INVALID_PARAMETER})}var g=JSON.stringify(n.content);return K$1(g)>131072?Promise.resolve({code:z$1.RC_MSG_CONTENT_EXCEED_LIMIT}):e===X$1.ULTRA_GROUP?this._engine.sendUltraMessage(t,n,i,r):this._engine.sendMessage(e,t,n,i,r)},e.prototype.sendExpansionMessage=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a,c,u,l,h;return V$1(this,(function(d){switch(d.label){case 0:return t=e.channelId,n=e.conversationType,i=e.targetId,r=e.messageUId,o=e.keys,s=e.expansion,a=e.removeAll,e.canIncludeExpansion?(c=Ze$1(s),u=c.isIllgalEx,l=c.isExKeyOrValLengthExceedLimit,c.isExceedLimit||l?[2,Promise.resolve({code:z$1.EXPANSION_LIMIT_EXCEET})]:u?[2,Promise.resolve({code:z$1.BIZ_ERROR_INVALID_PARAMETER})]:(h={mid:r},s&&(h.put=s),o&&(h.del=o),a&&(h.removeAll=1),[4,this._engine.sendMessage(n,i,{content:h,messageType:ie$1.EXPANSION_NOTIFY,channelId:t})])):[2,{code:z$1.MESSAGE_KV_NOT_SUPPORT}];case 1:return [2,{code:d.sent().code}]}}))}))},e.prototype.sendReadReceiptMessage=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i;return V$1(this,(function(r){return i=this.getInfoFromCache(),0===((null==i?void 0:i.grpRRVer)||0)?[2,{code:z$1.READ_RECEIPT_ERROR,data:"The read receipt switch is not on, please call the sendMessage method!"}]:[2,this._engine.sendReadReceiptMessage(e,t,n)]}))}))},e.prototype.getMessageReader=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i;return V$1(this,(function(r){return i=this.getInfoFromCache(),0===((null==i?void 0:i.grpRRVer)||0)?[2,{code:z$1.READ_RECEIPT_ERROR}]:[2,this._engine.getMessageReader(e,t,n)]}))}))},e.prototype._destroy=function(){var e;this._isInternalConnected=!1,this._watcher={batchMessage:void 0,message:void 0,conversationState:void 0,chatroomState:void 0,connectionState:void 0,rtcInnerWatcher:void 0,expansion:void 0,tag:void 0,conversationTagChanged:void 0,typingState:void 0,pullFinished:void 0,onConnecting:void 0,onConnected:void 0,onDisconnect:void 0,onSuspend:void 0},this._engine.disconnect(),this._pluginContextQueue.forEach((function(e){if(e.ondestroy)try{e.ondestroy();}catch(e){kt$1.error("plugin error =>",e);}})),this._pluginContextQueue.length=0,this._pluginInstanseMap={},null===(e=At$1.getInstance())||void 0===e||e.distroy(),mt$1({userId:""});},e.prototype.getHistoryMessage=function(e,t,n,i,r,o,s,a){if(void 0===n&&(n=0),void 0===i&&(i=20),void 0===r&&(r=0),void 0===o&&(o=""),void 0===s&&(s=""),e===X$1.ULTRA_GROUP){var c={timestamp:n,count:i,order:r,channelId:o};return this._engine.getUltraHistoryMsg(t,c,a)}return this._engine.getHistoryMessage(e,t,n,i,r,o,s||"",a)},e.prototype.getHistoryMessagesByObjectNames=function(e,t,n,i,r,o,s){return this._engine.getHistoryMessagesByObjectNames(e,t,n,i,r,o,s)},e.prototype.getConversationList=function(e,t,n,i,r){if(void 0===e&&(e=300),void 0===r&&(r=""),t===X$1.ULTRA_GROUP){var o=z$1.METHOD_NOT_SUPPORT;return Promise.resolve({code:o,msg:z$1[o]})}return this._engine.getConversationList(e,t,n,i,r)},e.prototype.getConversationsByPage=function(e,t,n,i){return this._engine.getConversationsByPage(e,t,n,i)},e.prototype.getConversation=function(e,t,n){return this._engine.getConversation(e,t,n)},e.prototype.removeConversation=function(e,t,n){return void 0===n&&(n=""),e===X$1.ULTRA_GROUP?Promise.resolve(z$1.METHOD_NOT_SUPPORT):this._engine.removeConversation(e,t,n)},e.prototype.getUltraGroupList=function(e){return this._engine.getUltraGroupList(e)},e.prototype.getBlockUltraGroupList=function(){return this._engine.getBlockUltraGroupList()},e.prototype.getTopUltraGroupList=function(){return this._engine.getTopUltraGroupList()},e.prototype.clearUnreadCount=function(e,t,n){return void 0===n&&(n=""),e===X$1.ULTRA_GROUP?this._engine.clearUltraUnreadcount(t,n):this._engine.clearConversationUnreadCount(e,t,n)},e.prototype.clearAllUnreadCount=function(){return this._engine.clearAllUnreadCount()},e.prototype.getUnreadCount=function(e,t,n){return void 0===n&&(n=""),this._engine.getConversationUnreadCount(e,t,n)},e.prototype.getTotalUnreadCount=function(e,t,n){if(t&&t.includes(X$1.ULTRA_GROUP)){var i=z$1.METHOD_NOT_SUPPORT;return Promise.resolve({code:i,msg:z$1[i]})}return this._engine.getAllConversationUnreadCount(e,t&&t.length>0?t:[X$1.PRIVATE,X$1.GROUP,X$1.SYSTEM,X$1.PUBLIC_SERVICE],!!n)},e.prototype.getTotalUnreadCountByLevels=function(e,t,n){return this._engine.getTotalUnreadCountByLevels(e,t,n)},e.prototype.getFirstUnreadMessage=function(e,t,n){return void 0===n&&(n=""),this._engine.getFirstUnreadMessage(e,t,n)},e.prototype.setConversationNotificationLevel=function(e,t,n,i){return void 0===i&&(i=""),D$1(this,void 0,void 0,(function(){var r;return V$1(this,(function(o){return r=[{conversationType:e,targetId:t,notificationLevel:n,channelId:i}],[2,this._engine.batchSetConversationStatus(r)]}))}))},e.prototype.setConversationStatus=function(e,t,n,i,r){if(void 0===r&&(r=""),e===X$1.ULTRA_GROUP&&void 0!==n)return Promise.resolve(z$1.METHOD_NOT_SUPPORT);var o=[{conversationType:e,targetId:t,isTop:n,notificationStatus:i,channelId:r}];return this._engine.batchSetConversationStatus(o)},e.prototype.saveConversationMessageDraft=function(e,t,n,i){return void 0===i&&(i=""),this._engine.saveConversationMessageDraft(e,t,n,i)},e.prototype.getConversationMessageDraft=function(e,t,n){return void 0===n&&(n=""),this._engine.getConversationMessageDraft(e,t,n)},e.prototype.clearConversationMessageDraft=function(e,t,n){return void 0===n&&(n=""),this._engine.clearConversationMessageDraft(e,t,n)},e.prototype.recallMessage=function(e,t,n,i,r){return this._engine.recallMsg(e,t,n,i,r)},e.prototype.deleteRemoteMessage=function(e,t,n,i){return void 0===i&&(i=""),e===X$1.ULTRA_GROUP?Promise.resolve(z$1.METHOD_NOT_SUPPORT):this._engine.deleteRemoteMessage(e,t,n,i)},e.prototype.deleteRemoteMessageByTimestamp=function(e,t,n,i){return void 0===i&&(i=""),this._engine.deleteRemoteMessageByTimestamp(e,t,n,i)},e.prototype.joinChatroom=function(e,t,n){return void 0===t&&(t=10),this._engine.joinChatroom(e,t,n)},e.prototype.joinExistChatroom=function(e,t,n){return void 0===t&&(t=10),this._engine.joinExistChatroom(e,t,n)},e.prototype.quitChatroom=function(e){return this._engine.quitChatroom(e)},e.prototype.getChatroomInfo=function(e,t,n){return void 0===t&&(t=0),void 0===n&&(n=0),this._engine.getChatroomInfo(e,t,n)},e.prototype.setChatroomEntry=function(e,t){var n=t.key,i=t.value;return rn$1(n)&&on$1(i)?this._engine.setChatroomEntry(e,t):Promise.resolve(z$1.BIZ_ERROR_INVALID_PARAMETER)},e.prototype.setChatroomEntries=function(e,t){for(var n=0;n<t.entries.length;n++){var i=t.entries[n],r=i.key,o=i.value;if(!rn$1(r)||!on$1(o))return Promise.resolve({code:z$1.BIZ_ERROR_INVALID_PARAMETER})}var s=P$1(P$1({},t),{isOverwrite:t.isForce});return this._engine.setChatroomEntries(e,s)},e.prototype.forceSetChatroomEntry=function(e,t){var n=t.key,i=t.value;return rn$1(n)&&on$1(i)?this._engine.forceSetChatroomEntry(e,t):Promise.resolve(z$1.BIZ_ERROR_INVALID_PARAMETER)},e.prototype.removeChatroomEntry=function(e,t){var n=t.key;return rn$1(n)?this._engine.removeChatroomEntry(e,t):Promise.resolve(z$1.BIZ_ERROR_INVALID_PARAMETER)},e.prototype.removeChatroomEntries=function(e,t){for(var n=0;n<t.entries.length;n++){var i=t.entries[n].key;if(!rn$1(i))return Promise.resolve({code:z$1.BIZ_ERROR_INVALID_PARAMETER})}return this._engine.removeChatroomEntries(e,t)},e.prototype.forceRemoveChatroomEntry=function(e,t){var n=t.key;return rn$1(n)?this._engine.forceRemoveChatroomEntry(e,t):Promise.resolve(z$1.BIZ_ERROR_INVALID_PARAMETER)},e.prototype.getChatroomEntry=function(e,t){return this._engine.getChatroomEntry(e,t)},e.prototype.getAllChatroomEntries=function(e){return this._engine.getAllChatroomEntry(e)},e.prototype.getChatroomHistoryMessages=function(e,t,n,i){return void 0===t&&(t=20),void 0===n&&(n=0),void 0===i&&(i=0),this._engine.getChatroomHistoryMessages(e,i,t,n)},e.prototype.getFileToken=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){var r,o,s,a,c,u,l;return V$1(this,(function(h){switch(h.label){case 0:return r=this.getInfoFromCache(),o=(null==r?void 0:r.bosAddr)||"",s=(null==r?void 0:r.uploadServer)||"",a=(null==r?void 0:r.ossConfig)||"",[4,this._engine.getFileToken(e,t,n,i)];case 1:return c=h.sent(),u=c.code,l=c.data,u===z$1.SUCCESS&&l?[2,Promise.resolve(Object.assign(l,{bos:o,qiniu:s,ossConfig:a}))]:[2,Promise.reject(u)]}}))}))},e.prototype.getFileUrl=function(e,t,n,i,r){return void 0===r&&(r=he$1.QINIU),D$1(this,void 0,void 0,(function(){var o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return (null==i?void 0:i.isBosRes)?[2,Promise.resolve(i)]:[4,this._engine.getFileUrl(e,r,t,n)];case 1:return o=c.sent(),s=o.code,a=o.data,s===z$1.SUCCESS?[2,Promise.resolve(a)]:[2,Promise.reject(s)]}}))}))},e.prototype.createTag=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.createTag(e)]}))}))},e.prototype.removeTag=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.removeTag(e)]}))}))},e.prototype.updateTag=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.updateTag(e)]}))}))},e.prototype.getTagList=function(){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return [2,this._engine.getTagList()]}))}))},e.prototype.addTagForConversations=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return t.length>1e3?[2,Promise.reject(z$1.CONVER_OUT_LIMIT_ERROR)]:[2,this._engine.addTagForConversations(e,t)]}))}))},e.prototype.removeTagForConversations=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return [2,this._engine.removeTagForConversations(e,t)]}))}))},e.prototype.removeTagsForConversation=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return [2,this._engine.removeTagsForConversation(e,t)]}))}))},e.prototype.getConversationListByTag=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(r){return [2,this._engine.getConversationListByTag(e,t,n,i)]}))}))},e.prototype.getUnreadCountByTag=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return [2,this._engine.getUnreadCountByTag(e,t)]}))}))},e.prototype.setConversationStatusInTag=function(e,t,n){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(i){return [2,this._engine.setConversationStatusInTag(e,t,n)]}))}))},e.prototype.getTagsForConversation=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.getTagsForConversation(e)]}))}))},e.prototype.getBlockConversationList=function(){return this._engine.getBlockConversationList()},e.prototype.getTopConversationList=function(){return this._engine.getTopConversationList()},e.prototype.getUnreadMentionedCount=function(e){return this._engine.getUnreadMentionedCount(e)},e.prototype.getAllUnreadMentionedCount=function(){return this._engine.getAllUnreadMentionedCount()},e.prototype.sendUltraGroupTypingStatus=function(e){if(e.conversationType!==X$1.ULTRA_GROUP){var t=z$1.METHOD_ONLY_SUPPORT_ULTRA_GROUP;return Promise.resolve({code:t,msg:z$1[t]})}return this._engine.sendUltraGroupTypingStatus(e)},e.prototype.getUltraGroupMessageListByMessageUId=function(e){return this._engine.getUltraGroupMessageListByMessageUId(e)},e.prototype.expandUltraMessage=function(e){return D$1(this,void 0,void 0,(function(){var t,n,i,r,o,s,a;return V$1(this,(function(c){switch(c.label){case 0:return e.channelId,t=e.conversationType,e.targetId,e.messageUId,e.keys,n=e.expansion,e.removeAll,i=e.canIncludeExpansion,t!==X$1.ULTRA_GROUP?[2,{code:r=z$1.METHOD_ONLY_SUPPORT_ULTRA_GROUP,msg:z$1[r]}]:i?(o=Ze$1(n),s=o.isIllgalEx,a=o.isExKeyOrValLengthExceedLimit,o.isExceedLimit||a?[2,{code:z$1.EXPANSION_LIMIT_EXCEET}]:s?[2,{code:z$1.BIZ_ERROR_INVALID_PARAMETER}]:[4,this._engine.expandUltraMessage(e)]):[2,{code:z$1.MESSAGE_KV_NOT_SUPPORT}];case 1:return [2,{code:c.sent().code}]}}))}))},e.prototype.modifyMessage=function(e){return D$1(this,void 0,void 0,(function(){var t;return V$1(this,(function(n){switch(n.label){case 0:return e.conversationType!==X$1.ULTRA_GROUP?[2,{code:t=z$1.METHOD_ONLY_SUPPORT_ULTRA_GROUP,msg:z$1[t]}]:[4,this._engine.modifyMessage(e)];case 1:return [2,{code:n.sent().code}]}}))}))},e.prototype.getUltraGroupUnreadMentionedCountByTargetId=function(e,t){return this._engine.getUltraGroupUnreadMentionedCountByTargetId(e,t)},e.prototype.getUltraGroupUnreadCountByTargetId=function(e,t){return this._engine.getUltraGroupUnreadCountByTargetId(e,t)},e.prototype.getAllUltraGroupUnreadCount=function(e){return void 0===e&&(e=!1),this._engine.getAllUltraGroupUnreadCount(e)},e.prototype.getAllConversationState=function(){return this._engine.getAllConversationState()},e.prototype.getUltraGroupUnreadMentionedMessages=function(e){return this._engine.getUltraGroupUnreadMentionedMessages(e)},e.prototype.getUltraGroupFirstUnreadMessageTimestamp=function(e){return this._engine.getUltraGroupFirstUnreadMessageTimestamp(e)},e.prototype.callExtra=function(e){for(var t,n=[],i=1;i<arguments.length;i++)n[i-1]=arguments[i];return (t=this._engine).callExtra.apply(t,k$1([e],n,!1))},e.prototype.getOSInfo=function(){return this._engine.getOSInfo()},e.prototype.getProcessInfo=function(){return this._engine.getProcessInfo()},e.prototype.getMainProcessInfo=function(){return this._engine.getMainProcessInfo()},e.prototype.clearConversations=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return [2,this._engine.clearConversations(e,t)]}))}))},e.prototype.setUserStatusListener=function(e,t){return this._engine.setUserStatusListener(e,(function(e){try{t(e);}catch(e){kt$1.error(e);}}))},e.prototype.addToBlacklist=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.addToBlacklist(e)]}))}))},e.prototype.removeFromBlacklist=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.removeFromBlacklist(e)]}))}))},e.prototype.getBlacklist=function(){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return [2,this._engine.getBlacklist()]}))}))},e.prototype.getBlacklistStatus=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.getBlacklistStatus(e)]}))}))},e.prototype.insertMessage=function(e,t,n){return D$1(this,void 0,void 0,(function(){var i,r,o;return V$1(this,(function(s){return i=this.checkSearchPropsMsg(n.messageType,n.content),r=i.code,o=i.msg,r!==z$1.SUCCESS?[2,Promise.resolve({code:r,msg:o})]:[2,this._engine.insertMessage(e,t,n)]}))}))},e.prototype.deleteMessages=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.deleteMessages(e)]}))}))},e.prototype.deleteMessagesByTimestamp=function(e,t,n,i,r){return void 0===r&&(r=""),D$1(this,void 0,void 0,(function(){return V$1(this,(function(o){return [2,this._engine.deleteMessagesByTimestamp(e,t,n,i,r)]}))}))},e.prototype.clearMessages=function(e,t,n){return void 0===n&&(n=""),D$1(this,void 0,void 0,(function(){return V$1(this,(function(i){return [2,this._engine.clearMessages(e,t,n)]}))}))},e.prototype.getMessage=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.getMessage(e)]}))}))},e.prototype.setMessageContent=function(e,t,n){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(i){return [2,this._engine.setMessageContent(e,t,n)]}))}))},e.prototype.setMessageSearchField=function(e,t,n){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(i){return [2,this._engine.setMessageSearchField(e,t,n)]}))}))},e.prototype.setMessageSentStatus=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return [2,this._engine.setMessageSentStatus(e,t)]}))}))},e.prototype.setMessageReceivedStatus=function(e,t){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(n){return [2,this._engine.setMessageReceivedStatus(e,t)]}))}))},e.prototype.setMessageStatusToRead=function(e,t,n,i){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(r){return [2,this._engine.updateMessageReceiptStatus(e,t,n,i)]}))}))},e.prototype.setUserStatus=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.setUserStatus(e)]}))}))},e.prototype.subscribeUserStatus=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.subscribeUserStatus(e)]}))}))},e.prototype.getUserStatus=function(e){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(t){return [2,this._engine.getUserStatus(e)]}))}))},e.prototype.searchConversationByContent=function(e,t,n,i){return void 0===t&&(t=[]),void 0===n&&(n=""),D$1(this,void 0,void 0,(function(){return V$1(this,(function(r){return [2,this._engine.searchConversationByContent(e,t,n,i)]}))}))},e.prototype.searchConversationByContentWithAllChannel=function(e,t,n){return void 0===t&&(t=[]),D$1(this,void 0,void 0,(function(){return V$1(this,(function(i){return [2,this._engine.searchConversationByContentWithAllChannel(e,t,n)]}))}))},e.prototype.searchMessageByContent=function(e,t,n,i,r,o,s){return void 0===s&&(s=""),D$1(this,void 0,void 0,(function(){return V$1(this,(function(a){return [2,this._engine.searchMessageByContent(e,t,n,i,r,o,s)]}))}))},e.prototype.searchMessageByContentWithAllChannel=function(e,t,n,i,r){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(o){return [2,this._engine.searchMessageByContentWithAllChannel(e,t,n,i,r)]}))}))},e.prototype.searchMessageByContentInTimeRangeWithAllChannel=function(e,t,n,i,r,o,s){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(a){return [2,this._engine.searchMessageByContentInTimeRangeWithAllChannel(e,t,n,i,r,o,s)]}))}))},e.prototype.getUnreadMentionedMessages=function(e,t,n){return void 0===n&&(n=""),this._engine.getUnreadMentionedMessages(e,t,n)},e.prototype.clearUnreadCountByTimestamp=function(e,t,n,i){return void 0===i&&(i=""),this._engine.clearUnreadCountByTimestamp(e,t,n,i)},e.prototype.getUltraGroupDefaultNotificationLevel=function(e,t){return void 0===t&&(t=""),this._engine.getUltraGroupDefaultNotificationLevel(e,t)},e.prototype.setUltraGroupDefaultNotificationLevel=function(e,t,n){return void 0===n&&(n=""),this._engine.setUltraGroupDefaultNotificationLevel(e,t,n)},e.prototype.getConversationNotificationLevel=function(e,t,n){return void 0===n&&(n=""),this._engine.getConversationNotificationLevel(e,t,n)},e.prototype.getConversationNotificationStatus=function(e,t,n){return void 0===n&&(n=""),this._engine.getConversationNotificationStatus(e,t,n)},e.prototype.getRemoteHistoryMessages=function(e,t,n,i,r,o){return this._engine.getRemoteHistoryMessages(e,t,n,i,r,o)},e.prototype.getConversationListWithAllChannel=function(){return this._engine.getConversationListWithAllChannel()},e.prototype.getConversationListWithAllChannelByPage=function(e,t){return this._engine.getConversationListWithAllChannelByPage(e,t)},e.prototype.clearData=function(){return D$1(this,void 0,void 0,(function(){return V$1(this,(function(e){return [2,this._engine.clearData()]}))}))},e.prototype.rtcSignaling=function(e,t,n,i){return this._engine.rtcSignaling(e,t,n,i)},e.prototype.joinRTCRoom=function(e,t,n,i,r,o){return this._engine.joinRTCRoom(e,t,n,i,r,o)},e.prototype.quitRTCRoom=function(e){return this._engine.quitRTCRoom(e)},e.prototype.rtcPing=function(e,t,n){return this._engine.rtcPing(e,t,n)},e.prototype.getRTCRoomInfo=function(e){return this._engine.getRTCRoomInfo(e)},e.prototype.getRTCUserInfoList=function(e){return this._engine.getRTCUserInfoList(e)},e.prototype.getRTCUserInfo=function(e){return this._engine.getRTCUserInfo(e)},e.prototype.setRTCUserInfo=function(e,t,n){return this._engine.setRTCUserInfo(e,t,n)},e.prototype.removeRTCUserInfo=function(e,t){return this._engine.removeRTCUserInfo(e,t)},e.prototype.setRTCData=function(e,t,n,i,r,o){return this._engine.setRTCData(e,t,n,i,r,o)},e.prototype.setRTCTotalRes=function(e,t,n,i,r){return void 0===r&&(r=""),this._engine.setRTCTotalRes(e,t,n,i,r)},e.prototype.setRTCCDNUris=function(e,t,n){return this._engine.setRTCCDNUris(e,t,n)},e.prototype.getRTCData=function(e,t,n,i){return this._engine.getRTCData(e,t,n,i)},e.prototype.removeRTCData=function(e,t,n,i,r){return this._engine.removeRTCData(e,t,n,i,r)},e.prototype.setRTCOutData=function(e,t,n,i){return this._engine.setRTCOutData(e,t,n,i)},e.prototype.getRTCOutData=function(e,t){return this._engine.getRTCOutData(e,t)},e.prototype.getRTCToken=function(e,t,n){return this._engine.getRTCToken(e,t,n)},e.prototype.setRTCState=function(e,t){return this._engine.setRTCState(e,t)},e.prototype.getRTCUserList=function(e){return this._engine.getRTCUserList(e)},e.prototype.joinLivingRoomAsAudience=function(e,t,n){return this._engine.joinLivingRoomAsAudience(e,t,n)},e.prototype.quitLivingRoomAsAudience=function(e){return this._engine.quitLivingRoomAsAudience(e)},e.prototype.rtcIdentityChange=function(e,t,n){return this._engine.rtcIdentityChange(e,t,n)},e.prototype.getRTCJoinedUserInfo=function(e){return this._engine.getRTCJoinedUserInfo(e)},e.prototype.requestRoomPK=function(e){return this._engine.requestRoomPK(e)},e.prototype.cancelRoomPK=function(e){return this._engine.cancelRoomPK(e)},e.prototype.responseRoomPK=function(e){return this._engine.responseRoomPK(e)},e.prototype.endRoomPK=function(e){return this._engine.endRoomPK(e)},e.prototype.bindRTCRoomForChatroom=function(e){return this._engine.bindRTCRoomForChatroom(e)},e}();!function(e){e[e.add=1]="add",e[e.update=2]="update",e[e.delete=3]="delete";}(Ks||(Ks={}));

    var x=function(e,t){return x=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(e,t){e.__proto__=t;}||function(e,t){for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);},x(e,t)};var L=function(){return L=Object.assign||function(e){for(var t,n=1,o=arguments.length;n<o;n++)for(var a in t=arguments[n])Object.prototype.hasOwnProperty.call(t,a)&&(e[a]=t[a]);return e},L.apply(this,arguments)};function b(e,t,n,o){return new(n||(n=Promise))((function(a,i){function c(e){try{r(o.next(e));}catch(e){i(e);}}function s(e){try{r(o.throw(e));}catch(e){i(e);}}function r(e){var t;e.done?a(e.value):(t=e.value,t instanceof n?t:new n((function(e){e(t);}))).then(c,s);}r((o=o.apply(e,t||[])).next());}))}function P(e,t){var n,o,a,i,c={label:0,sent:function(){if(1&a[0])throw a[1];return a[1]},trys:[],ops:[]};return i={next:s(0),throw:s(1),return:s(2)},"function"==typeof Symbol&&(i[Symbol.iterator]=function(){return this}),i;function s(i){return function(s){return function(i){if(n)throw new TypeError("Generator is already executing.");for(;c;)try{if(n=1,o&&(a=2&i[0]?o.return:i[0]?o.throw||((a=o.return)&&a.call(o),0):o.next)&&!(a=a.call(o,i[1])).done)return a;switch(o=0,a&&(i=[2&i[0],a.value]),i[0]){case 0:case 1:a=i;break;case 4:return c.label++,{value:i[1],done:!1};case 5:c.label++,o=i[1],i=[0];continue;case 7:i=c.ops.pop(),c.trys.pop();continue;default:if(!(a=c.trys,(a=a.length>0&&a[a.length-1])||6!==i[0]&&2!==i[0])){c=0;continue}if(3===i[0]&&(!a||i[1]>a[0]&&i[1]<a[3])){c.label=i[1];break}if(6===i[0]&&c.label<a[1]){c.label=a[1],a=i;break}if(a&&c.label<a[2]){c.label=a[2],c.ops.push(i);break}a[2]&&c.ops.pop(),c.trys.pop();continue}i=t.call(e,c);}catch(e){i=[6,e],o=0;}finally{n=a=0;}if(5&i[0])throw i[1];return {value:i[0]?i[1]:void 0,done:!0}}([i,s])}}}var G=function(){return !("undefined"==typeof uni||!function(e){for(var t=["request","getSystemInfo"],n=0,o=t.length;n<o;n++)if(!e[t[n]])return !1;return !0}(uni))},D=G();var B,k,H={tag:"browser",httpReq:function(e){var t=e.method||Hr.GET,n=e.timeout||6e4,i=e.headers,c=e.query,s=e.body,r=H$1(e.url,c);return new Promise((function(e){var o,a=(o="undefined"!=typeof XMLHttpRequest&&"withCredentials"in new XMLHttpRequest,"undefined"!=typeof XMLHttpRequest&&o?new XMLHttpRequest:"undefined"!=typeof XDomainRequest?new XDomainRequest:new ActiveXObject("Microsoft.XMLHTTP")),c="[object XDomainRequest]"===Object.prototype.toString.call(a);if(a.open(t,r),i&&a.setRequestHeader)for(var d in i)a.setRequestHeader(d,i[d]);if(c){a.timeout=n,a.onload=function(){e({data:a.responseText,status:a.status||200});},a.onerror=function(){e({status:a.status||0});},a.ontimeout=function(){e({status:a.status||0});};var u="object"==typeof s?JSON.stringify(s):s;a.send(u);}else a.onreadystatechange=function(){4===a.readyState&&e({data:a.responseText,status:a.status});},a.onerror=function(){e({status:a.status||0});},setTimeout((function(){a.abort(),e({status:a.status||0});}),n),a.send(s);}))},localStorage:null===window||void 0===window?void 0:window.localStorage,sessionStorage:null===window||void 0===window?void 0:window.sessionStorage,isSupportSocket:function(){return "undefined"!=typeof WebSocket},useNavi:!0,connectPlatform:"",isFromUniapp:D,createWebSocket:function(e,t){var n=new WebSocket(e,t);return n.binaryType="arraybuffer",{onClose:function(e){n.onclose=function(t){var n=t.code,o=t.reason;e(n,o);};},onError:function(e){n.onerror=e;},onMessage:function(e){n.onmessage=function(t){e(t.data);};},onOpen:function(e){n.onopen=e;},send:function(e){n.send(e);},close:function(e,t){n.close();}}},createDataChannel:function(n,o){return this.isSupportSocket()&&"websocket"===o?new Wo(this,n):new Jo(this,n)},getNetworkType:function(){var e=navigator.connection||navigator.mozConnection||navigator.webkitConnection,t=e.type,o=e.effectiveType,a=t||o||qr.UNKONWN;return new Promise((function(e){e(a);}))}},F=G(),q=function(e){return function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];var o=St$1.ID();try{return St$1.info(pe$1.A_CALLBACK_O,{func_name:e,source:"wechat"},{traceId:o}),wx[e].apply(wx,t)}catch(t){St$1.error(pe$1.A_CALLBACK_E,{func_name:e,source:"wechat"},{traceId:o}),console.error(t);}}},V={setItem:q("setStorageSync"),getItem:q("getStorageSync"),removeItem:q("removeStorageSync"),clear:q("clearStorageSync")},z={tag:"wechat",httpReq:function(e){var t=e.method||Hr.GET,n=e.timeout||6e4,c=e.headers,s=e.query,r=e.body,d=H$1(e.url,s);return new Promise((function(e){wx.request({url:d,method:t,header:c,timeout:n,data:r,success:function(t){e({data:t.data,status:t.statusCode});},fail:function(){e({status:z$1.RC_HTTP_REQ_FAIL});}});}))},localStorage:V,sessionStorage:V,isSupportSocket:function(){return !0},useNavi:!1,connectPlatform:"MiniProgram",isFromUniapp:F,createWebSocket:function(e,t){var n=wx.connectSocket({url:e,protocols:t});return {onClose:function(e){n.onClose((function(t){e(t.code,t.reason);}));},onError:function(e){n.onError((function(t){e(t.errMsg);}));},onMessage:function(e){n.onMessage((function(t){e(t.data);}));},onOpen:function(e){n.onOpen(e);},send:function(e){n.send({data:e});},close:function(e,t){n.close({code:e,reason:t});}}},createDataChannel:function(n,o){return "websocket"===o?new Wo(this,n):new Jo(this,n)},getNetworkType:function(){return new Promise((function(e){wx.getNetworkType({success:function(t){var n=t.networkType;e(n);},fail:function(){e(qr.UNKONWN);}});}))}},K=G(),J=function(e){return function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];var o=St$1.ID();try{if(St$1.info(pe$1.A_CALLBACK_O,{func_name:e,source:"alipay"},{traceId:o}),"setStorageSync"===e)return my[e]({key:t[0],data:JSON.parse(t[1])});if("clearStorageSync"===e)return my[e]();if("removeStorageSync"===e)return my[e]({key:t[0]});var a=my[e]({key:t[0]}).data;return a?JSON.stringify(a):a}catch(t){St$1.error(pe$1.A_CALLBACK_E,{func_name:e,source:"alipay"},{traceId:o}),console.error(t);}}},Y={setItem:J("setStorageSync"),getItem:J("getStorageSync"),removeItem:J("removeStorageSync"),clear:J("clearStorageSync")},W={tag:"alipay",httpReq:function(e){var t=e.method||Hr.GET,n=e.timeout||6e4,c=e.headers,s=e.query,r=e.body,d=H$1(e.url,s),u=e.dataType||"json";return new Promise((function(e){my.request({url:d,method:t,headers:c,timeout:n,data:r,dataType:u,success:function(t){e({data:t.data,status:t.status});},fail:function(){e({status:z$1.RC_HTTP_REQ_FAIL});}});}))},localStorage:Y,sessionStorage:Y,isSupportSocket:function(){return !0},useNavi:!1,connectPlatform:"MiniProgram",isFromUniapp:K,createWebSocket:function(e){return my.connectSocket({url:e}),{onClose:function(e){my.onSocketClose(e);},onError:function(e){my.onSocketError((function(t){e(t.errMsg);}));},onMessage:function(e){my.onSocketMessage((function(t){t.isBuffer?e(my.base64ToArrayBuffer(t.data)):e(t.data);}));},onOpen:function(e){my.onSocketOpen(e);},send:function(e){my.sendSocketMessage({data:my.arrayBufferToBase64(e),isBuffer:!0});},close:function(){my.closeSocket();}}},createDataChannel:function(n,o){return "websocket"===o?new Wo(this,n):new Jo(this,n)},getNetworkType:function(){return new Promise((function(e){my.getNetworkType({success:function(t){var n=t.networkType;e(n);},fail:function(){e(qr.UNKONWN);}});}))}},X=G(),j=function(e){return function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];var o=St$1.ID();try{return St$1.info(pe$1.A_CALLBACK_O,{func_name:e,source:"toutiao"},{traceId:o}),tt[e].apply(tt,t)}catch(t){St$1.error(pe$1.A_CALLBACK_E,{func_name:e,source:"toutiao"},{traceId:o}),console.error(t);}}},Q={setItem:j("setStorageSync"),getItem:j("getStorageSync"),removeItem:j("removeStorageSync"),clear:j("clearStorageSync")},Z={tag:"toutiao",isSupportSocket:function(){return !0},useNavi:!1,connectPlatform:"MiniProgram",isFromUniapp:X,localStorage:Q,sessionStorage:Q,httpReq:function(e){return new Promise((function(t){tt.request({url:e.url,data:e.body,header:e.headers,method:e.method,success:function(e){console.log("调用成功",e.data);var n=(null==e?void 0:e.data)||{},o={data:JSON.stringify(n),status:e.statusCode};t(o);},fail:function(e){t({status:z$1.RC_HTTP_REQ_FAIL});}});}))},createWebSocket:function(e,t){var n=tt.connectSocket({url:e,protocols:t});return {onOpen:function(e){n.onOpen(e);},onClose:function(e){n.onClose((function(t){return e(t.code,t.reason)}));},onError:function(e){n.onError((function(t){return e(t.errMsg)}));},onMessage:function(e){n.onMessage((function(t){return e(t.data)}));},send:function(e){n.send({data:e});},close:function(e,t){n.close({code:e,reason:t});}}},createDataChannel:function(n,o){return "websocket"===o?new Wo(this,n):new Jo(this,n)},getNetworkType:function(){return new Promise((function(e){tt.getNetworkType({success:function(t){var n=t.networkType;e(n);},fail:function(){e(qr.UNKONWN);}});}))}},$=G(),ee=function(e){return function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];var o=St$1.ID();try{return St$1.info(pe$1.A_CALLBACK_O,{func_name:e,source:"baidu"},{traceId:o}),swan[e].apply(swan,t)}catch(t){St$1.error(pe$1.A_CALLBACK_E,{func_name:e,source:"baidu"},{traceId:o}),console.error(t);}}},te={setItem:ee("setStorageSync"),getItem:ee("getStorageSync"),removeItem:ee("removeStorageSync"),clear:ee("clearStorageSync")},ne={tag:"baidu",isSupportSocket:function(){return !0},useNavi:!1,connectPlatform:"MiniProgram",isFromUniapp:$,localStorage:te,sessionStorage:te,httpReq:function(e){return new Promise((function(t,n){swan.request({url:e.url,data:e.body,header:e.headers,method:e.method,success:function(e){console.log("调用成功",e.data);var n=(null==e?void 0:e.data)||{},o={data:JSON.stringify(n),status:e.statusCode};t(o);},fail:function(e){t({status:z$1.RC_HTTP_REQ_FAIL});}});}))},createWebSocket:function(e,t){var n=swan.connectSocket({url:e,protocols:t});return {onOpen:function(e){n.onOpen(e);},onClose:function(e){n.onClose((function(t){return e(t.code,t.reason)}));},onError:function(e){n.onError((function(t){return e(t.errMsg)}));},onMessage:function(e){n.onMessage((function(t){return e(t.data)}));},send:function(e){n.send({data:e});},close:function(e,t){n.close({code:e,reason:t});}}},createDataChannel:function(n,o){return "websocket"===o?new Wo(this,n):new Jo(this,n)},getNetworkType:function(){return b(this,void 0,void 0,(function(){return P(this,(function(e){return [2,new Promise((function(e){swan.getNetworkType({success:function(t){var n=t.networkType;e(n);},fail:function(){e(qr.UNKONWN);}});}))]}))}))}},oe=function(e){return function(){for(var t=[],n=0;n<arguments.length;n++)t[n]=arguments[n];var o=St$1.ID();try{return St$1.info(pe$1.A_CALLBACK_O,{func_name:e,source:"uniapp"},{traceId:o}),uni[e].apply(uni,t)}catch(t){St$1.error(pe$1.A_CALLBACK_E,{func_name:e,source:"uniapp"},{traceId:o}),console.error(t);}}},ae={setItem:oe("setStorageSync"),getItem:oe("getStorageSync"),removeItem:oe("removeStorageSync"),clear:oe("clearStorageSync")},ie={tag:"uniapp",httpReq:function(e){var t=e.method||Hr.GET,n=e.timeout||6e4,c=e.headers,s=e.query,r=e.body,d=H$1(e.url,s);return new Promise((function(e){uni.request({url:d,method:t,header:c,timeout:n,data:r,success:function(t){e({data:t.data,status:t.statusCode});},fail:function(){e({status:z$1.RC_HTTP_REQ_FAIL});}});}))},localStorage:ae,sessionStorage:ae,isSupportSocket:function(){return !0},useNavi:!0,connectPlatform:"",isFromUniapp:!0,createWebSocket:function(e,t){var n={complete:function(){},url:e,protocols:t},o=uni.connectSocket(n);return {onClose:function(e){o.onClose((function(t){e(t.code,t.reason);}));},onError:function(e){o.onError((function(t){e(t.errMsg);}));},onMessage:function(e){o.onMessage((function(t){e(t.data);}));},onOpen:function(e){o.onOpen(e);},send:function(e){o.send({data:e});},close:function(e,t){o.close({code:e,reason:t});}}},createDataChannel:function(n,o){return "websocket"===o?new Wo(this,n):new Jo(this,n)},getNetworkType:function(){return new Promise((function(e){uni.getNetworkType({success:function(t){var n=t.networkType;e(n);},fail:function(){e(qr.UNKONWN);}});}))}},ce=function(e){return e&&e.request&&e.getSystemInfo},se="undefined"!=typeof uni&&ce(uni)?function(){switch(process.env.VUE_APP_PLATFORM){case"app-plus":return ie;case"mp-baidu":return ne;case"mp-toutiao":return Z;case"mp-alipay":return W;case"mp-weixin":return z;default:return H}}():"undefined"!=typeof my&&ce(my)?W:"undefined"!=typeof tt&&ce(tt)?Z:"undefined"!=typeof swan&&ce(swan)?ne:"undefined"!=typeof wx&&ce(wx)?z:H,re=new Vt$1("RCIM");function de(e){var t=e.conversationType,n$1=e.channelId,o=e.messageType,a=e.content,i=e.senderUserId,c=e.targetId,s=e.sentTime,r=e.receivedTime,g=e.messageUId,f=e.messageDirection,m=e.isPersited,p=e.isCounted,v=e.isOffLineMessage,h=e.canIncludeExpansion,I=e.expansion,S=e.receivedStatus,C=e.disableNotification,T=e.isMentioned,E=e.isStatusMessage,N=e.readReceiptInfo,y=e.pushConfig,R=e.messageId,_=e.isInterrupt,U=e.isModifyMessage,O=e.channelType,M=e.sentStatus;S||(S=n.UNREAD);var A={messageType:o,channelId:n$1||"",content:a,senderUserId:i,targetId:c,conversationType:t,sentTime:s,receivedTime:r,messageUId:g,messageDirection:f,isPersited:m,isCounted:p,isMentioned:T,disableNotification:C,isStatusMessage:E,canIncludeExpansion:h,expansion:I,receivedStatus:S,readReceiptInfo:N,pushConfig:y,messageId:R,isInterrupt:_,isModifyMessage:U,sentStatus:M};return t!==X$1.ULTRA_GROUP&&(A.isOffLineMessage=v),t===X$1.ULTRA_GROUP&&Ve$1(O)&&(A.channelType=O),A}function ue(e){var t=e.conversationType,n=e.targetId,o=e.latestMessage,a=e.unreadMessageCount,i=e.hasMentioned,c=e.mentionedInfo,s=e.lastUnreadTime,r=e.notificationStatus,d=e.notificationLevel,u=e.isTop,l=e.channelId,g=e.unreadMentionedCount;return {conversationType:t,targetId:n,latestMessage:o&&de(o),unreadMessageCount:a,hasMentioned:i,mentionedInfo:i?{type:null==c?void 0:c.type,userIdList:null==c?void 0:c.userIdList}:void 0,lastUnreadTime:s,notificationStatus:r,notificationLevel:d,isTop:u,channelId:l,unreadMentionedCount:g}}function le(e,t){re.warn("Method '".concat(e,"' is deprecated, please use '").concat(t,"' instead"));}!function(e){e.CONNECTING="CONNECTING",e.CONNECTED="CONNECTED",e.DISCONNECT="DISCONNECT",e.SUSPEND="SUSPEND",e.MESSAGES="MESSAGES",e.READ_RECEIPT_RECEIVED="READ_RECEIPT_RECEIVED",e.MESSAGE_RECEIPT_REQUEST="MESSAGE_RECEIPT_REQUEST",e.MESSAGE_RECEIPT_RESPONSE="MESSAGE_RECEIPT_RESPONSE",e.CONVERSATION="CONVERSATION",e.CHATROOM="CHATROOM",e.EXPANSION="EXPANSION",e.PULL_OFFLINE_MESSAGE_FINISHED="PULL_OFFLINE_MESSAGE_FINISHED",e.TAG="TAG",e.CONVERSATION_TAG="CONVERSATION_TAG",e.TYPING_STATUS="TYPING_STATUS",e.MESSAGE_BLOCKED="MESSAGE_BLOCKED",e.ULTRA_GROUP_ENABLE="ULTRA_GROUP_ENABLE",e.OPERATE_STATUS="OPERATE_STATUS",e.ULTRA_GROUP_MESSAGE_EXPANSION_UPDATED="ULTRA_GROUP_MESSAGE_EXPANSION_UPDATED",e.ULTRA_GROUP_MESSAGE_MODIFIED="ULTRA_GROUP_MESSAGE_MODIFIED",e.ULTRA_GROUP_MESSAGE_RECALLED="ULTRA_GROUP_MESSAGE_RECALLED",e.ULTRA_GROUP_CHANNEL_TYPE_CHANGE="ULTRA_GROUP_CHANNEL_TYPE_CHANGE",e.ULTRA_GROUP_CHANNEL_DELETE="ULTRA_GROUP_CHANNEL_DELETE",e.ULTRA_GROUP_CHANNEL_USER_KICKED="ULTRA_GROUP_CHANNEL_USER_KICKED";}(B||(B={})),function(e){e[e.SENDING=10]="SENDING",e[e.FAILED=20]="FAILED",e[e.SENT=30]="SENT",e[e.RECEIVED=40]="RECEIVED",e[e.READ=50]="READ",e[e.DESTROYED=60]="DESTROYED";}(k||(k={}));var ge,fe=function(e){function t$1(n){var o=e.call(this)||this;o.initOptions=n,zt$1("options.navigators",n.navigators,(function(e){return ke$1(e)&&(0===e.length||e.every(Ye$1))})),re.setLogLevel(n.logLevel),re.setLogStdout(n.logStdout);var a=null==n?void 0:n.connectType;return a?t.WEBSOCKET!==a&&t.COMET!==a&&(re.warn("RongIMLib connectionType must be ".concat(t.WEBSOCKET," or ").concat(t.COMET)),a=t.WEBSOCKET):a=t.WEBSOCKET,St$1.info(pe$1.A_INIT_O,{appkey:n.appkey,navigators:n.navigators||[],connectionType:a,logLevel:n.logLevel}),o._context=Hs.init(se,{appkey:n.appkey,apiVersion:"5.5.5",navigators:n.navigators||[],miniCMPProxy:n.customCMP||[],connectionType:a,logLevel:n.logLevel,logStdout:n.logStdout,indexDBSwitch:n.indexDBSwitch,checkCA:n.checkCA}),o.watch(),t$1.imClient=o,o}return function(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Class extends value "+String(t)+" is not a constructor or null");function n(){this.constructor=e;}x(e,t),e.prototype=null===t?Object.create(t):(n.prototype=t.prototype,new n);}(t$1,e),Object.defineProperty(t$1.prototype,"context",{get:function(){if(!this._context)throw new Error("Please perform the init method!");return this._context},enumerable:!1,configurable:!0}),t$1.prototype.watch=function(){var e=this,t=St$1.ID(),n={onConnecting:function(){e.emit(B.CONNECTING);},onConnected:function(){e.emit(B.CONNECTED);},onDisconnect:function(n){St$1.info(pe$1.A_CONNECT_S,{status:n},{traceId:t}),e.emit(B.DISCONNECT,n);},onSuspend:function(n){St$1.info(pe$1.A_CONNECT_S,{status:n},{traceId:t}),e.emit(B.SUSPEND,n);},batchMessage:function(t){St$1.info(pe$1.A_PULL_MSG_O,{messages:t.map((function(e){return e.messageUId}))}),e.emit(B.MESSAGES,{messages:t.map((function(e){return de(e)}))});},typingState:function(t){e.emit(B.TYPING_STATUS,{status:t});},readReceiptReceived:function(t,n,o){e.emit(B.READ_RECEIPT_RECEIVED,{conversation:t,messageUId:n,sentTime:o});},messageReceiptRequest:function(t,n,o){e.emit(B.MESSAGE_RECEIPT_REQUEST,{conversation:t,messageUId:n,senderUserId:o});},messageReceiptResponse:function(t,n,o){e.emit(B.MESSAGE_RECEIPT_RESPONSE,{conversation:t,receivedUserId:n,messageUIdList:o});},conversationState:function(t){var n=t.map((function(e){var t=e.conversationType;return t===X$1.ULTRA_GROUP?{conversation:{conversationType:t,latestMessage:e.latestMessage?de(e.latestMessage):null,targetId:e.targetId,unreadMessageCount:e.unreadMessageCount,unreadMentionedCount:e.unreadMentionedCount,versionTime:e.versionTime,notificationStatus:e.notificationStatus,notificationLevel:e.notificationLevel,lastUnreadTime:e.lastUnreadTime,channelId:e.channelId}}:{conversation:{conversationType:t,latestMessage:e.latestMessage?de(e.latestMessage):null,targetId:e.targetId,unreadMessageCount:e.unreadMessageCount,hasMentioned:e.hasMentioned,mentionedInfo:e.mentionedInfo,lastUnreadTime:e.lastUnreadTime,notificationStatus:e.notificationStatus,notificationLevel:e.notificationLevel,isTop:e.isTop,channelId:e.channelId,unreadMentionedCount:e.unreadMentionedCount},updatedItems:e.updatedItems}}));e.emit(B.CONVERSATION,{conversationList:n});},chatroomState:function(t){e.emit(B.CHATROOM,t);},expansion:function(t){e.emit(B.EXPANSION,t);},pullFinished:function(){e.emit(B.PULL_OFFLINE_MESSAGE_FINISHED);},tag:function(){e.emit(B.TAG);},conversationTagChanged:function(){e.emit(B.CONVERSATION_TAG);},messageBlocked:function(t){e.emit(B.MESSAGE_BLOCKED,t);},ultraGroupEnable:function(t){e.emit(B.ULTRA_GROUP_ENABLE,t);},operateStatus:function(t){e.emit(B.OPERATE_STATUS,t);},ultraGroupMessageExpansionUpdated:function(t){e.emit(B.ULTRA_GROUP_MESSAGE_EXPANSION_UPDATED,t);},ultraGroupMessageModified:function(t){e.emit(B.ULTRA_GROUP_MESSAGE_MODIFIED,t);},ultraGroupMessageRecalled:function(t){e.emit(B.ULTRA_GROUP_MESSAGE_RECALLED,t);},ultraGroupChannelChangeType:function(t){e.emit(B.ULTRA_GROUP_CHANNEL_TYPE_CHANGE,t);},ultraGroupChannelUserKicked:function(t){e.emit(B.ULTRA_GROUP_CHANNEL_USER_KICKED,t);},ultraGroupChannelDelete:function(t){e.emit(B.ULTRA_GROUP_CHANNEL_DELETE,t);}};this.context.assignWatcher(n);},t$1}(Gt$1),me={TIMEOUT:{code:-1,msg:"Network timeout"},SDK_INTERNAL_ERROR:{code:-2,msg:"SDK internal error"},PARAMETER_ERROR:{code:-3,msg:"Please check the parameters, the {param} expected a value of {expect} but received {current}"},REJECTED_BY_BLACKLIST:{code:405,msg:"Blacklisted by the other party"},SEND_TOO_FAST:{code:20604,msg:"Sending messages too quickly"},NOT_IN_GROUP:{code:22406,msg:"Not in group"},ULTRA_GROUP_USER_NOT_IN_PRIVATE_CHANNEL:{code:z$1.ULTRA_GROUP_USER_NOT_IN_PRIVATE_CHANNEL,msg:"ultra group user not in private channel"},FORBIDDEN_IN_GROUP:{code:22408,msg:"Forbbiden from speaking in the group"},NOT_IN_CHATROOM:{code:23406,msg:"Not in chatRoom"},FORBIDDEN_IN_CHATROOM:{code:23408,msg:"Forbbiden from speaking in the chatRoom"},KICKED_FROM_CHATROOM:{code:23409,msg:"Kicked out and forbbiden from joining the chatRoom"},CHATROOM_NOT_EXIST:{code:23410,msg:"ChatRoom does not exist"},CHATROOM_IS_FULL:{code:23411,msg:"ChatRoom members exceeded"},PARAMETER_INVALID_CHATROOM:{code:23412,msg:"Invalid chatRoom parameters"},ROAMING_SERVICE_UNAVAILABLE_CHATROOM:{code:23414,msg:"ChatRoom message roaming service is not open, Please go to the developer to open this service"},RECALLMESSAGE_PARAMETER_INVALID:{code:25101,msg:"Invalid recall message parameter"},ROAMING_SERVICE_UNAVAILABLE_MESSAGE:{code:25102,msg:"Single group chat roaming service is not open, Please go to the developer to open this service"},PUSHSETTING_PARAMETER_INVALID:{code:26001,msg:"Invalid push parameter"},OPERATION_BLOCKED:{code:20605,msg:"Operation is blocked"},OPERATION_NOT_SUPPORT:{code:20606,msg:"Operation is not supported"},MSG_BLOCKED_SENSITIVE_WORD:{code:21501,msg:"The sent message contains sensitive words"},REPLACED_SENSITIVE_WORD:{code:21502,msg:"Sensitive words in the message have been replaced"},NOT_CONNECTED:{code:30001,msg:"Please connect successfully first"},NAVI_REQUEST_ERROR:{code:30007,msg:"Navigation http request failed"},CMP_REQUEST_ERROR:{code:30010,msg:"CMP sniff http request failed"},CONN_APPKEY_FAKE:{code:31002,msg:"Your appkey is fake"},CONN_MINI_SERVICE_NOT_OPEN:{code:31003,msg:"Mini program service is not open, Please go to the developer to open this service"},CONN_ACK_TIMEOUT:{code:31e3,msg:"Connection ACK timeout"},CONN_TOKEN_INCORRECT:{code:31004,msg:"Your token is not valid or expired"},CONN_NOT_AUTHRORIZED:{code:31005,msg:"AppKey and Token do not match"},CONN_REDIRECTED:{code:31006,msg:"Connection redirection"},CONN_APP_BLOCKED_OR_DELETED:{code:31008,msg:"AppKey is banned or deleted"},CONN_USER_BLOCKED:{code:31009,msg:"User blocked"},CONN_DOMAIN_INCORRECT:{code:31012,msg:"Connect domain error, Please check the set security domain"},ROAMING_SERVICE_UNAVAILABLE:{code:33007,msg:"Roaming service cloud is not open, Please go to the developer to open this service"},RC_CONNECTION_EXIST:{code:34001,msg:"Connection already exists"},CHATROOM_KV_EXCEED:{code:23423,msg:"ChatRoom KV setting exceeds maximum"},CHATROOM_KV_OVERWRITE_INVALID:{code:23424,msg:"ChatRoom KV already exists"},CHATROOM_KV_STORE_NOT_OPEN:{code:23426,msg:"ChatRoom KV storage service is not open, Please go to the developer to open this service"},CHATROOM_KEY_NOT_EXIST:{code:23427,msg:"ChatRoom key does not exist"},MSG_KV_NOT_SUPPORT:{code:34008,msg:"The message cannot be extended"},SEND_MESSAGE_KV_FAIL:{code:34009,msg:"Sending RC expansion message fail"},EXPANSION_LIMIT_EXCEET:{code:34010,msg:"The message expansion size is beyond the limit"},ILLGAL_PARAMS:{code:33003,msg:"Incorrect parameters passed in while calling the interface"},UPLOAD_FILE_FAILED:{code:35020,msg:"File upload failed"},CHATROOM_KV_STORE_NOT_ALL_SUCCESS:{code:23428,msg:"Chatroom kv store not all success"},CHATROOM_KV_STORE_OUT_LIMIT:{code:23429,msg:"Chatroom kv's length is out of limit"},TAG_EXISTS:{code:33101,msg:"The tag already exists"},TAG_NOT_EXIST:{code:33100,msg:"The tag does not exist"},NOT_SUPPORT:{code:z$1.NOT_SUPPORT,msg:"The method is not supported in a browser!"}},pe={};for(var ve in me){var he=me[ve].code;pe[he]=ve;}me.ROAMING_SERVICE_UNAVAILABLE.code;var Ie=function(e){ge?re.error("Please do not repeatedly perform the init method"):ge=new fe(e);};function Se(e,t){return null==ge?void 0:ge.context.install(e,t)}function Ce(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("token",e,Ft$1.STRING,!0),zt$1("reconnectKickEnable",t,Ft$1.BOOLEAN),re.warn("RongIMLib Version: ".concat("5.5.5",", Commit: ").concat("5e3050d31ddf15dafa75b1604b3d5cf2eeeede0e")),n=St$1.ID(),St$1.info(pe$1.A_CONNECT_T,{token:e,reconnectKickEnable:t},{traceId:n}),[4,ge.context.connect(e,!1,t,n)];case 1:return o=a.sent(),(o.code===z$1.SUCCESS?St$1.info:St$1.warn)(pe$1.A_CONNECT_R,{code:o.code,userId:o.userId},{traceId:n}),o.code===z$1.SUCCESS?[2,{code:o.code,data:{userId:o.userId}}]:[2,{code:o.code,msg:pe[o.code]}]}}))}))}function Te(){return St$1.info(pe$1.A_DISCONNECT_O,{}),ge.context.disconnect()}function Ee(){return ge.context.getConnectionStatus()}function Ne(){return ge.context.getServerTime()}function ye(){return ge.context.getCurrentUserId()}function Re(e,t,n){ge.on(e,t,n);}function _e(e,t,n){ge.once(e,t,n);}function Ue(e,t,n){ge.off(e,t,n);}function Oe(e){ge.removeAll(e);}function Me(){ge.clear();}function Ae(e,t){Kt$1.add(e,t);}function we(){return ge.context.getDeviceId()}function xe(e,t){return b(this,void 0,void 0,(function(){var n,o,a;return P(this,(function(c){switch(c.label){case 0:return re.debug("get conversation list ->"),[4,fe.imClient.context.getConversationList(null==e?void 0:e.count,void 0,null==e?void 0:e.startTime,null==e?void 0:e.order,t)];case 1:return n=c.sent(),o=n.code,a=n.data,o===z$1.SUCCESS&&a?[2,{code:0,data:a.map((function(e){return ue(e)}))}]:(re.warn("get conversation list fail ->".concat(o,":").concat(pe[o])),[2,{code:o,msg:pe[o]}])}}))}))}function Le(e){return b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),[4,fe.imClient.context.getConversation(e.conversationType,e.targetId,e.channelId||"")];case 1:return t=a.sent(),n=t.code,o=t.data,n!==z$1.SUCCESS?(re.warn("getConversation ->code:".concat(n,", targetId:").concat(e.targetId)),[2,{code:n,msg:pe[n]}]):[2,{code:n,data:o?ue(o):null}]}}))}))}function be(e){return b(this,void 0,void 0,(function(){var t,n;return P(this,(function(o){switch(o.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),[4,fe.imClient.context.removeConversation(e.conversationType,e.targetId,e.channelId)];case 1:return t=o.sent(),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("destroy conversation ->".concat(n)),t!==z$1.SUCCESS?(re.warn("destroy conversation fail ->".concat(t,":").concat(pe[t],",").concat(n)),[2,{code:t,msg:pe[t]}]):[2,{code:t}]}}))}))}function Pe(e){return b(this,void 0,void 0,(function(){var t,n,o,a;return P(this,(function(c){switch(c.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),[4,fe.imClient.context.getConversationMessageDraft(e.conversationType,e.targetId,e.channelId)];case 1:return t=c.sent(),n=t.code,o=t.data,a="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("get draft ->".concat(a)),n===z$1.SUCCESS?[2,{code:n,data:o||""}]:(re.warn("get draft fail ->".concat(n,":").concat(pe[n],",").concat(a)),[2,{code:n,msg:pe[n]}])}}))}))}function Ge(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),zt$1("draft",t,Ft$1.STRING,!0),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("set draft ->".concat(n)),[4,fe.imClient.context.saveConversationMessageDraft(e.conversationType,e.targetId,t,e.channelId)];case 1:return (o=a.sent())===z$1.SUCCESS?[2,{code:o}]:(re.warn("set draft fail ->".concat(o,":").concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}])}}))}))}function De(e){return b(this,void 0,void 0,(function(){var t,n;return P(this,(function(o){switch(o.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),t="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("delete draft  ->".concat(t)),[4,fe.imClient.context.clearConversationMessageDraft(e.conversationType,e.targetId,e.channelId)];case 1:return (n=o.sent())===z$1.SUCCESS?[2,{code:n}]:(re.warn("delete draft fail ->".concat(n,":").concat(pe[n],",").concat(t)),[2,{code:n,msg:pe[n]}])}}))}))}function Be(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r;return P(this,(function(d){switch(d.label){case 0:if(re.debug("get total unread count -> ConversationType:".concat(JSON.stringify(t)," includeMuted:").concat(e)),zt$1("includeMuted",e,Ft$1.BOOLEAN,!1),zt$1("conversationTypes",t,Ft$1.ARRAY,!1),t)for(n=0,o=t;n<o.length;n++)a=o[n],zt$1("conversationType",a,Qe$1);return [4,fe.imClient.context.getTotalUnreadCount("",t,e)];case 1:return c=d.sent(),s=c.code,r=c.data,s===z$1.SUCCESS?[2,{code:s,data:r}]:(re.warn("getTotalUnreadCount fail ->".concat(s,":").concat(pe[s])),[2,{code:s,msg:pe[s]}])}}))}))}function ke(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u,l;return P(this,(function(f){switch(f.label){case 0:for(zt$1("conversationTypes",e,Ft$1.ARRAY,!0),zt$1("levels",t,Ft$1.ARRAY,!0),n=0,o=e;n<o.length;n++)a=o[n],zt$1("conversationType",a,Qe$1);for(c=0,s=t;c<s.length;c++)r=s[c],zt$1("level",r,We$1);return [4,fe.imClient.context.getTotalUnreadCountByLevels(e,t)];case 1:return d=f.sent(),u=d.code,l=d.data,u===z$1.SUCCESS?[2,{code:u,data:l}]:(re.warn("getTotalUnreadCountByLevels fail ->".concat(u,":").concat(pe[u])),[2,{code:u,msg:pe[u]}])}}))}))}function He(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u,l;return P(this,(function(f){switch(f.label){case 0:for(zt$1("conversationTypes",e,Ft$1.ARRAY,!0),zt$1("levels",t,Ft$1.ARRAY,!0),n=0,o=e;n<o.length;n++)a=o[n],zt$1("conversationType",a,Qe$1);for(c=0,s=t;c<s.length;c++)r=s[c],zt$1("level",r,We$1);return [4,fe.imClient.context.getTotalUnreadCountByLevels(e,t,!0)];case 1:return d=f.sent(),u=d.code,l=d.data,u===z$1.SUCCESS?[2,{code:u,data:l}]:(re.warn("getTotalUnreadMentionedCountByLevels fail ->".concat(u,":").concat(pe[u])),[2,{code:u,msg:pe[u]}])}}))}))}function Fe(e){return b(this,void 0,void 0,(function(){var t,n,o,a;return P(this,(function(c){switch(c.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),[4,fe.imClient.context.getUnreadCount(e.conversationType,e.targetId,e.channelId)];case 1:return t=c.sent(),n=t.code,o=t.data,a="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("get unreadCount ->".concat(a)),n===z$1.SUCCESS?[2,{code:n,data:o}]:(re.warn("get unreadCount fail ->".concat(n,":").concat(pe[n],",").concat(a)),[2,{code:n,msg:pe[n]}])}}))}))}function qe(e){return b(this,void 0,void 0,(function(){var t,n;return P(this,(function(o){switch(o.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),[4,fe.imClient.context.clearUnreadCount(e.conversationType,e.targetId,e.channelId)];case 1:return t=o.sent(),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("clear unreadMsgNum ->".concat(n)),t!==z$1.SUCCESS?(re.warn("clear unreadMsgNum fail ->".concat(t,":").concat(pe[t],",").concat(n)),[2,{code:t,msg:pe[t]}]):[2,{code:t}]}}))}))}function Ve(){return b(this,void 0,void 0,(function(){return P(this,(function(e){switch(e.label){case 0:return [4,fe.imClient.context.clearAllUnreadCount()];case 1:return [2,{code:e.sent()}]}}))}))}var ze=function(e,t){void 0===t&&(t=""),zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID);var n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId);return re.debug("".concat(t," -> ").concat(n)),n},Ke=function(e,t,n){return void 0===n&&(n=""),b(void 0,void 0,void 0,(function(){var o,a;return P(this,(function(c){switch(c.label){case 0:return o=ze(e,n),[4,t()];case 1:return (a=c.sent())!==z$1.SUCCESS?(re.warn("".concat(n," fail -> ").concat(a," : ").concat(pe[a]," , ").concat(o)),[2,{code:a,msg:pe[a]}]):[2,{code:a}]}}))}))};function Je(e,t){return b(this,void 0,void 0,(function(){return P(this,(function(n){return zt$1("notificationLevel",t,(function(e){return void 0!==ae$1[e]}),!0),[2,Ke(e,(function(){return fe.imClient.context.setConversationNotificationLevel(e.conversationType,e.targetId,t,e.channelId)}),"setConversationNotificationLevel")]}))}))}function Ye(e,t){return b(this,void 0,void 0,(function(){return P(this,(function(n){return zt$1("notificationStatus",t,(function(e){return 1===e||2===e}),!0),[2,Ke(e,(function(){return fe.imClient.context.setConversationStatus(e.conversationType,e.targetId,void 0,t,e.channelId)}),"setConversationNotificationStatus")]}))}))}function We(e){return b(this,void 0,void 0,(function(){var t,n,o,a;return P(this,(function(c){switch(c.label){case 0:return t=ze(e,"getConversationNotificationLevel"),[4,fe.imClient.context.getConversationNotificationLevel(e.conversationType,e.targetId,e.channelId)];case 1:return n=c.sent(),o=n.code,a=n.data,o===z$1.SUCCESS?[2,{code:o,data:a}]:(re.warn("getConversationNotificationLevel fail -> ".concat(o," : ").concat(pe[o]," , ").concat(t)),[2,{code:o,msg:pe[o]}])}}))}))}function Xe(e){return b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),re.info("getConversationNotificationStatus ->targetId:".concat(e.targetId,",conversationType:").concat(e.conversationType)),[4,fe.imClient.context.getConversationNotificationStatus(e.conversationType,e.targetId,e.channelId)];case 1:return t=a.sent(),n=t.code,o=t.data,n===z$1.SUCCESS?[2,{code:n,data:o}]:(re.warn("getConversationNotificationStatus ->code:".concat(n,",targetId:").concat(e.targetId)),[2,{code:n,msg:pe[n]}])}}))}))}function je(){return b(this,void 0,void 0,(function(){var e,t,n;return P(this,(function(o){switch(o.label){case 0:return [4,fe.imClient.context.getBlockConversationList()];case 1:return e=o.sent(),t=e.code,n=e.data,[2,{code:t,data:n}]}}))}))}function Qe(e,t){return void 0===t&&(t=!0),b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("options.type",e.conversationType,Qe$1,!0),zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("set conversation status ->".concat(n)),[4,fe.imClient.context.setConversationStatus(e.conversationType,e.targetId,t,void 0,e.channelId)];case 1:return (o=a.sent())!==z$1.SUCCESS?(re.warn("set conversation status fail ->".concat(o,":").concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}]):[2,{code:o}]}}))}))}function Ze(){return b(this,void 0,void 0,(function(){var e,t,n;return P(this,(function(o){switch(o.label){case 0:return [4,fe.imClient.context.getTopConversationList()];case 1:return e=o.sent(),t=e.code,n=e.data,[2,{code:t,data:n}]}}))}))}function $e(e){return b(this,void 0,void 0,(function(){return P(this,(function(t){return zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),re.debug("getUnreadMentionedCount".concat(e.targetId,",channelId:").concat(e.channelId)),[2,fe.imClient.context.getUnreadMentionedCount(e)]}))}))}function et(){return b(this,void 0,void 0,(function(){return P(this,(function(e){return re.debug("getAllUnreadMentionedCount"),[2,fe.imClient.context.getAllUnreadMentionedCount()]}))}))}function nt(){return b(this,void 0,void 0,(function(){return P(this,(function(e){return [2,fe.imClient.context.getAllConversationState()]}))}))}function ot(e){return void 0===e&&(e={}),b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("options.targetId",e.targetId,Ft$1.STRING,!1),zt$1("options.channelType",e.channelType,(function(e){return void 0!==Ie$1[e]}),!1),[4,fe.imClient.context.getUltraGroupList(e)];case 1:return t=a.sent(),n=t.code,o=t.data,n===z$1.SUCCESS?[2,{code:z$1.SUCCESS,data:o}]:(re.warn("get ultragroup  ->".concat(n,":").concat(pe[n])),[2,{code:n,msg:pe[n]}])}}))}))}function at(){return b(this,void 0,void 0,(function(){var e,t,n;return P(this,(function(o){switch(o.label){case 0:return [4,fe.imClient.context.getBlockUltraGroupList()];case 1:return e=o.sent(),t=e.code,n=e.data,t===z$1.SUCCESS?[2,{code:z$1.SUCCESS,data:n}]:(re.warn("get block ultragroup  ->".concat(t,":").concat(pe[t])),[2,{code:t,msg:pe[t]}])}}))}))}function it(e){return b(this,void 0,void 0,(function(){var t;return P(this,(function(n){switch(n.label){case 0:return zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),zt$1("options.conversationType",e.conversationType,Qe$1,!0),[4,fe.imClient.context.sendUltraGroupTypingStatus(e)];case 1:return (t=n.sent().code)===z$1.SUCCESS?[2,{code:z$1.SUCCESS}]:(re.warn("send ultraGroup OperateStatus   ->".concat(t,":").concat(pe[t])),[2,{code:t,msg:pe[t]}])}}))}))}function ct(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u;return P(this,(function(l){switch(l.label){case 0:return zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),zt$1("options.conversationType",e.conversationType,Qe$1,!0),zt$1("msgs",t,Ft$1.ARRAY,!0),n=e.targetId,o=e.conversationType,a=e.channelId,c=[],t.forEach((function(e){var t=e.sendTime,n=e.messageUId;c.push({sendTime:t,messageUId:n,channelId:a});})),s={targetId:n,conversationType:o,messages:c},[4,fe.imClient.context.getUltraGroupMessageListByMessageUId(s)];case 1:return r=l.sent(),d=r.code,u=r.data,d===z$1.SUCCESS?[2,{code:z$1.SUCCESS,data:u}]:(re.warn("get UltraGroup MessageList by messageUId   ->".concat(d,":").concat(pe[d])),[2,{code:d,msg:pe[d]}])}}))}))}function st(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u,l;return P(this,(function(f){switch(f.label){case 0:return zt$1("expansion",e,Ft$1.OBJECT,!0),zt$1("message",t,Ft$1.OBJECT,!0),n=t.conversationType,o=t.targetId,a=t.messageUId,c=t.sentTime,s=t.canIncludeExpansion,r=t.channelId,d="conversationType:".concat(n,",targetId:").concat(o,",channelId:").concat(r,",messageUId:").concat(a),re.debug("update expansion for ultragroup message  ->".concat(d)),u={targetId:o,channelId:r,conversationType:n,sendTime:c,canIncludeExpansion:s,messageUId:a,expansion:e},[4,fe.imClient.context.expandUltraMessage(u)];case 1:return (l=f.sent().code)===z$1.SUCCESS?[2,{code:z$1.SUCCESS}]:(re.warn("update expansion for ultragroup message   ->".concat(l,":").concat(pe[l])),[2,{code:l,msg:pe[l]}])}}))}))}function rt(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u,l;return P(this,(function(f){switch(f.label){case 0:return zt$1("expansion",e,Ft$1.ARRAY,!0),zt$1("message",t,Ft$1.OBJECT,!0),n=t.conversationType,o=t.targetId,a=t.messageUId,c=t.sentTime,s=t.canIncludeExpansion,r=t.channelId,d="conversationType:".concat(n,",targetId:").concat(o,",channelId:").concat(r,",messageUId:").concat(a),re.debug("remove expansion for ultragroup message  ->".concat(d)),u={targetId:o,channelId:r,conversationType:n,sendTime:c,canIncludeExpansion:s,messageUId:a,keys:e},[4,fe.imClient.context.expandUltraMessage(u)];case 1:return (l=f.sent().code)===z$1.SUCCESS?[2,{code:z$1.SUCCESS}]:(re.warn("remove expansion for ultraGroup message   ->".concat(l,":").concat(pe[l])),[2,{code:l,msg:pe[l]}])}}))}))}function dt(e){return b(this,void 0,void 0,(function(){var t,n,o,a,c,s,r,d,u;return P(this,(function(l){switch(l.label){case 0:return zt$1("message",e,Ft$1.OBJECT,!0),t=e.conversationType,n=e.targetId,o=e.messageUId,a=e.sentTime,c=e.canIncludeExpansion,s=e.channelId,r="conversationType:".concat(t,",targetId:").concat(n,",channelId:").concat(s,",messageUId:").concat(o),re.debug("remove all expansion for ultraGroup message ->".concat(r)),d={targetId:n,channelId:s,conversationType:t,sendTime:a,canIncludeExpansion:c,messageUId:o,removeAll:!0},[4,fe.imClient.context.expandUltraMessage(d)];case 1:return (u=l.sent().code)===z$1.SUCCESS?[2,{code:z$1.SUCCESS}]:(re.warn("remove all expansion for ultraGroup message   ->".concat(u,":").concat(pe[u])),[2,{code:u,msg:pe[u]}])}}))}))}function ut(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u,l,f;return P(this,(function(m){switch(m.label){case 0:return zt$1("content",e,Ft$1.OBJECT,!0),zt$1("message",t,Ft$1.OBJECT,!0),n=t.conversationType,o=t.targetId,a=t.messageUId,c=t.senderUserId,s=t.sentTime,r=t.canIncludeExpansion,d=t.channelId,u="conversationType:".concat(n,",targetId:").concat(o,",channelId:").concat(d,",messageUId:").concat(a),re.debug("update ultragroup message expansion ->".concat(u)),l={targetId:o,channelId:d,conversationType:n,fromUserId:c,sendTime:s,canIncludeExpansion:r,messageUId:a,content:e},[4,fe.imClient.context.modifyMessage(l)];case 1:return (f=m.sent().code)===z$1.SUCCESS?[2,{code:z$1.SUCCESS}]:(re.warn("modify ultraGroup message   ->".concat(f,":").concat(pe[f])),[2,{code:f,msg:pe[f]}])}}))}))}function lt(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r;return P(this,(function(d){switch(d.label){case 0:if(zt$1("targetId",e,Ft$1.STRING,!0),zt$1("notificationLevels",t,Ft$1.ARRAY),t)for(n=0,o=t;n<o.length;n++)a=o[n],zt$1("notificationLevel",a,We$1);return re.debug("get UltraGroup unreadMentionedCount by targetId: ".concat(e,", notificationLevels: ").concat(JSON.stringify(t))),[4,fe.imClient.context.getUltraGroupUnreadMentionedCountByTargetId(e,t)];case 1:return c=d.sent(),s=c.code,r=c.data,s===z$1.SUCCESS?[2,{code:z$1.SUCCESS,data:r}]:(re.warn("get UltraGroup unreadMentionedCount by targetId error ->".concat(s,":").concat(pe[s])),[2,{code:s,msg:pe[s]}])}}))}))}function gt(e){return b(this,void 0,void 0,(function(){var t,n,o,a,c;return P(this,(function(s){switch(s.label){case 0:return zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),zt$1("options.channelId",e.channelId,Ft$1.CHANNEL_ID),t="getUltraGroupDefaultNotificationLevel",n="targetId: ".concat(e.targetId,", channelId: ").concat(e.channelId),re.debug("".concat(t," -> ").concat(n)),[4,fe.imClient.context.getUltraGroupDefaultNotificationLevel(e.targetId,e.channelId)];case 1:return o=s.sent(),a=o.code,c=o.data,a===z$1.SUCCESS?[2,{code:a,data:c}]:(re.warn("".concat(t," fail -> ").concat(a," : ").concat(pe[a]," , ").concat(n)),[2,{code:a,msg:pe[a]}])}}))}))}function ft(e,t){return b(this,void 0,void 0,(function(){var n,o,a;return P(this,(function(c){switch(c.label){case 0:return zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),e.channelId=e.channelId||"",zt$1("options.channelId",e.channelId,Ft$1.ONLY_STRING,!0),zt$1("notificationLevel",t,(function(e){return void 0!==ae$1[e]}),!0),n="setUltraGroupDefaultNotificationLevel",o="targetId: ".concat(e.targetId,", channelId: ").concat(e.channelId),re.debug("".concat(n," -> ").concat(o)),[4,fe.imClient.context.setUltraGroupDefaultNotificationLevel(e.targetId,t,e.channelId)];case 1:return (a=c.sent().code)===z$1.SUCCESS?[2,{code:a}]:(re.warn("".concat(n," fail -> ").concat(a," : ").concat(pe[a]," , ").concat(o)),[2,{code:a,msg:pe[a]}])}}))}))}function mt(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u;return P(this,(function(l){switch(l.label){case 0:if(zt$1("targetId",e,Ft$1.STRING,!0),zt$1("notificationLevels",t,Ft$1.ARRAY),t)for(n=0,o=t;n<o.length;n++)a=o[n],zt$1("notificationLevel",a,We$1);return c="getUltraGroupUnreadCountByTargetId",[4,fe.imClient.context.getUltraGroupUnreadCountByTargetId(e,t)];case 1:return s=l.sent(),r=s.code,d=s.data,u="targetId: ".concat(e,", levels: ").concat(JSON.stringify(t)),re.debug("".concat(c," -> ").concat(u)),r===z$1.SUCCESS?[2,{code:r,data:d}]:(re.warn("".concat(c," fail -> ").concat(r,": ").concat(pe[r],", ").concat(u)),[2,{code:r,msg:pe[r]}])}}))}))}function pt(){return b(this,void 0,void 0,(function(){var e,t,n,o;return P(this,(function(a){switch(a.label){case 0:return e="getAllUltraGroupUnreadCount",[4,fe.imClient.context.getAllUltraGroupUnreadCount()];case 1:return t=a.sent(),n=t.code,o=t.data,re.debug(e),n===z$1.SUCCESS?[2,{code:n,data:o}]:(re.warn("".concat(e," fail ->").concat(n,": ").concat(pe[n])),[2,{code:n,msg:pe[n]}])}}))}))}function vt(){return b(this,void 0,void 0,(function(){var e,t,n,o;return P(this,(function(a){switch(a.label){case 0:return e="getAllUltraGroupUnreadMentionedCount",[4,fe.imClient.context.getAllUltraGroupUnreadCount(true)];case 1:return t=a.sent(),n=t.code,o=t.data,re.debug(e),n===z$1.SUCCESS?[2,{code:n,data:o}]:(re.warn("".concat(e," fail ->").concat(n,": ").concat(pe[n])),[2,{code:n,msg:pe[n]}])}}))}))}function ht(e){return b(this,void 0,void 0,(function(){var t,n,o,a,c,s,r,d;return P(this,(function(u){switch(u.label){case 0:return zt$1("options.targetId",e.targetId,Ft$1.STRING,!0),e.channelId=e.channelId||"",zt$1("options.channelId",e.channelId,Ft$1.ONLY_STRING,!0),zt$1("options.sentTime",e.sentTime,Ft$1.NUMBER,!0),zt$1("options.count",e.count,(function(e){return Ve$1(e)&&e>0&&e<=50}),!0),t=e.targetId,n=e.channelId,o=e.sentTime,a=e.count,c={targetId:t,channelId:n,sentTime:o,count:a},[4,fe.imClient.context.getUltraGroupUnreadMentionedMessages(c)];case 1:return s=u.sent(),r=s.code,d=s.data,r===z$1.SUCCESS?[2,{code:r,data:d}]:(re.warn("getUltraGroupUnreadMentionedMessages fail ->".concat(r,": ").concat(pe[r])),[2,{code:r,msg:pe[r]}])}}))}))}function It(e){return b(this,void 0,void 0,(function(){var t,n,o,a,c,s;return P(this,(function(r){switch(r.label){case 0:return zt$1("conversation.targetId",e.targetId,Ft$1.STRING,!0),e.channelId=e.channelId||"",zt$1("conversation.channelId",e.channelId,Ft$1.ONLY_STRING,!0),t=e.targetId,n=e.channelId,o={targetId:t,channelId:n},[4,fe.imClient.context.getUltraGroupFirstUnreadMessageTimestamp(o)];case 1:return a=r.sent(),c=a.code,s=a.data,c===z$1.SUCCESS?[2,{code:c,data:s}]:[2,{code:c,msg:pe[c]}]}}))}))}var St=function(e){zt$1("options.key",e.key,Ft$1.STRING,!0),zt$1("options.value",e.value,Ft$1.STRING,!0),zt$1("options.isAutoDelete",e.isAutoDelete,Ft$1.BOOLEAN),zt$1("options.isSendNotification",e.isSendNotification,Ft$1.BOOLEAN),zt$1("options.notificationExtra",e.notificationExtra,Ft$1.STRING);},Ct=function(e){zt$1("options.key",e.key,Ft$1.STRING,!0),zt$1("options.isSendNotification",e.isSendNotification,Ft$1.BOOLEAN),zt$1("options.notificationExtra",e.notificationExtra,Ft$1.STRING);};function Tt(e,t){return b(this,void 0,void 0,(function(){var n,o,a;return P(this,(function(r){switch(r.label){case 0:return zt$1("options.count",t.count,Ft$1.NUMBER,!0),n="id:".concat(e),re.debug("join chatroom ->".concat(n)),o=St$1.ID(),St$1.info(pe$1.A_JOIN_CHATROOM_T,{chatroomId:e,count:t.count,joinExist:!1},{traceId:o}),[4,fe.imClient.context.joinChatroom(e,t.count,o)];case 1:return a=r.sent(),(a===z$1.SUCCESS?St$1.info:St$1.warn)(pe$1.A_JOIN_CHATROOM_R,{code:a,timestamp:(new Date).getTime()},{traceId:o}),a!==z$1.SUCCESS?(re.warn("join chatroom fail ->code+:".concat(pe[a],",").concat(n)),[2,{code:a,msg:pe[a]}]):[2,{code:a}]}}))}))}function Et(e,t){return b(this,void 0,void 0,(function(){var n,o,a;return P(this,(function(r){switch(r.label){case 0:return zt$1("options.count",t.count,Ft$1.NUMBER,!0),n="id:".concat(e),re.debug("join exist chatroom ->".concat(n)),o=St$1.ID(),St$1.info(pe$1.A_JOIN_CHATROOM_T,{chatroomId:e,count:t.count,joinExist:!0},{traceId:o}),[4,fe.imClient.context.joinExistChatroom(e,t.count,o)];case 1:return a=r.sent(),(a===z$1.SUCCESS?St$1.info:St$1.warn)(pe$1.A_JOIN_CHATROOM_R,{code:a,timestamp:(new Date).getTime()},{traceId:o}),a!==z$1.SUCCESS?(re.warn("join exist chatroom fail ->code:".concat(pe[a],",").concat(n)),[2,{code:a,msg:pe[a]}]):[2,{code:a}]}}))}))}function Nt(e){return b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return t="id:".concat(e),re.debug("quit chatroom ->".concat(t)),n=St$1.ID(),St$1.info(pe$1.A_QUIT_CHATROOM_T,{chatroomId:e},{traceId:n}),[4,fe.imClient.context.quitChatroom(e)];case 1:return o=a.sent(),(o===z$1.SUCCESS?St$1.info:St$1.warn)(pe$1.A_QUIT_CHATROOM_R,{code:o},{traceId:n}),o!==z$1.SUCCESS?(re.warn("quit chatroom fail ->code+:".concat(pe[o],",").concat(t)),[2,{code:o,msg:pe[o]}]):[2,{code:o}]}}))}))}function yt(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c;return P(this,(function(s){switch(s.label){case 0:return zt$1("options.count",t.count,Ft$1.NUMBER),zt$1("options.order",t.order,(function(e){return [0,1,2].includes(e)})),n="id:".concat(e),re.debug("get chatroom info ->".concat(n)),[4,fe.imClient.context.getChatroomInfo(e,t.count,t.order)];case 1:return o=s.sent(),a=o.code,c=o.data,a===z$1.SUCCESS&&c?[2,{code:a,data:c}]:(re.warn("get chatroom info fail ->code+:".concat(pe[a],",").concat(n)),[2,{code:a,msg:pe[a]}])}}))}))}function Rt(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("targetId",e,Ft$1.STRING,!0),St(t),n="id:".concat(e),re.debug("set chatroom entry->".concat(n)),[4,fe.imClient.context.setChatroomEntry(e,t)];case 1:return (o=a.sent())!==z$1.SUCCESS?(re.warn("set chatroom entry fail ->code+:".concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}]):[2,{code:o}]}}))}))}function _t(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c;return P(this,(function(s){switch(s.label){case 0:return zt$1("targetId",e,Ft$1.STRING,!0),function(e){e.entries.forEach((function(e){zt$1("entry.key",e.key,Ft$1.STRING,!0),zt$1("entry.value",e.value,Ft$1.STRING,!0);})),zt$1("options.isAutoDelete",e.isAutoDelete,Ft$1.BOOLEAN),zt$1("options.notificationExtra",e.notificationExtra,Ft$1.STRING),zt$1("options.isForce",e.isForce,Ft$1.BOOLEAN);}(t),t.entries.length>10?[2,me.CHATROOM_KV_STORE_OUT_LIMIT]:(n="id:".concat(e),re.debug("set chatroom entry->".concat(n)),[4,fe.imClient.context.setChatroomEntries(e,t)]);case 1:return o=s.sent(),a=o.code,c=o.data,a!==z$1.SUCCESS?(re.warn("set chatroom entry fail ->code+:".concat(pe[a],",").concat(n)),[2,{code:a,msg:pe[a],data:c}]):[2,{code:a}]}}))}))}function Ut(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("targetId",e,Ft$1.STRING,!0),St(t),n="id:".concat(e),re.debug("force set chatroom entry ->".concat(n)),[4,fe.imClient.context.forceSetChatroomEntry(e,t)];case 1:return (o=a.sent())!==z$1.SUCCESS?(re.warn("force set chatroom entry fail ->code+:".concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}]):[2,{code:o}]}}))}))}function Ot(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("targetId",e,Ft$1.STRING,!0),Ct(t),n="id:".concat(e),re.debug("remove chatroom entry->".concat(n)),[4,fe.imClient.context.removeChatroomEntry(e,t)];case 1:return (o=a.sent())!==z$1.SUCCESS?(re.warn("remove chatroom entry fail ->code+:".concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}]):[2,{code:o}]}}))}))}function Mt(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s;return P(this,(function(r){switch(r.label){case 0:return zt$1("targetId",e,Ft$1.STRING,!0),function(e){e.entries.forEach((function(e){zt$1("key",e,Ft$1.STRING,!0);})),zt$1("options.notificationExtra",e.notificationExtra,Ft$1.STRING);}(t),n="id:".concat(e),re.debug("remove chatroom entry->".concat(n)),(o=L({},t)).entries=t.entries.map((function(e){return {key:e}})),[4,fe.imClient.context.removeChatroomEntries(e,o)];case 1:return a=r.sent(),c=a.code,s=a.data,c!==z$1.SUCCESS?(re.warn("remove chatroom entry fail ->code+:".concat(pe[c],",").concat(n)),[2,{code:c,msg:pe[c],data:s}]):[2,{code:c}]}}))}))}function At(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("targetId",e,Ft$1.STRING,!0),Ct(t),n="id:".concat(e),re.debug("force remove chatroom entry ->".concat(n)),[4,fe.imClient.context.forceRemoveChatroomEntry(e,t)];case 1:return (o=a.sent())!==z$1.SUCCESS?(re.warn("force remove chatroom entry fail ->code+:".concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}]):[2,{code:o}]}}))}))}function wt(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c;return P(this,(function(s){switch(s.label){case 0:return zt$1("key",t,(function(e){return Pe$1(e)&&/[\w+=-]+/.test(e)&&e.length<=128}),!0),n="id:".concat(e),re.debug("get chatroom entry->".concat(n)),[4,fe.imClient.context.getChatroomEntry(e,t)];case 1:return o=s.sent(),a=o.code,c=o.data,a===z$1.SUCCESS&&c?[2,{code:a,data:c}]:(re.warn("get chatroom entry fail ->code+:".concat(pe[a],",").concat(n)),[2,{code:a,msg:pe[a]}])}}))}))}function xt(e){return b(this,void 0,void 0,(function(){var t,n,o,a;return P(this,(function(c){switch(c.label){case 0:return t="id:".concat(e),re.debug("get all chatroom entries->".concat(t)),[4,fe.imClient.context.getAllChatroomEntries(e)];case 1:return n=c.sent(),o=n.code,a=n.data,o===z$1.SUCCESS&&a?[2,{code:o,data:a}]:(re.warn("get all chatroom entries fail ->code+:".concat(pe[o],",").concat(t)),[2,{code:o,msg:pe[o]}])}}))}))}function Lt(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s;return P(this,(function(r){switch(r.label){case 0:return zt$1("options.timestamp",t.timestamp,Ft$1.NUMBER),zt$1("options.count",t.count,Ft$1.NUMBER),zt$1("options.order",t.order,(function(e){return 0===e||1===e})),n="id:".concat(e),re.debug("get chatroom history message->".concat(n)),[4,fe.imClient.context.getChatRoomHistoryMessages(e,t.count,t.order,t.timestamp)];case 1:return o=r.sent(),a=o.code,c=o.data,a===z$1.SUCCESS&&c?(s=c.list.map((function(e){return de(e)})),[2,{code:a,data:{list:s,hasMore:!!c.hasMore}}]):(re.warn("get chatroom history message fail ->code+:".concat(pe[a],",").concat(n)),[2,{code:a,msg:pe[a]}])}}))}))}function bt(e){return b(this,void 0,void 0,(function(){var t;return P(this,(function(n){switch(n.label){case 0:return [4,fe.imClient.context.bindRTCRoomForChatroom(e)];case 1:return [2,{code:t=n.sent(),msg:pe[t]}]}}))}))}function Pt(e){return b(this,void 0,void 0,(function(){return P(this,(function(t){switch(t.label){case 0:return zt$1("userId",e,Ft$1.STRING,!0),re.info("addToBlacklist -> userId: ".concat(e)),[4,fe.imClient.context.addToBlacklist(e)];case 1:return [2,{code:t.sent()}]}}))}))}function Gt(e){return b(this,void 0,void 0,(function(){return P(this,(function(t){switch(t.label){case 0:return zt$1("userId",e,Ft$1.STRING,!0),re.info("removeFromBlacklist -> userId: ".concat(e)),[4,fe.imClient.context.removeFromBlacklist(e)];case 1:return [2,{code:t.sent()}]}}))}))}function Dt(){return b(this,void 0,void 0,(function(){var e,t,n;return P(this,(function(o){switch(o.label){case 0:return re.info("getBlacklist -> "),[4,fe.imClient.context.getBlacklist()];case 1:return e=o.sent(),t=e.code,n=e.data,t===z$1.SUCCESS&&n?[2,{code:t,data:n}]:(re.warn("getBlacklist fail -> code: ".concat(t)),[2,{code:t}])}}))}))}function Bt(e){return b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("userId",e,Ft$1.STRING,!0),re.info("getBlacklistStatus -> userId: ".concat(e)),[4,fe.imClient.context.getBlacklistStatus(e)];case 1:return t=a.sent(),n=t.code,o=t.data,n===z$1.SUCCESS?[2,{code:n,data:0===o}]:(re.warn("getBlacklistStatus fail -> code: ".concat(n,",  userId: ").concat(e)),[2,{code:n}])}}))}))}var kt=function(e,t,n,o){void 0===n&&(n=!0),void 0===o&&(o=!0),this.messageType=e,this.content=t,this.isPersited=n,this.isCounted=o;};function Ht(e,t,n){void 0===t&&(t=!0),void 0===n&&(n=!0);return function(o){return new kt(e,o,t,n)}}var Ft,qt,Vt=Ht("RC:ImgMsg"),zt=Ht("RC:HQVCMsg"),Kt=Ht("RC:SightMsg"),Jt=Ht("RC:TxtMsg"),Yt=Ht("RC:CombineMsg"),Wt=Ht("RC:FileMsg"),Xt=Ht("RC:GIFMsg"),jt=Ht("RC:VcMsg"),Qt=Ht("RC:LBSMsg"),Zt=Ht("RC:ReferenceMsg"),$t=Ht("RC:ImgTextMsg"),en={qiniu:function(e,t,n,o){var a=fe.imClient.context.getInfoFromCache();if(1===(null==a?void 0:a.type)&&t.chunk_size&&o.size>t.chunk_size){var i=it$1(),c=o.name.substr(o.name.lastIndexOf("."));i+=c,o.uniqueName=i,rn(o,t,n);}else sn(e,t,n,o);},baidu:function(e,t,n,o){if(o.size>nn)throw new Error("the file size is over 5GB!");var a=t||{};t=t||qt;var i=new XMLHttpRequest,c=on();if(!a.uploadHost.bos&&!a.bosUploadPath)return;var s=c+tn[0][1]+a.bosUploadPath;tn.shift();var r=a.bosHeader||{},d={filename:t.uniqueValue||o.uniqueName,name:o.name,downloadUrl:s,isBosRes:!0};i.upload&&t.support_options&&(i.upload.onprogress=function(e){n.onProgress(e.loaded,e.total,!0);});i.onreadystatechange=function(){if(4===i.readyState)if(JSON.parse(i.responseText||"{}").filename=t.uniqueValue,200===i.status){n.onCompleted(d,!0);}else tn.length?en[tn[0][0]](e,t,n,o):n.onError("upload fail");},i.open(t.method,s,!0),i.setRequestHeader("authorization",r.bosToken),i.setRequestHeader("x-bce-date",r.bosDate),i.send(o);},aliyun:function(e,t,n,o){if(o.size>nn)throw new Error("the file size is over 5GB!");var a=new FormData;a.set("file",e.get("file")),a.set("key",e.get("key")),a.set("token",e.get("token"));var i=tn[0][1];tn.shift(),e=e||Ft,t=(t=t||{})||qt;var c=new XMLHttpRequest,s=on(),r="".concat(s+t.ossBucketName,".").concat(i);c.upload&&t.support_options&&(c.upload.onprogress=function(e){n.onProgress(e.loaded,e.total);});c.onreadystatechange=function(){if(4===c.readyState){var e=JSON.parse(c.responseText||"{}");e.name=t.uniqueValue,e.filename=t.uploadFileName,e.uploadMethod=he$1?he$1.ALI:"",200===c.status?n.onCompleted(e):tn.length?en[tn[0][0]](a,t,n,o):n.onError("upload fail");}},c.open(t.method,r,!0),console.log("ali:url",r);var d=t.aliHeader||{};e.set("OSSAccessKeyId",d.osskeyId),e.set("policy",d.ossPolicy),e.set("Signature",d.ossSign),e.set("success_action_status",200),e.delete("key"),e.append("key",t.uploadFileName),e.delete("file"),e.append("file",o),c.send(e);},s3:function(e,t,n,o){var a=new FormData,i=new XMLHttpRequest,c=on(),s=t.contentDisposition,r=tn[0][1],d="".concat(c+t.s3BucketName,".").concat(r);console.log("uploadS3:url",d),tn.shift(),i.upload&&t.support_options&&(i.upload.onprogress=function(e){n.onProgress(e.loaded,e.total);});i.onreadystatechange=function(){if(4===i.readyState){var a=JSON.parse(i.responseText||"{}");if(a.name=t.uniqueValue,a.filename=t.uploadFileName,a.uploadMethod=he$1.AWS,200===i.status||204===i.status)n.onCompleted(a);else if(tn.length){var c=new FormData;c.set("file",e.get("file")),c.set("key",e.get("key")),c.set("token",e.get("token")),en[tn[0][0]](c,t,n,o);}else n.onError("upload fail");}},i.open(t.method,d,!0);var u=t?t.s3Header:{},l=o&&o.type;s?a.set("Content-Disposition","".concat(s,";")):a.set("Content-Disposition","text/html"===l?"inline;":"attachment;");a.set("Content-Type",l),a.set("x-amz-credential",u.s3Credential),a.set("x-amz-algorithm",u.s3Algorithm),a.set("x-amz-date",u.s3Date),a.set("policy",u.s3Policy),a.set("x-amz-signature",u.s3Signature),a.set("key",t.uploadFileName),a.set("file",o),i.send(a);},stc:function(e,t,n,o){var a=new XMLHttpRequest,i=t.contentDisposition,c=tn[0][1],s="https://".concat(c,"/").concat(t.stcBucketName,"/").concat(t.uploadFileName);tn.shift(),a.upload&&t.support_options&&(a.upload.onprogress=function(e){n.onProgress(e.loaded,e.total);});a.onreadystatechange=function(){if(4===a.readyState){var i=JSON.parse(a.responseText||"{}");if(i.name=t.uniqueValue,i.filename=t.uploadFileName,i.uploadMethod=he$1?he$1.STC:"",200===a.status||204===a.status)n.onCompleted(i);else if(tn.length){var c=new FormData;c.set("file",e.get("file")),c.set("key",e.get("key")),c.set("token",e.get("token")),en[tn[0][0]](c,t,n,o);}else n.onError("upload fail");}},a.open("PUT",s,!0);var r=t?t.stcHeader:{};a.setRequestHeader("Content-Type",o.type),i?a.setRequestHeader("Content-Disposition","".concat(i,";")):a.setRequestHeader("Content-Disposition","text/html"===o.type?"inline;":"attachment;");a.setRequestHeader("Authorization",r.stcAuthorization),a.setRequestHeader("x-amz-content-sha256",r.stcContentSha256),a.setRequestHeader("x-amz-date",r.stcDate),a.send(o);}},tn=[],nn=5368709120;function on(){var e="https://";return "http:"!==location.protocol&&"file:"!==location.protocol||(e="http://"),e}var an,cn=(an="RC-upload-",{get:function(e){e=an+e;var t=localStorage.getItem(e);if(t)return null!==(t=JSON.parse(t||"{}"))&&t.type&&t.data?t.data:null},set:function(e,t){var n=localStorage;e=an+e,t={data:t,type:typeof t,updateTime:Date.now()},n.setItem(e,JSON.stringify(t));},remove:function(e){e=an+e,localStorage.removeItem(e);}});function sn(e,t,n,o){var a="https://"+t.uploadHost.qiniu,i=(/http/.test(tn[0][1])?"":on())+tn[0][1]||a;t.isChunk||tn.shift();var c=new XMLHttpRequest;c.upload&&t.support_options&&(c.upload.onprogress=function(e){n.onProgress(e.loaded,e.total);}),c.onreadystatechange=function(){if(4===c.readyState){var a=JSON.parse(c.responseText||"{}");a.filename=t.uniqueValue,a.uploadMethod=he$1?he$1.QINIU:"",200===c.status||204===c.status?n.onCompleted(a):tn.length?en[tn[0][0]](e,t,n,o):n.onError("upload fail");}},c.open(t.method,i,!0),n.onOpen(c),t.stream&&c.setRequestHeader("authorization","UpToken ".concat(t.multi_parmas.token)),function(e,t){for(var n in e)t(n,e[n]);}(t.headers,(function(e,t){c.setRequestHeader(e,t);})),c.send(e);}function rn(e,t,n,o){var a=0,i=o||it$1(),c=cn.get(i);c&&(e.uniqueName=c.sessionId,a=c.offset);var s=Math.min(t.chunk_size,e.size-a),r=e.slice(a,a+s),d=e.uniqueName;t.multi_parmas.name=d,t.filesize=e.size;var u="bytes=".concat(a,"-").concat(a+s);t.headers={Range:u,"X-File-TransactionId":d,"X-File-Total-Size":e.size},t.isChunk=!0,r.name=e.name,r=function(e,t,n){var o=new FormData;for(var a in t.unique_key&&o.append(t.unique_key,n),o.append(t.file_data_name,e,e.name),t.multi_parmas){var i=t.multi_parmas[a];o.append(a,i);}return o}(r,t,e.uniqueName),sn(r,t,{onCompleted:function(o){a+=s;var c=e.uniqueName;cn.set(i,{offset:a,sessionId:c}),a<e.size?rn(e,t,n,i):(a=0,cn.remove(i),n.onCompleted(o));},onError:function(e){console.error(e),n.onError(e);},onProgress:function(e,o){var i=e+a;n.onProgress(i,t.filesize);},onOpen:function(e){n.onOpen(e);}},e);}function dn(e,t,n){var o,a,i=e&&e.type||"text/plain",c=i.indexOf("image")>-1?1:4,s=t.contentDisposition,r=Math.ceil(e.size/t.stc_chunk_size),d=t&&JSON.parse(t.ossConfig?t.ossConfig:"");Array.isArray(d)||(d=[]);var u=d.find((function(e){return Object.keys(e).includes("stc")})),l="uploads";fe.imClient.context.getFileToken(c,o,"POST",l).then((function(c){o=c.fileName,a="https://".concat(u.stc,"/").concat(t.stcBucketName,"/").concat(o),console.log("uploadStcMultipart:url",a);var d=new XMLHttpRequest;d.open("POST","".concat(a,"?").concat(l),!0),s?d.setRequestHeader("Content-Disposition","".concat(s,";")):d.setRequestHeader("Content-Disposition","text/html"===e.type?"inline;":"attachment;"),d.setRequestHeader("Authorization",c&&c.stcAuthorization),d.setRequestHeader("x-amz-content-sha256",c&&c.stcContentSha256),d.setRequestHeader("x-amz-date",c&&c.stcDate),d.setRequestHeader("Content-Type",i),d.send(),d.onreadystatechange=function(){if(4===d.readyState){var e=d.response.match(/(?:<UploadId>)(\S*?)(?:<\/UploadId>)/);console.log("uploadId",e),200===d.status||204===d.status?function(e){for(var t=[],n=1;n<=r;n++)t.push(p(e,n));m(e,t);}(Array.isArray(e)&&e[1]):n.onError("uploadStcMultipart:did not get uploadId");}};}),(function(e){n.onError("uploadStcMultipart:".concat(e));}));var g=[],f=new Map;function m(s,d){d&&Array.isArray(d)&&0!==d.length&&Promise.all(d).then((function(){var d="uploadId=".concat(s);if(f.size===r)fe.imClient.context.getFileToken(c,o,"POST",d).then((function(o){console.log("onSuccess",o),console.log("onSuccess:uploadId",s);var c=new XMLHttpRequest;c.open("POST","".concat(a,"?").concat(d),!0),c.setRequestHeader("Authorization",o&&o.stcAuthorization),c.setRequestHeader("x-amz-content-sha256",o&&o.stcContentSha256),c.setRequestHeader("x-amz-date",o&&o.stcDate),c.setRequestHeader("Content-Type",i);var r="<CompleteMultipartUpload xmlns='http://s3.amazonaws.com/doc/2006-03-01/'>",u=Array.from(f.keys()||[]).sort((function(e,t){return e-t}));console.log("keys",u),u.forEach((function(e){r+="<Part><ETag>".concat(f.get(e),"</ETag><PartNumber>").concat(e,"</PartNumber></Part>");})),r+="</CompleteMultipartUpload>",c.send(r),console.log("xml",r),c.onreadystatechange=function(){if(4===c.readyState)if(200===c.status||204===c.status){var o={name:e.name,filename:t.uploadFileName,uploadMethod:he$1.STC};n.onCompleted(o);}else n.onError("uploadStcMultipart:upload does not end");};}),(function(e){n.onError("uploadStcMultipart:".concat(e));}));else {for(var u=[],l=0,v=g;l<v.length;l++){var h=v[l];u.push(p(s,h));}m(s,u);}}),(function(e){console.error(e),n.onError("uploadStcMultipart: chunkFiles upload failed and those will reupload");for(var t=[],o=0,a=g;o<a.length;o++){var i=a[o];t.push(p(s,i));}m(s,t);}));}function p(n,s){return new Promise((function(r,d){var u="partNumber=".concat(s,"&uploadId=").concat(n);fe.imClient.context.getFileToken(c,o,"PUT",u).then((function(n){console.log("signature ".concat(s," onSuccess"),n);var o=e&&e.slice((s-1)*t.stc_chunk_size,s*t.stc_chunk_size);console.log("fileChunk:size",o.size);var c=new XMLHttpRequest;c.open("PUT","".concat(a,"?").concat(u),!0),c.setRequestHeader("Authorization",n&&n.stcAuthorization),c.setRequestHeader("x-amz-content-sha256",n&&n.stcContentSha256),c.setRequestHeader("x-amz-date",n&&n.stcDate),c.setRequestHeader("Content-Type",i),c.send(o),c.onreadystatechange=function(){if(4===c.readyState)if(200===c.status||204===c.status){var e=c.getResponseHeader("etag");console.log("etag:".concat(s),e),f.set(s,e),r(e);}else g.includes(s)||g.push(s),d(s);};}),(function(e){console.log("getETags:签名验证失败"),g.includes(s)||g.push(s),d(s);}));}))}}var un={form:function(e,t){var n=new FormData;if(t.unique_key){var o=e.name.substr(e.name.lastIndexOf(".")),a=ln()+o;n.append(t.unique_key,a),t.uniqueValue=a;}return n.append(t.file_data_name,e),gn(t.multi_parmas,(function(e,t){n.append(e,t);})),n},json:function(e,t){var n={};if(t.unique_key){var o=e.name.substr(e.name.lastIndexOf(".")),a=ln()+o;n[t.unique_key]=a,t.uniqueValue=a;}return n[t.file_data_name]=e,gn(t.multi_parmas,(function(e,t){n[e]=t;})),JSON.stringify(n)},data:function(e,t){return e}};function ln(){var e=(new Date).getTime();return "xxxxxx4xxxyxxxxxxx".replace(/[xy]/g,(function(t){var n=(e+16*Math.random())%16|0;return e=Math.floor(e/16),("x"===t?n:3&n|8).toString(16)}))}function gn(e,t){for(var n in e)t(n,e[n]);}var fn,mn=0,pn=function(){function e(e){this.options=function(e){var t={domain:"",method:"POST",file_data_name:"file",unique_key:"key",base64_size:4194304,chunk_size:4194304,bos_chunk_size:4294967296,stc_chunk_size:10485760,headers:{},multi_parmas:{},query:{},support_options:!0,data:un.form,genUId:ln};if(!e||!e.domain)throw new Error("domain is null");for(var n in e)t[n]=e[n];return t}(e);}return e.prototype.setOptions=function(e){var t=this;gn(e,(function(e,n){t.options[e]=n;}));},e.prototype.upload=function(e,t){if(e){var n=this;!function(e,t,n){var o,a;Ft=e,qt=t,tn=[];var i,c=fe.imClient.context.getInfoFromCache();if(1===(null==c?void 0:c.type)&&(null===(o=fe.imClient.initOptions)||void 0===o?void 0:o.uploadDomain))tn=[["qiniu",null===(a=fe.imClient.initOptions)||void 0===a?void 0:a.uploadDomain]];else if(t.ossConfig){var s,r,d=JSON.parse(t.ossConfig),u="",l=[];d.forEach((function(e){var t=Number(e.p)-1;for(var n in e)"aliyun"===n&&(u=e[n]),"s3"===n&&(s=e[n]),"stc"===n&&(r=e[n]),"p"!==n&&(l[t]=[n,e[n]]);})),l.forEach((function(e){e&&tn.push(e);})),d.length!==tn.length&&(tn=[["qiniu",t.domain],["baidu",t.uploadHost.bos],["aliyun",u],["s3",s],["stc",r]]);}else tn=[["qiniu",t.domain],["baidu",t.uploadHost.bos]];if(t.ossConfig){var g=t&&JSON.parse(t.ossConfig);Array.isArray(g)||(g=[]),i=g.find((function(e){return Object.keys(e).includes("stc")}));}if(i&&1===parseInt(i.p,10)&&e.size>=4194304)dn(e,t,n);else {var f=t.data(e,t);en[tn[0][0]](f,t,n,e);}}(e,this.options,{onProgress:function(e,n,o){(fn=e,o)?fn=mn+e/n*(n-mn):mn=fn;t.onProgress(fn,n);},onCompleted:function(e){t.onCompleted(e);},onError:function(e){t.onError(e);},onOpen:function(e){n.xhr=e;}});}else t.onError("upload file is null.");},e.prototype.cancel=function(){var e;null===(e=this.xhr)||void 0===e||e.abort();},e}();var vn,hn,In={init:function(e){return new pn(e)},dataType:un,resize:function(e,t,n){e.type;var o=document.createElement("canvas"),a=new FileReader;a.readAsDataURL(e),a.onload=function(e){var a=e.target.result,i=new Image;i.src=a;var c=i.width,s=i.height,r=function(e,t){var n=1,o=e.width,a=t.maxWidth||0;a>0&&o>a&&(n=a/o);var i=e.height,c=t.maxHeight||0;if(c>0&&i>c){var s=c/i;n=Math.min(n,s);}var r=t.maxSize||0,d=Math.ceil(e.size/1e3);if(d>r){var u=r/d;n=Math.min(n,u);}return n}({width:c,height:s,size:e.total},t),d=a;r<1&&(d=function(e,t,n){return o.width=t,o.height=n,o.getContext("2d").drawImage(e,0,0,t,n),o.toDataURL("image/jpg")}(i,c*r,s*r)),n(d);};}},Sn=function(e,t,n){var o=document.createElement("canvas"),a=o.getContext("2d"),i=new Image,c="string"==typeof e;i.onload=function(c){var s=function(e,t,n){var o,a,i,c=e<t,s=0,r=0;return (c?t/e:e/t)>n.scale?(c?(a=100,r=((i=t/(o=e/100))-n.maxHeight)/2):(i=100,s=((a=e/(o=t/100))-n.maxWidth)/2),{w:a,h:i,x:-s,y:-r}):(c?(o=t/n.maxHeight,i=n.maxHeight,a=e/o):(o=e/n.maxWidth,a=n.maxWidth,i=t/o),{w:a,h:i,x:-s,y:-r})}(i.width,i.height,t);o.width=s.w>t.maxWidth?t.maxWidth:s.w,o.height=s.h>t.maxHeight?t.maxHeight:s.h,a.drawImage(i,s.x,s.y,s.w,s.h);var r=o.toDataURL("string"==typeof e?"image/jpg":e.type,t.quality);r=r.replace(/data:image\/[^;]+;base64,/,""),n(r);},i.src=c?"data:image/jpg;base64,".concat(e):function(e){var t=window.URL||window.webkitURL;return t?t.createObjectURL(e):""}(e);},Cn=function(e,t){var n=e.file,o=e.compress;Sn(n,o,t);},Tn=function(e,t){if(e.getToken)e.getToken((function(n,o){o=o||{},e.multi_parmas=e.multi_parmas||{},e.multi_parmas.token=n,e.uploadHost=e.uploadHost||{},e.uploadHost.bos=o.bos,e.ossConfig=o.ossConfig,e.bosHeader=e.bosHeader||{},e.bosHeader.bosDate=o.bosDate,e.bosHeader.bosToken=o.bosToken,e.bosUploadPath=o.path,e.aliHeader={},e.aliHeader.osskeyId=o.osskeyId,e.aliHeader.ossPolicy=o.ossPolicy,e.aliHeader.ossSign=o.ossSign,e.ossBucketName=o.ossBucketName,e.uploadFileName=o.fileName,e.s3Header={},e.s3Header.s3Credential=o.s3Credential,e.s3Header.s3Algorithm=o.s3Algorithm,e.s3Header.s3Date=o.s3Date,e.s3Header.s3Policy=o.s3Policy,e.s3Header.s3Signature=o.s3Signature,e.s3BucketName=o.s3BucketName,e.stcHeader={},e.stcHeader.stcAuthorization=o.stcAuthorization,e.stcHeader.stcContentSha256=o.stcContentSha256,e.stcHeader.stcDate=o.stcDate,e.stcBucketName=o.stcBucketName,e.headers=e.headers||{},e.base64&&(e.headers["Content-type"]="application/octet-stream",e.headers.Authorization="UpToken ".concat(n));var a=In.init(e);t(a);}));else {e.headers=e.headers||{},e.base64&&(e.headers["Content-type"]="application/octet-stream");var n=In.init(e);t(n);}},En=function(e,t,n){t.upload(e.file,{onError:function(e){n.onError(e);},onProgress:function(e,t){n.onProgress(e,t);},onCompleted:function(t){t.filename=t.filename||t.hash;var o=e.compressThumbnail||Cn;e.compress?o(e,(function(e){t.thumbnail=e,n.onCompleted(t);})):n.onCompleted(t);}});},Nn=function(){function e(e){this.instance=e;}return e.prototype.upload=function(e,t){En({file:e},this.instance,t);},e.prototype.cancel=function(){this.instance.cancel();},e}(),yn=function(){function e(e,t){this.instance=e,this.cfg=t;}return e.prototype.upload=function(e,t){var n={file:e,compress:this.cfg};En(n,this.instance,t);},e.prototype.cancel=function(){this.instance.cancel();},e}(),Rn=function(e,t){Tn(e,(function(n){var o,a,i,c,s={maxHeight:(null===(o=e.thumbnailConfig)||void 0===o?void 0:o.maxHeight)||160,maxWidth:(null===(a=e.thumbnailConfig)||void 0===a?void 0:a.maxWidth)||160,quality:(null===(i=e.thumbnailConfig)||void 0===i?void 0:i.quality)||.5,scale:(null===(c=e.thumbnailConfig)||void 0===c?void 0:c.scale)||2.4},r=new yn(n,s);t(r);}));},_n=function(e,t){Tn(e,(function(e){var n=new Nn(e);t(n);}));},Un=Rn;function On(e,t,n,o){var a,i=this;void 0===t&&(t=j$1.FILE),a=t===j$1.IMAGE?j$1.IMAGE:j$1.FILE;var c=fe.imClient.context.getInfoFromCache();if(!hn&&(hn="upload.qiniup.com",c&&c.ossConfig))try{var s=JSON.parse(c.ossConfig).find((function(e){return void 0!==e.qiniu}));s&&(hn=s.qiniu);}catch(e){}var r=L({domain:hn,getToken:function(e){fe.imClient.context.getFileToken(a).then((function(t){e(t.token,t);})).catch((function(e){n.onFail(e);}));}},o);(a===j$1.IMAGE?Un:_n)(r,(function(o){o.upload(e,{onProgress:function(e,t){var o,a=Math.floor(e/t*100);null===(o=n.onProgress)||void 0===o||o.call(n,a);},onCompleted:function(o){return b(i,void 0,void 0,(function(){return P(this,(function(i){return 1===(null==c?void 0:c.type)?function(e,t,n,o,a){var i,c={type:n.type,name:o.rc_url.file_name,downloadUrl:(null===(i=fe.imClient.initOptions)||void 0===i?void 0:i.uploadDomain)+o.rc_url.path};if(e===j$1.AUDIO)return void Mn(n).then((function(e){a.onSuccess(L(L({},c),e));}));e===j$1.IMAGE&&(c.thumbnail=o.thumbnail);a.onSuccess(c);}(t,0,e,o,n):function(e,t,n,o,a){var i=this;xn(t,o.filename,o.name,o,o.uploadMethod).then((function(c){return b(i,void 0,void 0,(function(){var i;return P(this,(function(s){return 0!==c.code?(a.onFail(c),[2]):((i=c.data).type=n.type,i.name=o.name||o.filename,e===j$1.AUDIO?(Mn(n).then((function(e){a.onSuccess(L(L({},i),e));})),[2]):(t===j$1.IMAGE&&(i.thumbnail=o.thumbnail),a.onSuccess(i),[2]))}))}))})).catch((function(e){a.onFail(e);}));}(t,a,e,o,n),[2]}))}))},onError:function(e){n.onFail(e);}});}));}function Mn(e){return new Promise((function(t){if("function"!=typeof e.arrayBuffer){var n=new FileReader;n.onload=function(){n.result?An(n.result).then((function(e){t(e);}),(function(){t({});})):t({});},n.onerror=function(){t({duration:0});},n.readAsArrayBuffer(e);}else e.arrayBuffer().then(An).then((function(e){t(e);}));}))}function An(e){return vn=vn||new AudioContext,new Promise((function(t,n){vn.decodeAudioData(e,(function(e){t({duration:e.duration,length:e.length});}),n);}))}function wn(e,t,n,o){return new Promise((function(a){fe.imClient.context.getFileToken(e,t,n,o).then((function(e){a({code:z$1.SUCCESS,data:e});})).catch((function(e){a({code:e,msg:pe[e]});}));}))}function xn(e,t,n,o,a){return zt$1("fileType",e,ze$1,!0),zt$1("filename",t,Ft$1.STRING),zt$1("saveName",n,Ft$1.STRING),zt$1("serverType",a,Ft$1.NUMBER),new Promise((function(c){fe.imClient.context.getFileUrl(e,t,n,o,a).then((function(e){c({code:z$1.SUCCESS,data:e});})).catch((function(e){c({code:e});}));}))}function Ln(e,t,n$1){return b(this,void 0,void 0,(function(){var o,a,r,l,f,m,p,v,h,I,C,T;return P(this,(function(E){switch(E.label){case 0:return n$1=n$1||{},t instanceof kt==!1?(re.warn("send message fail -> message parameter is not an instance of BaseMessage"),[2,me.ILLGAL_PARAMS]):(zt$1("conversation",e,Ft$1.OBJECT,!0),o=e.conversationType,a=e.targetId,r=e.channelId,zt$1("conversation.targetId",a,Ft$1.STRING,!0),zt$1("conversation.conversationType",o,Ft$1.NUMBER),zt$1("conversation.channelId",r,Ft$1.CHANNEL_ID),zt$1("options.isStatusMessage",null==n$1?void 0:n$1.isStatusMessage,Ft$1.BOOLEAN),zt$1("options.disableNotification",null==n$1?void 0:n$1.disableNotification,Ft$1.BOOLEAN),zt$1("options.pushContent",null==n$1?void 0:n$1.pushContent,Ft$1.STRING),zt$1("options.pushData",null==n$1?void 0:n$1.pushData,Ft$1.STRING),zt$1("options.isMentioned",null==n$1?void 0:n$1.isMentioned,Ft$1.BOOLEAN),zt$1("options.mentionedType",null==n$1?void 0:n$1.mentionedType,Ft$1.NUMBER),zt$1("options.mentionedUserIdList",null==n$1?void 0:n$1.mentionedUserIdList,Ft$1.ARRAY),zt$1("options.directionalUserIdList",null==n$1?void 0:n$1.directionalUserIdList,Ft$1.ARRAY),zt$1("options.isVoipPush",null==n$1?void 0:n$1.isVoipPush,Ft$1.BOOLEAN),zt$1("options.canIncludeExpansion",null==n$1?void 0:n$1.canIncludeExpansion,Ft$1.BOOLEAN),zt$1("options.expansion",null==n$1?void 0:n$1.expansion,Ft$1.OBJECT),zt$1("options.pushConfig",null==n$1?void 0:n$1.pushConfig,Ft$1.OBJECT),zt$1("options.messageId",null==n$1?void 0:n$1.messageId,Ft$1.NUMBER),l="conversationType:".concat(o,",targetId:").concat(a),re.debug("send message  ->".concat(l)),f=function(e,t,n){var o=e.isStatusMessage,a=e.disableNotification,i=e.pushContent,c=e.pushData,s=e.isMentioned,r=e.mentionedType,d=e.mentionedUserIdList,u=e.directionalUserIdList,l=e.isVoipPush,g=e.canIncludeExpansion,f=e.expansion,m=e.isFilerWhiteBlacklist,p=e.pushConfig,v=e.messageId,h=n.channelId;return L({isStatusMessage:o,disableNotification:a,pushContent:i,pushData:c,isMentioned:s,mentionedType:r,mentionedUserIdList:d,directionalUserIdList:u,isVoipPush:l,canIncludeExpansion:g,expansion:f,isFilerWhiteBlacklist:m,pushConfig:p,channelId:h||"",messageId:v},t)}(n$1,t,e),m={isMentioned:!!n$1.isMentioned,content:t.content,messageType:t.messageType,isPersited:t.isPersited||!1,isCounted:t.isCounted||!1,disableNotification:!!(null==n$1?void 0:n$1.disableNotification),canIncludeExpansion:!!(null==n$1?void 0:n$1.canIncludeExpansion),expansion:(null==n$1?void 0:n$1.expansion)||null,conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId,senderUserId:fe.imClient.context.getCurrentUserId(),messageUId:"",messageDirection:W$1.SEND,receivedTime:0,isStatusMessage:n$1.isStatusMessage||!1,receivedStatus:n.UNREAD,isOffLineMessage:!1,pushConfig:null==n$1?void 0:n$1.pushConfig},o!==X$1.ULTRA_GROUP&&(m.isOffLineMessage=!1),p=function(e){m.messageId=e;try{(null==n$1?void 0:n$1.onSendBefore)&&n$1.onSendBefore(de(m));}catch(e){St$1.error('Callback method "onSendBefore" execution error',e);}},v=St$1.ID(),St$1.info(pe$1.A_SEND_MSG_T,{messageType:t.messageType,conversationType:o,targetId:a,channelId:r},{traceId:v}),[4,fe.imClient.context.sendMessage(o,a,f,p,v)]);case 1:return h=E.sent(),I=h.code,C=h.data,(I===z$1.SUCCESS?St$1.info:St$1.warn)(pe$1.A_SEND_MSG_R,{code:I,messageUId:C?C.messageUId:"",messageId:C?C.messageId:""},{traceId:v}),I===z$1.SUCCESS?(T=de(C),[2,{code:I,data:T}]):(re.warn("send message fail ->".concat(I,":").concat(pe[I],",").concat(l)),m.sentTime=(null==C?void 0:C.sentTime)||0,[2,{code:I,msg:pe[I],data:de(m)}])}}))}))}function bn(e,t,n){return Ln(e,new Jt(t),n)}function Pn(e,t){return function(n,o,a,r){zt$1("sendOptions.contentDisposition",null==r?void 0:r.contentDisposition,(function(e){return ["inline","attachment"].includes(e)}));var d={contentDisposition:null==r?void 0:r.contentDisposition};if(r&&"thumbnailConfig"in r){var u=null==r?void 0:r.thumbnailConfig;zt$1("sendOptions.maxHeight",null==u?void 0:u.maxHeight,Ft$1.NUMBER),zt$1("sendOptions.maxWidth",null==u?void 0:u.maxWidth,Ft$1.NUMBER),zt$1("sendOptions.quality",null==u?void 0:u.quality,Ft$1.NUMBER),zt$1("sendOptions.scale",null==u?void 0:u.scale,Ft$1.NUMBER),d.thumbnailConfig=u;}return new Promise((function(u){var l=St$1.ID();St$1.info(pe$1.L_MEDIA_UPLOAD_T,{filesize:o.file.size,type:e},{traceId:l}),On(o.file,e,{onProgress:null==a?void 0:a.onProgress,onSuccess:function(e){var d,g=(null===(d=null==a?void 0:a.onComplete)||void 0===d?void 0:d.call(a,{url:e.downloadUrl}))||t(e,o);e&&e.downloadUrl&&St$1.info(pe$1.L_MEDIA_UPLOAD_R,{downurl:e.downloadUrl,code:z$1.SUCCESS},{traceId:l}),Ln(n,g,r).then(u);},onFail:function(e){St$1.warn(pe$1.L_MEDIA_UPLOAD_R,{code:z$1.UPLOAD_FILE_FAILED},{traceId:l}),u({code:z$1.UPLOAD_FILE_FAILED,msg:e||z$1[z$1.UPLOAD_FILE_FAILED]});}},d);}))}}var Gn=Pn(j$1.FILE,(function(e,t){return new Wt({name:e.name,size:t.file.size,type:t.file.type,fileUrl:e.downloadUrl,user:t.user,extra:t.extra})})),Dn=Pn(j$1.IMAGE,(function(e,t){return new Vt({content:e.thumbnail,imageUri:e.downloadUrl,user:t.user,extra:t.extra})})),Bn=Pn(j$1.AUDIO,(function(e,t){return new zt({remoteUrl:e.downloadUrl,duration:e.duration,type:e.type,user:t.user,extra:t.extra})})),kn=Pn(j$1.SIGHT,(function(e,t){return new Kt({sightUrl:e.downloadUrl,content:t.thumbnail,duration:t.duration,size:t.file.size||e.size,name:t.name||e.name,user:t.user,extra:t.extra})}));function Hn(e,t){return b(this,void 0,void 0,(function(){var n,o,a,r,d,u;return P(this,(function(l){switch(l.label){case 0:return zt$1("options.timestamp",null==t?void 0:t.timestamp,Ft$1.NUMBER),zt$1("options.count",null==t?void 0:t.count,Ft$1.NUMBER),zt$1("options.order",null==t?void 0:t.order,(function(e){return 0===e||1===e})),zt$1("conversation.channelId",null==e?void 0:e.channelId,Ft$1.CHANNEL_ID),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("get history message ->".concat(n)),o=St$1.ID(),St$1.info(pe$1.A_GET_HISTORY_MSG_T,{targetId:e.targetId,conversationType:e.conversationType,channelId:e.channelId,timestamp:null==t?void 0:t.timestamp,count:null==t?void 0:t.count},{traceId:o}),[4,fe.imClient.context.getHistoryMessage(e.conversationType,e.targetId,null==t?void 0:t.timestamp,null==t?void 0:t.count,null==t?void 0:t.order,null==e?void 0:e.channelId,"",o)];case 1:return a=l.sent(),r=a.code,d=a.data,r===z$1.SUCCESS&&d?(u=d.list.map((function(e){return de(e)})),St$1.info(pe$1.A_GET_HISTORY_MSG_R,{code:r,messageLength:u.length},{traceId:o}),[2,{code:r,data:{list:u,hasMore:d.hasMore}}]):(St$1.warn(pe$1.A_GET_HISTORY_MSG_R,{code:r,messageUIds:""},{traceId:o}),re.warn("get history message fail ->".concat(r,":").concat(pe[r],",").concat(n)),[2,{code:r,msg:pe[r]}])}}))}))}function Fn(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s;return P(this,(function(r){switch(r.label){case 0:return zt$1("options.timestamp",null==t?void 0:t.timestamp,Ft$1.NUMBER),zt$1("options.count",null==t?void 0:t.count,Ft$1.NUMBER),zt$1("options.order",null==t?void 0:t.order,(function(e){return 0===e||1===e})),zt$1("conversation.channelId",null==e?void 0:e.channelId,Ft$1.CHANNEL_ID),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("get history message ->".concat(n)),[4,fe.imClient.context.getRemoteHistoryMessages(e.conversationType,e.targetId,(null==t?void 0:t.timestamp)||0,(null==t?void 0:t.count)||20,(null==t?void 0:t.order)||0,e.channelId||"")];case 1:return o=r.sent(),a=o.code,c=o.data,a===z$1.SUCCESS&&c?(s=c.list.map((function(e){return de(e)})),[2,{code:a,data:{list:s,hasMore:c.hasMore}}]):(re.warn("get history message fail ->".concat(a,":").concat(pe[a],",").concat(n)),[2,{code:a,msg:pe[a]}])}}))}))}function qn(e,t,n,o){return b(this,void 0,void 0,(function(){var a,i,c,s,r;return P(this,(function(d){switch(d.label){case 0:return a={targetId:e,conversationType:X$1.PRIVATE,channelId:o},i=new kt("RC:ReadNtf",{messageUId:t,lastMessageSendTime:n,type:1}),[4,Ln(a,i)];case 1:return c=d.sent(),s=c.code,r=c.msg,0===s?[2,{code:s}]:[2,{code:s,msg:r}]}}))}))}function Vn(e,t,n){return b(this,void 0,void 0,(function(){var o,a,i,c,s;return P(this,(function(r){switch(r.label){case 0:return zt$1("messageUId",t,Ft$1.STRING,!0),zt$1("channelId",n,Ft$1.CHANNEL_ID),o="messageUId:".concat(t,",targetId:").concat(e),re.debug("send read receipt message ->".concat(o)),a=new kt("RC:RRReqMsg",{messageUId:t}),[4,Ln({targetId:e,conversationType:X$1.GROUP,channelId:n},a)];case 1:return i=r.sent(),c=i.code,s=i.msg,0===c?[2,{code:c}]:[2,{code:c,msg:s}]}}))}))}function zn(e,t,n){return b(this,void 0,void 0,(function(){return P(this,(function(e){throw new Error("This method is deprecated, please use method sendReadReceiptResponseV2.")}))}))}function Kn(e,t,n){return b(this,void 0,void 0,(function(){var o,a,c,s,r,d,l;return P(this,(function(f){switch(f.label){case 0:return zt$1("targetId",e,Ft$1.STRING,!0),zt$1("messageList",t,Ft$1.OBJECT,!0),zt$1("channelId",n,Ft$1.CHANNEL_ID),Object.keys(t).forEach((function(e){zt$1(e,t[e],Ft$1.ARRAY);})),o={targetId:e,conversationType:X$1.GROUP,channelId:n},c=fe.imClient.context.getInfoFromCache(),0!==(s=(null==c?void 0:c.grpRRVer)||0)?[3,2]:(r=new kt("RC:RRRspMsg",{receiptMessageDic:t}),[4,Ln(o,r)]);case 1:return a=f.sent(),[3,4];case 2:return 1!==s?[3,4]:(d=[],Object.keys(t).forEach((function(e){t[e].forEach((function(e){-1===d.indexOf(e)&&d.push(e);}));})),d.length?[4,fe.imClient.context.sendReadReceiptMessage(e,d,n)]:(re.warn("Error in parameter messageList."),[2,{code:z$1.PARAMETER_ERROR}]));case 3:a=f.sent(),f.label=4;case 4:return (l=a.code)===z$1.SUCCESS?[2,{code:l}]:(re.warn("send read receipt message fail ->".concat(l,":").concat(pe[l])),[2,{code:l,msg:pe[l]}])}}))}))}function Jn(e,t){return b(this,void 0,void 0,(function(){var n,o,a,i;return P(this,(function(c){switch(c.label){case 0:return zt$1("conversation.type",e.conversationType,Ft$1.NUMBER,!0),zt$1("conversation.targetId",e.targetId,Ft$1.STRING,!0),zt$1("lastMessageSendTime",t,Ft$1.NUMBER,!0),zt$1("conversation.channelId",null==e?void 0:e.channelId,Ft$1.CHANNEL_ID),n=new kt("RC:SRSMsg",{lastMessageSendTime:t}),[4,Ln(e,n)];case 1:return o=c.sent(),a=o.code,i=o.msg,0===a?[2,{code:a}]:[2,{code:a,msg:i}]}}))}))}function Yn(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s;return P(this,(function(r){switch(r.label){case 0:return zt$1("options.messageUId",t.messageUId,Ft$1.STRING,!0),zt$1("options.sentTime",t.sentTime,Ft$1.NUMBER,!0),zt$1("options.disableNotification",null==t?void 0:t.disableNotification,Ft$1.BOOLEAN),zt$1("options.pushConfig",null==t?void 0:t.pushConfig,Ft$1.OBJECT),zt$1("conversation.channelId",null==e?void 0:e.channelId,Ft$1.CHANNEL_ID),n={user:t.user,channelId:e.channelId||"",disableNotification:null==t?void 0:t.disableNotification,pushConfig:null==t?void 0:t.pushConfig,extra:t.extra,isDelete:t.isDelete},o="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId,",messageUId:").concat(t.messageUId),re.debug("recall message ->".concat(o)),[4,fe.imClient.context.recallMessage(e.conversationType,e.targetId,t.messageUId,t.sentTime,n)];case 1:return a=r.sent(),c=a.code,s=a.data,c===z$1.SUCCESS&&s?[2,{code:c,data:de(s)}]:c===z$1.SUCCESS?[2,{code:c}]:(re.warn("recall message fail ->".concat(c,":").concat(pe[c],",").concat(o)),[2,{code:c,msg:pe[c]}])}}))}))}function Wn(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("options",t,(function(e){return ke$1(e)&&e.length}),!0),t.forEach((function(e){zt$1("options.messageUId",e.messageUId,Ft$1.STRING,!0),zt$1("options.sentTime",e.sentTime,Ft$1.NUMBER,!0),zt$1("options.messageDirection",e.messageDirection,(function(e){return 1===e||2===e}),!0);})),zt$1("conversation.channelId",null==e?void 0:e.channelId,Ft$1.CHANNEL_ID),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("delete messages ->".concat(n)),[4,fe.imClient.context.deleteRemoteMessage(e.conversationType,e.targetId,t,e.channelId)];case 1:return (o=a.sent())!==z$1.SUCCESS?(re.warn("delete message fail ->".concat(o,":").concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}]):[2,{code:z$1.SUCCESS}]}}))}))}function Xn(e,t){return b(this,void 0,void 0,(function(){var n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("options.timestamp",t,Ft$1.NUMBER,!0),zt$1("conversation.channelId",null==e?void 0:e.channelId,Ft$1.CHANNEL_ID),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("clear message ->".concat(n)),[4,fe.imClient.context.deleteRemoteMessageByTimestamp(e.conversationType,e.targetId,t,e.channelId)];case 1:return (o=a.sent())!==z$1.SUCCESS?(re.warn("clear message ->".concat(o,":").concat(pe[o],",").concat(n)),[2,{code:o,msg:pe[o]}]):[2,{code:z$1.SUCCESS}]}}))}))}function jn(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u;return P(this,(function(l){switch(l.label){case 0:return zt$1("expansion",e,Ft$1.OBJECT,!0),zt$1("message",t,Ft$1.OBJECT,!0),n=t.conversationType,o=t.targetId,a=t.messageUId,c=t.canIncludeExpansion,s=t.expansion,r=t.channelId,d="conversationType:".concat(n,",targetId:").concat(o,",messageUId:").concat(a),re.debug("update message expansion ->".concat(d)),[4,fe.imClient.context.sendExpansionMessage({conversationType:n,targetId:o,messageUId:a,expansion:e,canIncludeExpansion:c,originExpansion:s,channelId:r})];case 1:return (u=l.sent().code)!==z$1.SUCCESS?(re.warn("update message expansion fail ->".concat(u,":").concat(pe[u],",").concat(d)),[2,{code:u,msg:pe[u]}]):[2,{code:u}]}}))}))}function Qn(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d;return P(this,(function(u){switch(u.label){case 0:return zt$1("keys",e,Ft$1.ARRAY,!0),zt$1("message",t,Ft$1.OBJECT,!0),n=t.conversationType,o=t.targetId,a=t.messageUId,c=t.canIncludeExpansion,s=t.channelId,r="conversationType:".concat(n,",targetId:").concat(o,",messageUId:").concat(a),re.debug("remove message expansion ->".concat(r)),[4,fe.imClient.context.sendExpansionMessage({conversationType:n,targetId:o,messageUId:a,canIncludeExpansion:c,keys:e,channelId:s})];case 1:return (d=u.sent().code)!==z$1.SUCCESS?(re.warn("remove message expansion fail ->".concat(d,":").concat(pe[d],",").concat(r)),[2,{code:d,msg:pe[d]}]):[2,{code:d}]}}))}))}function Zn(e,t){return b(this,void 0,void 0,(function(){var n,o,a,r,d,u;return P(this,(function(l){switch(l.label){case 0:return zt$1("typingContentType",t,Ft$1.STRING,!0),n="conversationType:".concat(e.conversationType,",targetId:").concat(e.targetId),re.debug("send typing status message ->".concat(n)),o={messageType:"RC:TypSts",content:{typingContentType:t},isStatusMessage:!0,channelId:e.channelId},a=St$1.ID(),St$1.info(pe$1.A_SEND_MSG_T,{messageType:o.messageType,conversationType:e.conversationType,targetId:e.targetId,channelId:e.channelId},{traceId:a}),[4,fe.imClient.context.sendMessage(e.conversationType,e.targetId,o,void 0,a)];case 1:return r=l.sent(),d=r.code,u=r.data,(d===z$1.SUCCESS?St$1.info:St$1.warn)(pe$1.A_SEND_MSG_R,{code:d,messageUId:u?u.messageUId:"",messageId:u?u.messageId:""},{traceId:a}),d===z$1.SUCCESS?[2,{code:d,data:de(u)}]:(re.warn("send typing status message fail ->".concat(d,":").concat(pe[d],",").concat(n)),[2,{code:d,msg:pe[d]}])}}))}))}function $n(e,t,n){return b(this,void 0,void 0,(function(){var o,a,c,s;return P(this,(function(r){switch(r.label){case 0:return zt$1("messageUId",t,Ft$1.STRING,!0),o="messageUId:".concat(t,",targetId:").concat(e),re.debug("get message reader ->".concat(o)),[4,fe.imClient.context.getMessageReader(e,t,n)];case 1:return a=r.sent(),c=a.code,s=a.data,c===z$1.SUCCESS?[2,{code:c,data:s}]:(re.warn("get message reader fail ->".concat(c,":").concat(pe[c],",").concat(o)),[2,{code:c,msg:pe[c]}])}}))}))}function eo(e,t,n,o,a){return zt$1("messageType",e,Ft$1.STRING,!0),zt$1("isPersited",t,Ft$1.BOOLEAN,!0),zt$1("isCounted",n,Ft$1.BOOLEAN,!0),zt$1("isStatusMessage",a,Ft$1.BOOLEAN,!1),St$1.info(pe$1.A_REGTYP_O,{messageType:e,isCounted:n,isStatusMessage:a,isPersited:t}),fe.imClient.context.registerMessageType(e,t,n,o,a),Ht(e,t,n)}function to(e){return b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return fn$1()?(zt$1("conversation.conversationType",e.conversationType,Ft$1.NUMBER,!0),zt$1("conversation.targetId",e.targetId,Ft$1.STRING,!0),zt$1("conversation.channelId",null==e?void 0:e.channelId,Ft$1.CHANNEL_ID),[4,fe.imClient.context.getFirstUnreadMessage(e.conversationType,e.targetId,e.channelId)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return t=a.sent(),n=t.code,o=t.data,n===z$1.SUCCESS?[2,{code:n,data:o}]:(re.warn("insertMessage ->code:".concat(n,",targetId:").concat(e.targetId)),[2,{code:n,msg:pe[n]}])}}))}))}function no(e,t,n){return void 0===n&&(n={}),b(this,void 0,void 0,(function(){var o,a,c,s,r,d,u,l,g,f,m,p,v,h,I,S;return P(this,(function(C){switch(C.label){case 0:return le("RongIMLib.insertMessage","RongIMLib.ElectronExtension.insertMessage"),fn$1()?(o=t.senderUserId,a=t.messageType,c=t.content,s=t.messageDirection,r=t.messageUId,d=t.canIncludeExpansion,u=t.expansion,l=t.disableNotification,g=t.sentTime,f=t.sentStatus,re.info("insertMessage ->targetId:".concat(e.targetId,",conversationType:").concat(e.conversationType)),m=n.isUnread,p=n.searchContent,v={senderUserId:o,messageType:a,content:c,messageDirection:s,sentTime:g,sentStatus:f,searchContent:p,isUnread:m,messageUId:r,disableNotification:l,canIncludeExpansion:d,expansionMsg:JSON.stringify(u),channelId:e.channelId||""},[4,fe.imClient.context.insertMessage(e.conversationType,e.targetId,v)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return h=C.sent(),I=h.code,S=h.data,I===z$1.SUCCESS?[2,{code:I,data:de(S)}]:(re.warn("insertMessage ->code:".concat(I,",targetId:").concat(e.targetId)),[2,{code:I,msg:pe[I]}])}}))}))}function oo(e){return b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return fn$1()?[4,fe.imClient.context.getMessage(e)]:[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return t=a.sent(),n=t.code,o=t.data,n===z$1.SUCCESS?[2,{code:n,data:de(o)}]:(re.warn("getMessage ->code:".concat(n,",messageId:").concat(e)),[2,{code:n,msg:pe[n]}])}}))}))}function ao(e){if(!fn$1())return {code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]};var t=e.conversationType,n=e.targetId;zt$1("conversationType",t,Ft$1.NUMBER,!0),zt$1("targetId",n,Ft$1.STRING,!0);var o=fe.imClient.context.getUnreadMentionedMessages(t,n),a=[];return o&&o.length&&o.forEach((function(e){return a.push(de(e))})),{code:z$1.SUCCESS,data:a}}function io(e,t,n,o){return b(this,void 0,void 0,(function(){var a,c,s,r;return P(this,(function(d){switch(d.label){case 0:return le("RongIMLib.searchMessages","RongIMLib.ElectronExtension.searchMessages"),fn$1()?(zt$1("conversationType",e.conversationType,Ft$1.NUMBER,!0),zt$1("targetId",e.targetId,Ft$1.STRING,!0),zt$1("keyword",t,Ft$1.STRING,!0),zt$1("timestamp",n,Ft$1.NUMBER),zt$1("count",o,Ft$1.NUMBER),[4,fe.imClient.context.searchMessageByContent(e.conversationType,e.targetId,t,n,o,1,e.channelId)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return a=d.sent(),c=a.code,s=a.data,c===z$1.SUCCESS?(r=[],(null==s?void 0:s.messages)&&s.messages.length&&s.messages.forEach((function(e){return r.push(de(e))})),[2,{code:c,data:{messages:r,count:null==s?void 0:s.count}}]):(re.warn("searchMessages ->code:".concat(c,",targetId:").concat(e.targetId)),[2,{code:c,msg:pe[c]}])}}))}))}function co(e,t,n){return b(this,void 0,void 0,(function(){var o,a,r,d;return P(this,(function(u){switch(u.label){case 0:return le("RongIMLib.deleteLocalMessagesByTimestamp","RongIMLib.ElectronExtension.deleteMessagesByTimestamp"),fn$1()?(o=e.conversationType,a=e.targetId,r=e.channelId,zt$1("conversationType",o,Ft$1.NUMBER,!0),zt$1("targetId",a,Ft$1.STRING,!0),zt$1("timestamp",t,Ft$1.NUMBER,!0),zt$1("cleanSpace",n,Ft$1.BOOLEAN),[4,fe.imClient.context.deleteMessagesByTimestamp(o,a,t,n,r)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return d=u.sent(),St$1.debug(pe$1.A_DELETE_MESSAGES_S,{code:d,conversationType:o,targetId:a,channelId:r,timestamp:t}),d===z$1.SUCCESS?[2,{code:d}]:(re.warn("deleteLocalMessagesByTimestamp ->code:".concat(d,",targetId:").concat(e.targetId)),[2,{code:d,msg:pe[d]}])}}))}))}function so(e){return b(this,void 0,void 0,(function(){var t,n,o,a;return P(this,(function(c){switch(c.label){case 0:return le("RongIMLib.clearMessages","RongIMLib.ElectronExtension.clearMessages"),fn$1()?(t=e.conversationType,n=e.targetId,o=e.channelId,re.info("clearMessages ->targetId:".concat(n,",conversationType:").concat(t)),[4,fe.imClient.context.clearMessages(t,n,o)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return (a=c.sent())===z$1.SUCCESS?[2,{code:a}]:(re.warn("clearMessages ->code:".concat(a,",targetId:").concat(n)),[2,{code:a,msg:pe[a]}])}}))}))}function ro(e,t,n,o){return b(this,void 0,void 0,(function(){var a,c,s;return P(this,(function(r){switch(r.label){case 0:return le("RongIMLib.searchConversationByContent","RongIMLib.ElectronExtension.searchConversationByContent"),fn$1()?(re.info("searchConversationByContent ->keyword:".concat(e)),[4,fe.imClient.context.searchConversationByContent(e,n,o,t)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return a=r.sent(),c=a.code,s=a.data,c===z$1.SUCCESS?[2,{code:c,data:s}]:(re.warn("searchConversationByContent ->code:".concat(c,",keyword:").concat(e)),[2,{code:c,msg:pe[c]}])}}))}))}function uo(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c;return P(this,(function(s){switch(s.label){case 0:return fn$1()?(n=e.conversationType,o=e.targetId,a=e.channelId,re.info("clearUnreadCountByTimestamp ->targetId:".concat(o,",conversationType:").concat(n)),[4,fe.imClient.context.clearUnreadCountByTimestamp(n,o,t,a)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return (c=s.sent())===z$1.SUCCESS?[2,{code:c}]:(re.warn("clearUnreadCountByTimestamp ->code:".concat(c,",targetId:").concat(o)),[2,{code:c,msg:pe[c]}])}}))}))}function lo(e,t){return b(this,void 0,void 0,(function(){var n;return P(this,(function(o){switch(o.label){case 0:return le("RongIMLib.setMessageReceivedStatus","RongIMLib.ElectronExtension.setMessageReceivedStatus"),fn$1()?(zt$1("messageId",e,Ft$1.NUMBER,!0),zt$1("receivedStatus",t,Ft$1.NUMBER,!0),re.info("setMessageReceivedStatus ->messageId:".concat(e,",receivedStatus:").concat(t)),[4,fe.imClient.context.setMessageReceivedStatus(e,t)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return (n=o.sent())===z$1.SUCCESS?[2,{code:n}]:(re.warn("setMessageReceivedStatus ->code:".concat(n,",messageId:").concat(e)),[2,{code:n,msg:pe[n]}])}}))}))}function go(e){return b(this,void 0,void 0,(function(){var t;return P(this,(function(n){switch(n.label){case 0:return zt$1("tag.tagId",e.tagId,Ft$1.STRING,!0),zt$1("tag.tagId",e.tagId,(function(e){return e.length<=10})),zt$1("tag.tagName",e.tagName,(function(e){return e.length<=15})),zt$1("tag.tagName",e.tagName,Ft$1.STRING,!0),re.info("createTag ->tagId:".concat(e.tagId,",tagName:").concat(e.tagName)),[4,fe.imClient.context.createTag(e)];case 1:return (t=n.sent().code)===z$1.SUCCESS?[2,{code:t}]:(re.warn("createTag ->code:".concat(t,",tagId:").concat(e.tagId)),[2,{code:t,msg:pe[t]}])}}))}))}function fo(e){return b(this,void 0,void 0,(function(){var t;return P(this,(function(n){switch(n.label){case 0:return zt$1("tagId",e,Ft$1.STRING,!0),re.info("removeTag ->tagId:".concat(e)),[4,fe.imClient.context.removeTag(e)];case 1:return (t=n.sent().code)===z$1.SUCCESS?[2,{code:t}]:(re.warn("removeTag ->code:".concat(t,",tagId:").concat(e)),[2,{code:t,msg:pe[t]}])}}))}))}function mo(e){return b(this,void 0,void 0,(function(){var t;return P(this,(function(n){switch(n.label){case 0:return zt$1("tag.tagId",e.tagId,Ft$1.STRING,!0),zt$1("tag.tagName",e.tagName,Ft$1.STRING,!0),zt$1("tag.tagName",e.tagName,(function(e){return e.length<=15})),re.info("updateTag ->tagId:".concat(e.tagId,",tagName:").concat(e.tagName)),[4,fe.imClient.context.updateTag(e)];case 1:return (t=n.sent().code)===z$1.SUCCESS?[2,{code:t}]:(re.warn("updateTag ->code:".concat(t,",tagId:").concat(e.tagId)),[2,{code:t,msg:pe[t]}])}}))}))}function po(){return b(this,void 0,void 0,(function(){var e,t,n;return P(this,(function(o){switch(o.label){case 0:return [4,fe.imClient.context.getTagList()];case 1:return e=o.sent(),t=e.code,n=e.data,t===z$1.SUCCESS?[2,{code:z$1.SUCCESS,data:n}]:(re.warn("getTagList ->code:".concat(t)),[2,{code:t,msg:pe[t]}])}}))}))}function vo(e){return b(this,void 0,void 0,(function(){var t,n,o;return P(this,(function(a){switch(a.label){case 0:return zt$1("conversationType",e.conversationType,Ft$1.NUMBER),zt$1("targetId",e.targetId,Ft$1.STRING),zt$1("channelId",e.channelId,Ft$1.CHANNEL_ID),re.info("getTagsForConversation ->targetId:".concat(e.targetId,",conversationType:").concat(e.conversationType)),[4,fe.imClient.context.getTagsForConversation(e)];case 1:return t=a.sent(),n=t.code,o=t.data,n===z$1.SUCCESS?[2,{code:n,data:o}]:[2,{code:n,msg:pe[n]}]}}))}))}function ho(e,t){return b(this,void 0,void 0,(function(){var n;return P(this,(function(o){switch(o.label){case 0:return zt$1("tagId",e,Ft$1.STRING,!0),zt$1("conversations",t,Ft$1.ARRAY,!0),t.forEach((function(e){zt$1("conversation.conversationType",e.conversationType,Ft$1.NUMBER,!0),zt$1("conversation.targetId",e.targetId,Ft$1.STRING,!0),zt$1("conversation.channelId",e.channelId,Ft$1.CHANNEL_ID);})),re.info("addTagForConversations ->tagId:".concat(e)),[4,fe.imClient.context.addTagForConversations(e,t)];case 1:return (n=o.sent().code)===z$1.SUCCESS?[2,{code:n}]:(re.warn("addTagForConversations ->code:".concat(n,",tagId:").concat(e)),[2,{code:n,msg:pe[n]}])}}))}))}function Io(e,t){return b(this,void 0,void 0,(function(){var n;return P(this,(function(o){switch(o.label){case 0:return zt$1("tagId",e,Ft$1.STRING,!0),zt$1("conversations",t,Ft$1.ARRAY,!0),t.forEach((function(e){zt$1("conversation.conversationType",e.conversationType,Ft$1.NUMBER,!0),zt$1("conversation.targetId",e.targetId,Ft$1.STRING,!0),zt$1("conversation.channelId",e.channelId,Ft$1.CHANNEL_ID);})),re.info("removeTagForConversations ->tagId:".concat(e)),[4,fe.imClient.context.removeTagForConversations(e,t)];case 1:return (n=o.sent().code)===z$1.SUCCESS?[2,{code:n}]:(re.warn("removeTagForConversations ->code:".concat(n,",tagId:").concat(e)),[2,{code:n,msg:pe[n]}])}}))}))}function So(e,t){return b(this,void 0,void 0,(function(){var n;return P(this,(function(o){switch(o.label){case 0:return zt$1("conversation.conversationType",e.conversationType,Ft$1.NUMBER,!0),zt$1("conversation.targetId",e.targetId,Ft$1.STRING,!0),zt$1("conversation.channelId",e.channelId,Ft$1.CHANNEL_ID),zt$1("tagIds",t,Ft$1.ARRAY,!0),t.forEach((function(e){zt$1("tagId",e,Ft$1.STRING,!0);})),re.info("removeTagsForConversation ->tagIds:".concat(t,",targetId:").concat(e.targetId,",conversationType:").concat(e.conversationType)),[4,fe.imClient.context.removeTagsForConversation(e,t)];case 1:return (n=o.sent().code)===z$1.SUCCESS?[2,{code:n}]:(re.warn("removeTagsForConversation ->code:".concat(n,",tagIds:").concat(t)),[2,{code:n,msg:pe[n]}])}}))}))}function Co(e,t){return b(this,void 0,void 0,(function(){var n;return P(this,(function(o){switch(o.label){case 0:return zt$1("tagId",e,Ft$1.STRING,!0),zt$1("conversations",t,Ft$1.ARRAY,!0),t.forEach((function(e){zt$1("conversation.conversationType",e.conversationType,Ft$1.NUMBER,!0),zt$1("conversation.targetId",e.targetId,Ft$1.STRING,!0),zt$1("conversation.channelId",e.channelId,Ft$1.CHANNEL_ID);})),re.info("removeTagForConversations ->tagId:".concat(e)),[4,fe.imClient.context.removeTagForConversations(e,t)];case 1:return (n=o.sent().code)===z$1.SUCCESS?[2,{code:n}]:(re.warn("removeTagForConversations ->code:".concat(n,",tagId:").concat(e)),[2,{code:n,msg:pe[n]}])}}))}))}function To(e,t,n){return b(this,void 0,void 0,(function(){var o,a,c;return P(this,(function(s){switch(s.label){case 0:return zt$1("tagId",e,Ft$1.STRING,!0),zt$1("count",t,Ft$1.NUMBER,!0),zt$1("startTime",n,Ft$1.NUMBER,!0),re.info("getConversationListByTag ->tagId:".concat(e)),[4,fe.imClient.context.getConversationListByTag(e,n,t)];case 1:return o=s.sent(),a=o.code,c=o.data,a===z$1.SUCCESS?[2,{code:a,data:c}]:(re.warn("getConversationListByTag ->code:".concat(a,",tagId:").concat(e)),[2,{code:a,msg:pe[a]}])}}))}))}function Eo(e,t){return b(this,void 0,void 0,(function(){var n,o,a;return P(this,(function(c){switch(c.label){case 0:return zt$1("tagId",e,Ft$1.STRING,!0),zt$1("containMuted",t,Ft$1.BOOLEAN,!0),re.info("getUnreadCountByTag ->tagId:".concat(e)),[4,fe.imClient.context.getUnreadCountByTag(e,t)];case 1:return n=c.sent(),o=n.code,a=n.data,re.info(o,a),o===z$1.SUCCESS?[2,{code:o,data:a}]:(re.warn("getUnreadCountByTag ->code:".concat(o,",tagId:").concat(e)),[2,{code:o,msg:pe[o]}])}}))}))}function No(e,t,n){return b(this,void 0,void 0,(function(){var o,a;return P(this,(function(c){switch(c.label){case 0:return zt$1("tagId",e,Ft$1.STRING,!0),zt$1("conversation.targetId",t.targetId,Ft$1.STRING,!0),zt$1("conversation.conversationType",t.conversationType,Ft$1.NUMBER,!0),zt$1("conversation.channelId",t.channelId,Ft$1.CHANNEL_ID),zt$1("status.isTop",n,Ft$1.BOOLEAN,!0),re.info("setConversationStatusInTag ->tagId:".concat(e,",targetId:").concat(t.targetId,",conversationType").concat(t.conversationType)),[4,fe.imClient.context.setConversationStatusInTag(e,t,{isTop:n})];case 1:return o=c.sent(),a=o.code,o.data,a===z$1.SUCCESS?[2,{code:a}]:(re.warn("setConversationStatusInTag ->code:".concat(a,",tagId:").concat(e)),[2,{code:a,msg:pe[a]}])}}))}))}Pn(j$1.COMBINE_HTML,(function(e,t){return new Yt({remoteUrl:e.downloadUrl,nameList:t.nameList,summaryList:t.summaryList,conversationType:t.conversationType,user:t.user,extra:t.extra})}));var yo={COMET:"comet",WEBSOCKET:"websocket"},Ro={TEXT:"RC:TxtMsg",VOICE:"RC:VcMsg",HQ_VOICE:"RC:HQVCMsg",IMAGE:"RC:ImgMsg",GIF:"RC:GIFMsg",RICH_CONTENT:"RC:ImgTextMsg",LOCATION:"RC:LBSMsg",FILE:"RC:FileMsg",SIGHT:"RC:SightMsg",COMBINE:"RC:CombineMsg",CHRM_KV_NOTIFY:"RC:chrmKVNotiMsg",LOG_COMMAND:"RC:LogCmdMsg",EXPANSION_NOTIFY:"RC:MsgExMsg",REFERENCE:"RC:ReferenceMsg",RECALL_MESSAGE_TYPE:"RC:RcCmd"};var _o=Object.freeze({__proto__:null,getAllConversationList:function(e){return b(this,void 0,void 0,(function(){var t,n,o,a;return P(this,(function(c){switch(c.label){case 0:return fn$1()?(zt$1("channelId",e,Ft$1.ONLY_STRING),re.info("getAllConversationList -> channelId: ".concat(e)),He$1(e)?[4,fe.imClient.context.getConversationListWithAllChannel()]:[3,2]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return t=c.sent(),[3,4];case 2:return [4,fe.imClient.context.getConversationList(void 0,void 0,void 0,void 0,e)];case 3:t=c.sent(),c.label=4;case 4:return n=t.code,o=t.data,n===z$1.SUCCESS&&o?(a=o.map((function(e){return ue(e)})),[2,{code:n,data:a}]):(re.warn("getAllConversationList fail -> code: ".concat(n," channelId: ").concat(e)),[2,{code:n,msg:pe[n]}])}}))}))},getConversationList:function(e,t,n){return b(this,void 0,void 0,(function(){var o,a,c,s,r,d;return P(this,(function(u){switch(u.label){case 0:return fn$1()?(zt$1("startTime",e,Ft$1.NUMBER,!0),zt$1("count",t,Ft$1.NUMBER,!0),zt$1("channelId",n,Ft$1.ONLY_STRING),o="startTime: ".concat(e,", count: ").concat(t,", channelId: ").concat(n),re.info("getConversationList -> ".concat(o)),He$1(n)?[4,fe.imClient.context.getConversationListWithAllChannelByPage(e,t)]:[3,2]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return a=u.sent(),[3,4];case 2:return c=[1,2,3,5,6,7,8],[4,fe.imClient.context.getConversationsByPage(c,e,t,n)];case 3:a=u.sent(),u.label=4;case 4:return s=a.code,r=a.data,s===z$1.SUCCESS&&r?(d=r.map((function(e){return ue(e)})),[2,{code:s,data:d}]):(re.warn("getConversationList fail -> code: ".concat(s," ").concat(o)),[2,{code:s,msg:pe[s]}])}}))}))},searchConversationByContent:function e(t,n,o){return b(this,void 0,void 0,(function(){var a,c,s,r,d;return P(this,(function(u){switch(u.label){case 0:return fn$1()?(zt$1("keyword",t,Ft$1.STRING,!0),zt$1("messageTypes",n,Ft$1.ARRAY,!0),zt$1("channelId",o,Ft$1.ONLY_STRING),n.forEach((function(e){zt$1("messageType",e,Ft$1.STRING,!0);})),a="keyword: ".concat(t,", messageTypes: ").concat(JSON.stringify(n),", channelId: ").concat(o),re.info("searchConversationByContent -> ".concat(e)),He$1(o)?[4,fe.imClient.context.searchConversationByContentWithAllChannel(t,n)]:[3,2]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return c=u.sent(),[3,4];case 2:return [4,fe.imClient.context.searchConversationByContent(t,n,o)];case 3:c=u.sent(),u.label=4;case 4:return s=c.code,r=c.data,s===z$1.SUCCESS&&r?(d=r.map((function(e){return ue(e)})),[2,{code:s,data:d}]):(re.warn("searchConversationByContent fail -> code: ".concat(s," ").concat(a)),[2,{code:s,msg:pe[s]}])}}))}))},searchMessages:function(e,t,n,o){return b(this,void 0,void 0,(function(){var a,c,s,r,d,u,l,f,m,p;return P(this,(function(v){switch(v.label){case 0:return fn$1()?(zt$1("conversation",e,Ft$1.CONVERSATION,!0),zt$1("keyword",t,Ft$1.STRING,!0),zt$1("startTime",n,Ft$1.NUMBER,!0),zt$1("count",o,Ft$1.NUMBER,!0),a="conversation: ".concat(JSON.stringify(e),", keyword: ").concat(t,", timestamp: ").concat(n,", count: ").concat(o),re.info("searchMessages -> ".concat(a)),c=e.targetId,s=e.conversationType,r=e.channelId,He$1(r)?[4,fe.imClient.context.searchMessageByContentWithAllChannel(s,c,t,n,o)]:[3,2]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return d=v.sent(),[3,4];case 2:return [4,fe.imClient.context.searchMessageByContent(s,c,t,n,o,0,r)];case 3:d=v.sent(),v.label=4;case 4:return u=d.code,l=d.data,u===z$1.SUCCESS&&l?(f=l.messages,m=l.count,p=f.map((function(e){return de(e)})),[2,{code:u,data:{messages:p,count:m}}]):(re.warn("searchMessages fail -> code: ".concat(u," ").concat(a)),[2,{code:u,msg:pe[u]}])}}))}))},searchMessageInTimeRange:function(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u,l,f,m;return P(this,(function(p){switch(p.label){case 0:return fn$1()?(zt$1("conversation",e,Ft$1.CONVERSATION,!0),zt$1("option",t,Ft$1.OBJECT,!0),zt$1("option.keyword",t.keyword,Ft$1.STRING,!0),zt$1("option.startTime",t.startTime,Ft$1.NUMBER,!0),zt$1("option.endTime",t.endTime,Ft$1.NUMBER,!0),zt$1("option.offset",t.offset,Ft$1.NUMBER),zt$1("option.limit",t.limit,Ft$1.NUMBER),n="conversation: ".concat(JSON.stringify(e),", option: ").concat(JSON.stringify(t)),re.info("searchMessageInTimeRange -> ".concat(n)),o=e.conversationType,a=e.targetId,c=t.keyword,s=t.startTime,r=t.endTime,d=t.offset,u=t.limit,d=d||0,u=u||5,[4,fe.imClient.context.searchMessageByContentInTimeRangeWithAllChannel(o,a,c,s,r,d,u)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return l=p.sent(),f=l.code,m=l.data,f===z$1.SUCCESS&&m?[2,{code:f,data:{messages:m.messages.map((function(e){return de(e)}))}}]:(re.warn("searchMessageInTimeRange fail -> code: ".concat(f,", ").concat(n)),[2,{code:f}])}}))}))},getHistoryMessagesByMessageTypes:function(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c,s,r,d,u,l,f,m,p,v,h,I;return P(this,(function(C){switch(C.label){case 0:return fn$1()?(zt$1("conversation",e,Ft$1.CONVERSATION,!0),zt$1("option",t,Ft$1.OBJECT,!0),n=t.count,o=t.timestamp,a=t.order,c=t.messageTypes,zt$1("option.count",n,Ft$1.NUMBER),zt$1("option.timestamp",o,Ft$1.NUMBER),zt$1("option.order",a,(function(e){return [0,1].includes(e)})),zt$1("option.messageTypes",c,Ft$1.ARRAY,!0),c.forEach((function(e){zt$1("option.messageType",e,Ft$1.STRING,!0);})),s="conversation: ".concat(JSON.stringify(e),", option: ").concat(JSON.stringify(t)),re.info("getHistoryMessagesByMessageTypes -> ".concat(s)),r=e.conversationType,d=e.targetId,u=e.channelId,n||(n=20),o||(o=0),a||(a=0),u||(u=""),[4,fe.imClient.context.getHistoryMessagesByObjectNames(r,d,o,n,c,a,u)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return l=C.sent(),f=l.code,m=l.data,f===z$1.SUCCESS?(v=(p=m).list,h=p.hasMore,I=v.map((function(e){return de(e)})),[2,{code:f,data:{messages:I,hasMore:h}}]):(re.warn("getHistoryMessagesByMessageTypes fail -> code: ".concat(f," ").concat(s)),[2,{code:f,msg:pe[f]}])}}))}))},setMessageStatusToRead:function(e,t){return b(this,void 0,void 0,(function(){var n,o,a,c;return P(this,(function(s){switch(s.label){case 0:return fn$1()?(zt$1("conversation",e,Ft$1.CONVERSATION,!0),zt$1("timestamp",t,Ft$1.NUMBER,!0),n="conversation: ".concat(JSON.stringify(e),", timestamp: ").concat(t),re.info("updateSentMsgReceiptStatus -> ".concat(n)),o=e.conversationType,a=e.targetId,c=e.channelId,[4,fe.imClient.context.setMessageStatusToRead(o,a,t,c)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return [2,s.sent()]}}))}))},setMessageReceivedStatus:function(e,t){return b(this,void 0,void 0,(function(){return P(this,(function(n$1){switch(n$1.label){case 0:return fn$1()?(zt$1("messageId",e,Ft$1.NUMBER,!0),zt$1("receivedStatus",t,(function(e){return !He$1(n[e])}),!0),re.info("setMessageReceivedStatus -> messageId: ".concat(e,", receivedStatus: ").concat(t)),[4,fe.imClient.context.setMessageReceivedStatus(e,t)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return [2,{code:n$1.sent()}]}}))}))},setMessageSentStatus:function(e,t){return b(this,void 0,void 0,(function(){return P(this,(function(n){switch(n.label){case 0:return fn$1()?(zt$1("messageId",e,Ft$1.NUMBER,!0),zt$1("sentStatus",t,(function(e){return !He$1(k[e])}),!0),re.info("setMessageSentStatus ->messageId: ".concat(e,", sentStatus: ").concat(t)),[4,fe.imClient.context.setMessageSentStatus(e,t)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return [2,{code:n.sent()}]}}))}))},setMessageContent:function(e,t,n){return void 0===n&&(n=""),b(this,void 0,void 0,(function(){return P(this,(function(o){switch(o.label){case 0:return fn$1()?(zt$1("messageId",e,Ft$1.NUMBER,!0),zt$1("content",t,Ft$1.OBJECT,!0),zt$1("messageType",n,Ft$1.ONLY_STRING,!0),re.info("setMessageSentStatus ->messageId: ".concat(e,", messageType: ").concat(n)),[4,fe.imClient.context.setMessageContent(e,t,n)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return [2,{code:o.sent()}]}}))}))},deleteMessages:function(e){return b(this,void 0,void 0,(function(){return P(this,(function(t){switch(t.label){case 0:return fn$1()?(zt$1("messageIds",e,Ft$1.ARRAY,!0),e.forEach((function(e){zt$1("messageId",e,Ft$1.NUMBER,!0);})),re.info("deleteMessages ->messageIds: ".concat(JSON.stringify(e))),[4,fe.imClient.context.deleteMessages(e)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return [2,{code:t.sent()}]}}))}))},clearMessages:function(e){return b(this,void 0,void 0,(function(){var t,n,o,a;return P(this,(function(c){switch(c.label){case 0:return fn$1()?(t=e.conversationType,n=e.targetId,o=e.channelId,re.info("clearMessages ->targetId:".concat(n,",conversationType:").concat(t)),[4,fe.imClient.context.clearMessages(t,n,o)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return (a=c.sent())===z$1.SUCCESS?[2,{code:a}]:(re.warn("clearMessages ->code:".concat(a,",targetId:").concat(n)),[2,{code:a,msg:pe[a]}])}}))}))},deleteMessagesByTimestamp:function(e,t,n){return b(this,void 0,void 0,(function(){var o,a,c,s;return P(this,(function(r){switch(r.label){case 0:return fn$1()?(o=e.conversationType,a=e.targetId,c=e.channelId,zt$1("conversationType",o,Ft$1.NUMBER,!0),zt$1("targetId",a,Ft$1.STRING,!0),zt$1("timestamp",t,Ft$1.NUMBER,!0),zt$1("cleanSpace",n,Ft$1.BOOLEAN),[4,fe.imClient.context.deleteMessagesByTimestamp(o,a,t,n,c)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return (s=r.sent())===z$1.SUCCESS?[2,{code:s}]:(re.warn("deleteMessagesByTimestamp ->code:".concat(s,",targetId:").concat(a)),[2,{code:s,msg:pe[s]}])}}))}))},insertMessage:function(e,t,n){return void 0===n&&(n={}),b(this,void 0,void 0,(function(){var o,a,c,s,r,d,u,l,g,f,m,p,v,h,I,S;return P(this,(function(C){switch(C.label){case 0:return fn$1()?(o=t.senderUserId,a=t.messageType,c=t.content,s=t.messageDirection,r=t.messageUId,d=t.canIncludeExpansion,u=t.expansion,l=t.disableNotification,g=t.sentTime,f=t.sentStatus,re.info("insertMessage ->targetId:".concat(e.targetId,",conversationType:").concat(e.conversationType)),m=n.isUnread,p=n.searchContent,v={senderUserId:o,messageType:a,content:c,messageDirection:s,sentTime:g,sentStatus:f,searchContent:p,isUnread:m,messageUId:r,disableNotification:l,canIncludeExpansion:d,expansionMsg:JSON.stringify(u),channelId:e.channelId||""},[4,fe.imClient.context.insertMessage(e.conversationType,e.targetId,v)]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return h=C.sent(),I=h.code,S=h.data,I===z$1.SUCCESS?[2,{code:I,data:de(S)}]:(re.warn("insertMessage ->code:".concat(I,",targetId:").concat(e.targetId)),[2,{code:I,msg:pe[I]}])}}))}))},clearLocalData:function(){return b(this,void 0,void 0,(function(){var e,t,n;return P(this,(function(o){switch(o.label){case 0:return fn$1()?(re.info("clearData -> "),[4,fe.imClient.context.clearData()]):[2,{code:z$1.NOT_SUPPORT,msg:pe[z$1.NOT_SUPPORT]}];case 1:return e=o.sent(),t=e.code,n=e.data,[2,{code:t,data:n}]}}))}))}}),Uo=function(e,t,n){this.type=e,this.userIdList=t,this.mentionedContent=n;};Kt$1.add("imlib-next","5.5.5");

    var RongIMLib = /*#__PURE__*/Object.freeze({
        __proto__: null,
        BaseMessage: kt,
        CombineMessage: Yt,
        ConnectType: yo,
        get Events () { return B; },
        FileMessage: Wt,
        GIFMessage: Xt,
        HQVoiceMessage: zt,
        ImageMessage: Vt,
        LocationMessage: Qt,
        MentionedInfoBody: Uo,
        MessageType: Ro,
        ReferenceMessage: Zt,
        RichContentMessage: $t,
        get SentStatus () { return k; },
        SightMessage: Kt,
        TextMessage: Jt,
        VoiceMessage: jt,
        __addSDKVersion: Ae,
        addConversationsToTag: ho,
        addEventListener: Re,
        addTag: go,
        addToBlacklist: Pt,
        bindRTCRoomForChatroom: bt,
        clearAllMessagesUnreadStatus: Ve,
        clearEventListeners: Me,
        clearHistoryMessages: Xn,
        clearMessages: so,
        clearMessagesUnreadStatus: qe,
        clearTextMessageDraft: De,
        clearUnreadCountByTimestamp: uo,
        connect: Ce,
        deleteLocalMessagesByTimestamp: co,
        deleteMessages: Wn,
        disconnect: Te,
        electronExtension: _o,
        forceRemoveChatRoomEntry: At,
        forceSetChatRoomEntry: Ut,
        getAllChatRoomEntries: xt,
        getAllConversationState: nt,
        getAllUltraGroupUnreadCount: pt,
        getAllUltraGroupUnreadMentionedCount: vt,
        getAllUnreadMentionedCount: et,
        getBlacklist: Dt,
        getBlacklistStatus: Bt,
        getBlockUltraGroupList: at,
        getBlockedConversationList: je,
        getChatRoomEntry: wt,
        getChatRoomInfo: yt,
        getChatroomHistoryMessages: Lt,
        getConnectionStatus: Ee,
        getConversation: Le,
        getConversationList: xe,
        getConversationNotificationLevel: We,
        getConversationNotificationStatus: Xe,
        getConversationsFromTagByPage: To,
        getCurrentUserId: ye,
        getDeviceId: we,
        getFileToken: wn,
        getFileUrl: xn,
        getFirstUnreadMessage: to,
        getHistoryMessages: Hn,
        getMessage: oo,
        getMessageReader: $n,
        getRemoteHistoryMessages: Fn,
        getServerTime: Ne,
        getTags: po,
        getTagsFromConversation: vo,
        getTextMessageDraft: Pe,
        getTopConversationList: Ze,
        getTotalUnreadCount: Be,
        getTotalUnreadCountByLevels: ke,
        getTotalUnreadMentionedCountByLevels: He,
        getUltraGroupDefaultNotificationLevel: gt,
        getUltraGroupFirstUnreadMessageTimestamp: It,
        getUltraGroupList: ot,
        getUltraGroupMessageListByMessageUId: ct,
        getUltraGroupUnreadCountByTargetId: mt,
        getUltraGroupUnreadMentionedCountByTargetId: lt,
        getUltraGroupUnreadMentionedMessages: ht,
        getUnreadCount: Fe,
        getUnreadCountByTag: Eo,
        getUnreadMentionedCount: $e,
        getUnreadMentionedMessages: ao,
        init: Ie,
        insertMessage: no,
        installPlugin: Se,
        joinChatRoom: Tt,
        joinExistChatRoom: Et,
        modifyMessage: ut,
        onceEventListener: _e,
        quitChatRoom: Nt,
        recallMessage: Yn,
        registerMessageType: eo,
        removeAllExpansionForUltraGroupMessage: dt,
        removeChatRoomEntries: Mt,
        removeChatRoomEntry: Ot,
        removeConversation: be,
        removeConversationsFromTag: Io,
        removeEventListener: Ue,
        removeEventListeners: Oe,
        removeExpansionForUltraGroupMessage: rt,
        removeFromBlacklist: Gt,
        removeMessageExpansionForKey: Qn,
        removeTag: fo,
        removeTagFromConversations: Co,
        removeTagsFromConversation: So,
        saveTextMessageDraft: Ge,
        searchConversationByContent: ro,
        searchMessages: io,
        sendFileMessage: Gn,
        sendHQVoiceMessage: Bn,
        sendImageMessage: Dn,
        sendMessage: Ln,
        sendReadReceiptMessage: qn,
        sendReadReceiptRequest: Vn,
        sendReadReceiptResponse: zn,
        sendReadReceiptResponseV2: Kn,
        sendSightMessage: kn,
        sendSyncReadStatusMessage: Jn,
        sendTextMessage: bn,
        sendTypingStatusMessage: Zn,
        sendUltraGroupTypingStatus: it,
        setChatRoomEntries: _t,
        setChatRoomEntry: Rt,
        setConversationNotificationLevel: Je,
        setConversationNotificationStatus: Ye,
        setConversationToTop: Qe,
        setConversationToTopInTag: No,
        setMessageReceivedStatus: lo,
        setUltraGroupDefaultNotificationLevel: ft,
        updateExpansionForUltraGroupMessage: st,
        updateMessageExpansion: jn,
        updateTag: mo,
        ChatroomEntryType: _e$1,
        ChatroomUserChangeType: ye$1,
        ConnectionStatus: ee$1,
        ConversationType: X$1,
        ErrorCode: z$1,
        FileType: j$1,
        get LogLevel () { return de$1; },
        get LogSource () { return fe$1; },
        get LogTagId () { return pe$1; },
        MentionedType: ue$1,
        get MessageBlockSourceType () { return ve$1; },
        MessageBlockType: Te$1,
        MessageDirection: W$1,
        NotificationLevel: ae$1,
        NotificationStatus: oe$1,
        ReceivedStatus: n,
        get UltraGroupChannelType () { return Ie$1; },
        UploadMethod: he$1,
        logger: St$1
    });

    // TODO: 待确认：未使用是否可删除，Web 无黑名单功能
    exports.RCIMIWBlacklistStatus = void 0;
    (function (RCIMIWBlacklistStatus) {
        /* 未知 */
        RCIMIWBlacklistStatus[RCIMIWBlacklistStatus["UNKNOWN"] = 0] = "UNKNOWN";
        /* 在黑名单中 */
        RCIMIWBlacklistStatus[RCIMIWBlacklistStatus["IN_BLACKLIST"] = 1] = "IN_BLACKLIST";
        /* 不在黑名单 */
        RCIMIWBlacklistStatus[RCIMIWBlacklistStatus["NOT_IN_BLACKLIST"] = 2] = "NOT_IN_BLACKLIST";
    })(exports.RCIMIWBlacklistStatus || (exports.RCIMIWBlacklistStatus = {}));

    exports.RCIMIWChatRoomEntriesOperationType = void 0;
    (function (RCIMIWChatRoomEntriesOperationType) {
        /* 更新操作 */
        RCIMIWChatRoomEntriesOperationType[RCIMIWChatRoomEntriesOperationType["Update"] = 0] = "Update";
        /* 删除操作 */
        RCIMIWChatRoomEntriesOperationType[RCIMIWChatRoomEntriesOperationType["Remove"] = 1] = "Remove";
    })(exports.RCIMIWChatRoomEntriesOperationType || (exports.RCIMIWChatRoomEntriesOperationType = {}));

    exports.RCIMIWConnectionStatus = void 0;
    (function (RCIMIWConnectionStatus) {
        /** 网络不可用 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["NETWORK_UNAVAILABLE"] = 0] = "NETWORK_UNAVAILABLE";
        /** 连接成功 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["CONNECTED"] = 1] = "CONNECTED";
        /** 连接中 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["CONNECTING"] = 2] = "CONNECTING";
        /** 未连接 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["UNCONNECTED"] = 3] = "UNCONNECTED";
        /** 用户账户在其他设备登录，本机会被踢掉线 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["KICKED_OFFLINE_BY_OTHER_CLIENT"] = 4] = "KICKED_OFFLINE_BY_OTHER_CLIENT";
        /** Token 不正确 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["TOKEN_INCORRECT"] = 5] = "TOKEN_INCORRECT";
        /** 用户被开发者后台封禁 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["CONN_USER_BLOCKED"] = 6] = "CONN_USER_BLOCKED";
        /** 用户主动调用 disconnect 或 logout 接口断开连接 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["SIGN_OUT"] = 7] = "SIGN_OUT";
        /** 连接暂时挂起（多是由于网络问题导致），SDK 会在合适时机进行自动重连 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["SUSPEND"] = 8] = "SUSPEND";
        /** 自动连接超时，SDK 将不会继续连接，用户需要做超时处理，再自行调用 connectWithToken 接口进行连接 */
        RCIMIWConnectionStatus[RCIMIWConnectionStatus["TIMEOUT"] = 9] = "TIMEOUT";
    })(exports.RCIMIWConnectionStatus || (exports.RCIMIWConnectionStatus = {}));

    exports.RCIMIWConversationType = void 0;
    (function (RCIMIWConversationType) {
        /* 暂不支持 */
        RCIMIWConversationType[RCIMIWConversationType["INVALID"] = 0] = "INVALID";
        /* 单聊 */
        RCIMIWConversationType[RCIMIWConversationType["PRIVATE"] = 1] = "PRIVATE";
        /* 群聊 */
        RCIMIWConversationType[RCIMIWConversationType["GROUP"] = 2] = "GROUP";
        /* 聊天室 */
        RCIMIWConversationType[RCIMIWConversationType["CHATROOM"] = 3] = "CHATROOM";
        /* 系统会话 */
        RCIMIWConversationType[RCIMIWConversationType["SYSTEM"] = 4] = "SYSTEM";
        /* 超级群 */
        RCIMIWConversationType[RCIMIWConversationType["ULTRA_GROUP"] = 5] = "ULTRA_GROUP";
    })(exports.RCIMIWConversationType || (exports.RCIMIWConversationType = {}));

    exports.RCIMIWChatRoomStatus = void 0;
    (function (RCIMIWChatRoomStatus) {
        /* 聊天室被重置 */
        RCIMIWChatRoomStatus[RCIMIWChatRoomStatus["RESET"] = 0] = "RESET";
        /* 用户调用IM Server API 手动销毁聊天室 */
        RCIMIWChatRoomStatus[RCIMIWChatRoomStatus["DESTROY_MANUAL"] = 1] = "DESTROY_MANUAL";
        /* IM Server 自动销毁聊天室 */
        RCIMIWChatRoomStatus[RCIMIWChatRoomStatus["DESTROY_AUTO"] = 2] = "DESTROY_AUTO";
    })(exports.RCIMIWChatRoomStatus || (exports.RCIMIWChatRoomStatus = {}));

    exports.RCIMIWTimeOrder = void 0;
    (function (RCIMIWTimeOrder) {
        /* 时间递减 */
        RCIMIWTimeOrder[RCIMIWTimeOrder["BEFORE"] = 0] = "BEFORE";
        /* 时间递增 */
        RCIMIWTimeOrder[RCIMIWTimeOrder["AFTER"] = 1] = "AFTER";
    })(exports.RCIMIWTimeOrder || (exports.RCIMIWTimeOrder = {}));

    exports.RCIMIWPushNotificationLevel = void 0;
    (function (RCIMIWPushNotificationLevel) {
        /**
         * 全部消息通知（接收全部消息通知 -- 显示指定关闭免打扰功能）
         */
        RCIMIWPushNotificationLevel[RCIMIWPushNotificationLevel["ALL_MESSAGE"] = 0] = "ALL_MESSAGE";
        /**
         * 未设置（向上查询群或者APP级别设置）//存量数据中0表示未设置
         */
        RCIMIWPushNotificationLevel[RCIMIWPushNotificationLevel["NONE"] = 1] = "NONE";
        /**
         * 群聊，超级群 @所有人 或者 @成员列表有自己 时通知；单聊代表消息不通知
         */
        RCIMIWPushNotificationLevel[RCIMIWPushNotificationLevel["MENTION"] = 2] = "MENTION";
        /**
         * 群聊，超级群 @成员列表有自己时通知，@所有人不通知；单聊代表消息不通知
         */
        RCIMIWPushNotificationLevel[RCIMIWPushNotificationLevel["MENTION_USERS"] = 3] = "MENTION_USERS";
        /**
         * 群聊，超级群 @所有人通知，其他情况都不通知；单聊代表消息不通知
         */
        RCIMIWPushNotificationLevel[RCIMIWPushNotificationLevel["MENTION_ALL"] = 4] = "MENTION_ALL";
        /**
         * 消息通知被屏蔽，即不接收消息通知
         */
        RCIMIWPushNotificationLevel[RCIMIWPushNotificationLevel["BLOCKED"] = 5] = "BLOCKED";
    })(exports.RCIMIWPushNotificationLevel || (exports.RCIMIWPushNotificationLevel = {}));

    exports.RCIMIWUltraGroupTypingStatus = void 0;
    (function (RCIMIWUltraGroupTypingStatus) {
        /* 正在输入文本 */
        RCIMIWUltraGroupTypingStatus[RCIMIWUltraGroupTypingStatus["TEXT"] = 0] = "TEXT";
    })(exports.RCIMIWUltraGroupTypingStatus || (exports.RCIMIWUltraGroupTypingStatus = {}));

    exports.RCIMIWCustomMessagePolicy = void 0;
    (function (RCIMIWCustomMessagePolicy) {
        /* 客户端不存储，支持离线消息机制，不计入未读消息数 */
        RCIMIWCustomMessagePolicy[RCIMIWCustomMessagePolicy["COMMAND"] = 0] = "COMMAND";
        /* 客户端存储，支持离线消息机制，且存入服务端历史消息，计入未读消息数 */
        RCIMIWCustomMessagePolicy[RCIMIWCustomMessagePolicy["NORMAL"] = 1] = "NORMAL";
        /* 客户端不存储，服务端不存储，不计入未读消息数 */
        RCIMIWCustomMessagePolicy[RCIMIWCustomMessagePolicy["STATUS"] = 2] = "STATUS";
        /* 客户端存储，支持离线消息机制，且存入服务端历史消息，不计入未读消息数 */
        RCIMIWCustomMessagePolicy[RCIMIWCustomMessagePolicy["STORAGE"] = 3] = "STORAGE";
    })(exports.RCIMIWCustomMessagePolicy || (exports.RCIMIWCustomMessagePolicy = {}));

    exports.RCIMIWErrorCode = void 0;
    (function (RCIMIWErrorCode) {
        RCIMIWErrorCode[RCIMIWErrorCode["SUCCESS"] = 0] = "SUCCESS";
        RCIMIWErrorCode[RCIMIWErrorCode["PARAM_ERROR"] = 1] = "PARAM_ERROR";
        RCIMIWErrorCode[RCIMIWErrorCode["ENGINE_DESTROYED"] = 2] = "ENGINE_DESTROYED";
        RCIMIWErrorCode[RCIMIWErrorCode["NATIVE_OPERATION_ERROR"] = 3] = "NATIVE_OPERATION_ERROR";
        RCIMIWErrorCode[RCIMIWErrorCode["RESULT_UNKNOWN"] = 4] = "RESULT_UNKNOWN";
    })(exports.RCIMIWErrorCode || (exports.RCIMIWErrorCode = {}));

    exports.RCIMIWLogLevel = void 0;
    (function (RCIMIWLogLevel) {
        /* 不输出任何日志 */
        RCIMIWLogLevel[RCIMIWLogLevel["NONE"] = 0] = "NONE";
        /* 只输出错误的日志 */
        RCIMIWLogLevel[RCIMIWLogLevel["ERROR"] = 1] = "ERROR";
        /* 输出错误和警告的日志 */
        RCIMIWLogLevel[RCIMIWLogLevel["WARN"] = 2] = "WARN";
        /* 输出错误、警告和一般的日志 */
        RCIMIWLogLevel[RCIMIWLogLevel["INFO"] = 3] = "INFO";
        /* 输出输出错误、警告和一般的日志以及 debug 日志 */
        RCIMIWLogLevel[RCIMIWLogLevel["DEBUG"] = 4] = "DEBUG";
        /* 输出所有日志 */
        RCIMIWLogLevel[RCIMIWLogLevel["VERBOSE"] = 5] = "VERBOSE";
    })(exports.RCIMIWLogLevel || (exports.RCIMIWLogLevel = {}));

    exports.RCIMIWMentionedType = void 0;
    (function (RCIMIWMentionedType) {
        /* @ 所有人 */
        RCIMIWMentionedType[RCIMIWMentionedType["ALL"] = 0] = "ALL";
        /* @ 指定的人 */
        RCIMIWMentionedType[RCIMIWMentionedType["PART"] = 1] = "PART";
    })(exports.RCIMIWMentionedType || (exports.RCIMIWMentionedType = {}));

    exports.RCIMIWMessageBlockType = void 0;
    (function (RCIMIWMessageBlockType) {
        /* 未知 */
        RCIMIWMessageBlockType[RCIMIWMessageBlockType["UNKNOWN"] = 0] = "UNKNOWN";
        /* 全局敏感词：命中了融云内置的全局敏感词 */
        RCIMIWMessageBlockType[RCIMIWMessageBlockType["GLOBAL"] = 1] = "GLOBAL";
        /* 自定义敏感词拦截：命中了客户在融云自定义的敏感词 */
        RCIMIWMessageBlockType[RCIMIWMessageBlockType["CUSTOM"] = 2] = "CUSTOM";
        /* 第三方审核拦截：命中了第三方（数美）或模板路由决定不下发的状态 */
        RCIMIWMessageBlockType[RCIMIWMessageBlockType["THIRD_PARTY"] = 3] = "THIRD_PARTY";
    })(exports.RCIMIWMessageBlockType || (exports.RCIMIWMessageBlockType = {}));

    exports.RCIMIWMessageDirection = void 0;
    (function (RCIMIWMessageDirection) {
        /* 发送方 */
        RCIMIWMessageDirection[RCIMIWMessageDirection["SEND"] = 0] = "SEND";
        /* 接收方 */
        RCIMIWMessageDirection[RCIMIWMessageDirection["RECEIVE"] = 1] = "RECEIVE";
    })(exports.RCIMIWMessageDirection || (exports.RCIMIWMessageDirection = {}));

    exports.RCIMIWMessageOperationPolicy = void 0;
    (function (RCIMIWMessageOperationPolicy) {
        /* 本地 */
        RCIMIWMessageOperationPolicy[RCIMIWMessageOperationPolicy["LOCAL"] = 0] = "LOCAL";
        /* 远端 */
        RCIMIWMessageOperationPolicy[RCIMIWMessageOperationPolicy["REMOTE"] = 1] = "REMOTE";
        /* 本地和远端 */
        RCIMIWMessageOperationPolicy[RCIMIWMessageOperationPolicy["LOCAL_REMOTE"] = 2] = "LOCAL_REMOTE";
    })(exports.RCIMIWMessageOperationPolicy || (exports.RCIMIWMessageOperationPolicy = {}));

    exports.RCIMIWMessageType = void 0;
    (function (RCIMIWMessageType) {
        /** 无效类型 */
        RCIMIWMessageType[RCIMIWMessageType["UNKNOWN"] = 0] = "UNKNOWN";
        /** 自定义 */
        RCIMIWMessageType[RCIMIWMessageType["CUSTOM"] = 1] = "CUSTOM";
        /** 文本 */
        RCIMIWMessageType[RCIMIWMessageType["TEXT"] = 2] = "TEXT";
        /** 语音 */
        RCIMIWMessageType[RCIMIWMessageType["VOICE"] = 3] = "VOICE";
        /** 图片 */
        RCIMIWMessageType[RCIMIWMessageType["IMAGE"] = 4] = "IMAGE";
        /** 文件 */
        RCIMIWMessageType[RCIMIWMessageType["FILE"] = 5] = "FILE";
        /** 小视频 */
        RCIMIWMessageType[RCIMIWMessageType["SIGHT"] = 6] = "SIGHT";
        /** GIF 图 */
        RCIMIWMessageType[RCIMIWMessageType["GIF"] = 7] = "GIF";
        /** 撤回 */
        RCIMIWMessageType[RCIMIWMessageType["RECALL"] = 8] = "RECALL";
        /** 引用 */
        RCIMIWMessageType[RCIMIWMessageType["REFERENCE"] = 9] = "REFERENCE";
        /** 命令 */
        RCIMIWMessageType[RCIMIWMessageType["COMMAND"] = 10] = "COMMAND";
        /** 命令通知 */
        RCIMIWMessageType[RCIMIWMessageType["COMMAND_NOTIFICATION"] = 11] = "COMMAND_NOTIFICATION";
        /** 位置 */
        RCIMIWMessageType[RCIMIWMessageType["LOCATION"] = 12] = "LOCATION";
    })(exports.RCIMIWMessageType || (exports.RCIMIWMessageType = {}));

    exports.RCIMIWReceivedStatus = void 0;
    (function (RCIMIWReceivedStatus) {
        /* 未读 */
        RCIMIWReceivedStatus[RCIMIWReceivedStatus["UNREAD"] = 0] = "UNREAD";
        /* 已读 */
        RCIMIWReceivedStatus[RCIMIWReceivedStatus["READ"] = 1] = "READ";
        /* 已听 */
        RCIMIWReceivedStatus[RCIMIWReceivedStatus["LISTENED"] = 2] = "LISTENED";
        /* 已下载 */
        RCIMIWReceivedStatus[RCIMIWReceivedStatus["DOWNLOADED"] = 3] = "DOWNLOADED";
        /* 该消息已经被其他登录的多端收取过。（即该消息已经被其他端收取过后。当前端才登录，并重新拉取了这条消息。客户可以通过这个状态更新 UI，比如不再提示） */
        RCIMIWReceivedStatus[RCIMIWReceivedStatus["RETRIEVED"] = 4] = "RETRIEVED";
        /* 该消息是被多端同时收取的。（即其他端正同时登录，一条消息被同时发往多端。客户可以通过这个状态值更新自己的某些 UI 状态）。 */
        RCIMIWReceivedStatus[RCIMIWReceivedStatus["MULTIPLE_RECEIVE"] = 5] = "MULTIPLE_RECEIVE";
    })(exports.RCIMIWReceivedStatus || (exports.RCIMIWReceivedStatus = {}));

    exports.RCIMIWSentStatus = void 0;
    (function (RCIMIWSentStatus) {
        /* 发送中 */
        RCIMIWSentStatus[RCIMIWSentStatus["SENDING"] = 0] = "SENDING";
        /* 发送失败 */
        RCIMIWSentStatus[RCIMIWSentStatus["FAILED"] = 1] = "FAILED";
        /* 已发送 */
        RCIMIWSentStatus[RCIMIWSentStatus["SENT"] = 2] = "SENT";
        /* 对方已接收 */
        RCIMIWSentStatus[RCIMIWSentStatus["RECEIVED"] = 3] = "RECEIVED";
        /* 对方已读 */
        RCIMIWSentStatus[RCIMIWSentStatus["READ"] = 4] = "READ";
        /* 对方已销毁 */
        RCIMIWSentStatus[RCIMIWSentStatus["DESTROYED"] = 5] = "DESTROYED";
        /* 对方已取消 */
        RCIMIWSentStatus[RCIMIWSentStatus["CANCELED"] = 6] = "CANCELED";
    })(exports.RCIMIWSentStatus || (exports.RCIMIWSentStatus = {}));

    exports.RCIMIWVIVOPushType = void 0;
    (function (RCIMIWVIVOPushType) {
        /* 运营消息 */
        RCIMIWVIVOPushType[RCIMIWVIVOPushType["OPERATE"] = 0] = "OPERATE";
        /* 系统消息 */
        RCIMIWVIVOPushType[RCIMIWVIVOPushType["SYSTEM"] = 1] = "SYSTEM";
    })(exports.RCIMIWVIVOPushType || (exports.RCIMIWVIVOPushType = {}));

    exports.RCIMIWChatRoomMemberActionType = void 0;
    (function (RCIMIWChatRoomMemberActionType) {
        /* 未知 */
        RCIMIWChatRoomMemberActionType[RCIMIWChatRoomMemberActionType["UNKNOWN"] = 0] = "UNKNOWN";
        /* 已加入 */
        RCIMIWChatRoomMemberActionType[RCIMIWChatRoomMemberActionType["JOIN"] = 1] = "JOIN";
        /* 已离开 */
        RCIMIWChatRoomMemberActionType[RCIMIWChatRoomMemberActionType["LEAVE"] = 2] = "LEAVE";
    })(exports.RCIMIWChatRoomMemberActionType || (exports.RCIMIWChatRoomMemberActionType = {}));

    class RCIMIWMessage {
        channelId;
        conversationType = exports.RCIMIWConversationType.INVALID;
        direction = exports.RCIMIWMessageDirection.SEND;
        expansion = null;
        extra = '';
        groupReadReceiptInfo = null;
        mentionedInfo = null;
        messageId = 0;
        // 定义消息类型
        messageType = exports.RCIMIWMessageType.UNKNOWN;
        messageUId = '';
        offLine = false;
        pushOptions = null;
        receivedStatus = exports.RCIMIWReceivedStatus.UNREAD;
        receivedTime = 0;
        senderUserId = '';
        sentStatus = exports.RCIMIWSentStatus.FAILED;
        sentTime = 0;
        targetId = '';
        userInfo = null;
        constructor(options) {
            this.channelId = options.channelId || null;
            if (options.conversationType !== undefined)
                this.conversationType = options.conversationType;
            if (options.direction !== undefined)
                this.direction = options.direction;
            if (options.expansion !== undefined)
                this.expansion = options.expansion;
            if (options.extra !== undefined)
                this.extra = options.extra;
            if (options.groupReadReceiptInfo !== undefined)
                this.groupReadReceiptInfo = options.groupReadReceiptInfo;
            if (options.mentionedInfo !== undefined)
                this.mentionedInfo = options.mentionedInfo;
            if (options.messageId !== undefined)
                this.messageId = options.messageId;
            if (options.messageType !== undefined)
                this.messageType = options.messageType;
            if (options.pushOptions !== undefined)
                this.pushOptions = options.pushOptions;
            if (options.messageUId !== undefined)
                this.messageUId = options.messageUId;
            if (options.offLine !== undefined)
                this.offLine = options.offLine;
            if (options.receivedStatus !== undefined)
                this.receivedStatus = options.receivedStatus;
            if (options.receivedTime !== undefined)
                this.receivedTime = options.receivedTime;
            if (options.senderUserId !== undefined)
                this.senderUserId = options.senderUserId;
            if (options.sentStatus !== undefined)
                this.sentStatus = options.sentStatus;
            if (options.sentTime !== undefined)
                this.sentTime = options.sentTime;
            if (options.targetId !== undefined)
                this.targetId = options.targetId;
            if (options.userInfo !== undefined)
                this.userInfo = options.userInfo;
        }
        /**
         * 群阅读回执状态
         */
        getGroupReadReceiptInfo() {
            return this.groupReadReceiptInfo;
        }
        /**
        * 消息的附加字段
        */
        getExtra() {
            return this.extra;
        }
        setExtra(extra) {
            this.extra = extra;
        }
        /**
        * 消息携带的用户信息
        */
        getUserInfo() {
            return this.userInfo;
        }
        setUserInfo(userInfo) {
            this.userInfo = userInfo;
        }
        /**
        * 消息的 @ 信息
        *
        * @return
        */
        getMentionedInfo() {
            return this.mentionedInfo;
        }
        setMentionedInfo(mentionedInfo) {
            this.mentionedInfo = mentionedInfo;
        }
        /**
        * 消息的类型
        *
        * @return
        */
        getMessageType() {
            return this.messageType;
        }
        /**
        * 会话类型
        */
        getConversationType() {
            return this.conversationType;
        }
        /**
        * 会话 ID
        */
        getTargetId() {
            return this.targetId;
        }
        /**
        * 所属会话的业务标识，长度限制 20 字符
        *
        * @return
        */
        getChannelId() {
            return this.channelId;
        }
        /**
        * 本地存储的消息的唯一值（数据库索引唯一值）
        *
        * @return
        */
        getMessageId() {
            return this.messageId;
        }
        /**
        * 服务器消息唯一 ID（在同一个 Appkey 下全局唯一）
        */
        getMessageUId() {
            return this.messageUId;
        }
        /**
        * 消息的发送者 ID
        */
        getSenderUserId() {
            return this.senderUserId;
        }
        setSenderUserId(senderUserId) {
            this.senderUserId = senderUserId;
        }
        /**
        * 消息的方向
        */
        getDirection() {
            return this.direction;
        }
        setDirection(direction) {
            this.direction = direction;
        }
        /**
        * 消息的接收状态
        */
        getReceivedStatus() {
            return this.receivedStatus;
        }
        setReceivedStatus(receivedStatus) {
            this.receivedStatus = receivedStatus;
        }
        /**
        * 消息的发送状态
        */
        getSentStatus() {
            return this.sentStatus;
        }
        setSentStatus(sentStatus) {
            this.sentStatus = sentStatus;
        }
        /**
        * 消息的发送时间（Unix 时间戳、毫秒）
        */
        getSentTime() {
            return this.sentTime;
        }
        setSentTime(sentTime) {
            this.sentTime = sentTime;
        }
        /**
        * 消息的接收时间（Unix 时间戳、毫秒）
        */
        getReceivedTime() {
            return this.receivedTime;
        }
        setReceivedTime(receivedTime) {
            this.receivedTime = receivedTime;
        }
        /**
        * 是否是离线消息，只在接收消息的回调方法中有效，如果消息为离线消息，则为 true ，其他情况均为 false
        */
        isOffLine() {
            return this.offLine;
        }
        /**
        * 消息推送配置
        */
        getPushOptions() {
            return this.pushOptions;
        }
        setPushOptions(pushOptions) {
            this.pushOptions = pushOptions;
        }
        /**
        * 消息扩展信息列表，该属性在消息发送时确定，发送之后不能再做修改
        * 扩展信息只支持单聊和群组，其它会话类型不能设置扩展信息
        * 默认消息扩展字典 key 长度不超过 32 ，value 长度不超过 4096 ，单次设置扩展数量最大为 20，消息的扩展总数不能超过 300
        */
        getExpansion() {
            return this.expansion;
        }
        setExpansion(expansion) {
            this.expansion = expansion;
        }
    }

    class RCIMIWLocationMessage extends RCIMIWMessage {
        longitude = 0;
        latitude = 0;
        thumbnail = '';
        poiName = '';
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.LOCATION });
            this.longitude = options.longitude;
            this.latitude = options.latitude;
            this.thumbnail = options.thumbnail;
            this.poiName = options.poiName;
        }
        /**
         * 经度信息
         *
         * @return
         */
        getLongitude() {
            return this.longitude;
        }
        /**
         * 纬度信息
         *
         * @return
         */
        getLatitude() {
            return this.latitude;
        }
        /**
         * 缩略图地址
         *
         * @return
         */
        getThumbnail() {
            return this.thumbnail;
        }
        /**
         * POI 信息
         *
         * @return
         */
        getPoiName() {
            return this.poiName;
        }
    }

    /**
     * 检查参数是否为数组
     * 只做类型检查，不做长度检查
     * 如 UnitArray、BufferArray 等也属于数组
     * @param arr
     */
    const isArray = (arr) => Object.prototype.toString.call(arr).indexOf('Array') !== -1;
    /**
     * 检测参数是否为布尔值
     * @param value
     */
    const isBoolean = (value) => typeof value === 'boolean';
    /**
     * 检查参数是否为字符串
     * 只做类型检查，不做长度检查，故当字符串长度为 0，结果依然为 true
     * @param value
     */
    const isString = (value) => typeof value === 'string';
    /**
     * 检查参数是否为 number 数据
     * @param value
     */
    const isNumber = (value) => typeof value === 'number' && !Number.isNaN(value);
    /**
     * 检查参数是否为对象
     * @param val
     */
    const isObject = (val) => Object.prototype.toString.call(val) === '[object Object]';
    /**
     * 检查参数是否为 Map 对象
     * @param val
     */
    const isMap = (val) => Object.prototype.toString.call(val) === '[object Map]';

    class RCIMIWMediaMessage extends RCIMIWMessage {
        local = '';
        remote = '';
        file = null;
        constructor(option) {
            super(option);
            if (option?.local)
                this.local = option?.local;
            if (option?.remote)
                this.remote = option?.remote;
            if (option?.file)
                this.file = option?.file;
        }
        getFile() {
            return this.file;
        }
        /**
         * 本地路径
         */
        getLocal() {
            return this.local;
        }
        /**
         * 远端路径
         */
        getRemote() {
            return this.remote;
        }
    }

    class RCIMIWFileMessage extends RCIMIWMediaMessage {
        size = 0;
        name = '';
        fileType = '';
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.FILE });
            if (options.size)
                this.size = options.size;
            if (options.name)
                this.name = options.name;
            if (options.fileType)
                this.fileType = options.fileType;
        }
        /**
         * 文件大小，单位为 Byte
         */
        getSize() {
            return this.size;
        }
        setName(name) {
            this.name = name;
        }
        /**
         * 文件名
         */
        getName() {
            return this.name;
        }
        /**
         * 文件类型
         */
        getFileType() {
            return this.fileType;
        }
    }

    class RCIMIWImageMessage extends RCIMIWMediaMessage {
        thumbnailBase64String = '';
        original = false;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.IMAGE });
            if (options?.thumbnailBase64String)
                this.thumbnailBase64String = options?.thumbnailBase64String;
            this.original = !!options?.original;
        }
        /**
         * 图片的缩略图数据
         */
        getThumbnailBase64String() {
            return this.thumbnailBase64String;
        }
        /**
         * 是否为原图
         */
        isOriginal() {
            return this.original;
        }
        setOriginal(original) {
            this.original = original;
        }
    }

    class RCIMIWSightMessage extends RCIMIWMediaMessage {
        duration;
        thumbnailBase64String;
        size;
        name;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.SIGHT });
            this.duration = options.duration;
            this.thumbnailBase64String = options.thumbnailBase64String;
            this.size = options.size;
            this.name = options.name;
        }
        /**
         * 视频时长
         */
        getDuration() {
            return this.duration || 0;
        }
        /**
         * 缩略图数据
         */
        getThumbnailBase64String() {
            return this.thumbnailBase64String || '';
        }
        /**
         * 视频大小
         */
        getSize() {
            return this.size || 0;
        }
        /**
         * 视频的名称
         */
        getName() {
            return this.name || '';
        }
    }

    class RCIMIWTextMessage extends RCIMIWMessage {
        text;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.TEXT });
            this.text = options.text;
        }
        /**
         * 文本内容
         */
        getText() {
            return this.text;
        }
        setText(text) {
            this.text = text;
        }
    }

    class RCIMIWRecallNotificationMessage extends RCIMIWMessage {
        admin;
        deleted;
        recallTime = 0;
        originalMessage = null;
        recallActionTime = 0;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.RECALL });
            this.admin = !!options.admin;
            this.deleted = !!options.deleted;
            if (options.recallTime)
                this.recallTime = options.recallTime;
            if (options.originalMessage)
                this.originalMessage = options.originalMessage;
            if (options.recallActionTime)
                this.recallActionTime = options.recallActionTime;
        }
        /**
         * 是否是管理员操作
         */
        isAdmin() {
            return this.admin;
        }
        /**
         * 是否删除
         */
        isDeleted() {
            return this.deleted;
        }
        /**
         * 撤回的时间（毫秒）
         */
        getRecallTime() {
            return this.recallTime;
        }
        /**
         * 被撤回的原消息
         */
        getOriginalMessage() {
            return this.originalMessage;
        }
        /**
         * 撤回动作的时间（毫秒）
         */
        getRecallActionTime() {
            return this.recallActionTime;
        }
    }

    class RCIMIWReferenceMessage extends RCIMIWMessage {
        text;
        referenceMessage;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.REFERENCE });
            this.text = options.text;
            this.referenceMessage = options.referenceMessage;
        }
        /*
         * 引用文本
         */
        getText() {
            return this.text;
        }
        /**
         * 被引用的消息
         */
        getReferenceMessage() {
            return this.referenceMessage;
        }
    }

    class RCIMIWUnknownMessage extends RCIMIWMessage {
        rawData = '';
        ObjectName = '';
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.UNKNOWN });
            if (options?.rawData !== undefined)
                this.rawData = options?.rawData;
            if (options?.ObjectName !== undefined)
                this.ObjectName = options?.ObjectName;
        }
        /**
         * 消息数据
         */
        getRawData() {
            return this.rawData;
        }
        /**
         * 消息的标识
         */
        getObjectName() {
            return this.ObjectName;
        }
    }

    class RCIMIWVoiceMessage extends RCIMIWMediaMessage {
        duration = 0;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.VOICE });
            if (options.duration !== undefined)
                this.duration = options.duration;
        }
        /**
         * 语音的长度，单位：秒
         */
        getDuration() {
            return this.duration;
        }
    }

    class RCIMIWGIFMessage extends RCIMIWMediaMessage {
        dataSize;
        width;
        height;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.GIF });
            this.dataSize = options.dataSize;
            this.width = options.width;
            this.height = options.height;
        }
        /**
         * GIF 图的大小，单位字节
         */
        getDataSize() {
            return this.dataSize || 0;
        }
        /**
         * GIF 图的宽
         */
        getWidth() {
            return this.width || 0;
        }
        /**
         * GIF 图的高
         */
        getHeight() {
            return this.height || 0;
        }
    }

    class RCIMIWCustomMessage extends RCIMIWMessage {
        fields = new Map();
        policy;
        identifier;
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.CUSTOM });
            this.fields = options.fields;
            this.policy = options.policy;
            this.identifier = options.identifier;
        }
        /**
         * 自定义消息的键值对
         * @return
         */
        getFields() {
            return this.fields;
        }
        /**
         * 自定义的消息存储策略
         * @return
         */
        getPolicy() {
            return this.policy;
        }
        /**
         * 自定义消息的标识符
         */
        getIdentifier() {
            return this.identifier;
        }
    }

    class RCIMIWEngineOptions {
        naviServer = '';
        fileServer = '';
        constructor(options) {
            if (options) {
                const { naviServer, fileServer } = options;
                if (naviServer !== undefined)
                    this.naviServer = naviServer;
                if (fileServer !== undefined)
                    this.fileServer = fileServer;
            }
        }
        /**
         * 初始化创建 RCIMIWEngineOptions 实例
         * @param {IRCIMIWEngineOptions} options
         * @returns {RCIMIWEngineOptions} RCIMIWEngineOptions 实例
         */
        static create(options) {
            return new RCIMIWEngineOptions(options);
        }
        /**
         * 私有部署的导航服务器地址
         */
        getNaviServer() {
            return this.naviServer;
        }
        /**
         * 私有部署的媒体服务器地址，即文件和图片的上传地址。使用私有云时必须填写
         */
        getFileServer() {
            return this.fileServer;
        }
    }

    class RCIMIWChatRoomMemberAction {
        userId = '';
        actionType = exports.RCIMIWChatRoomMemberActionType.UNKNOWN;
        constructor(options) {
            if (options.userId !== undefined)
                this.userId = options.userId;
            if (options.actionType !== undefined)
                this.actionType = options.actionType;
        }
        /**
         * 操作的用户
         */
        getUserId() {
            return this.userId;
        }
        /**
         * 事件类型
         */
        getActionType() {
            return this.actionType;
        }
    }

    class RCIMIWTypingStatus {
        userId = '';
        contentType = '';
        sentTime = 0;
        constructor(options) {
            if (options.userId)
                this.userId = options.userId;
            if (options.contentType)
                this.contentType = options.contentType;
            if (options.sentTime)
                this.sentTime = options.sentTime;
        }
        /**
         * 当前正在输入的用户 ID
         * @return
         */
        getUserId() {
            return this.userId;
        }
        /**
         * 当前正在输入的消息类型名
         * @return
         */
        getContentType() {
            return this.contentType;
        }
        /**
         * 输入时间
         * @return
         */
        getSentTime() {
            return this.sentTime;
        }
    }

    class RCIMIWUltraGroupTypingStatusInfo {
        targetId = '';
        channelId = '';
        userId = '';
        timestamp = 0;
        userNums = 0;
        status = exports.RCIMIWUltraGroupTypingStatus.TEXT;
        constructor(options) {
            if (options.targetId)
                this.targetId = options.targetId;
            if (options.channelId)
                this.channelId = options.channelId;
            if (options.userId)
                this.userId = options.userId;
            if (options.timestamp)
                this.timestamp = options.timestamp;
            if (options.userNums)
                this.userNums = options.userNums;
            if (options.status)
                this.status = options.status;
        }
        /**
         * 会话 ID
         */
        getTargetId() {
            return this.targetId;
        }
        setTargetId(targetId) {
            this.targetId = targetId;
        }
        /**
         * 所属会话的业务标识
         */
        getChannelId() {
            return this.channelId;
        }
        setChannelId(channelId) {
            this.channelId = channelId;
        }
        /**
         * 用户id
         * @return
         */
        getUserId() {
            return this.userId;
        }
        setUserId(userId) {
            this.userId = userId;
        }
        /**
         * 输入状态
         * @return
         */
        getStatus() {
            return this.status;
        }
        setStatus(status) {
            this.status = status;
        }
        /**
         * 服务端收到用户操作的上行时间.
         * @return
         */
        getTimestamp() {
            return this.timestamp;
        }
        setTimestamp(timestamp) {
            this.timestamp = timestamp;
        }
        /**
         * 用户数
         * @return
         */
        getUserNums() {
            return this.userNums;
        }
        setUserNums(userNums) {
            this.userNums = userNums;
        }
    }

    class RCIMIWBlockedMessageInfo {
        conversationType = exports.RCIMIWConversationType.INVALID;
        targetId = '';
        blockedMsgUId = '';
        blockType = exports.RCIMIWMessageBlockType.UNKNOWN;
        extra = '';
        constructor(options) {
            if (options.conversationType)
                this.conversationType = options.conversationType;
            if (options.targetId)
                this.targetId = options.targetId;
            if (options.blockedMsgUId)
                this.blockedMsgUId = options.blockedMsgUId;
            if (options.blockType)
                this.blockType = options.blockType;
            if (options.extra)
                this.extra = options.extra;
        }
        /**
         * 封禁的会话类型
         */
        getConversationType() {
            return this.conversationType;
        }
        /**
         * 封禁的会话 ID
         */
        getTargetId() {
            return this.targetId;
        }
        /**
         * 封禁的消息 Uid
         */
        getBlockedMsgUId() {
            return this.blockedMsgUId;
        }
        /**
         * 封禁的类型
         */
        getBlockType() {
            return this.blockType;
        }
        /**
         * 封禁的附加信息
         */
        getExtra() {
            return this.extra;
        }
    }

    // TODO: 待确认，未使用，完成开发后删除
    class RCIMIWSearchConversationResult {
        conversation = null;
        count = 0;
        constructor(options) {
            if (options.conversation !== undefined)
                this.conversation = options.conversation;
            if (options.count !== undefined)
                this.count = options.count;
        }
        /**
         * 获取会话的实体，用来容纳和存储客户端的会话信息，对应会话列表中的会话。
         */
        getConversation() {
            return this.conversation;
        }
        /**
         * 获取匹配会话数量
         */
        getCount() {
            return this.count;
        }
    }

    class RCIMIWCommandMessage extends RCIMIWMessage {
        name = '';
        data = '';
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.COMMAND });
            if (options?.name)
                this.name = options?.name;
            if (options.data)
                this.data = options?.data;
        }
        /**
         * 命令的名称
         */
        getName() {
            return this.name;
        }
        /**
         * 命令的扩展数据，可以为任意字符串，如存放您定义的json数据。
         */
        getData() {
            return this.data;
        }
    }

    class RCIMIWCommandNotificationMessage extends RCIMIWMessage {
        name = '';
        data = '';
        constructor(options) {
            super({ ...options, messageType: exports.RCIMIWMessageType.COMMAND_NOTIFICATION });
            if (options.name !== undefined)
                this.name = options.name;
            if (options.data !== undefined)
                this.data = options.data;
        }
        /**
         * 命令提醒的名称
         */
        getName() {
            return this.name;
        }
        /**
         * 命令提醒消息的扩展数据，可以为任意字符串，如存放您定义的 json 数据。
         */
        getData() {
            return this.data;
        }
    }

    class RCIMIWMentionedInfo {
        type = exports.RCIMIWMentionedType.ALL;
        userIdList = [];
        mentionedContent = '';
        constructor(options) {
            if (options.type !== undefined)
                this.type = options.type;
            if (options.userIdList !== undefined)
                this.userIdList = options.userIdList;
            if (options.mentionedContent !== undefined)
                this.mentionedContent = options.mentionedContent;
        }
        /**
         * @ 提醒的类型
         */
        getType() {
            return this.type;
        }
        /**
         * @ 的用户 ID 列表
         */
        getUserIdList() {
            return this.userIdList;
        }
        /**
         * 包含 @ 提醒的消息，本地通知和远程推送显示的内容
         */
        getMentionedContent() {
            return this.mentionedContent;
        }
    }

    class RCIMIWUserInfo {
        userId = '';
        name = '';
        alias = '';
        portrait = '';
        extra = '';
        constructor(options) {
            if (options.userId !== undefined)
                this.userId = options.userId;
            if (options.name !== undefined)
                this.name = options.name;
            if (options.alias !== undefined)
                this.alias = options.alias;
            if (options.portrait !== undefined)
                this.portrait = options.portrait;
            if (options.extra !== undefined)
                this.extra = options.extra;
        }
        /**
         * 用户 id。
         *
         * @return
         */
        getUserId() {
            return this.userId;
        }
        setUserId(userId) {
            this.userId = userId;
        }
        /**
         * 名称（昵称）。
         *
         * @return
         */
        getName() {
            return this.name;
        }
        setName(name) {
            this.name = name;
        }
        /**
         * 备注
         *
         * @return
         */
        getAlias() {
            return this.alias;
        }
        setAlias(alias) {
            this.alias = alias;
        }
        /**
         * 用户头像地址。
         *
         * @return
         */
        getPortrait() {
            return this.portrait;
        }
        setPortrait(portrait) {
            this.portrait = portrait;
        }
        /**
         * 附加信息。
         *
         * @return
         */
        getExtra() {
            return this.extra;
        }
        setExtra(extra) {
            this.extra = extra;
        }
    }

    class RCIMIWAndroidPushOptions {
        notificationId = '';
        channelIdMi = '';
        channelIdHW = '';
        channelIdOPPO = '';
        pushTypeVIVO = exports.RCIMIWVIVOPushType.OPERATE;
        collapseKeyFCM = '';
        imageUrlFCM = '';
        importanceHW = 0;
        imageUrlHW = '';
        imageUrlMi = '';
        channelIdFCM = '';
        constructor(options) {
            if (options.notificationId !== undefined)
                this.notificationId = options?.notificationId;
            if (options.channelIdMi !== undefined)
                this.channelIdMi = options?.channelIdMi;
            if (options.channelIdHW !== undefined)
                this.channelIdHW = options?.channelIdHW;
            if (options.channelIdOPPO !== undefined)
                this.channelIdOPPO = options?.channelIdOPPO;
            if (options.pushTypeVIVO !== undefined)
                this.pushTypeVIVO = options?.pushTypeVIVO;
            if (options.collapseKeyFCM !== undefined)
                this.collapseKeyFCM = options?.collapseKeyFCM;
            if (options.imageUrlFCM !== undefined)
                this.imageUrlFCM = options?.imageUrlFCM;
            if (options.importanceHW !== undefined)
                this.importanceHW = options?.importanceHW;
            if (options.imageUrlHW !== undefined)
                this.imageUrlHW = options?.imageUrlHW;
            if (options.imageUrlMi !== undefined)
                this.imageUrlMi = options?.imageUrlMi;
            if (options.channelIdFCM !== undefined)
                this.channelIdFCM = options?.channelIdFCM;
        }
        static create(options) {
            return new RCIMIWAndroidPushOptions(options);
        }
        /**
         * Android 平台 Push 唯一标识。
         * 目前支持小米、华为推送平台，默认开发者不需要进行设置。
         * 当消息产生推送时，消息的 messageUId 作为 notificationId 使用。
         */
        getNotificationId() {
            return this.notificationId;
        }
        /**
         * 小米的渠道 ID
         * 该条消息针对小米使用的推送渠道。
         */
        getChannelIdMi() {
            return this.channelIdMi;
        }
        /**
         * 小米 Large icon 链接
         * Large icon 可以出现在大图版和多字版消息中，显示在右边。国内版仅 MIUI12 以上版本支持，以下版本均不支持；国际版支持。
         * 图片要求：大小 120 * 120px，格式为 png 或者 jpg 格式
         */
        getImageUrlMi() {
            return this.imageUrlMi;
        }
        /**
         * 华为的渠道 ID
         * 该条消息针对华为使用的推送渠道，如开发者集成了华为推送，需要指定 channelId 时，可向 Android 端研发人员获取，channelId 由开发者自行创建。
         */
        getChannelIdHW() {
            return this.channelIdHW;
        }
        /**
         * 华为通知栏消息右侧大图标 URL，如果不设置，则不展示通知栏右侧图标。
         * URL使用的协议必须是HTTPS协议，取值样例：https://example.com/image.png。图标文件须小于 512KB，图标建议规格大小：40dp x 40dp，弧角大小为 8dp，超出建议规格大小的图标会存在图片压缩或显示不全的情况。
         */
        getImageUrlHW() {
            return this.imageUrlHW;
        }
        /**
         * 华为推送消息级别
         */
        getImportanceHW() {
            return this.importanceHW;
        }
        /**
         * OPPO 的渠道 ID。
         * 该条消息针对 OPPO 使用的推送渠道，如开发者集成了 OPPO 推送，需要指定 channelId 时，可向 Android 端研发人员获取，channelId 由开发者自行创建。
         */
        getChannelIdOPPO() {
            return this.channelIdOPPO;
        }
        /**
         * VIVO 推送通道类型 开发者集成了 VIVO 推送，需要指定推送类型时，可进行设置。
         */
        getPushTypeVIVO() {
            return this.pushTypeVIVO;
        }
        /**
         * FCM 通知类型推送时所使用的分组 id
         */
        getCollapseKeyFCM() {
            return this.collapseKeyFCM;
        }
        /**
         * FCM 通知类型的推送所使用的通知图片 url
         */
        getImageUrlFCM() {
            return this.imageUrlFCM;
        }
        /**
         * FCM 通知的频道 ID，该应用程序必须使用此频道 ID 创建一个频道，然后才能收到带有该频道 ID 的任何通知。
         * 如果您未在请求中发送此频道 ID，或者如果应用尚未创建提供的频道 ID，则 FCM 使用应用清单中指定的频道 ID。
         */
        getChannelIdFCM() {
            return this.channelIdFCM;
        }
    }

    class RCIMIWCompressOptions {
        originalImageQuality = -1;
        originalImageMaxSize = -1;
        originalImageSize = -1;
        thumbnailQuality = -1;
        thumbnailMaxSize = -1;
        sightCompressWidth = -1;
        sightCompressHeight = -1;
        thumbnailMinSize = -1;
        constructor(options) {
            if (options.originalImageQuality !== undefined)
                this.originalImageQuality = options?.originalImageQuality;
            if (options.originalImageMaxSize !== undefined)
                this.originalImageMaxSize = options?.originalImageMaxSize;
            if (options.originalImageSize !== undefined)
                this.originalImageSize = options?.originalImageSize;
            if (options.thumbnailQuality !== undefined)
                this.thumbnailQuality = options?.thumbnailQuality;
            if (options.thumbnailMaxSize !== undefined)
                this.thumbnailMaxSize = options?.thumbnailMaxSize;
            if (options.sightCompressWidth !== undefined)
                this.sightCompressWidth = options?.sightCompressWidth;
            if (options.sightCompressHeight !== undefined)
                this.sightCompressHeight = options?.sightCompressHeight;
            if (options.thumbnailMinSize !== undefined)
                this.thumbnailMinSize = options?.thumbnailMinSize;
        }
        /**
         * 原图压缩比
         */
        getOriginalImageQuality() {
            return this.originalImageQuality;
        }
        /**
         * 原图大小限制 配置发送图片时，如果图片大小不超过则发送原图
         */
        getOriginalImageMaxSize() {
            return this.originalImageMaxSize;
        }
        /**
         * 原图最长边的最大宽度
         */
        getOriginalImageSize() {
            return this.originalImageSize;
        }
        /**
         * 缩略图压缩比例
         */
        getThumbnailQuality() {
            return this.thumbnailQuality;
        }
        /**
         * 缩略图压缩宽、高
         */
        getThumbnailMaxSize() {
            return this.thumbnailMaxSize;
        }
        /**
         * 缩略图压缩最小宽、高
         */
        getThumbnailMinSize() {
            return this.thumbnailMinSize;
        }
        /**
         * 小视频压缩宽度,建议使用16的倍数
         */
        getSightCompressWidth() {
            return this.sightCompressWidth;
        }
        /**
         * 小视频压缩高度，建议使用 16 的倍数
         */
        getSightCompressHeight() {
            return this.sightCompressHeight;
        }
    }

    class RCIMIWIOSPushOptions {
        threadId = '';
        apnsCollapseId = '';
        category = '';
        richMediaUri = '';
        constructor(options) {
            if (options.threadId !== undefined)
                this.threadId = options.threadId;
            if (options.apnsCollapseId !== undefined)
                this.apnsCollapseId = options.apnsCollapseId;
            if (options.category !== undefined)
                this.category = options.category;
            if (options.richMediaUri !== undefined)
                this.richMediaUri = options.richMediaUri;
        }
        /**
         * iOS 平台通知栏分组 ID 相同的 thread-id 推送分为一组 iOS10 开始支持
         *
         * @return
         */
        getThreadId() {
            return this.threadId;
        }
        /**
         * iOS 平台通知覆盖 ID apnsCollapseId 相同时，新收到的通知会覆盖老的通知，最大 64 字节 iOS10 开始支持
         *
         * @return
         */
        getApnsCollapseId() {
            return this.apnsCollapseId;
        }
        /**
         * iOS 富文本推送的类型开发者自己定义，自己在 App 端进行解析判断，与 richMediaUri 一起使用，当设置 category 后，推送时默认携带 mutable-content 进行推送，属性值为 1。
         * 如果不设置后台默认取消息类型字符串，如RC:TxtMsg
         *
         * @return
         */
        getCategory() {
            return this.category;
        }
        /**
         * iOS 富文本推送内容的 URL，与 category 一起使用。
         * @return
         */
        getRichMediaUri() {
            return this.richMediaUri;
        }
    }

    class RCIMIWMessagePushOptions {
        disableNotification = false;
        isVoIPPushProp = false;
        disablePushTitle = false;
        forceShowDetailContent = false;
        pushTitle = '';
        pushData = '';
        pushContent = '';
        templateId = '';
        androidPushOptions = null;
        iOSPushOptions = null;
        constructor(options) {
            this.disableNotification = options.disableNotification;
            if (options.isVoIPPushProp !== undefined)
                this.isVoIPPushProp = options.isVoIPPushProp;
            this.disablePushTitle = options.disablePushTitle;
            this.forceShowDetailContent = options.forceShowDetailContent;
            if (options.pushTitle !== undefined)
                this.pushTitle = options.pushTitle;
            if (options.pushData !== undefined)
                this.pushData = options.pushData;
            if (options.pushContent !== undefined)
                this.pushContent = options.pushContent;
            if (options.templateId !== undefined)
                this.templateId = options.templateId;
            if (options.androidPushOptions !== undefined)
                this.androidPushOptions = options.androidPushOptions;
            if (options.iOSPushOptions !== undefined)
                this.iOSPushOptions = options.iOSPushOptions;
        }
        /**
         * 是否发送通知
         *
         * @return
         */
        isDisableNotification() {
            return this.disableNotification;
        }
        /**
         * 如果对端设备是 iOS，设置 isVoIPPush 为 True，会走 VoIP 通道推送 Push。
         *
         * @return
         */
        isVoIPPush() {
            return this.isVoIPPushProp;
        }
        /**
         * 通知栏是否屏蔽通知标题
         * true 不显示通知标题，false 显示通知标题
         * 默认情况下融云单聊消息通知标题为用户名、群聊消息为群名称，设置后不会再显示通知标题。
         * 此属性只针目标用户为iOS 平台时有效，Android 第三方推送平台的通知标题为必填项，所以暂不支持。
         */
        isDisablePushTitle() {
            return this.disablePushTitle;
        }
        /**
         * 是否强制显示通知详情。 当目标用户设置推送不显示消息详情时， 可通过此功能，强制设置该条消息显示推送详情。
         *
         * @return
         */
        isForceShowDetailContent() {
            return this.forceShowDetailContent;
        }
        /**
         * 推送标题
         * 默认标题显示规则：内置消息：单聊通知标题显示为发送者名称，群聊通知标题显示为群名称。 自定义消息：默认不显示标题。
         *
         * @return
         */
        getPushTitle() {
            return this.pushTitle;
        }
        /**
         * 远程推送附加信息.
         *
         * @return
         */
        getPushData() {
            return this.pushData;
        }
        /**
         * 推送内容。
         *
         * @return
         */
        getPushContent() {
            return this.pushContent;
        }
        /**
         * 推送模板 ID
         * 设置后根据目标用户通过 setPushLanguageCode 设置的语言环境，匹配模板中设置的语言内容进行推送
         * 未匹配成功时使用默认内容进行推送,模板内容在“开发者后台-自定义推送文案”中进行设置 注：RCMessagePushConfig 中的 Title 和 PushContent
         * 优先级高于模板 ID（templateId）中对应的标题和推送内容
         *
         * @return
         */
        getTemplateId() {
            return this.templateId;
        }
        /**
         * Android 平台相关配置
         *
         * @return
         */
        getAndroidPushOptions() {
            return this.androidPushOptions;
        }
        /**
         * iOS 平台相关配置
         *
         * @return
         */
        getIOSPushOptions() {
            return this.iOSPushOptions;
        }
    }

    class RCIMIWGroupReadReceiptInfo {
        readReceiptMessage = false;
        hasRespond = false;
        respondUserIds = new Map();
        constructor(options) {
            if (options.respondUserIds)
                this.respondUserIds = options.respondUserIds;
            this.hasRespond = options.hasRespond;
        }
        /**
         * 是否为需要回执的消息。 true: 需要回执的消息。 false: 普通消息。
         */
        isReadReceiptMessage() {
            return this.readReceiptMessage;
        }
        /**
         * 是否发送过消息回执响应。 仅对消息接收方有效。
         */
        isHasRespond() {
            return this.hasRespond;
        }
        /**
         * 会话中响应过该消息回执的成员 userId 列表。 key: userId value: respondTime
         */
        getRespondUserIds() {
            return this.respondUserIds;
        }
    }

    function convertMediaMessage(message) {
        if (!message)
            return null;
        const messageType = convertMessageType(message.messageType);
        const options = convertMessageOptions(message);
        const content = message.content;
        switch (messageType) {
            case exports.RCIMIWMessageType.IMAGE:
            case exports.RCIMIWMessageType.GIF:
                return new RCIMIWImageMessage({
                    ...options,
                    remote: content?.imageUri,
                    thumbnailBase64String: content?.content,
                });
            case exports.RCIMIWMessageType.VOICE:
                return new RCIMIWVoiceMessage({
                    ...options,
                    remote: content.url,
                });
            case exports.RCIMIWMessageType.FILE:
                return new RCIMIWFileMessage({
                    ...options,
                    name: content.name,
                    size: content.size,
                    fileType: content.type,
                    remote: content.fileUrl,
                });
            case exports.RCIMIWMessageType.SIGHT:
                return new RCIMIWSightMessage({
                    ...options,
                    remote: content.sightUrl,
                    thumbnailBase64String: content.content,
                    duration: content.duration,
                    size: content.size,
                    name: content.name,
                });
            case exports.RCIMIWMessageType.TEXT:
            case exports.RCIMIWMessageType.REFERENCE:
            case exports.RCIMIWMessageType.RECALL:
            default:
                return null;
        }
    }
    function convertPushNotificationLevel(notificationLevel, isFlutter) {
        if (isFlutter) {
            switch (notificationLevel) {
                /**
                 * 全部消息通知（接收全部消息通知 -- 显示指定关闭免打扰功能）
                 */
                case exports.RCIMIWPushNotificationLevel.ALL_MESSAGE:
                    return ae$1.ALL_MESSAGE;
                /**
                 * 群聊超级群仅 @ 消息通知（现在通知）单聊代表全部消息通知
                 */
                case exports.RCIMIWPushNotificationLevel.MENTION:
                    return ae$1.AT_MESSAGE_NOTIFICATION;
                /**
                 * @ 指定用户通知
                 */
                case exports.RCIMIWPushNotificationLevel.MENTION_USERS:
                    return ae$1.AT_USER_NOTIFICATION;
                /**
                 * @ 群全员通知
                 */
                case exports.RCIMIWPushNotificationLevel.MENTION_ALL:
                    return ae$1.AT_GROUP_ALL_USER_NOTIFICATION;
                /**
                 * 消息通知被屏蔽，即不接收消息通知
                 */
                case exports.RCIMIWPushNotificationLevel.BLOCKED:
                    return ae$1.NOT_MESSAGE_NOTIFICATION;
                /**
                 * 未设置（向上查询群或者APP级别设置）// 存量数据中 0 表示未设置
                 */
                case exports.RCIMIWPushNotificationLevel.NONE:
                default:
                    return ae$1.NOT_SET;
            }
        }
        switch (notificationLevel) {
            /**
             * 全部消息通知（接收全部消息通知 -- 显示指定关闭免打扰功能）
             */
            case ae$1.ALL_MESSAGE:
                return exports.RCIMIWPushNotificationLevel.ALL_MESSAGE;
            /**
             * 群聊超级群仅 @ 消息通知（现在通知）单聊代表全部消息通知
             */
            case ae$1.AT_MESSAGE_NOTIFICATION:
                return exports.RCIMIWPushNotificationLevel.MENTION;
            /**
             * @ 指定用户通知
             */
            case ae$1.AT_USER_NOTIFICATION:
                return exports.RCIMIWPushNotificationLevel.MENTION_USERS;
            /**
             * @ 群全员通知
             */
            case ae$1.AT_GROUP_ALL_USER_NOTIFICATION:
                return exports.RCIMIWPushNotificationLevel.MENTION_ALL;
            /**
             * 消息通知被屏蔽，即不接收消息通知
             */
            case ae$1.NOT_MESSAGE_NOTIFICATION:
                return exports.RCIMIWPushNotificationLevel.BLOCKED;
            /**
             * 未设置（向上查询群或者APP级别设置）// 存量数据中 0 表示未设置
             */
            case ae$1.NOT_SET:
            default:
                return exports.RCIMIWPushNotificationLevel.NONE;
        }
    }
    function convertConversationLastMessage(conversation) {
        if (!conversation || !conversation.latestMessage)
            return new RCIMIWUnknownMessage();
        const { latestMessage } = conversation;
        return convertMessage(latestMessage);
    }
    function convertMessage(message, isFultter) {
        if (!message)
            return null;
        if (isFultter && message instanceof RCIMIWMessage) {
            const RCIMIWUserInfo = message.getUserInfo();
            const RCIMIWExtra = message.getExtra();
            const RCIMIWMentionedInfo = message.getMentionedInfo();
            const contentExtension = {};
            if (RCIMIWUserInfo) {
                contentExtension.user = {
                    id: RCIMIWUserInfo.getUserId(),
                    name: RCIMIWUserInfo.getName(),
                    portraitUri: RCIMIWUserInfo.getPortrait(),
                    extra: RCIMIWUserInfo.getExtra(),
                    portrait: RCIMIWUserInfo.getPortrait(),
                };
            }
            if (RCIMIWExtra)
                contentExtension.extra = RCIMIWExtra;
            if (RCIMIWMentionedInfo) {
                contentExtension.mentionedInfo = {
                    type: convertMentionedType(RCIMIWMentionedInfo.getType(), true),
                    userIdList: RCIMIWMentionedInfo.getUserIdList(),
                };
            }
            // 文本消息
            if (message instanceof RCIMIWTextMessage) {
                return new Jt({ ...contentExtension, content: message.getText() });
            }
            // 图片消息
            if (message instanceof RCIMIWImageMessage) {
                return new Vt({
                    ...contentExtension,
                    content: message.getThumbnailBase64String(),
                    imageUri: message.getRemote(),
                });
            }
            // 文件消息
            if (message instanceof RCIMIWFileMessage) {
                return new Wt({
                    ...contentExtension,
                    name: message.getName(),
                    size: message.getSize(),
                    type: message.getFileType(),
                    fileUrl: message.getRemote(),
                });
            }
            // 音频消息
            if (message instanceof RCIMIWVoiceMessage) {
                return new zt({
                    ...contentExtension,
                    remoteUrl: message.getRemote(),
                    duration: message.getDuration(),
                });
            }
            // 视频消息
            if (message instanceof RCIMIWSightMessage) {
                return new Kt({
                    ...contentExtension,
                    sightUrl: message.getRemote(),
                    content: message.getThumbnailBase64String(),
                    duration: message.getDuration(),
                    size: message.getSize(),
                    name: message.getName(),
                });
            }
            // GIF 消息
            if (message instanceof RCIMIWGIFMessage) {
                return new Xt({
                    ...contentExtension,
                    gifDataSize: message.getDataSize(),
                    remoteUrl: message.getRemote(),
                    width: message.getWidth(),
                    height: message.getHeight(),
                });
            }
            // 引用消息
            if (message instanceof RCIMIWReferenceMessage) {
                const referencedMessage = message.getReferenceMessage();
                if (!referencedMessage)
                    return null;
                return new Zt({
                    ...contentExtension,
                    referMsgUserId: referencedMessage.getSenderUserId(),
                    referMsg: convertMessage(message.getReferenceMessage(), true).content,
                    content: message.getText(),
                    objName: convertMessageType(referencedMessage.getMessageType(), true),
                });
            }
            // 位置消息
            if (message instanceof RCIMIWLocationMessage) {
                return new Qt({
                    ...contentExtension,
                    latitude: message.getLatitude(),
                    longitude: message.getLongitude(),
                    poi: message.getPoiName(),
                    content: message.getThumbnail(),
                });
            }
            // 自定义消息
            if (message instanceof RCIMIWCustomMessage) {
                const policy = message.getPolicy();
                const isPersited = policy === exports.RCIMIWCustomMessagePolicy.NORMAL
                    || policy === exports.RCIMIWCustomMessagePolicy.STORAGE;
                const isCounted = policy === exports.RCIMIWCustomMessagePolicy.NORMAL;
                const CustomMessage = eo(message.getIdentifier(), isPersited, isCounted, [], false);
                const content = convertMap2Obj(message.getFields());
                return new CustomMessage({
                    ...contentExtension,
                    ...content,
                });
            }
            return null;
        }
        message = message;
        if (!message.messageType) {
            return new RCIMIWUnknownMessage();
        }
        const messageType = convertMessageType(message.messageType);
        const options = convertMessageOptions(message);
        const msgContent = message?.content;
        switch (messageType) {
            case exports.RCIMIWMessageType.TEXT:
                return new RCIMIWTextMessage({
                    ...options,
                    text: msgContent?.content,
                });
            case exports.RCIMIWMessageType.IMAGE:
                return new RCIMIWImageMessage({
                    ...options,
                    remote: msgContent?.imageUri,
                    thumbnailBase64String: msgContent?.content,
                });
            case exports.RCIMIWMessageType.VOICE:
                return new RCIMIWVoiceMessage({
                    ...options,
                    duration: msgContent?.duration,
                    remote: msgContent?.remoteUrl,
                });
            case exports.RCIMIWMessageType.GIF:
                return new RCIMIWGIFMessage({
                    ...options,
                    remote: msgContent?.remoteUrl,
                });
            case exports.RCIMIWMessageType.FILE:
                return new RCIMIWFileMessage({
                    ...options,
                    remote: msgContent?.remoteUrl,
                });
            case exports.RCIMIWMessageType.SIGHT:
                return new RCIMIWSightMessage({
                    ...options,
                    remote: msgContent?.sightUrl,
                    duration: msgContent?.duration,
                    thumbnailBase64String: msgContent?.content,
                    size: msgContent?.size,
                    name: msgContent?.name,
                });
            case exports.RCIMIWMessageType.REFERENCE:
                return new RCIMIWReferenceMessage({
                    ...options,
                    text: msgContent?.content,
                    referenceMessage: convertMessage({
                        senderUserId: msgContent?.referMsgUserId,
                        content: msgContent?.referMsg,
                        messageType: msgContent?.objName,
                    }),
                });
            case exports.RCIMIWMessageType.RECALL:
                return new RCIMIWRecallNotificationMessage({
                    ...options,
                    recallTime: options.sentTime,
                });
            case exports.RCIMIWMessageType.LOCATION:
                return new RCIMIWLocationMessage({
                    latitude: msgContent?.latitude,
                    longitude: msgContent?.longitude,
                    poiName: msgContent?.poi,
                    thumbnail: msgContent?.content,
                    ...options,
                });
            case exports.RCIMIWMessageType.COMMAND:
                return new RCIMIWCommandMessage({});
            case exports.RCIMIWMessageType.COMMAND_NOTIFICATION:
                return new RCIMIWCommandNotificationMessage({});
            default:
                return new RCIMIWUnknownMessage();
        }
    }
    function convertReceivedStatus(receivedStatus, isFlutter = false) {
        if (isFlutter) {
            switch (receivedStatus) {
                case exports.RCIMIWReceivedStatus.READ:
                    return n.READ;
                case exports.RCIMIWReceivedStatus.LISTENED:
                    return n.LISTENED;
                case exports.RCIMIWReceivedStatus.DOWNLOADED:
                    return n.DOWNLOADED;
                case exports.RCIMIWReceivedStatus.RETRIEVED:
                    return n.RETRIEVED;
                case exports.RCIMIWReceivedStatus.UNREAD:
                    return n.UNREAD;
                default:
                    return n.UNREAD;
            }
        }
        switch (receivedStatus) {
            case n.READ:
                return exports.RCIMIWReceivedStatus.READ;
            case n.LISTENED:
                return exports.RCIMIWReceivedStatus.LISTENED;
            case n.DOWNLOADED:
                return exports.RCIMIWReceivedStatus.DOWNLOADED;
            case n.RETRIEVED:
                return exports.RCIMIWReceivedStatus.RETRIEVED;
            case n.UNREAD:
                return exports.RCIMIWReceivedStatus.UNREAD;
            default:
                return exports.RCIMIWReceivedStatus.UNREAD;
        }
    }
    function convertErrorCode(errorCode, isFlutter) {
        if (isFlutter) {
            return z$1.SUCCESS;
        }
        switch (errorCode) {
            /**
             * 成功
             */
            case z$1.SUCCESS:
                return exports.RCIMIWErrorCode.SUCCESS;
            /**
             * 未调用 init 初始化函数。
             */
            case z$1.BIZ_ERROR_CLIENT_NOT_INIT:
                return exports.RCIMIWErrorCode.ENGINE_DESTROYED;
            /**
             * 传入参数无效。
             */
            case z$1.BIZ_ERROR_INVALID_PARAMETER:
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            /**
             * 未知原因失败。
             */
            case z$1.UNKNOWN:
                return exports.RCIMIWErrorCode.RESULT_UNKNOWN;
            /** 参数错误 */
            case z$1.PARAMETER_ERROR:
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            default:
                return errorCode;
        }
    }
    function convertMessageType(messageType, isFlutter) {
        // TODO: 增加位置消息
        if (isFlutter) {
            switch (messageType) {
                case exports.RCIMIWMessageType.TEXT:
                    return Ro.TEXT;
                case exports.RCIMIWMessageType.VOICE:
                    return Ro.VOICE;
                case exports.RCIMIWMessageType.IMAGE:
                    return Ro.IMAGE;
                case exports.RCIMIWMessageType.GIF:
                    return Ro.GIF;
                case exports.RCIMIWMessageType.FILE:
                    return Ro.FILE;
                case exports.RCIMIWMessageType.SIGHT:
                    return Ro.SIGHT;
                case exports.RCIMIWMessageType.REFERENCE:
                    return Ro.REFERENCE;
                case exports.RCIMIWMessageType.RECALL:
                    return Ro.RECALL_MESSAGE_TYPE;
                default:
                    return 'undefined';
            }
        }
        switch (messageType) {
            case Ro.TEXT:
                return exports.RCIMIWMessageType.TEXT;
            case Ro.VOICE:
                return exports.RCIMIWMessageType.VOICE;
            case Ro.HQ_VOICE:
                return exports.RCIMIWMessageType.VOICE;
            case Ro.IMAGE:
                return exports.RCIMIWMessageType.IMAGE;
            case Ro.GIF:
                return exports.RCIMIWMessageType.GIF;
            case Ro.FILE:
                return exports.RCIMIWMessageType.FILE;
            case Ro.SIGHT:
                return exports.RCIMIWMessageType.SIGHT;
            case Ro.REFERENCE:
                return exports.RCIMIWMessageType.REFERENCE;
            case Ro.RECALL_MESSAGE_TYPE:
                return exports.RCIMIWMessageType.RECALL;
            case Ro.LOCATION:
                return exports.RCIMIWMessageType.LOCATION;
            case 'RC:CmdMsg':
                return exports.RCIMIWMessageType.COMMAND;
            case 'RC:CmdNtf':
                return exports.RCIMIWMessageType.COMMAND_NOTIFICATION;
            default:
                return exports.RCIMIWMessageType.UNKNOWN;
        }
    }
    function convertConversationType(conversationType, isFlutter) {
        if (isFlutter) {
            switch (conversationType) {
                /* 暂不支持 */
                case exports.RCIMIWConversationType.INVALID:
                    return X$1.NONE;
                /* 单聊 */
                case exports.RCIMIWConversationType.PRIVATE:
                    return X$1.PRIVATE;
                /* 群聊 */
                case exports.RCIMIWConversationType.GROUP:
                    return X$1.GROUP;
                /* 聊天室 */
                case exports.RCIMIWConversationType.CHATROOM:
                    return X$1.CHATROOM;
                /* 系统会话 */
                case exports.RCIMIWConversationType.SYSTEM:
                    return X$1.SYSTEM;
                /* 超级群 */
                case exports.RCIMIWConversationType.ULTRA_GROUP:
                    return X$1.ULTRA_GROUP;
                default:
                    return X$1.NONE;
            }
        }
        switch (conversationType) {
            /**
             * 单聊
             */
            case X$1.PRIVATE:
                return exports.RCIMIWConversationType.PRIVATE;
            /**
             * 群组聊天
             */
            case X$1.GROUP:
                return exports.RCIMIWConversationType.GROUP;
            /**
             * 聊天室会话
             */
            case X$1.CHATROOM:
                return exports.RCIMIWConversationType.CHATROOM;
            /**
             * 系统消息
             */
            case X$1.SYSTEM:
                return exports.RCIMIWConversationType.SYSTEM;
            /**
             * 超级群
             */
            case X$1.ULTRA_GROUP:
                return exports.RCIMIWConversationType.ULTRA_GROUP;
            case X$1.NONE: // 无类型
            case X$1.DISCUSSION: // 讨论组
            case X$1.CUSTOMER_SERVICE: // 客服会话
            case X$1.APP_PUBLIC_SERVICE: // 默认关注的公众号会话类型（MC)
            case X$1.PUBLIC_SERVICE: // 需手动关注的公众号会话类型（MP)
            case X$1.RTC_ROOM: // RTCLib 特有的会话类型
            default:
                return exports.RCIMIWConversationType.INVALID;
        }
    }
    /**
     * 连接状态码转换
     * @param status Web
     * @returns Flutter
     */
    const convertConnStatus = (status) => {
        switch (status) {
            case ee$1.CONNECTED:
                return exports.RCIMIWConnectionStatus.CONNECTED;
            case ee$1.CONNECTING:
                return exports.RCIMIWConnectionStatus.CONNECTING;
            case ee$1.DISCONNECTED:
                return exports.RCIMIWConnectionStatus.SIGN_OUT;
            case ee$1.NETWORK_UNAVAILABLE:
                return exports.RCIMIWConnectionStatus.NETWORK_UNAVAILABLE;
            case ee$1.KICKED_OFFLINE_BY_OTHER_CLIENT:
                return exports.RCIMIWConnectionStatus.KICKED_OFFLINE_BY_OTHER_CLIENT;
            case ee$1.BLOCKED:
                return exports.RCIMIWConnectionStatus.CONN_USER_BLOCKED;
            case ee$1.FORBID_RECONNECT_BY_OTHER_SAME_CLIENT:
                return exports.RCIMIWConnectionStatus.KICKED_OFFLINE_BY_OTHER_CLIENT;
            case ee$1.DOMAIN_INCORRECT:
            case ee$1.DISCONNECT_BY_SERVER:
            case ee$1.APPKEY_IS_FAKE:
                return exports.RCIMIWConnectionStatus.UNCONNECTED;
            case ee$1.REDIRECT:
            case ee$1.CONNECTION_CLOSED:
            case ee$1.WEBSOCKET_ERROR:
            case ee$1.WEBSOCKET_UNAVAILABLE:
            default:
                return exports.RCIMIWConnectionStatus.SUSPEND;
        }
    };
    function convertSentStatus(sentStatus, isFlutter = false) {
        if (isFlutter) {
            switch (sentStatus) {
                /**
                 * 发送中。
                 */
                case exports.RCIMIWSentStatus.SENDING:
                    return k.SENDING;
                /**
                 * 发送失败。
                 */
                case exports.RCIMIWSentStatus.FAILED:
                    return k.FAILED;
                /**
                 * 已发送。
                 */
                case exports.RCIMIWSentStatus.SENT:
                    return k.SENT;
                /**
                 * 对方已接收。
                 */
                case exports.RCIMIWSentStatus.RECEIVED:
                    return k.RECEIVED;
                /**
                 * 对方已读。
                 */
                case exports.RCIMIWSentStatus.READ:
                    return k.READ;
                /**
                 * 对方已销毁。
                 */
                case exports.RCIMIWSentStatus.DESTROYED:
                default:
                    return k.DESTROYED;
            }
        }
        switch (sentStatus) {
            /**
             * 发送中。
             */
            case k.SENDING:
                return exports.RCIMIWSentStatus.SENDING;
            /**
             * 发送失败。
             */
            case k.FAILED:
                return exports.RCIMIWSentStatus.FAILED;
            /**
             * 已发送。
             */
            case k.SENT:
                return exports.RCIMIWSentStatus.SENT;
            /**
             * 对方已接收。
             */
            case k.RECEIVED:
                return exports.RCIMIWSentStatus.RECEIVED;
            /**
             * 对方已读。
             */
            case k.READ:
                return exports.RCIMIWSentStatus.READ;
            /**
             * 对方已销毁。
             */
            case k.DESTROYED:
            default:
                return exports.RCIMIWSentStatus.DESTROYED;
        }
    }
    function convertMessageDirection(direction, isFlutter) {
        if (isFlutter) {
            switch (direction) {
                case exports.RCIMIWMessageDirection.RECEIVE:
                    return W$1.RECEIVE;
                default:
                    return W$1.SEND;
            }
        }
        switch (direction) {
            case W$1.RECEIVE:
                return exports.RCIMIWMessageDirection.RECEIVE;
            default:
                return exports.RCIMIWMessageDirection.SEND;
        }
    }
    function convertTimeOrder(order, isFlutter) {
        switch (order) {
            case exports.RCIMIWTimeOrder.AFTER:
                return 1;
            case exports.RCIMIWTimeOrder.BEFORE:
            default:
                return 0;
        }
    }
    function convertObj2Map(expansion) {
        return new Map(Object.entries(expansion));
    }
    function convertMap2Obj(expansion) {
        return Object.fromEntries(expansion.entries());
    }
    function convertChatEntriesMap2Arr(entries) {
        return Array.from(entries.entries()).map((entrie) => ({ key: entrie[0], value: entrie[1] }));
    }
    function convertChatEntriesArr2Map(entries) {
        return new Map(entries.map((entrie) => ([entrie.key, entrie.value])));
    }
    function convertTypingUser(typingUser) {
        return new RCIMIWTypingStatus({
            userId: typingUser.userId,
            contentType: typingUser.messageType,
            sentTime: typingUser.timestamp,
        });
    }
    function convertBlockedMessageInfo({ conversationType, targetId, blockedMessageUId, blockType, extra, }) {
        return new RCIMIWBlockedMessageInfo({
            conversationType: convertConversationType(conversationType),
            targetId,
            blockedMsgUId: blockedMessageUId,
            blockType: convertMessageBlockType(blockType),
            extra,
        });
    }
    function convertMessageBlockType(type) {
        switch (type) {
            case Te$1.CUSTOM:
                return exports.RCIMIWMessageBlockType.CUSTOM;
            case Te$1.GLOBAL:
                return exports.RCIMIWMessageBlockType.GLOBAL;
            case Te$1.THIRD_PARTY:
                return exports.RCIMIWMessageBlockType.THIRD_PARTY;
            default:
                return exports.RCIMIWMessageBlockType.UNKNOWN;
        }
    }
    function convertMemberActionType(type) {
        switch (type) {
            case ye$1.JOIN:
                return exports.RCIMIWChatRoomMemberActionType.JOIN;
            case ye$1.QUIT:
                return exports.RCIMIWChatRoomMemberActionType.LEAVE;
            default:
                return exports.RCIMIWChatRoomMemberActionType.UNKNOWN;
        }
    }
    function convertChatRoomEntryType(type) {
        switch (type) {
            case _e$1.DELETE:
                return exports.RCIMIWChatRoomEntriesOperationType.Remove;
            case _e$1.UPDATE:
                return exports.RCIMIWChatRoomEntriesOperationType.Update;
        }
    }
    function convertSendMessageOptions(message) {
        const sendMessageOptions = {};
        const pushOptions = message.getPushOptions();
        const mentionedInfo = message.getMentionedInfo();
        const conversationType = message.getConversationType();
        const expansion = message.getExpansion();
        if (pushOptions) {
            sendMessageOptions.pushContent = pushOptions.getPushContent();
            sendMessageOptions.pushData = pushOptions.getPushData();
            sendMessageOptions.isVoipPush = pushOptions.isVoIPPush();
            sendMessageOptions.pushConfig = {
                pushTitle: pushOptions.getPushTitle(),
                pushContent: pushOptions.getPushContent(),
                pushData: pushOptions.getPushData(),
                templateId: pushOptions.getTemplateId(),
                forceShowDetailContent: pushOptions.isForceShowDetailContent(),
                disablePushTitle: pushOptions.isDisablePushTitle(),
                iOSConfig: convertIOSPushOptions(pushOptions.getIOSPushOptions()),
                androidConfig: convertAndroidConfig(pushOptions.getAndroidPushOptions()),
            };
        }
        if (mentionedInfo && conversationType === exports.RCIMIWConversationType.GROUP) {
            sendMessageOptions.isMentioned = true;
            if (mentionedInfo.getType() === exports.RCIMIWMentionedType.PART) {
                sendMessageOptions.directionalUserIdList = mentionedInfo.getUserIdList();
            }
        }
        if (expansion) {
            sendMessageOptions.canIncludeExpansion = true;
            sendMessageOptions.expansion = Object.fromEntries(expansion.entries());
        }
        return sendMessageOptions;
    }
    function convertIOSPushOptionsW2F(options) {
        if (!options)
            return undefined;
        return new RCIMIWIOSPushOptions({
            threadId: options.threadId,
            apnsCollapseId: options.apnsCollapseId,
            category: options.category,
            richMediaUri: options.richMediaUri,
        });
    }
    function convertAndroidConfigW2F(options) {
        if (!options)
            return undefined;
        return new RCIMIWAndroidPushOptions({
            notificationId: options.notificationId,
            channelIdMi: options.channelIdMi,
            channelIdHW: options.channelIdHW,
            channelIdOPPO: options.channelIdOPPO,
            pushTypeVIVO: `${options.typeVivo}` === '1' ? 1 : 0,
            collapseKeyFCM: options.googleConfig?.collapseKey,
            imageUrlFCM: options.googleConfig?.imageUrl,
            // TODO: 缺少 importanceHW imageUrlHW imageUrlMi channelIdFCM
        });
    }
    function convertAndroidConfig(options) {
        const androidPushConfig = {};
        if (options === null)
            return androidPushConfig;
        androidPushConfig.notificationId = options.getNotificationId();
        androidPushConfig.channelIdMi = options.getChannelIdMi();
        androidPushConfig.channelIdHW = options.getChannelIdHW();
        androidPushConfig.channelIdOPPO = options.getChannelIdOPPO();
        androidPushConfig.typeVivo = `${options.getPushTypeVIVO()}`;
        androidPushConfig.googleConfig = {};
        androidPushConfig.googleConfig.collapseKey = options.getCollapseKeyFCM();
        androidPushConfig.googleConfig.imageUrl = options.getImageUrlFCM();
        androidPushConfig.googleConfig.priority = undefined;
        return androidPushConfig;
    }
    function convertIOSPushOptions(options) {
        const iOSPushConfig = {};
        if (options === null)
            return iOSPushConfig;
        iOSPushConfig.threadId = options.getThreadId();
        iOSPushConfig.apnsCollapseId = options.getApnsCollapseId();
        iOSPushConfig.category = options.getCategory();
        iOSPushConfig.richMediaUri = options.getRichMediaUri();
        return iOSPushConfig;
    }
    function convertMessageOptions(message) {
        if (!message)
            return {};
        const options = {};
        options.channelId = message.channelId || null;
        options.targetId = message.targetId;
        options.conversationType = convertConversationType(message.conversationType);
        options.direction = convertMessageDirection(message.messageDirection);
        if (message.expansion)
            options.expansion = new Map(Object.entries(message.expansion));
        const msgContent = message?.content;
        if (msgContent?.extra)
            options.extra = msgContent.extra;
        const { readReceiptInfo } = message;
        if (readReceiptInfo) {
            const { readerList } = readReceiptInfo;
            if (readerList) {
                const respondUserIds = new Map();
                readerList.forEach(({ userId, readTime }) => {
                    respondUserIds.set(userId, readTime);
                });
                options.groupReadReceiptInfo = new RCIMIWGroupReadReceiptInfo({
                    hasRespond: !!readReceiptInfo.hasRespond,
                    respondUserIds,
                });
            }
        }
        if (msgContent?.mentionedInfo) {
            options.mentionedInfo = new RCIMIWMentionedInfo({
                type: convertMentionedType(msgContent?.mentionedInfo?.type),
                userIdList: msgContent?.mentionedInfo?.userIdList,
            });
        }
        if (message.messageId)
            options.messageId = message.messageId;
        if (message.messageType)
            options.messageType = convertMessageType(message.messageType);
        if (message.messageUId)
            options.messageUId = message.messageUId;
        options.offLine = message.isOffLineMessage;
        const { pushConfig } = message;
        if (pushConfig) {
            options.pushOptions = new RCIMIWMessagePushOptions({
                disableNotification: !!message.disableNotification,
                disablePushTitle: pushConfig.disablePushTitle,
                forceShowDetailContent: pushConfig.forceShowDetailContent,
                pushTitle: pushConfig.pushTitle,
                pushData: pushConfig.pushData,
                pushContent: pushConfig.pushContent,
                templateId: pushConfig.templateId,
                androidPushOptions: convertAndroidConfigW2F(pushConfig.androidConfig),
                iOSPushOptions: convertIOSPushOptionsW2F(pushConfig.iOSConfig),
            });
        }
        options.receivedStatus = convertReceivedStatus(message.receivedStatus);
        options.receivedTime = message.receivedTime;
        options.senderUserId = message.senderUserId;
        options.sentStatus = convertSentStatus(message.sentStatus);
        options.sentTime = message.sentTime;
        options.targetId = message.targetId;
        if (msgContent?.user) {
            const users = msgContent;
            options.userInfo = new RCIMIWUserInfo({
                userId: users.user?.id,
                name: users.user?.name,
                portrait: users.user?.portrait,
                extra: users.user?.extra,
            });
        }
        return options;
    }
    function convertMentionedType(type, isFlutter) {
        if (isFlutter) {
            switch (type) {
                case exports.RCIMIWMentionedType.PART:
                    return ue$1.SINGAL;
                case exports.RCIMIWMentionedType.ALL:
                default:
                    return ue$1.ALL;
            }
        }
        switch (type) {
            case ue$1.SINGAL:
                return exports.RCIMIWMentionedType.PART;
            case ue$1.ALL:
            default:
                return exports.RCIMIWMentionedType.ALL;
        }
    }

    class ARCIMIWEngine {
    }

    class RCIMIWConversation {
        targetId = '';
        draft = '';
        unreadCount = 0;
        mentionedCount = 0;
        top = false;
        lastMessage = null;
        conversationType = exports.RCIMIWConversationType.INVALID;
        channelId = null;
        notificationLevel = exports.RCIMIWPushNotificationLevel.NONE;
        constructor(conversation) {
            if (conversation?.targetId)
                this.targetId = conversation?.targetId;
            if (conversation?.draft)
                this.draft = conversation?.draft;
            if (conversation?.unreadMessageCount)
                this.unreadCount = conversation.unreadMessageCount;
            if (conversation.unreadMentionedCount)
                this.mentionedCount = conversation.unreadMentionedCount;
            this.top = !!conversation.isTop;
            if (conversation?.latestMessage)
                this.lastMessage = convertConversationLastMessage(conversation);
            this.conversationType = convertConversationType(conversation.conversationType);
            if (conversation.channelId)
                this.channelId = conversation.channelId;
            if (conversation.notificationLevel)
                this.notificationLevel = convertPushNotificationLevel(conversation.notificationLevel);
        }
        /**
         * 会话 ID
         *
         * @return
         */
        getTargetId() {
            return this.targetId;
        }
        /**
         * 会话草稿
         *
         * @return
         */
        getDraft() {
            return this.draft;
        }
        /**
         * 获取未读消息数。
         */
        getUnreadCount() {
            return this.unreadCount;
        }
        /**
         * 获取本会话里自己被 @ 的消息数量。
         */
        getMentionedCount() {
            return this.mentionedCount;
        }
        /**
         * 获取置顶状态
         */
        isTop() {
            return this.top;
        }
        /**
         * 获取最后一条消息
         */
        getLastMessage() {
            return this.lastMessage;
        }
        /**
         * 获取会话类型
         */
        getConversationType() {
            return this.conversationType;
        }
        /**
         * 获取渠道 ID
         *
         * @return
         */
        getChannelId() {
            return this.channelId;
        }
        /**
         * 会话的通知级别
         * @return
         */
        getNotificationLevel() {
            return this.notificationLevel;
        }
    }

    class RCIMIWEngine extends ARCIMIWEngine {
        _listener;
        constructor() {
            super();
        }
        /**
         * 创建接口引擎
         *
         * @param appkey  开发者后台获取的 AppKey
         * @param options 引擎配置项
         * @return 引擎实例 或 null
         */
        static create(appkey, options) {
            if (!appkey)
                return null;
            const initOption = { appkey };
            initOption.logStdout = () => ({}); // TODO: 待删除：避免 imlib-next 打印影响，完成开发后删除
            const naviServer = options?.getNaviServer();
            if (naviServer)
                initOption.navigators = [naviServer];
            if (options?.getFileServer()) {
                initOption.uploadDomain = options?.getFileServer();
            }
            Ie(initOption);
            return new RCIMIWEngine();
        }
        destroy() {
            // RongIMLib.destroy(); // TODO: 待更新：IMLib 5.6.0 支持接口
        }
        setListener(listener) {
            this._listener = listener;
            // 连接状态监听
            this._connectionStatusHandler();
            // 消息监听
            Re(B.MESSAGES, (evt) => {
                const messages = evt.messages.filter((message) => message.messageType !== 'RC:Delivered' && message.messageType !== 'RC:DRMsg');
                if (!messages || messages.length === 0)
                    return;
                while (messages.length > 0) {
                    const message = messages.shift();
                    if (message)
                        this._listener?.onMessageReceived?.(convertMessage(message), messages.length, false, false);
                }
            });
            Re(B.READ_RECEIPT_RECEIVED, ({ conversation: { targetId, channelId = '' }, sentTime }) => {
                this._listener?.onPrivateReadReceiptReceived?.(targetId, channelId, sentTime);
            });
            // 监听：收到群聊已读回执请求
            Re(B.MESSAGE_RECEIPT_REQUEST, ({ conversation, messageUId }) => {
                this._listener?.onGroupMessageReadReceiptRequestReceived?.(conversation.targetId, messageUId);
            });
            // TODO: 待修复：无法触发；监听：收到群聊已读回执响应
            Re(B.MESSAGE_RECEIPT_RESPONSE, ({ conversation, receivedUserId, messageUIdList }) => {
                if (isArray(messageUIdList)) {
                    messageUIdList.forEach((messageUId) => {
                        this._listener?.onGroupMessageReadReceiptResponseReceived?.(conversation.targetId, messageUId, new Map([[receivedUserId, 0]]));
                    });
                }
            });
            // TODO: 待确认：返回值不合适，Web 无法区分置顶和会话通知变更；
            // 通知会话更新；通知的条件: 会话状态变化、会话未读数变化（未读数增加、未读数清空）、会话 @ 信息（hasMentioned、mentionedInfo）；
            Re(B.CONVERSATION, ({ conversations = [] }) => {
                conversations.forEach((conversation) => {
                    const { conversationType, targetId, channelId = null, isTop = false, } = conversation;
                    this._listener?.onConversationTopStatusSynced?.(convertConversationType(conversationType), targetId, channelId, isTop);
                });
            });
            // 监听：聊天室状态变更
            Re(B.CHATROOM, ({ rejoinedRoom, userChange, chatroomDestroyed, updatedEntries, }) => {
                if (rejoinedRoom) {
                    this._listener?.onChatRoomStatusChanged?.(rejoinedRoom.chatroomId, exports.RCIMIWChatRoomStatus.RESET);
                }
                if (userChange) {
                    const { users } = userChange;
                    const roomMembers = [];
                    Object.keys(users).forEach((userId) => {
                        const actionType = convertMemberActionType(users[userId]);
                        const roomMember = new RCIMIWChatRoomMemberAction({ userId, actionType });
                        roomMembers.push(roomMember);
                    });
                    if (roomMembers.length > 0)
                        this._listener?.onChatRoomMemberChanged?.(userChange.chatroomId, roomMembers);
                }
                if (chatroomDestroyed) {
                    this._listener?.onChatRoomStatusChanged?.(chatroomDestroyed, exports.RCIMIWChatRoomStatus.DESTROY_AUTO);
                }
                if (Array.isArray(updatedEntries)) {
                    updatedEntries.forEach(({ key, value, type, chatroomId, }) => {
                        this._listener?.onChatRoomEntriesChanged?.(convertChatRoomEntryType(type), chatroomId, new Map([[key, value]]));
                    });
                }
            });
            // 监听：消息扩展信息更改
            Re(B.EXPANSION, ({ updatedExpansion, deletedExpansion }) => {
                if (updatedExpansion)
                    this._listener?.onRemoteMessageExpansionUpdated?.(convertObj2Map(updatedExpansion.expansion), updatedExpansion.messageUId);
                if (deletedExpansion)
                    this._listener?.onRemoteMessageExpansionForKeyRemoved?.(deletedExpansion.messageUId, deletedExpansion.deletedKeys);
            });
            // 监听：收到正在输入状态通知
            Re(B.TYPING_STATUS, ({ status = [] }) => {
                status.forEach(({ targetId, conversationType, channelId = '', list, }) => {
                    this._listener?.onTypingStatusChanged?.(convertConversationType(conversationType), targetId, channelId, list.map((typingUser) => convertTypingUser(typingUser)));
                });
            });
            // 监听：敏感词回调通知。
            Re(B.MESSAGE_BLOCKED, (data) => {
                this._listener?.onMessageBlocked?.(convertBlockedMessageInfo(data));
            });
            // 监听：超级群输入状态通知
            Re(B.OPERATE_STATUS, (status) => {
                if (!status.hasInfo)
                    return;
                const infos = status.info.map((item, index) => new RCIMIWUltraGroupTypingStatusInfo({
                    targetId: item.targetId,
                    channelId: item.channelId || '',
                    userId: item.userId,
                    timestamp: item.operationTime,
                    userNums: status.hasSummary && status.summary[index] ? status.summary[index].count || 0 : 0,
                }));
                this._listener?.onUltraGroupTypingStatusChanged?.(infos);
            });
            Re(B.ULTRA_GROUP_MESSAGE_EXPANSION_UPDATED, (list) => {
                this._listener?.onRemoteUltraGroupMessageExpansionUpdated?.(list.map((message) => convertMessage(message)));
            });
            Re(B.ULTRA_GROUP_MESSAGE_MODIFIED, (list) => {
                this._listener?.onRemoteUltraGroupMessageModified?.(list.map((message) => convertMessage(message)));
            });
            // 监听：超级群消息被撤回通知
            Re(B.ULTRA_GROUP_MESSAGE_RECALLED, (list) => {
                this._listener?.onRemoteUltraGroupMessageRecalled?.(list.map((message) => {
                    message.messageType = Ro.RECALL_MESSAGE_TYPE;
                    return convertMessage(message);
                }));
            });
            Re(B.ULTRA_GROUP_ENABLE, (conversationList = []) => {
                listener?.onUltraGroupEnable?.(conversationList.map((conversation) => new RCIMIWConversation(conversation)));
            });
            // TODO: 暂时保留，未使用监听，完成开发后移除
            // 监听：离线消息拉取完成
            Re(B.PULL_OFFLINE_MESSAGE_FINISHED, () => ({}));
            // 监听：收到 tag 变动通知
            Re(B.TAG, () => ({}));
            // 监听：收到会话 tag 变更通知
            Re(B.CONVERSATION_TAG, () => ({}));
            // 监听：超级群频道类型切换通知
            Re(B.ULTRA_GROUP_CHANNEL_TYPE_CHANGE, () => ({}));
            // 监听：超级群频道删除
            Re(B.ULTRA_GROUP_CHANNEL_DELETE, () => ({}));
            // 监听：超级群私有频道成员变更-退出
            Re(B.ULTRA_GROUP_CHANNEL_USER_KICKED, () => ({}));
        }
        connect(token, callback) {
            if (!isString(token)
                || token === '')
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Ce(token).then(({ code, data = { userId: '' } }) => {
                const { userId } = data;
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(userId);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConnected?.(RCIMIWCode, userId);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        sendMessage(message, callback) {
            if (!message
                || (message instanceof RCIMIWMediaMessage)
                || !(message instanceof RCIMIWMessage)
                || message.getMessageType() === exports.RCIMIWMessageType.UNKNOWN)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const conversationType = convertConversationType(message.getConversationType(), true);
            const targetId = message.getTargetId();
            const channelId = message.getChannelId() || '';
            const options = convertSendMessageOptions(message);
            let messageWeb = convertMessage(message, true);
            Ln({
                targetId,
                conversationType,
                channelId,
            }, messageWeb, options).then(({ code, data: msg }) => {
                if (msg)
                    message = convertMessage(msg);
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(message);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onMessageSent?.(RCIMIWCode, message);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        sendMediaMessage(message, callbacks) {
            const that = this;
            if (!message
                || !(message instanceof RCIMIWMediaMessage)
                || message.getMessageType() === exports.RCIMIWMessageType.UNKNOWN
                || !message.getMessageType()
                || ![exports.RCIMIWMessageType.FILE, exports.RCIMIWMessageType.GIF, exports.RCIMIWMessageType.IMAGE, exports.RCIMIWMessageType.SIGHT, exports.RCIMIWMessageType.VOICE].includes(message.getMessageType()))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            let file = message.getFile();
            if (!file)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            file = file.files[0];
            const conversationType = convertConversationType(message.getConversationType(), true);
            const targetId = message.getTargetId();
            const channelId = message.getChannelId() || '';
            const conversation = { conversationType, targetId, channelId };
            let messageWeb = convertMessage(message, true);
            let msgBody = { file };
            if (messageWeb && isObject(messageWeb.content))
                msgBody = { ...msgBody, ...messageWeb.content };
            const hooks = {
                onProgress: (progress) => {
                    callbacks?.onMediaMessageSending?.(message, progress);
                    if (!callbacks?.onMediaMessageSending)
                        that._listener?.onMediaMessageSending?.(message, progress);
                },
            };
            const sendMessageOptions = convertSendMessageOptions(message);
            const options = { ...sendMessageOptions, contentDisposition: 'inline' };
            const callback = ({ code, data }) => {
                const RCIMIWCode = convertErrorCode(code);
                const resMsg = convertMediaMessage(data);
                if (resMsg && RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callbacks?.onMediaMessageSent?.onSuccess(resMsg);
                }
                else {
                    callbacks?.onMediaMessageSent?.onError(RCIMIWCode);
                }
                if (!callbacks?.onMediaMessageSent)
                    this._listener?.onMediaMessageSent?.(convertErrorCode(code), resMsg);
            };
            if (message.getRemote()) {
                let msg = convertMessage(message, true);
                Ln({ targetId, conversationType, channelId }, msg, options).then(callback);
                // } else {
                //   // TODO: 媒体发送 jest 报错
                //   RongIMLib.sendFileMessage(conversation, msgBody, hooks, options).then(callback);
                // }
            }
            else if (message instanceof RCIMIWGIFMessage || message instanceof RCIMIWImageMessage) {
                Dn(conversation, msgBody, hooks, options).then(callback);
            }
            else if (message instanceof RCIMIWVoiceMessage) {
                Bn(conversation, msgBody, hooks, options).then(callback);
            }
            else if (message instanceof RCIMIWSightMessage) {
                kn(conversation, {
                    ...msgBody,
                    duration: message.getDuration(),
                    thumbnail: message.getThumbnailBase64String(),
                    name: message.getName(),
                }, hooks, options).then(callback);
            }
            else {
                Gn(conversation, msgBody, hooks, options).then(callback);
            }
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        disconnect() {
            Te();
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        createTextMessage(conversationType, targetId, channelId, text) {
            return new RCIMIWTextMessage({
                text, conversationType, targetId, channelId,
            });
        }
        createCustomMessage(conversationType, targetId, channelId, policy, messageIdentifier, fields) {
            return new RCIMIWCustomMessage({
                conversationType,
                targetId,
                channelId,
                policy,
                identifier: messageIdentifier,
                fields,
            });
        }
        createReferenceMessage(conversationType, targetId, channelId, referenceMessage, text) {
            return new RCIMIWReferenceMessage({
                conversationType, targetId, channelId, referenceMessage, text,
            });
        }
        createLocationMessage(conversationType, targetId, channelId, longitude, latitude, poiName, thumbnail) {
            return new RCIMIWLocationMessage({
                conversationType,
                targetId,
                channelId,
                longitude,
                latitude,
                poiName,
                thumbnail,
            });
        }
        createImageMessage(conversationType, targetId, channelId, file) {
            return new RCIMIWImageMessage({
                conversationType, targetId, channelId, file,
            });
        }
        createFileMessage(conversationType, targetId, channelId, file) {
            return new RCIMIWFileMessage({
                conversationType, targetId, channelId, file,
            });
        }
        createSightMessage(conversationType, targetId, channelId, file) {
            return new RCIMIWSightMessage({
                conversationType, targetId, channelId, file,
            });
        }
        createVoiceMessage(conversationType, targetId, channelId, file) {
            return new RCIMIWVoiceMessage({
                conversationType, targetId, file,
            });
        }
        createGIFMessage(conversationType, targetId, channelId, file) {
            return new RCIMIWGIFMessage({
                conversationType, targetId, channelId, file,
            });
        }
        loadConversation(type, targetId, channelId, callback) {
            if (!Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || !isString(targetId)
                || targetId === '') {
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            }
            const conversationType = convertConversationType(type, true);
            Le({
                conversationType,
                targetId,
                channelId: channelId || '',
            }).then(({ code, data }) => {
                const conversation = data ? new RCIMIWConversation(data) : null;
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS && conversation) {
                    callback?.onSuccess(conversation);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationLoaded?.(convertErrorCode(code), type, targetId, channelId, data ? conversation : null);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadConversations(conversationTypes, channelId, startTime, count, callback) {
            if (!conversationTypes
                || conversationTypes.length === 0
                || conversationTypes.includes(exports.RCIMIWConversationType.INVALID)
                || conversationTypes.includes(exports.RCIMIWConversationType.CHATROOM) // 不支持聊天室
                || count <= 0
                || count > 50)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const types = conversationTypes.map((type) => convertConversationType(type, true));
            xe({
                count,
                startTime,
                order: 0,
            }, channelId || '').then(({ code, data }) => {
                const RCIMIWCode = convertErrorCode(code);
                let conversations = [];
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS && data) {
                    const filterData = data.filter((con) => types.includes(con.conversationType));
                    conversations = filterData.map((conversation) => new RCIMIWConversation(conversation));
                }
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(conversations);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationsLoaded?.(convertErrorCode(code), conversationTypes, channelId, startTime, count, conversations);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        removeConversation(type, targetId, channelId, callback) {
            if (!Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || !isString(targetId)) {
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            }
            const conversationType = convertConversationType(type, true);
            be({
                conversationType,
                targetId,
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationRemoved?.(convertErrorCode(code), type, targetId, channelId);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUnreadCount(type, targetId, channelId, callback) {
            if (!Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || type === exports.RCIMIWConversationType.INVALID
                || type === exports.RCIMIWConversationType.CHATROOM
                || !targetId) {
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            }
            Fe({ conversationType: convertConversationType(type, true), targetId, channelId: channelId || '' }).then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUnreadCountLoaded?.(RCIMIWCode, type, targetId, channelId, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadTotalUnreadCount(channelId, callback) {
            Be(true).then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onTotalUnreadCountLoaded?.(RCIMIWCode, channelId, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUnreadMentionedCount(type, targetId, channelId, callback) {
            if (!Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || type === exports.RCIMIWConversationType.INVALID
                || type === exports.RCIMIWConversationType.CHATROOM
                || type === exports.RCIMIWConversationType.ULTRA_GROUP
                || !targetId) {
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            }
            const { AT_MESSAGE_NOTIFICATION, AT_USER_NOTIFICATION, AT_GROUP_ALL_USER_NOTIFICATION, NOT_MESSAGE_NOTIFICATION, } = ae$1;
            He([convertConversationType(type, true)], [
                AT_MESSAGE_NOTIFICATION, AT_USER_NOTIFICATION, AT_GROUP_ALL_USER_NOTIFICATION, NOT_MESSAGE_NOTIFICATION,
            ]).then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUnreadMentionedCountLoaded?.(RCIMIWCode, type, targetId, channelId, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUltraGroupAllUnreadCount(callback) {
            pt().then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupAllUnreadCountLoaded?.(RCIMIWCode, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUltraGroupAllUnreadMentionedCount(callback) {
            vt().then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupAllUnreadMentionedCountLoaded?.(RCIMIWCode, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUltraGroupUnreadCount(targetId, callback) {
            if (!targetId)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            mt(targetId).then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupUnreadCountLoaded?.(convertErrorCode(code), targetId, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUltraGroupUnreadMentionedCount(targetId, callback) {
            if (!targetId)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            lt(targetId).then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupUnreadMentionedCountLoaded?.(RCIMIWCode, targetId, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUnreadCountByConversationTypes(conversationTypes, _channelId, contain, callback) {
            // 不支持会话类型列表
            const typesNotSupport = [exports.RCIMIWConversationType.CHATROOM, exports.RCIMIWConversationType.INVALID, exports.RCIMIWConversationType.ULTRA_GROUP];
            if (!isArray(conversationTypes)
                || conversationTypes.every((type) => typesNotSupport.includes(type))) {
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            }
            const types = conversationTypes.map((type) => convertConversationType(type, true));
            let loadUnreadCountByConversationTypes = ke(types, []);
            if (contain) {
                loadUnreadCountByConversationTypes = He(types, []);
            }
            loadUnreadCountByConversationTypes.then().then(({ code, data = 0 }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUnreadCountByConversationTypesLoaded?.(RCIMIWCode, conversationTypes, _channelId, contain, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        clearUnreadCount(type, targetId, channelId, _timestamp, callback) {
            if (!type
                || !targetId
                || [exports.RCIMIWConversationType.INVALID, exports.RCIMIWConversationType.CHATROOM].includes(type)) {
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            }
            qe({ conversationType: convertConversationType(type, true), targetId, channelId: channelId || '' }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUnreadCountCleared?.(RCIMIWCode, type, targetId, channelId, _timestamp);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        saveDraftMessage(type, targetId, channelId, draft, callback) {
            if (!type
                || !targetId
                || !draft)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Ge({
                conversationType: convertConversationType(type, true),
                targetId,
                channelId: channelId || '',
            }, draft).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onDraftMessageSaved?.(RCIMIWCode, type, targetId, channelId, draft);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadDraftMessage(type, targetId, channelId, callback) {
            if (!type
                || !targetId)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Pe({
                conversationType: convertConversationType(type, true),
                targetId,
            }).then(({ code, data = '' }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(data);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onDraftMessageLoaded?.(convertErrorCode(code), type, targetId, channelId, data);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        clearDraftMessage(type, targetId, channelId, callback) {
            if (!type
                || !targetId)
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            De({
                conversationType: convertConversationType(type, true),
                targetId,
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onDraftMessageCleared?.(convertErrorCode(code), type, targetId, channelId);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadBlockedConversations(conversationTypes, channelId, callback) {
            // 不支持会话类型列表
            const typesNotSupport = [exports.RCIMIWConversationType.CHATROOM, exports.RCIMIWConversationType.INVALID, exports.RCIMIWConversationType.ULTRA_GROUP];
            if (!isArray(conversationTypes)
                || conversationTypes.every((type) => typesNotSupport.includes(type)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const types = conversationTypes.map((type) => convertConversationType(type, true));
            je().then(({ code, data }) => {
                const RCIMIWCode = convertErrorCode(code);
                let conversations = [];
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS && data) {
                    const filterConversations = data.filter((con) => types.includes(con.conversationType));
                    conversations = filterConversations.map((conversation) => new RCIMIWConversation(conversation));
                }
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(conversations);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onBlockedConversationsLoaded?.(RCIMIWCode, conversationTypes, channelId, conversations);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        changeConversationTopStatus(type, targetId, channelId, top, callback) {
            if (!isNumber(type)
                || !isString(targetId)
                || !isBoolean(top)
                || (channelId && !isString(channelId)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Qe({
                conversationType: convertConversationType(type, true),
                targetId,
                channelId: channelId || '',
            }, top).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationTopStatusChanged?.(RCIMIWCode, type, targetId, channelId, top);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadConversationTopStatus(type, targetId, channelId, callback) {
            if (exports.RCIMIWConversationType.INVALID === type
                || !isNumber(type)
                || !isString(targetId)
                || (channelId && !isString(channelId)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Le({
                conversationType: convertConversationType(type, true),
                targetId,
                channelId: channelId || '',
            }).then(({ code, data }) => {
                const RCIMIWCode = convertErrorCode(code);
                const isTop = !!data?.isTop;
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(isTop);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationTopStatusLoaded?.(RCIMIWCode, type, targetId, channelId, isTop);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        syncConversationReadStatus(type, targetId, channelId, timestamp, callback) {
            if (exports.RCIMIWConversationType.INVALID === type
                || !isNumber(type)
                || !isString(targetId)
                || (channelId && !isString(channelId))
                || !isNumber(timestamp))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Jn({
                conversationType: convertConversationType(type, true),
                targetId,
                channelId: channelId || '',
            }, timestamp).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationReadStatusSynced?.(RCIMIWCode, type, targetId, channelId, timestamp);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        async sendTypingStatus(type, targetId, channelId, currentType) {
            if (exports.RCIMIWConversationType.PRIVATE !== type
                || !isString(targetId)
                || (channelId && !isString(channelId)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const { code } = await Zn({
                conversationType: X$1.PRIVATE,
                targetId,
                channelId: channelId || '',
            }, currentType);
            return convertErrorCode(code);
        }
        loadMessages(type, targetId, channelId, sentTime, order, policy, count, callback) {
            if (!isNumber(type)
                || !isString(targetId)
                || (channelId && !isString(channelId))
                || !isNumber(sentTime)
                || !isNumber(order)
                || !isNumber(policy)
                || !isNumber(count)
                || policy !== exports.RCIMIWMessageOperationPolicy.REMOTE
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWTimeOrder, order)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWMessageOperationPolicy, policy))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Hn({
                conversationType: convertConversationType(type, true),
                targetId,
            }, {
                timestamp: sentTime,
                count,
                order,
            }).then(({ code, data }) => {
                const messages = data?.list || [];
                const RCIMIWMessages = messages.map((message) => convertMessage(message));
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(RCIMIWMessages);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onMessagesLoaded?.(RCIMIWCode, type, targetId, channelId, sentTime, order, RCIMIWMessages);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        clearMessages(type, targetId, channelId, timestamp, policy, callback) {
            if (!isNumber(type)
                || !isString(targetId)
                || (channelId && !isString(channelId))
                || !isNumber(timestamp)
                || !isNumber(policy)
                || policy !== exports.RCIMIWMessageOperationPolicy.REMOTE
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWMessageOperationPolicy, policy)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Xn({
                conversationType: convertConversationType(type, true),
                targetId,
                channelId: channelId || '',
            }, timestamp).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onMessageCleared?.(RCIMIWCode, type, targetId, channelId, timestamp);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        deleteMessages(type, targetId, channelId, messages, callback) {
            if (!isNumber(type)
                || !isString(targetId)
                || !(isArray(messages) && messages.length !== 0)
                || (channelId && !isString(channelId))
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || messages.every((message) => !message.getMessageUId() || !message.getSentTime()))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const options = messages.map((message) => ({
                messageUId: message.getMessageUId(),
                sentTime: message.getSentTime(),
                messageDirection: convertMessageDirection(message.getDirection(), true),
            }));
            Wn({
                conversationType: convertConversationType(type, true),
                targetId,
                channelId: channelId || '',
            }, options).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onMessagesDeleted?.(RCIMIWCode, type, targetId, channelId, messages);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        recallMessage(message, callback) {
            if (!message
                || !(message instanceof RCIMIWMessage)
                || !isString(message.getTargetId())
                || !isString(message.getMessageUId())
                || !isNumber(message.getSentTime()))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Yn({
                conversationType: convertConversationType(message.getConversationType(), true),
                targetId: message.getTargetId(),
                channelId: message.getChannelId() || '',
            }, {
                messageUId: message.getMessageUId(),
                sentTime: message.getSentTime(),
            }).then(({ code, data }) => {
                let msg = message;
                if (data)
                    msg = convertMessage(data);
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(msg);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onMessageRecalled?.(RCIMIWCode, msg);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        sendPrivateReadReceiptMessage(targetId, channelId, timestamp, messageUId, callback) {
            if (!isString(targetId)
                || (channelId && !isString(channelId))
                || !isNumber(timestamp)
                || !isString(messageUId))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            qn(targetId, messageUId, timestamp).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onPrivateReadReceiptMessageSent?.(RCIMIWCode, targetId, channelId, timestamp, messageUId);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        sendGroupReadReceiptRequest(message, callback) {
            if (!message
                || !(message instanceof RCIMIWMessage)
                || !isString(message.getTargetId())
                || !isString(message.getMessageUId()))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const targetId = message.getTargetId();
            Vn(targetId, message.getMessageUId()).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onGroupReadReceiptRequestSent?.(RCIMIWCode, message);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        sendGroupReadReceiptResponse(targetId, channelId, messages, callback) {
            if (!isString(targetId)
                || !targetId
                || (channelId && !isString(channelId))
                || !isArray(messages)
                || messages.every((message) => !message.getMessageUId()))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const messageList = {};
            messages.forEach((message) => {
                const userId = message.getSenderUserId();
                if (!messageList[userId])
                    messageList[userId] = [];
                if (userId)
                    messageList[userId].push(message.getMessageUId());
            });
            Kn(targetId, messageList, channelId || '').then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onGroupReadReceiptResponseSent?.(convertErrorCode(code), targetId, channelId, messages);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        updateMessageExpansion(message, expansion, callback) {
            if (!message
                || !(message instanceof RCIMIWMessage)
                || !isString(message.getMessageUId())
                || !message.getMessageUId()
                || !isMap(expansion))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const msg = convertMessage(message, true);
            msg.canIncludeExpansion = true;
            const messageUId = message.getMessageUId();
            jn(Object.fromEntries(expansion.entries()), msg).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onMessageExpansionUpdated?.(convertErrorCode(code), messageUId, expansion);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        removeMessageExpansionForKeys(message, keys, callback) {
            if (!message
                || !(message instanceof RCIMIWMessage)
                || !isString(message.getMessageUId())
                || !message.getMessageUId()
                || !isArray(keys)
                || keys.every((key) => !isString(key)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const msg = convertMessage(message, true);
            msg.canIncludeExpansion = true;
            const messageUId = message.getMessageUId();
            Qn(keys, msg).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onMessageExpansionForKeysRemoved?.(convertErrorCode(code), messageUId, keys);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        joinChatRoom(targetId, messageCount, autoCreate, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isNumber(messageCount)
                || !isBoolean(autoCreate))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const methodName = autoCreate ? 'joinChatRoom' : 'joinExistChatRoom';
            RongIMLib[methodName](targetId, {
                count: messageCount,
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onChatRoomJoined?.(convertErrorCode(code), targetId);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        leaveChatRoom(targetId, callback) {
            if (!isString(targetId)
                || targetId === '')
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Nt(targetId).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onChatRoomLeft?.(convertErrorCode(code), targetId);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadChatRoomMessages(targetId, timestamp, order, count, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isNumber(timestamp)
                || !isNumber(order)
                || !isNumber(count)
                || !(count > 0 && count <= 50)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWTimeOrder, order))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Lt(targetId, {
                timestamp,
                count,
                order: convertTimeOrder(order),
            }).then(({ code, data }) => {
                let messages = [];
                if (data?.list)
                    messages = data.list.map((message) => convertMessage(message));
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(messages);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onChatRoomMessagesLoaded?.(convertErrorCode(code), targetId, messages, timestamp);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        addChatRoomEntry(targetId, key, value, deleteWhenLeft, overwrite, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isString(key)
                || key === ''
                || !isString(value)
                || value === ''
                || !isBoolean(deleteWhenLeft)
                || !isBoolean(overwrite))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const methodName = overwrite ? 'forceSetChatRoomEntry' : 'setChatRoomEntry';
            RongIMLib[methodName](targetId, {
                key,
                value,
                isAutoDelete: deleteWhenLeft,
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onChatRoomEntryAdded?.(convertErrorCode(code), targetId, key);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        addChatRoomEntries(targetId, entries, deleteWhenLeft, overwrite, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isMap(entries)
                || !isBoolean(deleteWhenLeft)
                || !isBoolean(overwrite))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            _t(targetId, {
                entries: convertChatEntriesMap2Arr(entries),
                isAutoDelete: deleteWhenLeft,
                isForce: overwrite, // 是否强制覆盖
            }).then(({ code, data }) => {
                let errorEntries = new Map();
                if (code === z$1.CHATROOM_KV_STORE_NOT_ALL_SUCCESS && Array.isArray(data)) {
                    data.forEach(({ key, errorCode }) => errorEntries.set(key, errorCode));
                }
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode, errorEntries);
                }
                if (!callback)
                    this._listener?.onChatRoomEntriesAdded?.(RCIMIWCode, targetId, entries, errorEntries);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadChatRoomEntry(targetId, key, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isString(key)
                || key === '')
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            wt(targetId, key).then(({ code, data }) => {
                const entry = convertObj2Map({ [key]: data });
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(entry);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onChatRoomEntryLoaded?.(RCIMIWCode, targetId, entry);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadAllChatRoomEntries(targetId, callback) {
            if (!isString(targetId)
                || targetId === '')
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            xt(targetId).then(({ code, data = {} }) => {
                const RCIMIWCode = convertErrorCode(code);
                const entries = convertObj2Map(data);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(entries);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onAllChatRoomEntriesLoaded?.(RCIMIWCode, targetId, entries);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        removeChatRoomEntry(targetId, key, force, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isString(key)
                || key === ''
                || !isBoolean(force))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const removeChatRoomEntry = force ? At(targetId, { key }) : Ot(targetId, { key });
            removeChatRoomEntry.then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onChatRoomEntryRemoved?.(RCIMIWCode, targetId, key);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        removeChatRoomEntries(targetId, keys, force, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isArray(keys)
                || keys.length === 0
                || !isBoolean(force))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            // TODO: 待修复：entries 参数类型错误, [{ key: 'key1' }] 报错，['key1'] 通过；imlib-next 校验不通过
            // const entries = keys.map((key) => ({ key })); // [{ key: 'key1' }]
            // { key: string; }[] 类型错误，应该是 string[]
            Mt(targetId, { entries: keys }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onChatRoomEntriesRemoved?.(RCIMIWCode, targetId, keys);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        changeConversationNotificationLevel(type, targetId, channelId, level, callback) {
            if (!isNumber(type)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || !isString(targetId)
                || targetId === ''
                || (channelId && !isString(channelId))
                || !isNumber(level)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWPushNotificationLevel, level))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const conversationType = convertConversationType(type, true);
            const notificationLevel = convertPushNotificationLevel(level, true);
            Je({
                conversationType,
                targetId,
            }, notificationLevel).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationNotificationLevelChanged?.(RCIMIWCode, type, targetId, channelId, level);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadConversationNotificationLevel(type, targetId, channelId, callback) {
            if (!isNumber(type)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || !isString(targetId)
                || targetId === ''
                || (channelId && !isString(channelId)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            We({
                conversationType: convertConversationType(type, true),
                targetId,
            }).then(({ code, data = ae$1.NOT_SET }) => {
                const RCIMIWCode = convertErrorCode(code);
                const notificationLevel = convertPushNotificationLevel(data);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(notificationLevel);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationNotificationLevelLoaded?.(RCIMIWCode, type, targetId, channelId, notificationLevel);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadTopConversations(conversationTypes, channelId, callback) {
            if (!isArray(conversationTypes)
                || conversationTypes.length === 0
                || conversationTypes.every((type) => (!isNumber(type)
                    || !Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                    || type === exports.RCIMIWConversationType.INVALID))
                || (channelId && !isString(channelId)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Ze().then(({ code, data = [] }) => {
                const conversations = data.map((conversation) => new RCIMIWConversation(conversation));
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(conversations);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onTopConversationsLoaded?.(RCIMIWCode, conversationTypes, channelId, conversations);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        changeUltraGroupDefaultNotificationLevel(targetId, level, callback) {
            if (!isString(targetId)
                || targetId === ''
                || !isNumber(level)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWPushNotificationLevel, level))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const notificationLevel = convertPushNotificationLevel(level, true);
            ft({
                targetId,
            }, notificationLevel).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupDefaultNotificationLevelChanged?.(RCIMIWCode, targetId, level);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUltraGroupDefaultNotificationLevel(targetId, callback) {
            if (!isString(targetId)
                || targetId === '')
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            gt({
                targetId,
            }).then(({ code, data = ae$1.NOT_SET }) => {
                const level = convertPushNotificationLevel(data);
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(level);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupDefaultNotificationLevelLoaded?.(RCIMIWCode, targetId, level);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        changeUltraGroupChannelDefaultNotificationLevel(targetId, channelId, level, callback) {
            if (!isString(targetId)
                || targetId === ''
                || (channelId && !isString(channelId))
                || !isNumber(level)
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWPushNotificationLevel, level))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const notificationLevel = convertPushNotificationLevel(level, true);
            ft({
                targetId,
                channelId: channelId || '',
            }, notificationLevel).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupChannelDefaultNotificationLevelChanged?.(RCIMIWCode, targetId, channelId, level);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadUltraGroupChannelDefaultNotificationLevel(targetId, channelId, callback) {
            if (!isString(targetId)
                || targetId === ''
                || (channelId && !isString(channelId)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            gt({
                targetId,
                channelId: channelId || '',
            }).then(({ code, data = ae$1.NOT_SET }) => {
                const level = convertPushNotificationLevel(data);
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(level);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupChannelDefaultNotificationLevelLoaded?.(RCIMIWCode, targetId, channelId, level);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        sendGroupMessageToDesignatedUsers(message, userIds, callback) {
            if (!(message instanceof RCIMIWMessage)
                || message.getConversationType() !== exports.RCIMIWConversationType.GROUP
                || !isString(message.getTargetId())
                || message.getTargetId() === ''
                || !isArray(userIds)
                || userIds.length === 0
                || userIds.every((userId) => !isString(userId)))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            Ln({
                conversationType: convertConversationType(message.getConversationType(), true),
                targetId: message.getTargetId(),
            }, convertMessage(message, true), {
                directionalUserIdList: userIds,
            }).then(({ code, data }) => {
                const RCIMIWMessage = data ? convertMessage(data) : message;
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(RCIMIWMessage);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onGroupMessageToDesignatedUsersSent?.(RCIMIWCode, RCIMIWMessage);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        syncUltraGroupReadStatus(targetId, channelId, _timestamp, callback) {
            if (!isString(targetId)
                || targetId === ''
                || (channelId && !isString(channelId))
                || !isNumber(_timestamp))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            qe({
                targetId,
                conversationType: X$1.ULTRA_GROUP,
                channelId: channelId || '',
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupReadStatusSynced?.(RCIMIWCode, targetId, channelId, _timestamp);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadConversationListForAllChannel(type, targetId, callback) {
            if (!Object.prototype.hasOwnProperty.call(exports.RCIMIWConversationType, type)
                || type !== exports.RCIMIWConversationType.ULTRA_GROUP
                || !isString(targetId)
                || targetId === '')
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            ot({ targetId }).then(({ code, data = [] }) => {
                const RCIMIWCode = convertErrorCode(code);
                const RCIMIWConversations = data.map((conversation) => new RCIMIWConversation(conversation));
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(RCIMIWConversations);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onConversationsLoadedForAllChannel?.(RCIMIWCode, type, targetId, RCIMIWConversations);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        modifyUltraGroupMessage(messageUId, message, callback) {
            if (!isString(messageUId)
                || messageUId === ''
                || !(message instanceof RCIMIWMessage)
                || messageUId !== message.getMessageUId()
                || message.getConversationType() !== exports.RCIMIWConversationType.ULTRA_GROUP
                || !isString(message.getTargetId()))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const msg = convertMessage(message, true);
            ut(msg.content, {
                ...msg,
                messageUId: message.getMessageUId(),
                sentTime: message.getSentTime(),
                conversationType: convertConversationType(message.getConversationType(), true),
                targetId: message.getTargetId(),
                channelId: message.getChannelId() || '',
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupMessageModified?.(RCIMIWCode, messageUId);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        recallUltraGroupMessage(message, _deleteRemote = true, callback) {
            if (!(message instanceof RCIMIWMessage)
                || message.getMessageUId() === ''
                || !isBoolean(_deleteRemote))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const conversation = {
                conversationType: X$1.ULTRA_GROUP,
                targetId: message.getTargetId(),
                channelId: message.getChannelId() || '',
            };
            Yn(conversation, {
                messageUId: message.getMessageUId(),
                sentTime: message.getSentTime(),
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupMessageRecalled?.(RCIMIWCode, message, _deleteRemote);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        sendUltraGroupTypingStatus(targetId, channelId, typingStatus, callback) {
            if (!isString(targetId)
                || targetId === ''
                || (channelId && !isString(channelId))
                || !Object.prototype.hasOwnProperty.call(exports.RCIMIWUltraGroupTypingStatus, typingStatus))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            it({ conversationType: X$1.ULTRA_GROUP, targetId, channelId: channelId || '' }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupTypingStatusSent?.(RCIMIWCode, targetId, channelId, typingStatus);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        loadBatchRemoteUltraGroupMessages(messages, callback) {
            if (!isArray(messages)
                || messages.every((message) => (!message.getMessageUId())))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            const targetId = messages[0].getTargetId();
            const channelId = messages[0].getChannelId() || '';
            const msgList = messages.map((message) => ({
                messageUId: message.getMessageUId(),
                sendTime: message.getSentTime(),
            }));
            ct({ conversationType: X$1.ULTRA_GROUP, targetId, channelId }, msgList).then(({ code, data }) => {
                const messageMap = data;
                let matchedMessages = [];
                let notMatchedMessages = [];
                if (messageMap) {
                    Object.entries(messageMap).forEach(([_messageUId, message]) => {
                        if (message)
                            matchedMessages.push(convertMessage(message));
                    });
                }
                messages.forEach((message) => {
                    if (!matchedMessages.find((msg) => msg.getMessageUId() === message.getMessageUId())) {
                        notMatchedMessages.push(message);
                    }
                });
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess(matchedMessages, notMatchedMessages);
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onBatchRemoteUltraGroupMessagesLoaded?.(RCIMIWCode, matchedMessages, notMatchedMessages);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        updateUltraGroupMessageExpansion(message, expansion, callback) {
            if (!(message instanceof RCIMIWMessage)
                || message.getMessageUId() === ''
                || !isMap(expansion))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            st(convertMap2Obj(expansion), {
                ...convertMessage(message, true),
                messageUId: message.getMessageUId(),
                sentTime: message.getSentTime(),
                conversationType: convertConversationType(message.getConversationType(), true),
                targetId: message.getTargetId(),
                channelId: message.getChannelId() || '',
                canIncludeExpansion: true,
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupMessageExpansionUpdated?.(RCIMIWCode, expansion, message.getMessageUId());
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        removeUltraGroupMessageExpansion(message, keys, callback) {
            if (!(message instanceof RCIMIWMessage)
                || message.getMessageUId() === ''
                || !isArray(keys))
                return exports.RCIMIWErrorCode.PARAM_ERROR;
            rt(keys, {
                ...convertMessage(message, true),
                messageUId: message.getMessageUId(),
                sentTime: message.getSentTime(),
                conversationType: convertConversationType(message.getConversationType(), true),
                targetId: message.getTargetId(),
                channelId: message.getChannelId() || '',
                canIncludeExpansion: true,
            }).then(({ code }) => {
                const RCIMIWCode = convertErrorCode(code);
                if (RCIMIWCode === exports.RCIMIWErrorCode.SUCCESS) {
                    callback?.onSuccess();
                }
                else {
                    callback?.onError(RCIMIWCode);
                }
                if (!callback)
                    this._listener?.onUltraGroupMessageExpansionRemoved?.(RCIMIWCode, message.getMessageUId(), keys);
            });
            return exports.RCIMIWErrorCode.SUCCESS;
        }
        /**
         * 连接状态监听
         */
        _connectionStatusHandler() {
            Re(B.CONNECTED, () => {
                this._listener?.onConnectionStatusChanged?.(exports.RCIMIWConnectionStatus.CONNECTED);
            });
            Re(B.CONNECTING, () => {
                this._listener?.onConnectionStatusChanged?.(exports.RCIMIWConnectionStatus.CONNECTING);
            });
            Re(B.DISCONNECT, (status) => {
                this._listener?.onConnectionStatusChanged?.(convertConnStatus(status));
            });
            Re(B.SUSPEND, (status) => {
                this._listener?.onConnectionStatusChanged?.(convertConnStatus(status));
            });
        }
    }

    class EventEmitter {
        _map = {};
        /**
         * 添加事件监听器
         * @param eventType
         * @param listener
         */
        on(eventType, listener, target) {
            const arr = this._map[eventType] || (this._map[eventType] = []);
            if (arr.some((item) => item.listener === listener && item.target === target)) {
                return;
            }
            arr.push({ listener, target });
        }
        once(eventType, listener, target) {
            const arr = this._map[eventType] || (this._map[eventType] = []);
            if (arr.some((item) => item.listener === listener && item.target === target)) {
                return;
            }
            arr.push({ listener, target, once: true });
        }
        /**
         * 移除事件监听器
         * @param eventType
         * @param listener
         */
        off(eventType, listener, target) {
            let arr = this._map[eventType];
            if (!arr) {
                return;
            }
            arr = arr.filter((item) => item.listener !== listener || item.target !== target);
            if (arr.length) {
                this._map[eventType] = arr;
            }
            else {
                delete this._map[eventType];
            }
        }
        /**
         * 事件派发
         * @param eventType
         * @param attrs
         */
        emit(eventType, ...attrs) {
            const arr = this._map[eventType];
            if (!arr) {
                return;
            }
            for (let i = arr.length - 1; i >= 0; i -= 1) {
                const { target, once, listener } = arr[i];
                if (once)
                    arr.splice(i, 1);
                try {
                    listener.call(target, ...attrs);
                }
                catch (error) {
                    // eslint-disable-next-line no-console
                    console.warn('listener emit', error);
                }
            }
        }
        /**
         * 清空所有指定类型的事件监听器
         * @param eventType
         */
        removeAll(eventType) {
            delete this._map[eventType];
        }
        /**
         * 无差别清空所有事件监听器
         */
        clear() {
            Object.keys(this._map).forEach(this.removeAll, this);
        }
    }

    exports.EventEmitter = EventEmitter;
    exports.RCIMIWAndroidPushOptions = RCIMIWAndroidPushOptions;
    exports.RCIMIWBlockedMessageInfo = RCIMIWBlockedMessageInfo;
    exports.RCIMIWChatRoomMemberAction = RCIMIWChatRoomMemberAction;
    exports.RCIMIWCommandMessage = RCIMIWCommandMessage;
    exports.RCIMIWCommandNotificationMessage = RCIMIWCommandNotificationMessage;
    exports.RCIMIWCompressOptions = RCIMIWCompressOptions;
    exports.RCIMIWCustomMessage = RCIMIWCustomMessage;
    exports.RCIMIWEngine = RCIMIWEngine;
    exports.RCIMIWEngineOptions = RCIMIWEngineOptions;
    exports.RCIMIWFileMessage = RCIMIWFileMessage;
    exports.RCIMIWGIFMessage = RCIMIWGIFMessage;
    exports.RCIMIWGroupReadReceiptInfo = RCIMIWGroupReadReceiptInfo;
    exports.RCIMIWIOSPushOptions = RCIMIWIOSPushOptions;
    exports.RCIMIWImageMessage = RCIMIWImageMessage;
    exports.RCIMIWMediaMessage = RCIMIWMediaMessage;
    exports.RCIMIWMentionedInfo = RCIMIWMentionedInfo;
    exports.RCIMIWMessage = RCIMIWMessage;
    exports.RCIMIWMessagePushOptions = RCIMIWMessagePushOptions;
    exports.RCIMIWRecallNotificationMessage = RCIMIWRecallNotificationMessage;
    exports.RCIMIWReferenceMessage = RCIMIWReferenceMessage;
    exports.RCIMIWSearchConversationResult = RCIMIWSearchConversationResult;
    exports.RCIMIWSightMessage = RCIMIWSightMessage;
    exports.RCIMIWTextMessage = RCIMIWTextMessage;
    exports.RCIMIWTypingStatus = RCIMIWTypingStatus;
    exports.RCIMIWUltraGroupTypingStatusInfo = RCIMIWUltraGroupTypingStatusInfo;
    exports.RCIMIWUnknownMessage = RCIMIWUnknownMessage;
    exports.RCIMIWUserInfo = RCIMIWUserInfo;
    exports.RCIMIWVoiceMessage = RCIMIWVoiceMessage;
    exports.convertAndroidConfigW2F = convertAndroidConfigW2F;
    exports.convertBlockedMessageInfo = convertBlockedMessageInfo;
    exports.convertChatEntriesArr2Map = convertChatEntriesArr2Map;
    exports.convertChatEntriesMap2Arr = convertChatEntriesMap2Arr;
    exports.convertChatRoomEntryType = convertChatRoomEntryType;
    exports.convertConnStatus = convertConnStatus;
    exports.convertConversationLastMessage = convertConversationLastMessage;
    exports.convertConversationType = convertConversationType;
    exports.convertErrorCode = convertErrorCode;
    exports.convertIOSPushOptionsW2F = convertIOSPushOptionsW2F;
    exports.convertMap2Obj = convertMap2Obj;
    exports.convertMediaMessage = convertMediaMessage;
    exports.convertMemberActionType = convertMemberActionType;
    exports.convertMessage = convertMessage;
    exports.convertMessageBlockType = convertMessageBlockType;
    exports.convertMessageDirection = convertMessageDirection;
    exports.convertMessageType = convertMessageType;
    exports.convertObj2Map = convertObj2Map;
    exports.convertPushNotificationLevel = convertPushNotificationLevel;
    exports.convertReceivedStatus = convertReceivedStatus;
    exports.convertSendMessageOptions = convertSendMessageOptions;
    exports.convertSentStatus = convertSentStatus;
    exports.convertTimeOrder = convertTimeOrder;
    exports.convertTypingUser = convertTypingUser;
    exports.isArray = isArray;
    exports.isBoolean = isBoolean;
    exports.isMap = isMap;
    exports.isNumber = isNumber;
    exports.isObject = isObject;
    exports.isString = isString;

    Object.defineProperty(exports, '__esModule', { value: true });

}));
//# sourceMappingURL=WebIMWrapper-0.0.1-alpha.5.js.map
