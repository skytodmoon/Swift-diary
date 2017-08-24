//: Playground - noun: a place where people can play

import UIKit


/**============================================================================================================================================================================================
 
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 **============================================================================================================================================================================================
 */

//
//函数定义与调用
//函数参数与返回值
//函数参数标签和参数名称
//函数类型
//嵌套函数
//

//========================函数的定义与调用======================

/**
 当你定义一个函数时，你可以定义一个或多个有名字和类型的值，作为函数的输入，称为参数，也可以定义某种类型的值作为函数执行结束时的输出，称为返回类型。
 
 每个函数有个函数名，用来描述函数执行的任务。要使用一个函数时，用函数名来“调用”这个函数，并传给它匹配的输入值（称作 实参 ）。函数的实参必须与函数参数表里参数的顺序一致。
 
 下面例子中的函数的名字是greet(person:)，之所以叫这个名字,是因为这个函数用一个人的名字当做输入，并返回向这个人问候的语句。为了完成这个任务，你需要定义一个输入参数——一个叫做 person 的 String 值，和一个包含给这个人问候语的 String 类型的返回值：
 */

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

/**
 所有的这些信息汇总起来成为函数的定义，并以 func 作为前缀。指定函数返回类型时，用返回箭头 ->（一个连字符后跟一个右尖括号）后跟返回类型的名称的方式来表示。
 
 该定义描述了函数的功能，它期望接收什么作为参数和执行结束时它返回的结果是什么类型。这样的定义使得函数可以在别的地方以一种清晰的方式被调用：
 **/

print(greet(person: "Anna"))
// 打印 "Hello, Anna!"
print(greet(person: "Brian"))
// 打印 "Hello, Brian!"

/**
 调用 greet(person:) 函数时，在圆括号中传给它一个 String 类型的实参，例如 greet(person: "Anna")。正如上面所示，因为这个函数返回一个 String 类型的值，所以greet 可以被包含在 print(_:separator:terminator:) 的调用中，用来输出这个函数的返回值。
 
 注意
 print(_:separator:terminator:) 函数的第一个参数并没有设置一个标签，而其他的参数因为已经有了默认值，因此是可选的。关于这些函数语法上的变化详见下方关于 函数参数标签和参数名 以及 默认参数值。
 
 在 greet(person:) 的函数体中，先定义了一个新的名为 greeting 的 String 常量，同时，把对 personName 的问候消息赋值给了 greeting 。然后用 return 关键字把这个问候返回出去。一旦 return greeting 被调用，该函数结束它的执行并返回 greeting 的当前值。
 
 你可以用不同的输入值多次调用 greet(person:)。上面的例子展示的是用"Anna"和"Brian"调用的结果，该函数分别返回了不同的结果。
 
 为了简化这个函数的定义，可以将问候消息的创建和返回写成一句：
 */

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// 打印 "Hello again, Anna!

//========================函数参数与返回值======================
//函数参数与返回值在 Swift 中非常的灵活。你可以定义任何类型的函数，包括从只带一个未名参数的简单函数到复杂的带有表达性参数名和不同参数选项的复杂函数。

//========================无参数函数======================
//函数可以没有参数。下面这个函数就是一个无参数函数，当被调用时，它返回固定的 String 消息：

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// 打印 "hello, world"
//尽管这个函数没有参数，但是定义中在函数名后还是需要一对圆括号。当被调用时，也需要在函数名后写一对圆括号。

//多参数函数
//函数可以有多种输入参数，这些参数被包含在函数的括号之中，以逗号分隔。
//下面这个函数用一个人名和是否已经打过招呼作为输入，并返回对这个人的适当问候语:

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// 打印 "Hello again, Tim!"

/**
 你可以通过在括号内使用逗号分隔来传递一个String参数值和一个标识为alreadyGreeted的Bool值，来调用greet(person:alreadyGreeted:)函数。注意这个函数和上面greet(person:)是不同的。虽然它们都有着同样的名字greet，但是greet(person:alreadyGreeted:)函数需要两个参数，而greet(person:)只需要一个参数。
 */

//========================无返回值函数======================
//函数可以没有返回值。下面是 greet(person:) 函数的另一个版本，这个函数直接打印一个String值，而不是返回它：
/**
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
// 打印 "Hello, Dave!"
*/

//因为这个函数不需要返回值，所以这个函数的定义中没有返回箭头（->）和返回类型。
/**
注意
严格上来说，虽然没有返回值被定义，greet(person:) 函数依然返回了值。没有定义返回类型的函数会返回一个特殊的Void值。它其实是一个空的元组（tuple），没有任何元素，可以写成()。

被调用时，一个函数的返回值可以被忽略
*/

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// 打印 "hello, world" 并且返回值 12
printWithoutCounting(string: "hello, world")
// 打印 "hello, world" 但是没有返回任何值

/**
 第一个函数 printAndCount(string:)，输出一个字符串并返回 Int 类型的字符数。第二个函数 printWithoutCounting(string:)调用了第一个函数，但是忽略了它的返回值。当第二个函数被调用时，消息依然会由第一个函数输出，但是返回值不会被用到。
 注意:
 返回值可以被忽略，但定义了有返回值的函数必须返回一个值，如果在函数定义底部没有返回任何值，将导致编译时错误（compile-time error）。
 **/

//========================多重返回值函数======================
//你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回。
//下例中定义了一个名为 minMax(array:) 的函数，作用是在一个 Int 类型的数组中找出最小值与最大值。

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

/**
 minMax(array:) 函数返回一个包含两个 Int 值的元组，这些值被标记为 min 和 max ，以便查询函数的返回值时可以通过名字访问它们。
 
 在 minMax(array:) 的函数体中，在开始的时候设置两个工作变量 currentMin 和 currentMax 的值为数组中的第一个数。然后函数会遍历数组中剩余的值并检查该值是否比 currentMin 和 currentMax 更小或更大。最后数组中的最小值与最大值作为一个包含两个 Int 值的元组返回。
 
 因为元组的成员值已被命名，因此可以通过 . 语法来检索找到的最小值与最大值
 */

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// 打印 "min is -6 and max is 109"

//========================可选元组返回类型======================
//如果函数返回的元组类型有可能整个元组都“没有值”，你可以使用可选的（ optional ） 元组返回类型反映整个元组可以是nil的事实。你可以通过在元组类型的右括号后放置一个问号来定义一个可选元组，例如 (Int, Int)? 或 (String, Int, Bool)?
/**
注意 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的.可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。

前面的 minMax(array:) 函数返回了一个包含两个 Int 值的元组。但是函数不会对传入的数组执行任何安全检查，如果 array 参数是一个空数组，如上定义的 minMax(array:) 在试图访问 array[0] 时会触发一个运行时错误(runtime error)。
    
为了安全地处理这个“空数组”问题，将 minMax(array:) 函数改写为使用可选元组返回类型，并且当数组为空时返回 nil：


func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
*/

//你可以使用可选绑定来检查 minMax(array:) 函数返回的是一个存在的元组值还是 nil：
/*
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// 打印 "min is -6 and max is 109"
*/

//========================函数参数标签和参数名称======================
/**
 每个函数参数都有一个参数标签( argument label )以及一个参数名称( parameter name )。参数标签在调用函数的时候使用；调用的时候需要将函数的参数标签写在对应的参数前面。参数名称在函数的实现中使用。默认情况下，函数参数使用参数名称来作为它们的参数标签。
 
 func someFunction(firstParameterName: Int, secondParameterName: Int) {
 // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
 }
 someFunction(firstParameterName: 1, secondParameterName: 2)
 所有的参数都必须有一个独一无二的名字。虽然多个参数拥有同样的参数标签是可能的，但是一个唯一的函数标签能够使你的代码更具可读性。
 */

//========================指定参数标签======================
//你可以在参数名称前指定它的参数标签，中间以空格分隔：

/**
func someFunction(argumentLabel parameterName: Int) {
    // 在函数体内，parameterName 代表参数值
}
*/

//这个版本的 greet(person:) 函数，接收一个人的名字和他的家乡，并且返回一句问候：

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// 打印 "Hello Bill! Glad you could visit from Cupertino."

//参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且仍保持了函数内部的可读性以及清晰的意图。





