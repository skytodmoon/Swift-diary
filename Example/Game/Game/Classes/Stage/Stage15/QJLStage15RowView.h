//
//  QJLStage15RowView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface QJLStage15RowView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *leftWoodIV;
@property (weak, nonatomic) IBOutlet UIImageView *rightWoodIV;
@property (weak, nonatomic) IBOutlet UIImageView *middleWoodIV;

- (void)showRowWithIsShowWave:(BOOL)showWave showFinish:(BOOL)finsih isFrist:(BOOL)isFrist;

- (void)startWoodAnimation;

@end
