//: Playground - noun: a place where people can play

import UIKit

/// 标识符

let π = 3.14159

let _Hello = "Hello"

let 您好 = "你好世界"

let `class` = "😄😊😃😉"

let 🌍 = "🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩"

/** 关键字 */
func log(message: String) {
    print("FUNCTION:\(#function) COLUMN:\(#column) FILE:\(#file) LINE:\(#line) \(message)")
}

log("Test")

///常量和变量
let _Hello2 = "Hello"
var scoreForStudent2 = 0.0
var x2 = 10, y2 = 20

/// 使用let 和 var
class Person {
    var name : String
    var age : Int
    
    init (name : String, age : Int) {
        self.name = name
        self.age  = age
    }
}

let p1 = Person(name: "Tony", age: 18)
p1.age  = 20

//编译错误
//p1 = Person(name: "Tom", age: 18)

//注释

let x = 10

if x > 1 {
    /* 注释1 */
} else {
    /* 注释2 */
}

/*
 if x > 1 {
 
 } else {
 
 }
 */

/*
 if x > 1 {
 /* 注释1 */
 } else {
 /* 注释2 */
 }
 */
