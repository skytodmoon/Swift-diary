//
//  BottomButton.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "BottomButton.h"

#define ImageViewHeighRatio 0.8

@implementation BottomButton
- (void)setup {
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.imageView.contentMode = UIViewContentModeCenter;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setup];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 修改图片
    self.imageView.height = (self.height * ImageViewHeighRatio * 0.8);
    self.imageView.width = self.imageView.height;
    self.imageView.x = (self.width - self.imageView.width) / 2;
    self.imageView.y = ((self.height * ImageViewHeighRatio) - self.imageView.height) / 2;
    
    // 修改标题
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height + self.imageView.y;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height * (1 - ImageViewHeighRatio);
    
}

- (void)setHighlighted:(BOOL)highlighted {}

@end