//
//  RCIMIWTypingStatus.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/3/22.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWTypingStatus : NSObject

/*!
 当前正在输入的用户 ID
 */
@property (nonatomic, copy, readonly) NSString *userId;

/*!
 当前正在输入的消息类型名
 */
@property (nonatomic, copy, readonly) NSString *contentType;

@property (nonatomic, assign, readonly) long long sentTime;

@end

NS_ASSUME_NONNULL_END
