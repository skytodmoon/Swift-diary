//
//  QJLStage18PokerView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage18PokerView : UIView

@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^showNextPoker)();
@property (nonatomic, copy) void (^selectSamePokerSucess)(BOOL isPass);

@property (nonatomic, assign) BOOL isFail;

- (BOOL)showPokerView;

- (BOOL)selectSamePokerWithIndex:(NSInteger)index;

- (void)resumeData;

@end
