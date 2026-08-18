//
//  RCIMIWEditedMessageDraft.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>

@class RCEditedMessageDraft;

NS_ASSUME_NONNULL_BEGIN

/**
 * [ZH]
 * ---
 * 消息编辑草稿。
 * ---
 * [EN]
 * ---
 * Edited-message draft.
 * ---
 */
@interface RCIMIWEditedMessageDraft : NSObject

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
 * 编辑草稿内容。
 * ---
 * [EN]
 * ---
 * Edited draft content.
 * ---
 */
@property (nonatomic, copy, nullable) NSString *content;

/**
 * [ZH]
 * ---
 * 根据字典初始化消息编辑草稿。
 *
 * @param dict 字典数据
 * ---
 * [EN]
 * ---
 * Initialize an edited-message draft from a dictionary.
 *
 * @param dict Dictionary data.
 * ---
 */
- (instancetype)initWithDictionary:(NSDictionary *)dict;

/**
 * [ZH]
 * ---
 * 根据原生消息编辑草稿初始化。
 *
 * @param draft 原生消息编辑草稿
 * ---
 * [EN]
 * ---
 * Initialize from a native edited-message draft.
 *
 * @param draft Native edited-message draft.
 * ---
 */
- (instancetype)initWithRCEditedMessageDraft:(RCEditedMessageDraft *)draft;

/**
 * [ZH]
 * ---
 * 转换为原生消息编辑草稿。
 * ---
 * [EN]
 * ---
 * Convert to a native edited-message draft.
 * ---
 */
- (RCEditedMessageDraft *)toNative;

/**
 * [ZH]
 * ---
 * 转换为字典。
 * ---
 * [EN]
 * ---
 * Convert to a dictionary.
 * ---
 */
- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END
