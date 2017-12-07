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

//命名常量和变量
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

//常量和变量的名字不能包含空白字符、数学符号、箭头、保留的（或者无效的）Unicode 码位、连线和制表符。也不能以数字开头，尽管数字几乎可以使用在名字其他的任何地方。

//一旦你声明了一个确定类型的常量或者变量，就不能使用相同的名字再次进行声明，也不能让它改存其他类型的值。常量和变量之间也不能互换。

//注意
//如果你需要使用 Swift 保留的关键字来给常量或变量命名，可以使用反引号（ ` ）包围它来作为名称。总之，除非别无选择，避免使用关键字作为名字除非你确实别无选择。

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome 现在是 "Bonjour!"
//不同于变量，常量的值一旦设定则不能再被改变。尝试这么做将会在你代码编译时导致报错：

var languageName = "Swift"
languageName = "Swift++"
// this is a compile-time error - languageName cannot be changed

//输出常量和变量
//你可以使用 print(_:separator:terminator:) 函数来打印当前常量和变量中的值
print(friendlyWelcome)
// 输出 "Bonjour!"

//print(_:separator:terminator:) 是一个用来把一个或者多个值用合适的方式输出的全局函数。比如说，在 Xcode 中 print(_:separator:terminator:) 函数输出的内容会显示在Xcode的 “console” 面板上。 separator 和 terminator 形式参数有默认值，所以你可以在调用这个函数的时候忽略它们。默认来说，函数通过在行末尾添加换行符来结束输出。要想输出不带换行符的值，那就传一个空的换行符作为结束——比如说， print(someValue, terminator: "") 。更多关于带有默认值的形式参数信息，见默认形式参数值。

//Swift 使用字符串插值 的方式来把常量名或者变量名当做占位符加入到更长的字符串中，然后让 Swift 用常量或变量的当前值替换这些占位符。将常量或变量名放入圆括号中并在括号前使用反斜杠将其转义：

print("The current value of friendlyWelcome is \(friendlyWelcome)")
// 输出 "The current value of friendlyWelcome is Bonjour!"

//注释

// 这是一个注释
/* this is also a comment,
 but written over multiple lines */
/* 这是第一个多行注释的开头
 /* 这是第二个嵌套在内的注释块 */
 这是第一个注释块的结尾*/

//分号
let cat = "🐱"; print(cat)
// 输出 "🐱"

//整数
//Swift 提供了 8，16，32 和 64 位编码的有符号和无符号整数，这些整数类型的命名方式和 C 相似，例如 8 位无符号整数的类型是 UInt8 ，32 位有符号整数的类型是 Int32 。与 Swift 中的其他类型相同，这些整数类型也用开头大写命名法。

//整数范围
let minValue = UInt8.min // 最小值是 0, 值的类型是 UInt8
let maxValue = UInt8.max // 最大值是 255, 值得类型是 UInt8

//Int
//在32位平台上， Int 的长度和 Int32 相同。
//在64位平台上， Int 的长度和 Int64 相同。

//UInt
//在32位平台上， UInt 长度和 UInt32 长度相同。
//在64位平台上， UInt 长度和 UInt64 长度相同。

//浮点数

//Double代表 64 位的浮点数。
//Float 代表 32 位的浮点数。

//类型安全和类型推断

//举个栗子，如果你给一个新的常量设定一个 42 的字面量，而且没有说它的类型是什么，Swift 会推断这个常量的类型是 Int ，因为你给这个常量初始化为一个看起来像是一个整数的数字。
let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int
//同样，如果你没有为一个浮点值的字面量设定类型，Swift 会推断你想创建一个 Double 。
let pi = 3.14159
// pi is inferred to be of type Double
//如果你在一个表达式中将整数和浮点数结合起来， Double 会从内容中被推断出来。
let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

//数值型字面量


