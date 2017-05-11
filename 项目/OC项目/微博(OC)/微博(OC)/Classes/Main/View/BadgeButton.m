//
//  BadgeButton.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "BadgeButton.h"

#define BadgeButtonTitleSize 11.0

@implementation BadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.hidden = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:BadgeButtonTitleSize];
        [self setBackgroundImage:[UIImage resizedImageWithName:@"main_badge"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    self.hidden = !(BOOL)self.badgeValue;
    
    if (self.badgeValue) {

        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        CGRect frame = self.frame;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;

        CGSize titleSize = [badgeValue sizeWithFont:[UIFont systemFontOfSize:BadgeButtonTitleSize]];
        frame.size.width = MAX(badgeW, titleSize.width + 10);
        frame.size.height = badgeH;
        self.frame = frame;
    }
}

@end
