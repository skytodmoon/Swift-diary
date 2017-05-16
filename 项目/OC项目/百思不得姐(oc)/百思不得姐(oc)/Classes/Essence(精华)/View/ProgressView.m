//
//  ProgressView.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (void)awakeFromNib
{
    self.roundedCorners = 2;
    self.progressLabel.textColor = [UIColor whiteColor];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [super setProgress:progress animated:animated];
    
    
    NSString *text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    self.progressLabel.text = [text stringByReplacingOccurrencesOfString:@"-" withString:@""];
}
@end
