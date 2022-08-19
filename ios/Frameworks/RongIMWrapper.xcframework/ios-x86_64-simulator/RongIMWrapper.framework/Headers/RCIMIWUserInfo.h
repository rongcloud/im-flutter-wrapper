//
//  RCIMIWUserInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 2/18/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWUserInfo : NSObject

/*!
 用户 ID
 */
@property (nonatomic, copy) NSString *userId;

/*!
 用户名称
 */
@property (nonatomic, copy) NSString *name;

/*!
 用户头像的 URL
 */
@property (nonatomic, copy) NSString *portrait;

/*!
 用户备注
 */
@property (nonatomic, copy) NSString *alias;

/**
 用户信息附加字段
 */
@property (nonatomic, copy) NSString *extra;

/*!
 用户信息的初始化方法

 @param userId      用户 ID
 @param name    用户名称
 @param portraitUri    用户头像的 URL
 @return            用户信息对象
 */
- (instancetype)initWithUserId:(NSString *)userId name:(NSString *)name portraitUri:(NSString *)portraitUri;

@end

NS_ASSUME_NONNULL_END
