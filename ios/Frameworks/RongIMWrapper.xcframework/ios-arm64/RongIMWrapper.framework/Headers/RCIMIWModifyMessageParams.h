//
//  RCIMIWModifyMessageParams.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>

@class RCIMIWMessage;
@class RCModifyMessageParams;

NS_ASSUME_NONNULL_BEGIN

/**
 * [ZH]
 * ---
 * 消息修改参数。
 * ---
 * [EN]
 * ---
 * Message modification parameters.
 * ---
 */
@interface RCIMIWModifyMessageParams : NSObject

/**
 * [ZH]
 * ---
 * 消息唯一 ID。
 * ---
 * [EN]
 * ---
 * Unique message ID.
 * ---
 */
@property (nonatomic, copy) NSString *messageUId;

/**
 * [ZH]
 * ---
 * 修改后的消息。
 * ---
 * [EN]
 * ---
 * Modified message.
 * ---
 */
@property (nonatomic, strong) RCIMIWMessage *message;

/**
 * [ZH]
 * ---
 * 根据字典初始化消息修改参数。
 *
 * @param dict 字典数据
 * ---
 * [EN]
 * ---
 * Initialize message modification parameters from a dictionary.
 *
 * @param dict Dictionary data.
 * ---
 */
- (instancetype)initWithDictionary:(NSDictionary *)dict;

/**
 * [ZH]
 * ---
 * 转换为原生消息修改参数。
 * ---
 * [EN]
 * ---
 * Convert to native message modification parameters.
 * ---
 */
- (RCModifyMessageParams *)toNative;

@end

NS_ASSUME_NONNULL_END
