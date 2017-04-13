//: Playground - noun: a place where people can play

import UIKit

/*
 @selector 是 Objective-C 时代的一个关键字，它可以将一个方法转换并赋值给一个 SEL 类型，它的表现很类似一个动态的函数指针。在 Objective-C 时 selector 非常常用，从设定 target-action，到自举询问是否响应某个方法，再到指定接受通知时需要调用的方法等等，都是由 selector 来负责的。在 Objective-C 里生成一个 selector 的方法一般是这个样子的：

-(void) callMe {
    //...
}

-(void) callMeWithParam:(id)obj {
    //...
}

SEL someMethod = @selector(callMe);
SEL anotherMethod = @selector(callMeWithParam:);

// 或者也可以使用 NSSelectorFromString
// SEL someMethod = NSSelectorFromString(@"callMe");
// SEL anotherMethod = NSSelectorFromString(@"callMeWithParam:");
 
*/

//一般为了方便，很多人会选择使用 @selector，但是如果要追求灵活的话，可能会更愿意使用 NSSelectorFromString 的版本 -- 因为我们可以在运行时动态生成字符串，从而通过方法的名字来调用到对应的方法。

//在 Swift 中没有 @selector 了，取而代之，从 Swift 2.2 开始我们使用 #selector 来从暴露给 Objective-C 的代码中获取一个 selector。类似地，在 Swift 里对应原来 SEL 的类型是一个叫做 Selector 的结构体。像上面的两个例子在 Swift 中等效的写法是：
/*
func callMe() {
    //...
}

func callMeWithParam(obj: AnyObject!) {
    //...
}

let someMethod = #selector(callMe)
let anotherMethod = #selector(callMeWithParam(_:))
*/
//和 Objective-C 时一样，记得在 callMeWithParam 后面加上冒号 (:)，这才是完整的方法名字。多个参数的方法名也和原来类似，是这个样子：
/*
func turnByAngle(theAngle: Int, speed: Float) {
    //...
}
*/
//let method = #selector(turnByAngle(_:speed:))
//最后需要注意的是，selector 其实是 Objective-C runtime 的概念，如果你的 selector 对应的方法只在 Swift 中可见的话 (也就是说它是一个 Swift 中的 private 方法)，在调用这个 selector 时你会遇到一个 unrecognized selector 错误：
/*
这是错误代码

private func callMe() {
    //...
}
NSTimer.scheduledTimerWithTimeInterval(1, target: self,
                                       selector:#selector(callMe), userInfo: nil, repeats: true)
//正确的做法是在 private 前面加上 @objc 关键字，这样运行时就能找到对应的方法了。

@objc private func callMe() {
    //...
}

NSTimer.scheduledTimerWithTimeInterval(1, target: self,
                                       selector:#selector(callMe), userInfo: nil, repeats: true)
//最后，值得一提的是，如果方法名字在方法所在域内是唯一的话，我们可以简单地只是用方法的名字来作为 #selector 的内容。相比于前面带有冒号的完整的形式来说，这么写起来会方便一些：

let someMethod = #selector(callMe)
let anotherMethod = #selector(callMeWithParam)
let method = #selector(turnByAngle)
 */
//但是，如果在同一个作用域中存在同样名字的两个方法，即使它们的函数签名不相同，Swift 编译器也不允许编译通过：
/*
func commonFunc() {
    
}

func commonFunc(input: Int) -> Int {
    return input
}

let method = #selector(commonFunc)
// 编译错误，`commonFunc` 有歧义
//对于这种问题，我们可以通过将方法进行强制转换来使用：

let method1 = #selector(commonFunc as ()->())
let method2 = #selector(commonFunc as Int->Int)
 
*/
