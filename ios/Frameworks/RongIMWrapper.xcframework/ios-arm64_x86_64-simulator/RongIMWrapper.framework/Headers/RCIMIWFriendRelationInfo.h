//
//  RCIMIWFriendRelationInfo.h
//  RongIMWrapper
//
//  Created by Codex on 2024/11/27.
//

#import <Foundation/Foundation.h>
#import <RongIMWrapper/RCIMIWDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWFriendRelationInfo : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, assign) RCIMIWFriendRelationType relation;

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithUserId:(NSString *)userId
                      relation:(RCIMIWFriendRelationType)relation;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END
