//
//  QJLStage22PeopleView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage22PeopleView : UIView

@property (nonatomic, copy) void (^fartFinish)();
@property (nonatomic, copy) void (^sucess)();

@property (nonatomic, weak) UIImageView *redIV;
@property (nonatomic, weak) UIImageView *yellowIV;
@property (nonatomic, weak) UIImageView *blueIV;

@property (nonatomic, assign) int count;

- (void)startFart;

- (BOOL)fartWithIndex:(int)index;

- (void)removeData;

@end
