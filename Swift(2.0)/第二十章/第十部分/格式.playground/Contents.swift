//: Playground - noun: a place where people can play

import Foundation

//^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$
let pattern =  "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$"

let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)

let aString = "齐金亮@gmail.com"

if predicate.evaluateWithObject(aString) {
    print("格式有效")
} else {
    print("格式无效")
}
