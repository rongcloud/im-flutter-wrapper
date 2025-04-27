//
//  RCIMIWImageMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/7/22.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWImageMessage : RCIMIWMediaMessage

/*!
 图片消息的缩略图
 */
@property (nonatomic, copy, readonly) NSString *thumbnailBase64String;

/*!
 是否发送原图

 @discussion 在发送图片的时候，是否发送原图，默认值为 NO。
 */
@property (nonatomic, assign) BOOL original;

@end

NS_ASSUME_NONNULL_END
