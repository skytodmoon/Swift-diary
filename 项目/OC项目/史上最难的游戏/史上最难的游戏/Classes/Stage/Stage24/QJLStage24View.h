//
//  QJLStage24View.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage24View : UIView

@property (nonatomic, copy) void (^startCountTime)(BOOL isFrist);
@property (nonatomic, copy) void (^finish)();
@property (nonatomic, copy) void (^fail)();

- (void)startAppearCockroach;
- (void)showNextVovkroach;

- (BOOL)hitCockroachWithIndex:(NSInteger)index;

- (void)removeFromSuperview;

@end
