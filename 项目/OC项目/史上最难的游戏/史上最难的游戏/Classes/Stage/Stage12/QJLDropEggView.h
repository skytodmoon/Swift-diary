//
//  QJLDropEggView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLDropEggView : UIView

@property (nonatomic, copy) void (^failBlock)(NSInteger index);

- (void)showDropEggWithSpeed:(int)speed;

- (void)stopDropEgg;
- (void)pause;
- (void)resume;

- (NSInteger)grabEgg;

- (void)cleanData;


@end
