//
//  RCIMIWTextMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 3/7/22.
//

#import <RongIMWrapper/RCIMIWMessage.h>
#import <RongIMWrapper/RCIMIWTranslateInfo.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWTextMessage : RCIMIWMessage

@property (nonatomic, copy) NSString *text;

/// 翻译信息
/// - Since: 5.24.0
@property (nonatomic, strong, nullable) RCIMIWTranslateInfo *translateInfo;

@end

NS_ASSUME_NONNULL_END
