//: Playground - noun: a place where people can play

import UIKit

//闭包表达式
func calculate(opr: String) -> (Int, Int) -> Int {
    
    var result: (Int, Int) -> Int
    
    switch (opr) {
    case "+":
        result = {
            (a: Int, b: Int) -> Int in
            return a + b
        }
    default:
        result = {
            (a: Int, b: Int) -> Int in
            return a - b
        }
    }
    return result
}

let f1: (Int, Int) -> Int = calculate("+")
print("10 + 5 = \(f1(10, 5))")

let f2: (Int, Int) -> Int = calculate("-")
print("10 - 5 = \(f2(10, 5))")


//类型推断简化
func calculate2(opr: String) -> (Int, Int) -> Int {
    
    var result: (Int, Int) -> Int
    
    switch (opr) {
    case "+":
        result = {
            (a, b) in return a + b
        }
    default:
        result = {
            a, b in return a - b
        }
    }
    return result
}

let f3: (Int, Int) -> Int = calculate2("+")
print("10 + 5 = \(f3(10, 5))")

let f4: (Int, Int) -> Int = calculate2("-")
print("10 - 5 = \(f4(10, 5))")

//隐藏return关键字
func calculate3(opr: String) -> (Int, Int) -> Int {
    var result: (Int, Int) -> Int
    
    switch (opr) {
    case "+":
        result = {
            a, b in a + b
        }
    default:
        result = {
            a, b in a - b
        }
    }
    return result
}

let f5: (Int, Int) -> Int = calculate3("+")
print("10 + 5 = \(f5(10, 5))")

let f6: (Int, Int) -> Int = calculate3("-")
print("10 - 5 = \(f6(10, 5))")

//隐藏参数名
func calculate4(opr: String) -> (Int, Int) -> Int {
    
    var result: (Int, Int) -> Int
    
    switch (opr) {
    case "+":
        result = {
            $0 + $1
        }
    default:
        result = {
            $0 - $1
        }
    }
    return result;
}

let f7: (Int, Int) -> Int = calculate4("+")
print("10 + 5 = \(f7(10, 5))")

let f8: (Int, Int) -> Int = calculate4("-")
print("10 - 5 = \(f8(10, 5))")


//使用闭包返回值
let c1: Int = { (a: Int, b: Int) -> Int in
    return a + b
}(10, 5)

print("10 + 5 = \(c1)")

let c2: Int = { (a: Int, b: Int) -> Int in
    return a - b
}(10, 5)

print("10 - 5 = \(c2)")




















