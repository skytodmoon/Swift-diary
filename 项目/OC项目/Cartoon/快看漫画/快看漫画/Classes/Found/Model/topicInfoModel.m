//
//  topicInfoModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "topicInfoModel.h"
#import "bannersModel.h"

@implementation topicInfoModel

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    *isModelArray = YES;
    return @[@"data",@"infos"];
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"topics" : [topicModel class],
             @"banners": [bannersModel class]};
}

@end
