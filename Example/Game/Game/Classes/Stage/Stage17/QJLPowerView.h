//
//  QJLPowerView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLPowerView : UIView

@property (nonatomic, copy) void(^failBlock)();

- (void)startWithCount:(int)count;
- (int)stopCount;

- (void)pause;
- (void)resume;

- (void)resumeData;

@end
