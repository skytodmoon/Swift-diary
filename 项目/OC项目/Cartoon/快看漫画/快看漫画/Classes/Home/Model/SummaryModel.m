//
//  SummaryModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "SummaryModel.h"

@implementation SummaryModel

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    *isModelArray = YES;
    return @[@"data",@"comics"];
}

@end
