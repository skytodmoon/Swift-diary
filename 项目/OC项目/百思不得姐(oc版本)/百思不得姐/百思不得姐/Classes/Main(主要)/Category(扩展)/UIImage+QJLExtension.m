//
//  UIImage+QJLExtension.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/9.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "UIImage+QJLExtension.h"

@implementation UIImage (QJLExtension)

-(UIImage *)circleImage {
    //NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    //裁剪
    CGContextClip(ctx);
    //将图片画上去
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
