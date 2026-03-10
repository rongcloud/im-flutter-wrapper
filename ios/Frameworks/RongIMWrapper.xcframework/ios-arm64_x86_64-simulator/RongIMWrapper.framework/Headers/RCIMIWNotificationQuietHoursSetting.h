//
//  RCIMIWNotificationQuietHoursSetting.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>
#import "RCIMIWDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWNotificationQuietHoursSetting : NSObject

/// 开始消息免打扰时间，格式为 HH:MM:SS
@property (nonatomic, copy) NSString *startTime;

/// 需要消息免打扰分钟数，0 < spanMinutes < 1440
@property (nonatomic, assign) int spanMinutes;

/// 消息免打扰级别
@property (nonatomic, assign) RCIMIWPushNotificationQuietHoursLevel level;

/// 时区，如 Asia/Shanghai
@property (nonatomic, copy, nullable) NSString *timeZone;

@end

NS_ASSUME_NONNULL_END
