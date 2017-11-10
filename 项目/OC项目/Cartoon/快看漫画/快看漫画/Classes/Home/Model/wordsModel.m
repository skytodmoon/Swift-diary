//
//  wordsModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "wordsModel.h"
#import "SummaryModel.h"

@implementation wordsModel


+ (NSDictionary *)mj_objectClassInArray {
    return @{@"comics":[SummaryModel class]};
}

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    return @[@"data"];
}


@end
