//
//  AccountTool.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;

@interface AccountTool : NSObject

//MARK: -  存储账号
+ (void)saveAccount:(Account *)account;

//MARK: - 获取账号
+ (Account *)account;

@end
