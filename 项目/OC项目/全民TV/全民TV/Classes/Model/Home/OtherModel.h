//
//  OtherModel.h
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HOME_OTHER_MANAGER [OtherDataManager share]

@class CategoryModel;

@interface OtherDataManager : NSObject

@end



@class CategoryListModel;

@interface OtherModel : NSObject

/** 总页数 */
@property (nonatomic, assign) NSInteger pageCount;
/** 当前页数 */
@property (nonatomic, assign) NSInteger page;
/** 一页多少个 */
@property (nonatomic, assign) NSInteger size;
/** 总个数 */
@property (nonatomic, assign) NSInteger total;
/** 下一页 */
@property (nonatomic)         int       nextPage;
/** 数据 */
@property (nonatomic, strong) NSMutableArray<CategoryListModel *> *data;

@end
