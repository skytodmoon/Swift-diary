//
//  MainTabBarController.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "FlashViewController.h"
#import "ShoppingViewController.h"
#import "MyViewController.h"
#import "BaseNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMainTabBarController];
    [self addNotification];
    // Do any additional setup after loading the view.
}

- (void)addMainTabBarController
{
    
    
    [self setupChildViewController:@"首页" viewController:[HomeViewController new] image:@"v2_home" selectedImage:@"v2_home_r"];
    [self setupChildViewController:@"闪电超市" viewController:[FlashViewController new] image:@"v2_order" selectedImage:@"v2_order_r"];
    [self setupChildViewController:@"购物车" viewController:[ShoppingViewController new] image:@"shopCart" selectedImage:@"shopCart_r"];
    [self setupChildViewController:@"我的" viewController:[MyViewController new] image:@"v2_my" selectedImage:@"v2_my_r"];
    
}
- (void)addNotification{
    [Notification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
}
- (void)IncreaseShoppingCart{
    UIViewController *shoppingVC = self.childViewControllers[2];
    NSInteger shoppingIndex = [[UserShopCarTool sharedInstance]getShopCarGoodsNumber];
    if (shoppingIndex == 0) {
        shoppingVC.tabBarItem.badgeValue = nil;
        return;
    }
    shoppingVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd",shoppingIndex];
}
- (void)dealloc{
    [Notification removeObserver:self];
}

- (void)setupChildViewController:(NSString *)title viewController:(UIViewController *)controller image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = [UIImage imageNamed:image];
    item.selectedImage = [UIImage imageNamed:selectedImage];
    item.title = title;
    controller.tabBarItem = item;
    controller.title = title;
    BaseNavigationController *naController = [[BaseNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:naController];
}


@end
