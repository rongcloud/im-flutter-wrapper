//
//  RCIMIWReadReceiptInfo.h
//  RongIMWrapper
//
//  Created by zxz on 2024/11/7.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWReadReceiptInfo : NSObject

/// 是否需要回执消息
@property (nonatomic, assign) BOOL isReceiptRequestMessage;

/// 是否已经发送回执
@property (nonatomic, assign) BOOL hasRespond;

/// 发送回执的用户 ID 列表
@property (nonatomic, strong, nullable) NSMutableDictionary *userIdList;

@end

NS_ASSUME_NONNULL_END
