//
//  Goods.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "Goods.h"

@implementation GoodsData
+ (void)loadGoodsData:(CompleteBlock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"首页新鲜热卖" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    GoodsData *goodsData = [GoodsData mj_objectWithKeyValues:json];
    complete(goodsData.data,nil);
}



+ (NSDictionary *)mj_objectClassInArray {
    return @{@"data":NSStringFromClass([Goods class])};
}

@end

@implementation Goods


+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"gid" : @"id"};
}
@end
