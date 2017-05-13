//
//  QJLRecommandCategoryCell.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/9.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLRecommandCategoryCell.h"
#import "UIView+QJLExtension.h"
#import "QJLRecommandCategory.h"

@interface QJLRecommandCategoryCell ()

/**
 *  选中时显示的指示器View
 */
@property (weak, nonatomic) IBOutlet UIView *selectedIndicater;

@end

@implementation QJLRecommandCategoryCell

-(void)awakeFromNib {
    self.backgroundColor = QJLColor(244, 244, 244);
    self.selectedIndicater.backgroundColor = QJLColor(219, 21, 26);
}

-(void)setCategory:(QJLRecommandCategory *)category {
    _category = category;
    self.textLabel.text = category.name;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    //重新调整内部textLabel的frame
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height -2 * self.textLabel.y;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectedIndicater.hidden = !selected;
    self.textLabel.textColor = selected ?  self.selectedIndicater.backgroundColor: QJLColor(78, 78, 78);
}

@end
