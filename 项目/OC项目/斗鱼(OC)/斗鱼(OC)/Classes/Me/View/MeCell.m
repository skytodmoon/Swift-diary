//
//  MeCell.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MeCell.h"

@interface MeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation MeCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    
    self.iconView.image = [UIImage imageNamed:dict[@"image"]];
    self.titleLabel.text = dict[@"title"];
    if (dict[@"subtitle"]) {
        self.subtitleLabel.text = dict[@"subtitle"];
    }
    
    if (dict[@"class"]) {
        self.targetClass = NSClassFromString(dict[@"class"]);
    }
}

@end
