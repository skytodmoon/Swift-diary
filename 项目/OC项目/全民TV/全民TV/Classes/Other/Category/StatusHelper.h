//
//  StatusHelper.h
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusHelper : NSObject

/** 获取当前时间戳 */
+(NSString *)getCurrentTimeSP;

/** 圆角头像manager */
+ (YYWebImageManager *)avatarImageManager;

/**
 *  切换横竖屏
 *
 *  @param orientation ：UIInterfaceOrientation
 */
+ (void)forceOrientation: (UIInterfaceOrientation)orientation;

/**
 *  判断是否竖屏
 *
 *  @return 布尔值
 */
+ (BOOL)isOrientationLandscape;
@end
