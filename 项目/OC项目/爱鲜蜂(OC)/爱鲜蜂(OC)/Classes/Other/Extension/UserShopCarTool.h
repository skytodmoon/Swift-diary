//
//  UserShopCarTool.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Goods.h"

@interface UserShopCarTool : NSObject
@property (nonatomic, strong) NSMutableArray <Goods *> *shopCar;

+ (instancetype)sharedInstance;
- (void)addSupermarkProductToShopCar:(Goods *)goods;
- (void)removeFromProductShopCar:(Goods*)goods;
- (CGFloat)getShopCarGoodsPrice ;
- (NSInteger)getShopCarGoodsNumber;
- (BOOL)isEmpty;

@end
