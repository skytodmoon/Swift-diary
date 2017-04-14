//: Playground - noun: a place where people can play

import UIKit

//因为 Playground 不进行特别配置的话是无法在线程中进行调度的，因此本节中的示例代码需要在 Xcode 项目环境中运行。在 Playground 中可能无法得到正确的结果。
//GCD 是一种非常方便的使用多线程的方式。通过使用 GCD，我们可以在确保尽量简单的语法的前提下进行灵活的多线程编程。在 “复杂必死” 的多线程编程中，保持简单就是避免错误的金科玉律。好消息是在 Swift 中是可以无缝使用 GCD 的 API 的，而且得益于闭包特性的加入，使用起来比之前在 Objective-C 中更加简单方便。在这里我不打算花费很多时间介绍 GCD 的语法和要素，如果这么做的话就可以专门为 GCD 写上一节了。在下面我给出了一个日常里最通常会使用到的例子 (说这个例子能覆盖到日常的 GCD 使用的 50% 以上也不为过)，来展示一下 Swift 里的 GCD 调用会是什么样子：

// 创建目标队列
let workingQueue = dispatch_queue_create("my_queue", nil)

// 派发到刚创建的队列中，GCD 会负责进行线程调度
dispatch_async(workingQueue) {
    // 在 workingQueue 中异步进行
    print("努力工作")
    NSThread.sleepForTimeInterval(2)  // 模拟两秒的执行时间
    
    dispatch_async(dispatch_get_main_queue()) {
        // 返回到主线程更新 UI
        print("结束工作，更新 UI")
    }
}
//因为 UIKit 是只能在主线程工作的，如果我们在主线程进行繁重的工作的话，就会导致 app 出现 “卡死” 的现象：UI 不能更新，用户输入无法响应等等，是非常糟糕的用户体验。为了避免这种情况的出现，对于繁重 (如图像加滤镜等) 或会很长时间才能完成的 (如从网络下载图片) 处理，我们应该把它们放到后台线程进行，这样在用户看来 UI 还是可以交互的，也不会出现卡顿。在工作进行完成后，我们需要更新 UI 的话，必须回到主线程进行 (牢记 UI 相关的工作都需要在主线程执行，否则可能发生不可预知的错误)。

//在日常的开发工作中，我们经常会遇到这样的需求：在 xx 秒后执行某个方法。比如切换界面 2 秒后开始播一段动画，或者提示框出现 3 秒后自动消失等等。以前在 Objective-C 中，我们可以使用一个 NSObject 的实例方法，-performSelector:withObject:afterDelay: 来指定在若干时间后执行某个 selector。在 Swift 2 之前，如果你新建一个 Swift 的项目，并且试图使用这个方法 (或者这个方法的其他一切变形) 的话，会发现这个方法并不存在。在 Swift 2 中虽然这一系列 performSelector 的方法被加回了标准库，但是由于 Swift 中创建一个 selector 并不是一件安全的事情 (你需要通过字符串来创建，这在之后代码改动时会很危险)，所以最好尽可能的话避免使用这个方法。另外，原来的 performSelector: 这套东西在 ARC 下并不是安全的。ARC 为了确保参数在方法运行期间的存在，在无法准确确定参数内存情况的时候，会将输入参数在方法开始时先进行 retain，然后在最后 release。而对于 performSelector: 这个方法我们并没有机会为被调用的方法指定参数，于是被调用的 selector 的输入有可能会是指向未知的垃圾内存地址，然后...HOHO，要命的是这种崩溃还不能每次重现，想调试？见鬼去吧..

//但是如果不论如何，我们都还想继续做延时调用的话应该怎么办呢？最容易想到的是使用 NSTimer 来创建一个若干秒后调用一次的计时器。但是这么做我们需要创建新的对象，和一个本来并不相干的 NSTimer 类扯上关系，同时也会用到 Objective-C 的运行时特性去查找方法等等，总觉着有点笨重。其实 GCD 里有一个很好用的延时调用我们可以加以利用写出很漂亮的方法来，那就是 dispatch_after。最简单的使用方法看起来是这样的：

let time: NSTimeInterval = 2.0
let delay = dispatch_time(DISPATCH_TIME_NOW,
                          Int64(time * Double(NSEC_PER_SEC)))
dispatch_after(delay, dispatch_get_main_queue()) {
    print("2 秒后输出")
}
//代码非常简单，并没什么值得详细说明的。只是每次写这么多的话也挺累的，在这里我们可以稍微将它封装的好用一些，最好再加上取消的功能。在 iOS 8 中 GCD 得到了惊人的进化，现在我们可以通过将一个 dispatch_block_t 对象传递给 dispatch_block_cancel，来取消一个正在等待执行的 block。取消一个任务这样的特性，这在以前是 NSOperation 的专利，但是现在我们使用 GCD 也能达到同样的目的了。这里我们将类似地来尝试实现 delay call 的取消，整个封装也许有点长，但我还是推荐一读。大家也可以把它当作练习材料检验一下自己的 Swift 基础语法的掌握和理解的情况：

import Foundation

typealias Task = (cancel : Bool) -> Void

func delay(time:NSTimeInterval, task:()->()) ->  Task? {
    
    func dispatch_later(block:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(time * Double(NSEC_PER_SEC))),
            dispatch_get_main_queue(),
            block)
    }
    
    var closure: dispatch_block_t? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                dispatch_async(dispatch_get_main_queue(), internalClosure);
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(cancel: false)
        }
    }
    
    return result;
}

func cancel(task:Task?) {
    task?(cancel: true)
}
//使用的时候就很简单了，我们想在 2 秒以后干点儿什么的话：

delay(2) { print("2 秒后输出") }
//想要取消的话，我们可以先保留一个对 Task 的引用，然后调用 cancel：

let task = delay(5) { print("拨打 110") }

// 仔细想一想..
// 还是取消为妙..
cancel(task)
