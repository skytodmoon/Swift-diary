//
//  QJLRefresh.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "QJLRefresh.h"

@implementation QJLRefresh

- (void)prepare {
    [super prepare];
    self.stateLabel.hidden = NO;
    self.lastUpdatedTimeLabel.hidden = YES;
    
    [self setImages:@[[UIImage imageNamed:@"icon_listheader_animation_1"]] forState:MJRefreshStateIdle];
    [self setImages:@[[UIImage imageNamed:@"icon_listheader_animation_2"]] forState:MJRefreshStatePulling];
    [self setImages:@[[UIImage imageNamed:@"icon_listheader_animation_1"],[UIImage imageNamed:@"icon_listheader_animation_2"]] forState:MJRefreshStateRefreshing];
    
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
}


@end
