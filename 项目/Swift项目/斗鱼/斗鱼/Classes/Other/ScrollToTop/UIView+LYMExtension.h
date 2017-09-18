//
//  UIView+LYMExtension.h
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LYMExtension)
/** 中心点的X */
@property (nonatomic, assign) CGFloat centerX;
/** 中心点的Y */
@property (nonatomic, assign) CGFloat centerY;
/** origin的X */
@property (nonatomic, assign) CGFloat x;
/** origin的Y */
@property (nonatomic, assign) CGFloat y;
/** 控件的宽度 */
@property (nonatomic, assign) CGFloat width;
/** 控件的高度 */
@property (nonatomic, assign) CGFloat height;
/** 控件的origin */
@property(nonatomic,assign) CGPoint origin;
/** 控件的尺寸 */
@property (nonatomic, assign) CGSize size;

/** 从Xib加载View(仅限于XIB中只有一个View的时候) */
+ (instancetype)viewFromXib;

/**
 *  判断两个View是否有重叠
 *  otherView：跟当前View比较的，如果为空，就代表是窗口控制器的View
 */
- (BOOL)intersectsOtherView:(UIView *)otherView;

@end
