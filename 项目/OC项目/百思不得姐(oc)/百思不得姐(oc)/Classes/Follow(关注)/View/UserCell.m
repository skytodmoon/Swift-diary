//
//  UserCell.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UserCell.h"
#import "UserItem.h"
#import "UIImageView+WebCache.h"
#import "LoginRegisterViewController.h"

@interface UserCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *countView;
@property (weak, nonatomic) IBOutlet UIImageView *VIp;
@end

@implementation UserCell

-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
}
- (void)setUserItem:(UserItem *)userItem
{
    _userItem = userItem;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:userItem.header] placeholderImage:[UIImage imageNamed:@"defaultTagIcon"]];
    self.nameView.text = userItem.screen_name;
    self.countView.text = [NSString stringWithFormat:@"%zd人关注",userItem.fans_count];
    
    if (userItem.is_vip) {
        self.nameView.textColor = [UIColor redColor];
        self.VIp.hidden = NO;
    }else
    {
        self.nameView.textColor = [UIColor blackColor];
        self.VIp.hidden = YES;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = self.iconView.sy_width * 0.5;
    self.iconView.layer.masksToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)recommendClick:(id)sender {
   LogFunc

}


@end
