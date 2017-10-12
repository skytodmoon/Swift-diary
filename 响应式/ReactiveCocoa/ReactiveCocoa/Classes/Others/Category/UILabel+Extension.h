//
//  UILabel+Extension.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
- (void)textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;
- (void)textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment fontSize:(CGFloat)fontSize;
- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;
- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize fontName:(NSString *)fontName;
@end
