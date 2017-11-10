//
//  DCPicItemConfiguration.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DCPicItemConfiguration.h"

@implementation DCPicItemConfiguration
+ (instancetype)defaultConfiguration {
    
    DCPicItemConfiguration *pic = [[DCPicItemConfiguration alloc] init];
    
    pic.contentMode = UIViewContentModeScaleAspectFill;
    pic.showBottomView = NO;
    
    return pic;
}

+ (instancetype)hasTitleViewConfiguration {
    
    DCPicItemConfiguration *pic = [[DCPicItemConfiguration alloc] init];
    
    pic.showBottomView = YES;
    pic.bottomViewHeight = 25;
    pic.textColor   = [UIColor whiteColor];
    pic.textFont    = [UIFont systemFontOfSize:15];
    pic.bgColor     = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    pic.contentMode = UIViewContentModeScaleAspectFill;
    
    return pic;
}

@end
