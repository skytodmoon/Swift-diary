//
//  UIBarButtonItem+Extension.m
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (instancetype)itemWithImageName:(NSString *)name highImageName:(NSString *)HName target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:HName] forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.contentMode = UIViewContentModeScaleAspectFit;
    btn.size = btn.currentImage.size;
    
    return [[self alloc] initWithCustomView:btn];
}

@end
