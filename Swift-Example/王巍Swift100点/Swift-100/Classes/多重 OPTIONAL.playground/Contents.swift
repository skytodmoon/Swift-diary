//: Playground - noun: a place where people can play

import UIKit

//Optional 可以说是 Swift 的一大特色，它完全解决了 “有” 和 “无” 这两个困扰了 Objective-C 许久的哲学概念，也使得代码安全性得到了很大的增加。但是一个陷阱 -- 或者说一个很容易让人迷惑的概念 -- 也随之而来，那就是多重的 Optional。

//在深入讨论之前，可以让我们先看看 Optional 是什么。很多读者应该已经知道，我们使用的类型后加上 ? 的语法只不过是 Optional 类型的语法糖，而实际上这个类型是一个 enum：
/*
enum Optional<T> : _Reflectable, NilLiteralConvertible {
    case None
    case Some(T)
    
    //...
}
 */
//在这个定义中，对 T 没有任何限制，也就是说，我们是可以在 Optional 中装入任意东西的，甚至也包括 Optional 对象自身。打个形象的比方，如果我们把 Optional 比作一个盒子，实际具体的 String 或者 Int 这样的值比作糖果的话，当我们打开一个盒子 (unwrap) 时，可能的结果会有三个 -- 空气，糖果，或者另一个盒子。

//空气和糖果都很好理解，也十分直接。但是对于盒子中的盒子，有时候使用时就相当容易出错。特别是在和各种字面量转换混用的时候需要特别注意。

//对于下面这种形式的写法：

var string: String? = "string"
var anotherString: String?? = string
//我们可以很明白地知道 anotherString 是 Optinal<Optional<String>>。但是除开将一个 Optional 值赋给多重 Optional 以外，我们也可以将直接的字面量值赋给它：


var literalOptional: String?? = "string"
//这种情况还好，根据类型推断我们只能将 Optional<String> 放入到 literalOptional 中，所以可以猜测它与上面提到的 anotherString 是等效的。但是如果我们是将 nil 赋值给它的话，情况就有所不同了。考虑下面的代码：

var aNil: String? = nil

var anotherNil: String?? = aNil
var literalNil: String?? = nil
//anotherNil 和 literalNil 是不是等效的呢？答案是否定的。anotherNil 是盒子中包了一个盒子，打开内层盒子的时候我们会发现空气；但是 literalNil 是盒子中直接是空气。使用中一个最显著的区别在于：

if let a = anotherNil {
    print("anotherNil")
}

if let b = literalNil {
    print("literalNil")
}
//这样的代码只能输出 anotherNil。

//另一个值得注意的地方时在Playground 中运行时，或者在用 lldb 进行调试时，直接使用 po 指令打印 Optional 值的话，为了看起来方便，lldb 会将要打印的 Optional 进行展开。如果我们直接打印上面的 anotherNil 和 literalNil，得到的结果都是 nil：

(lldb) po anotherNil
nil

(lldb) po literalNil
nil
//如果我们遇到了多重 Optional 的麻烦的时候，这显然对我们是没有太大帮助的。我们可以使用 fr v -R 命令来打印出变量的未加工过时的信息，就像这样：

(lldb) fr v -R anotherNil
(Swift.Optional<Swift.Optional<Swift.String>>)
anotherNil = Some {
    ... 中略
}
(lldb) fr v -R literalNil
(Swift.Optional<Swift.Optional<Swift.String>>)
literalNil = None {
    ... 中略
}
//这样我们就能清晰地分辨出两者的区别了。






