//
//  RCIMIWReferenceInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 2025/3/7.
//

#import <Foundation/Foundation.h>

@class RCIMIWMessage;
@class RCReferenceInfo;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWReferenceInfo : NSObject

/// 被引用消息发送者 ID
@property (nonatomic, copy, nullable) NSString *senderId;

/// 被引用消息唯一 ID
@property (nonatomic, copy, nullable) NSString *messageUId;

/// 被引用消息体标识
@property (nonatomic, copy, nullable) NSString *objectName;

/// 被引用消息内容
@property (nonatomic, strong, nullable) RCIMIWMessage *content;

- (instancetype)initWithRCReferenceInfo:(RCReferenceInfo *)info;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END
