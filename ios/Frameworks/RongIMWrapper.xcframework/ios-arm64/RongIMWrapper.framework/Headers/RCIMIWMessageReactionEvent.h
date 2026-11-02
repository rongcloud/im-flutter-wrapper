#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

@class RCIMIWMessageReactionUser;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RCIMIWMessageReactionOperationType) {
    RCIMIWMessageReactionOperationTypeAdded = 1,
    RCIMIWMessageReactionOperationTypeRemoved = 2,
    RCIMIWMessageReactionOperationTypeCleared = 3,
};

@interface RCIMIWMessageReactionEvent : NSObject
@property (nonatomic, assign) RCIMIWConversationType conversationType;
@property (nonatomic, copy) NSString *targetId;
@property (nonatomic, copy, nullable) NSString *channelId;
@property (nonatomic, copy) NSString *messageUId;
@property (nonatomic, copy) NSString *reactionId;
@property (nonatomic, assign) RCIMIWMessageReactionOperationType operationType;
@property (nonatomic, strong) NSArray<RCIMIWMessageReactionUser *> *users;
@property (nonatomic, assign) NSInteger totalCount;
- (instancetype)init;
@end

NS_ASSUME_NONNULL_END
