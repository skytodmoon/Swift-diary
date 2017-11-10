//
//  CommentsModel.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "CommentsModel.h"
#import "NetWorkManager.h"
#import "NSString+Extension.h"


@implementation CommentsModel

+ (NSArray<NSString *> *)setupDataFieldsIsModelArray:(BOOL *)isModelArray {
    *isModelArray = YES;
    return @[@"data",@"comments"];
}

@end
