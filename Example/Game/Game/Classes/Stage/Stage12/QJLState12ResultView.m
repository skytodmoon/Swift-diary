//
//  QJLState12ResultView.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLState12ResultView.h"
#import "QJLStrokeLabel.h"
#import "PrefixHeader.pch"

@interface QJLState12ResultView ()

@property (nonatomic, strong) UIImageView *statusIV;
@property (nonatomic, strong) QJLStrokeLabel *scoreLabel;

@end

@implementation QJLState12ResultView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.statusIV = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth / 3 - 100) * 0.5, 0, 100, 40)];
        [self addSubview:self.statusIV];
        
        self.scoreLabel = [[QJLStrokeLabel alloc] initWithFrame:CGRectMake(0, 15, ScreenWidth / 3, 80)];
        [self.scoreLabel setTextStorkeWidth:5];
        self.scoreLabel.textAlignment = NSTextAlignmentCenter;
        self.scoreLabel.font = [UIFont fontWithName:@"TransformersMovie" size:50];
        self.scoreLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.scoreLabel];
    }
    
    return self;
}

- (void)showStatusWithStateType:(QJLResultStateType)type score:(NSInteger)score {
    if (type == QJLResultStateTypePerfect) {
        self.statusIV.image = [UIImage imageNamed:@"00_perfect-iphone4"];
    } else if (type == QJLResultStateTypeGreat) {
        self.statusIV.image = [UIImage imageNamed:@"00_great-iphone4"];
    } else if (type == QJLResultStateTypeGood) {
        self.statusIV.image = [UIImage imageNamed:@"00_good-iphone4"];
    } else {
        self.statusIV.image = [UIImage imageNamed:@"00_okay-iphone4"];
    }
    
    if (score == 10) {
        self.scoreLabel.text = [NSString stringWithFormat:@"%2d", (int)score];
    } else {
        self.scoreLabel.text = [NSString stringWithFormat:@"%d", (int)score];
    }
}


@end
