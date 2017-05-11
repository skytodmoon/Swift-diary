//
//  HomeHeadView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HotView.h"
#import "PageScrollView.h"
#import "HomeHeadData.h"
#import "BrandView.h"
#import "HeadlineView.h"

@interface HomeHeadView : UIView

//@property (nonatomic,strong) HeadData *headData;
@property (nonatomic,strong) HotView *hotView;
@property (nonatomic,strong) PageScrollView *pageView;
@property (nonatomic,strong) BrandView *brandView;
@property (nonatomic,strong) BrandView *sceneView;
@property (nonatomic,strong) HeadlineView *headlineView;

- (instancetype)initWithHeadData:(HomeHeadData *)headData;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,copy) ClikedCallback callback;

@end
