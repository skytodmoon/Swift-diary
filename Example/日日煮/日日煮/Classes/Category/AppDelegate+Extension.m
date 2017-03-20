//
//  AppDelegate+Extension.m
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AppDelegate+Extension.h"
#import "FirstPageViewController.h"
#import "WelcomeViewController.h"

@implementation AppDelegate (Extension)

#pragma mark - 方法
- (void)setupGlobalConfig{

    /** 电池条显示菊花,监测网络活动 */
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    /** 网络状态监测 */
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barTintColor = kRGBColor(253, 183, 154, 1.0);
    [self window];
}

#pragma mark - 懒加载
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        FirstPageViewController *firstPageVC = [[FirstPageViewController alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:firstPageVC];
        NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
        NSString *version = infoDic[@"CFBundleShortVersionString"];
        NSString *runVersion = [[NSUserDefaults standardUserDefaults]stringForKey:@"RunVersion"];
        if (runVersion == nil || ![runVersion isEqualToString:version]) {
            self.window.rootViewController = [WelcomeViewController new];
        }else{
            self.window.rootViewController = navi;
        }
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    return _window;
}

- (AFNetworkReachabilityStatus)netReachStatus{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
}

- (BOOL)isOnLine{
    return self.netReachStatus == AFNetworkReachabilityStatusReachableViaWWAN || self.netReachStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

#pragma mark - 生命周期

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
