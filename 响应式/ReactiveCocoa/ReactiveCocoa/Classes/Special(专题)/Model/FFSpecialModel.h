//
//  FFSpecialModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFAuthorModel.h"

///----------------
/// FFCategoryModel
///----------------
@interface FFCategoryModel : NSObject

/// 专题创建时间
@property (nonatomic, copy) NSString *createDate;
/// 专题类型ID
@property (nonatomic, copy) NSString *categoryID;
/// 专题类型名称
@property (nonatomic, copy) NSString *name;
/// 专题序号
@property (nonatomic, assign) NSInteger order;

@end

///---------------
/// FFArticleModel
///---------------
@interface FFSpecialModel : NSObject

/// 创建时间
@property (nonatomic, copy) NSString *createDate;
/// 描述创建时间,昨天, 今天, 去年等
@property (nonatomic, copy) NSString *createDateDesc;
/// 摘要
@property (nonatomic, copy) NSString *desc;
/// 评论数
@property (nonatomic, copy) NSString *fnCommentNum;
/// 点赞数
@property (nonatomic, copy) NSString *favo;
/// 文章ID
@property (nonatomic, copy) NSString *articleID;
/// 序号
@property (nonatomic, assign) NSInteger order;
/// 文章的H5地址
@property (nonatomic, copy) NSString *pageUrl;
/// 阅读数
@property (nonatomic, copy) NSString *read;
/// 分享数
@property (nonatomic, copy) NSString *share;
/// 用户分享的URL
@property (nonatomic, copy) NSString *sharePageUrl;
/// 缩略图 URL
@property (nonatomic, copy) NSString *smallIcon;
/// 文章标题
@property (nonatomic, copy) NSString *title;
/// 是否是首页的, 如果是首页不显示时间
@property (nonatomic, assign) BOOL isNotHomeList;
/// 作者
@property (nonatomic, strong) FFAuthorModel *author;
/// 所属类别
@property (nonatomic, strong) FFCategoryModel *category;

@end

