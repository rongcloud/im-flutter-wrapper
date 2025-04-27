//
//  RCIMIWSightMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/7/22.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWSightMessage : RCIMIWMediaMessage

/**
 视频时长，以秒为单位
 */
@property (nonatomic, assign, readonly) NSUInteger duration;

/**
 文件大小
 */
@property (nonatomic, assign, readonly) long long size;

/**
 小视频文件名
 */
@property (nonatomic, copy, readonly) NSString *name;

@property (nonatomic, copy, readonly) NSString *thumbnailBase64String;

@end

NS_ASSUME_NONNULL_END
