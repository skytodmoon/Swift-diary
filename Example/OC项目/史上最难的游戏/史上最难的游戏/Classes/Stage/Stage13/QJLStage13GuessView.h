//
//  QJLStage13GuessView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QJLStage13GuessType) {
    QJLStage13GuessTypeMan = 0,
    QJLStage13GuessTypeChild,
    QJLStage13GuessTypeOld
};

@interface QJLStage13GuessView : UIView

@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^timeOut)();
@property (nonatomic, copy) void (^nextCountWithError)();
@property (nonatomic, copy) void (^nextCountWithSucess)(BOOL isPass);

- (void)startGuess;

- (BOOL)guessPeopleWithGuessType:(QJLStage13GuessType)type;

- (void)showFailWithIsShowPeople:(BOOL)showPeople AnimationFinish:(void (^)(void))finish;

- (void)stopAnimationWithTimeOver;

- (void)stopAnimationWithFinish:(void (^)())finish;

- (void)pause;
- (void)resume;
- (void)cleanData;

@end
