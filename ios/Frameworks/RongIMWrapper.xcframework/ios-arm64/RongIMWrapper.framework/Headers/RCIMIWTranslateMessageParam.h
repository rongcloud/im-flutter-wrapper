//
//  RCIMIWTranslateMessageParam.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译消息参数对象
///
/// - Since: 5.24.0
@interface RCIMIWTranslateMessageParam : NSObject

/// 消息唯一 ID
@property (nonatomic, copy) NSString *messageUId;

/// 源语言
@property (nonatomic, copy) NSString *sourceLanguage;

/// 目标语言
@property (nonatomic, copy) NSString *targetLanguage;

@end

NS_ASSUME_NONNULL_END 