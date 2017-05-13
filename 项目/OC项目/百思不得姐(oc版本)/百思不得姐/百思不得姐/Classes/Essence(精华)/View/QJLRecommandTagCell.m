//
//  QJLRecommandTagCell.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLRecommandTagCell.h"
#import "QJLRecommandTag.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+QJLExtension.h"


@interface QJLRecommandTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;

@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *subNameLabel;

@end

@implementation QJLRecommandTagCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame {
    frame.origin.x = 5;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    [super setFrame:frame];
}

-(void)setRecommandTag:(QJLRecommandTag *)recommandTag {
    _recommandTag = recommandTag;
    
    [self.imageListImageView setCircleHeader:recommandTag.image_list];
    self.themeNameLabel.text = recommandTag.theme_name;
    NSString *fansCount = nil;
    if (recommandTag.sub_number < 10000) {
        fansCount = [NSString stringWithFormat:@"%zd人订阅",recommandTag.sub_number];
    } else {//>= 10000
        fansCount = [NSString stringWithFormat:@"%.1f万人订阅",recommandTag.sub_number / 10000.0];
    }
    self.subNameLabel.text = fansCount;
}

@end
