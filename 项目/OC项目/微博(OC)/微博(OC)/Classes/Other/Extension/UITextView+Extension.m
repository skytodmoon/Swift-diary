//
//  UITextView+Extension.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UITextView+Extension.h"

@implementation UITextView (Extension)
-(void)insertAttributeText:(NSAttributedString *)text {
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]init];
    //拼接之前的文件
    [attributedText appendAttributedString:self.attributedText];
   
    //拼接图片
    NSUInteger loc = self.selectedRange.location;
    //[attributedText insertAttributedString:text atIndex:loc];
    [attributedText replaceCharactersInRange:self.selectedRange withAttributedString:text];
    [attributedText addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attributedText.length)];

    self.attributedText = attributedText;
    
    //移除光标到表情的后面
    self.selectedRange = NSMakeRange(loc + 1, 0);
   
}


@end
