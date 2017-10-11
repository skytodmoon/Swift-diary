//
//  UIViewController+ViewModel.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "UIViewController+ViewModel.h"
#import <objc/runtime.h>

static char viewModelKey;
@implementation UIViewController (ViewModel)

- (instancetype)initWithViewModel:(id<FFViewModelProtocol>)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)setViewModel:(FFViewModel *)viewModel {
    objc_setAssociatedObject(self, &viewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FFViewModel *)viewModel {
    return objc_getAssociatedObject(self, &viewModelKey);
}

@end


