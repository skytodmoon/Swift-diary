//
//  QJLNewViewController.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLNewViewController.h"
#import "UIBarButtonItem+QJLExtension.h"

@interface QJLNewViewController ()

@end

@implementation QJLNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QJLlobalBg;
    /**
     *  设置导航栏内容
     */
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    /**
     *  导航栏左边的按钮
     */
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagButtonClick)];
}

#pragma mark 导航栏左边的按钮点击
-(void)tagButtonClick {
    QJLLog(@"%s",__func__);
}


@end
