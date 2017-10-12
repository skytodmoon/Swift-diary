//
//  UILabel+Extension.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
- (void)textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize{
    self.font = [UIFont systemFontOfSize:fontSize];
    self.textColor = textColor;
    
}

- (void)textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment fontSize:(CGFloat)fontSize{
    [self textColor:textColor fontSize:fontSize];
    self.textAlignment = textAlignment;
}

- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize{
    [self textColor:textColor fontSize:fontSize];
    self.text = text;
}

- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize fontName:(NSString *)fontName{
    [self text:text textColor:textColor fontSize:fontSize];
    self.font = [UIFont fontWithName:fontName size:fontSize];
}

@end
