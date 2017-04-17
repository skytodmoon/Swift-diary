




import Foundation

let number = 1_2345_6789

let formatter = NSNumberFormatter()

//十进制数字
formatter.numberStyle = .DecimalStyle
var stringNumber = formatter.stringFromNumber(number)
print("DecimalStyle : \(stringNumber!)")

let number1 = 0
//Int自动转换为NSNumber
let number2: NSNumber = number1

var number3 = 0
//NSNumber强制类型转换为Int
number3 = number2 as Int
