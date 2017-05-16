//
//  UIView+SYCategory.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SYCategory)
@property (nonatomic, assign) CGFloat sy_width;
@property (nonatomic, assign) CGFloat sy_height;
@property (nonatomic, assign) CGFloat sy_x;
@property (nonatomic, assign) CGFloat sy_y;
@property (nonatomic, assign) CGFloat sy_centerX;
@property (nonatomic, assign) CGFloat sy_centerY;
@property (nonatomic, assign) CGSize sy_size;
@property (nonatomic, assign) CGFloat sy_right;
@property (nonatomic, assign) CGFloat sy_bottom;

//判断一个控件是否真正显示在主窗口
- (BOOL)isShowingOnKeyWindow;
@end
