//
//  QJLBaseNavigationController.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLBaseNavigationController.h"
#import "UIApplication+QJLLoad.h"
#import "QJLSelectStageViewController.h"

@interface QJLBaseNavigationController ()

@end

@implementation QJLBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[QJLSelectStageViewController class]]) {
        [UIApplication loading];
        [super pushViewController:viewController animated:YES];
    } else {
        [super pushViewController:viewController animated:NO];
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [UIApplication unLoading];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    NSArray *array = [super popToRootViewControllerAnimated:NO];
    
    return array;
}


@end
