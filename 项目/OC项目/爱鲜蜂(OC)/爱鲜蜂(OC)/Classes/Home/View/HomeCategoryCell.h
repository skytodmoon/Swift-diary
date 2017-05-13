//
//  HomeCategoryCell.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeadData.h"
#import "HomeCellTitleView.h"
#import "HomeCellGoodsView.h"

@interface HomeCategoryCell : UICollectionViewCell
@property (nonatomic, strong) ActRow *cellInfo;
@property (nonatomic, copy) ClikedCellback cellback;

@end
