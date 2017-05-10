//
//  TitileIconAction.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitileIconAction : UIView
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) UIViewController *controller;
@property (nonatomic,assign) NSInteger tag;

+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controller tag:(NSInteger)tag;
@end
