//
//  JZOnSiteViewController.m
//  美团
//
//  Created by 金亮齐 on 2017/6/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "OnSiteViewController.h"

@interface OnSiteViewController ()

@end

@implementation OnSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(screen_width/2-50, screen_height/2, 100, 30)];
    text.text = @"敬请期待";
    text.textColor = [UIColor whiteColor];
    text.font = [UIFont systemFontOfSize:15];
    text.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:text];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
