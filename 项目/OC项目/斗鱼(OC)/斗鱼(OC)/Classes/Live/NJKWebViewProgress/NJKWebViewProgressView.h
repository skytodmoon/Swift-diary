//
//  NJKWebViewProgressView.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NJKWebViewProgressView : UIView
@property (nonatomic) float progress;

@property (nonatomic) UIView *progressBarView;
@property (nonatomic) NSTimeInterval barAnimationDuration; // default 0.1
@property (nonatomic) NSTimeInterval fadeAnimationDuration; // default 0.27
@property (nonatomic) NSTimeInterval fadeOutDelay; // default 0.1

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end
