//
//  QJLStage21ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage21ViewController.h"
#import "QJLStage21FractionView.h"
#import "QJLCountTimeView.h"
#import "PrefixHeader.pch"

@interface QJLStage21ViewController ()

@property (nonatomic, strong) QJLStage21FractionView *numView;
@property (nonatomic, assign) int maxTag;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;

@end

@implementation QJLStage21ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    self.backgroundIV.image = [UIImage imageNamed:@"13_bg-iphone4"];
    
    UIImageView *lineIV = [[UIImageView alloc] initWithFrame:CGRectMake(156, 0, 8, ScreenHeight)];
    lineIV.image = [UIImage imageNamed:@"17_blackline-iphone4"];
    [self.view insertSubview:lineIV belowSubview:self.leftButton];
    lineIV.alpha = 0.6;
    
    [self.leftButton setImage:[UIImage imageNamed:@"17_bigger-iphone4"] forState:UIControlStateNormal];
    self.leftButton.contentEdgeInsets = UIEdgeInsetsMake(50, 30, 15, 30);

    [self.rightButton setImage:[UIImage imageNamed:@"17_bigger-iphone4"] forState:UIControlStateNormal];
    self.rightButton.contentEdgeInsets = UIEdgeInsetsMake(50, 30, 15, 30);
    
    UIImageView *arrow1 = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth / 2 - 40) * 0.5, ScreenHeight - 80, 40, 20)];
    arrow1.image = [UIImage imageNamed:@"17_triangle-iphone4"];
    [self.view addSubview:arrow1];
    
    UIImageView *arrow2 = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth / 2 + (ScreenWidth / 2 - 40) * 0.5, ScreenHeight - 80, 40, 20)];
    arrow2.image = [UIImage imageNamed:@"17_triangle-iphone4"];
    [self.view addSubview:arrow2];
    
    [self buildNumberView];
    [self buildStageView];
    
    [self.leftButton addTarget:self action:@selector(bgView:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(bgView:) forControlEvents:UIControlEventTouchDown];
}

- (void)buildNumberView {
    self.numView = [[QJLStage21FractionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - ScreenWidth / 3)];
    [self.view insertSubview:self.numView belowSubview:self.leftButton];
    
    __weak typeof(self) weakSelf = self;
    self.numView.showNumberAnimationFinish = ^{
        [(QJLCountTimeView *)weakSelf.countScore startCalculateTime];
        [weakSelf setButtonActivate:YES];
    };
    
    [self bringPauseAndPlayAgainToFront];
}

#pragma mark - Action
- (void)bgView:(UIButton *)sender {
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;

    if (sender.tag == self.maxTag) {
        
        __weak typeof(self) weakSelf = self;
        __block int onceTime;
        [(QJLCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            onceTime = second * 1000 + ms / 60.0 * 1000;
            weakSelf.allScore += onceTime;
        }];
        
        QJLResultStateType resultType;
        
        if (onceTime < 300) {
            resultType = QJLResultStateTypePerfect;
        } else if (onceTime < 400) {
            resultType = QJLResultStateTypeGreat;
        } else if (onceTime < 500) {
            resultType = QJLResultStateTypeGood;
        } else {
            resultType = QJLResultStateTypeOK;
        }
        
        [self.stateView showStateViewWithType:resultType stageViewHiddenFinishBlock:^{
            if (weakSelf.count == 12) {
                [weakSelf showResultControllerWithNewScroe:weakSelf.allScore / 13 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
            } else {
                weakSelf.count++;
                [(QJLCountTimeView *)weakSelf.countScore cleanData];
                weakSelf.maxTag = [weakSelf.numView showNumber];
            }
        }];
        
    } else {
        self.view.userInteractionEnabled = NO;
        [self showGameFail];
        [(QJLCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:nil];
    }
}

#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
    self.allScore = 0;
    _count = 0;
    self.maxTag = [self.numView showNumber];
}

- (void)pauseGame {
    [(QJLCountTimeView *)self.countScore pause];
    
    [self.numView pause];
    
    [super pauseGame];
}

- (void)continueGame {
    [super continueGame];
    
    [self.numView resume];
    [(QJLCountTimeView *)self.countScore continueGame];
}

- (void)playAgainGame {
    [(QJLCountTimeView *)self.countScore cleanData];
    
    [self.stateView removeData];
    self.stateView = nil;
    [self buildStageView];
    
    [self.numView removeData];
    self.numView = nil;
    [self buildNumberView];
    
    [super playAgainGame];
}

@end
