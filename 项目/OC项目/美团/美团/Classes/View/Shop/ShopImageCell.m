//
//  ShopImageCell.m
//  美团
//
//  Created by 金亮齐 on 2017/7/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ShopImageCell.h"

@implementation ShopImageCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //图
        self.shopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 190)];
        [self.shopImageView setImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
        [self.contentView addSubview:self.shopImageView];
        //店名
        self.shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.shopImageView.frame.size.height-30-30, screen_width-10, 30)];
        self.shopNameLabel.textColor = [UIColor whiteColor];
        //        self.shopNameLabel.text = @"必胜客";
        [self.contentView addSubview:self.shopNameLabel];
        
        //标题
        self.shopTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.shopImageView.frame.size.height-30, screen_width-10, 30)];
        self.shopTitleLabel.textColor = [UIColor whiteColor];
        self.shopTitleLabel.font = [UIFont systemFontOfSize:13];
        //        self.shopTitleLabel.text = @"100元心意美食卡1张，可叠加，免预约";
        [self.contentView addSubview:self.shopTitleLabel];
        
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
