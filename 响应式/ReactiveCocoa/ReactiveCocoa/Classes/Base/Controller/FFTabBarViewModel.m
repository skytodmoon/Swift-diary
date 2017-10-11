//
//  FFTabBarViewModel.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFTabBarViewModel.h"

@interface FFTabBarViewModel ()

/// tabBar的标题数组
@property (nonatomic, copy) NSArray *tabTitles;
/// tabBar的图标数组
@property (nonatomic, copy) NSArray *tabIcons;
/// tabBar对应的控制器数组
@property (nonatomic, copy) NSArray *viewcontrollers;

@end

@implementation FFTabBarViewModel

- (instancetype)initWithParams:(NSDictionary *)params {
    
    if (self = [super initWithParams:params]) {
        
        self.specialViewModel = [[FFSpecialViewModel alloc]initWithParams:[self paramsWithIndex:0]];
        self.authorViewModel = [[FFAuthorViewModel alloc]initWithParams:[self paramsWithIndex:1]];
        self.shopViewModel = [[FFShopViewModel alloc] initWithParams:[self paramsWithIndex:2]];
    }
    return self;
}

- (NSDictionary *)paramsWithIndex:(NSInteger)index{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:3];
    dict[@"tabTitle"] = self.tabTitles[index];
    dict[@"tabIcon"] = self.tabIcons[index];
    dict[@"viewcontroller"] = self.viewcontrollers[index];
    return dict.copy;
}

- (NSArray *)tabTitles {
    return @[@"例子一", @"例子二",@"基础"];
}

- (NSArray *)tabIcons {
    return @[@"tb_0",@"tb_2",@"tb_1"];
}

- (NSArray *)viewcontrollers {
    return @[@"FFSpecialController",@"FFAuthorController",@"FFShopController"];
}

@end
