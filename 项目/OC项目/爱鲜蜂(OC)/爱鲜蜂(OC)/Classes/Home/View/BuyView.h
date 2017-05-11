//
//  BuyView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Goods.h"

@interface BuyView : UIView
/*
 * 是否显示0
 */
@property (nonatomic, assign) BOOL zearIsShow;
/*
 * 关联的商品模型
 */
@property (nonatomic, strong) Goods *goods;
/*
 * 不显示减号
 */
@property (nonatomic, assign) BOOL zearNeverShow;

@end
