//: Playground - noun: a place where people can play

import UIKit

//从 WWDC 14 的 Keynote 上 Chris 的演示就能看出 Playground 异常强大，但是从本质来说 Playground 的想法其实非常简单，就是提供一个可以即时编辑的类似 REPL 的环境。

//Playground 为我们提供了一个顺序执行的环境，在每次更改其中代码后整个文件会被重新编译，并清空原来的状态并运行。这个行为与测试时的单个测试用例有一些相似，因此有些时候在测试时我们会遇到的问题我们在 Playground 中也会遇到。

//其中最基础的一个就是异步代码的执行，比如这样的 NSTimer 在默认的 Playground 中是不会执行的：

class MyClass {
    @objc func callMe() {
        print("Hi")
    }
}

let object = MyClass()

NSTimer.scheduledTimerWithTimeInterval(1, target: object,
                                       selector: #selector(MyClass.callMe), userInfo: nil, repeats: true)
//关于 selector 的使用 和 @objc 标记可以分别参见 Selector 以及 @objc 和 dynamic。
//在执行完 NSTimer 语句之后，整个 Playground 将停止掉，Hi 永远不会被打印出来。放心，这种异步的操作没有生效并不是因为你写错了什么，而是 Playground 在执行完了所有语句，然后正常退出了而已。

//为了使 Playground 具有延时运行的本领，我们需要引入 Playground 的 “扩展包” XCPlayground 框架。现在这个框架中包含了几个与 Playground 的行为交互以及控制 Playground 特性的 API，其中就包括使 Playground 能延时执行的黑魔法，XCPlaygroundPage 和 needsIndefiniteExecution。

//我们只需要在刚才的代码上面加上：

import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//就可以看到 Hi 以每秒一次的频率被打印出来了。

//在实际使用和开发中，我们最经常面临的异步需求可能就是网络请求了，如果我们想要在 Playground 里验证某个 API 是否正确工作的话，使用 XCPlayground 的这个方法开启延时执行也是必要的：

let url = NSURL(string: "http://httpbin.org/get")!

let getTask = NSURLSession.sharedSession().dataTaskWithURL(url) {
    (data, response, error) -> Void in
    let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
    
    print(dictionary)
}

getTask.resume()
//延时运行也是有限度的。如果你足够有耐心，会发现在第一个例子中的 NSTimer 每秒打印一次的 Hi 的计数最终会停留在 30 次。这是因为即使在开启了持续执行的情况下，Playground 也不会永远运行下去，默认情况下它会在顶层代码最后一句运行后 30 秒的时候停止执行。这个时间长度对于绝大多数的需求场景来说都是足够的了，但是如果你想改变这个时间的话，可以通过 Alt + Cmd + 回车 来打开辅助编辑器。在这里你会看到控制台输出和时间轴，将右下角的 30 改成你想要的数字，就可以对延时运行的最长时间进行设定了。

//之前的像是 GCD 和延时调用这样的章节中也涉及到了延时运行，你可以将这里的技巧应用到之前的示例代码上，这样你就可以在 Playground 中得到正确的结果了。
