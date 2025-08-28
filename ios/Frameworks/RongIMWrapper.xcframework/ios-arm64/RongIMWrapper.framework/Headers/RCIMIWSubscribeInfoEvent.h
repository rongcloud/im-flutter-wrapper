//
//  RCIMIWSubscribeInfoEvent.h
//  RongIMWrapper
//
//  Created by RongCloud on 2025/8/1.
//

#import <Foundation/Foundation.h>
#import "RCIMIWSubscribeEvent.h"

NS_ASSUME_NONNULL_BEGIN

@class RCIMIWSubscribeEventDetail, RCIMIWUserProfile;

@interface RCIMIWSubscribeInfoEvent : NSObject

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, assign) RCIMIWSubscribeType subscribeType;

@property (nonatomic, assign) long long subscribeTime;

@property (nonatomic, assign) NSInteger expiry;

@property (nonatomic, strong, nullable) NSArray<RCIMIWSubscribeEventDetail *> *details;

@property (nonatomic, strong, nullable) RCIMIWUserProfile *userProfile;

@end

NS_ASSUME_NONNULL_END