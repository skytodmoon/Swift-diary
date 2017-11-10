//
//  ProgressHUD.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JGProgressHUD.h>

typedef void (^dissmissCallBack)();

@interface ProgressHUD : NSObject

+ (dissmissCallBack)showProgressWithStatus:(NSString *)status inView:(UIView *)view;

+ (void)showErrorWithStatus:(NSString *)status inView:(UIView *)view;

+ (void)showSuccessWithStatus:(NSString *)status inView:(UIView *)view;

+ (void)showCustomImage:(NSString *)imageName inView:(UIView *)view;

@end
