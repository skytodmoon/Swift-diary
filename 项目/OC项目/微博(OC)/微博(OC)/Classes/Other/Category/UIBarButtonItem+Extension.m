//
//  UIBarButtonItem+Extension.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (instancetype)itemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName
{
    UIButton *item = [[UIButton alloc] init];
    UIImage *bgImage = [UIImage imageNamed:imageName];
    UIImage *highlightedBgImage = [UIImage imageNamed:highlightedImageName];
    [item setBackgroundImage:bgImage forState:UIControlStateNormal];
    [item setBackgroundImage:highlightedBgImage forState:UIControlStateHighlighted];
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    item.bounds = (CGRect){CGPointZero, bgImage.size};
    return [[UIBarButtonItem alloc] initWithCustomView:item];
}

@end
