//
//  HUDTools.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HUDTools.h"

@implementation HUDTools

+ (void)zj_showLoadingInView:(id)view{
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}

+ (void)zj_showLoadingInView:(UIView *)view title:(NSString *)title{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = title;
}

+ (void)zj_showErrorStatusInView:(UIView *)view title:(NSString *)title{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
    });
}
+ (void)zj_showSuccessStatusInView:(UIView *)view title:(NSString *)title{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
    });
}

+ (void)zj_hideInView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
