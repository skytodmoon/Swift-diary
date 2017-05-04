//
//  QJLCountDownLabel.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStrokeLabel.h"

@interface QJLCountDownLabel : QJLStrokeLabel

- (instancetype)initWithFrame:(CGRect)frame startTime:(double)time textSize:(CGFloat)size;

- (void)startCountDownWithCompletion:(void (^)(void))completion;
- (void)pause;
- (void)continueWork;
- (void)clean;
- (void)setTextColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;;

@end
