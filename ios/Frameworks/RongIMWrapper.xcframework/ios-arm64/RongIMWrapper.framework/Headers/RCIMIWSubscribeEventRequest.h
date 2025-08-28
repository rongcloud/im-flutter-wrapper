//
//  RCIMIWSubscribeEventRequest.h
//  RongIMWrapper
//
//  Created by RongCloud on 2025/8/6.
//

#import <Foundation/Foundation.h>
#import "RCIMIWSubscribeEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWSubscribeEventRequest : NSObject

@property (nonatomic, assign) RCIMIWSubscribeType subscribeType;

@property (nonatomic, assign) NSInteger expiry;

@property (nonatomic, strong, nullable) NSArray<NSString *> *userIds;

- (instancetype)initWithSubscribeType:(RCIMIWSubscribeType)subscribeType;

- (instancetype)initWithSubscribeType:(RCIMIWSubscribeType)subscribeType
                              userIds:(nullable NSArray<NSString *> *)userIds;

- (instancetype)initWithSubscribeType:(RCIMIWSubscribeType)subscribeType
                               expiry:(NSInteger)expiry
                              userIds:(nullable NSArray<NSString *> *)userIds;

@end

NS_ASSUME_NONNULL_END