//
//  QJLPrepareScoreView.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QJLStage;

@interface QJLPrepareScoreView : UIView

@property (nonatomic, strong) QJLStage *stage;

- (void)showScroeViewWithCompletion:(void (^)(void))completion;

@end
