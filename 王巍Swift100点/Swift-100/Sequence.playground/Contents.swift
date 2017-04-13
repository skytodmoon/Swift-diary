//: Playground - noun: a place where people can play

import Cocoa

//Swift 的 for...in 可以用在所有实现了 SequenceType 的类型上，而为了实现 SequenceType 你首先需要实现一个 GeneratorType。比如一个实现了反向的 generator 和 sequence 可以这么写：

// 先定义一个实现了 GeneratorType protocol 的类型
// GeneratorType 需要指定一个 typealias Element
// 以及提供一个返回 Element? 的方法 next()
class ReverseGenerator<T>: GeneratorType {
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0{
            return nil
        }
        else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

// 然后我们来定义 SequenceType
// 和 GeneratorType 很类似，不过换成指定一个 typealias Generator
// 以及提供一个返回 Generator? 的方法 generate()
struct ReverseSequence<T>: SequenceType {
    var array: [T]
    
    init (array: [T]) {
        self.array = array
    }
    
    typealias Generator = ReverseGenerator<T>
    func generate() -> Generator {
        return ReverseGenerator(array: self.array)
    }
}

let arr = [0,1,2,3,4]

// 对 SequenceType 可以使用 for...in 来循环访问
for i in ReverseSequence(array: arr) {
    print("Index \(i) is \(arr[i])")
}

//如果我们想要深究 for...in 这样的方法到底做了什么的话，如果我们将其展开，大概会是下面这个样子：

var g = array.generate()
while let obj = g.next() {
    print(obj)
}

//顺便你可以免费得到的收益是你可以使用像 map , filter 和 reduce 这些方法，因为 SequenceType 接口扩展 (protocol extension) 已经实现了它们：

extension SequenceType {
    func map<T>(@noescape transform: (Self.Generator.Element) -> T) -> [T]
    func filter(@noescape includeElement: (Self.Generator.Element) -> Bool)
        -> [Self.Generator.Element]
    func reduce<T>(initial: T,
                @noescape combine: (T, Self.Generator.Element) -> T) -> T



