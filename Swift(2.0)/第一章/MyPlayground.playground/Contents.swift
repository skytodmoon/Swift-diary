//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

import XCPlayground

let image = UIImage(named: "icon.png")

let demoView = UIView(frame: CGRectMake(0, 0, 250, 250))
demoView.backgroundColor = UIColor.redColor()

XCPlaygroundPage.currentPage.liveView = demoView

var i = 1

for x in 1..<5 {
    i = i * x
    
    XCPlaygroundPage.currentPage.captureValue(i, withIdentifier: "i")
}
print(i)
print("Hello", terminator: " ")
print("World", terminator: ",")
print("playground")
print(20, 18, 39, "Hello", "playground", separator: "|")


