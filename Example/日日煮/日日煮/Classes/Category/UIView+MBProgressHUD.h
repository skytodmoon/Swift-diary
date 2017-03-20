//
//  UIView+MBProgressHUD.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"

@interface UIView (MBProgressHUD)

/** 忙提示 */
- (void)showBusyHUD;
/** 文字提示 */
- (void)showWarning:(NSString *)warning;
/** 隐藏提示 */
- (void)hideBusyHUD;

@end
