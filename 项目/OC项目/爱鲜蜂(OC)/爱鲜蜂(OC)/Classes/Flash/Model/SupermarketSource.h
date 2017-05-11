//
//  SupermarketSource.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SuperMarketData;
@class Products;
@class ProductCategory;
@class Goods;

@interface SupermarketSource : NSObject

/** code  */
@property (nonatomic, copy) NSString *code;
/** msg  */
@property (nonatomic, copy) NSString *msg;
/** data  */
@property (nonatomic,strong)SuperMarketData *data;

+ (void)loadSupermarketData:(CompleteBlock)complete;
@end

@interface SuperMarketData : NSObject

@property (nonatomic,strong)NSArray<ProductCategory *> *categories;

@property (nonatomic,strong)id products;

@end

@interface ProductCategory : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, strong) NSArray <Goods *> *products;


@end
