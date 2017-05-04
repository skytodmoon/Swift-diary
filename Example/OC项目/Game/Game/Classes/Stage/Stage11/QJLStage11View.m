//
//  QJLStage11View.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage11View.h"
#import "QJLSubjectView.h"
#import "PrefixHeader.pch"

@interface QJLStage11View ()
{
    BOOL _isFrist;
    int _count;
}


@property (strong, nonatomic) QJLSubjectView *subjectView;
@property (assign, nonatomic) int result;

@end

@implementation QJLStage11View

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.subjectView = [[QJLSubjectView alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 70)];
        [self addSubview:self.subjectView];
        
        _isFrist = YES;
    }
    
    return self;
}

- (void)showSubjectViewWithNums:(void (^)(int, int, int))nums {
    __weak typeof(self) weakSelf = self;
    _count++;
    if (_count == 17) {
        self.passState();
        return;
    }
    
    [[QJLSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundWriteName];
    if (_isFrist ) {
        [self.subjectView showSubjectViewNums:^(int index1, int index2, int index3, int result) {
            nums(index1, index2, index3);
            weakSelf.result = result;
        }];
        _isFrist = NO;
    } else {
        [self.subjectView showNextSubjectViewNums:^(int index1, int index2, int index3, int result) {
            nums(index1, index2, index3);
            weakSelf.result = result;
        }];
    }
}

- (void)setSubjectPlayAgain {
    self.subjectView.isPlayAgain = NO;
}

- (void)showHandViewAnimationFinish:(void (^)(void))finish {
    [self.subjectView showHandViewWithAnimationFinish:^{
        finish();
    }];
}

- (void)guessResult:(int)result {
    __weak typeof(self) weakSelf = self;
    [self.subjectView showResultWithResult:result finish:^{
        weakSelf.handViewShowAnimation(weakSelf.result == result);
    }];
}

- (void)cleanData {
    _isFrist = YES;
    _count = 0;
    [self.subjectView cleanData];
}


@end
