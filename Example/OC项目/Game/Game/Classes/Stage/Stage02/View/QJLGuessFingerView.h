//
//  QJLGuessFingerView.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLGuessFingerView : UIView

@property (nonatomic, copy) void (^animationFinish)(int winIndex);

- (void)startAnimationWithDuration:(NSTimeInterval)duration;

- (void)showResultAnimationCompletion:(void (^)())completion;

- (void)cleanData;

@end
