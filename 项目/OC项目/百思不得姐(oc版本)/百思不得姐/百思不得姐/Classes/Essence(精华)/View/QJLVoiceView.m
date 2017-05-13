//
//  QJLVoiceView.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLVoiceView.h"
#import "QJLTopic.h"
#import "UIImageView+WebCache.h"

@interface QJLVoiceView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *voicetimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *playcountLabel;

@property (weak, nonatomic) IBOutlet UIButton *playButton;



@end

@implementation QJLVoiceView

-(void)setTopic:(QJLTopic *)topic {
    _topic = topic;
    //图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    //播放次数
    self.playcountLabel.text = [NSString stringWithFormat:@"%zd播放", topic.playcount];
    //时长
    NSInteger minute = topic.voicetime / 60;
    NSInteger second = topic.voicetime % 60;
    self.voicetimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minute, second];
}

+(instancetype)voiceView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)awakeFromNib {
    
    //如果发现控件的位置和尺寸不是自己设置的，那么有可能是自动伸缩属性导致
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setPlayButton:(UIButton *)playButton {
    _playButton = playButton;
    [self.playButton setImage:[UIImage imageNamed:@"playButtonPlay"] forState:UIControlStateNormal];
    [self.playButton setImage:[UIImage imageNamed:@"playButtonPause"] forState:UIControlStateSelected];
}

-(void)showPicture {
    
    //    QJLShowPictureViewController *showPictureVC = [[QJLShowPictureViewController alloc] init];
    //    showPictureVC.topic = self.topic;
    //    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPictureVC animated:YES completion:nil];
}

- (IBAction)playButtonClick:(UIButton *)sender {
    sender.hidden = YES;
    
}

@end
