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
    [self initAdvView];
    
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
    
    MerchantViewController *mearch = [[MerchantViewController alloc]init];
    UINavigationController *mearchnav = [[UINavigationController alloc]initWithRootViewController:mearch];
    
    MineViewController *mine = [[MineViewController alloc]init];
    UINavigationController *minenav = [[UINavigationController alloc]initWithRootViewController:mine];
    
    home.title =@"团购";
    mearch.title = @"商家";
    mine.title = @"我的";
    
    NSArray *viewCtrs = @[homenav,mearchnav,minenav];
    
    self.rootTabbarCtr = [[UITabBarController alloc]init];
    [self.rootTabbarCtr setViewControllers:viewCtrs animated:YES];
    self.window.rootViewController = self.rootTabbarCtr;
    
    UITabBar *tabbar = self.rootTabbarCtr.tabBar;
    UITabBarItem *item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem *item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem *item3 = [tabbar.items objectAtIndex:2];
    
    item1.selectedImage = [[UIImage imageNamed:@"icon_tabbar_homepage_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"icon_tabbar_homepage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item2.selectedImage = [[UIImage imageNamed:@"icon_tabbar_merchant_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"icon_tabbar_merchant_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item3.selectedImage = [[UIImage imageNamed:@"icon_tabbar_mine_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"icon_tabbar_mine"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(54,185,175), UITextAttributeTextColor,nil] forState:UIControlStateSelected];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.window makeKeyAndVisible];
}

//MARK - 添加启动广告
-(void)initAdvView{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"loading.png"]];
    NSFileManager *fildManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isExit = [fildManager fileExistsAtPath:filePath isDirectory:&isDir];
    if (isExit) {
        _advImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
        [_advImage setImage:[UIImage imageWithContentsOfFile:filePath]];
        [self.window addSubview:_advImage];
        [self performSelector:@selector(removeAdvImage) withObject:nil afterDelay:3];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //加载启动广告并保存到本地沙盒，因为保存的图片较大，每次运行都要保存，所以注掉了
            [self getLoadingImage];
        });
    }else {
        NSLog(@"不存在广告");
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //加载启动广告并保存到本地沙盒，因为保存的图片较大，每次运行都要保存，所以注掉了
            [self getLoadingImage];
        });
    }
}

//MARK: - 移除广告
-(void)removeAdvImage{
    [UIView animateWithDuration:0.3f animations:^{
        _advImage.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
        _advImage.alpha = 0.f;
    }completion:^(BOOL finished) {
        [_advImage removeFromSuperview];
    
    }];
}

//MARK: - 获取启动广告图片，采用后台推送时执行请求
-(void)getLoadingImage{
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    int scaleW = (int)screen_width*scale_screen;
    int scaleH = (int)screen_height*scale_screen;
    
    NSString *urlStr = [NSString stringWithFormat:@"http://api.meituan.com/config/v1/loading/check.json?app_name=group&app_version=5.7&ci=1&city_id=1&client=iphone&movieBundleVersion=100&msid=48E2B810-805D-4821-9CDD-D5C9E01BC98A2015-07-15-15-51824&platform=iphone&resolution=%d%@%d&userid=10086&utm_campaign=AgroupBgroupD100Fa20141120nanning__m1__leftflow___ab_pindaochangsha__a__leftflow___ab_gxtest__gd__leftflow___ab_gxhceshi__nostrategy__leftflow___ab_i550poi_ktv__d__j___ab_chunceshishuju__a__a___ab_gxh_82__nostrategy__leftflow___ab_i_group_5_3_poidetaildeallist__a__b___b1junglehomepagecatesort__b__leftflow___ab_gxhceshi0202__b__a___ab_pindaoquxincelue0630__b__b1___ab_i550poi_xxyl__b__leftflow___ab_i_group_5_6_searchkuang__a__leftflow___i_group_5_2_deallist_poitype__d__d___ab_pindaoshenyang__a__leftflow___ab_b_food_57_purepoilist_extinfo__a__a___ab_waimaiwending__a__a___ab_waimaizhanshi__b__b1___ab_i550poi_lr__d__leftflow___ab_i_group_5_5_onsite__b__b___ab_xinkeceshi__b__leftflowGhomepage&utm_content=4B8C0B46F5B0527D55EA292904FD7E12E48FB7BEA8DF50BFE7828AF7F20BB08D&utm_medium=iphone&utm_source=AppStore&utm_term=5.7&uuid=4B8C0B46F5B0527D55EA292904FD7E12E48FB7BEA8DF50BFE7828AF7F20BB08D&version_name=5.7",scaleW,@"%2A",scaleH];
    
    [[NetworkSingleton sharedManager] getAdvLoadingImage:nil url:urlStr successBlock:^(id responseBody) {
        NSLog(@"获取广告图片成功");
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if (dataArray.count>0) {
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[dataArray[0] objectForKey:@"imageUrl"]]];
                UIImage *image = [UIImage imageWithData:data];
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"loading.png"]];
                [UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];
            }
        });
    } failureBlock:^(NSString *error) {
        NSLog(@"获取广告图片失败: %@",error);
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
