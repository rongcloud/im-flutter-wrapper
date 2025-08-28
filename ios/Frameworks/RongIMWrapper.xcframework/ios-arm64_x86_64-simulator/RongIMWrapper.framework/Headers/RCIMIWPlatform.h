//
//  RCIMIWPlatform.h
//  RongIMWrapper
//
//  Created by Auto Generated on 2025/08/05.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 在线平台枚举
 * 
 * @since 5.8.1
 */
typedef NS_ENUM(NSInteger, RCIMIWPlatform) {
    /**
     * 其它平台
     */
    RCIMIWPlatformOther = 0,
    
    /**
     * iOS
     */
    RCIMIWPlatformIOS = 1,
    
    /**
     * Android
     */
    RCIMIWPlatformAndroid = 2,
    
    /**
     * Web
     */
    RCIMIWPlatformWeb = 3,
    
    /**
     * PC
     */
    RCIMIWPlatformPC = 4,
    
    /**
     * 小程序
     */
    RCIMIWPlatformMiniWeb = 5,
    
    /**
     * 鸿蒙
     */
    RCIMIWPlatformHarmonyOS = 6
};

NS_ASSUME_NONNULL_END