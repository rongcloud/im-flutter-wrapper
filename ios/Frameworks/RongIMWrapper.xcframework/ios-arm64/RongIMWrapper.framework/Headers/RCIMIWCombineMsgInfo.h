//
//  RCIMIWCombineMsgInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 11/24/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWCombineMsgInfo : NSObject

/*!
 消息发送者 ID
 */
@property (nonatomic, copy) NSString *fromUserId;

/*!
 会话目标 ID
 */
@property (nonatomic, copy) NSString *targetId;

/*!
 消息时间戳
 */
@property (nonatomic, assign) long long timestamp;

/*!
 消息类型标识符
 */
@property (nonatomic, copy) NSString *objectName;

/*!
 消息内容
 */
@property (nonatomic, strong) NSDictionary *content;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END

