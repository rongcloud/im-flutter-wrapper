//
//  RCIMIWMessageIdentifier.h
//  RongIMWrapper
//
//  Created by RongCloud on 2026/2/9.
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCIMIWDefines.h"

NS_ASSUME_NONNULL_BEGIN

/// 消息标识
@interface RCIMIWMessageIdentifier : NSObject

/// 初始化
- (instancetype)init;

/// 会话类型
@property (nonatomic, assign) RCIMIWConversationType conversationType;

/// 会话目标 ID
@property (nonatomic, copy) NSString *targetId;

/// 频道 ID
@property (nonatomic, copy, nullable) NSString *channelId;

/// 消息唯一 ID
@property (nonatomic, copy) NSString *messageUId;

@end

NS_ASSUME_NONNULL_END
