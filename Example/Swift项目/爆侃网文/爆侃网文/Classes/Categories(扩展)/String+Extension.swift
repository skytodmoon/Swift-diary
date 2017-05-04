//
//  String+Extension.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import Foundation

extension String
{
    
    /**
     时间戳转为时间
     
     - returns: 时间字符串
     */
    func timeStampToString() -> String
    {
        let string = NSString(string: self)
        let timeSta: NSTimeInterval = string.doubleValue
        let dfmatter = NSDateFormatter()
        dfmatter.dateFormat = "yyyy年MM月dd日"
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.stringFromDate(date)
    }
    
    /**
     时间转为时间戳
     
     - returns: 时间戳字符串
     */
    func stringToTimeStamp()->String
    {
        let dfmatter = NSDateFormatter()
        dfmatter.dateFormat = "yyyy年MM月dd日"
        let date = dfmatter.dateFromString(self)
        let dateStamp: NSTimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)
        return String(dateSt)
    }
}
