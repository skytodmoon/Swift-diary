//
//  QJLPokerView.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLPokerView.h"
#import "UIColor+QJLColor.h"

#define kTextRedColor [UIColor colorWithR:222 g:58 b:61]

@interface QJLPokerView ()

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIImageView *middleIV;

@end

@implementation QJLPokerView

- (void)awakeFromNib {
    self.bottomLabel.transform = CGAffineTransformMakeRotation(M_PI);
}

- (void)setPokerWithType:(QJLPokerType)type number:(int)number {
    if (type == QJLPokerTypeHearts || type == QJLPokerTypeDiamonds) {
        self.topLabel.textColor = kTextRedColor;
        self.bottomLabel.textColor = kTextRedColor;
    } else {
        self.topLabel.textColor = [UIColor blackColor];
        self.bottomLabel.textColor = [UIColor blackColor];
    }
    
    if (type == QJLPokerTypeHearts) {
        self.middleIV.image = [UIImage imageNamed:@"20_Rheart-iphone4"];
    } else if (type == QJLPokerTypeDiamonds) {
        self.middleIV.image = [UIImage imageNamed:@"20_diamond-iphone4"];
    } else if (type == QJLPokerTypeSpade) {
        self.middleIV.image = [UIImage imageNamed:@"20_Bheart-iphone4"];
    } else {
        self.middleIV.image = [UIImage imageNamed:@"20_Bflower-iphone4"];
    }
    
    int isFlip = arc4random_uniform(2);
    if (isFlip == 1) {
        self.middleIV.transform = CGAffineTransformMakeRotation(M_PI);
    } else {
        self.middleIV.transform = CGAffineTransformIdentity;
    }
    
    self.topLabel.text = [NSString stringWithFormat:@"%d", number];
    self.bottomLabel.text = [NSString stringWithFormat:@"%d", number];
}

@end
