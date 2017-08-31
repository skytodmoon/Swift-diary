//
//  NSDate+Extension.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import Foundation

extension NSDate {
    
    class func dateWithStr(time: String) ->NSDate {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z yyyy"
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale!
        let createdDate = formatter.date(from: time)!
        
        return createdDate as NSDate
    }
    
    //MARK: - 刚刚(一分钟内) X分钟前(一小时内) X小时前(当天) 昨天 HH:mm(昨天) MM-dd HH:mm(一年内) yyyy-MM-dd HH:mm(更早期)
    var descDate: String {
        let calendar = NSCalendar.current
        
        if calendar.isDateInToday(self as Date){
            let since = Int(NSDate().timeIntervalSince(self as Date))
            if since < 60 {
                return "刚刚"
            }
            if since < 60 * 60{
                return "\(since/60)分钟前"
            }
            return "\(since / (60 * 60))小时前"
        }
        
        var formatterStr = "HH:mm"
        if calendar.isDateInYesterday(self as Date){
            formatterStr = "昨天" + formatterStr
        }else{
            formatterStr = "MM-dd" + formatterStr
//            let comps = calendar.components(NSCalendar.Unit.Year, fromDate: self, toDate: NSDate(), options: NSCalendar.Options(rawValue: 0))
//            if comps.year >= 1
//            {
//                formatterStr = "yyyy-" + formatterStr
//            }
        }
        let formatter = DateFormatter()
        formatter.dateFormat = formatterStr
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale!
        
        return formatter.string(from: self as Date)
    }
}
