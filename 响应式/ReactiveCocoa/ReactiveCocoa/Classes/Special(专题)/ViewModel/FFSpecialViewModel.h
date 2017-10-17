//
//  FFSpecialViewModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFViewModel.h"

@interface FFSpecialViewModel : FFViewModel<FFViewModelProtocol>

/// Picture的URL
@property (nonatomic, copy) NSString *smallIcon;
/// 头像图标
@property (nonatomic, copy) NSString *headImg;
/// 表示官方认证
@property (nonatomic, copy) NSString *authorIdentity;
/// 类别的名字
@property (nonatomic, copy) NSString *categoryName;
/// 认证的图标
@property (nonatomic, copy) NSString *authIconName;
/// 标题
@property (nonatomic, copy) NSString *title;
/// 摘要
@property (nonatomic, copy) NSString *desc;
/// 用户名
@property (nonatomic, copy) NSString *userName;
/// 阅读数
@property (nonatomic, copy) NSString *readNum;
/// 点赞数
@property (nonatomic, copy) NSString *followNum;
/// 评论数
@property (nonatomic, copy) NSString *commentNum;
/// 对应cell的class
@property (nonatomic, strong) Class cellClass;
/// 点击用户头像
@property (nonatomic, strong) RACSubject *headerClickSubject;

- (RACCommand *)requestSpecialList;



@end
