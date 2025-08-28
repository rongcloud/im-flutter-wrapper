//
//  RCIMIWUserProfile.h
//  RongIMWrapper
//
//  Created by RongCloud on 2024/7/31.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 用户信息访问权限
typedef NS_ENUM(NSUInteger, RCIMIWUserProfileVisibility) {
    /// 未设置，以 AppKey 权限设置为准，默认是此状态。
    RCIMIWUserProfileVisibilityNotSet = 0,
    /// 都不可见，任何人都不能搜索到我的用户信息，名称、头像除外
    RCIMIWUserProfileVisibilityInvisible = 1,
    /// 所有人可见，应用中任何用户都可以查看到我的用户信息
    RCIMIWUserProfileVisibilityEveryone = 2,
    /// 仅好友可见
    RCIMIWUserProfileVisibilityFriendVisible = 3,
};

/// 性别
typedef NS_ENUM(NSInteger, RCIMIWUserGender) {
    RCIMIWUserGenderUnknown = 0,  // 未知性别
    RCIMIWUserGenderMale = 1,     // 男性
    RCIMIWUserGenderFemale = 2,   // 女性
};

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWUserProfile : NSObject

/// 用户 id
@property (nonatomic, copy) NSString *userId;

/// 昵称
/// 长度不超过 32 个字符
@property (nonatomic, copy) NSString *name;

/// 头像地址
/// 长度不超过 128 个字符
@property (nonatomic, copy, nullable) NSString *portraitUri;

/// 用户应用号
/// 客户端无法直接修改
@property (nonatomic, copy) NSString *uniqueId;

/// 电子邮件
/// 长度不超过 128 个字符
@property (nonatomic, copy, nullable) NSString *email;

/// 生日
/// 长度不超过 32 个字符
@property (nonatomic, copy, nullable) NSString *birthday;

/// 性别
@property (nonatomic, assign) RCIMIWUserGender gender;

/// 所在地
/// 长度不超过 32 个字符
@property (nonatomic, copy, nullable) NSString *location;

/// 角色
/// 支持 0~100 以内数字
@property (nonatomic, assign) NSUInteger role;

/// 级别
/// 支持 0~100 以内数字
@property (nonatomic, assign) NSUInteger level;

/// 自定义用户扩展信息
/// 设置时请确保字典 key 值已在开发者后台配置过。
@property (nonatomic, copy, nullable) NSDictionary<NSString *, NSString *> *userExtProfile;

/// 创建用户信息对象
/// @param userId 用户ID
/// @param name 姓名
/// @param portraitUri 头像URI
/// @param uniqueId 唯一ID
/// @param email 邮箱
/// @param birthday 生日
/// @param gender 性别
/// @param location 位置
/// @param role 角色
/// @param level 等级
/// @param userExtProfile 扩展信息
- (instancetype)initWithUserId:(NSString *)userId
                          name:(NSString *)name
                   portraitUri:(nullable NSString *)portraitUri
                      uniqueId:(NSString *)uniqueId
                         email:(nullable NSString *)email
                      birthday:(nullable NSString *)birthday
                        gender:(RCIMIWUserGender)gender
                      location:(nullable NSString *)location
                          role:(NSUInteger)role
                         level:(NSUInteger)level
                userExtProfile:(nullable NSDictionary<NSString *, NSString *> *)userExtProfile;

@end

NS_ASSUME_NONNULL_END