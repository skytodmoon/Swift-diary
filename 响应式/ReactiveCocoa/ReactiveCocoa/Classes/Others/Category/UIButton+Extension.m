//
//  UIButton+Extension.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
- (void)title:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)image backgroundColor:(UIColor *)backgroundColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action{
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.backgroundColor = backgroundColor;
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
}
@end
