//
//  QJLStage12ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage12ViewController.h"
#import "QJLStage12BottomView.h"
#import "QJLStage12EggView.h"
#import "QJLScoreboardCountView.h"
#import "PrefixHeader.pch"

@interface QJLStage12ViewController ()

@property (nonatomic, strong) QJLStage12BottomView *bottomView;
@property (nonatomic, strong) QJLStage12EggView *eggView;
@property (nonatomic, assign) NSInteger allScroe;

@end

@implementation QJLStage12ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    [self setButtonImage:[UIImage imageNamed:@"01_catch-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(14, 14, 14, 14)];
    
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self buildEggView];
    
    [self buildBottomView];
}

- (void)buildBottomView {
    self.bottomView = [[QJLStage12BottomView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - 138, ScreenHeight, 144)];
    [self.view insertSubview:self.bottomView belowSubview:self.redButton];
}

- (void)buildEggView {
    self.eggView = [[QJLStage12EggView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 200)];
    [self.view addSubview:self.eggView];
    
    self.eggView.redButton = self.redButton;
    self.eggView.yellowButton = self.yellowButton;
    self.eggView.blueButton = self.blueButton;
    
    __weak typeof(self) weakSelf = self;
    self.eggView.failBlock = ^(NSInteger index) {
        [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundEggHitName];
        weakSelf.view.userInteractionEnabled = NO;
        UIImageView *badIV = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth / 3 - 80) * 0.5 + ScreenWidth / 3 * index, ScreenHeight - 250, 80, 44)];
        badIV.image = [UIImage imageNamed:@"00_bad-iphone4"];
        [weakSelf.view addSubview:badIV];
        [weakSelf.eggView failWithIndex:index];
        [weakSelf.bottomView changeBottomWihtIndex:index imageType:QJLStage12BottomViewTypeFail];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf showGameFail];
        });
    };
    
    self.eggView.nextDropEggBlock = ^{
        [weakSelf.eggView showEgg];
        [weakSelf.bottomView changeBottomWihtIndex:0 imageType:QJLStage12BottomViewTypeNormal];
        [weakSelf.bottomView changeBottomWihtIndex:1 imageType:QJLStage12BottomViewTypeNormal];
        [weakSelf.bottomView changeBottomWihtIndex:2 imageType:QJLStage12BottomViewTypeNormal];
    };
    
    self.eggView.passStageBlock = ^{
        [weakSelf showResultControllerWithNewScroe:weakSelf.allScroe unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
    };
}


#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self.view bringSubviewToFront:self.eggView];
    [self bringPauseAndPlayAgainToFront];
    
    [self.eggView showEgg];
}

- (void)pauseGame {
    [super pauseGame];
    [self.eggView pause];
}

- (void)continueGame {
    [super continueGame];
    [self.eggView resume];
}

- (void)playAgainGame {
    self.allScroe = 0;
    
    [(QJLScoreboardCountView *)self.countScore clean];
    
    [self.eggView cleanData];
    [self.eggView removeFromSuperview];
    self.eggView = nil;
    
    [self.bottomView removeFromSuperview];
    self.bottomView = nil;
    
    [self buildEggView];
    [self buildBottomView];
    
    [super playAgainGame];
}

#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
    
    NSInteger scroe = [self.eggView grabWithIndex:sender.tag];
    [(QJLScoreboardCountView *)self.countScore setScore:scroe];
    _allScroe += scroe;
    
    if (sender.tag == 0) {
        self.redImageView.highlighted = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.redImageView.highlighted = NO;
        });
    } else if (sender.tag == 1) {
        self.yellowImageView.highlighted = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.yellowImageView.highlighted = NO;
        });
    } else {
        self.blueImageView.highlighted = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.blueImageView.highlighted = NO;
        });
    }
    [self.bottomView changeBottomWihtIndex:sender.tag imageType:QJLStage12BottomViewTypeSucess];
}



@end
