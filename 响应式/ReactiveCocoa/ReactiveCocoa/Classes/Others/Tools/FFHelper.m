//
//  FFHelper.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFHelper.h"

@implementation FFHelper

+ (NSString *)connectBaseUrl:(NSString *)baseUrl params:(NSMutableDictionary *)params {
    
    NSString *str = @"&";
    for(id key in params) {
        str = [str stringByAppendingString:key];
        str = [str stringByAppendingString:@"＝"];
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%@",[params objectForKey:key]]];
        str = [str stringByAppendingString:@"&"];
    }
    
    if (str.length > 1) {// 处理多余的&以及返回含参url
        str = [str substringToIndex:str.length - 1];// 去掉末尾的&
        return [baseUrl stringByAppendingString:str];// 返回含参url
    }
    return Nil;
}

@end
