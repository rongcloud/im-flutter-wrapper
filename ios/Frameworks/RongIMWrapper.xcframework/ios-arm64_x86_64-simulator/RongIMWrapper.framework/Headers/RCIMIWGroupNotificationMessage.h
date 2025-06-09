
#import <RongIMWrapper/RCIMIWMessage.h>

@interface RCIMIWGroupNotificationMessage : RCIMIWMessage

@property (nonatomic, copy) NSString *operation;

@property (nonatomic, copy) NSString *operatorUserId;

@property (nonatomic, copy) NSString *data;

@property (nonatomic, copy) NSString *message;


@end
