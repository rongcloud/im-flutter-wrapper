//
//  RCIMIWSearchConversationResult.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/17/22.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCIMIWConversation;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWSearchConversationResult : NSObject

/*!
 匹配的会话对象
 */
@property (nonatomic, strong, readonly) RCIMIWConversation *conversation;

/*
 会话匹配的消息条数
 */
@property (nonatomic, assign, readonly) int count;

@end

NS_ASSUME_NONNULL_END
