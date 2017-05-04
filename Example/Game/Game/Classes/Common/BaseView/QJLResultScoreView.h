//
//  QJLResultScoreView.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJLStrokeLabel.h"

@protocol QJLResultScoreViewDelegate <NSObject>

- (void)resultScoreViewChangeWithRank:(NSString *)rank;
- (void)resultScoreViewShowFailViewPassScroeStr:(NSString *)passScroe userScroeStr:(NSString *)userScroe;
- (void)resultScoreViewShowNewCount;
- (void)resultScoreViewDidRemove;

@end

@class QJLStage;

@interface QJLResultScoreView : UIView


@property (nonatomic, weak) IBOutlet UIImageView    *hintImageView;
@property (nonatomic, weak) IBOutlet UIImageView    *boardImageView;
@property (nonatomic, weak) IBOutlet QJLStrokeLabel *scroeLabel;
@property (nonatomic, weak) IBOutlet QJLStrokeLabel *unitLabel;
@property (nonatomic, weak) IBOutlet UIView         *labelView;

@property (nonatomic, weak) id <QJLResultScoreViewDelegate> delegate;

- (void)startCountScoreWithNewScroe:(double)scroe unit:(NSString *)unit stage:(QJLStage *)stage isAddScore:(BOOL)isAddScroe;

@end
