//
//  UIView+FFAdd.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIView+FFAdd.h"
#import <objc/runtime.h>

static char viewModelKey;

@implementation UIView (FFAdd)

-(void)setViewModel:(FFViewModel *)viewModel {
    objc_setAssociatedObject(self, &viewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(FFViewModel *)viewModel {
    return objc_getAssociatedObject(self, &viewModelKey);
}

@end
