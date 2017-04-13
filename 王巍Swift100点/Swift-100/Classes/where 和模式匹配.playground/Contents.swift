//: Playground - noun: a place where people can play

import UIKit

//where 关键字在 Swift 中非常强大，但是往往容易被忽视。在这一节中，我们就来整理看看 where 有哪些使用场合吧。

//首先是 switch 语句中，我们可以使用 where 来限定某些条件 case：

let name = ["王小二","张三","李四","王二小"]

name.forEach {
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x)是笔者本家")
    default:
        print("你好，\($0)")
    }
}

// 输出：
// 王小二是笔者本家
// 你好，张三
// 你好，李四
// 王二小是笔者本家”

//这可以说是模式匹配的标准用法，对 case 条件进行限定可以让我们更灵活地使用 switch 语句。

//在 if let 或者是 for 中我们也可以使用 where 来做类似的条件限定：

let num: [Int?] = [48, 99, nil]
num.forEach {
    if let score = $0 where score > 60 {
        print("及格啦 - \(score)")
    } else {
        print(":(")
    }
}
// 输出：
// :(
// 及格啦 - 99
// :(

for score in num where score > 60 {
    print("及格啦 - \(score)")
}
// 输出：
// 及格啦 - Optional(99)
//这两种使用的方式都可以用额外的 if 来替代，这里只不过是让我们的代码更加易读了。也有一些场合是只有使用 where 才能准确表达的，比如我们在泛型中想要对方法的类型进行限定的时候。比如在标准库里对 RawRepresentable 接口定义 […]”

//在 Swift 2.0 中，引入了 protocol extension。在有些时候，我们会希望一个接口扩展的默认实现只在某些特定的条件下适用，这时我们就可以用 where 关键字来进行限定。标准库中的接口扩展大量使用了这个技术来进行限定，比如 SequenceType 的 sort 方法就被定义在这样一个类型限制的接口扩展中：
/*
extension SequenceType where Self.Generator.Element : Comparable {
    public func sort() -> [Self.Generator.Element]
}
 */
//很自然，如果 SequenceType (比如一个 Array) 中的元素是不可比较的，那么 sort 方法自然也就不能适用了：

//let sortableArray: [Int] = [3,1,2,4,5]
//let unsortableArray: [AnyObject?] = ["Hello", 4, nil]
//
//sortableArray.sort()
//// [1,2,3,4,5]
//
//unsortableArray.sort()
// 无法编译
// note: expected an argument list of type
// '(@noescape (Self.Generator.Element, Self.Generator.Element) -> Bool)'
// 这意味着 Swift 尝试使用带有闭包的 `sort` 方法，并期望你输入一种排序方式”


