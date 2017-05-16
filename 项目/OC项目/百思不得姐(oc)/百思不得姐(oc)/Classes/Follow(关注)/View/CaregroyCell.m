//
//  CaregroyCell.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "CaregroyCell.h"
#import "CategoryItem.h"

@interface CaregroyCell()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end
@implementation CaregroyCell

- (void)setCategroy:(CategoryItem *)categroy
{
    _categroy = categroy;
    
    self.textLabel.text = categroy.name;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];

    self.backgroundColor = CommonBgColor;
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
   
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.sy_height = self.contentView.sy_height - 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.redView.hidden = !selected;
    
    self.textLabel.textColor = selected ? [UIColor redColor] : [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1];
    
    UIView *whiteColor = [[UIView alloc]init];
    whiteColor.backgroundColor = [UIColor whiteColor];
    
    UIView *grayColor = [[UIView alloc]init];
    grayColor.backgroundColor = CommonBgColor;

    self.selectedBackgroundView = selected ? whiteColor : grayColor;
   
}

@end
