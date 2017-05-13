//
//  SelectedAdressViewController.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SelectedAdressViewController.h"


@interface SelectedAdressViewController ()

@end

@implementation SelectedAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildNavigationBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItem:@"扫一扫" image:@"icon_black_scancode" target:self action:@selector(LeftItemButtonClicket) type:LeftItemButton];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItem:@"搜索" image:@"icon_search" target:self action:@selector(rightBarButtonClick) type:RightItemButton];
    
    self.navigationController.navigationBar.barTintColor = GeneralColor;
}

/**
 *  将要显示进入控制器调用
 */
- (void)viewWillAppear:(BOOL)animated
{
    
}

#pragma callBack method
- (void)LeftItemButtonClicket{
    
}
- (void)rightBarButtonClick{
    
}


@end
