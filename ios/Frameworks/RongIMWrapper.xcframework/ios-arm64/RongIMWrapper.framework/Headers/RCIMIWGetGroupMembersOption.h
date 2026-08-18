//
//  RCIMIWGetGroupMembersOption.h
//  RongIMWrapper
//
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWPagingQueryOption.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

/// 分页获取群成员的查询选项，支持按机器人标识过滤
@interface RCIMIWGetGroupMembersOption : RCIMIWPagingQueryOption

/// 按机器人标识过滤的类型，默认为 RCIMIWFilterRobotTypeAll（获取所有成员）
@property (nonatomic, assign) RCIMIWFilterRobotType filterRobotType;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
