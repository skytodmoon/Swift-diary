//
//  RetweetStatusView.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "RetweetStatusView.h"
#import "Status.h"
#import "StatusFrame.h"
#import "User.h"
#import "UIImageView+WebCache.h"
#import "Photo.h"
#import "PhotosView.h"
#import "PhotoView.h"

@interface RetweetStatusView ()

/** 转发微博昵称 */
@property (nonatomic, weak) UIButton *retweetNameBtn;
/** 转发微博正文 */
@property (nonatomic, weak) UILabel *retweetContentLabel;
/** 转发微博配图 */
@property (nonatomic, weak) PhotosView *retweetPhotoView;

@end

@implementation RetweetStatusView

#pragma mark - 初始化

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"timeline_retweet_background" width:0.9 height:0.5];
        
        // 1. 昵称
        UIButton *retweetNameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        retweetNameBtn.titleLabel.font = [UIFont systemFontOfSize:StatusNameFont];
        [retweetNameBtn setTitleColor:Color(67, 107, 163) forState:UIControlStateNormal];
        [self addSubview:retweetNameBtn];
        self.retweetNameBtn = retweetNameBtn;
        
        // 2. 正文
        UILabel *retweetContentLabel = [[UILabel alloc] init];
        retweetContentLabel.font = [UIFont systemFontOfSize:StatusContentFont];
        retweetContentLabel.textColor = Color(90, 90, 90);
        retweetContentLabel.numberOfLines = 0;
        [self addSubview:retweetContentLabel];
        self.retweetContentLabel = retweetContentLabel;
        
        // 3. 配图
        PhotosView *retweetPhotoView = [[PhotosView alloc] init];
        [self addSubview:retweetPhotoView];
        self.retweetPhotoView = retweetPhotoView;
    }
    return self;
}

#pragma mark - 设置数据

- (void)setStatusFrame:(StatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    Status *retweetStatus = statusFrame.status.retweeted_status;
    
    // 昵称
    NSString *name = [NSString stringWithFormat:@"@%@", retweetStatus.user.name];
    [self.retweetNameBtn setTitle:name forState:UIControlStateNormal];
    self.retweetNameBtn.frame = statusFrame.retweetNameBtnF;
    
    // 正文
    [self.retweetContentLabel setText:retweetStatus.text];
    self.retweetContentLabel.frame = statusFrame.retweetContentLabelF;
    
    // 配图
    if (retweetStatus.pic_urls.count) {
        self.retweetPhotoView.hidden = NO;
        
        self.retweetPhotoView.photos = retweetStatus.pic_urls;
        
        self.retweetPhotoView.frame = statusFrame.retweetPhotoViewF;
    } else {
        self.retweetPhotoView.hidden = YES;
    }
}


@end
