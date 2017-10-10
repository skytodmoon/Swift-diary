//: Playground - noun: a place where people can play

import UIKit

//实例方法
class Counter {
    //可变属性 count
    var count = 0
    
    func increment() {
        count
    }
    //让计数器按一个指定的整数值递增
    func incrementBy(amount: Int) {
        count += amount
    }
    //将计数器重置为0
    func reset() {
        count = 0
    }
    
}
let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.incrementBy(amount: 5)
// 计数值现在是6
counter.reset()
// 计数值现在是0

//方法的局部参数名称和外部参数名称
class Counter2 {
    
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int){
        count += amount * numberOfTimes
    }
}

let counter2 = Counter2()
counter2.incrementBy(amount: 5, numberOfTimes: 3)

//self 属性

struct Point {
    
    var x = 0.0 ,y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x: 1.0){
    print("This point is to the right of the line where x == 1.0")
}


//在实例方法中修改值类型
//struct Point {
//    var x = 0.0, y = 0.0
//    mutating func moveByX(deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
//}
//var somePoint = Point(x: 1.0, y: 1.0)
//somePoint.moveByX(2.0, y: 3.0)
//print("The point is now at (\(somePoint.x), \(somePoint.y))")
//// 打印输出: "The point is now at (3.0, 4.0)"
//let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)
// 这里将会抛出一个错误

//在变异方法中给self赋值
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight 现在等于 .High
ovenLight.next()
// ovenLight 现在等于 .Off


//类型方法
class SomeClass {
    class func someTypeMethod() {
        
    }
}
SomeClass.someTypeMethod()


struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level: level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var trancker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int){
        LevelTracker.unlockLevel(level: 1)
        trancker.advanceToLevel(level: 1)
    }
        init(name: String){
            playerName = name
        }
}

var player = Player(name: "Argyrios")
player.completedLevel(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.trancker.advanceToLevel(level: 6){
    print("player is now no level 6")
}else{
    print("level 6 has not yet been unlcoked")
}


//下标脚本语法
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("3的6倍是\(threeTimesTable[6])")
// 输出 "3的6倍是18"


//下标脚本用法
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

//下标脚本选项
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row:row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}












