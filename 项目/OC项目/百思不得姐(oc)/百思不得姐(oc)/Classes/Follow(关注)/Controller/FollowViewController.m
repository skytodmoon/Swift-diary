//
//  FollowViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FollowViewController.h"
#import "RecommendViewController.h"
#import "AttentionViewController.h"
#import "SubscribeViewController.h"



@interface FollowViewController ()


//定义属性
@property (nonatomic,strong) UIButton *subscribeBtn;
@property (nonatomic,strong) UIButton *attentionBtn;
//当前显示窗口
@property (nonatomic,weak) UIViewController *showingVc;
//下划线
@property (nonatomic,weak) UIView *underLine;

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置navigationItem.title的标题
    [self setupNavigationItemTitle];
    
    //设置左边按钮，调用UITabBarItem+Category.h里面的类方法，可直接设置按钮样式
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" hightImage:@"friendsRecommentIcon-click" target:self action:@selector(leftBtnClick)];
    
    [self addChildViewController:[[SubscribeViewController alloc]init]];
    [self addChildViewController:[[AttentionViewController alloc]init]];
    //默认显示第一个按钮
    [self subscribeBtn:self.subscribeBtn];
}

//设置navigationItem.title的标题
- (void)setupNavigationItemTitle
{
    UIView *titleBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
    
    UIButton *subscribeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    subscribeBtn.frame = CGRectMake(0, 0, titleBtnView.sy_width * 0.5 , titleBtnView.sy_height);
    [subscribeBtn setTitle:@"订阅" forState:UIControlStateNormal];
    [subscribeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    subscribeBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [subscribeBtn addTarget:self action:@selector(subscribeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [subscribeBtn.titleLabel sizeToFit];
    
    CGFloat w = subscribeBtn.titleLabel.frame.size.width;
    CGFloat h = subscribeBtn.sy_height;
    [titleBtnView addSubview:subscribeBtn];
    
    //底部滚动线条
    UIView *underLine = [[UIView alloc]init];
    underLine.backgroundColor = [UIColor redColor];
    underLine.frame = CGRectMake(0, h, w, 3);
    [subscribeBtn.titleLabel addSubview:underLine];
    _underLine = underLine;
    
    UIButton *attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    attentionBtn.frame = CGRectMake(titleBtnView.sy_width * 0.5, 0, titleBtnView.sy_width * 0.5 , titleBtnView.sy_height);
    [attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    [attentionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    attentionBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [attentionBtn.titleLabel sizeToFit];
    [attentionBtn addTarget:self action:@selector(subscribeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [titleBtnView addSubview:attentionBtn];
    
    self.navigationItem.titleView = titleBtnView;
}

//点击左边按钮进入推荐关注页面
- (void)leftBtnClick
{
    RecommendViewController *recommend = [[RecommendViewController alloc]init];
    [self.navigationController pushViewController:recommend animated:YES];
    
}

//点击按钮
- (void)subscribeBtn:(UIButton *)btn
{
    [self.showingVc.view removeFromSuperview];
    
    NSInteger index = [btn.superview.subviews indexOfObject:btn];
    self.showingVc = self.childViewControllers[index];
    self.showingVc.view.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    [self.view addSubview:self.showingVc.view];
    
    //点击按钮底部线条进行滚动
    [UIView animateWithDuration:0.25 animations:^{
        _underLine.sy_x = btn.sy_x;
    }];
}


@end
