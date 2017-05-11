//
//  SupermarketSource.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SupermarketSource.h"

#import "Goods.h"

@implementation SupermarketSource

+ (void)loadSupermarketData:(CompleteBlock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"supermarket" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    SupermarketSource *source = [SupermarketSource mj_objectWithKeyValues:json];
    SuperMarketData *superMarketData = source.data;
    for (NSInteger i = 0; i < superMarketData.categories.count; i++) {
        ProductCategory *catgeory = superMarketData.categories[i];
        NSArray *productsArr = superMarketData.products[catgeory.id];
        catgeory.products = [Goods mj_objectArrayWithKeyValuesArray:productsArr];
    }
    complete(superMarketData,nil);
}
@end


@implementation SuperMarketData

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"categories":NSStringFromClass([ProductCategory class])};
}

@end


@implementation ProductCategory


+ (NSDictionary *)mj_objectClassInArray {
    return @{@"products":NSStringFromClass([Goods class])};
}


@end
