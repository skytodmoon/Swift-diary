//
//  QJLGameControllerViewManager.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLGameControllerViewManager.h"
#import "QJLRYBViewController.h"
#import "QJLStage01ViewController.h"
#import "QJLStage02ViewController.h"
#import "QJLStage03ViewController.h"
#import "QJLStage04ViewController.h"
#import "QJLStage05ViewController.h"
#import "QJLStage06ViewController.h"
#import "QJLStage07ViewController.h"
#import "QJLStage08ViewController.h"
#import "QJLStage09ViewController.h"
#import "QJLStage10ViewController.h"
#import "QJLStage11ViewController.h"
#import "QJLStage12ViewController.h"
#import "QJLStage13ViewController.h"
#import "QJLStage14ViewController.h"
#import "QJLStage15ViewController.h"
#import "QJLStage16ViewController.h"
#import "QJLStage17ViewController.h"
#import "QJLStage18ViewController.h"
#import "QJLStage19ViewController.h"
#import "QJLStage20ViewController.h"
#import "QJLStage21ViewController.h"
#import "QJLStage22ViewController.h"
#import "QJLStage23ViewController.h"
#import "QJLStage24ViewController.h"
@implementation QJLGameControllerViewManager

+ (QJLBaseGameViewController *)viewControllerWithStage:(QJLStage *)stage {
    QJLBaseGameViewController *gameVC;
    
    switch (stage.num) {
        case 1:
            gameVC = [QJLStage01ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = QJLScoreboardTypeCountPTS;
            break;
        case 2:
            gameVC = [QJLStage02ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 3:
            gameVC = [QJLStage03ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeReplaceClick;
            gameVC.scoreboardType = QJLScoreboardTypeSecondAndMS;
            break;
        case 4:
            gameVC = [QJLStage04ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeReplaceClick;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 5:
            gameVC = [QJLStage05ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = QJLScoreboardTypeSecondAndMS;
            break;
        case 6:
            gameVC = [QJLStage06ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = QJLScoreboardTypeSecondAndMS;
            break;
        case 7:
            gameVC = [QJLStage07ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = QJLScoreboardTypeSecondAndMS;
            break;
        case 8:
            gameVC = [QJLStage08ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = QJLScoreboardTypeCountPTS;
            break;
        case 9:
            gameVC = [QJLStage09ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeNone;
            break;
        case 10:
            gameVC = [QJLStage10ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = QJLScoreboardTypeSecondAndMS;
            break;
        case 11:
            gameVC = [QJLStage11ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 12:
            gameVC = [QJLStage12ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeCountPTS;
            break;
        case 13:
            gameVC = [QJLStage13ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 14:
            gameVC = [QJLStage14ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeSecondAndMS;
            break;
        case 15:
            gameVC = [QJLStage15ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeSecondAndMS;
            break;
        case 16:
            gameVC = [QJLStage16ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeReplaceClick;
            gameVC.scoreboardType = QJLScoreboardTypeCountPTS;
            break;
        case 17:
            gameVC = [QJLStage17ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeNone;
            break;
        case 18:
            gameVC = [QJLStage18ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 19:
            gameVC = [QJLStage19ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 20:
            gameVC = [QJLStage20ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLScoreboardTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 21:
            gameVC = [QJLStage21ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 22:
            gameVC = [QJLStage22ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 23:
            gameVC = [QJLStage23ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        case 24:
            gameVC = [QJLStage24ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = QJLGameGuideTypeNone;
            gameVC.scoreboardType = QJLScoreboardTypeTimeMS;
            break;
        default:
            break;
    }
    
    return gameVC;
}

@end
