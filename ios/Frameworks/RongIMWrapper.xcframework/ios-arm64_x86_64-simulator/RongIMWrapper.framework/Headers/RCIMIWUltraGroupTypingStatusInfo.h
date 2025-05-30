//
//  RCIMIWUltraGroupTypingStatusInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/21/22.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWUltraGroupTypingStatusInfo : NSObject

/*!
 会话 ID
 */
@property (nonatomic, copy, readonly) NSString *targetId;

/*!
 所属会话的业务标识
 */
@property (nonatomic, copy, readonly) NSString *channelId;

/*!
 用户id
 */
@property (nonatomic, copy, readonly) NSString *userId;

/*!
 用户数
 */
@property (nonatomic, assign, readonly) NSInteger userNums;

/*!
 输入状态
 */
@property (nonatomic, assign, readonly) RCIMIWUltraGroupTypingStatus status;

/*!
 服务端收到用户操作的上行时间.
 */
@property (nonatomic, assign, readonly) long long timestamp;

@end

NS_ASSUME_NONNULL_END
