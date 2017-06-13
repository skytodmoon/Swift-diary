//
//  QuickLoginButton.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


//此方法用于调整Button内部图片和字体的位置和尺寸。

#import "QuickLoginButton.h"

@implementation QuickLoginButton
- (void)awakeFromNib
{
    [self setup];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    //设置字体居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置图片位置和尺寸
    self.imageView.sy_y = 0;
    self.imageView.sy_centerX = self.sy_width * 0.5;
    
    //设置文字的尺寸
    self.titleLabel.sy_y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.sy_x = 0;
    self.titleLabel.sy_width = self.sy_width;
    self.titleLabel.sy_height = self.sy_height - self.imageView.sy_height;
}
@end
