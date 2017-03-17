//
//  MainViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "MainNavigationController.h"

@interface MainViewController ()

@end

@implementation MainViewController


+(void)initialize{

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildVC];
    // Do any additional setup after loading the view.
}

- (void)setUpChildVC{
    
    /** 添加子控制器 */
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"bottom_tab1_unpre" selectedImage:@"bottom_tab1_pre"];
    
//    [self setupChildVc:[[FoundViewController alloc] init] title:@"发现" image:@"found" selectedImage:@"foundSeletced" ];
//    
//    [self setupChildVc:[[MoreViewController alloc] init] title:@"更多" image:@"more" selectedImage:@"moreSeletced"];
//    
    [self setupChildVc:[[ProfileViewController alloc] init] title:@"我" image:@"bottom_tab2_unpre" selectedImage:@"bottom_tab2_pre"];
    
}

/* 初始化子控制器 **/
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 添加为子控制器
    [self addChildViewController:vc];
    //     取消选中时的背景色
    vc.tabBarItem.selectedImage = [vc.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //改变UITabBarItem字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:navigationBarColor,UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    
    
    //包装一个导航控制器，添加导航控制器为tabbarController的子控制器
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

@end
