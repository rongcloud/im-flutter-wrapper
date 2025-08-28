//
//  RCIMIWSubscribeEvent.h
//  RongIMWrapper
//
//  Created by RongCloud on 2025/8/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RCIMIWSubscribeType) {
    RCIMIWSubscribeTypeInvalid = 0,
    RCIMIWSubscribeTypeOnlineStatus = 1,
    RCIMIWSubscribeTypeUserProfile = 2,
    RCIMIWSubscribeTypeFriendOnlineStatus = 3,
    RCIMIWSubscribeTypeFriendUserProfile = 4,
};

typedef NS_ENUM(NSInteger, RCIMIWSubscribeOperationType) {
    RCIMIWSubscribeOperationTypeSubscribe = 0,
    RCIMIWSubscribeOperationTypeUnSubscribe = 1
};

@interface RCIMIWSubscribeEvent : NSObject

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, assign) RCIMIWSubscribeType subscribeType;

@property (nonatomic, assign) RCIMIWSubscribeOperationType operationType;

@property (nonatomic, assign) long long subscribeTime;

@property (nonatomic, assign) NSInteger expiry;

+ (RCIMIWSubscribeType)convertSubscribeTypeFromNative:(NSInteger)nativeType;
+ (NSInteger)convertSubscribeTypeToNative:(RCIMIWSubscribeType)wrapperType;

+ (RCIMIWSubscribeOperationType)convertOperationTypeFromNative:(NSInteger)nativeOperationType;
+ (NSInteger)convertOperationTypeToNative:(RCIMIWSubscribeOperationType)wrapperOperationType;

@end

NS_ASSUME_NONNULL_END