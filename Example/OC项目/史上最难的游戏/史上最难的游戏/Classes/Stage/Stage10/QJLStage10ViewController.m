//
//  QJLStage10ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage10ViewController.h"
#import "QJLStage10View.h"
#import "QJLStage10BottomNumView.h"
#import "QJLTimeCountView.h"
#import "PrefixHeader.pch"

@interface QJLStage10ViewController ()

@property (nonatomic, strong) QJLStage10View *plateView;
@property (nonatomic, strong) QJLStage10BottomNumView *numView;
@property (nonatomic, assign) NSTimeInterval oneTime;

@end

@implementation QJLStage10ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    [super buildStageView];
    
    [self removeAllImageView];
    
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"08_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.redButton];
    
    [self setButtonsIsActivate:NO];
    
    [self buildPlateView];
    
    [self buildBottomNumberView];
    
    [super bringPauseAndPlayAgainToFront];
    
    [self addButtonsActionWithTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
}

- (void)buildPlateView {
    __weak typeof(self) weakSelf = self;
    self.plateView = [[QJLStage10View alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height + 55 - 480, ScreenWidth, 480)];
    [self.view insertSubview:self.plateView belowSubview:self.redButton];
    
    self.plateView.AnimationFinishBlock = ^(BOOL isFrist) {
        [weakSelf setButtonsIsActivate:YES];
        if (isFrist) {
            [(QJLTimeCountView *)weakSelf.countScore startCalculateTime];
        } else {
            [(QJLTimeCountView *)weakSelf.countScore resumed];
        }
    };
    
    self.plateView.StopCountTimeBlock = ^{
        [weakSelf setButtonsIsActivate:NO];
        weakSelf.oneTime = [(QJLTimeCountView *)weakSelf.countScore pasueTime];
    };
    
    self.plateView.PassStageBlock = ^{
        QJLResultStateType resultType;
        if (weakSelf.oneTime < 0.8) {
            resultType = QJLResultStateTypePerfect;
        } else if (weakSelf.oneTime < 1) {
            resultType = QJLResultStateTypeGreat;
        } else {
            resultType = QJLResultStateTypeGood;
        }
        [weakSelf.stateView showStateViewWithType:resultType stageViewHiddenFinishBlock:^{
            [weakSelf showResultControllerWithNewScroe:[(QJLTimeCountView *)weakSelf.countScore stopCalculateTime] unit:@"秒" stage:weakSelf.stage isAddScore:YES];
        }];
    };
    
    self.plateView.NextBlock = ^{
        QJLResultStateType resultType;
        if (weakSelf.oneTime < 0.8) {
            resultType = QJLResultStateTypePerfect;
        } else if (weakSelf.oneTime < 1) {
            resultType = QJLResultStateTypeGreat;
        } else {
            resultType = QJLResultStateTypeGood;
        }
        [weakSelf.stateView showStateViewWithType:resultType stageViewHiddenFinishBlock:^{
            [weakSelf.numView cleanData];
            [weakSelf.plateView startRotation];
        }];
    };
    
    self.plateView.FailBlock = ^{
        [(QJLTimeCountView *)weakSelf.countScore stopCalculateTime];
        [weakSelf showGameFail];
    };
}

- (void)buildBottomNumberView {
    self.numView = [[QJLStage10BottomNumView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y + 4, ScreenWidth, self.redButton.frame.size.height)];
    self.numView.userInteractionEnabled = NO;
    [self.view insertSubview:self.numView aboveSubview:self.blueButton];
}

#pragma mark - Action
- (void)buttonClick:(UIButton *)sender {
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundFeatherClickName];
    [self.numView addNumWithIndex:(int)sender.tag];
    if (![self.plateView clickWithIndex:(int)sender.tag]) {
        [(QJLTimeCountView *)self.countScore stopCalculateTime];
        [self showGameFail];
    }
}

#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.view.userInteractionEnabled = YES;
    [self setButtonsIsActivate:NO];
    [self.plateView startRotation];
}

- (void)pauseGame {
    [self.plateView pause];
    [(QJLTimeCountView *)self.countScore pause];
    [super pauseGame];
}

- (void)continueGame {
    [super continueGame];
    [self.plateView resume];
    if (!self.plateView.isAnimation) {
        [(QJLTimeCountView *)self.countScore resumed];
    }
}

- (void)playAgainGame {
    [(QJLTimeCountView *)self.countScore cleadData];
    [self.plateView cleanData];
    [self.numView cleanData];
    [self.plateView removeFromSuperview];
    self.plateView = nil;
    
    [self.numView removeFromSuperview];
    self.numView = nil;
    
    [self buildPlateView];
    [self buildBottomNumberView];
    
    [super playAgainGame];
}


@end
