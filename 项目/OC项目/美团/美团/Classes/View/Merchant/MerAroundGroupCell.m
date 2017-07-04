//
//  MerAroundGroupCell.m
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MerAroundGroupCell.h"

@interface MerAroundGroupCell(){
    UIImageView *_shopImageView;
    UILabel *_shopNameLabel;
    UILabel *_shoSubTitleLabel;
    UILabel *_nowPriceLabel;
    UILabel *_oldPriceLabel;
}

@end

@implementation MerAroundGroupCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initViews];
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

-(void)initViews{
    
}

@end
