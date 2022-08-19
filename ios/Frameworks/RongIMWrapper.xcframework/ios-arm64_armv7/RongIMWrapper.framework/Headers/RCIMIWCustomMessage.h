//
//  RCIMIWCustomMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/9/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWCustomMessage : RCIMIWMessage

@property (nonatomic, copy, readonly) NSString *identifier;

@property (nonatomic, assign, readonly) RCIMIWCustomMessagePolicy policy;

/*!
 消息字段
 */
@property (nonatomic, strong, readonly) NSDictionary<NSString*, NSString*> *fields;

@end

NS_ASSUME_NONNULL_END
