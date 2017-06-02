//
//  AdCollectionViewCell.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AdCollectionViewCell.h"

@interface AdCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation AdCollectionViewCell

- (void)awakeFromNib {
    self.iconView.layer.cornerRadius = 5;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setAd:(AdModel *)ad {
    _ad = ad;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:ad.srcid]];
}

@end
