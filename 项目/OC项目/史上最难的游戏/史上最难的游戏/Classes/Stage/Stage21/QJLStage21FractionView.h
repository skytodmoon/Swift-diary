//
//  QJLStage21FractionView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage21FractionView : UIView

@property (nonatomic, copy) void (^showNumberAnimationFinish)();

- (int)showNumber;

- (void)pause;
- (void)resume;

- (void)removeData;

@end
