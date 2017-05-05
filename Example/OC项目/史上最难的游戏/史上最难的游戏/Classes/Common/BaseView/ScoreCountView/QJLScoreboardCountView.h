//
//  QJLScoreboardCountView.h
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJLStrokeLabel.h"
@interface QJLScoreboardCountView : UIView

@property (weak, nonatomic) IBOutlet QJLStrokeLabel *countLabel;

- (void)startAnimationWithCompletion:(void (^)(BOOL finished))completion;

- (void)hit;

- (void)clean;

- (void)setScore:(NSInteger)score;


@end
