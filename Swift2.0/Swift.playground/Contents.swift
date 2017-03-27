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


//逻辑运算符


var i = 0
var a13 = 10
var b13 = 9

if(a13>b13) || (i++ == 1){
    print("或运算为 真")
}else{
    print("或运算为 假")
}
print("i = \(i)")

i = 0;

if(a13<b13) || (i++ == 1){
    print("或运算为 真")
}else{
    print("或运算为 假")
}
print("i = \(i)")


//位运算符号


let a14: UInt8 = 0b10110010
let b14: UInt8 = 0b01011110

print("a14 | b14 = \(a14 | b14)")
print("a14 & b14 = \(a14 & b14)")
print("a14 ^ b14 = \(a14 ^ b14)")
print("~a14 =\(~a14)")

print("a14 >>2 = \(a14 >> 2)")
print("a14 <<2 = \(a14 << 2)")

let c: Int8 = -0b1100

print("c >> 2 = \(c >> 2)")
print("c << 2 = \(c << 2)")


let score: UInt8 = 80
let result = score > 60 ? "及格" : "不及格"
print(result)

var  arr = [93,5,3,55,57]
print(arr[2])

var airports = ["TYO": "Tokyo", "DUB": "Dublin"]

//Swift原始数据类型
//整型
print("UInt8 range: \(UInt8.min) ~ \(UInt8.max)")

print("Int8 range: \(Int8.min) ~ \(Int8.max)")

print("UInt range: \(UInt.min) ~ \(UInt.max)")

print("UInt64 range: \(UInt64.min) ~ \(UInt64.max)")

print("Int64 range: \(Int64.min) ~ \(Int64.max)")

print("Int range: \(Int.min) ~ \(Int.max)")


//浮点型

var myMoney: Float = 300.5
var yourMoney: Double = 360.5
let pi = 3.14159

//进值数字表示

let decimalInt = 28
let bingaryInt = 0b11100
let octalInt = 0o34
let hexadecimalInt = 0x1C


//整型之间的转换

let hisstoryScore: UInt8 = 90

let englishScore: UInt16 = 130

//这句代码是错误的
//let totalScore  = hisstoryScore + englishScore
//
//
//let totalScore  = UInt16(hisstoryScore) + englishScore
//
//
//let totalScore  = hisstoryScore + UInt8(englishScore)

//整型浮点型之间的转换

let historyScore2: Float = 90.6

let englishScore2: UInt16 = 130

//这句代码是错误的
//let totalScore  = historyScore + englishScore
//
//
//let totalScore  = historyScore + Float(englishScore)
//
//
//let totalScore  = UInt16(historyScore) + englishScore

//元组类型

//第一种写法
("1001", "张三",30,90)
//第二种写法
(id: "1001", name:"张三", english_score: 30, chinese_score:90)


var student1 = ("10001","张三", 30, 90)
print("学生: \(student1.1) 学号: \(student1.0) 语文成绩: \(student1.2) 语文成绩: \(student1.3)")

var student2 = (id: "1002", name:"李四", english_score: 32, chinese_score:80)
print("学生: \(student2.1) 学号: \(student2.0) 语文成绩: \(student2.2) 语文成绩: \(student2.3)")

let (id1, name3, age1,score1) = student1

print("学生: \(name3) 学号: \(id1) 语文成绩: \(age1) 语文成绩: \(score1)")

let (id2,name4,_,_) = student2

print("学生: \(name4) 学号:\(id2)")


//可选类型的概念

var n1: Int? = 10
n1 = nil
let str2: String! = nil

//可选类型值的拆包

var n3: Int? = 10
print(n3)

/// 因此，对可选类型值进行拆包是必要的，拆包分为显示拆包和隐形拆包，使用问号声明的可选类型拆包时需要使用感叹号，这种拆包成为显式拆包；使用感叹号声明的可选类型字拆包时可以不适用感叹号，这种表示成为隐拆包*

var n4: Int? = 10
print(n4! + 100)

var n5: Int! = 100
print(n5 + 100)

//可选绑定


func divide(n1: Int, n2: Int) ->Double? {
    if n2 == 0 {
        return nil
    }
    return Double(n1)/Double(n2)
    
}
let result1: Double? = divide(100, n2: 200)


if let result = divide(100, n2: 0) {
    print(result)
    print("Sucess.")
}else{
    //    编译错误
    //    print(result)
    print("fail")
}

/**
 *  这种可选类型在if或者whiel语句中赋值并进行判断写法成为可选绑定，可选绑定过程中做了两件事情：首先判断表达式是否为空值nil；如果为非空值则将可选类型拆包，并赋值给一个常量。常量的作用域是if或者while语句true的分支
 */

//Swift原生字符串


let andSign1: Character = "&"
let andSign2: Character = "\u{26}"

let lamda1: Character = "@"
let lamda2: Character = "\u{03bb}"

let simle1: Character = "😀"
let simle2: Character = "\u{0001f603}"

//转义符

let specialCharTab1 = "Hello\tWrold"
print("specialCharTab1:\(specialCharTab1)")

let specialCharNewLine = "Hello\nWrold"
print("specialCharNewLine:\(specialCharNewLine)")


let specialCharReturn = "Hello\rWrold."
print("specialCharReturn:\(specialCharReturn)")


let specialCharWQuotationMark = "Hello\"Wrold\"."
print("specialCharWQuotationMark:\(specialCharWQuotationMark)")

let specialCharAppStore = "Hello\'Wrold\'."
print("specialCharAppStore:\(specialCharAppStore)")

let specialCharFeverseSolidus = "Hello\\Wrold."
print("specialCharFeverseSolidus:\(specialCharFeverseSolidus)")



//创建字符串

let 🐶 = "🐗🐗🐗🐗🐗🐗🐗🐗"

print("已经上船的小动物数: \(🐶.characters.count)")

let 狗 = "🐶"
let 熊 = "🐼"

let 🐼 = 熊 + 狗

let emptyString1  = ""
let emptyString2  = String()


//字符串拼接

var 🐶1 = "🐴🐗🐱🐗🐗🐗🐗"

🐶1 = 🐶1 + "🐴"
🐶1 += "🐱"

var flower: Character = "🐗"

🐶1.append(flower)
print("诺亚方舟乘客: \(🐶1.characters.count)")

let number = 9

//字符串插入，删除和替换

var str3 = "obejctive-c and swift"
print("原始字符串:\(str3)")

//插入字符
str3.insert(".", atIndex: str3.endIndex)
print("插入.字符后: \(str3)")

str3.removeAtIndex(str3.endIndex.predecessor())
print("删除.字符后: \(str3)")

var startIndex = str3.startIndex
var endIndex = startIndex.advancedBy(9)
var range = startIndex...endIndex
//删除范围
str3.removeRange(range)
print("删除范围后: \(str3)")

startIndex = str.startIndex
endIndex = startIndex.advancedBy(0)
range = startIndex...endIndex
//替换范围
str3.replaceRange(range,with: "C++")
print("替换范围后: \(str3)")


//字符串比较

let 狗2 = "🐶2"
let 猫2 = "🐱2"
if 狗2 > 猫2 {
    print("🐶2 >🐱2")
}else{
    print("🐶2 <🐱2")
}


/**
 *  这只是动物之间的相互比较大小是没有任何的实际意思，但是比较A ,B ，C有意思
 *  除了比较大小，我们需要比较字符串是否相等
 */

//前缀和后缀比较


let docFolder = ["java.docx","javaBean.docx","oc.docx","swift.docx"]

var wordDocCount = 0
for doc in docFolder {
    if doc.hasSuffix(".docx"){
        wordDocCount += 1
    }
}
print("文件夹world文档是: \(wordDocCount)")

var javaDocCount = 0
for doc in docFolder {
    let lowecaseDoc = doc.lowercaseString
    if lowecaseDoc.hasSuffix("java"){
        javaDocCount += 1
    }
    
}
print("文件夹world文档是: \(javaDocCount)")













