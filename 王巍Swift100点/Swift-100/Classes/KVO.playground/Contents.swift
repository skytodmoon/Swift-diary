//: Playground - noun: a place where people can play

import UIKit

//KVO (Key-Value Observing) 是 Cocoa 中公认的最强大的特性之一，但是同时它也以烂到家的 API 和极其难用著称。和属性观察不同，KVO 的目的并不是为当前类的属性提供一个钩子方法，而是为了其他不同实例对当前的某个属性 (严格来说是 keypath) 进行监听时使用的。其他实例可以充当一个订阅者的角色，当被监听的属性发生变化时，订阅者将得到通知。

//这是一个很强大的属性，通过 KVO 我们可以实现很多松耦合的结构，使代码更加灵活和强大：像通过监听 model 的值来自动更新 UI 的绑定这样的工作，基本都是基于 KVO 来完成的。

//在 Swift 中我们也是可以使用 KVO 的，但是仅限于在 NSObject 的子类中。这是可以理解的，因为 KVO 是基于 KVC (Key-Value Coding) 以及动态派发技术实现的，而这些东西都是 Objective-C 运行时的概念。另外由于 Swift 为了效率，默认禁用了动态派发，因此想用 Swift 来实现 KVO，我们还需要做额外的工作，那就是将想要观测的对象标记为 dynamic。

//在 Swift 中，为一个 NSObject 的子类实现 KVO 的最简单的例子看起来是这样的：
/*
class MyClass: NSObject {
    dynamic var date = NSDate()
}

private var myContext = 0

class Class: NSObject {
    
    var myObject: MyClass!
    
    override init() {
        super.init()
        myObject = MyClass()
        print("初始化 MyClass，当前日期: \(myObject.date)")
        myObject.addObserver(self,
                             forKeyPath: "date",
                             options: .New,
                             context: &myContext)
        
        delay(3) {
            self.myObject.date = NSDate()
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?,
                                         ofObject object: AnyObject?,
                                                  change: [String : AnyObject]?,
                                                  context: UnsafeMutablePointer<Void>)
    {
        if let change = change where context == &myContext {
            let a = change[NSKeyValueChangeNewKey]
            print("日期发生变化 \(a)")
        }
    }
}

*/
//let obj = Class()
//这段代码中用到了一个叫做 delay 的方法，这不是 Swift 的方法，而是本书在延时调用一节中实现的一个方法。这里您只需要理解我们是过了三秒以后在主线程将 myObject 中的时间更新到了当前时间即可。
//我们标明了 MyClass 的 date 为 dynamic，然后在一个 Class 的 init 中将自己添加为该实例的观察者。接下来等待了三秒钟之后改变了这个对象的被观察属性，这时我们的观察方法就将被调用。运行这段代码，输出应该类似于：

//初始化 MyClass，当前日期: 2014-08-23 16:37:20 +0000
//日期发生变化 Optional(2014-08-23 16:37:23 +0000)
//别忘了，新的值是从字典中取出的。虽然我们能够确定 (其实是 Cocoa 向我们保证) 这个字典中会有相应的键值，但是在实际使用的时候我们最好还是进行一下判断或者 Optional Binding 后再加以使用，毕竟世事难料。

//在 Swift 中使用 KVO 有两个显而易见的问题。

//首先是 Swift 的 KVO 需要依赖的东西比原来多。在 Objective-C 中我们几乎可以没有限制地对所有满足 KVC 的属性进行监听，而现在我们需要属性有 dynamic 进行修饰。大多数情况下，我们想要观察的类不一定是 dynamic 修饰的 (除非这个类的开发者有意为之，否则一般也不会有人愿意多花功夫在属性前加上 dynamic，因为这毕竟要损失一部分性能)，并且有时候我们很可能也无法修改想要观察的类的源码。遇到这样的情况的话，一个可能可行的方案是继承这个类并且将需要观察的属性使用 dynamic 进行重写。比如刚才我们的 MyClass 中如果 date 没有 dynamic 的话，我们可能就需要一个新的 MyChildClass 了：
/*
class MyClass: NSObject {
    var date = NSDate()
}

class MyChildClass: MyClass {
    dynamic override var date: NSDate {
        get { return super.date }
        set { super.date = newValue }
    }
}
对于这种重载，我们没有必要改变什么逻辑，所以在子类中简单地用 super 去调用父类里相关的属性就可以了。

另一个大问题是对于那些非 NSObject 的 Swift 类型怎么办。因为 Swift 类型并没有通过 KVC 进行实现，所以更不用谈什么对属性进行 KVO 了。对于 Swift 类型，语言中现在暂时还没有原生的类似 KVO 的观察机制。我们可能只能通过属性观察来实现一套自己的类似替代了。结合泛型和闭包这些 Swift 的先进特性 (当然是相对于 Objective-C 来说的先进特性)，把 API 做得比原来的 KVO 更优雅其实不是一件难事。Observable-Swift 就利用了这个思路实现了一套对 Swift 类型进行观察的机制，如果您也有类似的需求，不妨可以参考看看。

*/

