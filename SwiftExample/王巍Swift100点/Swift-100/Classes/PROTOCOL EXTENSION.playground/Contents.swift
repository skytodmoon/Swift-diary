//: Playground - noun: a place where people can play

import UIKit

//Swift 2 中引入了一个非常重要的特性，那就是 protocol extension。在 Swift 1.x 中，extension 仅只能作用在实际的类型上 (也就是 class, struct 等等)，而不能扩展一个 protocol。在 Swift 中，标准库的功能基本都是基于 protocol 来实现的，举个最简单的例子，我们每天使用的 Array 就是遵守了 CollectionType 这个 protocol 的。CollectionType 可以说是 Swift 中非常重要的接口，除了 Array 以外，像是 Dictionary 和 Set 也都实现了这个接口所定义的内容。

//在 protocol 不能被扩展的时候，当我们想要为实现了某个接口的所有类型添加一些另外的共通的功能时，会非常麻烦。一个很好的例子是 Swift 1.x 时像是 map 或者 filter 这样的函数。大体来说，我们有两种思路进行添加：第一种方式是在接口中定义这个方法，然后在所有实现了这个接口的类型中都去实现一遍。每有一个这样的类型，我们就需要写一份类似甚至相同的方法，这显然是不可取的，不仅麻烦，而且完全没有可维护性。另一种方法是在全局范围实现一个接受该 protocol 的实例的方法，相比于前一种方式，我们只需要维护一份代码，显然要好不少，但是缺点在于在全局作用域中引入了只和特定 protocol 有关的东西，这并不符合代码设计的美学。作为妥协，Apple 在 Swift 1.x 中采用的是后一种，也就是全局方法，如果你尝试寻找的话，可以在 Swift 1.x 的标准库的全局 scope 中找到像是 map 和 filter 这样的方法。

//在 Swift 2 中这个问题被彻底解决了。现在我们可以对一个已有的 protocol 进行扩展，而扩展中实现的方法将作为实现扩展的类型的默认实现。也就是说，假设我们有下面的 protocol 声明，以及一个对该接口的扩展：

protocol MyProtocol {
    func method()
}

extension MyProtocol {
    func method() {
        print("Called")
    }
}

//在具体的实现这个接口的类型中，即使我们什么都不写，也可以编译通过。进行调用的话，会直接使用 extension 中的实现：

struct MyStruct: MyProtocol {
    
}

MyStruct().method()
// 输出：
// Called in extension

//当然，如果我们需要在类型中进行其他实现的话，可以像以前那样在具体类型中添加这个方法：
/*
struct MyStruct: MyProtocol {
    func method() {
        print("Called in struct")
    }
}

MyStruct().method()
// 输出：
// Called in struct
*/


//也就是说，protocol extension 为 protocol 中定义的方法提供了一个默认的实现。有了这个特性以后，之前被放在全局环境中的接受 CollectionType 的 map 方法，就可以被移动到 CollectionType 的接口扩展中去了：
/*
extension CollectionType {
    public func map<T>(@noescape transform: (Self.Generator.Element) -> T) -> [T]
    //...
}
 */
//在日常开发中，另一个可以用到 protocol extension 的地方是 optional 的接口方法。通过提供 protocol 的 extension，我们为 protocol 提供了默认实现，这相当于变相将 protocol 中的方法设定为了 optional。关于这个，我们在可选接口和接口扩展一节中已经讲述过，就不再重复了。

//对于 protocol extension 来说，有一种会非常让人迷惑的情况，就是在接口的扩展中实现了接口里没有定义的方法时的情况。举个例子，比如我们定义了这样的一个接口和它的一个扩展：

protocol A1 {
    func method1() -> String
}

struct B1: A1 {
    func method1() -> String {
        return "hello"
    }
}
//在使用的时候，无论我们将实例的类型为 A1 还是 B1，因为实现只有一个，所以没有任何疑问，调用方法时的输出都是 “hello”：

let b1 = B1() // b1 is B1
b1.method1()
// hello

let a1: A1 = B1()
// a1 is A1
a1.method1()
// hello
//但是如果在接口里只定义了一个方法，而在接口扩展中实现了额外的方法的话，事情就变得有趣起来了。考虑下面这组接口和它的扩展：

protocol A2 {
    func method1() -> String
}

extension A2 {
    func method1() -> String {
        return "hi"
    }
    
    func method2() -> String {
        return "hi"
    }
}
//扩展中除了实现接口定义的 method1 之外，还定义了一个接口中不存在的方法 method2。我们尝试来实现这个接口：

struct B2: A2 {
    func method1() -> String {
        return "hello"
    }
    
    func method2() -> String {
        return "hello"
    }
}
//B2 中实现了 method1 和 method2。接下来，我们尝试初始化一个 B2 对象，然后对这两个方法进行调用：

let b2 = B2()

b2.method1() // hello
b2.method2() // hello
//结果在我们的意料之中，虽然在 protocol extension 中已经实现了这两个方法，但是它们只是默认的实现，我们在具体实现接口的类型中可以对默认实现进行覆盖，这非常合理。但是如果我们稍作改变，在上面的代码后面继续添加：

let a2 = b2 as A2

a2.method1() // hello
a2.method2() // hi
//a2 和 b2 是同一个对象，只不过我们通过 as 告诉编译器我们在这里需要的类型是 A2。但是这时候在这个同样的对象上调用同样的方法调用却得到了不同的结果，发生了什么？

//我们可以看到，对 a2 调用 method2 实际上是接口扩展中的方法被调用了，而不是 a2 实例中的方法被调用。我们不妨这样来理解：对于 method1，因为它在 protocol 中被定义了，因此对于一个被声明为遵守接口的类型的实例 (也就是对于 a2) 来说，可以确定实例必然实现了 method1，我们可以放心大胆地用动态派发的方式使用最终的实现 (不论它是在类型中的具体实现，还是在接口扩展中的默认实现)；但是对于 method2 来说，我们只是在接口扩展中进行了定义，没有任何规定说它必须在最终的类型中被实现。在使用时，因为 a2 只是一个符合 A2 接口的实例，编译器对 method2 唯一能确定的只是在接口扩展中有一个默认实现，因此在调用时，无法确定安全，也就不会去进行动态派发，而是转而编译期间就确定的默认实现。

//也许在这个例子中你会觉得无所谓，因为实际中估计并不会有人将一个已知类型实例转回接口类型。但是要考虑到如果你的一些泛型 API 中有类似的直接拿到一个接口类型的结果的时候，调用它的扩展方法时就需要特别小心了：一般来说，如果有这样的需求的话，我们可以考虑将这个接口类型再转回实际的类型，然后进行调用。

//整理一下相关的规则的话：
/*
如果类型推断得到的是实际的类型
那么类型中的实现将被调用；如果类型中没有实现的话，那么接口扩展中的默认实现将被使用
如果类型推断得到的是接口，而不是实际类型
并且方法在接口中进行了定义，那么类型中的实现将被调用；如果类型中没有实现，那么接口扩展中的默认实现被使用
否则 (也就是方法没有在接口中定义)，扩展中的默认实现将被调用
*/



