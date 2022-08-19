//
//  RCIMIWVoiceMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/7/22.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWVoiceMessage : RCIMIWMediaMessage

/**
 语音时长，以秒为单位
 */
@property (nonatomic, assign, readonly) NSUInteger duration;

@end

NS_ASSUME_NONNULL_END
