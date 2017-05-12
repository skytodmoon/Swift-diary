//
//  UIBarButtonItem+Extension.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"


@implementation UIBarButtonItem (Extension)



+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image heighlightImage:(NSString *)heilightImage {
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:heilightImage] forState:UIControlStateHighlighted];
    
    btn.size = btn.currentBackgroundImage.size;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];

   
}



@end
