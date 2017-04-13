//: Playground - noun: a place where people can play

import Cocoa

//在声明一个 Swift 的方法的时候，我们一般不去指定参数前面的修饰符，而是直接声明参数：

func incrementor(variable: Int) -> Int {
    return variable + 1
}

//这个方法接受一个 Int 的输入，然后通过将这个输入加 1，返回一个新的比输入大 1 的 Int。嘛，就是一个简单的 +1器。

//有些同学在大学的 C 程序设计里可能学过像 ++ 这样的“自增”运算符，再加上做了不少关于“判断一个数被各种前置 ++ 和后置 ++ 折磨后的输出是什么”的考试题，所以之后写代码时也会不自觉地喜欢带上这种风格。于是同样的功能可能会写出类似这样的方法：
/*
这是错误代码
func incrementor(variable: Int) -> Int {
    return ++variable
}
*/

//残念..编译错误。为什么在 Swift 里这样都不行呢？答案是因为 Swift 其实是一门讨厌变化的语言。所有有可能的地方，都被默认认为是不可变的，也就是用 let 进行声明的。这样不仅可以确保安全，也能在编译器的性能优化上更有作为。在方法的参数上也是如此，我们不写修饰符的话，默认情况下所有参数都是 let 的，上面的代码等效为：

func incrementor(let variable: Int) -> Int {
    return ++variable
}

//let 的参数，不能重新赋值这是理所当然的。要让这个方法正确编译，我们需要做的改动是将 let 改为 var：

func incrementor(var variable: Int) -> Int {
    variable += 1
    return variable
}

//现在我们的 +1器 又可以正确工作了：

var luckyNumber = 7
let newNumber = incrementor(luckyNumber)
// newNumber = 8

print(luckyNumber)
// luckyNumber 还是 7
//虽然我们将参数写作 var 后，在 Swift 2.2 中代码是可以通过编译并正确工作的，然而这将触发警告。在输入参数上添加 var 的做法已经被废弃了。现在我们如果想只在函数内部对这样的输入值进行修改的话，只能显式地在函数内部进行使用 var 进行赋值以后再操作了：

func incrementor2(variable: Int) -> Int {
    var num = variable
    num += 1
    return num
}

//相比于 Swift 2.2 之前的方式，这种显式赋值显然使语义更加清晰明确，整个函数的行为都在预想之中，没有魔法。
//有些时候我们会希望在方法内部直接修改输入的值，这时候我们可以使用 inout 来对参数进行修饰：

func incrementor(inout variable: Int) {
    variable += 1
}

//因为在函数内部就更改了值，所以也不需要返回了。调用也要改变为相应的形式，在前面加上 & 符号：

var luckyNumber = 7
incrementor(&luckyNumber)

print(luckyNumber)
// luckyNumber = 8
//最后，要注意的是参数的修饰是具有传递限制的，就是说对于跨越层级的调用，我们需要保证同一参数的修饰是统一的。举个例子，比如我们想扩展一下上面的方法，实现一个可以累加任意数字的 +N器 的话，可以写成这样：

func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(inout variable: Int) -> () {
        variable += addNumber;
    }
    return incrementor;
}

//外层的 makeIncrementor 的返回里也需要在参数的类型前面明确指出修饰词，以符合内部的定义，否则将无法编译通过。