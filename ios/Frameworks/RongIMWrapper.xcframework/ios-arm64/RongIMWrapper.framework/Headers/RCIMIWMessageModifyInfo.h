//
//  RCIMIWMessageModifyInfo.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>

@class RCIMIWMessage;
@class RCMessageModifyInfo;

typedef NS_ENUM(NSInteger, RCIMIWMessageModifyStatus) {
    /**
     * [ZH]
     * ---
     * 消息修改成功。
     * ---
     * [EN]
     * ---
     * Message modification succeeded.
     * ---
     */
    RCIMIWMessageModifyStatusSuccess = 0,

    /**
     * [ZH]
     * ---
     * 消息正在修改中。
     * ---
     * [EN]
     * ---
     * Message modification is in progress.
     * ---
     */
    RCIMIWMessageModifyStatusUpdating = 1,

    /**
     * [ZH]
     * ---
     * 消息修改失败。
     * ---
     * [EN]
     * ---
     * Message modification failed.
     * ---
     */
    RCIMIWMessageModifyStatusFailed = 2,
};

NS_ASSUME_NONNULL_BEGIN

/**
 * [ZH]
 * ---
 * 消息修改信息。
 * ---
 * [EN]
 * ---
 * Message modification information.
 * ---
 */
@interface RCIMIWMessageModifyInfo : NSObject

/**
 * [ZH]
 * ---
 * 消息修改时间戳。
 * ---
 * [EN]
 * ---
 * Message modification timestamp.
 * ---
 */
@property (nonatomic, assign) long timestamp;

/**
 * [ZH]
 * ---
 * 修改后的消息内容。
 * ---
 * [EN]
 * ---
 * Modified message content.
 * ---
 */
@property (nonatomic, strong, nullable) RCIMIWMessage *content;

/**
 * [ZH]
 * ---
 * 消息修改状态。
 * ---
 * [EN]
 * ---
 * Message modification status.
 * ---
 */
@property (nonatomic, assign) RCIMIWMessageModifyStatus status;

/**
 * [ZH]
 * ---
 * 根据字典初始化消息修改信息。
 *
 * @param dict 字典数据
 * ---
 * [EN]
 * ---
 * Initialize message modification information from a dictionary.
 *
 * @param dict Dictionary data.
 * ---
 */
- (instancetype)initWithDictionary:(NSDictionary *)dict;

/**
 * [ZH]
 * ---
 * 根据原生消息修改信息初始化。
 *
 * @param info 原生消息修改信息
 * ---
 * [EN]
 * ---
 * Initialize from native message modification information.
 *
 * @param info Native message modification information.
 * ---
 */
- (instancetype)initWithRCMessageModifyInfo:(RCMessageModifyInfo *)info;

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
