//: Playground - noun: a place where people can play

//Swift 字符串
// 使用字符串字面量
var stringA = "Hello, World!"
print( stringA )

// String 实例化
var stringB = String("Hello, World!")
print(stringB)

//空字符串

//使用字符串字面量创建空字符串
var stringC = ""

if stringC.isEmpty{
    print("stringC 是空的")
}else{
    print("stringC 不是空的")
}

//实力化String类来创建字符串
let stringD = String()

if stringD.isEmpty{
    print("stringB 是空的")
}else{
    print("stringB 不是空的")
}

//字符串常量

/*
//以上程序执行输出结果会报错，以为 stringB 为常量是不能被修改的：
var stringA1 = "你好 Swift"
stringA1 +="http://www.ctolib.com"
print(stringA1)

// stringB 不能修改
let stringB1 = String("W3Cschool教程：")
stringB1 += "http://www.ctolib.com"
print( stringB1)
error: left side of mutating operator isn't mutable: 'stringB' is a 'let' constant
stringB += "http://www.ctolib.com"

*/

//字符串插入值
