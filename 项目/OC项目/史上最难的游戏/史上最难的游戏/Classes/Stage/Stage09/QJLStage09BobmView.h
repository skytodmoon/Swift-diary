//
//  QJLStage09BobmView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage09BobmView : UIView

@property (nonatomic, copy) void (^nextBlock)();
@property (nonatomic, copy) void (^passBlock)(NSTimeInterval score);
@property (nonatomic, copy) void (^failBlock)();

- (void)showBobm;

- (void)stopCountWithIndex:(int)index;

- (void)cleanData;

- (void)pause;

- (void)resume;

@end
