//
//  QJLStage14LineView.h
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJLStage14LineView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *arrowIV;

- (void)startShakePhoneAnimationWithFinish:(void (^)())finish;

- (void)resumeData;

- (void)arrowPromptWithAngle:(float)angle;

@end
