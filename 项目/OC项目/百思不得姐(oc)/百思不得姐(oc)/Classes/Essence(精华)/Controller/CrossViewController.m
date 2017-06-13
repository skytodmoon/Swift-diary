//
//  CrossViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "CrossViewController.h"

#import "EssenceBaseViewController.h"
#import <MJRefresh/MJRefresh.h>


@interface CrossViewController ()
@property (nonatomic,strong) EssenceBaseViewController *all;
@end

@implementation CrossViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏样式
    [self setupNavigationItem];
    
    [self addCrossViewController];
    
    self.topTitleBtn = 5;
}

//设置导航栏样式
- (void)setupNavigationItem
{
    self.view.backgroundColor = RandomColor;
    self.navigationItem.title = @"穿越";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"RandomAcross~iphone" hightImage:@"RandomAcrossClick~iphone" target:self action:@selector(crossClick)];
}

//添加子控制器
- (void)addCrossViewController
{
    
    //全部
    EssenceBaseViewController *all = [[EssenceBaseViewController alloc]init];
    all.title = @"全部";
    self.all = all;
    all.URL = ThroughAllURL;
    [self addChildViewController:all];
    
    //视频
    EssenceBaseViewController *video = [[EssenceBaseViewController alloc]init];
    video.title = @"视频";
    video.URL = ThroughVideoURL;
    [self addChildViewController:video];
    
    //图片
    EssenceBaseViewController *picture = [[EssenceBaseViewController alloc]init];
    picture.title = @"图片";
    picture.URL = ThroughPictureURL;
    [self addChildViewController:picture];
    
    //段子
    EssenceBaseViewController *text = [[EssenceBaseViewController alloc]init];
    text.title = @"段子";
    text.URL = ThroughTextURL;
    [self addChildViewController:text];
    
    //声音
    EssenceBaseViewController *sound = [[EssenceBaseViewController alloc]init];
    sound.title = @"声音";
    sound.URL = ThroughSoundURL;
    [self addChildViewController:sound];
}

- (void)crossClick
{
    //发出一个通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TabBarDidSelectNotification" object:nil userInfo:nil];
}


@end
