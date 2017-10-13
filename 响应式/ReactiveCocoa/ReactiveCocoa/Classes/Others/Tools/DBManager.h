//
//  DBManager.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

+ (instancetype)sharedManager;

/**
 创建Table
 */
- (void)createTable;


/**
 缓存数据到数据库
 
 @param item 缓存数据
 @param cacheKey 缓存的Key
 */
- (void)insertItem:(id)item cacheKey:(NSString *)cacheKey;

/**
 通过缓存的key来获取对应的数据
 
 @param 缓存的Key
 @return 缓存数据
 */
- (id)itemWithCacheKey:(NSString *)cacheKey;

/**
 清空所有缓存数据
 */
- (void)clearAll;

@end
