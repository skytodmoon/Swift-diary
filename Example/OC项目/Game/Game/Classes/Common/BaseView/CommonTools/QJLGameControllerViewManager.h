//
//  QJLGameControllerViewManager.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QJLBaseGameViewController.h"

@interface QJLGameControllerViewManager : NSObject

+ (QJLBaseGameViewController *)viewControllerWithStage:(QJLStage *)stage;

@end
