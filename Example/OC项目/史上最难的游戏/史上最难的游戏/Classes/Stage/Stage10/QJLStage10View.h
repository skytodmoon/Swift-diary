//
//  QJLStage10View.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage10View : UIView

@property (nonatomic, copy) void (^AnimationFinishBlock)(BOOL isFrist);
@property (nonatomic, copy) void (^StopCountTimeBlock)();
@property (nonatomic, copy) void (^NextBlock)();
@property (nonatomic, copy) void (^FailBlock)();
@property (nonatomic, copy) void (^PassStageBlock)();

@property (nonatomic, assign) BOOL isAnimation;

- (void)startRotation;
- (BOOL)clickWithIndex:(int)index;

- (void)pause;
- (void)resume;

- (void)cleanData;

@end
