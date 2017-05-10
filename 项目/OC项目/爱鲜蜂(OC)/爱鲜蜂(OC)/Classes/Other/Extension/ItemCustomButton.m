//
//  ItemCustomButton.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ItemCustomButton.h"

@implementation ItemCustomButton

@end

@implementation ItemLeftButton

//MARK: -  重写设置frmas方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat heith = self.frame.size.height;
    CGFloat offset = -20;
    self.titleLabel.frame = CGRectMake(offset, heith-15, width, 15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, heith-15);
    // 设置图片不拉伸
    self.imageView.contentMode = UIViewContentModeCenter;
}

@end

@implementation ItemRighButton

//MARK: - 重写设置frmas方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat heith = self.frame.size.height;
    CGFloat offset = 20;
    self.titleLabel.frame = CGRectMake(offset, heith-15, width, 15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, heith-15);
    // 设置图片不拉伸
    self.imageView.contentMode = UIViewContentModeCenter;
}
@end
