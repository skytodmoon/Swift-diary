//
//  UIApplication+QJLLoad.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "UIApplication+QJLLoad.h"
#import "QJLFullBackgroundView.h"
#import "PrefixHeader.pch"
#define kLoadingViewTag 10000
@implementation UIApplication (QJLLoad)

+ (void)loading {
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    
    QJLFullBackgroundView *loadView = [[QJLFullBackgroundView alloc] initWithFrame:ScreenBounds];
    loadView.tag = kLoadingViewTag;
    [loadView setBackgroundImageWihtImageName:@"loading_bg"];
    [mainWindow addSubview:loadView];
}

+ (void)unLoading {
    UIView *loadView = [[[UIApplication sharedApplication] keyWindow].subviews lastObject];
    if (loadView.tag == kLoadingViewTag) {
        [loadView removeFromSuperview];
    }
}

@end
