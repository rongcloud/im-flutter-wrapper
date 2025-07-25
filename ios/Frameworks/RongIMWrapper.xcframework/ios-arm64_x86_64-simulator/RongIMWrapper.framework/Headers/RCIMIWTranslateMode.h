//
//  RCIMIWTranslateMode.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译服务类型枚举
///
/// - Since: 5.24.0
typedef NS_ENUM(NSInteger, RCIMIWTranslateMode) {
    /// 机械翻译
    RCIMIWTranslateModeMechanical = 0,
    /// 智能翻译
    RCIMIWTranslateModeIntelligent = 1,
};

NS_ASSUME_NONNULL_END 