//
//  ChangeFontWithButton.m
//  京东
//
//  Created by 金亮齐 on 2017/6/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ChangeFontWithButton.h"
//文字的比例(Iphone6(1.17) Iphone6Plus(1.3))
#define titleRatio [UIScreen mainScreen].bounds.size.width/320.0

@implementation ChangeFontWithButton
-(void)setCusFont:(UIFont *)cusFont{
    if (cusFont) {
        self.titleLabel.font=[cusFont fontWithSize:cusFont.pointSize*titleRatio];
    }
}
@end
