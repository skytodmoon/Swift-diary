//
//  HomeCategoryCell.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeCategoryCell.h"


@interface HomeCategoryCell ()
@property (nonatomic, strong) HomeCellTitleView *titleView;
@property (nonatomic, strong) UIImageView *sortImage;
@property (nonatomic, strong) HomeCellGoodsView *goodsView;
@end

@implementation HomeCategoryCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _titleView = [[HomeCellTitleView alloc]init];
        [self addSubview:_titleView];
        _sortImage = [[UIImageView alloc]init];
        [self addSubview:_sortImage];
        _goodsView = [[HomeCellGoodsView alloc]init];
        [self addSubview:_goodsView];
        
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
            make.height.mas_offset(30);
        }];
        [_sortImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleView.mas_bottom);
            make.leading.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.height.equalTo(@100);
        }];
        [_goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sortImage.mas_bottom);
            make.leading.trailing.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}


- (void)setCellInfo:(ActRow *)cellInfo{
    NSLog(@"actRow.activity.img = %@  --= %@",cellInfo.activity.img,cellInfo.category_detail.name);
    self.titleView.actRow = cellInfo;
    self.goodsView.actRow = cellInfo;
    [self.sortImage sd_setImageWithURL:[NSURL URLWithString:cellInfo.activity.img] placeholderImage:[UIImage imageNamed:cellInfo.category_detail.name]];
}
- (void)setCellback:(ClikedCellback)cellback{
    _cellback = cellback;
    self.goodsView.cellback = cellback;
}
@end
