//
//  QJLConst.h
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    QJLTopicTypeAll = 1,
    QJLTopicTypePicture = 10,
    QJLTopicTypeWord = 29,
    QJLTopicTypeVoice = 31,
    QJLTopicTypeVideo = 41,
}QJLTopicType;

/** 精华-所有顶部标题的高度*/
UIKIT_EXTERN CGFloat const QJLTitlesViewH;
/** 精华-所有顶部标题的y*/
UIKIT_EXTERN CGFloat const QJLTitlesViewY;

/** 精华-cell的间距*/
UIKIT_EXTERN CGFloat const QJLTopicCellMargin;
/** 精华-cell文字的y*/
UIKIT_EXTERN CGFloat const QJLTopicCellTextY;
/** 精华-cell底部工具条的高度*/
UIKIT_EXTERN CGFloat const QJLTopicCellBottomBarH;
/** 精华-cell-图片帖子的最大高度*/
UIKIT_EXTERN CGFloat const QJLTopicCellPictureMaxH;
/** 精华-cell-图片帖子的一旦超过最大高度，就用Break*/
UIKIT_EXTERN CGFloat const QJLTopicCellPictureBreakH;
/** 用户模型性别属性值-男*/
UIKIT_EXTERN NSString *const QJLUserSexMale;
/** 用户模型性别属性值-女*/
UIKIT_EXTERN NSString *const QJLUserSexFamale;
/** 最热评论标题的高度*/
UIKIT_EXTERN CGFloat const QJLTopicCellCmtTitleH;
/** tabBar 被点击的通知*/
UIKIT_EXTERN NSString *const QJLTabBarDidSelectedNotification;
/** tabBar 被点击的通知 - 被点击的控制器的 index key*/
UIKIT_EXTERN NSString *const QJLSelectedControllerIndexKey;
/** tabBar 被点击的通知 - 被点击的控制器 key*/
UIKIT_EXTERN NSString *const QJLSelectedControllerKey;
