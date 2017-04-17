


import Foundation

let keyString: NSString = "one two three four five"
var keys = keyString.componentsSeparatedByString(" ")

let valueString: NSString = "alpha bravo charlie delta echo"
var values = valueString.componentsSeparatedByString(" ")

var dict = NSDictionary(objects: values, forKeys: keys)

NSLog("%@", dict.description)

//var value:NSString = dict.objectForKey("three") as! NSString
var value:NSString = dict["three"] as! NSString

NSLog("three = %@", value)

var allkeys = dict.allKeys
for item in allkeys {
    var key = item as! NSString
    NSLog("%@ - %@", key, dict.objectForKey(key) as! NSString)
}
