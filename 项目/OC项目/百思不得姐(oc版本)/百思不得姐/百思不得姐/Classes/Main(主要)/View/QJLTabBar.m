//
//  QJLTabBar.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLTabBar.h"
#import "QJLPublishView.h"
#import "UIView+QJLExtension.h"

@interface QJLTabBar()

@property (nonatomic,weak) UIButton *publishButton;

@end

@implementation QJLTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        //设置发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        publishButton.size = publishButton.currentBackgroundImage.size;
        [self addSubview:publishButton];
        self.publishButton  = publishButton;
    }
    return self;
}

-(void)publishButtonClick{
    [QJLPublishView show];
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    //设置中间按钮的位置
    CGFloat width = self.width;
    CGFloat heigth = self.height;
    self.publishButton.center = CGPointMake(width * 0.5, heigth * 0.5);
    
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = heigth;
    NSInteger index = 0;
    for (UIView *button in self.subviews){
        //如果是系统的按钮，继续执行
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1) : index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //索引+1
        index ++;
    }
}
@end
