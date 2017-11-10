//
//  ModelCacheManager.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCacheManager : NSObject
+ (instancetype)manager;

- (id)cacheForKey:(NSString *)key;

- (void)setCache:(id)aCache forKey:(NSString *)aKey;

- (void)removeCacheForKey:(NSString *)key;

@end
