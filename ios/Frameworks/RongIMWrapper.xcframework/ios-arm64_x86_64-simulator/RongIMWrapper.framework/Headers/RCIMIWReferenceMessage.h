//
//  RCIMIWReferenceMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/8/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * [ZH]
 * ---
 * 被引用消息的状态。
 * ---
 * [EN]
 * ---
 * Status of the referenced message.
 * ---
 */
typedef NS_ENUM(NSInteger, RCIMIWReferenceMessageStatus) {
    /** [ZH] 默认状态。 [EN] Default status. */
    RCIMIWReferenceMessageStatusDefaultValue = 0,
    /** [ZH] 被引用消息已修改。 [EN] The referenced message has been modified. */
    RCIMIWReferenceMessageStatusModified = 1,
    /** [ZH] 被引用消息已撤回。 [EN] The referenced message has been recalled. */
    RCIMIWReferenceMessageStatusRecalled = 2,
    /** [ZH] 被引用消息已删除。 [EN] The referenced message has been deleted. */
    RCIMIWReferenceMessageStatusDeleted = 3,
};

@interface RCIMIWReferenceMessage : RCIMIWMessage

/*!
 文本
 */
@property (nonatomic, strong, readonly) NSString *text;

/*!
 被引用消息体
 */
@property (nonatomic, strong, readonly) RCIMIWMessage *referenceMessage;

/**
 * [ZH]
 * ---
 * 被引用消息的状态。
 * ---
 * [EN]
 * ---
 * Status of the referenced message.
 * ---
 */
@property (nonatomic, assign) RCIMIWReferenceMessageStatus referMsgStatus;

@end

NS_ASSUME_NONNULL_END
