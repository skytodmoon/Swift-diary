//
//  VerticalButton.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "VerticalButton.h"

@implementation VerticalButton


- (void)setup {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
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
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    // 修改标题
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height + 5;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    
    self.imageView.layer.cornerRadius = self.imageView.width / 2;
    self.imageView.clipsToBounds = YES;
}
@end
