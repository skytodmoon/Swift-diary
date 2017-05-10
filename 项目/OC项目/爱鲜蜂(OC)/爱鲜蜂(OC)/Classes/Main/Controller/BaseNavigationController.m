//
//  BaseNavigationController.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()
@property (nonatomic,strong) UIButton *backBtn;
@end

@implementation BaseNavigationController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.backBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"v2_goback"] forState:UIControlStateNormal];
        btn.titleLabel.hidden = YES;
        [btn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.contentHorizontalAlignment  = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        btn.frame = CGRectMake(0, 0, 44, 40);
        btn;
    });
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backBtnClicked:(UIButton *)btn {
    [self popViewControllerAnimated:YES];
}

@end
