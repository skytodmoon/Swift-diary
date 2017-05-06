//
//  QJLStateView.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStateView.h"
#import "QJLSoundToolManager.h"
@interface QJLStateView ()
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;
@property (weak, nonatomic) IBOutlet UIImageView *circleImageView;

@property (nonatomic, copy) void (^hiddenFinsih)();
@property (nonatomic, copy) void (^showFinish)();

@end

@implementation QJLStateView

- (void)awakeFromNib {
    self.hidden = YES;
}

- (void)setType:(QJLResultStateType)type {
    _type = type;
    
    switch (type) {
        case QJLResultStateTypeGood:
            self.stateImageView.image = [UIImage imageNamed:@"00_good-iphone4"];
            self.circleImageView.image = [UIImage imageNamed:@"00_circle-iphone4"];
            break;
        case QJLResultStateTypeGreat:
            self.stateImageView.image = [UIImage imageNamed:@"00_great-iphone4"];
            self.circleImageView.image = [UIImage imageNamed:@"00_circle-iphone4"];
            break;
        case QJLResultStateTypeOK:
            self.stateImageView.image = [UIImage imageNamed:@"00_okay-iphone4"];
            self.circleImageView.image = [UIImage imageNamed:@"00_circle-iphone4"];
            break;
        case QJLResultStateTypePerfect:
            self.stateImageView.image = [UIImage imageNamed:@"00_perfect-iphone4"];
            self.circleImageView.image = [UIImage imageNamed:@"00_circle-iphone4"];
            break;
        case QJLResultStateTypeBad:
            self.stateImageView.image = [UIImage imageNamed:@"00_bad-iphone4"];
            self.circleImageView.image = [UIImage imageNamed:@"00_cross-iphone4"];
            break;
        default:
            break;
    }
}

- (void)showStateViewWithType:(QJLResultStateType)type {
    self.type = type;
    self.hidden = NO;
    switch (type) {
        case QJLResultStateTypeOK:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundOKName];
            break;
        case QJLResultStateTypeGood:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundGoodName];
            break;
        case QJLResultStateTypeGreat:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundGreatName];
            break;
        case QJLResultStateTypePerfect:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundPerfectName];
        case QJLResultStateTypeBad:
        {
            NSString *badName = [NSString stringWithFormat:@"instantFail0%d.mp3", arc4random_uniform(3) + 2];
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:badName];
        }
            break;
        default:
            break;
    }
    
    [self insertSubview:self.circleImageView belowSubview:self.stateImageView];
    [self.superview bringSubviewToFront:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
    });
}

- (void)showStateViewWithType:(QJLResultStateType)type stageViewHiddenFinishBlock:(void (^)(void))stageViewHiddenFinishBlock {
    self.type = type;
    self.hidden = NO;
    self.hiddenFinsih = stageViewHiddenFinishBlock;
    switch (type) {
        case QJLResultStateTypeOK:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundOKName];
            break;
        case QJLResultStateTypeGood:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundGoodName];
            break;
        case QJLResultStateTypeGreat:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundGreatName];
            break;
        case QJLResultStateTypePerfect:
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundPerfectName];
            break;
        case QJLResultStateTypeBad:
        {
            NSString *badName = [NSString stringWithFormat:@"instantFail0%d.mp3", arc4random_uniform(3) + 2];
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:badName];
        }
            break;
        default:
            break;
    }
    
    [self insertSubview:self.circleImageView belowSubview:self.stateImageView];
    [self.superview bringSubviewToFront:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
        if (self.hiddenFinsih) {
            self.hiddenFinsih();
        }
    });
}

- (void)showBadStateWithFinish:(void (^)())finish {
    self.hidden = NO;
    self.stateImageView.layer.anchorPoint = CGPointMake(1, 0.5);
    self.stateImageView.frame = CGRectMake(self.stateImageView.frame.origin.x + self.stateImageView.frame.size.width * 0.5, self.stateImageView.frame.origin.y, self.stateImageView.frame.size.width, self.stateImageView.frame.size.height);
    
    self.showFinish = finish;
    
    NSString *badName = [NSString stringWithFormat:@"instantFail0%d.mp3", arc4random_uniform(3) + 2];
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:badName];
    
    self.stateImageView.image = [UIImage imageNamed:@"00_bad-iphone4"];
    self.circleImageView.image = [UIImage imageNamed:@"00_cross-iphone4"];
    
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.stateImageView.transform = CGAffineTransformMakeRotation(-M_2_PI);
    } completion:^(BOOL finished) {
        
        self.hidden = YES;
        if (self.showFinish) {
            self.showFinish();
        }
        
    }];
}

- (void)hideStateView {
    self.hidden = YES;
}

- (void)removeData {
    self.showFinish = nil;
    self.hiddenFinsih = nil;
    [self removeFromSuperview];
}


@end
