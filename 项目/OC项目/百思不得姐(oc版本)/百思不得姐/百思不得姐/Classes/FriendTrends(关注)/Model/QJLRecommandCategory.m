//
//  QJLRecommandCategory.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/9.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLRecommandCategory.h"
#import "MJExtension.h"

@implementation QJLRecommandCategory

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id"
             };
}

-(NSMutableArray *)users{
    if (_users == nil) {
        _users = [[NSMutableArray alloc] init];
    }
    return _users;
}

@end
