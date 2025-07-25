//
//  RCIMIWTranslateStatus.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译状态枚举
///
/// - Since: 5.24.0
typedef NS_ENUM(NSInteger, RCIMIWTranslateStatus) {
    /// 无状态
    RCIMIWTranslateStatusNone = 0,
    /// 翻译中
    RCIMIWTranslateStatusTranslating = 1,
    /// 翻译成功
    RCIMIWTranslateStatusSuccess = 2,
    /// 翻译失败
    RCIMIWTranslateStatusFailed = 3,
};

NS_ASSUME_NONNULL_END 