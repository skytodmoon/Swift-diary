//
//  QJLBobmView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLBobmView : UIView

@property (nonatomic, copy) void (^timeOver)();

- (void)startCountDown;

- (NSTimeInterval)stopCountDown;

- (void)pasueCountDown;

- (void)resumeCountDown;

- (void)clean;

- (void)cleanLabelStage;

@end
