//
//  NSDate+Extension.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    // 当前时间的年月日
    NSDateComponents *nowComps = [calendar components:unit fromDate:[NSDate date]];
    
    // 调用此方法的对象的年月日
    NSDateComponents *selfComps = [calendar components:unit fromDate:self];
    
    return (nowComps.year == selfComps.year) && (nowComps.month == selfComps.month) && (nowComps.day == selfComps.day);
}

- (BOOL)isYesterday
{
    // coding...
    
    return NO;
}

- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 当前时间的年
    NSDateComponents *nowComps = [calendar components:unit fromDate:[NSDate date]];
    
    // 调用此方法的对象的年月日
    NSDateComponents *selfComps = [calendar components:unit fromDate:self];
    
    return nowComps.year == selfComps.year;
}

- (NSDateComponents *)deltaToNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

@end
