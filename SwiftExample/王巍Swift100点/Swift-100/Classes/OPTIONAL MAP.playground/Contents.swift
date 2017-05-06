//: Playground - noun: a place where people can play

import UIKit

//我们经常会对 Array 类型使用 map 方法，这个方法能对数组中的所有元素应用某个规则，然后返回一个新的数组。我们可以在 CollectionType 的 extension 中找到这个方法的定义：
/*
extension CollectionType {
    public func map<T>(@noescape transform:
        (Self.Generator.Element) -> T) -> [T]
    
    //...
}

*/


let arr = [1,2,3]
let doubled = arr.map{
    $0 * 2
}

print(doubled)
// 输出：
// [2,4,6]

//这很方便，而且在其他一些语言里 map 可以说是很常见也很常用的一个语言特性了。因此当这个特性出现在 Swift 中时，也赢得了 iOS/Mac 开发者们的欢迎。

//现在假设我们有个需求，要将某个 Int? 乘 2。一个合理的策略是如果这个 Int? 有值的话，就取出值进行乘 2 的操作，如果是 nil 的话就直接将 nil 赋给结果。依照这个策略，我们可以写出如下代码：


let num: Int? = 3

var result: Int?
if let realNum = num {
    result = realNum * 2
} else {
    result = nil
}
//其实我们有更优雅简洁的方式，那就是使用 Optional 的 map。对的，不仅在 Array 或者说 CollectionType 里可以用 map，如果我们仔细看过 Optional 的声明的话，会发现它也有一个 map 方法：
/*
public enum Optional<T> :
_Reflectable, NilLiteralConvertible {
    
    //...
    
    /// If `self == nil`, returns `nil`.  Otherwise, returns `f(self!)`.
    public func map<U>(@noescape f: (T) -> U) -> U?
    
    //...
}
 */
//这个方法能让我们很方便地对一个 Optional 值做变化和操作，而不必进行手动的解包工作。输入会被自动用类似 Optinal Binding 的方式进行判断，如果有值，则进入 f 的闭包进行变换，并返回一个 U?；如果输入就是 nil 的话，则直接返回值为 nil 的 U?。

//有了这个方法，上面的代码就可以大大简化，而且 result 甚至可以使用常量值：

/*
let num: Int? = 3
let result = num.map {
    $0 * 2
}
*/
// result 为 {Some 6}
//如果您了解过一些函数式编程的概念，可能会知道这正符合函子 (Functor) 的概念。不论是 Array 还是 Optional，它们拥有一个同样名称的 map 函数并不是命名上的偶然。函子指的是可以被某个函数作用，并映射为另一组结果，而这组结果也是函子的值。在我们的例子里，Array 的 map 和 Optional 的 map 都满足这个概念，它们分别将 [Self.Generator.Element] 映射为 [T] 以及 T? 映射为 U?。Swift 是一门非常适合用函数式编程的思想来进行程序设计的语言，如果您想多了解一些函数式编程的思想，ObjC 中国的《函数式 Swift》会是入门 Swift 函数式编程的好选择。


