//: Playground - noun: a place where people can play

import UIKit


//析构函数
class Rectangle {
    
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(W width: Double,H height: Double) {
        self.width   = width
        self.height  = height
    }
    
    deinit {
        print("调用析构器...")
        self.width = 0.0
        self.height  = 0.0
        
    }
}

var rectc1: Rectangle? = Rectangle(width: 320, height: 480)
print("长方形:\(rectc1!.width) x \(rectc1!.height)")
rectc1 = nil

var rectc2: Rectangle? = Rectangle(W: 320, H: 480)
print("长方形:\(rectc2!.width) x \(rectc2!.height)")
rectc2 = nil


//默认构造函数
class Rectangle2 {
    var width: Double = 0.0
    var height: Double = 0.0
    
    //    init() {
    //
    //    }
    
    //    init(width: Double, height: Double) {
    //        self.width   = width
    //        self.height  = height
    //    }
}

/*
 struct Rectangle {
 var width: Double = 0.0
 var height: Double = 0.0
 
 //    init() {
 //
 //    }
 
 //    init(width: Double, height: Double) {
 //        self.width   = width
 //        self.height  = height
 //    }
 }
 */

var rect2 = Rectangle2()
rect2.width = 320.0
rect2.height = 480.0

print("长方形:\(rect2.width) x \(rect2.height)")


//构造函数与存储属性初始化

class Rectangle3 {
    var width: Double
    var height: Double
    
    init() {
        width   = 0.0
        height  = 0.0
    }
}

var rect3 = Rectangle3()
rect3.width = 320.0
rect3.height = 480.0

print("长方形:\(rect3.width) x \(rect3.height)")


class Employee3 {
    let no: Int
    var name: String?
    var job: String?
    var salary: Double
    var dept: Department3?
    
    init() {
        no = 0
        salary = 0.0
        dept = nil
    }
}

struct Department3 {
    let no: Int
    var name: String
    init() {
        no = 10
        name = "SALES"
    }
}


let dept = Department3()

var emp = Employee3()


//使用外部参数名
//////////////// 示例1 ///////////////////////
class RectangleA {
    var width: Double
    var height: Double
    
    init(W width: Double, H height: Double) {
        self.width   = width
        self.height  = height
    }
}

var recta = RectangleA(W: 320, H: 480)
print("长方形A:\(recta.width) x \(recta.height)")

//////////////// 示例2 ///////////////////////

class RectangleB {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
}

var rectb = RectangleB(width: 320, height: 480)
print("长方形B:\(rectb.width) x \(rectb.height)")

//////////////// 示例3 ///////////////////////
struct RectangleC {
    var width: Double = 0.0
    var height: Double = 0.0
}

var rectc = RectangleC(width: 320, height: 480)
print("长方形C:\(rectc.width) x \(rectc.height)")




//构造函数重载概念
class Rectangle5 {
    
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(W width: Double,H height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(length: Double) {
        self.width   = length
        self.height  = length
    }
    
    init() {
        self.width   = 640.0
        self.height  = 940.0
    }
    
    /*
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(W width: Double,H height: Double) {
        self.width   = width
        self.height  = height
    }
    
    convenience init(length: Double) {
        self.init(W: length, H: length)
    }
    
    convenience init() {
        self.init(width: 640.0, height: 940.0)
    }
     */
}

/*结构体构造函数代理
struct Rectangle {
    
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(W width: Double,H height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(length: Double) {
        self.init(W: length, H: length)
    }
    
    init() {
        self.init(width: 640.0, height: 940.0)
    }
    
}
*/

var rectc11 = Rectangle5(width: 320.0, height: 480.0)
print("长方形1:\(rectc11.width) x \(rectc11.height)")

var rectc21 = Rectangle5(W: 320.0, H: 480.0)
print("长方形2:\(rectc21.width) x \(rectc21.height)")

var rectc31 = Rectangle5(length: 500.0)
print("长方形3:\(rectc31.width) x \(rectc31.height)")

var rectc41 = Rectangle5()
print("长方形4:\(rectc41.width) x \(rectc41.height)")




