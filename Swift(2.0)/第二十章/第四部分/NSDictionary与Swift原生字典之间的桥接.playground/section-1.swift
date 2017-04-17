


import Foundation

let keyString: NSString = "one two three four five"
let keys = keyString.componentsSeparatedByString(" ")

let valueString: NSString = "alpha bravo charlie delta echo"
let values = valueString.componentsSeparatedByString(" ")

let foundationDict = NSDictionary(objects:values, forKeys:keys)

let swiftDict: [String : String] = foundationDict as! [String : String]

print(swiftDict.description)

let value = swiftDict["three"]
print("three = \(value!)")

for (key, value) in swiftDict {
    print("\(key) - \(value)")
}

let dict: NSDictionary = swiftDict
