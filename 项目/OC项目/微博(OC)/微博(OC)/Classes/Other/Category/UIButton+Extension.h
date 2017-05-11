//
//  UIButton+Extension.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
/**
 *  返回一个可充当UIBarButtonItem的按钮
 */
+ (instancetype)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)barButtonWithTitle:(NSString *)title normalColor:(UIColor *)normalColor disabledColor:(UIColor *)disabledColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action;

@end
