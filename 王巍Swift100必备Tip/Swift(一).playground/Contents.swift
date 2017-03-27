import UIKit

//柯里化(Currying)

/**
 * Swift 里可以将方法进行柯里化 (Currying)，这是也就是把接受多个参数的方法进行一些变形，使其更加灵活的方法。函数式的编程思想贯穿于 Swift 中，而函数的柯里化正是这门语言函数式特点的重要表现
 */

func addOne(num:Int) -> Int{
    return num + 1
}

func addTo(adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

let addTwo = addTo(2)    // addTwo: Int -> Int
let result = addTwo(6)   // result = 8”

func addTo2(adder: Int) -> (Int) -> Int{
    return{
        num in
        
        return num + adder
    }
}

let addTwo2 = addTo(2)
let result2 = addTwo(6)


//比较函数的大小

func greaterThan(_ comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer}
}
let greaterThan10 = greaterThan(10);

greaterThan(13)
greaterThan(9)

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T:AnyObject>: TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() {
        if let t = target{
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
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

//将 protocol 的方法声明为 mutating

/**
 *  Swift 的 protocol 不仅可以被 class 类型实现，也适用于 struct 和 enum。因为这个原因，我们在写给别人用的协议时需要多考虑是否使用 mutating 来修饰方法，比如定义为 mutating func myMethod()。Swift 的 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，所以如果你没在协议方法里写 mutating 的话，别人如果用 struct 或者 enum 来实现这个协议的话，就不能在方法里改变自己的变量了。比如下面的代码
 */


protocol Vehicel {
    var numberOfWheels: Int{get}
    var color: UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar2: Vehicel {
    let numberOfWheels = 4
    var color = UIColor.blueColor()
    
    mutating func changeColor() {
        color = UIColor.redColor()
    }
}

//多元祖

func swapMel<T>(inout a: T,inout b: T) {
    let temp = a
    a = b
    b = temp
}

func swapMel2<T>(inout a: T,inout b: T) {
    (a,b) = (b,a)
}

//autoclosure 和 ??

func logIfTrue(predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}


















