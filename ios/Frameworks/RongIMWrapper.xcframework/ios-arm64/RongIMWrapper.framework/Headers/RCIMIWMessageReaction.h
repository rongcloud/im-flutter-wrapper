#import <Foundation/Foundation.h>

@class RCIMIWMessageReactionUser;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWMessageReaction : NSObject
@property (nonatomic, copy) NSString *messageUId;
@property (nonatomic, copy) NSString *reactionId;
@property (nonatomic, assign) BOOL hasCurrentUserReacted;
@property (nonatomic, strong) NSArray<RCIMIWMessageReactionUser *> *users;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) long long reactionTime;
- (instancetype)init;
@end

NS_ASSUME_NONNULL_END
