//
//  RCIMIWLocationMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 8/15/22.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWLocationMessage : RCIMIWMessage

/**
 经度
 */
@property(nonatomic, assign) double longitude;

/**
 纬度
 */
@property(nonatomic, assign) double latitude;

/**
 兴趣点名称
 */
@property(nonatomic, copy) NSString *poiName;

/*!
 地理位置的缩略图
 */
@property (nonatomic, copy) NSString *thumbnailPath;

@end

NS_ASSUME_NONNULL_END
