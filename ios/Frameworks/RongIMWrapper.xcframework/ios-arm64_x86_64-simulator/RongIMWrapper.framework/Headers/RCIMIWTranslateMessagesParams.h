//
//  RCIMIWTranslateMessagesParams.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWTranslateMode.h>
#import <RongIMWrapper/RCIMIWTranslateMessageParam.h>

NS_ASSUME_NONNULL_BEGIN

/// 批量翻译消息参数对象
///
/// - Since: 5.24.0
@interface RCIMIWTranslateMessagesParams : NSObject

/// 是否强制重新翻译
@property (nonatomic, assign) BOOL force;

/// 翻译服务类型
@property (nonatomic, assign) RCIMIWTranslateMode mode;

/// 翻译消息参数列表
@property (nonatomic, strong) NSArray<RCIMIWTranslateMessageParam *> *list;

@end

NS_ASSUME_NONNULL_END 