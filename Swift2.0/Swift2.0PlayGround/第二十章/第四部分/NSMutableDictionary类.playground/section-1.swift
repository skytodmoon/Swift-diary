

import Foundation

var mutable = NSMutableDictionary(capacity: 1)

mutable.setObject("Tom", forKey: "tom@jones.com")
mutable.setObject("Bob", forKey: "bob@dole.com")

NSLog("%@", mutable.description)

var keys = mutable.allKeys
for item in keys {
    var key = item as! NSString
    NSLog("%@ - %@", key, mutable.objectForKey(key) as! NSString)
}
