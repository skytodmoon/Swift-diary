//: Playground - noun: a place where people can play

import UIKit


//Objective-C 中的 protocol 里存在 @optional 关键字，被这个关键字修饰的方法并非必须要被实现。我们可以通过接口定义一系列方法，然后由实现接口的类选择性地实现其中几个方法。在 Cocoa API 中很多情况下接口方法都是可选的，这点和 Swift 中的 protocol 的所有方法都必须被实现这一特性完全不同。

//那些如果没有实现则接口就无法正常工作的方法一般是必须的，而相对地像作为事件通知或者对非关键属性进行配置的方法一般都是可选的。最好的例子我想应该是 UITableViewDataSource 和 UITableViewDelegate。前者中有两个必要方法：
/*
--tableView:numberOfRowsInSection:
--tableView:cellForRowAtIndexPath:
*/
//分别用来计算和准备 tableView 的高度以及提供每一个 cell 的样式，而其他的像是返回 section 个数或者询问 cell 是否能被编辑的方法都有默认的行为，都是可选方法；后者 (UITableViewDelegate) 中的所有方法都是详细的配置和事件回传，因此全部都是可选的。

//原生的 Swift protocol 里没有可选项，所有定义的方法都是必须实现的。如果我们想要像 Objective-C 里那样定义可选的接口方法，就需要将接口本身定义为 Objective-C 的，也即在 protocol 定义之前加上 @objc。另外和 Objective-C 中的 @optional 不同，我们使用没有 @ 符号的关键字 optional 来定义可选方法：
/*
@objc protocol OptionalProtocol {
    optional func optionalMethod()
}
*/
//另外，对于所有的声明，它们的前缀修饰是完全分开的。也就是说你不能像是在 Objective-C 里那样用一个 @optional 指定接下来的若干个方法都是可选的了，必须对每一个可选方法添加前缀，对于没有前缀的方法来说，它们是默认必须实现的：
/*
@objc protocol OptionalProtocol {
    optional func optionalMethod()  // 可选
    func necessaryMethod()          // 必须
    optional func anotherOptionalMethod() // 可选
}
*/
//一个不可避免的限制是，使用 @objc 修饰的 protocol 就只能被 class 实现了，也就是说，对于 struct 和 enum 类型，我们是无法令它们所实现的接口中含有可选方法或者属性的。另外，实现它的 class 中的方法还必须也被标注为 @objc，或者整个类就是继承自 NSObject。这对我们写代码来说是一种很让人郁闷的限制。

//在 Swift 2.0 中，我们有了另一种选择，那就是使用 protocol extension。我们可以在声明一个 protocol 之后再用 extension 的方式给出部分方法默认的实现。这样这些方法在实际的类中就是可选实现的了。还是举上面的例子，使用接口扩展的话，会是这个样子：

protocol OptionalProtocol {
    func optionalMethod()        // 可选
    func necessaryMethod()       // 必须
    func anotherOptionalMethod() // 可选
}

extension OptionalProtocol {
    func optionalMethod() {
        print("Implemented in extension")
    }
    
    func anotherOptionalMethod() {
        print("Implemented in extension")
    }
}

class MyClass: OptionalProtocol {
    func necessaryMethod() {
        print("Implemented in Class3")
    }
    
    func optionalMethod() {
        print("Implemented in Class3")
    }
}

let obj = MyClass()
obj.necessaryMethod() // Implemented in Class3
obj.optionalMethod()  // Implemented in Class3
obj.anotherOptionalMethod() // Implemented in extension


