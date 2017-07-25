//
//  AppDelegate.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "EntryViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    EntryViewController *entry = [[EntryViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:entry];
    [nav setNavigationBarHidden:YES];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    [self setupShareSDK];
    return YES;
}

- (void)showMainViewController
{
    MainViewController* mainVC = [[MainViewController alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [nav setNavigationBarHidden:YES];
    self.window.rootViewController = nav;
}

+ (AppDelegate*)shareAppDelegate
{
    return [UIApplication sharedApplication].delegate;
}

#pragma mark - 设置第三方登陆信息
- (void)setupShareSDK
{
    
    
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeSinaWeibo),
                                        @(SSDKPlatformTypeWechat),
                                        @(SSDKPlatformTypeQQ),
                                        ]
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
             default:
                 break;
         }
     }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"1234171392"
                                           appSecret:@"0cf8bc17a50102cd755c4cd85684c4a1"
                                         redirectUri:@"http://www.baidu.com"
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx2aaa2d1871fa3bb4"
                                       appSecret:@"1c72adc1f0150c6c5c4d0de4cbb9613e"];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1104984866"
                                      appKey:@"HpGu2fsbpohnbw3F"
                                    authType:SSDKAuthTypeBoth];
                 break;
                 
                 
             default:
                 break;
         }
         
     }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
