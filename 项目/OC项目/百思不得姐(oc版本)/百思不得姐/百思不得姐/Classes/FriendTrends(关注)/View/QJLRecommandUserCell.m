//
//  QJLRecommandUserCell.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/9.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLRecommandUserCell.h"
#import "QJLRecommandUser.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+QJLExtension.h"

@interface QJLRecommandUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation QJLRecommandUserCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUser:(QJLRecommandUser *)user {
    
    _user = user;
    
    self.screenNameLabel.text = user.screen_name;
    if (user.fans_count < 10000) {
        self.fansCountLabel.text = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    } else {
        self.fansCountLabel.text = [NSString stringWithFormat:@"%.1f万人关注",user.fans_count / 10000.0];
    }
    
    [self.headerImageView setCircleHeader:user.header];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
