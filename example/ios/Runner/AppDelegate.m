#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <UserNotifications/UserNotifications.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
            UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            center.delegate = self;
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (granted) {
                    //点击允许
                    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {

                    }];

                } else {

                }
            }];
        }else if ([[UIDevice currentDevice].systemVersion floatValue] >8.0){
            //iOS8 - iOS10
            [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge categories:nil]];
        }

        // 注册获得device Token
        [application registerForRemoteNotifications];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    [application registerForRemoteNotifications];
}


@end
