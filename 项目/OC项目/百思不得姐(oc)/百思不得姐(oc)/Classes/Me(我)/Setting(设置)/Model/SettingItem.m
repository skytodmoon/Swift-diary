//
//  SettingItem.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem
//实现类方法，进行赋值
+ (instancetype)itemWithTitle:(NSString *)title
{
    SettingItem *item = [[self alloc] init];
    
    item.title = title;
    
    return item;
}

@end
