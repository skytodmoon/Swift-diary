//
//  FansCountViewCell.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FansCountViewCell.h"
#import "FansCountItem.h"
#import "HeaderItems.h"
@interface FansCountViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *fanCountsView;

@end

@implementation FansCountViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = self.iconView.sy_width * 0.5;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setFansCount:(FansCountItem *)fansCount
{
    _fansCount = fansCount;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:fansCount.header.big.firstObject] placeholderImage:[UIImage imageNamed:@"defaultTagIcon"]];
    
    self.nameView.text = fansCount.name;
    self.fanCountsView.text = fansCount.fans_count;
    
    if (fansCount.isVip) {
        self.vipView.hidden = NO;
    }else
    {
        self.vipView.hidden = YES;
    }

}

@end
