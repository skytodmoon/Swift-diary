//
//  QJLDiceView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLDiceView : UIView

@property (nonatomic, copy) void (^shakeDiceFinish)();

- (void)startShakeDiceWithFirstDiceNumber:(int)number1 secoundDiceNumber:(int)number2 thridDiceNumber:(int)number3 shakeDuration:(NSInteger)duration;

- (void)pause;
- (void)resume;

- (void)removeData;

@end
