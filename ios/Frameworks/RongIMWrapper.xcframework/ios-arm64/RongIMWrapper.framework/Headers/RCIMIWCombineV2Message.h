//
//  RCIMIWCombineV2Message.h
//  RongIMWrapper
//
//  Created by RongCloud on 11/24/25.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>
#import <RongIMWrapper/RCIMIWDefines.h>
#import "RCIMIWCombineMsgInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWCombineV2Message : RCIMIWMediaMessage

/*!
 合并消息的会话类型(转发消息所属的会话类型)
 */
@property (nonatomic, assign, readonly) RCIMIWConversationType combineConversationType;

/*!
 摘要列表
 */
@property (nonatomic, strong, readonly) NSArray<NSString *> *summaryList;

/*!
 名称列表
 */
@property (nonatomic, strong, readonly) NSArray<NSString *> *nameList;

/*!
 消息数量
 */
@property (nonatomic, assign, readonly) NSInteger msgNum;

/*!
 消息列表
 */
@property (nonatomic, strong, readonly, nullable) NSArray<RCIMIWCombineMsgInfo *> *msgList;

/*!
 消息文件键值（当消息内容超过阈值时使用）
 */
@property (nonatomic, copy, readonly, nullable) NSString *jsonMsgKey;

@end

NS_ASSUME_NONNULL_END

