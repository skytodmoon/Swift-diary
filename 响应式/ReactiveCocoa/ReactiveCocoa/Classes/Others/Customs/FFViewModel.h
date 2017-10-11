//
//  FFViewModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFViewModelProtocol.h"

@interface FFViewModel : NSObject <FFViewModelProtocol>

@property (nonatomic, copy) NSDictionary *params;
@property (nonatomic, copy) NSString *navTitle;
@property (nonatomic, copy) NSString *tabTitle;
@property (nonatomic, copy) NSString *tabIcon;
@property (nonatomic, copy) NSString *viewcontroller;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) RACSubject *didSelectSubject;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
