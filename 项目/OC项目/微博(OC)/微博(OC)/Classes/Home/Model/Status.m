//
//  Status.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "Status.h"
#import "User.h"
#import "MJExtension.h"
#import "Photo.h"


@implementation Status
-(NSDictionary *)objectClassInArray {
    
    return @{@"pic_urls" : [Photo class]};
}

-(NSString *)created_at {
    
    // _created_at == Thu Oct 16 17:06:25 +0800 2014
    // dateFormat == EEE MMM dd HH:mm:ss Z yyyy
    // NSString --> NSDate

    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
     // 如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
     fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    // 微博的创建日期
    NSDate *creatDate = [fmt dateFromString:_created_at];
    // 当前时间
    NSDate *now = [NSDate date];
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;

    //计算两个日期之间的差值
    NSDateComponents *component = [calender components:unit fromDate:creatDate toDate:now options:0];
    
    
    if ([creatDate isThisYear]) { // 今年
        if ([creatDate isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:creatDate];
        } else if ([creatDate isToday]) { // 今天
            if (component.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前", (long)component.hour];
            } else if (component.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前", (long)component.minute];
            } else {
                return @"刚刚";
            }
        } else { // 今年的其他日子
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:creatDate];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:creatDate];
    }

}

- (void)setSource:(NSString *)source
{
    // 正则表达式 NSRegularExpression
    // 截串 NSString
    NSRange range;
    range.location = [source rangeOfString:@">"].location + 1;
    range.length = (NSInteger)[source rangeOfString:@"</"].location - range.location;
    //Log(@"%@ %lu %lu",range,(unsigned long)range.length,(unsigned long)source.length);
    if(range.length > 150){
        return;
    }else{
        _source = [NSString stringWithFormat:@"来自%@", [source substringWithRange:range]];
 
    }
}


@end
