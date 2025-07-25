//
//  RCIMIWTranslateStrategy.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译策略枚举
///
/// - Since: 5.24.0
typedef NS_ENUM(NSInteger, RCIMIWTranslateStrategy) {
    /// 跟随用户级配置
    RCIMIWTranslateStrategyDefaultFollowUser = 0,
    /// 开启自动翻译
    RCIMIWTranslateStrategyAutoOn = 1,
    /// 关闭自动翻译
    RCIMIWTranslateStrategyAutoOff = 2,
};

NS_ASSUME_NONNULL_END 