//
//  FooterBannerData.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

@interface FooterBannerData : UIView
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSArray<Activity *> *data;
+ (void)loadFootBannerData:(CompleteBlock)comple;
@end
