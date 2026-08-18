#import <RongIMWrapper/RCIMIWMessage.h>

/// 小灰条信息通知消息。
/// Information notification message displayed as a system tip.
@interface RCIMIWInformationNotificationMessage : RCIMIWMessage

/// 小灰条通知内容。
/// Information notification content.
@property (nonatomic, copy) NSString *message;

@end
