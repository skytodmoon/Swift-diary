//: Playground - noun: a place where people can play

import UIKit

//虽然可能不太被重视，但类簇 (class cluster) 确实是 Cocoa 框架中广泛使用的设计模式之一。简单来说类簇就是使用一个统一的公共的类来订制单一的接口，然后在表面之下对应若干个私有类进行实现的方式。这么做最大的好处是避免的公开很多子类造成混乱，一个最典型的例子是 NSNumber：我们有一系列的不同的方法可以从整数，浮点数或者是布尔值来生成一个 NSNumber 对象，而实际上它们可能会是不同的私有子类对象：
/*
NSNumber * num1 = [[NSNumber alloc] initWithInt:1];
// __NSCFNumber

NSNumber * num2 = [[NSNumber alloc] initWithFloat:1.0];
// __NSCFNumber

NSNumber * num3 = [[NSNumber alloc] initWithBool:YES];
// __NSCFBoolean
//类簇在子类种类繁多，但是行为相对统一的时候对于简化接口非常有帮助。

//在 Objective-C 中，init 开头的初始化方法虽然打着初始化的名号，但是实际做的事情和其他方法[…]”
*/

class Drinking {
    typealias LiquidColor = UIColor
    var color: LiquidColor {
        return LiquidColor.clearColor()
        
        
        }
    
    class func drinking(name: String) -> Drinking {
        var drinking: Drinking
        switch name {
        case "Coke":
            drinking = Coke()
        case "Beer":
            drinking = Beer()
        default:
            drinking = Drinking()
        }
        
        return drinking
    }
}

class Coke: Drinking {
    override var color: LiquidColor {
        return LiquidColor.blackColor()
    }
}

class Beer: Drinking {
    override var color: LiquidColor {
        return LiquidColor.yellowColor()
    }
}

let coke = Drinking.drinking("Coke")
coke.color // Black

let beer = Drinking.drinking("Beer")
beer.color // Yellow
//通过获取对象类型中提到的方法，我们也可以确认 coke 和 beer 各自的动态类型分别是 Coke 和 Beer。

let cokeClass = NSStringFromClass(coke.dynamicType) //Coke
let beerClass = NSStringFromClass(beer.dynamicType) //Beer”




