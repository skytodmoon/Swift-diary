//
//  DBManager.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "DBManager.h"

NSString * const KDBName = @"db.sqlite";

static FMDatabase *_db;

@interface DBManager()

@property(nonatomic,copy) NSDictionary *whiteList;

@end

@implementation DBManager

+(instancetype)sharedManager {
    static DBManager *manager = nil;
    static dispatch_once_t onctToken;
    dispatch_once(&onctToken, ^{
        manager = [[DBManager alloc]init];
    });
    return manager;
}

+(void)initialize {
    
}

@end
