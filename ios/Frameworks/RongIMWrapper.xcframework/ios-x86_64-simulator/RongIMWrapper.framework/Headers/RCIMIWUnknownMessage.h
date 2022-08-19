//
//  RCIMIWUnknownMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/9/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWUnknownMessage : RCIMIWMessage

@property (nonatomic, copy, readonly) NSString *rawData;
@property (nonatomic, copy, readonly) NSString *objectName;

@end

NS_ASSUME_NONNULL_END
