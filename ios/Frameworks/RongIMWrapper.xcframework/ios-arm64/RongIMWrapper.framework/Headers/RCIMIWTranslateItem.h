//
//  RCIMIWTranslateItem.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWTranslateInfo.h>
#import <RongIMWrapper/RCIMIWTranslateResultType.h>

NS_ASSUME_NONNULL_BEGIN

/// 翻译项对象
///
/// - Since: 5.24.0
@interface RCIMIWTranslateItem : NSObject

/// 翻译项唯一标识符
@property (nonatomic, copy) NSString *identifier;

/// 翻译信息
@property (nonatomic, strong) RCIMIWTranslateInfo *translateInfo;

/// 错误码
@property (nonatomic, assign) NSInteger errorCode;

/// 翻译结果类型
@property (nonatomic, assign) RCIMIWTranslateResultType resultType;

@end

NS_ASSUME_NONNULL_END 