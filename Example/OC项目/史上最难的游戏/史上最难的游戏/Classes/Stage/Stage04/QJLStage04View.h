//
//  QJLStage04View.h
//  Game
//
//  Created by 金亮齐 on 16/7/15.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage04View : UIView

@property (nonatomic, copy) void(^stopTime)(int count);
@property (nonatomic, copy) void(^showResult)();
@property (nonatomic, copy) void(^stopAnimationDidFinish)();
@property (nonatomic, copy) void(^passStage)();
@property (nonatomic, copy) void(^failBlock)();
@property (nonatomic, copy) void(^btnToFront)();
@property (nonatomic, weak) UIImageView *bgIV;

- (void)start;

- (void)runLeft;
- (void)runRight;

- (void)playAgain;


@end
