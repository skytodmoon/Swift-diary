


import Foundation

let weeksArray = ["星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日"]

var weeksNames = NSArray(array: weeksArray)

NSLog("星期名字")
NSLog("====   ====")

for i in 0 ..< weeksNames.count {
    var obj = weeksNames[i]  //weeksNames.objectAtIndex(i)
    var day = obj as! NSString
    NSLog("%i     %@", i, day)
}

for item in weeksNames {
    var day = item as! NSString
    NSLog("%@", day)
}
