//
//  QJLBusView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLBusView : UIView

@property (nonatomic, copy) void (^busPassFinish)();
@property (nonatomic, copy) void (^guessSucess)();
@property (nonatomic, copy) void (^stopCountTime)();

- (void)showBus;

- (BOOL)guessWithIndex:(NSInteger)index;

- (void)showCorrectBus;

- (void)pause;
- (void)resume;
- (void)removeData;

@end
