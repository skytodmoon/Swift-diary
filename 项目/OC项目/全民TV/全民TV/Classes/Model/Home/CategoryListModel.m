//
//  CategoryListModel.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "CategoryListModel.h"

@implementation CategoryModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"categoryId":@"id",
             @"isDefault" : @"is_default"};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    if (_list.count != 0)
    {
        NSMutableArray *mList = [NSMutableArray new];
        for (NSDictionary *category in _list)
        {
            CategoryListModel *model  = [CategoryListModel modelWithJSON:category];
            [mList addObject:model];
        }
        _list = mList;
    }
    return YES;
}


@end



@implementation CategoryListModel


+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"categoryName":@"category_name",
             @"categoryId" : @"category_id",
             @"categorySlug":@"category_slug"};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    NSInteger watch = [_view integerValue];
    if (watch > 10000)
    {
        _view = [NSString stringWithFormat:@"%.1f万",watch/10000.f];
    }
    return YES;
}

@end
