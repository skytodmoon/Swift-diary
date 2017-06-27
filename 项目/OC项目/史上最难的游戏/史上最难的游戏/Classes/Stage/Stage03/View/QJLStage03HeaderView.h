//
//  QJLStage03HeaderView.h
//  Game
//
//  Created by 金亮齐 on 16/7/15.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage03HeaderView : UIView

- (void)startWithFailBlock:(void (^)(void))failBlock stopCalculateTime:(void (^)(void))stopCalculateTime;

- (void)leftBtnClick;

- (void)rightBtnClick;

- (void)pause;
- (void)resumed;

- (void)again;

@end
