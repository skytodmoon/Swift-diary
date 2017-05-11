//
//  WeiboTool.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "WeiboTool.h"
#import "MainViewController.h"
#import "NewfeatureViewController.h"

@implementation WeiboTool
+ (void)chooseRootViewController
{
    NSString *key = @"CFBundleShortVersionString";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //MARK: - 取出沙盒中版本号
    NSString *lastVersion = [defaults stringForKey:key];
    //MARK: -  获取当前版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[MainViewController alloc] init];
    } else {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[NewfeatureViewController alloc] init];
        
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }
}
@end
