//
//  QJLStage24ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage24ViewController.h"
#import "QJLCountTimeView.h"
#import "QJLStage24View.h"
#import "PrefixHeader.pch"

@interface QJLStage24ViewController ()

@property (nonatomic, strong) QJLStage24View *cockroachView;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) BOOL playAgain;

@end

@implementation QJLStage24ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    [self setButtonImage:[UIImage imageNamed:@"stage27_btn-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self buildCockroachView];
    
    [self buildStageView];
    
    [self bringPauseAndPlayAgainToFront];
}

- (void)buildCockroachView {
    self.cockroachView = [[QJLStage24View alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view insertSubview:self.cockroachView belowSubview:self.redButton];
    
    __weak typeof(self) weakSelf = self;
    self.cockroachView.startCountTime = ^(BOOL isFrist) {
        weakSelf.playAgain = NO;
        if (isFrist) {
            [(QJLCountTimeView *)weakSelf.countScore startCalculateTime];
        } else {
            [(QJLCountTimeView *)weakSelf.countScore continueGame];
        }
    };
    
    self.cockroachView.finish = ^{
        weakSelf.count++;
        QJLResultStateType type;
        __block int onecTime;
        [(QJLCountTimeView *)weakSelf.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            onecTime = second * 1000 + ms / 60.0 * 1000;
            weakSelf.allScore += onecTime;
        }];
        
        if (onecTime <= 900) {
            type = QJLResultStateTypePerfect;
        } else if (onecTime <= 1000) {
            type = QJLResultStateTypeGreat;
        } else if (onecTime <= 1100) {
            type = QJLResultStateTypeGood;
        } else {
            type = QJLResultStateTypeOK;
        }
        
        [weakSelf.stateView showStateViewWithType:type stageViewHiddenFinishBlock:^{
            if (!weakSelf.playAgain) {
                if (weakSelf.count != 4) {
                    [weakSelf showNewCockroachView];
                } else {
                    [weakSelf showResultControllerWithNewScroe:weakSelf.allScore / 4 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
                }
            }
        }];
    };
    
    self.cockroachView.fail = ^{
        [(QJLCountTimeView *)weakSelf.countScore pause];
        [weakSelf showGameFail];
    };
}

#pragma mark - Private Method
- (void)showNewCockroachView {
    [self removeCockroachViewData];
    
    [self buildCockroachView];
    [self.cockroachView startAppearCockroach];
}

- (void)removeCockroachViewData {
    [(QJLCountTimeView *)self.countScore cleanData];
    
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
    
    [self setButtonsIsActivate:YES];
    
    [self.cockroachView removeFromSuperview];
    self.cockroachView = nil;
}

#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    
    [self setButtonsIsActivate:YES];
    
    [self.cockroachView startAppearCockroach];
}

#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
    [(QJLCountTimeView *)self.countScore pause];
    if ([self.cockroachView hitCockroachWithIndex:sender.tag]) {
        
        if (sender.tag == 0) {
            self.redImageView.highlighted = YES;
        } else if (sender.tag == 1) {
            self.yellowImageView.highlighted = YES;
        } else {
            self.blueImageView.highlighted = YES;
        }
        
    } else {
        [self showGameFail];
    }
}

- (void)playAgainGame {
    self.count = 0;
    self.allScore = 0;
    self.playAgain = YES;
    [self removeCockroachViewData];
    
    [self buildCockroachView];
    
    [super playAgainGame];
}

@end
