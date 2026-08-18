//
//  RCIMIWConversationsContainingRobotsOption.h
//  RongIMWrapper
//
//  Copyright © 2026 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 获取包含机器人的会话列表参数
@interface RCIMIWConversationsContainingRobotsOption : NSObject

/// 时间戳，单位毫秒，默认值为 0，表示从最新的会话开始获取
@property (nonatomic, assign) long long timestamp;

/// 会话类型列表，RCIMIWConversationType 转换 NSNumber 的集合，目前仅支持单聊会话、系统会话
@property (nonatomic, copy) NSArray<NSNumber *> *conversationTypes;

/// 获取数量，有效范围 [1, 100]
@property (nonatomic, assign) NSInteger count;

/// 是否置顶优先，默认值为 NO
@property (nonatomic, assign) BOOL topPriority;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
