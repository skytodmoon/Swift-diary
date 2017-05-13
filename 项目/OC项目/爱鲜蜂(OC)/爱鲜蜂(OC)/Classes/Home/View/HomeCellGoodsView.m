//
//  HomeCellGoodsView.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeCellGoodsView.h"


#define maxCount 3
@implementation HomeCellGoodsView

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        for (int i = 0; i < maxCount; ++i) {
            HomeCell *homeCell = [[HomeCell alloc]init];
            homeCell.layer.borderWidth = 0.5;
            homeCell.layer.borderColor = GrayColor.CGColor;
            [self addSubview:homeCell];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cellHeight = self.frame.size.height;
    CGFloat cellWidth = self.frame.size.width / 3;
    CGFloat index = 0;
    for (HomeCell *cell in self.subviews) {
        cell.frame = CGRectMake(cellWidth * index, 0, cellWidth, cellHeight);
        index ++;
    }
}

- (void)setActRow:(ActRow *)actRow{
    for (int i = 0; i < self.subviews.count; ++i) {
        // 设置数据
        HomeCell *cell = self.subviews[i];
        cell.zearNeverShow = YES;
        cell.goods = actRow.category_detail.goods[i];
        
    }
}
- (void)setCellback:(ClikedCellback)cellback{
    _cellback = cellback;
    for (int i = 0; i < self.subviews.count; ++i) {
        // 设置数据
        HomeCell *cell = self.subviews[i];
        cell.cellback = cellback;
    }
}


@end
