//
//  QJLStage06ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/7/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage06ViewController.h"
#import "QJLStage06PeolpeView.h"
#import "QJLTimeCountView.h"
#import "PrefixHeader.pch"

@interface QJLStage06ViewController ()
{
    BOOL _notFrist;
}

@property (nonatomic, strong) QJLStage06PeolpeView *peopleView;

@end

@implementation QJLStage06ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
    
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buildStageInfo {
    self.backgroundIV.image = [UIImage imageNamed:@"19_bg-iphone4"];
    [self.leftButton setImage:[UIImage imageNamed:@"19_slap-iphone4"] forState:UIControlStateNormal];
    self.leftButton.contentEdgeInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    [self.leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchDown];
    
    [self.rightButton setImage:[UIImage imageNamed:@"19_done-iphone4"] forState:UIControlStateNormal];
    [self.rightButton setContentEdgeInsets:UIEdgeInsetsMake(30, 30, 30, 30)];
    [self.rightButton addTarget:self action:@selector(doneButtonClick) forControlEvents:UIControlEventTouchDown];
    
    self.peopleView = [QJLStage06PeolpeView viewFromNib];
    self.peopleView.frame = CGRectMake(0, ScreenHeight - self.leftButton.frame.size.height - self.peopleView.frame.size.height, self.peopleView.frame.size.width, self.peopleView.frame.size.height);
    [self.view insertSubview:self.peopleView belowSubview:self.leftButton];
    if (self.guideImageView) {
        [self.view bringSubviewToFront:self.guideImageView];
    }
    __weak typeof(self) weakSelf = self;
    self.peopleView.failBlock = ^{
        [weakSelf fail];
    };
    
    [self bringPauseAndPlayAgainToFront];
}

#pragma mark Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.view.userInteractionEnabled = NO;
    
    [self showScreamImageView];
}

- (void)playAgainGame {
    [(QJLTimeCountView *)self.countScore cleadData];
    [self.peopleView cleanData];
    _notFrist = NO;
    [super playAgainGame];
}

#pragma mark Private Method
- (void)showScreamImageView {
    UIImageView *screamIV = [[UIImageView alloc] initWithFrame:CGRectMake(-20, -50, ScreenWidth + 40, ScreenHeight + 100)];
    screamIV.image = [UIImage imageNamed:@"19_beforegame-iphone4"];
    [self.view addSubview:screamIV];
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundScreamName];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [screamIV removeFromSuperview];
        [self startPlayGame];
        [self.view bringSubviewToFront:self.playAgainButton];
        [self.view bringSubviewToFront:self.pauseButton];
    });
}

- (void)fail {
    [(QJLTimeCountView *)self.countScore stopCalculateTime];
    [self.view setUserInteractionEnabled:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showGameFail];
    });
}

- (void)startPlayGame {
    self.view.userInteractionEnabled = YES;
    self.leftButton.userInteractionEnabled = YES;
    self.rightButton.userInteractionEnabled = YES;
}

- (void)pauseGame {
    [super pauseGame];
    [(QJLTimeCountView *)self.countScore pause];
}

- (void)beginRedayGoView {
    [super beginRedayGoView];
}

- (void)continueGame {
    [super continueGame];
    [(QJLTimeCountView *)self.countScore resumed];
}

#pragma mark - Action
- (void)leftButtonClick {
    [self.peopleView punchTheFace];
    if (!_notFrist) {
        [(QJLTimeCountView *)self.countScore startCalculateTime];
        _notFrist = YES;
    }
}

- (void)doneButtonClick {
    self.view.userInteractionEnabled = NO;
    NSTimeInterval time = [(QJLTimeCountView *)self.countScore stopCalculateTime];
    if ([self.peopleView doneBtnClick]) {
        
        [super buildStageView];
        
        QJLResultStateType stageType;
        if (time <= 5) {
            stageType = QJLResultStateTypePerfect;
        } else if (time < 6) {
            stageType = QJLResultStateTypeGreat;
        } else if (time < 7) {
            stageType = QJLResultStateTypeGood;
        } else {
            stageType = QJLResultStateTypeOK;
        }
        
        [self.stateView showStateViewWithType:stageType];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showResultControllerWithNewScroe:time unit:@"秒" stage:self.stage isAddScore:YES];
        });
        
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showGameFail];
        });
    }
}


@end
