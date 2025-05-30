//
//  RCIMIWReadReceiptInfoV4.h
//  RongIMWrapper
//
//  Created by zxz on 2024/11/7.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RCIMIWGroupMessageReaderV2;

@interface RCIMIWReadReceiptInfoV4 : NSObject

/// 是否已经发送回执
@property (nonatomic, assign) BOOL hasRespond;

/// 发送回执的用户 ID 列表
@property (nonatomic, strong, nullable) NSArray <RCIMIWGroupMessageReaderV2 *> *readerList;

/// 已读人数
@property (nonatomic, assign) int readCount;

/// 群内总人数
@property (nonatomic, assign) int totalCount;

//- (NSDictionary *)toDict;

@end

@interface RCIMIWGroupReadReceiptInfoV2 : RCIMIWReadReceiptInfoV4

@end

NS_ASSUME_NONNULL_END
