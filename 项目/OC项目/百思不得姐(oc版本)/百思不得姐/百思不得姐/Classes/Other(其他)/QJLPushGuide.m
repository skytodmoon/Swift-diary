//
//  QJLPushGuide.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/8.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLPushGuide.h"


@implementation QJLPushGuide

+(instancetype)pushGuideView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

+(void)show {
    NSString *key = @"CFBundleShortVersionString";
    //获得当前软件版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    //沙盒中版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:lastVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        QJLPushGuide *pushGuide = [QJLPushGuide pushGuideView];
        pushGuide.frame = window.bounds;
        [window addSubview:pushGuide];
        //存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (IBAction)closeBtn:(UIButton *)sender {
    [self removeFromSuperview];
}


@end
