//
//  RCIMIWConversationListOption.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

/// [ZH] 会话列表分页、排序和未读数筛选配置。
/// [EN] Pagination, sorting, and unread-count filtering options for a conversation list.
@interface RCIMIWConversationListOption : NSObject

/// [ZH] 获取数量，默认值为 20。
/// [EN] Number of conversations to retrieve. The default is 20.
@property (nonatomic, assign) NSInteger count;

/// [ZH] 起始时间戳，单位毫秒。0 表示从最新会话开始。
/// [EN] Start timestamp in milliseconds. Zero starts from the latest conversation.
@property (nonatomic, assign) long long startTime;

/// [ZH] 是否置顶会话优先，默认值为 YES。
/// [EN] Whether pinned conversations take priority. The default is YES.
@property (nonatomic, assign) BOOL topPriority;

/// [ZH] 未读数筛选条件，默认返回全部会话。
/// [EN] Unread-count filter. The default returns all conversations.
@property (nonatomic, assign) RCIMIWConversationUnreadCountFilter unreadCountFilter;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
