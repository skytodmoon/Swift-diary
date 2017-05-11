//
//  MainNavigationController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

+ (void)initialize
{
    // 设置BarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    NSMutableDictionary *normal = [NSMutableDictionary dictionary];
    normal[NSForegroundColorAttributeName] = Color(239, 116, 8);
    normal[NSFontAttributeName] = [UIFont systemFontOfSize:15.0];
    [item setTitleTextAttributes:normal forState:UIControlStateNormal];
    
    NSMutableDictionary *disabled = [NSMutableDictionary dictionary];
    disabled[NSForegroundColorAttributeName] = Color(111, 111, 111);
    disabled[NSFontAttributeName] = [UIFont systemFontOfSize:15.0];
    [item setTitleTextAttributes:disabled forState:UIControlStateDisabled];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
