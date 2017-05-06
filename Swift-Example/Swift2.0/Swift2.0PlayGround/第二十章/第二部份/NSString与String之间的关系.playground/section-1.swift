


import Foundation

let foundationString: NSString = "alpha bravo charlie delta echo"

let swiftString: String = foundationString as String
let foundationString2: NSString = swiftString

let swiftArray = swiftString.componentsSeparatedByString(" ")

let intString: NSString = "456"
let intValue = Int(intString as String)
