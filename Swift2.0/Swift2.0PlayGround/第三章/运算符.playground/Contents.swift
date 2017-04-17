//: Playground - noun: a place where people can play

import UIKit

//一元算数运算符

var a = 12
print(-a)

var b = a++
print(b)

b = ++a
print(b)

//二元算数运算符

//声明一个整型变量
var intResult = 1 + 2
print(intResult)

intResult = intResult - 1
print(intResult)

intResult = intResult * 2
print(intResult)

intResult = intResult / 2
print(intResult)

intResult = intResult + 8
intResult = intResult % 7
print(intResult)

print("-------")
//声明一个浮点型变量
var doubleResult = 10.0
print(doubleResult)

doubleResult = doubleResult - 1
print(doubleResult)

doubleResult = doubleResult * 2
print(doubleResult)

doubleResult = doubleResult / 2
print(doubleResult)

doubleResult = doubleResult + 8
doubleResult = doubleResult % 7
print(doubleResult)


//算术赋值运算符
var a1 = 1
var b1 = 2
a1 += b1 			// 相当于 a = a + b
print(a)

a1 += b1 + 3 		// 相当于 a = a + b + 3
print(a1)
a1 -= b1 			// 相当于 a = a - b
print(a1)

a1 *= b1			// 相当于 a=a*b
print(a1)

a1 /= b1			// 相当于 a=a/b
print(a1)

a1 %= b1			// 相当于 a=a%b
print(a1)

//关系运算符
var value1 = 1
var value2 = 2
if value1 == value2 {
    print("value1 == value2")
}

if value1 != value2 {
    print("value1 != value2")
}

if value1 > value2 {
    print("value1 > value2")
}

if value1 < value2 {
    print("value1 < value2")
}

if value1 <= value2 {
    print("value1 <= value2")
}

let name1 = "world"
let name2 = "world"
if name1 == name2 {
    print("name1 == name2")
}

let a2 = [1,2]     //数组类型常量
let a3 = [1,2]     //数组类型常量

if a2 == a3 {
    print("a2 == a3")
}

//if a1 === a2 {     //编译错误
//    print("a1 === a2")
//}


//逻辑运算符
var i = 0
var a4 = 10
var b2 = 9

if (a4 > b2) || (i++ == 1) {
    print("或运算为 真")
} else {
    print("或运算为 假")
}

print("i = \(i)")

i = 0

if (a4 < b2) && (i++ == 1) {
    print("与运算为 真")
} else {
    print("与运算为 假")
}

print("i = \(i)")

//位运算符
let a5: UInt8 = 0b10110010
let b5: UInt8 = 0b01011110

print("a5 | b5 = \(a5 | b5)") //11111110
print("a5 & b5 = \(a5 & b5)") //00010010
print("a5 ^ b5 = \(a5 ^ b5)") //11101100
print("~a5 = \(~a5)")       //01001101

print("a5 >> 2 = \(a5 >> 2)")   //00101100
print("a5 << 2 = \(a5 << 2)")   //11001000

let c5:Int8 = -0b1100

print("c5 >> 2 = \(c5 >> 2)")   //-00000011
print("c5 << 2 = \(c5 << 2)")   //-00110000

//其它运算符
let score: UInt8 = 80
let result = score > 60 ? "及格" : "不及格"
print(result)

var arr = [93, 5, 3, 55, 57]    //使用逗号运算符(,)
print(arr[2])                 //下标运算符[]

var airports = ["TYO": "Tokyo", "DUB": "Dublin"] //使用冒号运算符(:)

