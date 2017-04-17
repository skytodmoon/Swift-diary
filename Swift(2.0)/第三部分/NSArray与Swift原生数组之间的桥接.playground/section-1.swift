


import Foundation

let foundationString: NSString = "alpha bravo charlie delta echo"
let foundationArray: NSArray = foundationString.componentsSeparatedByString(" ")

let swiftArray: [String] = foundationArray as! [String]

for item in foundationArray  {
    print(item)
}

for item in swiftArray  {
    print(item)
}
