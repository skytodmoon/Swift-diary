//
//  ShopPriceCell.m
//  美团
//
//  Created by 金亮齐 on 2017/7/6.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ShopPriceCell.h"

@implementation ShopPriceCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 130, 65)];
        self.priceLabel.font = [UIFont systemFontOfSize:35];
        self.priceLabel.textColor = navigationBarColor;
        [self.contentView addSubview:self.priceLabel];
        
        //原价
        self.oldPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.priceLabel.frame)+10, 30, 100, 30)];
        self.oldPriceLabel.textColor = navigationBarColor;
        [self.contentView addSubview:self.oldPriceLabel];
        
        //立即抢购
        UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        buyBtn.frame = CGRectMake(screen_width-10-100, 10, 100, 40);
        buyBtn.backgroundColor = RGB(250, 158, 40);
        [buyBtn setTitle:@"立即抢购" forState:UIControlStateNormal];
        [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        buyBtn.layer.cornerRadius = 4;
        [self.contentView addSubview:buyBtn];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
