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
var varA = 20
var constA = 100
var varC:Float = 20.0
var stringE = "\(varA) 乘以 \(constA) 等于\(varC * 100)"
//字符串连接
var stringE1 = varA + constA
print(stringE1)
print(stringE)
//字符串长度
var stringA1 = "www.ctolib.com"
print("\(stringA1),长度为\(stringA1.count)")
//字符串比较
if varA == constA {
    print("\(varA) 与\(constA) 是相等的")
}else{
    print("\(varA) 与\(constA) 是不相等的")
}
