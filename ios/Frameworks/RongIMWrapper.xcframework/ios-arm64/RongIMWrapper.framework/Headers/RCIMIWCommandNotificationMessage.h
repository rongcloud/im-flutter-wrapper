//
//  RCIMIWCommandNotificationMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/9/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 命令提醒消息类

 @discussion 命令消息类，此消息会进行存储，但不计入未读消息数。
 与 RCIMIWCommandMessage 的区别是，此消息会进行存储并在界面上显示。
 
 @remarks 通知类消息
 */
@interface RCIMIWCommandNotificationMessage : RCIMIWMessage

/*!
 命令提醒的名称
 */
@property (nonatomic, copy, readonly) NSString *name;

/*!
 命令提醒消息的扩展数据

 @discussion 命令提醒消息的扩展数据，可以为任意字符串，如存放您定义的 json 数据。
 */
@property (nonatomic, copy, readonly) NSString *data;

@end

NS_ASSUME_NONNULL_END
