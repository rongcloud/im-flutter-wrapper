//
//  RCIMIWChatRoomSyncEvent.h
//  RongIMWrapper
//
//  Created by Lang on 2024/11/27.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWChatRoomSyncEvent : NSObject
/*!
 聊天室 ID
 */
@property (nonatomic, copy) NSString *chatroomId;

/**
 同步通知的变更状态
 */
@property (nonatomic, assign) RCIMIWChatRoomSyncStatus status;

/**
 如果status是0的情况，区分离开类型：
 1，自己主动离开，
 2，多端加入互踢导致离开
 */
@property (nonatomic, assign) RCIMIWChatRoomSyncStatusReason reason;

/**
 同步通知的变更时间
 用户加入/退出/被踢的时间(毫秒时间戳)
 */
@property (nonatomic, assign) long long time;

/**
 附加信息
 */
@property (nonatomic, copy, nullable) NSString *extra;


@end

NS_ASSUME_NONNULL_END
