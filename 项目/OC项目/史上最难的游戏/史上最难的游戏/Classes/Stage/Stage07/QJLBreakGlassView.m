//
//  QJLBreakGlassView.m
//  Game
//
//  Created by 金亮齐 on 16/7/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLBreakGlassView.h"

@interface QJLBreakGlassView ()

@property (weak, nonatomic) IBOutlet UIImageView *bottomIV;
@property (weak, nonatomic) IBOutlet UIImageView *topIV;
@property (weak, nonatomic) IBOutlet UIImageView *lightIV;

@end

@implementation QJLBreakGlassView

- (void)showBreakGlass {
    [UIView animateWithDuration:0.5 animations:^{
        self.bottomIV.alpha = 0;
        self.topIV.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
