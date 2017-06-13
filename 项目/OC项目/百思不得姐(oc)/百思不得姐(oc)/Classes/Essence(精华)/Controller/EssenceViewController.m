//
//  EssenceViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "EssenceViewController.h"
#import "EssenceBaseViewController.h"
#import "StarViewController.h"
#import "CrossViewController.h"

@interface EssenceViewController ()

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏的内容
    [self setupNavigationBar];
    
    //添加所有的子控制器
    [self addAllChildViewController];
    
    self.topTitleBtn = 6;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置导航栏的内容
- (void)setupNavigationBar
{
    //设置navigationItem.titleView的标题
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置左边按钮，调用UITabBarItem+Category.h里面的类方法，可直接设置按钮样式
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_item_game_icon~iphone" hightImage:@"nav_item_game_iconN~iphone" target:self action:@selector(gameClick)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"RandomAcross~iphone" hightImage:@"RandomAcrossClick~iphone" target:self action:@selector(crossClick)];
    
}

//添加所有的子控制器
- (void)addAllChildViewController
{
    
    //推荐
    EssenceBaseViewController *allVc = [[EssenceBaseViewController alloc]init];
    allVc.title = @"推荐";
    allVc.URL = EssenceRecommendURL;
    [self addChildViewController:allVc];
    
    //视频
    EssenceBaseViewController *videoVc = [[EssenceBaseViewController alloc]init];
    videoVc.title = @"视频";
    videoVc.URL = EssenceVideoURL;
    [self addChildViewController:videoVc];
    
    //图片
    EssenceBaseViewController *pictureVc = [[EssenceBaseViewController alloc]init];
    pictureVc.title = @"图片";
    pictureVc.URL = EssencePictureURL;
    [self addChildViewController:pictureVc];
    
    //段子
    EssenceBaseViewController *textVc = [[EssenceBaseViewController alloc]init];
    textVc.title = @"段子";
    textVc.URL = EssenceTextURL;
    [self addChildViewController:textVc];
    
    //网红
    EssenceBaseViewController *starVc = [[EssenceBaseViewController alloc]init];
    starVc.title = @"网红";
    starVc.URL = EssenceStartURL;
    [self addChildViewController:starVc];
    
    //排行
    EssenceBaseViewController *rankingVc = [[EssenceBaseViewController alloc]init];
    rankingVc.title = @"排行";
    rankingVc.URL = EssenceListsURL;
    [self addChildViewController:rankingVc];
    
    //社会
    EssenceBaseViewController *societyVc = [[EssenceBaseViewController alloc]init];
    societyVc.title = @"社会";
    societyVc.URL = EssenceSocietyURL;
    [self addChildViewController:societyVc];
    
    //美女
    EssenceBaseViewController *girlVc = [[EssenceBaseViewController alloc]init];
    girlVc.title = @"美女";
    girlVc.URL = EssenceGirlURL;
    [self addChildViewController:girlVc];
    
    //游戏
    EssenceBaseViewController *gameVc = [[EssenceBaseViewController alloc]init];
    gameVc.title = @"游戏";
    gameVc.URL = EssenceGameURL;
    [self addChildViewController:gameVc];
    
    
}


//点击导航栏左边按钮进入红人榜界面
- (void)gameClick
{
    StarViewController *star = [[StarViewController alloc]init];
    [self.navigationController pushViewController:star animated:YES];
}

//点击导航栏右边按钮进入穿越界面
- (void)crossClick
{
    CrossViewController *cross = [[CrossViewController alloc]init];
    [self.navigationController pushViewController:cross animated:YES];
}

@end
