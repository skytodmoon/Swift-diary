//: [Previous](@previous)

import Foundation

//常量和变量
//常量和变量把名字（例如 maximumNumberOfLoginAttempts 或者 welcomeMessage ）和一个特定类型的值（例如数字 10 或者字符串 “Hello”）关联起来。常量的值一旦设置好便不能再被更改，然而变量可以在将来被设置为不同的值。

//声明常量和变量
//常量和变量必须在使用前被声明，使用关键字 let 来声明常量，使用关键字 var 来声明变量。这里有一个如何利用常量和变量记录用户登录次数的栗子
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

//你可以在一行中声明多个变量或常量，用逗号分隔：
var x = 0.0, y = 0.0, z = 0.0

//类型标注
//你可以在声明一个变量或常量的时候提供类型标注，来明确变量或常量能够储存值的类型。添加类型标注的方法是在变量或常量的名字后边加一个冒号，再跟一个空格，最后加上要使用的类型名称。

//下面这个栗子给一个叫做 welcomeMessage 的变量添加了类型标注，明确这个变量可以存储 String 类型的值。

var welcomeMessage: String
//声明中的冒号的意思是“是…类型”，所以上面的代码可以读作：

//“声明一个叫做 welcomMessage 的变量，他的类型是 String ”

//我们说“类型是 String ”就意味着“可以存储任何 String 值”。也可以理解为“这类东西”（或者“这种东西”）可以被存储进去。

//现在这个 welcomeMessage 变量就可以被设置到任何字符串中而不会报错了：

welcomeMessage = "Hello"
//你可以在一行中定义多个相关的变量为相同的类型，用逗号分隔，只要在最后的变量名字后边加上类型标注。

var red, green, blue: Double
//注意
//实际上，你并不需要经常使用类型标注。如果你在定义一个常量或者变量的时候就给他设定一个初始值，那么 Swift 就像类型安全和类型推断中描述的那样，几乎都可以推断出这个常量或变量的类型。在上面 welcomeMessage 的栗子中，没有提供初始值，所以 welcomeMessage 这个变量使用了类型标注来明确它的类型而不是通过初始值的类型推断出来的。

