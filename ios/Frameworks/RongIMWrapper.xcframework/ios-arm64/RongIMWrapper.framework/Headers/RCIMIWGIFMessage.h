//
//  RCIMIWGIFMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/8/22.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWGIFMessage : RCIMIWMediaMessage

/*!
 GIF 图的大小，单位字节
 */
@property (nonatomic, assign, readonly) long long dataSize;

/*!
 GIF 图的宽
 */
@property (nonatomic, assign, readonly) long width;

/*!
 GIF 图的高
 */
@property (nonatomic, assign, readonly) long height;

@end

NS_ASSUME_NONNULL_END
