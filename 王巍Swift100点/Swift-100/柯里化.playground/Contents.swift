//: Playground - noun: a place where people can play

import Cocoa

//Swift 里可以将方法进行柯里化 (Currying)，这是也就是把接受多个参数的方法进行一些变形，使其更加灵活的方法。函数式的编程思想贯穿于 Swift 中，而函数的柯里化正是这门语言函数式特点的重要表现。

func addOne(num: Int) -> Int {
    return num + 1
}

//这个函数所表达的内容非常有限，如果我们之后还需要一个将输入数字加 2，或者加 3 的函数，可能不得不类似地去定义返回为 num + 2 或者 num + 3 的版本。有没有更通用的方法呢？我们其实可以定义一个通用的函数，它将接受需要与输入数字相加的数，并返回一个函数。返回的函数将接受输入数字本身，然后进行操作：

func addTo(adder: Int) -> Int -> Int {
    return {
        num in
        return num + adder
    }
}

//有了 addTo，我们现在就能轻易写出像是 addOne 或者 addTwo 这样的函数了：

let addTwo = addTo(2)    // addTwo: Int -> Int
let result = addTwo(6)   // result = 8

//再举一个例子，我们可以创建一个比较大小的函数：
func greaterThan(comparer: Int) -> Int -> Bool {
    return { $0 > comparer }
}

let greaterThan10 = greaterThan(10);

greaterThan10(13)    // => true
greaterThan10(9)     // => false

//柯里化是一种量产相似方法的好办法，可以通过柯里化一个方法模板来避免写出很多重复代码，也方便了今后维护。

//举一个实际应用时候的例子，在 Selector 一节中，我们提到了在 Swift 中 Selector 只能使用字符串在生成。这面临一个很严重的问题，就是难以重构，并且无法在编译期间进行检查，其实这是十分危险的行为。但是 target-action 又是 Cocoa 中如此重要的一种设计模式，无论如何我们都想安全地使用的话，应该怎么办呢？一种可能的解决方式就是利用方法的柯里化。Ole Begemann 在这篇帖子里提到了一种很好封装，这为我们如何借助柯里化，安全地改造和利用 target-action 提供了不少思路。

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>:
TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
    // ...
}


class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T,
                   action: (T) -> () -> (),
                   controlEvent: ControlEvent) {
        
        actions[controlEvent] = TargetActionWrapper(
            target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}


