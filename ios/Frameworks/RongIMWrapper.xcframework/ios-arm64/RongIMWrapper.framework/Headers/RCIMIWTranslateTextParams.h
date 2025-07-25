//
//  RCIMIWTranslateTextParams.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWTranslateMode.h>
#import <RongIMWrapper/RCIMIWTranslateTextParam.h>

NS_ASSUME_NONNULL_BEGIN

/// 批量翻译文本参数对象
///
/// - Since: 5.24.0
@interface RCIMIWTranslateTextParams : NSObject

/// 翻译服务类型
@property (nonatomic, assign) RCIMIWTranslateMode mode;

/// 翻译文本参数列表
@property (nonatomic, strong) NSArray<RCIMIWTranslateTextParam *> *list;

@end

NS_ASSUME_NONNULL_END 