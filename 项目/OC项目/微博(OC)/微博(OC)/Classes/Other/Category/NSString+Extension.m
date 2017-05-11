//
//  NSString+Extension.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CGSize)sizeWithFontSize:(CGFloat)fontSize
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica" size:fontSize];
    CGSize size = [self sizeWithAttributes:attributes];
    return size;
}

- (CGRect)boundsWithFontSize:(CGFloat)fontSize textWidth:(CGFloat)width
{
    CGSize textSize = CGSizeMake(width, MAXFLOAT);
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica" size:fontSize];
    CGRect frame = [self boundingRectWithSize:textSize
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributes
                                      context:nil];
    return frame;
}
@end
