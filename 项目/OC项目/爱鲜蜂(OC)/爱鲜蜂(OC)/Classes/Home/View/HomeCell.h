//
//  HomeCell.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
#import "Goods.h"

typedef NS_ENUM(NSInteger, HomeCellType) {
    HomeCellTypeVertical,
    HomeCellTypeHorizontal
};
@interface HomeCell : UICollectionViewCell
@property (nonatomic,strong) Goods *goods;
@property (nonatomic,strong) Activity *activity;
@property (nonatomic) BOOL buyViewShowZear;

@end
