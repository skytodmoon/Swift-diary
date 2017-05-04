//
//  QJLStage08ViewController.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage08ViewController.h"
#import "QJLStage08PeopleView.h"
#import "QJLScoreboardCountView.h"
#import "PrefixHeader.pch"

@interface QJLStage08ViewController ()

@property (nonatomic, strong) QJLStage08PeopleView *photoView;

@end

@implementation QJLStage08ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildStageInfo];
}

- (void)buildStageInfo {
    [self removeAllImageView];
    UIImageView *bgImageIV = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 0, ScreenWidth + 40, ScreenHeight)];
    bgImageIV.image = [UIImage imageNamed:@"02_background01-iphone4"];
    [self.view insertSubview:bgImageIV belowSubview:self.redButton];
    
    self.photoView = [QJLStage08PeopleView viewFromNib];
    self.photoView.frame = CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - self.photoView.frame.size.height, ScreenWidth, self.photoView.frame.size.height);
    [self.view insertSubview:self.photoView aboveSubview:self.redButton];
    
    [self setButtonImage:[UIImage imageNamed:@"02_camera-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    
    [self setPhotoViewBlock];
    
    [self addButtonsActionWithTarget:self action:@selector(cameraClick:) forControlEvents:UIControlEventTouchDown];
    
    [self bringPauseAndPlayAgainToFront];
}

- (void)cameraClick:(UIButton *)sender {
    if ([self.photoView takePhotoWithIndex:(int)sender.tag]) {
        [((QJLScoreboardCountView *)self.countScore) hit];
    } else {
        [self.photoView stopTime];
        [self setButtonsIsActivate:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showGameFail];
        });
    }
}

- (void)setPhotoViewBlock {
    __weak typeof(self) weakSelf = self;
    self.photoView.startTakePhoto = ^{
        [weakSelf setButtonsIsActivate:YES];
    };
    
    self.photoView.shopTakePhoto = ^{
        [weakSelf setButtonsIsActivate:NO];
    };
    
    self.photoView.nextTakePhoto = ^(BOOL isPass){
        if (!isPass) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.photoView showModel];
            });
        } else {
            [weakSelf showResultControllerWithNewScroe:[((QJLScoreboardCountView *)weakSelf.countScore).countLabel.text intValue] unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
        }
    };
}

#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self setButtonsIsActivate:NO];
    [self.photoView showModel];
}

- (void)playAgainGame {
    [self.photoView cleanDate];
    [(QJLScoreboardCountView *)self.countScore clean];
    [super playAgainGame];
}

- (void)pauseGame {
    [self.photoView pause];
    [super pauseGame];
}

- (void)continueGame {
    [super continueGame];
    [self.photoView resume];
}

@end
