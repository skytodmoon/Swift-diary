//: Playground - noun: a place where people can play

import UIKit


//=========================简单值======================
//使用let声明常量，使用var声明变量
var myVariable = 42
myVariable = 50
let myConstans = 42

//没有初始值没有提供的足够信息，那么需要在变量后面声明类型，用冒号分割
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//值永远不会被隐藏转换为其他类型，如果你需要把一个值转换其他类型，请显示转换
let label = "The width is"
let width = 94
let widthLabel = label + String(width)

//有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠。
let apples = 3
let oranges = 5
let appleSummary = "i have \(apples)apples"
let fruitSummary = "i have \(apples + oranges) pieces of fruit"

//使用方括号[]来创建数组和字典，并使用下标key来访问元素。最后一个元素后面允许有一个逗号
var shoppingList  = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm":"Caption",
    "Kaylee":"Mechanic",
]
occupations["Jayne"] = "Public Relations"

//创建一个空数组活着字典，使用初始化语法
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//如果类型信息可以被推断出来，你可以用[]和[:]来创建空数组和空字典
shoppingList = []
occupations = [:]

//=========================控制流======================
//if switch for-in for while ,包裹条条件循环变量括号可以省略
//但是语句体的大括号是必须的
let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
print(teamScore)


//一个可选的值是一个具体的值或者nil以表示缺少，在类型后面加上一个
//问号来标记这个变量的值是可选的
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Applessed"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello,\(name)"
}

//另一种处理可选的方法是通过使用??操作符来提供一个默认值
let nickName: String? = nil
let fullName: String = "John Applessed"
let informalGreeting = "Hi\(nickName ?? fullName)"

//switch支持任意类型的数据以及各种比较操作
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log")
    case "cucumber","watercress":
        print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
        print("is it a spicy\(x)?")
default:
    print("Everything tastes good in soup")
}