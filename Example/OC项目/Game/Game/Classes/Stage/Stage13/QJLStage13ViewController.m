//
//  QJLStage13ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage13ViewController.h"
#import "QJLStage13BottomView.h"
#import "QJLStage13GuessView.h"
#import "QJLCountTimeView.h"
#import "PrefixHeader.pch"

@interface QJLStage13ViewController ()

@property (nonatomic, strong) QJLStage13GuessView *guessView;
@property (nonatomic, strong) QJLStage13BottomView *bottom;
@property (nonatomic, assign) NSTimeInterval allTime;
@property (nonatomic, assign) QJLResultStateType type;

@end

@implementation QJLStage13ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"11_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.redButton];
    
    [self removeAllImageView];
    
    [super buildStageView];
    
    self.guessView = [[QJLStage13GuessView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.redButton.frame.size.height)];
    [self.view addSubview:self.guessView];
    
    self.bottom = [[QJLStage13BottomView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y, ScreenWidth, self.redButton.frame.size.height)];
    [self.view addSubview:self.bottom];
    
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self bringPauseAndPlayAgainToFront];
    
    __weak typeof(self) weakSelf = self;
    self.guessView.startCountTime = ^{
        [weakSelf setButtonsIsActivate:YES];
        [(QJLCountTimeView *)weakSelf.countScore startCalculateByTimeWithTimeOut:^{
            [weakSelf.guessView stopAnimationWithTimeOver];
        } outTime:3];
    };
    
    self.guessView.nextCountWithError = ^{
        [(QJLCountTimeView *)weakSelf.countScore cleanData];
        [weakSelf.bottom cleanData];
        weakSelf.allTime += 3.0;
        [weakSelf.guessView startGuess];
    };
    
    self.guessView.nextCountWithSucess = ^(BOOL isPass){
        [weakSelf.guessView stopAnimationWithFinish:nil];
        [weakSelf setButtonsIsActivate:NO];
        [(QJLCountTimeView *)weakSelf.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            NSTimeInterval onceTime = (second + ms / 60.0);
            
            if (onceTime < 0.8) {
                weakSelf.type = QJLResultStateTypePerfect;
            } else if (onceTime < 1.0) {
                weakSelf.type = QJLResultStateTypeGreat;
            } else if (onceTime < 1.2) {
                weakSelf.type = QJLResultStateTypeGood;
            } else {
                weakSelf.type = QJLResultStateTypeOK;
            }
            
            weakSelf.allTime += onceTime;
            
            [weakSelf.stateView showStateViewWithType:weakSelf.type stageViewHiddenFinishBlock:^{
                if (isPass) {
                    [weakSelf showResultControllerWithNewScroe:(int)(weakSelf.allTime / 18 * 1000) unit:@"MS" stage:weakSelf.stage isAddScore:YES];
                } else {
                    [(QJLCountTimeView *)weakSelf.countScore cleanData];
                    [weakSelf.bottom cleanData];
                    [weakSelf.guessView startGuess];
                }
            }];
            
        }];
    };
}

#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self.bottom changeBottomImageViewWihtIndex:0 type:QJLStage13BottomTypePeople];
    [self.bottom changeBottomImageViewWihtIndex:1 type:QJLStage13BottomTypePeople];
    [self.bottom changeBottomImageViewWihtIndex:2 type:QJLStage13BottomTypePeople];
    
    [self.guessView startGuess];
}

- (void)pauseGame {
    [(QJLCountTimeView *)self.countScore pause];
    [self.guessView pause];
    
    [super pauseGame];
}

- (void)continueGame {
    [super continueGame];
    
    [(QJLCountTimeView *)self.countScore continueGame];
    [self.guessView resume];
}

- (void)playAgainGame {
    [(QJLCountTimeView *)self.countScore cleanData];
    [self.bottom cleanData];
    [self.guessView cleanData];
    
    [super playAgainGame];
}

#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [self.bottom showPeopleImageViewWithIndex:sender.tag];
    
    __weak typeof(self) weakSelf = self;
    sender.userInteractionEnabled = NO;
    if ([self.guessView guessPeopleWithGuessType:sender.tag]) {
        [self.bottom changeBottomImageViewWihtIndex:sender.tag type:QJLStage13BottomTypeTick];
    } else {
        [self.bottom changeBottomImageViewWihtIndex:sender.tag type:QJLStage13BottomTypeNone];
        self.view.userInteractionEnabled = NO;
        [(QJLCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:nil];
        
        [self.guessView showFailWithIsShowPeople:YES AnimationFinish:^{
            [weakSelf showGameFail];
        }];
    }
}


@end
