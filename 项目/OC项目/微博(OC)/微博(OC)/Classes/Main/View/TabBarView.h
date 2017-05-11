//
//  TabBarView.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBarView;

@protocol TabBarViewDelegate <NSObject>

@optional

- (void)tabBarView:(TabBarView *)tabBarView didSelectedButtonFrom:(int)from to:(int)to;

- (void)tabBarViewSendStatus:(TabBarView *)tabBarView;

@end

@interface TabBarView : UIView

@property (nonatomic, weak) id<TabBarViewDelegate> delegate;

//MARK: -   添加按钮
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
