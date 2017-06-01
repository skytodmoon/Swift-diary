//
//  TabBarViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavgationController.h"
#import "HomeViewController.h"
#import "LiveViewController.h"
#import "FocusOnViewController.h"
#import "MeViewController.h"
#import "LivePlayViewController.h"


@interface TabBarViewController ()

@end

@implementation TabBarViewController

+ (void)initialize {
    [UITabBar appearance].tintColor = [UIColor orangeColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化子控制器
    [self setupChildViewControllers];
    
    self.selectedIndex = 0;
    // Do any additional setup after loading the view.
}

- (void)setupChildViewControllers {
    
    //MARK : - 首页
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    [self addChileVcWithTitle:@"首页" vc:homeVc imageName:@"btn_home_normal_24x24_" selImageName:@"btn_home_selected_24x24_"];
    
    //MARK : - 直播
    LiveViewController *liveVc = [[LiveViewController alloc] init];
    [liveVc setUpContentViewFrame:^(UIView *contentView) {
        contentView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    }];
    [self addChileVcWithTitle:@"直播" vc:liveVc imageName:@"btn_column_normal_24x24_" selImageName:@"btn_column_selected_24x24_"];
    
    //MARK : - 关注
    FocusOnViewController *focusOnVc = [[FocusOnViewController alloc] init];
    [self addChileVcWithTitle:@"关注" vc:focusOnVc imageName:@"btn_live_normal_30x24_" selImageName:@"btn_live_selected_30x24_"];
    
    //MARK : - 我的
    MeViewController *meVc = [[MeViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self addChileVcWithTitle:@"我的" vc:meVc imageName:@"btn_user_normal_24x24_" selImageName:@"btn_user_selected_24x24_"];
}

- (void)addChileVcWithTitle:(NSString *)title vc:(UIViewController *)vc imageName:(NSString *)imageName selImageName:(NSString *)selImageName {
    [vc.tabBarItem setTitle:title];
    [vc.tabBarItem setImage:[UIImage imageNamed:imageName]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:selImageName]];
    vc.tabBarItem.selectedImage = [vc.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NavgationController *navVc = [[NavgationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
}

//MARK : - 哪些页面支持自动转屏
- (BOOL)shouldAutorotate{
    
    UINavigationController *nav = self.viewControllers[self.selectedIndex];
    
    if ([nav.topViewController isKindOfClass:[LivePlayViewController class]]) {
        return YES;
    }
    return NO;
}

//MARK : -  viewcontroller支持哪些转屏方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    UINavigationController *nav = self.viewControllers[self.selectedIndex];
    if ([nav.topViewController isKindOfClass:[LivePlayViewController class]]) {
        LivePlayViewController *liveVc = (LivePlayViewController *)nav.topViewController;
        //MARK : - 判断如果直播控制器点击了，锁定屏幕的话，就禁止竖屏
        if (liveVc.isLock) {
            return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
        }
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    //MARK : - 其他页面
    return UIInterfaceOrientationMaskPortrait;
}



@end
