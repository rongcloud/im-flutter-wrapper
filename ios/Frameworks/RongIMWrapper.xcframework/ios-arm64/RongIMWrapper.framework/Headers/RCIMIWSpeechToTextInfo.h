//
//  RCIMIWSpeechToTextInfo.h
//  RongIMWrapper
//
//  Created for STT wrapper.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWSpeechToTextStatus.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWSpeechToTextInfo : NSObject

@property (nonatomic, assign) RCIMIWSpeechToTextStatus status;
@property (nonatomic, copy, nullable) NSString *text;
@property (nonatomic, assign, getter=isVisible) BOOL visible;

- (instancetype)initWithStatus:(RCIMIWSpeechToTextStatus)status
                           text:(nullable NSString *)text
                        visible:(BOOL)visible;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END


