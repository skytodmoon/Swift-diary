//
//  SettingGroupItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroupItem : NSObject

//数组模型，用来存放没组的Cell
@property (nonatomic,strong) NSArray *items;

//头部模型
@property (nonatomic,strong) NSString *headerTitle;

//类方法
+ (instancetype)groupWithItems:(NSArray *)items;

@end
