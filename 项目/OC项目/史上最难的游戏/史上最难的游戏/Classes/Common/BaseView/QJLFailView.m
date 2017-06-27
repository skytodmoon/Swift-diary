//
//  QJLFailView.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLFailView.h"
#import "PrefixHeader.pch"
@interface QJLFailView ()

@property (weak, nonatomic) IBOutlet UIImageView *redBgView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowView;
@property (weak, nonatomic) IBOutlet UIImageView *peopleView;
@property (weak, nonatomic) IBOutlet UIImageView *outView;

@end

@implementation QJLFailView

- (void)awakeFromNib {
    self.redBgView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
    self.shadowView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
    self.peopleView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
    self.outView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
}

- (void)showFailViewWithAnimatonFinishBlock:(void (^)())completion {
    
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundOutSpoonName];
    [UIView animateWithDuration:0.15 animations:^{
        self.redBgView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.peopleView.transform = CGAffineTransformIdentity;
            self.shadowView.transform = CGAffineTransformIdentity;
            self.outView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundOutName];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.25 animations:^{
                    self.peopleView.transform = CGAffineTransformMakeTranslation(-ScreenWidth - 50, 0);
                    self.shadowView.transform = CGAffineTransformMakeTranslation(-ScreenWidth - 50, 0);
                    self.outView.transform = CGAffineTransformMakeTranslation(-ScreenWidth, 0);
                } completion:^(BOOL finished) {
                    completion();
                }];
            });
        }];
    }];
}

@end
