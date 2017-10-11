//
//  UIViewController+ViewModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFViewControllerProtocol.h"
#import "FFViewModelProtocol.h"
#import "FFViewModel.h"

@interface UIViewController (ViewModel) <FFViewControllerProtocol>

@property (nonatomic, strong) FFViewModel *viewModel;

- (instancetype)initWithViewModel:(id<FFViewModelProtocol>)viewModel;

@end
