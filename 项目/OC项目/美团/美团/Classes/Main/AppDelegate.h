//
//  AppDelegate.h
//  美团
//
//  Created by 金亮齐 on 2017/6/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (assign,nonatomic) double latitude;
@property (assign,nonatomic) double longitude;
@property (strong,nonatomic) UIImageView *advImage;
@property (strong, nonatomic) UITabBarController *rootTabbarCtr;

@end

