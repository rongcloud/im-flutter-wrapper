//
//  RCIMIWAppSettings.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>
#import <RongIMLibCore/RCStatusDefine.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RCIMIWGroupReadReceiptVersion) {
    RCIMIWGroupReadReceiptVersionUnknown = 0,
    RCIMIWGroupReadReceiptVersion1 = 1,
    RCIMIWGroupReadReceiptVersion2 = 2,
    RCIMIWGroupReadReceiptVersion4 = 3,
    RCIMIWGroupReadReceiptVersion5 = 4,
};


@interface RCIMIWAppSettings : NSObject

/**
 * [ZH]
 * ---
 * 是否开启语音转文字功能。
 * ---
 * [EN]
 * ---
 * Whether the speech-to-text feature is enabled.
 * ---
 */
@property (nonatomic, assign) BOOL speechToTextEnable;

/**
 * [ZH]
 * ---
 * 消息可修改的时间范围，单位分钟。默认为 0，表示使用服务端默认配置。
 * ---
 * [EN]
 * ---
 * The time range in minutes during which a message can be modified. Defaults to 0, which means the server default configuration is used.
 * ---
 */
@property (nonatomic, assign) NSInteger messageModifiableMinutes;

/**
 * [ZH]
 * ---
 * 群已读回执版本。
 * ---
 * [EN]
 * ---
 * The group read receipt version.
 * ---
 */
@property (nonatomic, assign) RCIMIWGroupReadReceiptVersion readReceiptVersion;

@end

NS_ASSUME_NONNULL_END
