//
//  UIView+QJLImage.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "UIView+QJLImage.h"

@implementation UIView (QJLImage)


- (void)setBackgroundImageWihtImageName:(NSString *)imageName {
    
}

+ (instancetype)viewFromNib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}

- (void)cleanSawtooth {
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    
    self.layer.shouldRasterize = YES;
    
    for (UIView *child in self.subviews) {
        [child cleanSawtooth];
    }
}

@end
