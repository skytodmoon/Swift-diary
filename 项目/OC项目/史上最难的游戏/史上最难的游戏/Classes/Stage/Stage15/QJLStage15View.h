//
//  QJLStage15View.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface QJLStage15View : UIView

@property (nonatomic, copy) void (^buttonActivate)();
@property (nonatomic, copy) void (^passStage)();

- (BOOL)jumpToNextRowWithIndex:(int)index;

@end
