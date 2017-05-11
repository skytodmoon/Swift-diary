//
//  UserShopCarTool.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UserShopCarTool.h"
#import "NSString+Extension.h"

@implementation UserShopCarTool

+ (instancetype)sharedInstance{
    static dispatch_once_t one;
    static UserShopCarTool *shopCarTool;
    dispatch_once(&one, ^{
        if (shopCarTool == nil) {
            shopCarTool = [[UserShopCarTool alloc]init];
        }
    });
    return shopCarTool;
}


- (NSMutableArray<Goods *> *)shopCar
{
    if (!_shopCar) {
        _shopCar = [NSMutableArray array];
    }
    return  _shopCar;
}

#pragma 添加商品
- (void)addSupermarkProductToShopCar:(Goods *)goods {
    
    
    for (Goods *obj in self.shopCar) {
        if (obj.gid == goods.gid) {
            return;
        }
    }
    [self.shopCar addObject:goods];
}
#pragma 删除商品
- (void)removeFromProductShopCar:(Goods*)goods {
    for (Goods *obj in self.shopCar) {
        if (goods.gid == obj.gid) {
            [self.shopCar removeObject:goods];
            [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarDidRemoveProductNSNotification object:self userInfo:nil];
            return ;
        }
    }
}
#pragma 获取商品的数量
- (NSInteger)getShopCarGoodsNumber {
    __block NSInteger count = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(Goods * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += obj.userBuyNumber;
    }];
    return count;
}
#pragma 获取商品用价格
- (CGFloat)getShopCarGoodsPrice {
    __block CGFloat price = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(Goods *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        price += [[obj.price cleanDecimalPointZear] doubleValue] * obj.userBuyNumber;
    }];
    return price;
}
- (BOOL)isEmpty {
    return self.shopCar.count == 0;
}



@end
