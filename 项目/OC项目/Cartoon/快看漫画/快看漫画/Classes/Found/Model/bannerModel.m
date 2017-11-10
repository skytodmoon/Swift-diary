//
//  bannerModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "bannerModel.h"

@implementation bannerModel
+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    *isModelArray = YES;
    return @[@"data",@"banner_group"];
}


@end
