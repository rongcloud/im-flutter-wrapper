//
//  RCIMIWReadReceiptUsersResult.h
//  RongIMWrapper
//
//  Created by RongCloud on 2026/2/3.
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCIMIWReadReceiptUser;

NS_ASSUME_NONNULL_BEGIN

/// 分页获取消息已读用户列表的结果
@interface RCIMIWReadReceiptUsersResult : NSObject

/// 下一页分页标识，为空表示没有更多数据
@property (nonatomic, copy, readonly, nullable) NSString *pageToken;

/// 总人数
@property (nonatomic, assign, readonly) NSInteger totalCount;

/// 用户列表
@property (nonatomic, strong, readonly, nullable) NSArray<RCIMIWReadReceiptUser *> *users;

@end

NS_ASSUME_NONNULL_END
