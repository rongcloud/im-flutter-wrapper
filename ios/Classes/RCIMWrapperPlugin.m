//
//  RCIMWrapperPlugin.m
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#import "RCIMWrapperPlugin.h"
#import "RCIMWrapperEngine.h"
#import <RongIMLibCore/RongIMLibCore.h>

static NSString * const VER = @"5.20.1";

@implementation RCIMWrapperPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  [[RCIMWrapperEngine sharedInstance] registerWithRegistrar:registrar];
}

+ (void)load {
    [RCUtilities setModuleName:@"imwrapperflutter" version:[self getVersion]];
}

+ (NSString *) getVersion {
    return VER;
}

@end
