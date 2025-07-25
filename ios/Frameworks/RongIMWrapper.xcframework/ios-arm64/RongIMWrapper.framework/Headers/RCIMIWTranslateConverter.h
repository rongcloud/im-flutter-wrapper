//
//  RCIMIWTranslateConverter.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/01/01.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWTranslateMessagesParams.h>
#import <RongIMWrapper/RCIMIWTranslateTextParams.h>
#import <RongIMWrapper/RCIMIWTranslateItem.h>
#import <RongIMWrapper/RCIMIWTranslateStrategy.h>
#import <RongIMWrapper/RCIMIWTranslateInfo.h>
#import <RongIMWrapper/RCIMIWTranslateResultType.h>
#import <RongIMLibCore/RCTranslateResult.h>
#import <RongIMLibCore/RCStatusDefine.h>

// Forward declarations for Native SDK types
@class RCTranslateItem;

NS_ASSUME_NONNULL_BEGIN

/// 翻译转换器类
///
/// - Since: 5.24.0
@interface RCIMIWTranslateConverter : NSObject

/// 转换翻译消息参数为字典
/// - Parameter params: 翻译消息参数
/// - Returns: 转换后的字典
+ (NSDictionary *)convertTranslateMessagesParams:(RCIMIWTranslateMessagesParams *)params;

/// 从字典转换翻译消息参数
/// - Parameter map: 字典数据
/// - Returns: 转换后的翻译消息参数
+ (RCIMIWTranslateMessagesParams *)convertTranslateMessagesParamsFromMap:(NSDictionary *)map;

/// 转换翻译文本参数为字典
/// - Parameter params: 翻译文本参数
/// - Returns: 转换后的字典
+ (NSDictionary *)convertTranslateTextParams:(RCIMIWTranslateTextParams *)params;

/// 从字典转换翻译文本参数
/// - Parameter map: 字典数据
/// - Returns: 转换后的翻译文本参数
+ (RCIMIWTranslateTextParams *)convertTranslateTextParamsFromMap:(NSDictionary *)map;

/// 转换翻译项列表为字典数组
/// - Parameter items: 翻译项列表
/// - Returns: 转换后的字典数组
+ (NSArray<NSDictionary *> *)convertTranslateItemList:(NSArray<RCIMIWTranslateItem *> *)items;

/// 从字典数组转换翻译项列表
/// - Parameter maps: 字典数组
/// - Returns: 转换后的翻译项列表
+ (NSArray<RCIMIWTranslateItem *> *)convertTranslateItemListFromMaps:(NSArray<NSDictionary *> *)maps;

/// 转换翻译信息为字典
/// - Parameter info: 翻译信息
/// - Returns: 转换后的字典
+ (NSDictionary *)convertTranslateInfo:(RCIMIWTranslateInfo *)info;

/// 从字典转换翻译信息
/// - Parameter map: 字典数据
/// - Returns: 转换后的翻译信息
+ (RCIMIWTranslateInfo *)convertTranslateInfoFromMap:(NSDictionary *)map;

/// 转换翻译项为字典
/// - Parameter item: 翻译项
/// - Returns: 转换后的字典
+ (NSDictionary *)convertTranslateItem:(RCIMIWTranslateItem *)item;

/// 从字典转换翻译项
/// - Parameter map: 字典数据
/// - Returns: 转换后的翻译项
+ (RCIMIWTranslateItem *)convertTranslateItemFromMap:(NSDictionary *)map;

/// 转换翻译策略枚举值
/// - Parameter value: 整数值
/// - Returns: 翻译策略枚举
+ (RCIMIWTranslateStrategy)convertTranslateStrategyFromValue:(NSInteger)value;

/// 转换翻译策略为整数值
/// - Parameter strategy: 翻译策略枚举
/// - Returns: 整数值
+ (NSInteger)convertTranslateStrategyToValue:(RCIMIWTranslateStrategy)strategy;

/// 转换翻译结果类型枚举值
/// - Parameter value: 整数值
/// - Returns: 翻译结果类型枚举
+ (RCIMIWTranslateResultType)convertTranslateResultTypeFromValue:(NSInteger)value;

/// 转换翻译结果类型为整数值
/// - Parameter resultType: 翻译结果类型枚举
/// - Returns: 整数值
+ (NSInteger)convertTranslateResultTypeToValue:(RCIMIWTranslateResultType)resultType;

/// 转换翻译状态枚举值
/// - Parameter value: 整数值
/// - Returns: 翻译状态枚举
+ (RCIMIWTranslateStatus)convertTranslateStatusFromValue:(NSInteger)value;

/// 转换翻译状态为整数值
/// - Parameter status: 翻译状态枚举
/// - Returns: 整数值
+ (NSInteger)convertTranslateStatusToValue:(RCIMIWTranslateStatus)status;

/// 转换翻译模式枚举值
/// - Parameter value: 整数值
/// - Returns: 翻译模式枚举
+ (RCIMIWTranslateMode)convertTranslateModeFromValue:(NSInteger)value;

/// 转换翻译模式为整数值
/// - Parameter mode: 翻译模式枚举
/// - Returns: 整数值
+ (NSInteger)convertTranslateModeToValue:(RCIMIWTranslateMode)mode;

/// 从Native SDK的RCTranslateItem转换为RCIMIWTranslateItem
/// - Parameter item: Native SDK的翻译项
/// - Returns: Wrapper的翻译项
+ (RCIMIWTranslateItem *)convertTranslateItemFromNative:(RCTranslateItem *)item;

/// 转换Native SDK的翻译状态到Wrapper的翻译状态
/// - Parameter status: Native SDK的翻译状态
/// - Returns: Wrapper的翻译状态
+ (RCIMIWTranslateStatus)convertTranslateStatusFromNative:(RCTranslateStatus)status;

/// 转换Native SDK的翻译模式到Wrapper的翻译模式
/// - Parameter mode: Native SDK的翻译模式
/// - Returns: Wrapper的翻译模式
+ (RCIMIWTranslateMode)convertTranslateModeFromNative:(RCTranslateMode)mode;

/// 转换Wrapper的翻译模式到Native SDK的翻译模式
/// - Parameter mode: Wrapper的翻译模式
/// - Returns: Native SDK的翻译模式
+ (RCTranslateMode)convertTranslateModeToNative:(RCIMIWTranslateMode)mode;

/// 转换Wrapper的翻译策略到Native SDK的翻译策略
/// - Parameter strategy: Wrapper的翻译策略
/// - Returns: Native SDK的翻译策略
+ (RCTranslateStrategy)convertTranslateStrategyToNative:(RCIMIWTranslateStrategy)strategy;

/// 转换Native SDK的翻译策略到Wrapper的翻译策略
/// - Parameter strategy: Native SDK的翻译策略
/// - Returns: Wrapper的翻译策略
+ (RCIMIWTranslateStrategy)convertTranslateStrategyFromNative:(RCTranslateStrategy)strategy;

@end

NS_ASSUME_NONNULL_END 