
import Foundation

// 创建当前时刻对象
let now = NSDate()
print(now)

let formatter =  NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

 // NSDate转换为字符串
let dateString = formatter.stringFromDate(now)
print(dateString)

 //字符串转换为NSDate
formatter.dateFormat = "yyyy-MM-dd"
let birthdayString = "1973-12-08"

let birthday = formatter.dateFromString(birthdayString)
print(birthday!)
