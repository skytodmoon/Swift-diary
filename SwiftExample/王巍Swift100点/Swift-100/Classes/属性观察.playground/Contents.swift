//: Playground - noun: a place where people can play

import UIKit

//属性观察 (Property Observers) 是 Swift 中一个很特殊的特性，利用属性观察我们可以在当前类型内监视对于属性的设定，并作出一些响应。Swift 中为我们提供了两个属性观察的方法，它们分别是 willSet 和 didSet。

//使用这两个方法十分简单，我们只要在属性声明的时候添加相应的代码块，就可以对将要设定的值和已经设置的值进行监听了：

class MyClass {
    var date: NSDate {
        willSet {
            let d = date
            print("即将将日期从 \(d) 设定至 \(newValue)")
        }
        
        didSet {
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }
    
    init() {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.dateByAddingTimeInterval(10086)

// 输出
// 即将将日期从 2014-08-23 12:47:36 +0000 设定至 2014-08-23 15:35:42 +0000
// 已经将日期从 2014-08-23 12:47:36 +0000 设定至 2014-08-23 15:35:42 +0000

//在 willSet 和 didSet 中我们分别可以使用 newValue 和 oldValue 来获取将要设定的和已经设定的值。属性观察的一个重要用处是作为设置值的验证，比如上面的例子中我们不希望 date 超过当前时间的一年以上的话，我们可以将 didSet 修改一下：

/*
class MyClass {
    let oneYearInSecond: NSTimeInterval = 365 * 24 * 60 * 60
    var date: NSDate {
        
        //...
        
        didSet {
            if (date.timeIntervalSinceNow > oneYearInSecond) {
                print("设定的时间太晚了！")
                date = NSDate().dateByAddingTimeInterval(oneYearInSecond)
            }
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }
    
    //...
}
*/

