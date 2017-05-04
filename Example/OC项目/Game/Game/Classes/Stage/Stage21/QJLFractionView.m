//
//  QJLFractionView.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLFractionView.h"

@implementation QJLFractionView

- (instancetype)initWithFrame:(CGRect)frame Denominator:(int)denominator numerator:(int)numerator {
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *numeratorIV = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 66) * 0.5, 190, 60, 66)];
        numeratorIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"stage13_%d", numerator]];
        [self addSubview:numeratorIV];
        
        UIImageView *lineIV = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 80) * 0.5, CGRectGetMaxY(numeratorIV.frame) + 15, 80, 15)];
        lineIV.image = [UIImage imageNamed:@"17_line-iphone4"];
        [self addSubview:lineIV];
        
        UIImageView *denominatorIV = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 66) * 0.5, CGRectGetMaxY(lineIV.frame) + 15, 60, 66)];
        denominatorIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"stage13_%d", denominator]];
        [self addSubview:denominatorIV];
    }
    
    return self;
}

@end
