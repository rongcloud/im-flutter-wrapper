//
//  RCIMIWConversationTypeFilter.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

/// [ZH] 会话类型过滤条件。
/// [EN] Conversation type filter.
@interface RCIMIWConversationTypeFilter : NSObject

/// [ZH] 会话类型。
/// [EN] Conversation type.
@property (nonatomic, assign) RCIMIWConversationType type;

/// [ZH] 频道 ID。传 nil 表示不按频道过滤，传空字符串表示默认频道。
/// [EN] Channel ID. Nil disables channel filtering, while an empty string selects the default channel.
@property (nonatomic, copy, nullable) NSString *channelId;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
