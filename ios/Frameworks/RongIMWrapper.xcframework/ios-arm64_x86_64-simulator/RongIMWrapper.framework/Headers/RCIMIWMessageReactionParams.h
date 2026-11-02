#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWMessagePushOptions.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWUpdateMessageReactionParam : NSObject
@property (nonatomic, copy) NSString *messageUId;
@property (nonatomic, copy) NSString *reactionId;
@property (nonatomic, strong, nullable) RCIMIWMessagePushOptions *pushOptions;
- (instancetype)init;
@end

@interface RCIMIWGetMessageReactionsParam : NSObject
@property (nonatomic, copy) NSString *messageUId;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy, nullable) NSString *pageToken;
- (instancetype)init;
@end

@interface RCIMIWGetMessageReactionUsersParam : NSObject
@property (nonatomic, copy) NSString *messageUId;
@property (nonatomic, copy) NSString *reactionId;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy, nullable) NSString *pageToken;
- (instancetype)init;
@end

@interface RCIMIWMessageReactionSummaryQueryParam : NSObject
@property (nonatomic, assign) RCIMIWConversationType conversationType;
@property (nonatomic, copy) NSString *targetId;
@property (nonatomic, copy, nullable) NSString *channelId;
@property (nonatomic, copy) NSArray<NSString *> *messageUIds;
- (instancetype)init;
@end

NS_ASSUME_NONNULL_END
