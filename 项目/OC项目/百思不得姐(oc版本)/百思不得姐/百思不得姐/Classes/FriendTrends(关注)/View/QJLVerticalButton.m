//
//  QJLVerticalButton.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/7.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLVerticalButton.h"
#import "UIView+QJLExtension.h"

@implementation QJLVerticalButton

-(void)setup {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)awakeFromNib {
    [self setup];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    //调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    //调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

@end
