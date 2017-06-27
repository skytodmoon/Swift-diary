//
//  QJLStage08PeopleView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage08PeopleView : UIView

@property (nonatomic, copy) void(^startTakePhoto)();
@property (nonatomic, copy) void(^shopTakePhoto)();
@property (nonatomic, copy) void(^nextTakePhoto)(BOOL isPass);

- (BOOL)takePhotoWithIndex:(int)index;

- (void)showModel;

- (void)stopTime;

- (void)cleanDate;

- (void)pause;
- (void)resume;

@end
