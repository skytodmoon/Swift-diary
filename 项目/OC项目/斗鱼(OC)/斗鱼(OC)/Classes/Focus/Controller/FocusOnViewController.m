//
//  FocusOnViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FocusOnViewController.h"
#import "OnLiveCollectionViewController.h"
#import "HasNotStartedCollectionViewController.h"

@interface FocusOnViewController ()

@end

@implementation FocusOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"关注";
    
    [self setupScrollContent];
    
    [self setupChildVc];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)setupScrollContent {
    
    [self setUpUnderLineEffect:^(BOOL *isShowUnderLine, BOOL *isDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor) {
        
        *isShowUnderLine = YES;
        
        *underLineColor = [UIColor colorWithRed:RSLlRed green:RSLGreen blue:RSLBlue alpha:1.0];
        
    }];
    
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
    // 直播中
    [self addChildVc:[OnLiveCollectionViewController class] title:@"直播中"];
    
    // 未开播
    [self addChildVc:[HasNotStartedCollectionViewController class] title:@"未开播"];
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
