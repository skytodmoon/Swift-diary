//
//  QJLFullBackgroundView.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLFullBackgroundView.h"
#import "PrefixHeader.pch"

@implementation QJLFullBackgroundView

{
    NSString *_bgImageName;
}

- (void)setBackgroundImageWihtImageName:(NSString *)imageName {
    
    _bgImageName = imageName;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    if (_bgImageName) {
        UIImage *bgImage = [UIImage imageNamed:_bgImageName];
        
        CGFloat width = 640;
        CGFloat height = iPhone5 ? 1136 : 960;
        CGRect cutRect = CGRectMake((bgImage.size.width - width)*0.5, (bgImage.size.height - height)*0.5, width, height);
        CGImageRef imageRef = CGImageCreateWithImageInRect(bgImage.CGImage, cutRect);
        bgImage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        [bgImage drawInRect:rect];
    }
    
}

@end
