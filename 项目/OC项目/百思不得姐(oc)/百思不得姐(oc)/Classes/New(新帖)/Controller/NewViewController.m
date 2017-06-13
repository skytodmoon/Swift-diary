//
//  NewViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NewViewController.h"
#import "LoginRegisterViewController.h"
#import "EssenceViewController.h"
#import "ContributionViewController.h"
#import "FansCountViewController.h"
#import "FansFastestViewController.h"

@interface NewViewController ()
@property (nonatomic, weak) TGSementBarVC *segmentBarVC;
@end

@implementation NewViewController


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;//UIStatusBarStyleDefault;
}

- (TGSementBarVC *)segmentBarVC {
    if (!_segmentBarVC) {
        TGSementBarVC *vc = [[TGSementBarVC alloc] init];
        [self addChildViewController:vc];
        _segmentBarVC = vc;
    }
    return _segmentBarVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加所有的子控制器
    [self addAllChildViewController];
    
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
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35);
    //设置segmentBarVC大小
    self.segmentBarVC.view.frame = self.view.bounds;
    //使用segmentBarVC
    [self.view addSubview:self.segmentBarVC.view];
    NSArray *items = @[@"全部", @"视频", @"图片", @"段子",@"互动区",@"相册",@"网红",@"投票",@"美女",@"冷知识",@"游戏",@"声音"];
    NSMutableArray* childVCs = [NSMutableArray array];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[FansCountViewController alloc] init]];
//    [childVCs addObject:[[FansFastestViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
//    [childVCs addObject:[[EssenceViewController alloc] init]];
    
    [self.segmentBarVC setupWithItems:items childVCs:childVCs];
    
    [self.segmentBarVC.segmentBar updateViewWithConfig:^(TGSegmentConfig *config) {
        config.selectedColor([UIColor lightTextColor])
        .normalColor([UIColor lightTextColor])
        //选中字体大于其他正常标签的字体的情况下，根据情况稍微调大margin（默认8），以免选中的字体变大后挡住其他正常标签的内容
        .selectedFont([UIFont systemFontOfSize:14])
        .normalFont([UIFont systemFontOfSize:13])
        .indicateExtraW(8)
        .indicateH(2)
        .indicateColor([UIColor whiteColor])
        .showMore(YES)
        .moreCellBGColor([[UIColor grayColor] colorWithAlphaComponent:0.3])
        .moreBGColor([UIColor clearColor])
        .moreCellFont([UIFont systemFontOfSize:13])
        .moreCellTextColor(NavTinColor)
        .moreCellMinH(30)
        .showMoreBtnlineView(YES)
        .moreBtnlineViewColor([UIColor lightTextColor])
        .moreBtnTitleFont([UIFont systemFontOfSize:13])
        .moreBtnTitleColor([UIColor lightTextColor])
        .margin(18)
        .barBGColor(NavTinColor)
        ;
    }];
    
    //设置导航栏的内容
    [self setupNavigationBar];
    
//    //全部
//    EssenceBaseViewController *allVc = [[EssenceBaseViewController alloc]init];
//    allVc.title = @"全部";
//    allVc.URL = NewAllURL;
//    [self addChildViewController:allVc];
//    
//    //视频
//    EssenceBaseViewController *videoVc = [[EssenceBaseViewController alloc]init];
//    videoVc.title = @"视频";
//    videoVc.URL = NewVideoURL;
//    [self addChildViewController:videoVc];
//    
//    //图片
//    EssenceBaseViewController *pictureVc = [[EssenceBaseViewController alloc]init];
//    pictureVc.title = @"图片";
//    pictureVc.URL = NewPictureURL;
//    [self addChildViewController:pictureVc];
//    
//    //段子
//    EssenceBaseViewController *textVc = [[EssenceBaseViewController alloc]init];
//    textVc.title = @"段子";
//    textVc.URL = NewTextURL;
//    [self addChildViewController:textVc];
//    
//    //网红
//    EssenceBaseViewController *starVc = [[EssenceBaseViewController alloc]init];
//    starVc.title = @"网红";
//    starVc.URL = NewStartURL;
//    [self addChildViewController:starVc];
//    
//    //美女
//    EssenceBaseViewController *girlVc = [[EssenceBaseViewController alloc]init];
//    girlVc.title = @"美女";
//    girlVc.URL = NewGirlURL;
//    [self addChildViewController:girlVc];
//    
//    //游戏
//    EssenceBaseViewController *gameVc = [[EssenceBaseViewController alloc]init];
//    gameVc.title = @"游戏";
//    gameVc.URL = NewGameURL;
//    [self addChildViewController:gameVc];
//    
//    //声音
//    EssenceBaseViewController *soundVc = [[EssenceBaseViewController alloc]init];
//    soundVc.title = @"声音";
//    soundVc.URL = NewSoundURL;
//    [self addChildViewController:soundVc];
    
}

//左边按钮事件处理
- (void)leftBtnClick
{
    LoginRegisterViewController *recommend = [[LoginRegisterViewController alloc]init];
    [self.navigationController presentViewController:recommend animated:YES completion:nil];
}





@end
