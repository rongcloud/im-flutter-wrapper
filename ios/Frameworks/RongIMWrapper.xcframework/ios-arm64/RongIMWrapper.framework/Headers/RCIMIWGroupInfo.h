//
//  RCIMIWGroupInfo.h
//  RongIMWrapper
//
//  Created by Lang on 2024/11/22.
//  Copyright © 2024 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWGroupInfo : NSObject

/// 群组 ID
@property (nonatomic, copy) NSString *groupId;

/// 群名称
@property (nonatomic, copy) NSString *groupName;

/// 群头像 URL 地址，长度不超过 128 个字符
@property (nonatomic, copy, nullable) NSString *portraitUri;

/// 群简介，长度不超过 512 个字符
@property (nonatomic, copy, nullable) NSString *introduction;

/// 群公告，长度不超过 1024 个字符
@property (nonatomic, copy, nullable) NSString *notice;

/// 扩展信息，
/// 自定义属性需要通过开发者后台或 服务端 API 设置后才能使用，否则返回设置失败
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *extProfile;

/// 主动加入群权限
/// 默认需要群主验证
@property (nonatomic, assign) RCIMIWGroupJoinPermission joinPermission;

/// 移除群成员权限
/// 默认群主
@property (nonatomic, assign) RCIMIWGroupOperationPermission removeMemberPermission;

/// 邀请他人入群权限
/// 默认群主
@property (nonatomic, assign) RCIMIWGroupOperationPermission invitePermission;

/// 被邀请加入群组权限
/// 默认不需要被邀请人同意
@property (nonatomic, assign) RCIMIWGroupInviteHandlePermission inviteHandlePermission;

/// 修改群资料权限
/// 默认群主
@property (nonatomic, assign) RCIMIWGroupOperationPermission groupInfoEditPermission;

/// 修改群成员资料权限
/// 默认群主、群管理员、自已都可以
@property (nonatomic, assign) RCIMIWGroupMemberInfoEditPermission memberInfoEditPermission;

#pragma mark - 只读属性

/// 创建者 userId
@property (nonatomic, copy) NSString *creatorId;

/// 群主 userId
@property (nonatomic, copy) NSString *ownerId;

/// 群备注
/// 自己设置备注名，其他人看不到
@property (nonatomic, copy, nullable) NSString *remark;

/// 群组创建时间。
@property (nonatomic, assign) long long createTime;

/// 群当前成员人数。
@property (nonatomic, assign) NSUInteger membersCount;

/// 当前用户加入时间：用户多次加入群组时，以最后一次加入时间为准
@property (nonatomic, assign) long long joinedTime;

/// 我的群身份
@property (nonatomic, assign) RCIMIWGroupMemberRole role;

/// 群组状态
/// 默认使用中
@property (nonatomic, assign) RCIMIWGroupStatus groupStatus;

/// 群组状态的更新时间：如果是使用中，则为创建时间；如果是已解散，则为解散时间。
@property (nonatomic, assign) long long groupStatusUpdateTime;

/*!
 初始化方法

    @param  groupId      群组 id
    @param  groupName  群组名称
    @param  portraitUri  群组头像
    @param  introduction  群组简介
    @param  notice  群组公告
    @param  extProfile  群组扩展信息
    @param  joinPermission  群组加入权限
    @param  removeMemberPermission  群组移除成员权限
    @param  invitePermission  群组邀请权限
    @param  inviteHandlePermission  群组邀请处理权限
    @param  groupInfoEditPermission  群组资料修改权限
    @param  memberInfoEditPermission  群组成员资料修改权限
    @param  creatorId  群组创建者 id
    @param  ownerId  群组所有者 id
    @param  remark  群组备注
    @param  createTime  群组创建时间
    @param  membersCount  群组成员人数
    @param  joinedTime  当前用户加入时间
    @param  role  我的群身份
    @param  groupStatus  群组状态
    @param  groupStatusUpdateTime  群组状态更新时间

 */
- (instancetype)initWithGroupId:(NSString *)groupId
                      groupName:(NSString *)groupName
                      portraitUri:(nullable NSString *)portraitUri
                      introduction:(nullable NSString *)introduction
                      notice:(nullable NSString *)notice
                      extProfile:(nullable NSDictionary<NSString *, NSString *> *)extProfile
                      joinPermission:(RCIMIWGroupJoinPermission)joinPermission
                      removeMemberPermission:(RCIMIWGroupOperationPermission)removeMemberPermission
                      invitePermission:(RCIMIWGroupOperationPermission)invitePermission
                      inviteHandlePermission:(RCIMIWGroupInviteHandlePermission)inviteHandlePermission
                      groupInfoEditPermission:(RCIMIWGroupOperationPermission)groupInfoEditPermission
                      memberInfoEditPermission:(RCIMIWGroupMemberInfoEditPermission)memberInfoEditPermission
                      creatorId:(NSString *)creatorId
                      ownerId:(NSString *)ownerId
                      remark:(nullable NSString *)remark
                      createTime:(long long)createTime
                      membersCount:(NSUInteger)membersCount
                      joinedTime:(long long)joinedTime
                      role:(RCIMIWGroupMemberRole)role
                      groupStatus:(RCIMIWGroupStatus)groupStatus
                      groupStatusUpdateTime:(long long)groupStatusUpdateTime;

@end

NS_ASSUME_NONNULL_END
