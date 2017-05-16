//
//  SettingItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject
//定义一个属性
@property (nonatomic,strong) NSString *title;

//提供一个接口，用来保存每一行cell的功能
@property (nonatomic,strong) void(^itemOpertion)(NSIndexPath *indexPath);

//提供一个类方法，方便调用
+ (instancetype)itemWithTitle:(NSString *)title;
@end
