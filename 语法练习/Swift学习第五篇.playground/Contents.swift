//: Playground - noun: a place where people can play

import UIKit

//实例方法
class Counter {
    //可变属性 count
    var count = 0
    
    func increment() {
        count
    }
    //让计数器按一个指定的整数值递增
    func incrementBy(amount: Int) {
        count += amount
    }
    //将计数器重置为0
    func reset() {
        count = 0
    }
    
}
let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.incrementBy(amount: 5)
// 计数值现在是6
counter.reset()
// 计数值现在是0

//方法的局部参数名称和外部参数名称
class Counter2 {
    
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int){
        count += amount * numberOfTimes
    }
}

let counter2 = Counter2()
counter2.incrementBy(amount: 5, numberOfTimes: 3)

//self 属性



