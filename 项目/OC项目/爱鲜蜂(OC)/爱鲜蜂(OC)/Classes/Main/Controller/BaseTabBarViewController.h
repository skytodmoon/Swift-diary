//
//  BaseTabBarViewController.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationController.h"

@interface BaseTabBarViewController : UITabBarController
/*
 * 是否隐藏tabBar
 */
@property (nonatomic, assign) BOOL tabBarHidden;

+(BaseTabBarViewController *)sharedController;

#pragma mark 是否隐藏tabBar
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

- (void)addChildVc:(NSArray *)childVcs
            titles:(NSArray *)titles
            images:(NSArray *)images
    selectedImages:(NSArray *)selectedImages
 tabBarNaviChildVC:(BaseNavigationController*)tabBarNaviChildVC;

@end
