//
//  HeadlinePageView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeadData.h"

@interface HeadlinePageView : UIView

@property (nonatomic,strong) ActInfo *headline;
@property (nonatomic,copy) ClikedCallback callback;

@end
