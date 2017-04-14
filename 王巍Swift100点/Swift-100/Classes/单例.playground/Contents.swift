//: Playground - noun: a place where people can play

import UIKit

//单例是一个在 Cocoa 中很常用的模式了。对于一些希望能在全局方便访问的实例，或者在 app 的生命周期中只应该存在一个的对象，我们一般都会使用单例来存储和访问。在 Objective-C 中单例的公认的写法类似下面这样：
/*
@implementation MyManager
+ (id)sharedManager {
    static MyManager * staticInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
    staticInstance = [[self alloc] init];
    });
    return staticInstance;
}
@end
 */


//使用 GCD 中的 dispatch_once_t 可以保证里面的代码只被调用一次，以此保证单例在线程上的安全。

//因为在 Swift 中可以无缝直接使用 GCD，所以我们可以很方便地把类似方式的单例用 Swift 进行改写：

class MyManager {
    class var sharedManager : MyManager {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var staticInstance : MyManager? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.staticInstance = MyManager()
        }
        
        return Static.staticInstance!
    }
}
//因为 Swift 1.2 之前并不支持存储类型的类属性，所以我们需要使用一个 struct 来存储类型变量。

//这样的写法当然没什么问题，但是在 Swift 里我们其实有一个更简单的保证线程安全的方式，那就是 let。把上面的写法简化一下，可以变成：
/*
class MyManager {
    class var sharedManager : MyManager {
        struct Static {
            static let sharedInstance : MyManager = MyManager()
        }
        
        return Static.sharedInstance
    }
}
//还有另一种更受大家欢迎，并被认为是 Swift 1.2 之前的最佳实践的做法。由于 Swift 1.2 之前 class 不支持存储式的 property，我们想要使用一个只存在一份的属性时，就只能将其定义在全局的 scope 中。值得庆幸的是，在 Swift 中是有访问级别的控制的，我们可以在变量定义前面加上 private 关键字，使这个变量只在当前文件中可以被访问。这样我们就可以写出一个没有嵌套的，语法上也更简单好看的单例了：

private let sharedInstance = MyManager()

class MyManager  {
    class var sharedManager : MyManager {
        return sharedInstance
    }
}
 */

//Swift 1.2 中的改进

//Swift 1.2 之前还不支持例如 static let 和 static var 这样的存储类变量。但是在 1.2 中 Swift 添加了类变量的支持，因此单例可以进一步简化。
将上面全局的 sharedInstance 拿到 class 中，这样结构上就更紧凑和合理了。
//在 Swift 1.2 以及之后，如果没有特别的需求，我们推荐使用下面这样的方式来写一个单例：
/*
class MyManager  {
    static let sharedInstance = MyManager()
    private init() {}
}
 */
//这种写法不仅简洁，而且保证了单例的独一无二。在初始化类变量的时候，Apple 将会把这个初始化包装在一次 swift_once_block_invoke 中，以保证它的唯一性。另外，我们在这个类型中加入了一个私有的初始化方法，来覆盖默认的公开初始化方法，这让项目中的其他地方不能够通过 init 来生成自己的 MyManager 实例，也保证了类型单例的唯一性。如果你需要的是类似 defaultManager 的形式的单例 (也就是说这个类的使用者可以创建自己的实例) 的话，可以去掉这个私有的 init 方法。

