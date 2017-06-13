//
//  SoundsView.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SoundsView.h"
#import "TextItem.h"
#import "UIImageView+WebCache.h"
#import "AudioItem.h"
#import "ShowPictureViewController.h"
@interface SoundsView()

//专辑图片
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
//播放次数
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
//播放时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
@implementation SoundsView

+ (instancetype)audioView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:kNilOptions] lastObject];
}

- (void)awakeFromNib
{
    
    //设置图片可以与用户交互
    self.iconView.userInteractionEnabled = YES;
    
    //给图片添加点击手势
    [self.iconView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAudio)]];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
}


//点击图片会进行全屏显示
- (void)showAudio
{
    ShowPictureViewController *showPicture = [[ShowPictureViewController alloc]init];
    
    showPicture.textItem = self.textItem;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicture animated:YES completion:nil];
}

- (void)setTextItem:(TextItem *)textItem
{
    _textItem = textItem;
    
    //加载图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:textItem.audio.download_url.firstObject]];
    
    //播放次数
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",textItem.audio.playcount];
    //设置时间格式
    NSInteger min = textItem.audio.duration / 60;
    NSInteger sec = textItem.audio.duration % 60;
    self.timeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",min,sec];
    
}
@end
