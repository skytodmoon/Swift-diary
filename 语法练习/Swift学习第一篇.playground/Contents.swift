//: Playground - noun: a place where people can play

import UIKit

//常量和变量

/* 允许的最大尝试登录次数 */
let maximumNumberOfLoginAttempts = 10
/* 当前尝试登录次数 */
var cyrrentLoginAttempt = 0

var x = 1.0, y = 2.0, z = 3.0
var a = 12, b = 22, c = 32

//类型的标注

var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double


//常量和变量的命名
let 你好 = "你好世界"
let MM = "dogcow"
let π = 3.14

var friedlyWelcome = "Hello!"
friedlyWelcome = "BonJour!"

let languageName = "Swift"
//会报错，languageName不可改变
//languageName = "Swift++"

//输出常量和变量
print(friedlyWelcome)

print("这是一个输出\(friedlyWelcome)")

//注释


//分号
let cat = "?";print(cat);var title : String

//整数范围
//minValue 为 0，是UInt8 类型
let minValue = UInt8.min
//maxValue 为 255，是UInt8 类型
let maxValue = UInt8.max

//类型安全和类型推断
//meaningOfLife 会被推测为Int类型
let meaningOfLife = 42
//pi会被推断为Double 类型
let pi = 3.1312
//anotherPi会被推测为Double类型
let anotherPi = 3 + 0.14159

//数值类型字面量
let decimalInterger = 17
let binaryInterger = 0b10001
let octalInterger = 0o21
let hexadecimalInterger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//类型转换
//UInt8 类型不能储存负数，会报错
//let cannotBeNegative: UInt8 = -1
//Int8 类型不能储存超过最大值的数，所以会报错
//let tooBig: Int8 = Int8.max + 1

//整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let PI = Double(three) + pointOneFourOneFiveNine

let intergerPi = Int(PI)
//intergerPi d等于3 所以推测为Int类型

//类型别名
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
//maxAmplitudeFound 现在是0

//布尔值

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
}else{
    print("Eww,turnips are horrible")
}


//元祖
//http404Error 类型是(Int,String),值是(404, "Not Found")
let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status messgae is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode : 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


//可选类型
//serverResponseCode 包含一个可选的Int值404
var serverResponseCode : Int? = 404
serverResponseCode = nil
//serverResponseCode现在不包含值

//错误处理
func makeASandwich() throws {
    
}

