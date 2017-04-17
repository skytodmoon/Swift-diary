//: Playground - noun: a place where people can play

import Foundation

//^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$
let pattern =  "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$"

let aString = "齐金亮@gmail.com"

do {
    let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    //创建一个范围，包括全部的字符串
    let range = NSRange(location:0, length: aString.characters.count)
    
    let result = regex.firstMatchInString(aString, options: .WithoutAnchoringBounds, range: range)
    if result != nil {
        print("匹配")
    } else {
        print("不匹配")
    }
    
    let number = regex.numberOfMatchesInString(aString, options: .WithoutAnchoringBounds, range: range)
    if number > 0 {
        print("匹配")
    } else {
        print("不匹配")
    }
    
} catch let err as NSError {
    print(err.description)
}
