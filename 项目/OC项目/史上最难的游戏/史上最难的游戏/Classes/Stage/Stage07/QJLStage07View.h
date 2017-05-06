//
//  QJLStage07View.h
//  Game
//
//  Created by 金亮齐 on 16/7/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage07View : UIView

@property (nonatomic, copy) void(^sucessBlock)(int glassCount, BOOL isPass);
@property (nonatomic, copy) void(^failBlock)();
@property (nonatomic, copy) void (^stopTimeBlock)();


- (void)start;

- (void)hitGlass;

- (void)cleadData;

@end
