//
//  RCIMIWReadReceiptInfoV5.h
//  RongIMWrapper
//
//  Created by RongCloud on 2026/2/3.
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 消息已读回执信息 V5
@interface RCIMIWReadReceiptInfoV5 : NSObject

/// 消息唯一 ID
@property (nonatomic, copy, readonly) NSString *messageUId;

/// 已读人数
@property (nonatomic, assign, readonly) NSInteger readCount;

/// 未读人数
@property (nonatomic, assign, readonly) NSInteger unreadCount;

/// 总人数
@property (nonatomic, assign, readonly) NSInteger totalCount;

@end

NS_ASSUME_NONNULL_END
