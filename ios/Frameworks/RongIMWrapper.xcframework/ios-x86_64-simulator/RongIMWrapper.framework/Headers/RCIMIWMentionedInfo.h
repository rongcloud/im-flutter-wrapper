//
//  RCIMIWMentionedInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/18/22.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWMentionedInfo : NSObject

/*!
 @ 提醒的类型
 */
@property (nonatomic, assign) RCIMIWMentionedType type;

/*!
 @ 的用户 ID 列表

 @discussion 如果 type 是 @ 所有人，则可以传 nil
 */
@property (nonatomic, copy) NSArray<NSString *> *userIdList;

/*!
 包含 @ 提醒的消息，本地通知和远程推送显示的内容
 */
@property (nonatomic, copy) NSString *mentionedContent;

@end

NS_ASSUME_NONNULL_END
