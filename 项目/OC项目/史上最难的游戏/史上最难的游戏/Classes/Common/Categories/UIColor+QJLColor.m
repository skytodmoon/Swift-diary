//
//  UIColor+QJLColor.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "UIColor+QJLColor.h"

@implementation UIColor (QJLColor)

+ (instancetype)colorWithR:(int)red g:(int)green b:(int)blue {
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
    return color;
}

+ (instancetype)random {
    return [UIColor colorWithR:arc4random_uniform(256) g:arc4random_uniform(256) b:arc4random_uniform(256)];
}

@end
