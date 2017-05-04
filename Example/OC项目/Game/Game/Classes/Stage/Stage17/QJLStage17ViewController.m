//
//  QJLStage17ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage17ViewController.h"
#import "QJLNoseView.h"
#import "QJLPowerView.h"
#import "QJLStrokeLabel.h"
#import "UIColor+QJLColor.h"
#import "PrefixHeader.pch"

#define kTextOrangeColor [UIColor colorWithR:252 g:120 b:35]

@interface QJLStage17ViewController ()
{
    int _count;
}

@property (nonatomic, strong) UIImageView *pullIV;
@property (nonatomic, strong) QJLNoseView *noseView;
@property (nonatomic, strong) QJLPowerView *powerView;
@property (nonatomic, assign) int allScore;
@property (nonatomic, strong) QJLStrokeLabel *scoreLabel;

@end

@implementation QJLStage17ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    
    _count = 1;
    
    [super buildStageView];
    
    self.scoreLabel = [[QJLStrokeLabel alloc] initWithFrame:CGRectMake(0, 90, 100, 60)];
    self.scoreLabel.font =  [UIFont fontWithName:@"TransformersMovie" size:60];
    self.scoreLabel.textColor = kTextOrangeColor;
    [self.scoreLabel setTextStorkeWidth:5];
    self.scoreLabel.hidden = YES;
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.scoreLabel];
    
    self.pullIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight - ScreenWidth / 3 + 10, ScreenWidth, ScreenWidth / 3 - 10)];
    self.pullIV.image = [UIImage imageNamed:@"15_button-iphone4"];
    self.pullIV.userInteractionEnabled = YES;
    [self.pullIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pullClick)]];
    [self.view insertSubview:self.pullIV atIndex:0];
    
    self.powerView = [QJLPowerView viewFromNib];
    self.powerView.frame = CGRectMake(0, ScreenHeight - ScreenWidth / 3 - self.powerView.frame.size.height + 10, self.powerView.frame.size.width, self.powerView.frame.size.height);
    [self.view addSubview:self.powerView];
    [self.view insertSubview:self.powerView atIndex:0];
    
    self.noseView = [QJLNoseView viewFromNib];
    [self.view insertSubview:self.noseView atIndex:0];
    
    __weak typeof(self) weakSelf = self;
    self.noseView.passStageBlock = ^{
        [weakSelf showResultControllerWithNewScroe:weakSelf.allScore unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
    };
    
    self.powerView.failBlock = ^{
        [weakSelf.view setUserInteractionEnabled:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf showGameFail];
        });
    };
    
    [self bringPauseAndPlayAgainToFront];
}

- (void)pullClick {
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundEggHitName];
    _count++;
    self.pullIV.hidden = YES;
    __weak typeof(self) weakSelf = self;
    int score = [self.powerView stopCount];
    self.allScore += score;
    [self showScore:score];
    
    QJLResultStateType type;
    if (score == 100) {
        type = QJLResultStateTypePerfect;
    } else if (score < 100 && score != 0) {
        type = QJLResultStateTypeOK;
    } else if (score == 0) {
        type = QJLResultStateTypeBad;
    }
    
    [self.noseView showPullAnimationWithIsPullOut:_count == 7 score:score finish:^{
        self.scoreLabel.hidden = YES;
        [self.stateView showStateViewWithType:type stageViewHiddenFinishBlock:^{
            [weakSelf.powerView startWithCount:_count];
            weakSelf.pullIV.hidden = NO;
        }];
    }];
    
}

- (void)showScore:(int)score {
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.scoreLabel.hidden = NO;
}

#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self.powerView startWithCount:_count];
}

- (void)pauseGame {
    [self.noseView pause];
    [self.powerView pause];
    [super pauseGame];
}

- (void)continueGame {
    [super continueGame];
    [self.noseView resume];
    [self.powerView resume];
}

- (void)playAgainGame {
    self.view.userInteractionEnabled = NO;
    _count = 1;
    self.scoreLabel.hidden = YES;
    self.allScore = 0;
    self.pullIV.hidden = NO;
    self.stateView.hidden = YES;
    [self.noseView resumeData];
    [self.powerView resumeData];
    [super playAgainGame];
}

@end
