//
//  RCIMIWStreamMessageChunkInfo.h
//  RongIMWrapper
//
//  Created by RongCloud on 2025/3/7.
//

#import <Foundation/Foundation.h>

@class RCStreamMessageChunkInfo;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWStreamMessageChunkInfo : NSObject

/// 流式消息增量数据
@property (nonatomic, copy, nullable) NSString *content;

@end

NS_ASSUME_NONNULL_END
