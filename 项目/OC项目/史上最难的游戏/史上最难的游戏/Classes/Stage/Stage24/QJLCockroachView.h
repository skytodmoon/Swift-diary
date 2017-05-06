//
//  QJLCockroachView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLCockroachView : UIView

@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^showHitFinish)();

@property (nonatomic, assign) BOOL failed;

- (void)shake;
- (void)stopShake;

- (void)cockroachRunWithFail:(void (^)())finish;

- (BOOL)hitCockroach;

- (void)stopMove;
- (void)removeData;

@end
