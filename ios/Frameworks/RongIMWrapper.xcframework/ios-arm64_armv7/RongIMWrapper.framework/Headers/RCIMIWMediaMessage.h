//
//  RCIMIWMediaMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/15/22.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWMediaMessage : RCIMIWMessage

@property (nonatomic, copy, readonly) NSString *local;
@property (nonatomic, copy, readonly) NSString *remote;

@end

NS_ASSUME_NONNULL_END
