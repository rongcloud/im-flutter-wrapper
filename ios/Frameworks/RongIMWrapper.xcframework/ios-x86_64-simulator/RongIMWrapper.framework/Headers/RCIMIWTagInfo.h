//
//  RCIMIWTagInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/3/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWTagInfo : NSObject

/*!
 标签 ID
 */
@property (nonatomic, copy, readonly) NSString *tagId;

/*!
 标签名称
 */
@property (nonatomic, copy, readonly)  NSString *tagName;

/*!
 该标签下的会话个数
 */
@property (nonatomic, assign, readonly) NSInteger count;

/*!
 标签创建时间
 */
@property (nonatomic, assign, readonly) long long timestamp;

/*!
 初始化方法

 @param  tagId      标签 id
 @param  tagName  标签名称
 */
- (instancetype)initWithTagId:(NSString *)tagId
                        tagName:(NSString *)tagName;

@end

NS_ASSUME_NONNULL_END
