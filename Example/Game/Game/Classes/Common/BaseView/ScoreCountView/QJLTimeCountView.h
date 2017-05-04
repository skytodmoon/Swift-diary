//
//  QJLTimeCountView.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLTimeCountView : UIView
- (void)startAnimationWithCompletion:(void (^)(BOOL finished))completion;

- (void)startCalculateTime;
- (NSTimeInterval)stopCalculateTime;
- (NSTimeInterval)pasueTime;

- (void)pause;
- (void)resumed;

- (void)cleadData;
@end
