//: Playground - noun: a place where people can play

import UIKit

/*通常来说，编程语言教程中的第一个程序应该在屏幕上打印“Hello, world”。在 Swift 中，可以用一行代码实现：*/
print("Hello,world!")


//=========================简单值======================
//使用let来声明常量，使用var来声明变量。一个常量的值，在编译的时候，并不需要有明确的值，但是你只能为它赋值一次。也就是说你可以用常量来表示这样一个值：你只需要决定一次，但是需要使用很多次。

var myVariable = 42
myVariable = 50
let myConstant = 42

//常量或者变量的类型必须和你赋给它们的值一样。然而，你不用明确地声明类型，声明的同时赋值的话，编译器会自动推断类型。在上面的例子中，编译器推断出myVariable是一个整数（integer）因为它的初始值是整数。
//如果初始值没有提供足够的信息（或者没有初始值），那你需要在变量后面声明类型，用冒号分割

let implicitIngteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

/**
 
 练习：
 
 创建一个常量，显式指定类型为Float并指定初始值为4。值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换。
 
 **/

let label = "The width is"
let width = 94
let widthLabel = label + String(width)

/**

练习： 删除最后一行中的String，错误提示是什么？

有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠。例如：

 **/

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pices of fruit"


/**
 
 练习： 使用\()来把一个浮点计算转换成字符串，并加上某人的名字，和他打个招呼。
 
 使用方括号[]来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号。
 
 **/


