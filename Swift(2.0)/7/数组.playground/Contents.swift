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


//字典声明与初始化
var studentDictionary0: [Int: String]

var studentDictionary1: Dictionary<Int, String> = [102 : "张三",105 : "李四", 109 : "王五"]

var studentDictionary2 = [102 : "张三",105 : "李四", 109 : "王五"]

let studentDictionary3 = [102 : "张三",105 : "李四", 109 : "王五"]

var studentDictionary4 = Dictionary<Int, String>()

var studentDictionary5 = [Int: String]()

//可变字典
var studentDictionary = [102 : "张三",105 : "李四", 109 : "王五"]

studentDictionary[110] = "董六"

print("班级人数：\(studentDictionary.count)")

let dismissStudent = studentDictionary.removeValueForKey(102)

print("开除的学生：\(dismissStudent!)")

studentDictionary[105] = nil

studentDictionary[109] = "张三"

let replaceStudent = studentDictionary.updateValue("李四", forKey:110)
print("被替换的学生是：\(replaceStudent!)")

//字典遍历
var studentDictionary11 = [102 : "张三",105 : "李四", 109 : "王五"]

print("---遍历键---")
for studentID in studentDictionary11.keys {
    print("学号：\(studentID)")
}

print("---遍历值---")
for studentName in studentDictionary11.values {
    print("学生：\(studentName)")
}

print("---遍历键:值---")
for (studentID, studentName) in studentDictionary11 {
    print ("\(studentID) : \(studentName)")
}

//Set声明和初始化
let studentList11: Set<String> = ["张三","李四","王五","董六"]
var studentList21 = Set<String>()

let studentList31 = ["张三","李四","王五","董六"]
let studentList41: [String] = ["董六", "张三","李四","王五"]

let studentList51: Set<String> = ["董六", "张三","李四","王五"]

if studentList11 == studentList51 {
    print("studentList11 等于 studentList51")
} else {
    print("studentList11 不等于 studentList51")
}

if studentList31 == studentList41 {
    print("studentList31 等于 studentList41")
} else {
    print("studentList31 不等于 studentList41")
}

//可变Set
var studentList22: Set<String>  = ["张三","李四","王五"]
print(studentList)

let removeStudent22 = studentList22.removeFirst()
print(studentList22)
print(removeStudent22)

studentList22.insert("董六")
print(studentList22)

let student22 = "张三"

studentList22.remove(student22)
print(studentList22)

if !studentList22.contains(student22) {
    print("删除学生:\(student22)成功。")
} else {
    print("删除学生:\(student22)失败！")
}

print("Set集合长度:\(studentList22.count)")

var studentList33: Set<String>  = ["张三","李四","王五"]

for item in studentList33 {
    print(item)
}

for (index, value) in studentList33.enumerate() {
    print("Item \(index + 1 ) : \(value)")
}


//集合运算
let A: Set<String>  = ["a","b","e","d"]
let B: Set<String>  = ["d","c","e","f"]

print("A与B交集 = \(A.intersect(B))")
print("A与B并集 = \(A.union(B).sort())")
print("A与B异或集合 = \(A.exclusiveOr(B))")

let C = A.subtract(B)
print("A与B差集 = \(C)")

if C.isSubsetOf(A) {
    print("C是A的子集")
}

