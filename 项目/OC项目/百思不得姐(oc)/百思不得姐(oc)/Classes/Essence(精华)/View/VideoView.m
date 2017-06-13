//
//  VideoView.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
#import "VideoView.h"
#import "TextItem.h"
#import "UIImageView+WebCache.h"
#import "VideoItem.h"
@interface VideoView()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeCount;
@end
@implementation VideoView

+ (instancetype)videoView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:kNilOptions] lastObject];
}

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTextItem:(TextItem *)textItem
{
    _textItem = textItem;
    
    //加载图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:textItem.video.thumbnail.firstObject]];

    //播放次数
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",textItem.video.playcount];
     //设置时间格式
    NSInteger min = textItem.video.duration / 60;
    NSInteger sec = textItem.video.duration % 60;
    self.timeCount.text = [NSString stringWithFormat:@"%02zd:%02zd",min,sec];
    
    
}
@end

