//
//  NavigationController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

+(void)initialize {
    
    
    UIBarButtonItem *item= [UIBarButtonItem appearance];
    
    //设置导航栏按钮字体颜色
    NSMutableDictionary *textArr = [NSMutableDictionary dictionary];
    
    textArr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textArr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    [item setTitleTextAttributes:textArr forState:UIControlStateNormal];
    
    //不可选中状态
    NSMutableDictionary *disableTextArr = [NSMutableDictionary dictionary];
    
    disableTextArr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disableTextArr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    [item setTitleTextAttributes:disableTextArr forState:UIControlStateDisabled];
    
    
}




-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [super pushViewController:viewController animated:animated];
    
    if (self.viewControllers.count > 1) {
        
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" heighlightImage:@"navigationbar_back_highlighted"];
        
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" heighlightImage:@"navigationbar_more_highlighted"];
    }
    
    
    
    
}


-(void)back {
    
    [self popViewControllerAnimated:YES];
    
}

-(void)more {
    
    [self popToRootViewControllerAnimated:YES];
    
}

@end
