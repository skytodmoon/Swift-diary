//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"在程序界，很多小伙伴都会对研究排序算法情有独钟，并且试图将排序执行的过程可视化，以便让大家更清晰直观地了解算法步骤。有人把可视化排序做得很正统明了，也有人把它做到了艺术层次。

//想在 Cocoa 中做一个可视化的排序算法演示可不是一件容易的事情，很可能你会需要一套绘制图形的框架，并且考虑如何在屏幕上呈现每一步的过程。但是在 Playground 中事情就变得简单多了：我们可以使用 XCPlayground 框架的 XCPCaptureValue 方法来将一组数据轻而易举地绘制到时间轴上，从而让我们能看到每一步的结果。这不仅对我们直观且及时地了解算法内部的变化很有帮助，也会是教学或者演示时候的神兵利器。

//XCPCaptureValue 的使用方法很简单，在 import XCPlayground 导入框架后，可以找到该方法的定义：
//
//func XCPCaptureValue<T>(identifier: String, value: T)
//我们可以多次调用该方法来做图，相同的 identifier 的数据将会出现在同一张图上，而 value 将根据输入的次序进行排列。举一个完整的例子来说明会比较快，比如下面的代码实现了简单的冒泡排序，我们在每一轮排序完成后使用 plot 方法将当前的数组状态用 XCPCaptureValue 的方式进行了输出。通过在时间轴 (通过 “Alt+Cmd+回车” 打开 Assistant Editor) 的输出图，我们就可以非常清楚地了解到整个算法的执行过程了。

import XCPlayground

var arr = [14, 11, 20, 1, 3, 9, 4, 15, 6, 19,
           2, 8, 7, 17, 12, 5, 10, 13, 18, 16]

func plot<T>(title: String, array: [T]) {
    for value in array {
        XCPCaptureValue(title, value: value)
    }
}

plot("起始", array: arr)

func swap(inout x: Int, inout y: Int) {
    (x, y) = (y, x)
}

func bubbleSort<T: Comparable>(inout input: [T]) {
    
    for i in 0 ..< input.count - 1 {
        let i = input.count - i
        var didSwap = false
        for j in 0 ..< i - 1 {
            if input[j] > input[j + 1] {
                didSwap = true
                swap(&input[j], &input[j + 1])
            }
        }
        if !didSwap {
            break
        }
        
        plot("第 \(input.count - (i - 1)) 次迭代", array: input)
    }
    plot("结果", array: input)
}

bubbleSort(&arr)
//因为 XCPCaptureValue 的数据输入是任意类型的，所以不论是传什么进去都是可以表示的。它们将以 QuickLook 预览的方式被表现出来，一些像 UIImage，UIColor 或者 UIBezierPath 这样的类型已经实现了 QuickLook。当然对于那些没有实现快速预览的 NSObject 子类，也可以通过重写

//func debugQuickLookObject() -> AnyObject?
//来提供一个预览输出。在上面的冒泡排序方法中，我们可以接收任意满足 Comparable 的数组，而绘图方法也可以接受任意类型的输入。作为练习，可以试试看把 arr 的全部数字都换成一些随机的字符串看看时间轴的输出是什么样子吧。

