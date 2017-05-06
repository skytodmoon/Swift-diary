




import Foundation

var weeksArray:NSSet = ["星期一","星期二", "星期三", "星期四"]
weeksArray = weeksArray.setByAddingObject("星期五")
weeksArray = weeksArray.setByAddingObjectsFromArray(["星期六","星期日"])

var weeksNames = NSSet(set: weeksArray)

for item in weeksNames {
    var day = item as! NSString
    NSLog("%@", day)
}
