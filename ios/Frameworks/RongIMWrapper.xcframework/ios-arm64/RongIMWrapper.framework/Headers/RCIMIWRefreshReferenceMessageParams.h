//
//  RCIMIWRefreshReferenceMessageParams.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * [ZH]
 * ---
 * 刷新引用消息的参数。
 * ---
 * [EN]
 * ---
 * Parameters for refreshing referenced messages.
 * ---
 */
@interface RCIMIWRefreshReferenceMessageParams : NSObject

- (instancetype)init;

/** [ZH] 会话类型。 [EN] Conversation type. */
@property (nonatomic, assign) RCIMIWConversationType conversationType;

/** [ZH] 会话 ID。 [EN] Conversation ID. */
@property (nonatomic, copy) NSString *targetId;

/** [ZH] 频道 ID，仅超级群会话使用。 [EN] Channel ID, used only for ultra group conversations. */
@property (nonatomic, copy, nullable) NSString *channelId;

/**
 * [ZH] 引用消息自身的唯一 ID 列表，最多 20 个，不是被引用消息的唯一 ID。
 * [EN] Unique ID list of the reference messages themselves, with at most 20 items; these are not the
 * unique IDs of the referenced messages.
 */
@property (nonatomic, copy) NSArray<NSString *> *messageUIds;

@end

NS_ASSUME_NONNULL_END
