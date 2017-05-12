//
//  TabBar.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;
@protocol TabBarDelegate <UITabBarDelegate>

@optional

- (void)tabBarDidClickPlusButton:(TabBar *)tabBar;
@end

@interface TabBar : UITabBar

@property(nonatomic,weak)id <TabBarDelegate> delegate;

@end
