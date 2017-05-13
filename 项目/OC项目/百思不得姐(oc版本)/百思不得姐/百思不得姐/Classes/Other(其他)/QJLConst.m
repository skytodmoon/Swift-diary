//
//  QJLConst.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLConst.h"

CGFloat const QJLTitlesViewH = 35;
CGFloat const QJLTitlesViewY = 64;

CGFloat const QJLTopicCellMargin = 10;
CGFloat const QJLTopicCellTextY = 70;
CGFloat const QJLTopicCellBottomBarH = 44;

/** 精华-cell-图片帖子的最大高度*/
CGFloat const QJLTopicCellPictureMaxH = 1000;
/** 精华-cell-图片帖子的一旦超过最大高度，就用Break*/
CGFloat const QJLTopicCellPictureBreakH = 250;

/** 用户模型性别属性值-男*/
NSString *const QJLUserSexMale = @"m";
/** 用户模型性别属性值-女*/
NSString *const QJLUserSexFamale = @"f";
/** 最热评论标题的高度*/
CGFloat const QJLTopicCellCmtTitleH = 20;
/** tabBar 被点击的通知*/
NSString *const QJLTabBarDidSelectedNotification = @"QJLTabBarDidSelectedNotification";
/** tabBar 被点击的通知 - 被点击的控制器的 index key*/
NSString *const QJLSelectedControllerIndexKey = @"QJLSelectedControllerIndexKey";
/** tabBar 被点击的通知 - 被点击的控制器 key*/
NSString *const QJLSelectedControllerKey = @"QJLSelectedControllerKey";
