//
//  RCIMIWStreamMessageChunkInfo+Private.h
//  RongIMWrapper
//
//  Created by Codex on 2025/3/7.
//

#import "RCIMIWStreamMessageChunkInfo.h"

@class RCStreamMessageChunkInfo;

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWStreamMessageChunkInfo (Private)

- (instancetype)initWithRCChunkInfo:(RCStreamMessageChunkInfo *)chunkInfo;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END
