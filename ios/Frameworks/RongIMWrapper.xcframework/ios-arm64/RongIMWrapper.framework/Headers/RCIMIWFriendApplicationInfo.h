//
//  RCIMIWFriendApplicationInfo.h
//  RongIMWrapper
//
//  Created by Codex on 2024/11/27.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWFriendApplicationInfo : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy, nullable) NSString *name;
@property (nonatomic, copy, nullable) NSString *portrait;
@property (nonatomic, assign) RCIMIWFriendApplicationType applicationType;
@property (nonatomic, assign) RCIMIWFriendApplicationStatus applicationStatus;
@property (nonatomic, assign) RCIMIWFriendType friendType;
@property (nonatomic, assign) long long operationTime;
@property (nonatomic, copy, nullable) NSString *remark;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithUserId:(NSString *)userId
                          name:(nullable NSString *)name
                      portrait:(nullable NSString *)portrait
               applicationType:(RCIMIWFriendApplicationType)applicationType
             applicationStatus:(RCIMIWFriendApplicationStatus)applicationStatus
                    friendType:(RCIMIWFriendType)friendType
                 operationTime:(long long)operationTime
                        remark:(nullable NSString *)remark;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END
