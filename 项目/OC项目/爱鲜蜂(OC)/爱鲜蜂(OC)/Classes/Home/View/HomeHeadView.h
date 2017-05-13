//
//  HomeHeadView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "HomeHeadData.h"
#import "ScrollerPageView.h"
#import "HeadLineView.h"
#import "HotView.h"

@interface HomeHeadView : UIView
@property (nonatomic, strong) ScrollerPageView *scrollerView;
@property (nonatomic, strong) HotView *hotView;
@property (nonatomic, strong) HeadLineView *headlineView;
@property (nonatomic, assign) CGFloat height;

- (instancetype)initWithHeadData:(HomeHeadData *)headData;
@property (nonatomic, copy) ClikedCallback callback;



@end
