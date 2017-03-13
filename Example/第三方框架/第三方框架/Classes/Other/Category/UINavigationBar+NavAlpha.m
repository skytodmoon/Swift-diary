//
//  UINavigationBar+NavAlpha.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UINavigationBar+NavAlpha.h"

@implementation UINavigationBar (NavAlpha)
static char alView;

-(void)setAlphaView:(UIView *)alphaView
{
    objc_setAssociatedObject(self, &alView, alphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)alphaView
{
    return  objc_getAssociatedObject(self, &alView);
    
}

/** 设置渐变 */
- (void)cnSetBackgroundColor:(UIColor *)backgroundColor
{
    
    if (!self.alphaView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.alphaView.userInteractionEnabled = NO;
        self.alphaView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.alphaView atIndex:0];
    }
    
    self.alphaView.backgroundColor = backgroundColor;
    
}

- (void)cnReset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:nil];
    [self.alphaView removeFromSuperview];
    self.alphaView = nil;
}


@end
