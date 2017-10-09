//: Playground - noun: a place where people can play

import UIKit

//类和结构体定义

class SomeClass {
    
}
struct SomeStructure {
    
}


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//类和结构体实例
let someResulution = Resolution()
let someVideoMode = VideoMode()

//属性访问
print("The width of someResoultion is \(someResulution.width)")

print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

//结构体类型的成员逐一构造器

let vga = Resolution(width: 640, height: 480)

//构造体和枚举是值类型
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

//枚举遵守相同的行为准侧
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remebered direction is still .West")
}

//类是引用类型
let tenEighty = VideoMode()
    tenEighty.resolution = hd
    tenEighty.interlaced = true
    tenEighty.name = "1090i"
    tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//恒等运算符
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}
