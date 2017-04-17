//: Playground - noun: a place where people can play

import UIKit

//条件语句else-if
let testscore = 76

var grade: Character

if testscore >= 90 {
    grade = "A"
} else if testscore >= 80 {
    grade = "B"
} else if testscore >= 70 {
    grade = "C"
} else if testscore >= 60 {
    grade = "D"
} else {
    grade = "F"
}

print("Grade = \(grade)")


//条件语句if-else
var score = 95

if score < 60 {
    print("不及格")
} else {
    print("及格")
}

//条件语句if

var score2 = 95

if score2 >= 85 {
    print("您真优秀！")
}

if score2 < 60 {
    print("您需要加倍努力！")
}

if score2 >= 60 && score2 < 85 {
    print("您的成绩还可以，仍需继续努力！")
}

if score2 < 60 {
    print("不及格")
} else {
    print("及格")
}

//基本形式switch

let testscore3 = 86

var grade3: Character

switch testscore3 / 10 {
case 9:
    grade3 = "优"
case 8:
    grade3 = "良"
case 7,6:
    grade3 = "中"
default:
    grade3 = "差"
}

print("Grade = \(grade3)")


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
    desc = "其它值"
}

print("说明 = \(desc)")

let level = "优"

switch level {
case "优":
    desc = "90分以上"
case "良":
    desc = "80分~90分"
case "中":
    desc = "70分~80分"
case "差":
    desc = "低于60分"
default:
    desc = "无法判断"
}

print("说明 = \(desc)")

//guard语句
//定义一个Blog(博客)结构体
struct Blog {
    let name: String?
    let URL: String?
    let Author: String?
}

func ifStyleBlog(blog: Blog) {
    if let blogName = blog.name {
        print("博客名：\(blogName)")
    } else {
        print("这篇博客没有名字！")
    }
}

func guardStyleBlog(blog: Blog) {
    guard let blogName = blog.name else {
        print("这篇博客没有名字！")
        return
    }
    print("这篇博客名：\(blogName)")
}

func ifLongStyleBlog(blog: Blog) {
    
    if let blogName = blog.name {
        print("这篇博客名：\(blogName)")
        
        if let blogAuthor = blog.Author {
            print("这篇博客由\(blogAuthor)写的")
            
            if let blogURL = blog.URL {
                print("这篇博客网址：\(blogURL)")
            } else {
                print("这篇博客没有网址！")
            }
        } else {
            print("这篇博客没有作者！")
        }
    } else {
        print("这篇博客没有名字！")
    }
    
}


func guardLongStyleBlog(blog: Blog) {
    
    guard let blogName = blog.name else {
        print("这篇博客没有名字！")
        return
    }
    
    print("这篇博客名：\(blogName)")
    
    guard let blogAuthor = blog.Author else {
        print("这篇博客没有作者")
        return
    }
    
    print("这篇博客由\(blogAuthor)写的")
    
    guard let blogURL = blog.URL else {
        print("这篇博客没有网址！")
        return
    }
    
    print("这篇博客网址：\(blogURL)")
}


let blog1 = Blog(name: nil, URL: "51work6.com", Author: "Tom")
let blog2 = Blog(name: "Tony'Blog", URL: "51work6.com", Author: "Tony")

let blog3 = Blog(name: nil, URL: nil, Author: "Tom")
let blog4 = Blog(name: "Tony'Blog", URL: "51work6.com", Author: nil)

guardStyleBlog(blog1)
guardStyleBlog(blog2)

guardLongStyleBlog(blog3)
guardLongStyleBlog(blog4)


//while语句
var i:Int64 = 0

import XCPlayground

while i * i < 100000 {
    i += 1
    XCPlaygroundPage.currentPage.captureValue(i, withIdentifier: "i")
}


print("i = \(i)")
print("i * i = \(i * i)")

//repeat while语句

var i3: Int64 = 0

repeat {
    i3 += 1
} while  i3 * i3 < 100_000

print("i3 = \(i3)")
print("i3 * i3 = \(i3 * i3)")

//for语句
print("n   n*n")
print("---------")

for i in 1 ..< 10  {
    print("\(i) x \(i) = \(i * i)")
}


var x: Int32
var y: Int32

for x = 0, y = 10; x < y; x++, y--  {
    print("(x,y) = (\(x),\(y))")
}

//语句
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print("----for-------")
for i in 0 ..< numbers.count {
    print("Count is: \(i)")
}

print("----for in----")
for item in numbers {
    print("Count is: \(item)")
}

for (index, element) in numbers.enumerate() {
    print("Item \(index): \(element)")
}


//break语句1
let numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for i in 0 ..< numbers2.count {
    if i == 3 {
        break
    }
    print("Count is: \(i)")
}

//break语句2
label1: for x in 0 ..< 5 {
    
    label2: for var y = 5; y > 0; y -= 1 {
        if y == x {
            break label1
        }
        print("(x,y) = (\(x),\(y))")
    }
}

print("Game Over!")

//continue语句1
let numbers3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for i in 0 ..< numbers3.count {
    if i == 3 {
        continue
    }
    print("Count is: \(i)")
}
//continue语句2
label1: for x in 0 ..< 5 {
    
    label2: for var y = 5; y > 0; y -= 1 {
        if y == x {
            continue label1
        }
        print("(x,y) = (\(x),\(y))")
    }
}

print("Game Over!")


//fallthrough语句
var j2 = 1
var x2 = 4

switch x2 {
case 1:
    j2++
case 2:
    j2++
case 3:
    j2++
case 4:
    j2++
    fallthrough
case 5:
    j2++
    fallthrough
default:
    j2++
}

print("j2 = \(j2)")


//switch中使用区间运算符

//示例1
let testscore5 = 80

var grade5: Character

switch testscore5 {
case 90...100:
    grade5 = "优"
case 80..<90:
    grade5 = "良"
case 60..<80:
    grade5 = "中"
case 0..<60:
    grade5 = "差"
default:
    grade5 = "无"
}

print("Grade5 = \(grade5)")


//示例2
var student5 = (id:"1002", name:"李四", age:32, ChineseScore:80, EnglishScore:89)

var desc5: String

switch student5 {
case (_, _, _, 90...100, 90...100):
    desc5 = "优"
case (_, _, _, 80..<90, 80..<90):
    desc5 = "良"
case (_, _, _, 60..<80, 60..<80):
    desc5 = "中"
case (_, _, _, 60..<80, 90...100), (_, _, _, 90...100, 60..<80):
    desc5 = "偏科"
case (_, _, _, 0..<80, 90...100), (_, _, _, 90...100, 0..<80):
    desc5 = "严重偏科"
default:
    desc5 = "无"
}

print("说明：\(desc5)")

//for in中使用区间运算符
let numbers6 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let count = numbers6.count
print("----半开区间----")
for i in 0..<count {
    print("第\(i + 1)个元素：\(numbers6[i])")
}

print("----闭区间----")
for i in 0...5 {
    print("第\(i + 1)个元素：\(numbers6[i])")
}

//if中的值绑定
//定义一个Blog(博客)结构体
struct Blog6 {
    let name: String?
    let URL: String?
    let Author: String?
}

func ifStyleBlog6(blog6: Blog6) {
    
    if let blogName = blog6.name,
        let blogURL = blog6.URL,
        let blogAuthor = blog6.Author {
        
        print("这篇博客名：\(blogName)")
        print("这篇博客由\(blogAuthor)写的")
        print("这篇博客网址：\(blogURL)")
        
    } else {
        print("这篇博客信息不完整!")
    }
}

let blog6 = Blog6(name: nil, URL: "51work6.com", Author: "Tom")
let blog7 = Blog6(name: "Tony'Blog", URL: "51work6.com", Author: "Tony")

print("--blog6--")
ifStyleBlog6(blog6)
print("--blog7--")
ifStyleBlog6(blog7)


//guard中的值绑定
//定义一个Blog(博客)结构体
struct Blog9 {
    let name: String?
    let URL: String?
    let Author: String?
}

func guardStyleBlog9(blog9: Blog9) {
    
    guard let blogName = blog9.name,
        let blogURL = blog9.URL,
        let blogAuthor = blog9.Author else {
            
            print("这篇博客信息不完整!")
            return
    }
    
    print("这篇博客名：\(blogName)")
    print("这篇博客由\(blogAuthor)写的")
    print("这篇博客网址：\(blogURL)")
    
}

let blog9 = Blog9(name: nil, URL: "51work6.com", Author: "Tom")
let blog10 = Blog9(name: "Tony'Blog", URL: "51work6.com", Author: "Tony")

print("--blog9--")
guardStyleBlog9(blog9)
print("--blog10--")
guardStyleBlog9(blog10)

//switch中的值绑定
var student9 = (id:"1002", name:"李四", age:32, ChineseScore:90, EnglishScore:91)

var desc9: String

switch student9 {
case (_, _, let AGE, 90...100, 90...100):
    if (AGE > 30) {
        desc9 = "老优"
    } else {
        desc9 = "小优"
    }
case (_, _, _, 80..<90, 80..<90):
    desc9 = "良"
case (_, _, _, 60..<80, 60..<80):
    desc9 = "中"
case (_, _, _, 60..<80, 90...100), (_, _, _, 90...100, 60..<80):
    desc9 = "偏科"
case (_, _, _, 0..<80, 90...100), (_, _, _, 90...100, 0..<80):
    desc9 = "严重偏科"
default:
    desc9 = "无"
}

print("说明：\(desc9)")

//switch中使用where语句
var student11 = (id:"1002", name:"李四", age:32, ChineseScore:90, EnglishScore:91)

var desc11: String

switch student11 {
case (_, _, let age, 90...100, 90...100) where age > 20:
    desc11 = "优"
case (_, _, _, 80..<90, 80..<90):
    desc11 = "良"
case (_, _, _, 60..<80, 60..<80):
    desc11 = "中"
case (_, _, _, 60..<80, 90...100), (_, _, _, 90...100, 60..<80):
    desc11 = "偏科"
case (_, _, _, 0..<80, 90...100), (_, _, _, 90...100, 0..<80):
    desc11 = "严重偏科"
default:
    desc11 = "无"
}

print("说明：\(desc11)")


//for in中使用where语句

let numbers12 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print("----for in----")
for item in numbers12 where item > 5 {
    print("Count is: \(item)")
}

//guard中使用where语句
//定义一个Blog(博客)结构体
struct Blog12 {
    let name: String?
    let URL: String?
    let Author: String?
}

func guardStyleBlog12(blog12: Blog12) {
    guard let blogName = blog12.name where blog12.Author == "Tony" && blogName == "Tony'Blog" else {
        print("这篇博客没有名字！")
        return
    }
    print("这篇博客名：\(blogName)")
}

let blog12 = Blog12(name: nil, URL: "51work6.com", Author: "Tom")
let blog13 = Blog12(name: "Tony'Blog", URL: "51work6.com", Author: "Tony")

guardStyleBlog12(blog12)
guardStyleBlog12(blog13)

