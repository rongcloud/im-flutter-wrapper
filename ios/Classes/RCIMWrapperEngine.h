//
//  RCIMWrapperEngine.h
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#import <Flutter/Flutter.h>
#import <Foundation/Foundation.h>
#import <RongIMWrapper/RongIMWrapper.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMWrapperEngine : NSObject <FlutterPlugin, RCIMIWEngineDelegate>

+ (instancetype)sharedInstance;
- (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;

@end

NS_ASSUME_NONNULL_END
