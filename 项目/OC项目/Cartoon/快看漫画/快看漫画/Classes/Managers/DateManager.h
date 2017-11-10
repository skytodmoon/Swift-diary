//
//  DateManager.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

//@"yyyy-MM-dd HH:mm:ss.ff";

static NSString * const defautFormat = @"yyyy-MM-dd";

@interface DateManager : NSObject

@property (nonatomic,strong,readonly) NSDateFormatter *format;

//当前的时间
@property (nonatomic,readonly) NSDate *currentDate;

// 1(星期天) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六) 7(星期天)
// 获取今天是星期几
@property (nonatomic,readonly) NSInteger currentWeek;

- (NSDate *)dateByTodayAddingDays: (NSInteger)dDays;

- (NSString *)timeStampWithDate:(NSDate *)date;
- (NSString *)timeWithTimeStamp:(NSInteger)timeStamp;

- (NSString *)conversionTimeStamp:(NSNumber *)timeStamp;
- (NSString *)conversionTimeStampVer2:(NSNumber *)timeStamp;

+ (instancetype)share;


@end
