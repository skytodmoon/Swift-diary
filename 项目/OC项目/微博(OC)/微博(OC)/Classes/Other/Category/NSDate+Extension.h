//
//  NSDate+Extension.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  是否是今天
 */
- (BOOL)isToday;
/**
 *  是否是昨天
 */
- (BOOL)isYesterday;
/**
 *  是否是今年
 */
- (BOOL)isThisYear;

/**
 *  获取与当前时间的差距
 */
- (NSDateComponents *)deltaToNow;
@end
