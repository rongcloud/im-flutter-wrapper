//
//  RCIMIWSubscribeEventConverter.h
//  RongIMWrapper
//
//  Created by RongCloud on 2025/8/1.
//

#import <Foundation/Foundation.h>
#import "RCIMIWPlatform.h"

NS_ASSUME_NONNULL_BEGIN

// Forward declaration for RCPlatform enum
typedef NS_ENUM(NSUInteger, RCPlatform);

@class RCSubscribeEvent, RCSubscribeInfoEvent, RCSubscribeEventDetail;
@class RCIMIWSubscribeEvent, RCIMIWSubscribeInfoEvent, RCIMIWSubscribeEventDetail;

@interface RCIMIWSubscribeEventConverter : NSObject

+ (nullable RCIMIWSubscribeEvent *)convertFromNativeSubscribeEvent:(nullable RCSubscribeEvent *)nativeEvent;

+ (nullable RCSubscribeEvent *)convertToNativeSubscribeEvent:(nullable RCIMIWSubscribeEvent *)wrapperEvent;

+ (nullable NSArray<RCIMIWSubscribeEvent *> *)convertFromNativeSubscribeEvents:(nullable NSArray<RCSubscribeEvent *> *)nativeEvents;

+ (nullable RCIMIWSubscribeInfoEvent *)convertFromNativeSubscribeInfoEvent:(nullable RCSubscribeInfoEvent *)nativeInfoEvent;

+ (nullable NSArray<RCIMIWSubscribeInfoEvent *> *)convertFromNativeSubscribeInfoEvents:(nullable NSArray<RCSubscribeInfoEvent *> *)nativeInfoEvents;

+ (nullable RCIMIWSubscribeEventDetail *)convertFromNativeSubscribeEventDetail:(nullable RCSubscribeEventDetail *)nativeDetail;

+ (nullable NSArray<RCIMIWSubscribeEventDetail *> *)convertFromNativeSubscribeEventDetails:(nullable NSArray<RCSubscribeEventDetail *> *)nativeDetails;

+ (RCIMIWPlatform)convertPlatformFromNative:(NSUInteger)nativePlatform;

@end

NS_ASSUME_NONNULL_END