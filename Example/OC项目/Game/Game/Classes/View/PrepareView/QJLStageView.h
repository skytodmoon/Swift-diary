//
//  QJLStageView.h
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QJLStage;

@interface QJLStageView : UIView

@property (nonatomic, strong) QJLStage *stage;

+ (instancetype)stageViewWithStage:(QJLStage *)stage frame:(CGRect)frame;

@end
