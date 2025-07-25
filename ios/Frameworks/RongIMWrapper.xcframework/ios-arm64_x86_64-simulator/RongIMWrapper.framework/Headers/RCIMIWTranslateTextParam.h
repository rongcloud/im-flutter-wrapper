//
//  RCIMIWTranslateTextParam.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译文本参数对象
///
/// - Since: 5.24.0
@interface RCIMIWTranslateTextParam : NSObject

/// 待翻译文本内容
@property (nonatomic, copy) NSString *text;

/// 源语言
@property (nonatomic, copy) NSString *sourceLanguage;

/// 目标语言
@property (nonatomic, copy) NSString *targetLanguage;

@end

NS_ASSUME_NONNULL_END 