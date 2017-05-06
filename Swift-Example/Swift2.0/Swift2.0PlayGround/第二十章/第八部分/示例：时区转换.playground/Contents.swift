
import Foundation

let formatter =  NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

extension NSDate {
    
    var toLocalTime: String {
        
        let timeZone = NSTimeZone.localTimeZone()
        let seconds = NSTimeInterval(timeZone.secondsFromGMTForDate(self))
        
        let date = NSDate(timeInterval: seconds, sinceDate: self)
        let dateString = formatter.stringFromDate(date)
        
        return dateString
    }
    
    var toUTCTime: String {
        
        let timeZone = NSTimeZone.localTimeZone()
        let seconds = -1 * NSTimeInterval(timeZone.secondsFromGMTForDate(self))
        
        let date = NSDate(timeInterval: seconds, sinceDate: self)
        let dateString = formatter.stringFromDate(date)
        
        return dateString
    }
}

let birthdayString = "1973-12-08 20:53:21"
let birthday = formatter.dateFromString(birthdayString)

print(birthdayString)
print("UTC时间:\(birthday!.toUTCTime)")
print("本地时间:\(birthday!.toLocalTime)")

