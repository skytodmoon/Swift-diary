//
//  AppDelegate.m
//  美团
//
//  Created by 金亮齐 on 2017/6/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate ()<CLLocationManagerDelegate>{
    //定位
    CLLocationManager *_locationManager;
    CLLocation *_checkLoaction;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupLoactionManager];
    [self initRootVC];
    
    return YES;
}

//MARK: - 设置定位
-(void)setupLoactionManager{
    _latitude = LATITUDE_DEFAULT;
    _longitude = LONGITUDE_DEFAULT;
    _locationManager = [[CLLocationManager alloc]init];
    
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"开始定位");
        _locationManager.delegate = self;
        _locationManager.distanceFilter = 200.0;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        if (IOS_VERSION >=8.0) {
            [_locationManager requestWhenInUseAuthorization];
            [_locationManager requestAlwaysAuthorization];
        }
        [_locationManager startUpdatingHeading];
    }else{
        NSLog(@"定位失败");
    }
}
//MARK: - 设置根控制器
-(void)initRootVC{
    
    self.window.hidden = NO;
    
    HomeViewController *home = [[HomeViewController alloc]init];
    UINavigationController *homenav = [[UINavigationController alloc]initWithRootViewController:home];
    
    OnSiteViewController *onsite = [[OnSiteViewController alloc]init];
    UINavigationController *onsitenav = [[UINavigationController alloc]initWithRootViewController:onsite];
    
    MerchantViewController *mearch = [[MerchantViewController alloc]init];
    UINavigationController *mearchnav = [[UINavigationController alloc]initWithRootViewController:mearch];
    
    MineViewController *mine = [[MineViewController alloc]init];
    UINavigationController *minenav = [[UINavigationController alloc]initWithRootViewController:mine];
    
    home.title =@"团购";
    onsite.title=@"上门";
    mearch.title = @"商家";
    mine.title = @"我的";
    
    NSArray *viewCtrs = @[homenav,onsitenav,mearchnav,minenav];
    
    self.rootTabbarCtr = [[UITabBarController alloc]init];
    [self.rootTabbarCtr setViewControllers:viewCtrs animated:YES];
    self.window.rootViewController = self.rootTabbarCtr;
    
    UITabBar *tabbar = self.rootTabbarCtr.tabBar;
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    UITabBarItem *item4 = [tabbar.items objectAtIndex:3];
    
    item1.selectedImage = [[UIImage imageNamed:@"icon_tabbar_homepage_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"icon_tabbar_homepage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.selectedImage = [[UIImage imageNamed:@"icon_tabbar_onsite_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"icon_tabbar_onsite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item3.selectedImage = [[UIImage imageNamed:@"icon_tabbar_merchant_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"icon_tabbar_merchant_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item4.selectedImage = [[UIImage imageNamed:@"icon_tabbar_mine_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.image = [[UIImage imageNamed:@"icon_tabbar_mine"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(54,185,175), UITextAttributeTextColor,nil] forState:UIControlStateSelected];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.window makeKeyAndVisible];
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
