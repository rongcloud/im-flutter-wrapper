//
//  RCIMIWConversationTagInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/10/22.
//

#import <Foundation/Foundation.h>
@class RCIMIWTagInfo;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWConversationTagInfo : NSObject

/*!
 标签 ID
 */
@property (nonatomic, strong) RCIMIWTagInfo *tagInfo;

/*!
 会话是否置顶
 */
@property (nonatomic, assign) BOOL top;

@end

NS_ASSUME_NONNULL_END
