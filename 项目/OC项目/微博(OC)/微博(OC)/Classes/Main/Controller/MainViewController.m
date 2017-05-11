//
//  MainViewController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MainViewController.h"
#import "TabBarView.h"
#import "SendStatusViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"
#import "MainNavigationController.h"

@interface MainViewController ()<TabBarViewDelegate>
@property (nonatomic, strong) TabBarView *tabBarView;
@property (nonatomic, strong) UIViewController *vc;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    [self setupTabBarView];

    [self setupAllChildViewControllers];
    // Do any additional setup after loading the view.
}

//MARK: -   自定义tabBarView
- (void)setupTabBarView
{
    TabBarView *tabBarView = [[TabBarView alloc] init];
    tabBarView.frame = self.tabBar.bounds;
    tabBarView.delegate = self;
    [self.tabBar addSubview:tabBarView];
    self.tabBarView = tabBarView;
}

//MARK: -  - TabBarViewDelegate
- (void)tabBarView:(TabBarView *)tabBarView didSelectedButtonFrom:(int)from to:(int)to
{

    self.selectedIndex = to;
}

- (void)tabBarViewSendStatus:(TabBarView *)tabBarView
{
    SendStatusViewController *sendStatus = [[SendStatusViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sendStatus];
    sendStatus.title = @"发微博";
    [self presentViewController:nav animated:YES completion:nil];
}

//MARK: -   删除自带按钮
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}


//MARK: -  初始化所有子控制器
- (void)setupAllChildViewControllers
{
    HomeViewController *home = [[HomeViewController alloc] init];
    home.tabBarItem.badgeValue = @"2";
    [self setupChildViewController:home title:@"首页"
                         imageName:@"tabbar_home"
                 selectedImageName:@"tabbar_home_selected"];
    
    MessageViewController *message = [[MessageViewController alloc] init];
    message.tabBarItem.badgeValue = @"16";
    [self setupChildViewController:message title:@"消息"
                         imageName:@"tabbar_message_center"
                 selectedImageName:@"tabbar_message_center_selected"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    discover.tabBarItem.badgeValue = @"new";
    self.vc = discover;
    [self setupChildViewController:discover title:@"发现"
                         imageName:@"tabbar_discover"
                 selectedImageName:@"tabbar_discover_selected"];
    
    MeViewController *me = [[MeViewController alloc] init];
    [self setupChildViewController:me title:@"我"
                         imageName:@"tabbar_profile"
                 selectedImageName:@"tabbar_profile_selected"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

/**
 *  初始化一个子控制器
 *
 *  @param VC                子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中图片
 */
- (void)setupChildViewController:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{

    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
    [self.tabBarView addTabBarButtonWithItem:VC.tabBarItem];
}


@end
