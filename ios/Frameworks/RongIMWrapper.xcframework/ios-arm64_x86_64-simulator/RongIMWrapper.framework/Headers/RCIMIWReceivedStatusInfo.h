//
//  RCIMIWReceivedStatusInfo.h
//  RongIMWrapper
//
//  Created by zxz on 2024/11/5.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWReceivedStatusInfo : NSObject

/// 是否已读
@property (nonatomic, assign) BOOL read;

/// 是否已听，仅用于语音消息
@property (nonatomic, assign) BOOL listened;

/// 是否已下载
@property (nonatomic, assign) BOOL downloaded;

/// 该消息已被同时在线或之前登录的其他设备接收。
/// 只要任何其他设备先收到该消息，当前设备该状态值就会为 YES。
@property (nonatomic, assign) BOOL retrieved;

@end

NS_ASSUME_NONNULL_END
