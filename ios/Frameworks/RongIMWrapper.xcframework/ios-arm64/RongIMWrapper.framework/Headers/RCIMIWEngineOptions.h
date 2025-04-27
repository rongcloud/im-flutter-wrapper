//
//  RCIMIWEngineOptions.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/15/22.
//

#import <Foundation/Foundation.h>
#import "RCIMIWDefines.h"

@class RCIMIWCompressOptions;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWEngineOptions : NSObject

/*!
 导航服务器地址
 */
@property (nonatomic, copy) NSString *naviServer;

/*!
 文件服务器地址
 */
@property (nonatomic, copy) NSString *fileServer;

/*!
 统计服务器地址
 */
@property (nonatomic, copy) NSString *statisticServer;

/// 区域码
///
/// 默认为北京数据中心，用户可以根据实际情况设置区域码，设置之后，SDK 将会使用特定区域的服务地址
/// 每个数据中心都会有对应的 naviServer 、statisticServer 、logServer
/// 如果开发者手动设置了本类的 naviServer 、statisticServer 、logServer 将会覆盖对应区域的配置
/// 例如：设置 areaCode 为北美数据中心，同时又设置了此处的 naviServer ，那么最终会使用此处的 naviServer 而不是北美数据中心的 naviServer
@property (nonatomic, assign) RCIMIWAreaCode areaCode;

/*!
 是否踢出重连设备
 */
@property (nonatomic, assign) BOOL kickReconnectDevice;

@property (nonatomic, strong) RCIMIWCompressOptions *compressOptions;

@property (nonatomic, assign) RCIMIWLogLevel logLevel;

@end

NS_ASSUME_NONNULL_END
