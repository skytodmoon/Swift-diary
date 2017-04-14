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


//使用尾随闭包

func calculate33(opr: String, funN: (Int, Int) -> Int) {
    
    switch (opr) {
    case "+":
        print("10 + 5 = \(funN(10, 5))")
    default:
        print("10 - 5 = \(funN(10, 5))")
    }
}

calculate33("+", funN: { (a: Int, b: Int) -> Int in return a + b })
calculate33("+") {
    (a: Int, b: Int) -> Int in return a + b
}
calculate33("+") {
    $0 + $1
}

calculate33("-") {
    (a: Int, b: Int) -> Int in
    return a - b
}

calculate33("-") {
    $0 - $1
}

//捕获上下文中变量和常量
// 嵌套函数实现
func makeArray() -> (String)->[String] {
    
    var ary:[String] = [String]()
    
    func addElement(element:String) -> [String] {
        ary.append(element)
        return ary
    }
    
    return addElement
}

// 闭包实现
func makeArray2() -> (String)->[String] {

    var ary:[String] = [String]()

    return  { (element:String) -> [String] in
        ary.append(element)
        return ary
    }
}


let f11 = makeArray()
print("---f11---")
print(f11("张三"))
print(f11("李四"))
print(f11("王五"))

print("---f22---")
let f22 = makeArray()
print(f22("刘备"))
print(f22("关羽"))
print(f22("张飞"))














