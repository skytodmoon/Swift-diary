//
//  MerDetailImageCell.m
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MerDetailImageCell.h"

@interface MerDetailImageCell(){
    UIImageView *_bigImageView;
    UIImageView *_smallImageView;
    UILabel *_avgPriceLabel;
    UILabel *_shopNameLabel;
}
@end

@implementation MerDetailImageCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //大图
        _bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 160)];
        [_bigImageView setImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
        [self addSubview:_bigImageView];
        
        //小图
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
