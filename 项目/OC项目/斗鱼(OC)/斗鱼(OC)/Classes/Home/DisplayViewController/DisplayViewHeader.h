
//
//  Const.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#ifndef Const_h
#define Const_h

#import "DisplayViewController.h"

// 导航条高度
static CGFloat const NavBarH = 64;

// 标题滚动视图的高度
static CGFloat const TitleScrollViewH = 44;

// 标题缩放比例
static CGFloat const TitleTransformScale = 1.3;

// 下划线默认高度
static CGFloat const UnderLineH = 2;

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

// 默认标题字体
#define TitleFont [UIFont systemFontOfSize:15]

// 默认标题间距
static CGFloat const margin = 20;

static NSString * const ID = @"cell";

// 标题被点击或者内容滚动完成，会发出这个通知，监听这个通知，可以做自己想要做的事情，比如加载数据
static NSString * const DisplayViewClickOrScrollDidFinshNote = @"DisplayViewClickOrScrollDidFinshNote";

// 重复点击通知
static NSString * const DisplayViewRepeatClickTitleNote = @"DisplayViewRepeatClickTitleNote";


#endif /* Const_h */
