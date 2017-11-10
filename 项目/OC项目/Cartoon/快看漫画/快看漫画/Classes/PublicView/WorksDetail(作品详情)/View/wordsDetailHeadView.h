//
//  wordsDetailHeadView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "wordsDetailModel.h"
#import "PrefixHeader.pch"

#define wordsDetailHeadViewHeight  200

@interface wordsDetailHeadView : UIView

@property (nonatomic,strong) wordsDetailModel *model;

+ (instancetype)wordsDetailHeadViewWithFrame:(CGRect)frame scorllView:(UIScrollView *)sc;

@end
