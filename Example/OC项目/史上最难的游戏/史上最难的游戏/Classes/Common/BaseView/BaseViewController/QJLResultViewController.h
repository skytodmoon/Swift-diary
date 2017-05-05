//
//  QJLResultViewController.h
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QJLStage.h"
@interface QJLResultViewController : UIViewController


- (void)setCountScoreWithNewScroe:(double)scroe unit:(NSString *)unit stage:(QJLStage *)stage isAddScore:(BOOL)isAddScroe;

@end
