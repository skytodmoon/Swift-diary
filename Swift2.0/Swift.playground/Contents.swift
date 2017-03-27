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


//guard中使用where语句

//定义一个Blog(博客)结构体
struct Blog8 {
    let name8: String?
    let URL8: String?
    var Author8: String?
}

func guardStyleBlog(blog8: Blog8) {
    
    guard let blogName = blog8.name8
        where blog8.Author8 == "Tony" && blogName == "Tony Blog" else {
            
            print("这篇博客信息名字")
            return
    }
    print("这篇博客名: \(blogName)")
    
}
//Swift中的数组集合

//数组声明和初始话

/**
 *  Swift数组类型是Array，Array是结构类型，是一个一个维泛型的集合
 *  Foundation框架也有数组类型，NSArray。NSarray是一个类，而并非Array结构体，因此提到数组时，应该明确Swift中的Array数组，还是Foundation框架中的NSArray数组，它们之间可以通过，相互转化。
 * 在声明一个Array类的时候可以使用下面语句
 * var studentList1: Array<String>`
 * var studentList2: [String]`
 * 其中studnetList1明确指定类型为Array<String>,<String>是泛型，说明这个数组中只能存放字符串类型的数据，studnetList2变量也是一个只能存放字符串的数组。[stirng]和array<Stirng>是等价的[String]是简化写法
 * 上面声明的Array还不能运行，还需要初始话；array类型往往在声明的同时初始化，
 */

var studentList1: Array<String> = ["张三","李四","王五","童六"]

var studentList2: [String] = ["张三","李四","王五","童六"]

var studentList3: [String] = ["张三","李四","王五","童六"]

var studentList4: [String];

//可变数组

var studentList: Array<String> = ["张三","李四","王五"]

print(studentList)

studentList.append("童六")
print(studentList)

studentList += ["刘备","关羽"]
print(studentList)

studentList.insert("张飞", atIndex: studentList.count)
print(studentList)

let removeStudent = studentList.removeAtIndex(0)
print(studentList)

studentList[0] = "诸葛亮"
print(studentList)


var studentList13: [String] = ["张三","李四","王五"]

for item in studentList13 {
    
    print(item)
}
for (index, value) in studentList13.enumerate(){
    print("Item \(index + 1) : \(value)")
}

//字典声明和初始化

var studentDictionary1: Dictionary<Int, String> = [102:"李四",105:"王五",109:"李四"]

var studentDictionary2 = [102 : "李四",105 : "王五",109 : "李四"]

var studentDictionary3 = [102 : "李四",105 : "王五",109 : "李四"]

var studentDictionary4 = Dictionary<Int,String>()
var studentDictionary5 = [Int: String]()

//可变字典

/**
 *  不可变字典和可变字典的关系类似于不可变数组和可变数组之间的关系，var声明的字典是可变字典，如果初始化之后不再修改字典，应该将字典声明为let，即不变的字典
  字典元素的删除方法有两种，一种是给一个键赋值nil，这样可以删除元素，一种是通过字典removeValueForkey方法删除元素，方法返回值是要删除的值
 字典元素替换也有两种，一种是直接给一个存在的赋值，这样新值就会替换旧值，另一种方法通过updateValue方法替换
 */


var studentDictionary: Dictionary<Int, String> = [102:"李四",105:"王五",109:"李四"]

studentDictionary[110] = "懂六"

print("班级人数: \(studentDictionary.count)")

let dismissStudent = studentDictionary.removeValueForKey(102)

print("开除的学生 \(dismissStudent!)")

studentDictionary[105] = nil

studentDictionary[109] = "张三"

let replaceStudent = studentDictionary.updateValue("李四", forKey: 110)

print("被替换的学生是: \(replaceStudent)")

//字典遍历

var studentDictionary12 = [102 : "李四",105 : "王五",109 : "李四"]

print("----遍历键---")
for studentID in studentDictionary12.keys {
    print("学号: \(studentID)")
}

print("----遍历键---")
for studentName in studentDictionary12.values {
    print("学号: \(studentName)")
}


print("----遍历键---")
for (studentID,studentName) in studentDictionary12 {
    print("\(studentID): \(studentName)")
}


//Set集合

/**
 *  如果数组比较，数组中的元素是有序的，可以重复出现，可以重复出现，而Set是无序的，不能重复的元素。数组强调的是有序的，Set强调是不重复的*
 *  Set类型是set，set是一个结构体类型，也是一个一维泛型集合*
 *  NSSet是一个类，而结构体，因此Set应该明确是set，它们之间可以通过相互转化*
 */


let studentList11: Set<String> = ["张三","王五","李四"]
var studentList21 = Set<String>()

var studentList31 = ["张三","王五","李四","懂六"]
var studentList41: [String] = ["张三","王五","李四","懂六"]

let studentList51: Set<String> = ["张三","王五","李四"]

if studentList11 == studentList51 {
    print("studentList11等于studentList51")
}else{
    print("studentList11不等于studentList51")
}

if studentList31 == studentList41 {
    print("studentList31等于studentList41")
}else{
    print("studentList31不等于studentList41")
}

//可变Set集合


var studentList16: Set<String> = ["张三","王五","李四"]
print(studentList16)

let removeStudent16 = studentList16.removeFirst()
print(studentList16)
print(removeStudent16)

studentList16.insert("懂六")
print(studentList16)

let student16 = "张三"
studentList16.remove(student16)
print(studentList16)

if !studentList16.contains(student16){
    print("删除学生: \(student16)成功")
}else{
    print("删除学生: \(studentList16.count)")
}

//Set集合运算

let A: Set<String> = ["a","b","c","d"]
let B: Set<String> = ["d","c","e","f"]

print("A和B交集 = \(A.intersect(B))")
print("A和B交集 = \(A.union(B))")
print("A和B异交集 = \(A.exclusiveOr(B))")

let C = A.subtract(B)
print("A和B差集 =\(C)")

if C.isSubsetOf(A) {
    print("C是A的子集")
}


//使用函数
/**
 在定义一个函数关键字就是`func`,函数名需要符合标识命名规范，多个参数列表之间可以用逗号隔开，在参数列表后面使用箭头指示返回值类型，返回值有单个值和多个值，多个值返回就可以使用元组类型实现，如果函数没有返回值，用`-> 返回类型`对应的，如果函数有返回值，我们需要在函数数体使用return语句计算值得返回，如果没有返回值，函数中可以省略return语句
 */

func rectangleArea(width:Double,height:Double) -> Double {
    let area = width * height
    
    return area
}

print("长方形的面积: \(rectangleArea(320, height: 480))")

//使用外部参数名

func rectangleArea3(width:Double,height:Double) -> Double {
    let area = width * height
    
    return area
}

print("长方形的面积: \(rectangleArea(320, height: 480))")


//修改函数名称就是外部参数

func rectangleArea4(W width:Double,H height:Double) -> Double {
    let area = width * height
    
    return area
}

print("长方形的面积: \(rectangleArea(320, height: 480))")


//参数的传递引用
func increment(inout value: Double, amout:Double = 1.0) {
    
    value += amout
    
}
var value12: Double = 10.0

increment(&value12)
print(value12)

increment(&value12, amout: 100.0)
print(value12)




//隐藏return关键字
func calculate(opr: String) -> (Int, Int) -> Int {
    
    var result : (Int, Int)-> Int
    
    switch (opr) {
    case "+":
        result = {(a, b) in a + b }
    default:
        result = {
            (a, b)  in  a - b}
    }
    return result
}

let f1:(Int, Int) -> Int = calculate("+")
print("\(f1(10 , 5))")



let f2:(Int, Int) -> Int = calculate("1")
print("\(f2(10 , 5))")


//省略参数名
func calculate3(opr: String) -> (Int, Int) -> Int {
    
    var result : (Int, Int)-> Int
    
    switch (opr) {
    case "+":
        result = {$0 + $1}
    default:
        result = {$0 - $1}
    }
    return result
}

let f11:(Int, Int) -> Int = calculate3("+")
print("\(f11(10 , 5))")


let f21:(Int, Int) -> Int = calculate3("1")
print("\(f21(10 , 5))")

//作为函数返回类型使用


//定义计算长方形面积的函数
func rectangleArea7(width: Double, height: Double) -> Double {
    
    let area  = width * height
    
    return area
}


//定义计算三角形面积的函数
func triangleArea8(bottom: Double, height: Double) -> Double {
    
    let area  = 0.5 * bottom * height
    
    return area
}

func getArea(type : String) -> (Double, Double) -> Double {
    
    var returnFunction:(Double, Double) -> Double
    
    switch (type) {
    case "rect":
        returnFunction = rectangleArea
    case "tria":
        returnFunction = rectangleArea
    default:
        returnFunction = rectangleArea
    }
    return returnFunction
}
//获得计算三角形面积的函数
var area : (Double, Double)-> Double = getArea("tria")
print("三角形的面积: \(area(10,15))")

//获取计算长方形面积的函数
area = getArea("rect")
print("长方形的面积: \(area(10,15))")


//嵌套函数

func calculate11(opr: String) -> (Int, Int) -> Int {
    //定义+函数
    func add(a: Int, b: Int) -> Int{
        return a + b
    }
    //定义-函数
    func sub(a: Int, b: Int) -> Int{
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

let f44:(Int, Int) -> Int = calculate11("+")
print("\(f1(10 , 5))")



let f33:(Int, Int) -> Int = calculate11("1")
print("\(f2(10 , 5))")



//使用比包返回值

let c1:Int = {(a: Int , b: Int) -> Int in
    return a + b
}(10,5)
print("10+5 =\(c1)")

let c2:Int = {(a: Int , b: Int) -> Int in
    return a - b
}(10,5)
print("10-5 =\(c2)")


//比包的概念


func calculate33(opr: String) -> (Int, Int) -> Int {
    
    var result : (Int, Int)-> Int
    
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

let f16:(Int, Int) -> Int = calculate33("+")
print("\(f1(10 , 5))")



let f15:(Int, Int) -> Int = calculate33("1")
print("\(f2(10 , 5))")

//类型推断简化
func calculate15(opr: String) -> (Int, Int) -> Int {
    
    var result : (Int, Int)-> Int
    
    switch (opr) {
    case "+":
        result = {(a, b) in return a + b }
    default:
        result = {
            (a, b)  in return a - b}
    }
    return result
}

let f12:(Int, Int) -> Int = calculate15("+")
print("\(f1(10 , 5))")



let f13:(Int, Int) -> Int = calculate15("1")
print("\(f2(10 , 5))")




//使用尾随比包

func calculate(opr: String, funN:(Int, Int) -> Int) {
    
    
    switch (opr) {
    case "+":
        print("10 + 5 = \(funN(10,5))")
    default:
        print("10 - 5 = \(funN(10,5))")
    }
    
}

calculate("+", funN: {(a: Int, b: Int) -> Int in return a + b})
calculate("+") {(a: Int, b: Int) -> Int in return a + b}
calculate("+") { $0 + $1 }

calculate("-"){
    (a: Int, b: Int) -> Int in
    return a - b
}

calculate("-"){
    $0 + $1
}


//捕获上下文的变量和常量

func makeArray() -> (String)-> [String] {
    
    var ary: [String] = [String]()
    
    func addElement(element: String) -> [String] {
        ary.append(element)
        return ary
    }
    return addElement
}


//Swift语言中的面向对象特征


/**
 *  *封装性: 封装就是尽可能隐藏对象的内部细节，对外形成一个边界，只保留对外接口和外部发生联系*
 *继承性：一些特殊类能够具有一般类的全部属性和方法，这称作为特殊类对一般类的继承。比如客轮和轮船，客轮就是特殊类，轮船就是一般类，通常我们称为父类，或称为子类*
 *多态性：对象的多态性是指父类中定义的属性或者方法被子类继承之后，可以使用同一个属性或者方法在父类以及各个子类中具有不同的含义，称为多台，比如动物有吃的方法，每个动物都有不同的吃法*
 */

//成员值

enum WeekDays {
    case Monday, Tuesday,Wednesday,Thursday,Firday
}

var day  = WeekDays.Firday
day = WeekDays.Wednesday
day = .Monday

func writeGreeting(day: WeekDays)  {
    
    switch day {
    case .Monday:
        print("星期一好")
    case .Tuesday:
        print("星期二好")
    case .Monday:
        print("星期三好")
    case .Wednesday:
        print("星期四好")
    case .Firday:
        print("星期五好")
    default:
        break
    }
}

writeGreeting(day)
writeGreeting(WeekDays.Firday)


/**
 *  使用枚举成员赋值，我们可以采用完整的“枚举类型名，成员值”的形式，也可以省略枚举类型儿采用“成员值”的形式，这种省略形式能够访问的前提是，Swift编辑器能够根据上下文环境推断类型
 - 为了方便反复的调用，我们定义writeGretting函数，枚举类型siwtch能够很好地配合使用，在switch语句中使用枚举没有default分支
 - 在Swift中使用枚举类型时，siwtch语句中的case必须全面包含枚举中的所有成员，不能多也不能少，包括使用default的情况下，defaul也表示某个枚举成员
 */

//原始值


enum WeekDays2: Int {
    case Monday = 0, Tuesday,Wednesday,Thursday,Firday
}

var day2  = WeekDays2.Firday


func writeGreeting2(day: WeekDays2)  {
    
    switch day {
    case .Monday:
        print("星期一好")
    case .Tuesday:
        print("星期二好")
    case .Monday:
        print("星期三好")
    case .Wednesday:
        print("星期四好")
    case .Firday:
        print("星期五好")
    default:
        break
    }
    
}

let firday = WeekDays2.Firday.rawValue
let thursday = WeekDays2(rawValue: 3)

if(WeekDays2.Firday.rawValue == 4){
    print("星期五好")
}
writeGreeting(day)

//相关值
enum Figure {
    case Rectangle(Int, Int)
    case Circle(Int)
}

func printFigure(figure: Figure)  {
    switch figure {
    case .Rectangle(let width, let height):
        print("矩形的宽：\(width), 高: \(height)")
    case.Circle(let radius):
        print("圆形的半径为:\(radius)")
    }
}

var figure = Figure.Rectangle(1024, 768)
printFigure(figure)

figure = .Circle(600)
printFigure(figure)


//类和构造体定义

class Employee {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    
    var dept: DEpartment?   //所在部门
}

struct DEpartment {   //所在部门结构体
    var no: Int = 0     //部门编号属性
    var name: String = "" //部门名称属性
}
//值类型和引用类型
/*数据类型可以分支为值类型和引用类型，这是由赋值或者参数传递方式决定的，值类型就是赋值给函数传递参数时创建一个副本，把副本传递过去这样在函数的调用过程中不会影响原始数据，引用累心就是在赋值或者给函数传递参数的时候本身引用传递过去，这样在函数的调用过程中会影响原始数据
 - 谨记：只有类是引用类型，其他类型全部都是值类型，即构造体非常相似，它也是值类型。值类型包括整型，浮点型，布尔型，字符串，元组，集合，还有枚举
 *
 */


class Employee14 {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    
    var dept: DEpartment?   //所在部门
}

struct DEpartment14 {   //所在部门结构体
    var no: Int = 0     //部门编号属性
    var name: String = "" //部门名称属性
}

var dept = DEpartment()
dept.no = 10
dept.name = "Sales"

let emp = Employee()
emp.no = 1000
emp.name = "Martin"
emp.job = "Slesman"
emp.salary = 1250
emp.dept = dept

func updateDept ( inout dept: DEpartment){
    dept.name = "Research"
}
print("Department更新前:\(dept.name)")
updateDept(&dept)
print("Department更新后:\(dept.name)")

func unodateEmp(emp: Employee){
    emp.job = "Clerk"
}

print("Department更新前:\(dept.name)")
unodateEmp(emp)
print("Department更新后:\(dept.name)")


//引用类型的比较

class Employee13 {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    
    var dept: DEpartment?   //所在部门
}

struct DEpartment13 {   //所在部门结构体
    var no: Int = 0     //部门编号属性
    var name: String = "" //部门名称属性
}

var dept3 = DEpartment()
dept3.no = 10
dept3.name = "Sales"

let emp1 = Employee()
emp1.no = 1000
emp1.name = "Martin"
emp1.job = "Slesman"
emp1.salary = 1250
emp1.dept = dept

let emp2 = Employee()
emp2.no = 1000
emp2.name = "Martin"
emp2.job = "Slesman"
emp2.salary = 1250
emp2.dept = dept

if emp1 === emp2 {
    print("emp1 === emp2")
}

if emp1 === emp1 {
    print("emp1 === emp1")
}

var dept1 = DEpartment()
dept1.no = 10
dept1.name = "Saler"

var dept2 = DEpartment()
dept2.no = 10
dept2.name = "Saler"

//类型嵌套

class Employee19 {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: Department19 = Department19()   //所在部门
    var day: WeekDays = WeekDays.Firday
    
    struct Department19 {
        var no: Int = 10
        var name: String = "SALES"
    }
    
    enum WeekDays19 {
        case Monday, Tuesday,Wednesday,Thursday,Firday
        
        struct Day {
            static var message: String = "Today is..."
        }
    }
}


var emp19 = Employee19()
print(emp19.dept.name)
print(emp19.day)

//可选类型中的感叹号

/**
 *  声明这个类型可选类型，访问这种类型的变量或常量可以不使用感叹号
 */

//可选链的感叹号

/***
 *  多个实例具有关联的关系，当从一个没有实例应用另外一个实例的方法，属性和下标等救赎形成引用链，由于这个链条某些环节可能有值，也可能没有值
 */

//可选类型中的问号(?)
//访问范围

/**
 *  首先，我们需要搞清楚范围的界面，访问范围主要有两个：模块和源文件
 - 模块是指一个应用程序包或者一个框架，在siwft中，我们可以用import关键字模块引用到自己的店工程中
 - 框架也是很多Swift文件以及其他文件的集合，但是和应用程序包不同的是，它编译的结果不可执行文件
 - 源文件是指Swift中的.Swift文件，编译之后被包含在应用程序或者框架中。通常一个源文件包含一个对象类型(类，结构体和枚举)，这些类型又包含函数，属性
 */

//使用访问级别最佳实践

class Employee15 {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: DEpartment15?   //所在部门
}

internal struct DEpartment15 {
    var no: Int = 0
    var name: String = ""
}

//编译错误
//public let emp = Employee()
//public var emp = Employee



//- 定义了private级别的类Employee，所以当代码创建声明emp常量时，会发生编译错误，定义inernal的机构提Departement，创建声明dept变量是，会发生编译错误

class Employee21 {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: DEpartment21?   //所在部门
}

internal struct DEpartment21 {
    var no: Int = 0
    var name: String = ""
}
//编译错误
//public func getEmpDept(emp: Employee) -> DEpartment21? {
//    return emp.dept
//}

//设计原则

/**
 *  如果我们编写的应用程序中，应用程序包中的所有siwft文件某其中定义的实体都是提供应用使用的，而不是提供其他模块使用的，那么我们就不用1设置访问级别了
 - 如果我们开发的是框架，框架编译的文件不能独立运行，因此它天生就给被人使用，这种情况要详细设计其中的Swift文件和实体访问的级别，让别人使用的可以设定为public，不想让别人看到的可以设定internal或者private
 */

//元祖类型的访问级别


class Employee22 {
    var no: Int = 0   //员工类
    var name: String = "" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    var dept: DEpartment22?   //所在部门
}

internal struct DEpartment22 {
    var no: Int = 0
    var name: String = ""
}

private let emp22 = Employee()
var dept22 = DEpartment22()

private var student22 = (dept, emp)

//枚举类型的访问级别

public enum WeekDays15 {
    
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}

//## 选择类还是结构体最佳实践
//#### 类和结构体异同
//##### 类和结构体都具有以下功能
//- 定义存储属性
//- 定义方法
//- 定义下标
//- 定义构造函数
//- 定义扩展
//- 实现协议
//
//##### 只有类才有的功能
//
//- 能够继承另外一个类
//- 能够核对运行时对象的类型
//- 分析构对象释放资源
//- 引用计数允许一个实例有多个引用
//
//#### 选择的原则

//计算属性的概念

class Employee32 {
    var no: Int = 0   //员工类
    var firstName: String = "Tony" // 员工编号属性
    var lastName: String = "Guan" // 员工编号属性
    var job: String?        //员工姓名属性
    var salary: Double = 0  //工作属性
    lazy var dept: Department32 = Department32()
    
    var fullName: String {
        get {
            return firstName + "." + lastName
        }
        set (newFullName) {
            var name = newFullName.componentsSeparatedByString(".")
            firstName = name[0]
            lastName = name[0]
            
        }
    }
}

struct Department32 {
    var no: Int = 0
    var name: String = ""
}

//静态属性

/**
 *   在介绍静态属性之前，我们先看看一个类的设计，有一个Account类，假设它们有三个属性：amout insterestReae owner，这三个属性中，会因人而异，对应的账户这些内容是不同的
 - amount和owner属性和账户个体有关，称为实例属性，insteresRates属性和个体无关，或者说所有账户个体是共享的，这种属性称为静态属性或者类型属性
 - 语法格式
 */

struct Account {
    var amount: Double = 0.0  //账户金额
    var owner: String = ""  //账户名
    
    static var insteresRete: Double = 0.0668  //利率
    
    static var staticProp: Double {
        
        return insteresRete * 1_00_00
    }
    var instanceProp: Double {
        
        return Account.insteresRete * amount
        
    }
}

//访问静态属性
print(Account.staticProp)

var myAccount = Account()
//访问实例属性
myAccount.amount = 1_00_00
//访问静态属性
print(myAccount.instanceProp)


enum Account2 {
    
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    
    static var insteresRete: Double = 0.0668  //利率
    
    static var staticProp: Double {
        
        return insteresRete * 1_000_00
    }
    var instanceProp: Double {
        
        switch self {
        case .中国银行:
            Account.insteresRete = 0.667
        case .中国工商银行:
            Account.insteresRete = 0.687
        case .中国建设银行:
            Account.insteresRete = 0.697
        case .中国农业银行:
            Account.insteresRete = 0.687
        }
        return Account.insteresRete * 1_000_00
    }
}

//访问静态属性
print(Account2.staticProp)

var myAccount2 = Account2.中国工商银行

//访问静态属性
print(myAccount.instanceProp)


//二维数组

struct DoubleDimensionalArray {
    
    let rows: Int, columns: Int
    var grid: [Int]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    subscript(row: Int, col: Int) -> Int {
        get{
            return grid[(row * columns) + col]
        }
        set(newValue1){
            grid[(row * columns) + col] = newValue1
        }
    }
}

var ary2 = DoubleDimensionalArray(rows: 10, columns: 10)

//初始话二位数组
for i in 0 ..< 10 {
    for j in 0 ..< 10 {
        ary2[i,j] = i * j
    }
}

//打印输出二位数组
for i in 0 ..< 10 {
    for j in 0 ..< 10 {
        print("\t (ary2[i,j])")
    }
    print("\n")
}



















