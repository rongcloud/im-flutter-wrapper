//
//  RCIMIWSpeechToTextStatus.h
//  RongIMWrapper
//
//  Created for STT wrapper.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RCIMIWSpeechToTextStatus) {
    RCIMIWSpeechToTextStatusNotConverted = 0,
    RCIMIWSpeechToTextStatusConverting = 1,
    RCIMIWSpeechToTextStatusSuccess = 2,
    RCIMIWSpeechToTextStatusFailed = 3,
};

NS_ASSUME_NONNULL_END


