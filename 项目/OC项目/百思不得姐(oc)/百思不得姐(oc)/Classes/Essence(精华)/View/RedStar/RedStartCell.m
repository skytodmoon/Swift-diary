//
//  RedStartCell.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "RedStartCell.h"
#import "RedStartItems.h"
#import "HeaderItems.h"
@interface RedStartCell() 

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UILabel *introView;


@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@end

@implementation RedStartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = self.iconView.sy_width * 0.5;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setRedStartItems:(RedStartItems *)redStartItems
{
    _redStartItems = redStartItems;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:redStartItems.header.big.firstObject] placeholderImage:[UIImage imageNamed:@"defaultTagIcon"]];
    
    self.nameView.text = redStartItems.name;
    self.introView.text = redStartItems.introduction;
    
    if (redStartItems.isVip) {
        self.vipView.hidden = NO;
    }else
    {
        self.vipView.hidden = YES;
    }

}

@end
