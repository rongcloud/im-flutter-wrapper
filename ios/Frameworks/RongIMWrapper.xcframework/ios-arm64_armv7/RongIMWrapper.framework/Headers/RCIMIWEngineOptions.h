//
//  RCIMIWEngineOptions.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/15/22.
//

#import <Foundation/Foundation.h>

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

/*!
 是否踢出重连设备
 */
@property (nonatomic, assign) BOOL kickReconnectDevice;

@property (nonatomic, strong) RCIMIWCompressOptions *compressOptions;

@end

NS_ASSUME_NONNULL_END
