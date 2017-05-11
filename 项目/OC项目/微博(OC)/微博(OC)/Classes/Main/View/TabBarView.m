//
//  TabBarView.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "TabBarView.h"
#import "TabBarButton.h"

@interface TabBarView ()

@property (nonatomic, strong) TabBarButton *selectedButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) NSMutableArray *tabBarButtons;

@end

@implementation TabBarView

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [[NSMutableArray alloc] init];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(sendStatus) forControlEvents:UIControlEventTouchUpInside];
        button.bounds = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
        [self addSubview:button];
        self.addButton = button;
    }
    return self;
}
//MARK: -   发微博
- (void)sendStatus
{
    if ([self.delegate respondsToSelector:@selector(tabBarViewSendStatus:)]) {
        [self.delegate tabBarViewSendStatus:self];
    }
}

//MARK: - 添加内部按钮
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    TabBarButton *button = [TabBarButton buttonWithType:UIButtonTypeCustom];
    button.item = item;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self.tabBarButtons addObject:button];
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

//MARK: - 监听按钮点击
- (void)buttonClick:(TabBarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBarView:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBarView:self didSelectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    self.selectedButton.selected = YES;
}

//MARK: -   设置frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.addButton.center = CGPointMake(w * 0.5, h * 0.5);
    
    int count = (int)self.tabBarButtons.count;
    CGFloat buttonY = 0;
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonH = h;
    for (int index = 0; index < count; index++) {
        TabBarButton *button = self.tabBarButtons[index];
        button.tag = index;
        
        CGFloat buttonX = index * buttonW;
        if (index > 1) {
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}


@end
