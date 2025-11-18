//
//  RCIMIWFriendInfo.h
//  RongIMWrapper
//
//  Created by Codex on 2024/11/27.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWFriendInfo : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy, nullable) NSString *name;
@property (nonatomic, copy, nullable) NSString *portrait;
@property (nonatomic, copy, nullable) NSString *remark;
@property (nonatomic, copy, nullable) NSDictionary<NSString *, NSString *> *extFields;
@property (nonatomic, assign) long long addTime;
@property (nonatomic, assign) RCIMIWFriendType friendType;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithUserId:(NSString *)userId
                          name:(nullable NSString *)name
                      portrait:(nullable NSString *)portrait
                        remark:(nullable NSString *)remark
                     extFields:(nullable NSDictionary<NSString *, NSString *> *)extFields
                        addTime:(long long)addTime
                     friendType:(RCIMIWFriendType)friendType;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END
