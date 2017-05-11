//
//  AccountTool.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AccountTool.h"

#import "Account.h"

#define AcountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation AccountTool

+ (void)saveAccount:(Account *)account
{
    //MARK: - 计算过期时间
    NSDate *now = [NSDate date];
    account.expiresTime = [now dateByAddingTimeInterval:account.expires_in];
    
    [NSKeyedArchiver archiveRootObject:account toFile:AcountFile];
}

+ (Account *)account
{
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AcountFile];
    
    //MARK: - 判断是否过期
    if ([[NSDate date] compare:account.expiresTime] == NSOrderedAscending) { // 没过期
        return account;
    } else {
        return nil;
    }
}

@end
