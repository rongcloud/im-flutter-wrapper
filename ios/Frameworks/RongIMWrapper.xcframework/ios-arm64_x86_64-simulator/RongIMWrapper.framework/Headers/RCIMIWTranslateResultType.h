//
//  RCIMIWTranslateResultType.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译结果类型枚举
///
/// - Since: 5.24.0
typedef NS_ENUM(NSInteger, RCIMIWTranslateResultType) {
    /// 消息翻译
    RCIMIWTranslateResultTypeMessage = 0,
    /// 自定义文本翻译
    RCIMIWTranslateResultTypeCustomText = 1,
};

NS_ASSUME_NONNULL_END