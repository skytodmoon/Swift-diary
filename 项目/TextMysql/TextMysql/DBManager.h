//
//  DBManager.h
//  TextMysql
//
//  Created by 金亮齐 on 2017/6/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface DBManager : NSObject

+ (DBManager *)sharedManager;
- (NSArray *)getAllPersons;
- (void)addPerson:(Person *)p;
- (void)deletaPerson:(Person *)p;

@end
