//
//  CategoryItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryItem : NSObject
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger count;

//这个类对应的用户总数据
@property (nonatomic,strong) NSMutableArray *users;
//总数
@property (nonatomic,assign) NSInteger total;
//当前页码
@property (nonatomic,assign) NSInteger currentPage;
@end
