//
//  RCIMIWUserProfileConverter.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/7/31.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWUserProfile.h>
#import <RongIMLibCore/RongIMLibCore.h>

NS_ASSUME_NONNULL_BEGIN

@class RCIMIWUserProfile;
@class RCUserProfile;

@interface RCIMIWUserProfileConverter : NSObject

+ (RCIMIWUserProfile *)convertFromNativeUserProfile:(RCUserProfile *)nativeProfile;
+ (RCUserProfile *)convertToNativeUserProfile:(RCIMIWUserProfile *)profile;

+ (NSArray<RCIMIWUserProfile *> *)convertFromNativeUserProfiles:(NSArray<RCUserProfile *> *)nativeProfiles;

+ (RCIMIWUserProfileVisibility)convertFromNativeUserProfileVisibility:(RCUserProfileVisibility)nativeVisibility;
+ (NSUInteger)convertToNativeUserProfileVisibility:(NSInteger)visibility;

+ (NSInteger)convertFromNativeUserGender:(NSInteger)nativeGender;
+ (NSInteger)convertToNativeUserGender:(NSInteger)gender;

@end

NS_ASSUME_NONNULL_END
