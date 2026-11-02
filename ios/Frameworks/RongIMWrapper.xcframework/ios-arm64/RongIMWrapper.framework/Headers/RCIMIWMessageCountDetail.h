#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// [ZH] 某个本地自然日内的消息数量。
/// [EN] Local message count for one calendar date.
@interface RCIMIWMessageCountDetail : NSObject

/// [ZH] 协议栈查询时系统时区对应日期零点的 Unix 毫秒时间戳。
/// [EN] Unix timestamp in milliseconds at the local start of this date in the protocol query time zone.
@property (nonatomic, assign) long long dateMs;

/// [ZH] 该日期内的本地消息数量。
/// [EN] Number of local messages for this date.
@property (nonatomic, assign) NSInteger messageCount;

@end

NS_ASSUME_NONNULL_END
