//
//  UIView+MBProgressHUD.m
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIView+MBProgressHUD.h"
#import "PrefixHeader.pch"

/** 超时 */
#define kTimeOut  30
/** 弹出提示时长 */
#define kDuration  1

@implementation UIView (MBProgressHUD)

-(void)showBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self];
        [self addSubview:hud];
        UIImage *img = [UIImage animatedImageNamed:@"loadingIcon" duration:.4];
        UIImageView *image = [[UIImageView alloc]initWithImage:img];
        UIImageView *image_t = @"loadingIconk".yx_imageView;
        [image_t addSubview:image];
        hud.customView = image_t;
        [hud setMode:MBProgressHUDModeCustomView];
        hud.color = [UIColor clearColor];
        [hud show:YES];
        [hud hide:YES afterDelay:kTimeOut];
    });
}

-(void)showWarning:(NSString *)warning{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = warning;
        [hud hide:YES afterDelay:kDuration];
    });
}

-(void)hideBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}

@end
