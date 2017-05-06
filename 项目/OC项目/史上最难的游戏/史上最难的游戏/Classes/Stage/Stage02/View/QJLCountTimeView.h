//
//  QJLCountTimeView.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLCountTimeView : UIView

@property (nonatomic, copy) void(^TimeOutBlock)(void);

@property (nonatomic, assign) BOOL notHasTimeOut;

- (void)startAnimationWithCompletion:(void (^)(BOOL))completion;

- (void)startCalculateByTimeWithTimeOut:(void(^)())timeOutBlock outTime:(NSTimeInterval)outTime;
- (void)startCalculateTime;

- (void)stopCalculateByTimeWithTimeBlock:(void(^)(int second, int ms))timeBlock;

- (void)cleanData;

- (void)pause;
- (void)continueGame;

@end
