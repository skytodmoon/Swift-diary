//
//  BaseViewController.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic) BOOL statusBarHidden;

@property (nonatomic) UIStatusBarStyle statusBarStyle;

- (void)setBackItemWithImage:(NSString *)image pressImage:(NSString *)pressImage;

- (void)hideNavBar:(BOOL)ishide;


@end
