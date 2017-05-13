//
//  QJLTopicPictureView.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLTopicPictureView.h"
#import "QJLTopic.h"
#import "UIImageView+WebCache.h"
#import "QJLShowPictureViewController.h"
#import "QJLProgressView.h"

@interface QJLTopicPictureView ()
/** 图片*/
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** gif图片*/
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
/** 查看大图*/
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;

@property (weak, nonatomic) IBOutlet QJLProgressView *progressView;

@end

@implementation QJLTopicPictureView

-(void)awakeFromNib {
    
    //如果发现控件的位置和尺寸不是自己设置的，那么有可能是自动伸缩属性导致
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)] ];
}

-(void)showPicture {
    QJLShowPictureViewController *showPictureVC = [[QJLShowPictureViewController alloc] init];
    showPictureVC.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPictureVC animated:YES completion:nil];
}

+(instancetype)pictureView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)setTopic:(QJLTopic *)topic {
    _topic = topic;
    //立马显示进度值（防止因为网速，导致显示的是其他图片的下载进度）
    [self.progressView setProgress:topic.pictureProgress animated:NO];
    /**
     *  判断图片是否为gif图片
     取出图片的第一个字节，就可以判断出图片的真是类型。
     */
    //设置图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden = NO;
        //计算进度值
        topic.pictureProgress = 1.0 * receivedSize / expectedSize;
        //显示进度值
        [self.progressView setProgress:topic.pictureProgress animated:NO];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
        
        if (topic.isBigPicture == NO) return ;
        
        [self.imageView setNeedsDisplay];
    }];
    //判断是否为gif
    NSString *extension = topic.large_image.pathExtension;
    self.gifView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
    //是否显示按钮"点击查看全图"
    if (topic.isBigPicture) { //大图
        self.seeBigButton.hidden = NO;
    } else { //非大图
        self.seeBigButton.hidden = YES;
    }
}

@end
