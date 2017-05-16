//
//  FansFastestCell.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FansFastestCell.h"
#import "FansFastestItems.h"
#import "HeaderItems.h"
@interface FansFastestCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *fanCountsView;

@end

@implementation FansFastestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = self.iconView.sy_width * 0.5;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setFansFastest:(FansFastestItems *)fansFastest
{
    _fansFastest = fansFastest;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:fansFastest.header.big.firstObject] placeholderImage:[UIImage imageNamed:@"defaultTagIcon"]];
    
    self.nameView.text = fansFastest.name;
    self.fanCountsView.text = fansFastest.fans_add_yesterday;
    
    if (fansFastest.isVip) {
        self.vipView.hidden = NO;
    }else
    {
        self.vipView.hidden = YES;
    }

}

@end
