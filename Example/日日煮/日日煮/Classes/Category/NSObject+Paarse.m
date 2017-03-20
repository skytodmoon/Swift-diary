//
//  NSObject+Paarse.m
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NSObject+Paarse.h"

@implementation NSObject (Paarse)

+ (id)parseJSON:(id)json{
    if([json isKindOfClass:[NSDictionary class]]){
        return [self modelWithJSON:json];
    }
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    return json;
}

@end
