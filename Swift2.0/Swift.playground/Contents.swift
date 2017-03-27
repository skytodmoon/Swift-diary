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


//控制语句

//- 分支语句：if switch guard
//- 循环语句：while repeat-while for for-in
//- 跳转语句: break continue fallthrough return throw

//if语句

var score3 = 95

if score3 >= 85 {
    print("你真优秀")
}

if score3 < 60 {
    print("你需要努力加倍学习")
}

if score3 >= 60 && score3 < 85 {
    print("你的成绩还可以，任需要继续加油")
}

/**
 *  if 条件语句表达式{
 语句组1
 }else{
 语句组2
 }
 */

//else-if 语句

let testscore = 76
var grade3: Character

if testscore >= 90 {
    grade3 = "A"
}else if testscore >= 80 {
    grade3 = "B"
}else if testscore >= 70 {
    grade3 = "C"
}else if testscore >= 60 {
    grade3 = "D"
}else{
    grade3 = "F"
}
print("Grade = \(grade3)")

//swith语句

let testscore3 = 86
var grade4: Character

switch testscore3 / 10 {
case 9:
    grade4 = "优"
case 8:
    grade4 = "良"
case 7,6:
    grade4 = "中"
default:
    grade4 = "差"
}
print("Grade = \(grade4)")


let value = 1.000
var desc: String

switch value {
case 0.0:
    desc = "最小值"
case 0.5:
    desc = "中值"
case 1.0:
    desc = "最大值"
default:
    desc = "其他值"
}
print("说明 = \(desc)")


let level2 = "优"
var desc2: String

switch level2 {
case "优":
    desc2 = "90分以上"
case "良":
    desc2 = "80分~90分"
case "中":
    desc2 = "70分~80分"
case "差":
    desc2 = "低于60分"
default:
    desc2 = "无法判断"
}
print("说明 = \(desc2)")

//guard语句

/**
 *  定义一个Blog结构体
 */

struct Blog {
    
    let name11: String?
    let URL11: String?
    let Author11: String?
}

func isLongStyleBlog(blog: Blog) {
    
    if let blogName = blog.name11 {
        print("这篇博客名: \(blogName)")
        
        if let blogAuthor = blog.Author11 {
            print("这篇博客名由\(blogAuthor)写的")
            
            if let blogURL = blog.Author11 {
                print("这篇博客名: \(blogURL)")
            }else {
                print("这篇博客没有网址!")
            }
            
        }else{
            print("这篇博客没有作者")
        }
        
    }else{
        print("这篇博客没有名字")
    }
}

func guardLongStyleBlog(blog: Blog) {
    
    guard let blogName = blog.name11 else {
        print("这篇博客没有名字!")
        return
    }
    print("这篇博客名：\(blogName)")
    
    guard let blogAuthor = blog.Author11 else {
        print("这篇博客没有作者!")
        return
    }
    
    print("这篇博客由：\(blogAuthor)写的")
    
    guard let blogURL = blog.URL11 else {
        print("这篇博客没有网址!")
        return
    }
    
    print("这篇博客网址：\(blogURL)")
    
}


//循环语句var i: Int64 = 0

while i * i < 100_000 {
    i += 1
}

print("i = \(i)")
print("i = \(i * i)")

//repea-while语句

var i1: Int64 = 0

repeat {
    i1 += 1
}while i1 * i1 < 100_100

print("i = \(i1)")
print("i * i = \(i1 * i1)")



//for语句

print("n  n*n")
print("_____________")

for i12 in 1 ..< 10 {
    print("\(i12) x \(i12) = \(i12 * i12)")
}

var x13: Int32
var y13: Int32

for x13 = 0, y13 = 10; x13 < y13; x13++, y13-- {
    print("(x13,y13) = (\(x13), \(y13))")
}


//for-in语句

let numbers = [1,2,3,4,5,6,7,8,9,10]

print("------for------")

for i14 in 0 ..< numbers.count {
    print("Count is: \(i14)")
}

/**
 *  采用for-in循环语句遍历
 */

let numbers3 = [1,2,3,4,5,6,7,8,9,10]

print("------for------")

for item in numbers3 {
    print("Count is: \(item)")
}


/**
 *  items是循环变量，item之前使用var声明，它采用的是隐藏变量声明，in后面是集合实例，for-in循环语句将后面集合中的元素一一取出来，保存在item语句遍历集合的时候要简单方便很多，在for-in语句中如果需要循环变量，可以使用eumerate方法
 */

//假设有一个数组，原来遍历数组的方式

let numbers4 = [1,2,3,4,5,6,7,8,9,10]


for (index, element) in numbers4.enumerate() {
    print("Item \(index): \(element)")
}


//break语句

label1: for x in 0 ..< 5 {
    label2: for var y = 5; y > 0; y -= 1 {
        if y == x {
            break label1
        }
        print("(x,y) = (\(x),\(y)")
    }
}


//continue语句

//带有标签的continue语句示例
label1: for x in 0 ..< 5 {
    label2: for var y = 5; y > 0; y -= 1 {
        if y == x {
            continue label1
        }
        print("(x,y) = (\(x),\(y)")
    }
}

print("Gamer Over")


//fallthrough语句

var j = 1
var x15 = 4


switch x15 {
case 1:
    j += 1
case 2:
    j += 1
case 3:
    j += 1
case 4:
    j += 1
case 5:
    j += 1
default:
    j += 1
}
print("j = \(j)")


var j12 = 1
var x18 = 4

switch x18 {
case 1:
    j12 += 1
case 2:
    j12 += 1
case 3:
    j12 += 1
case 4:
    j12 += 1
    fallthrough
case 5:
    j12 += 1
    fallthrough
default:
    j12 += 1
}
print("j12 = \(j12)")

//swich中使用区间运算符

let testScore = 80

var grade: Character

switch testScore {
case 90...100:
    grade = "优"
case 80..<90:
    grade = "良"
case 60..<80:
    grade = "中"
case 0..<60:
    grade = "差"
default:
    grade = "无"
}

print("Grade = \(grade)")

var  student = (id: "10002", name: "李四", age: 32, ChineseScore: 80, EnglishScore: 89)
var  deac: String

switch student {
case (_,_,_, 90...100, 90...100):
    deac = "优"
case (_,_,_, 80..<90, 80..<90):
    deac = "良"
case (_,_,_, 60..<80, 60..<80):
    deac = "中"
case (_,_,_, 60..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "偏科"
case (_,_,_, 0..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac = "严重偏科"
default:
    deac = "无"
}

print("说明: \(deac)")



//for-in中使用区间运算符

let numbers11 = [1,2,3,4,5,6,7,8,9,10]

let count11 = numbers11.count
print("----半个开区间-----")


print("----闭区间-----")

for i in 0...5 {
    print("第\(i + 1)个元素: \(numbers11[i])")
}

//if中的值绑定


//定义一个Blog(博客)结构体
struct Blog2 {
    let name8: String?
    let URL8: String?
    let Author8: String?
}

func isStyleBlog(blog: Blog2) {
    
    if let blogName = blog.name8,
        let _ = blog.URL8,
        let _ = blog.Author8 {
        print("这篇博客名: \(blogName)")
        print("这篇博客名: \(blogName)")
        print("这篇博客名: \(blogName)")
    } else {
        print("这篇博客信息不完整")
    }
}

let blog1 = Blog(name11: nil, URL11: "www.baidu.com", Author11: "Tom")
let blog2 = Blog(name11: "Tony", URL11: "www.baidu.com", Author11: "Tony")

print("--blog1--")


print("--blog2--")


//swith中的值绑定

var  student7 = (id: "10002", name: "李四", age: 32, ChineseScore: 90, EnglishScore: 91)
var  deac7: String

switch student7 {
case (_,_, let AGE,90...100, 90...100):
    if (AGE > 30) {
        deac7 = "老优"
    }else{
        deac7 = "小优"
    }
    
case (_,_,_, 80..<90, 80..<90):
    deac7 = "良"
case (_,_,_, 60..<80, 60..<80):
    deac7 = "中"
case (_,_,_, 60..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac7 = "偏科"
case (_,_,_, 0..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac7 = "严重偏科"
default:
    deac7 = "无"
}

print("说明: \(deac7)")


//switch中使用where语句


var  student9 = (id: "10002", name: "李四", age: 32, ChineseScore: 90, EnglishScore: 91)
var  deac9: String

switch student9 {
case (_,_, let age,90...100, 90...100):
    deac9 = "优"
case (_,_,_, 80..<90, 80..<90):
    deac9 = "良"
case (_,_,_, 60..<80, 60..<80):
    deac9 = "中"
case (_,_,_, 60..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac9 = "偏科"
case (_,_,_, 0..<80, 90...100),(_,_,_, 90...100, 60..<80):
    deac9 = "严重偏科"
default:
    deac9 = "无"
}

print("说明: \(deac9)")


//for-in中使用where语句

let numbers18 = [1,2,3,4,5,6,7,8,9,10]

print("----for-in-----")

for item in numbers18 where item > 5 {
    print("Count is: \(item)")
}
















