//
//  QJLStage18ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage18ViewController.h"
#import "QJLStage18PokerView.h"
#import "QJLCountTimeView.h"
#import "PrefixHeader.pch"

@interface QJLStage18ViewController ()

@property (nonatomic, strong) QJLStage18PokerView *pokerView;
@property (nonatomic, assign) BOOL btnCanEdit;
@property (nonatomic, assign) int allScore;

@end

@implementation QJLStage18ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    [super buildStageView];
    
    [self buildPokerView];
    
    [self setButtonImage:[UIImage imageNamed:@"20_same-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self bringPauseAndPlayAgainToFront];
}

- (void)buildPokerView {
    self.pokerView = [QJLStage18PokerView viewFromNib];
    [self.view insertSubview:self.pokerView belowSubview:self.redButton];
    __weak typeof(self) weakSelf = self;
    self.pokerView.startCountTime = ^{
        [(QJLCountTimeView *)weakSelf.countScore startCalculateByTimeWithTimeOut:^{
            weakSelf.view.userInteractionEnabled = NO;
            [weakSelf showGameFail];
        } outTime:2];
    };
    
    self.pokerView.showNextPoker = ^{
        weakSelf.btnCanEdit = [weakSelf.pokerView showPokerView];
        [weakSelf setButtonsIsActivate:YES];
    };
    
    self.pokerView.selectSamePokerSucess = ^(BOOL isPass){
        weakSelf.view.userInteractionEnabled = NO;
        [(QJLCountTimeView *)weakSelf.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            int onceTime = (second + ms / 60.0) * 1000;
            QJLResultStateType type;
            
            if (onceTime < 350) {
                type = QJLResultStateTypePerfect;
            } else if (onceTime < 500) {
                type = QJLResultStateTypeGreat;
            } else if (onceTime < 650) {
                type = QJLResultStateTypeGood;
            } else {
                type = QJLResultStateTypeGreat;
            }
            weakSelf.allScore += onceTime;
            
            [weakSelf.stateView showStateViewWithType:type stageViewHiddenFinishBlock:^{
                if (isPass) {
                    weakSelf.view.userInteractionEnabled = NO;
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [weakSelf showResultControllerWithNewScroe:weakSelf.allScore / 9 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
                    });
                    
                } else {
                    
                    weakSelf.redImageView.highlighted = NO;
                    weakSelf.yellowImageView.highlighted = NO;
                    weakSelf.blueImageView.highlighted = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        weakSelf.btnCanEdit = [weakSelf.pokerView showPokerView];
                        [(QJLCountTimeView *)weakSelf.countScore cleanData];
                        [weakSelf setButtonsIsActivate:YES];
                    });
                }
                
            }];
        }];
    };
}

#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundClickAnsName];
    sender.userInteractionEnabled = NO;
    
    if (self.btnCanEdit) {
        if ([self.pokerView selectSamePokerWithIndex:sender.tag]) {
            if (sender.tag == 0) {
                self.redImageView.highlighted = YES;
            } else if (sender.tag == 1) {
                self.yellowImageView.highlighted = YES;
            } else {
                self.blueImageView.highlighted = YES;
            }
        } else {
            self.view.userInteractionEnabled = NO;
            [(QJLCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:nil];
            self.pokerView.isFail = YES;
            __weak typeof(self) weakSelf = self;
            [self.stateView showBadStateWithFinish:^{
                [weakSelf showGameFail];
            }];
        }
    } else {
        self.view.userInteractionEnabled = NO;
        self.pokerView.isFail = YES;
        __weak typeof(self) weakSelf = self;
        [self.stateView showBadStateWithFinish:^{
            [weakSelf showGameFail];
        }];
    }
}

#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.btnCanEdit = [self.pokerView showPokerView];
}

- (void)pauseGame {
    [(QJLCountTimeView *)self.countScore pause];
    
    [super pauseGame];
}

- (void)continueGame {
    [super continueGame];
    
    [(QJLCountTimeView *)self.countScore continueGame];
}

- (void)playAgainGame {
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
     self.pokerView.isFail = YES;
    [self.pokerView resumeData];
    [self.pokerView removeFromSuperview];
    self.pokerView = nil;
    [(QJLCountTimeView *)self.countScore cleanData];
    [self buildPokerView];
    
    [super playAgainGame];
}

@end
