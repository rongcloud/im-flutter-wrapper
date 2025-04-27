//
//  RCIMIWNativeCustomMessage.h
//  RongIMWrapper
//
//  Created by Lang on 2024/5/30.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWNativeCustomMessage : RCIMIWMessage

/// 自定义消息的 json 内容
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *fields;

/// 消息搜索关键字
@property (nonatomic, copy) NSArray<NSString *> *searchableWords;

/// 消息类型名
@property (nonatomic, copy, readonly) NSString *messageIdentifier;

@end

NS_ASSUME_NONNULL_END
