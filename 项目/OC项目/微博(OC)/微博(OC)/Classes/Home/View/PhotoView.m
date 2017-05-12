//
//  PhotoView.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "PhotoView.h"
#import "Photo.h"
#import "UIImageView+WebCache.h"

@interface PhotoView ()

/** gif */
@property (nonatomic, weak) UIImageView *gifView;

@end

@implementation PhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *gif = [UIImage imageNamed:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:gif];
        [self addSubview:gifView];
        
        self.gifView = gifView;
    }
    return self;
}

- (void)setPhoto:(Photo *)photo
{
    _photo = photo;
    
    self.gifView.hidden = ![photo.thumbnail_pic hasSuffix:@".gif"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic]
            placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.layer.anchorPoint = CGPointMake(1, 1);
    self.gifView.layer.position = CGPointMake(self.bounds.size.width, self.bounds.size.height);
}


@end
