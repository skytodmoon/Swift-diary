//: Playground - noun: a place where people can play

import Cocoa

//在 Swfit 中我们基本都是用 struct 去定义一个纯数据类型。比如
  /*
   * struct User {
   *   var age : Int
   *   var weight : Int
   *   var height : Int
   * }
   */

//而有我们经常会在变量里添加一些简单的改变变量里内容的方法，比如

/*
 *  func gainWeight(newWeight: Int) {
 *      weight += newWeight
 *   }
*/
//但如果我们直接把这个方法放入 User 这个变量中间，你的编译器就会给出一个非常奇怪的错误消息
/*
struct User {
    var age : Int

    var weight : Int
    var height : Int
    
    func gainWeight(newWeight: Int) {
        weight += newWeight
    }
}
*/

//错误的消息竟然是 Binary operator '+=' cannot be applied to two int operands，意思是在2个数字之间没有办法使用 +=。但大家都知道 += 在数字变量之间是最常见不过的，为什么不能用？

//其实在这个错误代码后面有另一层意思。因为我们忽略了一点，Struct 出来的变量是 Immutable 的，想要用一个方法去改变变量里面的值的时候必须要加上一个关键词 mutating，所以其实这个错误代码的真正含义应该是因为 User 的 Weight 是 Immutable 的，所以 += 无法在这两个 Int 上使用

//我们在方法之前加上 mutating 之后编译就可以顺利进行了

struct User {
    var age : Int
    var weight : Int
    var height : Int
    
    mutating func gainWeight(newWeight: Int) {
        weight += newWeight
    }
}

    