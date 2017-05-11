//
//  ProgressHUDManager.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ProgressHUDManager.h"

@implementation ProgressHUDManager
- (void)setBackgroundColor:(UIColor *)color{
    [SVProgressHUD setBackgroundColor:color];
}
- (void)showImage:(UIImage *)image string:(NSString *)string{
    [SVProgressHUD showImage:image status:string];
}

@end
