//
//  QJLBaseGameViewController.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJLScoreboardCountView.h"
#import "QJLResultViewController.h"
#import "QJLStage.h"
#import "QJLStateView.h"

typedef NS_ENUM(NSInteger, QJLGameGuideType) {
    QJLGameGuideTypeNone = 0,
    QJLGameGuideTypeOneFingerClick,
    QJLGameGuideTypeReplaceClick,
    QJLGameGuideTypeMultiPointClick
};

typedef NS_ENUM(NSInteger, QJLScoreboardType) {
    QJLScoreboardTypeNone = 0,
    QJLScoreboardTypeCountPTS,
    QJLScoreboardTypeTimeMS,
    QJLScoreboardTypeSecondAndMS,
};

typedef NS_ENUM(NSInteger, QJLADType) {
    QJLADTypeBlog = 0,
    QJLADTypeWeiBo,
    QJLADTypeGithub
};

@interface QJLBaseGameViewController : UIViewController

@property (nonatomic, assign) QJLGameGuideType  guideType;
@property (nonatomic, assign) QJLScoreboardType scoreboardType;
@property (nonatomic, strong) QJLStage          *stage;

@property (nonatomic, strong) UIView            *countScore;

@property (nonatomic, strong) UIImageView       *guideImageView;
@property (nonatomic, strong) UIButton          *playAgainButton;
@property (nonatomic, strong) UIButton          *pauseButton;

@property (nonatomic, strong) QJLStateView      *stateView;

- (void)beginGame;
- (void)endGame;
- (void)beginRedayGoView;
- (void)readyGoAnimationFinish;
- (void)pauseGame;
- (void)continueGame;
- (void)playAgainGame;
- (void)showGameFail;

- (void)showResultControllerWithNewScroe:(double)scroe
                                    unit:(NSString *)unil
                                   stage:(QJLStage *)stage
                              isAddScore:(BOOL)isAddScroe;

- (void)buildStageInfo;

- (void)bringPauseAndPlayAgainToFront;

- (void)buildStageView;

@end
