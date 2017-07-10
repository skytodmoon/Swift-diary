//
//  RecommendCell.h
//  美团
//
//  Created by 金亮齐 on 2017/7/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"
#import "DisDealModel.h"

@interface RecommendCell : UITableViewCell
@property(nonatomic, strong) UIImageView *shopImage;
@property(nonatomic, strong) UILabel *shopNameLabel;
@property(nonatomic, strong) UILabel *shopInfoLabel;
@property(nonatomic, strong) UILabel *priceLabel;
@property(nonatomic, strong) UILabel *soldedLabel;


@property(nonatomic, strong) RecommendModel *recommendData;

@property(nonatomic, strong) DisDealModel *dealData;
@end
