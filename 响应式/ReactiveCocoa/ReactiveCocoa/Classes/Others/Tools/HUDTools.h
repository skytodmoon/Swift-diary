//
//  HUDTools.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUDTools : NSObject

+ (void)zj_showLoadingInView:(UIView *)view;
+ (void)zj_showLoadingInView:(UIView *)view title:(NSString *)title;
+ (void)zj_showErrorStatusInView:(UIView *)view title:(NSString *)title;
+ (void)zj_showSuccessStatusInView:(UIView *)view title:(NSString *)title;
+ (void)zj_hideInView:(UIView *)view;

@end
