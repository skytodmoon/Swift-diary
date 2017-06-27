//
//  QJLStage19FishView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage19FishView : UIView

- (void)showFishBite:(NSInteger)index;

- (void)showPromptViewWithIndex:(NSInteger)index;

- (void)showSucessWithIndex:(NSInteger)index finish:(void(^)())finish;

- (void)removeData;
- (void)pause;
- (void)resume;

- (void)removeTimer;

@end
