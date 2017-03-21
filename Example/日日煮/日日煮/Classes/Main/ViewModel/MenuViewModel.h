//
//  MenuViewModel.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"
#import "PrefixHeader.pch"

@interface MenuViewModel : BaseViewModel


/** 加载更多数据的可变数组 */
@property (nonatomic, strong) NSMutableArray<MenuDataModel *> *dataList;

/** 第一页数据 */
@property (nonatomic, strong) NSArray<MenuDataModel *> *firstDate;
//对应行数
- (NSInteger)numberForRow;
//图片
- (NSURL *)iconIVForRow:(NSInteger)row;
//点击人数
- (NSString *)clickCountForRow:(NSInteger)row;
//分享人数
- (NSString *)shareCountForRow:(NSInteger)row;
//烹调时长
- (NSString *)cookTimeForRow:(NSInteger)row;
//详情
- (NSString *)detailForRow:(NSInteger)row;
//题目
- (NSString *)titleForRow:(NSInteger)row;
//更新时间
- (NSString *)releaseDateForRow:(NSInteger)row;
//数据
- (MenuDataModel *)dataForRow:(NSInteger)row;
/** 有更多页 */
@property (nonatomic) BOOL isLoadMore;

@end
