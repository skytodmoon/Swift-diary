//: Playground - noun: a place where people can play

import UIKit

//我的第一个Swift程序
var myString = "Hello,World!"
print(myString)

//编码规范推荐使用方法
let a = 1 + 2
let b = 3+4

//整型字面量
42
//浮点型字面量
3.14159
//字符串型字面量
"Hello, World"
//布尔型字面量
true

//类型别名
typealias Feet = Int
var distance: Feet = 100
print(distance)

//类型判断

//varA 会被推测为Int类型
var varA = 42
print(varA)

//varB 会被推测为Double类型
var varB = 3.14159
print(varB)

//varV 会被推测为Double类型
var varC = 3 + 0.14159
print(varC)


//变量的命名
var  _var = "Hello,Swift!"
print(_var)

var 你好 = "你好世界"
var W3Cschool教程 = "www.ctolib.com"
print(你好)
print(W3Cschool教程)

//变量输出
var name = "W3Cschool教程"
var site = "http://www.ctolib.com"
print("\(name)的官网地址为:\(site)")


//Swift可选(Optional)类型
var MyString: String? = nil
if MyString != nil {
    print(MyString as Any)
}else{
    print("字符串为nil")
}

//强制解析
var myString1: String?
myString1 = "Hello,Swift!"
//强制解析
if myString1 != nil {
    print(myString1!)
}else{
    print("myString1值为nil")
}

//自动解析
var myString2: String!
myString2 = "Hello,Swift!"
if myString2 != nil {
    print(myString2)
}else{
    print("myString2 值为nil")
}

//可选绑定
var myString3: String?
myString3 = "Hello,Swift"
if let yourString = myString3 {
    print("你的字符串值为 -\(yourString)")
}else{
    print("你的字符串没有值")
}

//常量声明
let ConstA1 = 42
print(ConstA1)

//类型标注
let ConstA2 = 44
print(ConstA2)

let constB1: Float = 3.14159
print(constB1)

//常量命名
let _const = "Hello,Swift!"
print(_const)

let 你好啊 = "你好世界"
print(你好啊)

//整数字面量
//十进制表示
let decimalInterger = 17
//二进制表示
let binaryInterger = 0b1001
//八进制表示
let octalInterger = 0o21
//十六进制表示
let hexadecimalInterger = 0o11

//字符串型字面量
let stringL = "Hello\tWorld\n\nW3Cschool教程官网：\'http://www.ctolib.com\'"
print(stringL)

//算术运算符
var A = 10
var B = 20
print("A + B 结果为：\(A + B)")
print("A - B 结果为：\(A - B)")
print("A * B 结果为：\(A * B)")
print("B / A 结果为：\(B / A)")
print("A++ 后 A 的值为 \(A)")
print("B-- 后 B 的值为 \(B)")

//比较运算符
