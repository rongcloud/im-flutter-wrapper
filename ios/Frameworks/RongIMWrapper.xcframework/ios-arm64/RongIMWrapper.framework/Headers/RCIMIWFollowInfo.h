//
//  RCIMIWFollowInfo.h
//  RongIMWrapper
//
//  Created by Lang on 2024/11/28.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWFollowInfo : NSObject

/// 用户 Id
@property (nonatomic, copy) NSString *userId;

/// 关注时间戳
/// 当前用户关注此用户的时间戳
@property (nonatomic, assign) long long time;

@end

NS_ASSUME_NONNULL_END
