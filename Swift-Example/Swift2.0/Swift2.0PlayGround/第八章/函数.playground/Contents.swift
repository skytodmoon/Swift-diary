//: Playground - noun: a place where people can play

import UIKit

//使用函数
func rectangleArea(width:Double, height:Double) -> Double {
    let area = width * height
    return area
}

print("320x480的长方形的面积:\(rectangleArea(320, height: 480))")

//使用外部参数名
func rectangleArea2(W width:Double, H height:Double) -> Double {
    let area = width * height
    return area
}

//省略外部参数名
print("320x480的长方形的面积:\(rectangleArea2(W: 320, H:480))")

func rectangleArea3(width:Double, _ height:Double) -> Double {
    let area = width * height
    return area
}

print("W x H的长方形的面积:\(rectangleArea3(320, 480))")

//参数默认值
func makecoffee(type : String = "卡布奇诺") -> String {
    return "制作一杯\(type)咖啡。"
}

let coffee1 = makecoffee("拿铁")
let coffee2 = makecoffee()

print("\(coffee1)")
print("\(coffee2)")

//可变参数
func sum(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total
}

sum(100.0, 20, 30)

sum(30, 80)


//参数的传递引用
func increment(inout value: Double, amount: Double = 1.0) {
    //省略
    value += amount
}

var value: Double = 10.0

increment(&value)
print(value)

increment(&value, amount: 100.0)
print(value)


//多返回值函数

func position(dt: Double, speed: (x:Int, y:Int)) -> (x:Int, y:Int) {
    
    let posx: Int = speed.x * Int(dt)
    let posy: Int = speed.y * Int(dt)
    
    return (posx, posy)
    
}

let move = position(60.0, speed: (10, -5))
print("物体位移：\(move.x) , \(move.y)")


//作为函数返回类型使用
//定义计算长方形面积函数
func rectangleArea11(width: Double, height: Double) -> Double {
    let area = width * height
    return area
}

//定义计算三角形面积函数
func triangleArea11(bottom: Double, height: Double) -> Double {
    let area = 0.5 * bottom * height
    return area
}


func getArea(type: String) -> (Double, Double) -> Double {
    
    var returnFunction: (Double, Double) -> Double
    
    switch (type) {
    case "rect":   //rect 表示长方形
        returnFunction = rectangleArea11
    case "tria":  //tria 表示三角形
        returnFunction = triangleArea11
    default:
        returnFunction = rectangleArea11
    }
    
    return returnFunction
}

//获得计算三角形面积函数
var area: (Double, Double) -> Double = getArea("tria")
print("底10 高13，三角形面积：\(area(10, 15))")

//获得计算长方形面积函数
area = getArea("rect")
print("宽10 高15，计算长方形面积：\(area(10, 15))")

//作为参数类型使用
//定义计算长方形面积函数
func rectangleArea22(width: Double, height: Double) -> Double {
    let area = width * height
    return area
}

//定义计算三角形面积函数
func triangleArea22(bottom: Double, height: Double) -> Double {
    let area = 0.5 * bottom * height
    return area
}

func getAreaByFunc(funcName: (Double, Double) -> Double, a: Double, b: Double) -> Double {
    let area = funcName(a, b)
    return area
}

//获得计算三角形面积函数
var result: Double = getAreaByFunc(triangleArea22, a: 10, b: 15)
print("底10 高15，三角形面积：\(result)")

//获得计算长方形面积函数
result = getAreaByFunc(rectangleArea22, a: 10, b: 15)
print("宽10 高15，计算长方形面积：\(result)")


//函数类型
//定义计算长方形面积函数
func rectangleArea33(width: Double, height: Double) -> Double {
    let area = width * height
    return area
}

//定义计算三角形面积函数
func triangleArea33(bottom: Double, height: Double) -> Double {
    let area = 0.5 * bottom * height
    return area
}

func sayHello() {
    print("Hello, World")
}

//嵌套函数
func calculate(opr: String) -> (Int, Int) -> Int {
    
    //定义+函数
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    //定义-函数
    func sub(a: Int, b: Int) -> Int {
        return a - b
    }
    
    var result: (Int, Int) -> Int
    
    switch (opr) {
    case "+":
        result = add
    case "-":
        result = sub
    default:
        result = add
    }
    return result
}

let f1: (Int, Int) -> Int = calculate("+")
print("10 + 5 = \(f1(10, 5))")

let f2: (Int, Int) -> Int = calculate("-")
print("10 - 5 = \(f2(10, 5))")
