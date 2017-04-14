//: Playground - noun: a place where people can play

import UIKit

var studentList1: Array<String> = ["张三","李四","王五","董六"]

var studentList2: [String]  = ["张三","李四","王五","董六"]

let studentList3: [String]  = ["张三","李四","王五","董六"]

var studentList4 = [String]()


//可变数组
var studentList: [String]  = ["张三","李四","王五"]
print(studentList)

studentList.append("董六")
print(studentList)

studentList += ["刘备", "关羽"]
print(studentList)

studentList.insert("张飞",atIndex:studentList.count)
print(studentList)

let removeStudent = studentList.removeAtIndex(0)
print(studentList)

studentList[0] = "诸葛亮"
print(studentList)

//数组遍历
var studentList9: [String]  = ["张三","李四","王五"]

for item in studentList9 {
    print(item)
}

for (index, value) in studentList9.enumerate() {
    print("Item \(index + 1 ) : \(value)")
}

