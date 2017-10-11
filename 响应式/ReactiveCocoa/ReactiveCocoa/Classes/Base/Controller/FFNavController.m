//
//  FFNavController.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFNavController.h"

@implementation FFNavController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE_16],NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    self.navigationBar.barTintColor = kNavBarTintColor;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        [self setBackItem:viewController];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)setBackItem:(UIViewController *)vc {
    self.interactivePopGestureRecognizer.delegate = nil;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(s_backAction)];
    vc.navigationItem.leftBarButtonItem = back;
}

-(void)s_backAction {
    if (self.presentingViewController != nil) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }else{
        [self popViewControllerAnimated:YES];
    }
}

@end
