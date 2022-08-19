//
//  RCIMIWBlockedMessageInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/20/22.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWBlockedMessageInfo : NSObject

/**
 *  会话类型
 */
@property (nonatomic, assign, readonly) RCIMIWConversationType conversationType;

/**
 *  会话 ID
 */
@property (nonatomic, copy, readonly) NSString *targetId;

/**
 *  被拦截的消息 ID
 */
@property (nonatomic, copy, readonly) NSString *blockedMsgUId;

/**
 *  拦截原因
 *  1,全局敏感词：命中了融云内置的全局敏感词
 *  2,自定义敏感词拦截：命中了客户在融云自定义的敏感词
 *  3,第三方审核拦截：命中了第三方（数美）或模板路由决定不下发的状态
 */
@property (nonatomic, assign, readonly) RCIMIWMessageBlockType blockType;

/**
 *  附加信息
 */
@property (nonatomic, copy, readonly) NSString *extra;

@end

NS_ASSUME_NONNULL_END
