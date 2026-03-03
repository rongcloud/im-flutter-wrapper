//
//  RCIMIWReadReceiptUser.h
//  RongIMWrapper
//
//  Created by RongCloud on 2026/2/3.
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 已读回执用户信息
@interface RCIMIWReadReceiptUser : NSObject

/// 用户 ID
@property (nonatomic, copy, readonly) NSString *userId;

/// 该用户的阅读时间，0 表示用户没有发送已读回执
@property (nonatomic, assign, readonly) long long timestamp;

/// 是否被提醒的用户
@property (nonatomic, assign, readonly) BOOL isMentioned;

@end

NS_ASSUME_NONNULL_END
