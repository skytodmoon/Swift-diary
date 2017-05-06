//
//  QJLBaseGameViewController.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLBaseGameViewController.h"
#import "QJLStageInfo.h"
#import "QJLReadyGoView.h"
#import "QJLPauseViewController.h"
#import "QJLCountTimeView.h"
#import "QJLFailView.h"
#import "QJLFailViewController.h"
#import "QJLPrepareViewController.h"
#import "QJLScoreboardCountView.h"
#import "QJLTimeCountView.h"
#import "PrefixHeader.pch"

@interface QJLBaseGameViewController ()
{
    float _volume;
}

@property (nonatomic, strong) UIImageView *adView;
@property (nonatomic, assign) QJLADType adType;

@end

@implementation QJLBaseGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initGuideImageView];
    
    [self buildPlayAgainButton];
    
    [self buildPauseButton];
    
    [self showGuideImageView];
    
    [self buildADView];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationNameGameViewControllerDelloc object:nil];
}

#pragma mark - Pubilc Method
- (void)playAgainGame {
    self.view.userInteractionEnabled = NO;
    
    [self guideImageViewClick];
}

- (void)pauseGame {
    __weak __typeof(self) weakSelf = self;
    self.view.userInteractionEnabled = NO;
    QJLPauseViewController *pauseVC = [[QJLPauseViewController alloc] init];
    pauseVC.ContinueGameButtonClick = ^ {
        [weakSelf continueGame];
    };
    [self.navigationController pushViewController:pauseVC animated:NO];
}

- (void)buildStageInfo {}

- (void)continueGame {
    self.view.userInteractionEnabled = YES;
}

- (void)readyGoAnimationFinish {
    self.view.userInteractionEnabled = YES;
}

- (void)beginGame {
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"kMusicType"] == SoundPlayTypeMute) {
        [[QJLSoundToolManager sharedSoundToolManager] setBackgroundMusicVolume:0.3];
        _volume = 0.3;
    }
}

- (void)endGame {
    if (_volume) {
        [[QJLSoundToolManager sharedSoundToolManager] setBackgroundMusicVolume:1.0];
    }
    
    self.view.userInteractionEnabled = NO;
}

- (void)showGameFail {
    self.view.userInteractionEnabled = NO;
    __weak __typeof(self) weakSelf = self;
    QJLFailView *failView = [QJLFailView viewFromNib];
    failView.frame = CGRectMake(0, ScreenHeight - failView.frame.size.width - 140, failView.frame.size.width, failView.frame.size.height);
    [self.view addSubview:failView];
    [failView showFailViewWithAnimatonFinishBlock:^{
        [weakSelf showFailViewController];
    }];
}

- (void)showFailViewController {
    __weak __typeof(self) weakSelf = self;
    QJLFailViewController *failVC = [QJLFailViewController initWithStage:self.stage retryButtonClickBlock:^{
        for (UIViewController *vc in weakSelf.navigationController.viewControllers) {
            if ([vc isKindOfClass:[QJLPrepareViewController class]]) {
                ((QJLPrepareViewController *)vc).stage = self.stage;
                [weakSelf.navigationController popToViewController:vc animated:NO];
                return;
            }
        }
        
    }];
    [self.navigationController pushViewController:failVC animated:NO];
}

#pragma mark - Private Method
- (void)buildPlayAgainButton {
    self.playAgainButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 55, 75, 110, 52)];
    self.playAgainButton.adjustsImageWhenHighlighted = NO;
    self.playAgainButton.userInteractionEnabled = YES;
    [self.playAgainButton setBackgroundImage:[UIImage imageNamed:@"ing_retry"] forState:UIControlStateNormal];
    [self.playAgainButton addTarget:self action:@selector(playAgainGame) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.playAgainButton];
}

- (void)bringPauseAndPlayAgainToFront {
    [self.view bringSubviewToFront:self.pauseButton];
    [self.view bringSubviewToFront:self.playAgainButton];
    [self.view bringSubviewToFront:self.adView];
    
    if (self.guideImageView) {
        [self.view bringSubviewToFront:self.guideImageView];
    }
}

- (void)buildPauseButton {
    self.pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 55, CGRectGetMaxY(self.playAgainButton.frame) + 13, 110, 52)];
    [self.pauseButton setBackgroundImage:[UIImage imageNamed:@"ing_pause"] forState:UIControlStateNormal];
    self.pauseButton.adjustsImageWhenHighlighted = NO;
    self.pauseButton.userInteractionEnabled = YES;
    [self.pauseButton addTarget:self action:@selector(pauseGame) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.pauseButton];
}

- (void)initGuideImageView {
    self.guideImageView = [[UIImageView alloc] initWithFrame:ScreenBounds];
    [self.view addSubview:self.guideImageView];
}

- (void)showGuideImageView {
    if ((self.stage.userInfo && self.stage.userInfo.rank && ![self.stage.userInfo isEqual:@"f"]) || self.guideType == QJLGameGuideTypeNone) {
        [self guideImageViewClick];
        return;
    }
    
    NSArray *animationImages;
    if (self.guideType == QJLGameGuideTypeOneFingerClick) {
        animationImages = @[[UIImage imageNamed:@"03-1-iphone4"], [UIImage imageNamed:@"03-2-iphone4"]];
    } else if (self.guideType == QJLGameGuideTypeReplaceClick) {
        animationImages = @[[UIImage imageNamed:@"01-1-iphone4"], [UIImage imageNamed:@"01-2-iphone4"]];
    } else if (self.guideType == QJLGameGuideTypeMultiPointClick) {
        animationImages = @[[UIImage imageNamed:@"02-1-iphone4"], [UIImage imageNamed:@"02-2-iphone4"], [UIImage imageNamed:@"02-4-iphone4"], [UIImage imageNamed:@"02-5-iphone4"]];
    }
    
    CGFloat duration;
    if (self.guideType == QJLGameGuideTypeOneFingerClick) {
        duration = 0.3;
    } else if (self.guideType == QJLGameGuideTypeReplaceClick) {
        duration = 0.5;
    } else {
        duration = 0.8;
    }
    self.guideImageView.animationDuration = duration;
    self.guideImageView.animationImages = animationImages;
    self.guideImageView.animationRepeatCount = -1;
    [self.guideImageView startAnimating];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guideImageViewClick)];
    self.guideImageView.userInteractionEnabled = YES;
    [self.guideImageView addGestureRecognizer:tap];
}

- (void)guideImageViewClick {
    [self.guideImageView removeFromSuperview];
    self.countScore.hidden = NO;
    
    __weak __typeof(self) weakSelf = self;
    if (self.scoreboardType == QJLScoreboardTypeCountPTS) {
        [(QJLScoreboardCountView *)self.countScore startAnimationWithCompletion:^(BOOL finished) {
            [weakSelf beginRedayGoView];
        }];
    } else if (self.scoreboardType == QJLScoreboardTypeTimeMS) {
        [((QJLCountTimeView *)self.countScore) startAnimationWithCompletion:^(BOOL finished) {
            [weakSelf beginRedayGoView];
        }];
    } else if (self.scoreboardType == QJLScoreboardTypeSecondAndMS) {
        [((QJLTimeCountView *)self.countScore) startAnimationWithCompletion:^(BOOL finished) {
            [weakSelf beginRedayGoView];
        }];
    } else if (self.scoreboardType == QJLScoreboardTypeNone) {
        [self beginRedayGoView];
    }
}

- (void)buildADView {
    self.adType = arc4random_uniform(3);
    
    self.adView = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(250), 0, 250, 50)];
    if (self.adType == QJLADTypeBlog) {
        self.adView.image = [UIImage imageNamed:@"ad1"];
    } else if (self.adType == QJLADTypeWeiBo) {
        self.adView.image = [UIImage imageNamed:@"ad3"];
    } else {
        self.adView.image = [UIImage imageNamed:@"ad2"];
    }
    
    self.adView.userInteractionEnabled = YES;
    [self.adView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adViewClick)]];
    
    [self.view addSubview:self.adView];
}

- (void)adViewClick {
    
    [self pauseGame];
    
    NSURL *url;
    switch (self.adType) {
        case QJLADTypeBlog:
            url = [NSURL URLWithString:kBlogURL];
            break;
        case QJLADTypeGithub:
            url = [NSURL URLWithString:kGithubUrl];
            break;
        case QJLADTypeWeiBo:
            url = [NSURL URLWithString:kWeiBoURL];
            break;
        default:
            break;
    }
    
    [[UIApplication sharedApplication] openURL:url];
}

- (void)setScoreboardType:(QJLScoreboardType)scoreboardType {
    _scoreboardType = scoreboardType;
    
    if (scoreboardType == QJLScoreboardTypeNone) {
        return;
    } else if (scoreboardType == QJLScoreboardTypeCountPTS) {
        self.countScore = [QJLScoreboardCountView viewFromNib];
        self.countScore.frame = CGRectMake(-40, -140, self.countScore.frame.size.width, self.countScore.frame.size.height);
    } else if (scoreboardType == QJLScoreboardTypeTimeMS) {
        self.countScore = [QJLCountTimeView viewFromNib];
        self.countScore.frame = CGRectMake(-60, -140, self.countScore.frame.size.width, self.countScore.frame.size.height);
    } else if (scoreboardType == QJLScoreboardTypeSecondAndMS) {
        self.countScore = [QJLTimeCountView viewFromNib];
        self.countScore.frame = CGRectMake(-40, -55, self.countScore.frame.size.width, self.countScore.frame.size.height);
    }
    
    self.countScore.hidden = YES;
    if (self.guideImageView) {
        [self.view insertSubview:self.countScore belowSubview:self.guideImageView];
    } else {
        [self.view addSubview:self.countScore];
    }
}

- (void)beginRedayGoView {
    __weak __typeof(self) weakSelf = self;
    self.view.userInteractionEnabled = NO;
    [QJLReadyGoView showReadyGoViewWithSuperView:self.view completion:^{
        [weakSelf readyGoAnimationFinish];
    }];
}

- (void)showResultControllerWithNewScroe:(double)scroe unit:(NSString *)unil stage:(QJLStage *)stage isAddScore:(BOOL)isAddScroe {
    QJLResultViewController *resultVC = [[QJLResultViewController alloc] init];
    NSLog(@"%f", scroe);
    [resultVC setCountScoreWithNewScroe:scroe unit:unil stage:stage isAddScore:isAddScroe];
    [self.navigationController pushViewController:resultVC animated:NO];
}

- (void)buildStageView {
    self.stateView = [QJLStateView viewFromNib];
    self.stateView.frame = CGRectMake(0, ScreenHeight - self.stateView.frame.size.height - ScreenWidth / 3 - 10, self.stateView.frame.size.width, self.stateView.frame.size.height);
    [self.view addSubview:self.stateView];
}

@end
