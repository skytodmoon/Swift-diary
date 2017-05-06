//: Playground - noun: a place where people can play

import UIKit

//整型
print("UInt8 range: \(UInt8.min) ~ \(UInt8.max)")

print("Int8 range: \(Int8.min) ~ \(Int8.max)")

print("UInt range: \(UInt.min) ~ \(UInt.max)")

print("UInt64 range: \(UInt64.min) ~ \(UInt64.max)")

print("Int64 range: \(Int64.min) ~ \(Int64.max)")

print("Int range: \(Int.min) ~ \(Int.max)")


var ageForStudent = 30

//ageForStudent = "20"

var scoreForStudent: Int = 90


//浮点型
var myMoney: Float = 300.5
var yourMoney: Double = 360.5
let pi = 3.14159

//进制数字表示
let intdecimalInt = 28
let binaryInt = 0b11100
let octalInt = 0o34
let hexadecimalInt = 0x1C

//指数表示
var myMoney2  = 3.36e2
var interestRate2 = 1.56e-2

//其它表示
var interestRate = 000.0156
var myMoney3  = 3_360_000

//整型之间转换
let historyScore: UInt8 = 90

let englishScore: UInt16 = 130

//let totalScore = historyScore + englishScore  //错误

//let totalScore = UInt16(historyScore) + englishScore   //正确，安全

let totalScore = historyScore + UInt8(englishScore)  //正确，不安全


//整型与浮点型之间转换
let historyScore2: Float = 90.6

let englishScore2: UInt16 = 130

//let totalScore = historyScore + englishScore  //错误

//let totalScore = historyScore + Float(englishScore)  //正确，安全

let totalScore2 = UInt16(historyScore2) + englishScore2  //正确，小数被截掉


//布尔型
var is🐴 = true
var is🐼: Bool = false

if (is🐴) {
    print("是的，它是马。")
} else {
    print("不，它是熊猫！")
}


//元组类型
var student1 = ("1001", "张三", 30, 90)
print("学生:\(student1.1) 学号:\(student1.0) 语文成绩:\(student1.2) 语文成绩:\(student1.3)")

var student2 = (id:"1002", name:"李四", english_score:32, chinese_score:80)
print("学生:\(student2.name) 学号:\(student2.id) 语文成绩:\(student2.english_score) 语文成绩:\(student2.chinese_score)")

let (id1, name1,age1,score1) = student1

print("学生:\(name1) 学号:\(id1) 语文成绩:\(age1) 语文成绩:\(score1)")

let (id2, name2,_,_) = student2

print("学生:\(name2) 学号:\(id2)")


//其他

var n1: Int? = 10
//print(n1 + 100)
print(n1! + 100)

var n2: Int! = 100
print(n2 + 200)


func divide(n1: Int, n2: Int) ->Double? {
    if n2 == 0 {
        return nil
    }
    return Double(n1)/Double(n2)
}

if let result = divide(100, n2: 0) {
    print(result)
    print("Success.")
} else {
    //print(result)       //编译错误
    print("failure.")
}
