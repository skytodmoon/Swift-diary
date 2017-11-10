//
//  CollectionComicModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "CollectionComicModel.h"

@implementation CollectionComicModel

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    *isModelArray = YES;
    return @[@"data",@"comics"];
}


@end
