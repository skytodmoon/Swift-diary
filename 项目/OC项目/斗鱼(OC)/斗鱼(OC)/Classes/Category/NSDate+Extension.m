//
//  NSDate+Extension.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)nowDateString {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm";
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    return [fmt stringFromDate:[NSDate date]];
}

@end
