//
//  RCIMIWReferenceMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/8/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWReferenceMessage : RCIMIWMessage

/*!
 文本
 */
@property (nonatomic, strong, readonly) NSString *text;

/*!
 被引用消息体
 */
@property (nonatomic, strong, readonly) RCIMIWMessage *referenceMessage;

@end

NS_ASSUME_NONNULL_END
