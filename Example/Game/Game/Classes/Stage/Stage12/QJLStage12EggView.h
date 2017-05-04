//
//  QJLStage12EggView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage12EggView : UIView

@property (nonatomic, copy) void (^failBlock)(NSInteger index);
@property (nonatomic, copy) void (^nextDropEggBlock)();
@property (nonatomic, copy) void (^passStageBlock)();

@property (nonatomic, weak) UIButton *redButton;
@property (nonatomic, weak) UIButton *yellowButton;
@property (nonatomic, weak) UIButton *blueButton;


- (void)showEgg;
- (void)pause;
- (void)resume;

- (void)failWithIndex:(NSInteger)index;

- (NSInteger)grabWithIndex:(NSInteger)index;

- (void)cleanData;

@end
