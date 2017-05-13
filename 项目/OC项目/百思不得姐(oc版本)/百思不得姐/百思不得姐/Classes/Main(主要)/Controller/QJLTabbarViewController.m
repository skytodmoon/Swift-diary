//
//  QJLTabbarViewController.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLTabbarViewController.h"
#import "QJLNavigationController.h"
#import "QJLEssenceViewController.h"
#import "QJLNewViewController.h"
#import "QJLFriendTrendsViewController.h"
#import "QJLMeViewController.h"
#import "QJLTabBar.h"

@interface QJLTabbarViewController ()

@end

@implementation QJLTabbarViewController

+(void)initialize {
 
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    //通过appearacne统一设置TabbarItem的样式
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self setChildController:[[QJLEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setChildController:[[QJLNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setChildController:[[QJLFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    //上面三个控制都是继承UIViewController
    //我的页面就不用了，只有继承UITableViewController
    [self setChildController:[[QJLMeViewController alloc] initWithStyle:UITableViewStyleGrouped] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    //添加自定义的tabbar
    [self setValue:[[QJLTabBar alloc] init] forKey:@"tabBar"];
}
/**
 *  初始化子控制器
 *
 *  @param vc            控制器
 *  @param title         名称
 *  @param image         默认图片
 *  @param selectedImage 选中图片
 */
-(void)setChildController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    //设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //包装一个导航控制器，添加导航控制器为tabbarController的子控制器
    QJLNavigationController *nav = [[QJLNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
