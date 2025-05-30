//
//  RCIMIWRecallNotificationMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/9/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 撤回通知消息类
 @discussion 撤回通知消息，此消息会进行本地存储，但不计入未读消息数。
 
 @remarks 通知类消息
 */
@interface RCIMIWRecallNotificationMessage : RCIMIWMessage

/*!
 是否是管理员操作
 */
@property (nonatomic, assign, readonly) BOOL admin;

/*!
 是否删除
 */
@property (nonatomic, assign, readonly) BOOL deleted;

/*!
 撤回的时间（毫秒）
 */
@property (nonatomic, assign, readonly) long long recallTime;

/*!
 撤回动作的时间（毫秒）
*/
@property (nonatomic, assign, readonly) long long recallActionTime;

/// 发起撤回操作的用户 ID
@property (nonatomic, copy) NSString *operatorId;

/*!
 被撤回的原消息
*/
@property (nonatomic, strong, readonly) RCIMIWMessage *originalMessage;

@end

NS_ASSUME_NONNULL_END
