//
//  QJLStage11View.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage11View : UIView

@property (nonatomic, copy) void (^handViewShowAnimation) (BOOL isRight);
@property (nonatomic, copy) void (^passState)();

- (void)showSubjectViewWithNums:(void (^)(int index1, int index2, int index3))nums;

- (void)guessResult:(int)result;

- (void)showHandViewAnimationFinish:(void (^) (void))finish;

- (void)cleanData;

- (void)setSubjectPlayAgain;

@end
