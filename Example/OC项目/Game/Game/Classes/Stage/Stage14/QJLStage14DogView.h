//
//  QJLStage14DogView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage14DogView : UIView


- (void)showBoneViewWithAnimationFinish:(void(^)())finish;

- (float)rotationToRightWithSpeed:(float)speed;;
- (float)rotationToLeftWithSpeed:(float)speed;

- (float)shakeToRithgWithOffset:(CGFloat)offset;
- (float)shakeToLeftWithOffset:(CGFloat)offset;

- (void)startDropBoneDirectionIsRight:(BOOL)isRight finish:(void(^)())finish;

- (void)resumeData;

@end
