//
//  FFSpecialModel.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFSpecialModel.h"

@implementation FFCategoryModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"categoryID":@"id"};
}

@end

@implementation FFSpecialModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"articleID":@"id"};
}

@end
