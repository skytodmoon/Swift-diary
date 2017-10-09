//: Playground - noun: a place where people can play

import UIKit

//储存属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
//该区间表示整数0,1,2
var rangeOfThressItems = FixedLengthRange(firstValue: 0, length: 3)
//该区间表示整数6,7,8
rangeOfThressItems.firstValue = 6


//常量结构体的存储属性
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数0，1，2，3
//rangeOfFourItems.firstValue = 6
// 尽管 firstValue 是个变量属性，这里还是会报错


//延迟存储属性
class DataImporter {
    /*
     DataImporter 是一个将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     */
    var fileName = "data.txt"
    // 这是提供数据导入功能
}

class DataManger{
    lazy var importer = DataImporter()
    var data = [String]()
    // 这是提供数据管理功能
}

let manager = DataManger()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建

print(manager.importer.fileName)
// DataImporter 实例的 importer 属性现在被创建了

//计算属性
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, heigth = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.heigth / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.heigth / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, heigth: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x),\(square.origin.y))")


//setter声明
//struct AlternativeRect {
//
//    var origin = Point()
//
//    var size = Size()
//
//    var center: Point {
//
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//
//        set {
//            origin.x = newValue.x - (size.width / 2)
//            origin.y = newValue.y - (size.height / 2)
//        }
//
//    }
//
//}

//只读计算属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//属性观察器

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps){
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps


//类型属性语法
struct SomeStructure {
    static var storedTyoeProperty = "Some value"
    static var computedTypeProperty : Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty : Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty : Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

//获取和设置类型属性的值
print(SomeStructure.storedTyoeProperty)

SomeStructure.storedTyoeProperty = "Another value"

print(SomeStructure.storedTyoeProperty)

print(SomeEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)






