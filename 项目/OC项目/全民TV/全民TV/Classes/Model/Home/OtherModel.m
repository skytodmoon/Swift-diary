//
//  OtherModel.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "OtherModel.h"
#import "CategoryListModel.h"

@implementation OtherDataManager

@end

@implementation OtherModel

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    if (_data.count != 0)
    {
        NSMutableArray *mList = [NSMutableArray new];
        for (NSDictionary *category in _data)
        {
            CategoryListModel *model  = [CategoryListModel modelWithJSON:category];
            [mList addObject:model];
        }
        _data = mList;
    }
    return YES;
}

@end
