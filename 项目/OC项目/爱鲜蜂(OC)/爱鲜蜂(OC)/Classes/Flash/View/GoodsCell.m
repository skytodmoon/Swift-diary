//
//  GoodsCell.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "GoodsCell.h"
#import "BuyView.h"

@interface GoodsCell()
@property (nonatomic, strong) UIImageView *goodsIcon;
@property (nonatomic, strong) UILabel *refinedLabel;
@property (nonatomic, strong) UILabel *goodsName;
@property (nonatomic, strong) UILabel *heftLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *discountLabel;
@property (nonatomic, strong) BuyView *buyView;
@end
@implementation GoodsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _goodsIcon = [[UIImageView alloc]init];
        _refinedLabel = [[UILabel alloc]init];
        _refinedLabel.font = [UIFont systemFontOfSize:11];
        _refinedLabel.layer.borderWidth = 1;
        _refinedLabel.layer.borderColor = [UIColor redColor].CGColor;
        _refinedLabel.layer.cornerRadius = 3;
        _refinedLabel.layer.masksToBounds = YES;
        _refinedLabel.textAlignment = NSTextAlignmentCenter;
        _refinedLabel.textColor = [UIColor redColor];
        _refinedLabel.text = @"精选";
        _refinedLabel.hidden = YES;
        
        _goodsName = [[UILabel alloc]init];
        _goodsName.font = [UIFont systemFontOfSize:15];
        _goodsName.textAlignment = NSTextAlignmentLeft;
        
        _heftLabel = [[UILabel alloc]init];
        _heftLabel.font = [UIFont systemFontOfSize:13];
        _heftLabel.textAlignment = NSTextAlignmentLeft;
        
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = [UIColor redColor];
        _buyView = [[BuyView alloc]init];
        
        [self addSubview:_goodsIcon];
        [self addSubview:_refinedLabel];
        [self addSubview:_goodsName];
        [self addSubview:_heftLabel];
        [self addSubview:_priceLabel];
        [self addSubview:_buyView];
        
        CGFloat height = 15;
        [_goodsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(80);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_refinedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(height);
            make.leading.equalTo(_goodsIcon.mas_trailing);
            make.top.equalTo(_goodsIcon);
        }];
        [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_refinedLabel.mas_trailing);
            make.top.equalTo(_goodsIcon);
            make.height.mas_offset(height);
            make.trailing.equalTo(self);
        }];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsIcon.mas_trailing);
            make.bottom.equalTo(_goodsIcon.mas_bottom);
            make.height.mas_offset(height);
            make.width.mas_offset(50);
        }];
        [_heftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsIcon.mas_trailing);
            make.bottom.equalTo(_priceLabel.mas_top).offset(-5);
            make.height.mas_equalTo(height);
            make.width.mas_equalTo(80);
        }];
        [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-2);
            make.trailing.equalTo(self).offset(-2);
            make.width.mas_equalTo(65);
            make.height.mas_equalTo(25);
        }];
    }
    return self;
}



- (void)setGoods:(Goods *)goods{
    _goods = goods;
    if (self.goods.is_xf) {
        _refinedLabel.hidden = NO;
    }else{
        _refinedLabel.hidden = YES;
        [_goodsName mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsIcon.mas_trailing);
        }];
    }
    _buyView.goods = goods;
    _heftLabel.text = goods.specifics;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",goods.price];
    [_goodsIcon sd_setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_half_size"]];
    _goodsName.text = goods.name;
}

-(void)setHighlighted:(BOOL)highlighted{
    
}


@end
