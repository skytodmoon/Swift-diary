//
//  BrandView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeHeadData.h"

typedef NS_ENUM(NSInteger, BrandViewType) {
    BrandViewTypeThree,
    BrandViewTypeFour
};


@interface BrandView : UIView
- (instancetype)initWithActRow:(ActInfo *)actInfo;

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,copy) ClikedCallback callback;

@end
