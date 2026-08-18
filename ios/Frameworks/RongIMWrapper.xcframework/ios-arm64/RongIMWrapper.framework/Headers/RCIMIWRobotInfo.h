//
//  RCIMIWRobotInfo.h
//  RongIMWrapper
//
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 机器人信息
@interface RCIMIWRobotInfo : NSObject

/// 机器人 Id
@property (nonatomic, copy) NSString *robotId;

/// 机器人名称
@property (nonatomic, copy) NSString *name;

/// 机器人头像
@property (nonatomic, copy) NSString *portraitUri;

/// 机器人类型
@property (nonatomic, copy) NSString *robotType;

/// 机器人拓展数据
@property (nonatomic, copy, nullable) NSDictionary *metadata;

/// 创建时间
@property (nonatomic, assign) long long createTime;

/// 最后一次更新时间
@property (nonatomic, assign) long long updateTime;

@end

NS_ASSUME_NONNULL_END
