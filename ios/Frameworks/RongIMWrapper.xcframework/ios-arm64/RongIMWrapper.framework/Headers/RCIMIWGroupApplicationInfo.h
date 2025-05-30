//
//  RCIMIWGroupApplicationInfo.h
//  RongIMWrapper
//
//  Created by Lang on 2024/11/27.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <RongIMWrapper/RCIMIWDefines.h>
#import <RongIMWrapper/RCIMIWGroupMemberInfo.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWGroupApplicationInfo : NSObject

/// 群组ID
@property (nonatomic, copy) NSString *groupId;

/// 入群者信息
@property (nonatomic, strong) RCIMIWGroupMemberInfo *joinMemberInfo;

/// 邀请者信息
@property (nonatomic, strong, nullable) RCIMIWGroupMemberInfo *inviterInfo;

/// 操作人信息
@property (nonatomic, strong, nullable) RCIMIWGroupMemberInfo *operatorInfo;

/// 群申请状态
@property (nonatomic, assign) RCIMIWGroupApplicationStatus status;

/// 群申请方向
@property (nonatomic, assign) RCIMIWGroupApplicationDirection direction;

/// 群申请类型
@property (nonatomic, assign) RCIMIWGroupApplicationType type;

/// 操作时间
@property (nonatomic, assign) long long operationTime;

/// 原因
@property (nonatomic, copy, nullable) NSString *reason;

@end

NS_ASSUME_NONNULL_END
