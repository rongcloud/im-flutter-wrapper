//
//  RCIMIWTranslateInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWTranslateStatus.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译信息对象
///
/// - Since: 5.24.0
@interface RCIMIWTranslateInfo : NSObject

/// 翻译文本内容
@property (nonatomic, copy) NSString *translatedText;

/// 目标语言
@property (nonatomic, copy) NSString *targetLanguage;

/// 翻译状态
@property (nonatomic, assign) RCIMIWTranslateStatus status;

@end

NS_ASSUME_NONNULL_END 
