

import Foundation

//创建NSDateComponents对象 
let comps = NSDateComponents()

//设置开幕式时间是2016-8-5
//设置NSDateComponents中的日期
comps.day = 5
//设置NSDateComponents中的月份
comps.month = 8
//设置NSDateComponents中的年份 
comps.year = 2016

//创建日历对象
let calender = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
//从日历中获得2016-8-5日期对象
let destinationDate = calender!.dateFromComponents(comps)

let now: NSDate = NSDate()

//获得当前日期到2016-8-5的时间段的NSDateComponents对象
let components = calender!.components(NSCalendarUnit.Day, fromDate: now, toDate: destinationDate!, options: [])

//获得当前日期到2016-8-5相差的天数
let days = components.day

let units: NSCalendarUnit = [ .Year, .Month, .Day, .Hour, .Minute, .Second]
