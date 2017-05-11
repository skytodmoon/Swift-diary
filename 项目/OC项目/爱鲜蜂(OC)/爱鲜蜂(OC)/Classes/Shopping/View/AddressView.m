//
//  AddressView.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "AddressView.h"

@interface AddressView ()
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIImageView *arrows;
@end

@implementation AddressView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:15];
        _addressLabel.textColor = [UIColor redColor];
        _addressLabel.text = @"先锋侠需要你的精确坐标";
        [_addressLabel sizeToFit];
        [self addSubview:_addressLabel];
        
        _arrows = [[UIImageView alloc]init];
        _arrows.image = [UIImage imageNamed:@"icon_go"];
        [self addSubview:_arrows];
        
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_arrows mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

@end
