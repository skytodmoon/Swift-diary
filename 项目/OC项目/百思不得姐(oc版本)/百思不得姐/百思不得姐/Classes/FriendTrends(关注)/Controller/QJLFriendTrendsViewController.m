//
//  QJLFriendTrendsViewController.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLFriendTrendsViewController.h"
#import "UIBarButtonItem+QJLExtension.h"
#import "QJLRecommandViewController.h"
#import "QJLLoginRegisterController.h"


@interface QJLFriendTrendsViewController ()

@end

@implementation QJLFriendTrendsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self Nav];
    // Do any additional setup after loading the view from its nib.
}

-(void)Nav{
    
    self.view.backgroundColor = QJLlobalBg;
    //设置导航栏内容
    self.navigationItem.title = @"我的关注";
    //导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsRecButtonClick)];
}

#pragma mark 导航栏左边的按钮点击
-(void)friendsRecButtonClick {
    QJLRecommandViewController *recommandVC = [[QJLRecommandViewController alloc] init];
    recommandVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:recommandVC animated:YES];
}

- (IBAction)loginRegister:(UIButton *)sender {
    QJLLoginRegisterController *login = [[QJLLoginRegisterController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}



@end
