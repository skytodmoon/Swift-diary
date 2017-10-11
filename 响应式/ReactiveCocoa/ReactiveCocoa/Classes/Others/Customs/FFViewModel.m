//
//  FFViewModel.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFViewModel.h"

@implementation FFViewModel

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.params = params;
        self.navTitle = params[@"tabTitle"];
        self.tabTitle = params[@"tabTitle"];
        self.tabIcon = params[@"tabIcon"];
        self.viewcontroller = params[@"viewcontroller"];
        self.dataSource = @[].mutableCopy;
        self.didSelectSubject = [RACSubject subject];
    }
    return self;
}

@end
