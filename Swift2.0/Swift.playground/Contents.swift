//: Playground - noun: a place where people can play

import UIKit

/**
 *  Swift2.2每日基础笔记
 */

//标识符

var _hello = "你好"

let 你好 = "你好世界"

//这里一定要使用关键字的话，就必须加上``符号
let `class` = "xxx"

var str = "Hello, playground"

print (str)

print("你好")

//关键字

/**
 *  Class deinit enum extension func import init inout
 
 internal operator private public let protocol
 
 static struct subscript var typealias
 */

//语句有关的关键字

/**
 *  break case continue default repeat else fallthroug if
 
 in for defer guard do return switch where while
 
 表达式和类型关键字: associativty, convenience dynamic didset final get
 
 infix lazy left mutating none nonmutating optional override
 
 postfix precedence prefix protocol  required right set type
 
 unowned weak willset
 */

//常量

let _Hello = "hello"

_hello = "Hello world"

var x = 10,  y = 30

var x1 = 10, y1 = true

class Person {
    
    var name: String
    
    var age: Int
    
    init (name: String, age: Int) {
        
        self.name = name
        
        self.age = age
    }
}
//实例化这个类，因为p1是该实例的引用，因此声明let，所以不能改变p1引用，但可以改变实例化的内容

let p1 = Person(name: "jack",age: 18)
//改变实例内容（改变它的age属性）
p1.age = 20

//表达式

var  a1 = 10
var  a2 = 20
var a = a1 > a2 ? "a1" : "a2 "


var a4: Int = 10
let a5: Int = 20
var a6 = a4 > a5 ? "a4" : "a5"

//运算符

var a7 = 12
print(-a7)

var b7 = a7++
print(b7)

b7 = ++a7
print(b7)

//结果-12 12 14

//二元运算符

//声明一个类型变量
var inResult = 1 + 2
print(inResult)

inResult = inResult * 2
print(inResult)

inResult = inResult - 1
print(inResult)

inResult = inResult / 2
print(inResult)

inResult = inResult + 8
inResult = inResult % 7
print(inResult)

print("-----------")

//声明一个浮点类型变量

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

//算法赋值运算符

var a10 = 1
var b10 = 2
a10 += b10
print(a10)

a10 += b10 + 3
print(a10)
a10 -= b10
print(a10)

a10 *= b10
print(a10)

a10 *= b10
print(b10)

a10 /= b10
print(a10)

a10 %= b10
print(a10)

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

let a12 = [1,2]
let a21 = [1,2]

if a12 == a21 {
    print("a11 == a21")
}

//有错误
//if a12 === a21 {
//    print("a11 === a21")
//}





