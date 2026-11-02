#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// [ZH] 按本地自然日查询会话消息数量的日期范围。
/// [EN] Date range for querying conversation message counts by local calendar date.
@interface RCIMIWMessageCountDetailOptions : NSObject

/// [ZH] 包含的开始时间，Unix 毫秒，允许为自然日内任意时刻。
/// [EN] Inclusive start time in Unix milliseconds; any time within a local day is accepted.
@property (nonatomic, assign) long long startTime;

/// [ZH] 不包含的结束时间，Unix 毫秒，必须大于 startTime。
/// [EN] Exclusive end time in Unix milliseconds; must be greater than startTime.
@property (nonatomic, assign) long long endTime;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
