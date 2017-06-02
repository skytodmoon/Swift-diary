//
//  LiveViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
#import "LiveViewController.h"
#import "InCommonUseViewController.h"
#import "LiveAllViewController.h"
#import "LiveGameViewController.h"
#import "PhoneGameViewController.h"
#import "LiveFishHappyViewController.h"
#import "FaceLevelViewController.h"
#import "LiveFishShowViewController.h"
#import "LiveTecViewController.h"
#import "LiveMovieViewController.h"

@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupScrollContent];
    
    [self setupChildVc];

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupScrollContent {
    // 设置下划线
    [self setUpUnderLineEffect:^(BOOL *isShowUnderLine, BOOL *isDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor) {
        
        *isShowUnderLine = YES;
        
        *underLineColor = [UIColor colorWithRed:RSLlRed green:RSLGreen blue:RSLBlue alpha:1.0];
        
    }];
    
    // 设置标题的颜色
    [self setUpTitleGradient:^(BOOL *isShowTitleGradient, TitleColorGradientStyle *titleColorGradientStyle, CGFloat *startR, CGFloat *startG, CGFloat *startB, CGFloat *endR, CGFloat *endG, CGFloat *endB) {
        *startR = NormalColorRGB;
        *startG = NormalColorRGB;
        *startB = NormalColorRGB;
        
        *endR = RSLlRed;
        *endG = RSLGreen;
        *endB = RSLBlue;
        
        // 不需要设置的属性，可以不管
        *isShowTitleGradient = YES;
        
        *titleColorGradientStyle = TitleColorGradientStyleRGB;
    }];
}
/**
 *  添加子控制器
 */
- (void)setupChildVc {
    
    // 常用
    InCommonUseViewController *inCommonUseVc = [[InCommonUseViewController alloc] init];
    inCommonUseVc.title = @"常用";
    [self addChildViewController:inCommonUseVc];
    
    // 全部
    [self addChildVc:[LiveAllViewController class] title:@"全部"];

    // 游戏
    [self addChildVc:[LiveGameViewController class] title:@"游戏"];

    // 手机游戏
    [self addChildVc:[PhoneGameViewController class] title:@"手机游戏"];
    
    // 鱼乐星天地
    [self addChildVc:[LiveFishHappyViewController class] title:@"鱼乐星天地"];
    
    // 颜值
    [self addChildVc:[FaceLevelViewController class] title:@"颜值"];
    
    // 鱼秀
    [self addChildVc:[LiveFishShowViewController class] title:@"鱼秀"];
    
    // 科技
    [self addChildVc:[LiveTecViewController class] title:@"科技"];
    
    // 影视发布
    [self addChildVc:[LiveMovieViewController class] title:@"影视发布"];
}

- (void)addChildVc:(Class)vcClass title:(NSString *)title {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = ItemMargin;
    layout.minimumInteritemSpacing = ItemMargin;

    UICollectionViewController *vc = [[vcClass alloc] initWithCollectionViewLayout:layout];
    vc.title = title;
    [self addChildViewController:vc];
}


@end
