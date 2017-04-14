//: Playground - noun: a place where people can play

import UIKit

//我们一再强调，如果遵循规则的话，Swift 会是一门相当安全的语言：不会存在类型的疑惑，绝大多数的内容应该能在编译期间就唯一确定。但是不论是 Objective-C 里很多开发者早已习惯的灵活性，还是在程序世界里总是千变万化的需求，都不可能保证一成不变。我们有时候也需要引入一定的动态特性。而其中最为基本但却是最为有用的技巧是获取任意一个实例类型。

//在 Objective-C 中我们可以轻而易举地做到这件事，使用 -class 方法就可以拿到对象的类，我们甚至可以用 NSStringFromClass 将它转换为一个能够打印出来的字符串：
//
//NSDate *date = [NSDate date];
//NSLog(@"%@",NSStringFromClass([date class]));
// 输出：
// __NSDate
//在 Swift 中，我们会发现不管是纯 Swift 的 class 还是 NSObject 的子类，都没有像原来那样的 class() 方法来获取类型了。对于 NSObject 的子类，因为其实类的信息的存储方式并没有发生什么大的变化，因此我们可以求助于 Objective-C 的运行时，来获取类并按照原来的方式转换：

//let date = NSDate()
//let name: AnyClass! = object_getClass(date)
//print(name)
// 输出：
// __NSDate
//其中 object_getClass 是一个定义在 ObjectiveC 的 runtime 中的方法，它可以接受任意的 AnyObject! 并返回它的类型 AnyClass! (注意这里的叹号，它表明我们甚至可以输入 nil，并期待其返回一个 nil)。在 Swift 中其实为了获取一个 NSObject 或其子类的对象的实际类型，对这个调用其实有一个好看一些的写法，那就是 dynamicType。上面的代码用一种 "更 Swift" 一些的语言转换一下，会是这个样子：

//let date = NSDate()
//let name = date.dynamicType
//print(name)
// 输出：
// __NSDate
//很好，似乎我们的问题能解决了。但是仔细想想，我们上面用的都是 Objective-C 的动态特性，要是换成一个 Swift 内建类型的话，会怎么样呢？比如原生的 String，

let string = "Hello"
let name = string.dynamicType
print(name)
// 输出：
// String
//可以看到对于 Swift 的原生类型，这种方式也是可行的。(值得指出的是，其实这里的真正的类型名字还带有 module 前缀，也就是 Swift.String。直接 print 只是调用了 CustomStringConvertible 中的相关方法而已，你可以使用 debugPrint 来进行确认。关于更多地关于 print 和 debugPrint 的细节，可以参考 print 和 debugPrint 一节的内容。)

//在 Swift 1.2 之前，直接对 Swift 内建的非 AnyObject 类型使用 .dynamicType 可能会导致编译错误或者无法得到正确结果。但是随着 Swift 不断完善和改进，现在我们已经可以统一地使用 .dynamicType 来获取一个对象的类型了。
