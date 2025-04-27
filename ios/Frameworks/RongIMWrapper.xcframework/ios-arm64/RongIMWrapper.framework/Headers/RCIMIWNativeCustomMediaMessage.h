//
//  RCIMIWNativeCustomMediaMessage.h
//  RongIMWrapper
//
//  Created by Lang on 2024/6/3.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWNativeCustomMediaMessage : RCIMIWMediaMessage

/// 自定义消息的内容
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *fields;

/// 消息搜索关键字
@property (nonatomic, copy) NSArray<NSString *> *searchableWords;

/// 消息类型名
@property (nonatomic, copy, readonly) NSString *messageIdentifier;

@end

NS_ASSUME_NONNULL_END
