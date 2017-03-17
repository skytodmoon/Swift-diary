//
//  UIBarButtonItem+Extension.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    //设置按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = button.currentBackgroundImage.size;
    return [[self alloc] initWithCustomView:button];
}

@end
