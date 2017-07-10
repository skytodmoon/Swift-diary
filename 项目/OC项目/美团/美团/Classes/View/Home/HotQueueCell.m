//
//  HotQueueCell.m
//  美团
//
//  Created by 金亮齐 on 2017/7/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HotQueueCell.h"

@interface HotQueueCell ()
{
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_subTitleLabel;
}

@end


@implementation HotQueueCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
        [self.contentView addSubview:_imageView];
        //
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50+10, 0, screen_width-60, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
        //
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, screen_width-60, 20)];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_subTitleLabel];
    }
    return self;
}

-(void)setHotQueue:(HotQueueModel *)hotQueue{
    _hotQueue = hotQueue;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:hotQueue.imageUrl] placeholderImage:nil];
    _titleLabel.text = hotQueue.title;
    _subTitleLabel.text = hotQueue.comment;
}


@end
