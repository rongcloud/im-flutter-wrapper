//
//  RCIMIWStreamMessageRequestParams+Private.h
//  RongIMWrapper
//
//  Created by Codex on 2025/3/7.
//

#import "RCIMIWStreamMessageRequestParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWStreamMessageRequestParams (Private)

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)toDict;

@end

NS_ASSUME_NONNULL_END
