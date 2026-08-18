//
//  RCIMIWUnknownMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/9/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWUnknownMessage : RCIMIWMessage

/// 原始消息体数据，使用 UTF-8 解码。
/// Raw message payload decoded with UTF-8.
@property (nonatomic, copy, readonly, nullable) NSString *rawData;

/// 原始消息类型标识。
/// Original message type identifier.
@property (nonatomic, copy, readonly, nullable) NSString *objectName;

@end

NS_ASSUME_NONNULL_END
