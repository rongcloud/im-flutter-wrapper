#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWMessageReactionUser : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, assign) long long reactionTime;
- (instancetype)init;
@end

NS_ASSUME_NONNULL_END
