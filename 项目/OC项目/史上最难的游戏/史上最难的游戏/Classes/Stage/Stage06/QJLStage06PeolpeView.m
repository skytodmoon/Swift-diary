//
//  QJLStage06PeolpeView.m
//  Game
//
//  Created by 金亮齐 on 16/7/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage06PeolpeView.h"
#import "QJLStrokeLabel.h"
#import "UIColor+QJLColor.h"
#import "QJLSoundToolManager.h"

@interface QJLStage06PeolpeView ()
{
    int _count;
}

@property (weak, nonatomic) IBOutlet UIImageView *peopleImageView;
@property (weak, nonatomic) IBOutlet QJLStrokeLabel *countLabel;
@property (weak, nonatomic) IBOutlet QJLStrokeLabel *unilLabel;
@property (weak, nonatomic) IBOutlet UIImageView *handImageView;

@end

@implementation QJLStage06PeolpeView

- (void)awakeFromNib {
    
    [self.countLabel setTextStorkeWidth:3];
    self.countLabel.font = [UIFont fontWithName:@"TransformersMovie" size:120];
    self.countLabel.textColor = [UIColor colorWithR:204 g:88 b:30];
    
    [self.unilLabel setTextStorkeWidth:3];
    self.unilLabel.font = [UIFont fontWithName:@"TransformersMovie" size:30];
    self.unilLabel.textColor = [UIColor whiteColor];
}

- (void)punchTheFace {
    _count++;
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundSlapName];
    self.countLabel.text = [NSString stringWithFormat:@"%d", _count];
    UIImage *image = _count % 2 ? [UIImage imageNamed:@"19_man_left-iphone4"] : [UIImage imageNamed:@"19_man_right-iphone4"];
    UIImage *handImage = _count % 2 ? [UIImage imageNamed:@"19_hand-iphone4-1"] : [UIImage imageNamed:@"19_hand-iphone4"];
    self.peopleImageView.image = image;
    self.handImageView.image = handImage;
    self.handImageView.hidden = NO;
    
    if (_count == 10) {
        self.countLabel.alpha = 0.7;
    }
    
    if (_count == 11) {
        self.countLabel.alpha = 0.4;
    }
    
    if (_count == 12) {
        self.countLabel.alpha = 0;
    }
    
    if (_count > 37) {
        if (self.failBlock) {
            self.countLabel.alpha = 1;
            self.countLabel.hidden = NO;
            self.failBlock();
        }
    }
}

- (void)cleanData {
    _count = 0;
    self.countLabel.text = @"0";
    self.peopleImageView.image = [UIImage imageNamed:@"19_man-iphone4"];
    self.peopleImageView.hidden = NO;
    self.countLabel.hidden = NO;
    self.countLabel.alpha = 1.0;
    self.handImageView.hidden = YES;
}

- (BOOL)doneBtnClick {
    if (_count != 37) {
        self.countLabel.alpha = 1;
        self.countLabel.hidden = NO;
    }
    return _count == 37;
}


@end
