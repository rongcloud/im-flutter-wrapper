//
//  RCIMIWGroupMessageReaderV2.h
//  RongIMWrapper
//
//  Created by zxz on 2024/11/7.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWGroupMessageReaderV2 : NSObject

/// 已读用户 id
@property (nonatomic, copy) NSString *userId;

/// 已读时间
@property (nonatomic, assign) long long readTime;


@end


NS_ASSUME_NONNULL_END
