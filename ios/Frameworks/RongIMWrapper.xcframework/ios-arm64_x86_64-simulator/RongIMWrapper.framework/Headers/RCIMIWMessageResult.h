//
//  RCIMIWMessageResult.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>

@class RCIMIWMessage;
@class RCMessageResult;

NS_ASSUME_NONNULL_BEGIN

/**
 * [ZH]
 * ---
 * 引用消息刷新结果。
 * ---
 * [EN]
 * ---
 * Result of refreshing a referenced message.
 * ---
 */
@interface RCIMIWMessageResult : NSObject

/** [ZH] 消息唯一 ID。 [EN] Message unique ID. */
@property (nonatomic, copy, readonly) NSString *messageUId;

/** [ZH] 查询到的消息；未查询到时为空。 [EN] The queried message, or nil when no message is found. */
@property (nonatomic, strong, readonly, nullable) RCIMIWMessage *message;

/** [ZH] 查询结果错误码。 [EN] Error code of the query result. */
@property (nonatomic, assign, readonly) NSInteger code;

- (instancetype)initWithRCMessageResult:(RCMessageResult *)result;

@end

NS_ASSUME_NONNULL_END
