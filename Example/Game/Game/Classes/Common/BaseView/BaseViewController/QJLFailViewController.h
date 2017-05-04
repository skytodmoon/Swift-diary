//
//  QJLFailViewController.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJLStage.h"

@interface QJLFailViewController : UIViewController

@property (nonatomic, strong) QJLStage *stage;

+ (instancetype)initWithStage:(QJLStage *)stage retryButtonClickBlock:(void(^)())retryButtonClickBlock;

@end
