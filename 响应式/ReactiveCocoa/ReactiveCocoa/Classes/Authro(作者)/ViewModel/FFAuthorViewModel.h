//
//  FFAuthorViewModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFViewModel.h"

@interface FFAuthorViewModel : FFViewModel<FFViewModelProtocol>

- (RACCommand *)requestAuthorList;

/// 头像
@property (nonatomic, copy) NSString *headImg;
/// 用户名
@property (nonatomic, copy) NSString *userName;
/// 认证小图标
@property (nonatomic, copy) NSString *authIconName;
/// 排行
@property (nonatomic, copy) NSString *sortNum;
/// cell对应class
@property (nonatomic, strong) Class cellClass;
/// 擅长话题的点击事件
@property (nonatomic, strong) RACSubject *goodTopicClickSubject;


@end
