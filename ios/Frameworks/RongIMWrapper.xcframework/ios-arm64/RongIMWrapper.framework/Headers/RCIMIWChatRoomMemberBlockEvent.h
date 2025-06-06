//
//  RCIMIWChatRoomMemberBlockEvent.h
//  RongIMWrapper
//
//  Created by Lang on 2024/11/27.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWChatRoomMemberBlockEvent : NSObject
/*!
 聊天室 ID
 */
@property (nonatomic, copy) NSString *chatroomId;

/**
 封禁类型，0是解封，1是封禁
 */
@property (nonatomic, assign) RCIMIWChatRoomMemberOperateType operateType;

/**
 封禁的总时间，封禁时有此字段(毫秒)，最大值为43200分钟（1个月）, 最小值1分钟
 */
@property (nonatomic, assign) NSInteger durationTime;

/**
 操作时间(毫秒时间戳)
 */
@property (nonatomic, assign) long long operateTime;

/**
 被封禁/解封的用户 ID 列表
 */
@property (nonatomic, copy) NSArray<NSString *> *userIdList;

/**
 附加信息
 */
@property (nonatomic, copy, nullable) NSString *extra;


@end

NS_ASSUME_NONNULL_END
