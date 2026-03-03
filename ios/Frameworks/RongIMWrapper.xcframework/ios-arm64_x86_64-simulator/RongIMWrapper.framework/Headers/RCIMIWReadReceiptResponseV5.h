//
//  RCIMIWReadReceiptResponseV5.h
//  RongIMWrapper
//
//  Created by RongCloud on 2026/2/3.
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCIMIWDefines.h"

@class RCIMIWReadReceiptUser;

NS_ASSUME_NONNULL_BEGIN

/// 消息已读回执响应信息 V5，用于监听器回调
@interface RCIMIWReadReceiptResponseV5 : NSObject

/// 会话类型
@property (nonatomic, assign, readonly) RCIMIWConversationType conversationType;

/// 会话目标 ID
@property (nonatomic, copy, readonly) NSString *targetId;

/// 频道 ID
@property (nonatomic, copy, readonly, nullable) NSString *channelId;

/// 消息唯一 ID
@property (nonatomic, copy, readonly) NSString *messageUId;

/// 已读回执的用户列表
@property (nonatomic, strong, readonly, nullable) NSArray<RCIMIWReadReceiptUser *> *users;

/// 已读人数
@property (nonatomic, assign, readonly) NSInteger readCount;

/// 未读人数
@property (nonatomic, assign, readonly) NSInteger unreadCount;

/// 总人数
@property (nonatomic, assign, readonly) NSInteger totalCount;

@end

NS_ASSUME_NONNULL_END
