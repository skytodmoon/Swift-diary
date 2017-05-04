//
//  QJLStageListView.h
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QJLStage;

@interface QJLStageListView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, copy) void (^didChangeScrollPage)(int page);
@property (nonatomic, copy) void (^didSelectedStageView)(QJLStage *stage);

- (void)reloadStageForNumber:(int)num;


@end
