//
//  FFRouter.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFViewModel.h"

@interface FFRouter : NSObject

/// 返回一个单例的实例
+ (instancetype)sharedInstance;
/// 返回和viewModel映射的congroller
- (UIViewController *)controllerForViewModel:(FFViewModel *)viewModel;

@end
