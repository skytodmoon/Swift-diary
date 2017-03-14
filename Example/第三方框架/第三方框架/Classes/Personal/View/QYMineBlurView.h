//
//  QYMineBlurView.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/14.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYMineBlurView : UIImageView
@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, assign) float initialBlurLevel;
@property (nonatomic, assign) float initialGlassLevel;
@property (nonatomic, assign) BOOL isGlassEffectOn;
@property (nonatomic, strong) UIColor *glassColor;

- (void)setBlurLevel:(float)blurLevel;

@end
