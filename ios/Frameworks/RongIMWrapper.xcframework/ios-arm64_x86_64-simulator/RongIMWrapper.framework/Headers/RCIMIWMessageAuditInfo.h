//
//  RCIMIWMessageAuditInfo.h
//  RongIMWrapper
//
//  Created by Lang on 2024/11/21.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCIMIWDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWMessageAuditInfo : NSObject

/// 是否送审 （消息回调是否送给三方审核）
@property (nonatomic, assign) RCIMIWMessageAuditType auditType;

/// 项目标识
@property (nonatomic, copy) NSString *project;

/// 审核策略
@property (nonatomic, copy) NSString *strategy;

@end

NS_ASSUME_NONNULL_END
