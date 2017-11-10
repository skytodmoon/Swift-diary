//
//  comicsModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "comicsModel.h"

#import "NetWorkManager.h"
#import "NSString+Extension.h"


@implementation comicsModel

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    return @[@"data"];
}

@end
