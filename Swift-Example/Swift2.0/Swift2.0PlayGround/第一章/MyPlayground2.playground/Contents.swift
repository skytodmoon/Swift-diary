//: Playground - noun: a place where people can play

import UIKit

///查看取值的历史记录
var str = "Hello, playground"

var counter = 0;
var secondCounter = 0;
for(var i = 0; i < 10; i++){
    counter += i;
    print("Counter: \(counter)")
    
    //使用取值时间轴
    for j in 1...10 {
        secondCounter += j;
    }
}

//使用UI组件
let textField = UITextField(frame: CGRectMake(0,0,200,50));
textField.text = "Hello";
textField.borderStyle = UITextBorderStyle.Bezel;
textField;