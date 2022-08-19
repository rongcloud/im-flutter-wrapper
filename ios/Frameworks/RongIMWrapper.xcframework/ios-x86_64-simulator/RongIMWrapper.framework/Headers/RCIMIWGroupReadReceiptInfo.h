//
//  RCIMIWGroupReadReceiptInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 4/7/22.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWGroupReadReceiptInfo : NSObject

/*!
 是否需要回执消息
 */
@property (nonatomic, assign, readonly) BOOL readReceiptMessage;

/**
 是否已经发送回执
 */
@property (nonatomic, assign, readonly) BOOL hasRespond;

/*!
 发送回执的用户 ID 列表
 */
@property (nonatomic, strong, readonly) NSDictionary<NSString *, NSNumber *> *respondUserIds;

@end

NS_ASSUME_NONNULL_END
