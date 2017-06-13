//
//  StarViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "StarViewController.h"
#import "RedStartViewController.h"
#import "FansCountViewController.h"
#import "FansFastestViewController.h"
#import "ContributionViewController.h"
@interface StarViewController ()

@end

@implementation StarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RandomColor;
    self.navigationItem.title = @"红人榜";
    self.topTitleBtn = 4;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"comment_nav_item_share_icon" hightImage:@"comment_nav_item_share_icon_click" target:self action:@selector(share)];
    //添加所有的子控制器
    [self addAllChildViewController];
}

//添加所有的子控制器
- (void)addAllChildViewController
{
    
    //红人榜
    RedStartViewController *startView = [[RedStartViewController alloc]init];
    startView.title = @"红人榜";
    [self addChildViewController:startView];
    
    //涨粉最快
    FansFastestViewController *fansFastest = [[FansFastestViewController alloc]init];
    fansFastest.title = @"涨粉最快";
    [self addChildViewController:fansFastest];
    
    //贡献榜
    ContributionViewController *contribution = [[ContributionViewController alloc]init];
    contribution.title = @"贡献榜";
    [self addChildViewController:contribution];
    
    //粉丝总数
    FansCountViewController *fansCount = [[FansCountViewController alloc]init];
    fansCount.title = @"粉丝总数";
    [self addChildViewController:fansCount];
    
    
}





- (void)share
{
    LogFunc
}


@end
