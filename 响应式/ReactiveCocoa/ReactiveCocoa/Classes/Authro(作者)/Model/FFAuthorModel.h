//
//  FFAuthorModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFAuthorModel : NSObject

/// 认证类型: 专家
@property (nonatomic, copy) NSString *auth;
/// 所在城市
@property (nonatomic, copy) NSString *city;
/// 简介
@property (nonatomic, copy) NSString *content;
/// 是否订阅
@property (nonatomic, assign) NSInteger dingYue;
/// 头像
@property (nonatomic, copy) NSString *headImg;
/// 用户id
@property (nonatomic, copy) NSString *authorID;
/// 标示: 官方认证
@property (nonatomic, copy) NSString *identity;
/// 用户名
@property (nonatomic, copy) NSString *userName;
/// 手机号
@property (nonatomic, copy) NSString *mobile;
/// 订阅数
@property (nonatomic, assign) NSInteger subscibeNum;
/// 认证的等级, 1是yellow, 2是个人认证
@property (nonatomic, assign) NSInteger newAuth;
/// 认证等级的图标
@property (nonatomic, copy) NSString *authIconName;
/// 经验值
@property (nonatomic, assign) NSInteger experience;
/// 等级
@property (nonatomic, assign) NSInteger level;
/// 积分
@property (nonatomic, assign) NSInteger integral;

@end
