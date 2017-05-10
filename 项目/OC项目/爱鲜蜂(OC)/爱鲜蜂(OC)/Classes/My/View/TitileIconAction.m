//
//  TitileIconAction.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "TitileIconAction.h"

@implementation TitileIconAction

+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controller tag:(NSInteger)tag {
    TitileIconAction *titleIconAction = [[self alloc]init];
    titleIconAction.title = title;
    titleIconAction.icon = image;
    titleIconAction.controller = controller;
    titleIconAction.tag = tag;
    return titleIconAction;
}
@end
