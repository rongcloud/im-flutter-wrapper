//
//  RCIMIWFileMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/7/22.
//

#import <RongIMWrapper/RCIMIWMediaMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWFileMessage : RCIMIWMediaMessage

/**
 文件名
 */
@property (nonatomic, copy) NSString *name;

/**
 文件类型
 */
@property (nonatomic, copy, readonly) NSString *fileType;

/**
 文件大小
 */
@property (nonatomic, assign, readonly) long long size;


@end

NS_ASSUME_NONNULL_END
