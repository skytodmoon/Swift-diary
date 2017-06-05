//
//  MoreButton.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
#import "MoreButton.h"

@implementation MoreButton

- (instancetype)init {
    if (self = [super init]) {
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width * 0.7;
    self.titleLabel.y = 0;
    self.titleLabel.height = self.height;
    
    self.imageView.x = self.titleLabel.width;
    self.imageView.y = 0;
    self.imageView.width = self.width - self.imageView.x;
    self.imageView.height = self.height;
}


@end
