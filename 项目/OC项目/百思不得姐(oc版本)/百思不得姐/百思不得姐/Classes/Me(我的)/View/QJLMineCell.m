//
//  QJLMineCell.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLMineCell.h"
#import "QJLConst.h"
#import "UIView+QJLExtension.h"

@implementation QJLMineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIImageView *bgView = [[UIImageView alloc]init];
        bgView.image = [UIImage imageNamed:@"mainCellBackground"];
        self.backgroundView = bgView;
        self.textLabel.textColor = [UIColor lightGrayColor];
        self.textLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}


- (void)awakeFromNib {
    [super layoutSubviews];
    if (self.imageView.image ==nil)
    return;
    self.imageView.width = 30;
    self.imageView.height = self.imageView.width;
    self.imageView.centerY = self.imageView.height * 0.5;
    self.textLabel.x = CGRectGetMaxX(self.imageView.frame) + QJLTopicCellMargin;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
