//
//  AppDelegate+Extension.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>
#import <AFNetworkReachabilityManager.h>

@interface AppDelegate (Extension)

/** 当前网络是否在线: 在线:WIFI + 手机网络 */
@property (nonatomic, getter = isOnLine, readonly) BOOL onLine;
/** 当前网络状态: 无网络, 未知, WIFI, 手机网络 */
@property (nonatomic, readonly) AFNetworkReachabilityStatus netReachStatus;

/** 进行一些全局的配置, 如 开启网络监测, 网络活动提示, 初始化DDLog 等... */
- (void)setupGlobalConfig;

@end
