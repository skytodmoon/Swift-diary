//
//  QJLStage16PeopleView.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage16PeopleView.h"
#import "PrefixHeader.pch"

@interface QJLStage16PeopleView ()

@property (weak, nonatomic) IBOutlet UIImageView *upIV;
@property (weak, nonatomic) IBOutlet UIImageView *downIV;


@end

@implementation QJLStage16PeopleView

- (void)ullUpsWithIndex:(NSInteger)index {
    if (index == 1) {
        [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundManDownName];
        self.upIV.hidden = YES;
        self.downIV.hidden = NO;
    } else {
        [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundManUpName];
        self.upIV.hidden = NO;
        self.downIV.hidden = YES;
    }
}

- (void)resumeData {
    self.upIV.hidden = NO;
    self.downIV.hidden = YES;
}

@end
