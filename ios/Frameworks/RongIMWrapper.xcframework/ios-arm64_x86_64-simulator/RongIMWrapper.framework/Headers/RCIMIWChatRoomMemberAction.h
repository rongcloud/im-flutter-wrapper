//
//  RCIMIWChatRoomMemberAction.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/23/22.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWChatRoomMemberAction : NSObject

/*!
 成员 ID
 */
@property (nonatomic, copy, readonly) NSString *userId;

/*!
 成员加入或者退出
 */
@property (nonatomic, assign, readonly) RCIMIWChatRoomMemberActionType actionType;

@end

NS_ASSUME_NONNULL_END
