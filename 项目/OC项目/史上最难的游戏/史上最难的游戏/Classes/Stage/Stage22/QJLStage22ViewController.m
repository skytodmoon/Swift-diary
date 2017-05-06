//
//  QJLStage22ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage22ViewController.h"
#import "QJLStage22PeopleView.h"
#import "QJLCountTimeView.h"
#import "PrefixHeader.pch"

typedef NS_ENUM(NSInteger, QJLStatusResultType) {
    QJLStatusResultTypeInsanelyFast = 0,
    QJLStatusResultTypeVeryFast,
    QJLStatusResultTypeFast
};

@interface QJLStage22ViewController ()
{
    BOOL _isCountTime;
}

@property (nonatomic, strong) UIImageView *bottomStatusView;
@property (nonatomic, strong) QJLStage22PeopleView *peopleView;
@property (nonatomic, assign) int allScore;

@property (nonatomic, strong) UIImageView        *winImageView;
@property (nonatomic, strong) UIImageView        *resultImageView;
@property (nonatomic, strong) QJLStrokeLabel     *resultLabel;

@property (nonatomic, assign) BOOL playAgain;

@property (nonatomic, assign) int count;

@end

@implementation QJLStage22ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    [self setButtonImage:[UIImage imageNamed:@"24_fart-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    
    [self buildBottomView];
    
    [self buildPeopleView];
    
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self buildResultLabel];
}

- (void)buildResultLabel {
    self.resultImageView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 200) * 0.5 - 50, ScreenHeight - ScreenWidth / 3 - 150, 200, 100)];
    self.resultImageView.hidden = YES;
    self.resultImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.resultImageView];
    
    self.resultLabel = [[QJLStrokeLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.resultImageView.frame) - 30, 0, 100, 60)];
    self.resultLabel.center = CGPointMake(self.resultLabel.center.x, self.resultImageView.center.y);
    self.resultLabel.textAlignment = NSTextAlignmentCenter;
    self.resultLabel.font = [UIFont boldSystemFontOfSize:50];
    self.resultLabel.textColor = [UIColor colorWithRed:228 / 255.0 green:120 / 255.0 blue:11 / 255.0 alpha:1];
    [self.resultLabel setTextStorkeWidth:5];
    self.resultLabel.hidden = YES;
    [self.view addSubview:self.resultLabel];
}

- (void)buildBottomView {
    self.bottomStatusView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight - ScreenWidth / 3, ScreenWidth, ScreenWidth / 3)];
    self.bottomStatusView.image = [UIImage imageNamed:@"24_watch-iphone4"];
    self.bottomStatusView.hidden = YES;
    [self.view addSubview:self.bottomStatusView];
}

- (void)buildPeopleView {
    self.peopleView = [[QJLStage22PeopleView alloc] init];
    [self.view insertSubview:self.peopleView belowSubview:self.redButton];
    
    self.peopleView.redIV = self.redImageView;
    self.peopleView.yellowIV = self.yellowImageView;
    self.peopleView.blueIV = self.blueImageView;
    
    [self bringPauseAndPlayAgainToFront];
    
    __weak typeof(self) weakSelf = self;
    self.peopleView.fartFinish = ^{
        weakSelf.playAgain = NO;
        weakSelf.bottomStatusView.image = [UIImage imageNamed:@"24_yourturn-iphone4"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.bottomStatusView.hidden = YES;
            [weakSelf setButtonsIsActivate:YES];
        });
    };
    
    self.peopleView.sucess = ^{
        
        [weakSelf setButtonsIsActivate:NO];
        
        [(QJLCountTimeView *)weakSelf.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            int onceTime = (second * 1000 + ms / 60.0 * 1000) / weakSelf.peopleView.count;
            QJLStatusResultType type;
            
            if (onceTime < 300) {
                type = QJLStatusResultTypeInsanelyFast;
            } else if (onceTime < 500) {
                type = QJLStatusResultTypeVeryFast;
            } else {
                type = QJLStatusResultTypeFast;
            }
            
            [weakSelf showResultWithType:type];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                if (weakSelf.count == 12) {
                    [weakSelf showResultControllerWithNewScroe:weakSelf.allScore unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
                } else {
                    
                    weakSelf.resultLabel.hidden = YES;
                    weakSelf.resultImageView.hidden = YES;
                    [(QJLCountTimeView *)weakSelf.countScore cleanData];
                    
                    _isCountTime = NO;
                    
                    weakSelf.bottomStatusView.hidden = NO;
                    weakSelf.bottomStatusView.image = [UIImage imageNamed:@"24_watch-iphone4"];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        if (!weakSelf.playAgain) {
                            [weakSelf.peopleView startFart];
                            weakSelf.count++;
                        }
                        
                    });
                    
                }
                
            });
            
        }];
    };
}

- (void)showResultWithType:(QJLStatusResultType)type {
    
    if (type == QJLStatusResultTypeInsanelyFast) {
        self.resultImageView.image = [UIImage imageNamed:@"09_fraction01-iphone4"];
        self.resultLabel.text = @"+6";
        self.allScore += 6;
    } else if (type == QJLStatusResultTypeVeryFast) {
        self.resultImageView.image = [UIImage imageNamed:@"09_fraction02-iphone4"];
        self.resultLabel.text = @"+3";
        self.allScore += 3;
    } else {
        self.resultImageView.image = [UIImage imageNamed:@"09_fraction03-iphone4"];
        self.resultLabel.text = @"+1";
        self.allScore += 1;
    }
    
    self.resultLabel.hidden = NO;
    self.resultImageView.hidden = NO;
}

- (void)showBadView {
    UIImageView *xIV = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(180), 200, 180, 180)];
    xIV.image = [UIImage imageNamed:@"00_cross-iphone4"];
    [self.view addSubview:xIV];
    
    UIImageView *badIV = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(260) + 130, 0, 260, 142)];
    badIV.layer.anchorPoint = CGPointMake(1, 0.5);
    badIV.center = CGPointMake(badIV.center.x, xIV.center.y);
    badIV.image = [UIImage imageNamed:@"00_bad-iphone4"];
    [self.view addSubview:badIV];
    
    NSString *badName = [NSString stringWithFormat:@"instantFail0%d.mp3", arc4random_uniform(3) + 2];
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:badName];

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        badIV.transform = CGAffineTransformMakeRotation(-M_PI_4);
    } completion:^(BOOL finished) {
        [self showResultControllerWithNewScroe:self.allScore unit:@"PTS" stage:self.stage isAddScore:YES];
    }];
}

#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    
    if (!_isCountTime) {
        _isCountTime = YES;
        
        [(QJLCountTimeView *)self.countScore startCalculateTime];
    }
    
    if (![self.peopleView fartWithIndex:(int)sender.tag]) {
        self.view.userInteractionEnabled = NO;
        
        [(QJLCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:nil];
        
        [self showBadView];
    }
}

#pragma mark - Super Method

- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    
    self.count = 0;
     self.allScore = 0;
    [self setButtonsIsActivate:NO];
    
    self.bottomStatusView.hidden = NO;
    self.bottomStatusView.image = [UIImage imageNamed:@"24_watch-iphone4"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.peopleView startFart];
        self.count++;
    });
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
    self.bottomStatusView.hidden = YES;
    [(QJLCountTimeView *)self.countScore cleanData];
   
    self.resultLabel.hidden = YES;
    self.resultImageView.hidden = YES;
    
    self.playAgain = YES;
    
    [self.peopleView removeData];
    self.peopleView = nil;
    
    [self buildPeopleView];
    
    [super playAgainGame];
}

@end
