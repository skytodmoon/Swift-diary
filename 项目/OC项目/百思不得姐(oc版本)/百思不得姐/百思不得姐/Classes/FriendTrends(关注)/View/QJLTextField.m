//
//  QJLTextField.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/9.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLTextField.h"

static NSString *const QJLPlaceholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation QJLTextField

-(void)awakeFromNib {
    //修改占位符文字颜色
    //    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    //设置光标颜色和文字颜色一致
    self.tintColor = self.textColor;
    [self resignFirstResponder];
}

/**
 *  当前文本框聚焦时就会调用
 */
-(BOOL)becomeFirstResponder {
    //修改占位符文字颜色
    [self setValue:self.textColor forKeyPath:QJLPlaceholderColorKeyPath];
    return [super becomeFirstResponder];
}

/**
 *  当前文本框失去焦点时就会调用
 */
-(BOOL)resignFirstResponder {
    //修改占位符文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:QJLPlaceholderColorKeyPath];
    return [super resignFirstResponder];
}

@end
