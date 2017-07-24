//
//  RefreshGifHeader.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "RefreshGifHeader.h"

@implementation RefreshGifHeader

- (instancetype)init
{
    if (self = [super init]) {
        self.lastUpdatedTimeLabel.hidden = YES;
        self.stateLabel.hidden = YES;
        [self setImages:@[[UIImage imageNamed:@"img_top_refresh_gy1"],
                          [UIImage imageNamed:@"img_top_refresh_gy2"],
                          [UIImage imageNamed:@"img_top_refresh_gy3"],
                          [UIImage imageNamed:@"img_top_refresh_gy4"],
                          [UIImage imageNamed:@"img_top_refresh_gy5"],
                          [UIImage imageNamed:@"img_top_refresh_gy6"]]
               forState:MJRefreshStateRefreshing];
        
        [self setImages:@[[UIImage imageNamed:@"img_top_refresh_gy1"],
                          [UIImage imageNamed:@"img_top_refresh_gy2"],
                          [UIImage imageNamed:@"img_top_refresh_gy3"],
                          [UIImage imageNamed:@"img_top_refresh_gy4"],
                          [UIImage imageNamed:@"img_top_refresh_gy5"],
                          [UIImage imageNamed:@"img_top_refresh_gy6"]]
               forState:MJRefreshStatePulling];
        
        [self setImages:@[[UIImage imageNamed:@"img_top_refresh_gy1"]]
               forState:MJRefreshStateIdle];
    }
    return self;
}


@end
