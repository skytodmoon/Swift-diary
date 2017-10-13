//
//  FFRouter.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFRouter.h"
#import "UIViewController+ViewModel.h"

@interface FFRouter ()

@property (nonatomic, copy) NSDictionary *mappingDict; 

@end

@implementation FFRouter

+ (instancetype)sharedInstance {
    static FFRouter *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[FFRouter alloc]init];
    });
    return _instance;
}

- (UIViewController *)controllerForViewModel:(FFViewModel *)viewModel {
    NSString *controller = self.mappingDict[NSStringFromClass(viewModel.class)];
    NSParameterAssert([NSClassFromString(controller) isSubclassOfClass:[UIViewController class]]);
    NSParameterAssert([NSClassFromString(controller) instancesRespondToSelector:@selector(initWithViewModel:)]);
    return [[NSClassFromString(controller) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)mappingDict {
    return @{
             @"FFSpecialViewModel":@"FFSpecialDetailController",
             @"FFAuthorViewModel":@"FFAuthorDetailController"
             };
}

@end
