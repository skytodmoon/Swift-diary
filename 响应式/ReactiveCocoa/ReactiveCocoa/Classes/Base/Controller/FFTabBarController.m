//
//  FFTabBarController.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFTabBarController.h"
#import "FFNavController.h"
#import "FFTabBarViewModel.h"

@implementation FFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self)
    [RACObserve(self, viewModel) subscribeNext:^(FFTabBarViewModel *viewModel) {
        @strongify(self)
        [self addChildViewControllerWithViewModel:viewModel.specialViewModel];
        [self addChildViewControllerWithViewModel:viewModel.authorViewModel];
        [self addChildViewControllerWithViewModel:viewModel.shopViewModel];
    }];
    // Do any additional setup after loading the view.
}


- (void)addChildViewControllerWithViewModel:(FFViewModel *)viewModel {
    
    Class vcClass = NSClassFromString(viewModel.viewcontroller);
    UIViewController *viewcontroller = [[vcClass alloc] initWithViewModel:viewModel];
    if (!viewcontroller) { return;}
    FFNavController *nav = [[FFNavController alloc]initWithRootViewController:viewcontroller];
    viewcontroller.navigationItem.title = viewModel.tabTitle;
    viewcontroller.tabBarItem.title = viewModel.tabTitle;
    viewcontroller.tabBarItem.image= [[UIImage imageNamed:viewModel.tabIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewcontroller.tabBarItem.selectedImage= [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",viewModel.tabIcon]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

@end
