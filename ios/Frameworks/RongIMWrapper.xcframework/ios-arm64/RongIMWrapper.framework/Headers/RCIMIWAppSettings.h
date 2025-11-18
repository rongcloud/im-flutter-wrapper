//
//  RCIMIWAppSettings.h
//  RongIMWrapper
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RCIMIWGroupReadReceiptVersion) {
    RCIMIWGroupReadReceiptVersionUnknown = -1,
    RCIMIWGroupReadReceiptVersion1 = 0,
    RCIMIWGroupReadReceiptVersion2 = 1,
    RCIMIWGroupReadReceiptVersion4 = 3,
    RCIMIWGroupReadReceiptVersion5 = 4,
};

@interface RCIMIWAppSettings : NSObject

@property (nonatomic, assign) BOOL speechToTextEnable;
@property (nonatomic, assign) NSInteger messageModifiableMinutes;
@property (nonatomic, assign) RCIMIWGroupReadReceiptVersion readReceiptVersion;

@end

NS_ASSUME_NONNULL_END


