//
//  RCIMIWStreamMessage.h
//  RongIMWrapper
//
//  Created by RongCloud on 2025/3/7.
//

#import <RongIMWrapper/RCIMIWMessage.h>
#import <RongIMWrapper/RCIMIWReferenceInfo.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMIWStreamMessage : RCIMIWMessage

/// 流式消息内容
@property (nonatomic, copy, nullable) NSString *content;

/// 流式消息类型
@property (nonatomic, copy, nullable) NSString *type;

/// 是否结束生成
@property (nonatomic, assign, getter=isComplete) BOOL complete;

/// 是否完成流拉取
@property (nonatomic, assign, getter=isSync) BOOL sync;

/// 异常结束原因（业务服务器）
@property (nonatomic, assign) NSInteger completeReason;

/// 异常结束原因（融云服务器）
@property (nonatomic, assign) NSInteger stopReason;

/// 引用消息信息
@property (nonatomic, strong, nullable) RCIMIWReferenceInfo *referMsg;

@end

NS_ASSUME_NONNULL_END
