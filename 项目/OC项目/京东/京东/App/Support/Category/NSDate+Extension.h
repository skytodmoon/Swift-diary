//
//  NSDate+Extension.h
//  京东
//
//  Created by 金亮齐 on 2017/6/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

- (BOOL)isToday;

- (BOOL)isYesterday;

- (BOOL)isThisYear;

- (NSDate *)dateWithYMD;

- (NSDateComponents *)deltaWithNow;

@end
