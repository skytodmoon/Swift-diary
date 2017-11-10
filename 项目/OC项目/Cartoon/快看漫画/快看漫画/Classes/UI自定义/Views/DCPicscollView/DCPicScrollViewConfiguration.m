//
//  DCPicScrollViewConfiguration.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DCPicScrollViewConfiguration.h"

@interface pageControl : UIPageControl <pageControlProtocol>

@end

@implementation pageControl

@end


@implementation DCPicScrollViewConfiguration

+ (instancetype)defaultConfiguration {
    
    DCPicScrollViewConfiguration *psvc = [[DCPicScrollViewConfiguration alloc] init];
    
    psvc.needAutoScroll = YES;
    psvc.timeInterval = 3;
    psvc.pageAlignment = PageContolAlignmentRight;
    psvc.itemConfiguration = [DCPicItemConfiguration defaultConfiguration];
    psvc.pageEdgeInsets = UIEdgeInsetsMake(0, 0,5,5);
    
    pageControl *page = [[pageControl alloc] init];
    page.currentPageIndicatorTintColor = [UIColor whiteColor];
    page.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    psvc.page = page;
    
    return psvc;
}

- (void)setPageAlignment:(PageContolAlignment)pageAlignment {
    _pageAlignment = pageAlignment;
    if (pageAlignment != PageContolAlignmentRight) {
        self.itemConfiguration.showBottomView = NO;
    }
}


@end
