//
//  ProductsViewController.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "BaseViewController.h"
#import "SupermarketSource.h"
#import "FlashViewController.h"

@interface ProductsViewController : BaseViewController<FlashViewControllerDelegate>
@property (nonatomic, strong) SuperMarketData *supermarketSouce;

@end
