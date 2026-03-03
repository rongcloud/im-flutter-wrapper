//
//  RCIMIWReadReceiptUsersOption.h
//  RongIMWrapper
//
//  Created by RongCloud on 2026/2/3.
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCIMIWDefines.h"

NS_ASSUME_NONNULL_BEGIN

/// 分页获取消息已读用户列表的查询条件
@interface RCIMIWReadReceiptUsersOption : NSObject

/// 初始化，默认 order 为 Descending，readStatus 为 Read
- (instancetype)init;

/// 分页标识，首次查询可为空
@property (nonatomic, copy, nullable) NSString *pageToken;

/// 分页数量，范围 [1, 100]
@property (nonatomic, assign) NSInteger pageCount;

/// 排序类型
@property (nonatomic, assign) RCIMIWReadReceiptOrder order;

/// 已读状态过滤
@property (nonatomic, assign) RCIMIWReadReceiptStatus readStatus;

@end

NS_ASSUME_NONNULL_END
