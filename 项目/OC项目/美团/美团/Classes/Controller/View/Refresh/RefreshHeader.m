//
//  RefreshHeader.m
//  美团
//
//  Created by 金亮齐 on 2017/6/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "RefreshHeader.h"

@implementation RefreshHeader

-(instancetype)init {

    self = [super init];
    if (self) {
        
        //自动改变透明度(当控件被导航栏挡住后不显示)
        self.lastUpdatedTimeLabel.hidden = YES;
        self.automaticallyChangeAlpha = YES;
        self.stateLabel.hidden = YES;
        
        // 设置各种状态下的刷新文字
        [self setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
        [self setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
        [self setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];
            
        // 设置字体
        self.stateLabel.font = [UIFont systemFontOfSize:13];
        self.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:13];
        
        // 设置颜色
        self.stateLabel.textColor = [UIColor grayColor];
        self.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
        
        //初始化时开始刷新
        [self beginRefreshing];
    }
    return self;
}

@end
