//
//  RCIMIWVoiceMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/7/22.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>
#import <RongIMWrapper/RCIMIWSpeechToTextInfo.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWVoiceMessage : RCIMIWMediaMessage

/**
 语音时长，以秒为单位
 */
@property (nonatomic, assign, readonly) NSUInteger duration;

/// 语音转文字信息
@property (nonatomic, strong, readonly, nullable) RCIMIWSpeechToTextInfo *speechToTextInfo;

/// 声道数量
@property (nonatomic, assign, readonly) NSUInteger numberOfChannels;

/// 采样率
@property (nonatomic, assign, readonly) NSUInteger sampleRate;

/// 编码格式
@property (nonatomic, copy, readonly, nullable) NSString *format;

@end

NS_ASSUME_NONNULL_END
