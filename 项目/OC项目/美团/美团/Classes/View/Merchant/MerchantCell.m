//
//  MerchantCell.m
//  美团
//
//  Created by 金亮齐 on 2017/7/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MerchantCell.h"

@interface MerchantCell(){

    UIImageView *_merchantImage;
    //店名
    UILabel *_mearchantNameLabel;
    //店名
    UILabel *_cateNameLabel;
    //评价个数
    UILabel *_evaluateLabel;
}

@end

@implementation MerchantCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
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
