//
//  NewViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NewViewController.h"
#import "LoginRegisterViewController.h"
#import "EssenceBaseViewController.h"


@interface NewViewController ()

@end

@implementation NewViewController

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航栏的内容
    [self setupNavigationBar];
    
    //添加所有的子控制器
    [self addAllChildViewController];
    
    self.topTitleBtn = 6;
    
    
}

//设置导航栏的内容
- (void)setupNavigationBar
{
    //设置背景颜色
    self.view.backgroundColor = CommonBgColor;
    //设置navigationItem.titleView的标题
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //设置左边按钮，调用UITabBarItem+Category.h里面的类方法，可直接设置按钮样式
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"review_post_nav_icon~iphone" hightImage:@"review_post_nav_iconN~iphone@2x" target:self action:@selector(leftBtnClick)];
    
}


//添加所有的子控制器
- (void)addAllChildViewController
{
    
    //全部
    EssenceBaseViewController *allVc = [[EssenceBaseViewController alloc]init];
    allVc.title = @"全部";
    allVc.URL = NewAllURL;
    [self addChildViewController:allVc];
    
    //视频
    EssenceBaseViewController *videoVc = [[EssenceBaseViewController alloc]init];
    videoVc.title = @"视频";
    videoVc.URL = NewVideoURL;
    [self addChildViewController:videoVc];
    
    //图片
    EssenceBaseViewController *pictureVc = [[EssenceBaseViewController alloc]init];
    pictureVc.title = @"图片";
    pictureVc.URL = NewPictureURL;
    [self addChildViewController:pictureVc];
    
    //段子
    EssenceBaseViewController *textVc = [[EssenceBaseViewController alloc]init];
    textVc.title = @"段子";
    textVc.URL = NewTextURL;
    [self addChildViewController:textVc];
    
    //网红
    EssenceBaseViewController *starVc = [[EssenceBaseViewController alloc]init];
    starVc.title = @"网红";
    starVc.URL = NewStartURL;
    [self addChildViewController:starVc];
    
    //美女
    EssenceBaseViewController *girlVc = [[EssenceBaseViewController alloc]init];
    girlVc.title = @"美女";
    girlVc.URL = NewGirlURL;
    [self addChildViewController:girlVc];
    
    //游戏
    EssenceBaseViewController *gameVc = [[EssenceBaseViewController alloc]init];
    gameVc.title = @"游戏";
    gameVc.URL = NewGameURL;
    [self addChildViewController:gameVc];
    
    //声音
    EssenceBaseViewController *soundVc = [[EssenceBaseViewController alloc]init];
    soundVc.title = @"声音";
    soundVc.URL = NewSoundURL;
    [self addChildViewController:soundVc];
    
}

//左边按钮事件处理
- (void)leftBtnClick
{
    LoginRegisterViewController *recommend = [[LoginRegisterViewController alloc]init];
    [self.navigationController presentViewController:recommend animated:YES completion:nil];
}


@end
