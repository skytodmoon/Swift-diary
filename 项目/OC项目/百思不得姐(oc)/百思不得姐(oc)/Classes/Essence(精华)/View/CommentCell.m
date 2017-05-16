//
//  CommentCell.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "CommentCell.h"
#import "UIImageView+WebCache.h"
#import "TopCommentItem.h"
#import "UserItems.h"
@interface CommentCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UIImageView *SexImage;

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UILabel *textView;

@property (weak, nonatomic) IBOutlet UILabel *likeCountView;

@end
@implementation CommentCell

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = (self.iconView.sy_width * 0.5);
    self.iconView.layer.masksToBounds = YES;

}

-(void)setTopComment:(TopCommentItem *)topComment
{
    _topComment = topComment;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:topComment.user.profile_image] placeholderImage:[UIImage imageNamed:@"defaultTagIcon"]];
    self.SexImage.image = [topComment.user.sex isEqualToString:@"m"] ? [UIImage imageNamed:@"Profile_manIcon"] : [UIImage imageNamed:@"Profile_womanIcon"];
    self.textView.text = topComment.content;
    self.nameView.text = topComment.user.username;
    self.likeCountView.text = topComment.like_count;
}
@end
