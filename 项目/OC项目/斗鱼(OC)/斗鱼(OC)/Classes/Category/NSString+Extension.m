//
//  NSString+Extension.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)urlEncode {
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *data = [self dataUsingEncoding:enc];
    return [[[NSString alloc] initWithData:data encoding:enc] stringByAddingPercentEscapesUsingEncoding:enc];
}

+ (NSString *)GetNowTimes
{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
    return timeString;
}


@end
