//
//  QJLStage06PeolpeView.h
//  Game
//
//  Created by 金亮齐 on 16/7/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage06PeolpeView : UIView

@property (nonatomic, copy) void (^failBlock)();

- (void)punchTheFace;

- (void)cleanData;

- (BOOL)doneBtnClick;

@end
