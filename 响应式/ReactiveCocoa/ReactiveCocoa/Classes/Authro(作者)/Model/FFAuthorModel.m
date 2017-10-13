//
//  FFAuthorModel.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFAuthorModel.h"

@implementation FFAuthorModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"authorID":@"id"};
}

- (NSString *)authIconName {
    switch (self.newAuth) {
        case 1:
            return @"u_vip_yellow";
        case 2:
            return @"personAuth";
        default:
            return @"u_vip_blue";
    }
}

@end
