//
//  UIButton+Extension.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
+ (instancetype)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    return [self barButtonWithTitle:title normalColor:[UIColor orangeColor] disabledColor:[UIColor grayColor] fontSize:15.0 target:target action:action];
}

+ (instancetype)barButtonWithTitle:(NSString *)title normalColor:(UIColor *)normalColor disabledColor:(UIColor *)disabledColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    [btn setTitleColor:disabledColor forState:UIControlStateDisabled];
    CGSize rightSize = [title sizeWithFont:[UIFont systemFontOfSize:15.0]];
    btn.frame = CGRectMake(0, 0, rightSize.width, 44);
    [btn setTitle:title forState:UIControlStateNormal];
    
    return btn;
}
@end
