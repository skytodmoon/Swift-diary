//
//  QJLSoundToolManager.h
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoundNamesHeader.h"


typedef NS_ENUM(NSInteger, SoundPlayType) {
    SoundPlayTypeHight = 0,
    SoundPlayTypeMiddle,
    SoundPlayTypeLow,
    SoundPlayTypeMute
};

@interface QJLSoundToolManager : NSObject

@property (nonatomic, assign) SoundPlayType bgMusicType;
@property (nonatomic, assign) SoundPlayType soundType;

- (void)pauseBgMusic;
- (void)stopBgMusic;
- (void)playBgMusicWihtPlayAgain:(BOOL)playAgain;

- (void)playSoundWithSoundName:(NSString *)soundName;

- (void)setBackgroundMusicVolume:(float)volume;

+ (instancetype)sharedSoundToolManager;

@end
