//
//  QJLFishView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLFishView : UIView

- (void)showBlackView;

- (void)startFishBite;
- (void)stopFishBite;

- (void)showSucess;
- (void)resumeData;

- (void)pause;
- (void)resume;

- (void)killTimer;

@end
