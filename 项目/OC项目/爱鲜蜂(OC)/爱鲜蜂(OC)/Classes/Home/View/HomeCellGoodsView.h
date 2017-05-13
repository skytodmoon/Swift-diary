//
//  HomeCellGoodsView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeadData.h"
#import "HomeCell.h"
@interface HomeCellGoodsView : UIView
@property (nonatomic, strong) ActRow *actRow;
@property (nonatomic, copy) ClikedCellback cellback;
@end
