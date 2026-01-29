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

@property (nonatomic, assign) BOOL speechToTextEnable;
@property (nonatomic, assign) NSInteger messageModifiableMinutes;
@property (nonatomic, assign) RCIMIWGroupReadReceiptVersion readReceiptVersion;

@end

NS_ASSUME_NONNULL_END
