//
//  HomeimageScrollCell.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeimageScrollCell.h"

@implementation HomeimageScrollCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageScrollView = [[ImageScrollView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 180) ImageArray:self.imageArr];
        [self.contentView addSubview:self.imageScrollView];
    }
    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageScrollView = [[ImageScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) ImageArray:self.imageArr];
        [self.contentView addSubview:self.imageScrollView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setImageArray:(NSArray *)imageArray{
    [self.imageScrollView setImageArray:imageArray];
}

-(void)setImageArr:(NSArray *)imageArr{
    _imageArr = imageArr;
    [self.imageScrollView setImageArray:imageArr];
}



@end
