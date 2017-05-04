//
//  QJLSubjectView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QJLSubjectGuessType) {
    QJLSubjectGuessTypeLeft = 0,
    QJLSubjectGuessTypeMiddle,
    QJLSubjectGuessTypeRight
};

@interface QJLSubjectView : UIView

@property (nonatomic, assign) BOOL isPlayAgain;

- (void)showHandViewWithAnimationFinish:(void (^) (void))finish;

- (void)showSubjectViewNums:(void (^)(int index1, int index2, int index3, int result))nums;

- (void)showNextSubjectViewNums:(void (^)(int index1, int index2, int index3, int result))nums;

- (void)showResultWithResult:(int)result finish:(void (^) (void))finish;

- (void)cleanData;

@end
