//
//  RCIMIWCompressOptions.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/21/22.
//  Copyright © 2022 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWCompressOptions : NSObject

/*!
 原图质量压缩比 0 ~ 100，内部需要除 100
 */
@property (nonatomic, assign) int originalImageQuality;
/*!
 原图最大尺寸 对应的 width height
 */
@property (nonatomic, assign) int originalImageSize;
// 原图最大限制，如果图片大小不超过此值，发送原图，超过则进行压缩
@property (nonatomic, assign) int originalImageMaxSize;

// 缩略图 0 ~ 1 
@property (nonatomic, assign) int thumbnailQuality;
@property (nonatomic, assign) int thumbnailMaxSize;
@property (nonatomic, assign) int thumbnailMinSize;
@property (nonatomic, assign) int sightCompressWidth;
@property (nonatomic, assign) int sightCompressHeight;

/**
 位置消息预览图压缩比 0 ~ 100
 */
@property (nonatomic, assign) int locationThumbnailQuality;
@property (nonatomic, assign) int locationThumbnailWidth;
@property (nonatomic, assign) int locationThumbnailHeight;

@end

NS_ASSUME_NONNULL_END
