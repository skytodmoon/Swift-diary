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
