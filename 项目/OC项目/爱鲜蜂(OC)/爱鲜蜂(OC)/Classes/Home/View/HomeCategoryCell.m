//
//  HomeCategoryCell.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeCategoryCell.h"
#import "HomeCellTitleView.h"
#import "HomeCellGoodsView.h"

@interface HomeCategoryCell()
@property (nonatomic,strong) HomeCellTitleView *titleView;
@property (nonatomic,strong) HomeCellGoodsView *goodsView;
@property (nonatomic,strong) UIImageView *brandImageView;

@end

@implementation HomeCategoryCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _titleView = [[HomeCellTitleView alloc]init];
        [self addSubview:_titleView];
        _brandImageView = [[UIImageView alloc]init];
        [self addSubview:_brandImageView];
        _goodsView = [[HomeCellGoodsView alloc]init];
        [self addSubview:_goodsView];
        
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.leading.equalTo(self);
            make.width.equalTo(self);
            make.height.mas_equalTo(40);
        }];
        [_brandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.top.equalTo(_titleView.mas_bottom);
            make.height.mas_equalTo(80);
        }];
        [_goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.top.equalTo(_brandImageView.mas_bottom);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(200);
        }];
    }
    return self;
}

- (void)setActRow:(ActRow *)actRow {
    self.titleView.actRow = actRow;
    [self.brandImageView sd_setImageWithURL:[NSURL URLWithString:actRow.activity.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
    self.goodsView.actRow = actRow;
}
@end
