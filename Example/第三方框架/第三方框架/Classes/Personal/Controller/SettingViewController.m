//
//  SettingViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SettingViewController.h"
#import "PrefixHeader.pch"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    // Do any additional setup after loading the view.
}

-(void)initNav{
    //创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screen_width, 66)];
    //把导航栏集合添加到导航栏中，设置动画关闭，设置颜色
    [navBar pushNavigationItem:[self navItem] animated:NO];
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:RGBA(26,198,180,1)];
    [self.view addSubview:navBar];
}

-(UINavigationItem *)navItem{
    // 创建一个导航项
    UINavigationItem *navigationItem = [[UINavigationItem alloc]
                                        initWithTitle:@"设置"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    return navigationItem;
}



@end
