//: Playground - noun: a place where people can play

import UIKit

//Unicode编码
let andSign1: Character = "&"
let andSign2: Character = "\u{26}"

let lamda1: Character = "λ"
let lamda2: Character = "\u{03bb}"

var smile1: Character = "😃"
var smile2: Character = "\u{0001f603}"


//转义符
let specialCharTab1 = "Hello\tWorld."
print("specialCharTab1: \(specialCharTab1)")

let specialCharNewLine = "Hello\nWorld."
print("specialCharNewLine: \(specialCharNewLine)")

let specialCharReturn = "Hello\rWorld."
print("specialCharReturn: \(specialCharReturn)")

let specialCharQuotationMark = "Hello\"World\"."
print("specialCharQuotationMark: \(specialCharQuotationMark)")

let specialCharApostrophe = "Hello\'World\'."
print("specialCharApostrophe: \(specialCharApostrophe)")

let specialCharReverseSolidus = "Hello\\World."
print("specialCharReverseSolidus: \(specialCharReverseSolidus)")

//创建字符串
let 🌍 = "🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩"

print("已经上船的小动物数：\(🌍.characters.count)")

let 熊 = "🐻"
let 猫 = "🐱"
let 🐼 = 熊 + 猫

let emptyString1 = ""
let emptyString2 = String()

//字符串拼接
var 🌍2 = "🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩"

🌍2 = 🌍2 + "👨"
🌍2 += "👩"

var flower: Character = "🌻"
🌍2.append(flower)

print("诺亚方舟乘客数：\(🌍.characters.count)")

let number = 9
let total = "\(number) 加 10 等于 \(Double(number) + 10)"


//字符串插入、删除和替换
var str = "Objective-C and Swift"
print("原始字符串：\(str)")

//插入字符
str.insert(".", atIndex: str.endIndex)
print("插入.字符后：\(str)")

str.removeAtIndex(str.endIndex.predecessor())
print("删除.字符后：\(str)")

var startIndex = str.startIndex
var endIndex = startIndex.advancedBy(9)
var range = startIndex...endIndex
//删除范围
str.removeRange(range)
print("删除范围后：\(str)")

startIndex = str.startIndex
endIndex = startIndex.advancedBy(0)
range = startIndex...endIndex
//替换范围
str.replaceRange(range, with: "C++")
print("替换范围后：\(str)")


//大小和相等比较
let 熊2 = "🐻"
let 猫2 = "🐱"

if 熊2 > 猫2 {
    print("🐻 大于 🐱")
} else {
    print("🐻 小于 🐱")
}

let 🐼2 = 熊2 + 猫2

if 🐼2 == "🐻🐱" {
    print("🐼2 是 🐻🐱")
} else {
    print("🐼2 不是 🐻🐱")
}

let emptyString3 = ""
let emptyString4 = String()

if emptyString3 == emptyString4 {
    print("相等")
} else {
    print("不相等")
}


var a = "a"
var b = "b"
if a > b {
    print(">")
} else {
    print("<")
}

//前缀和后缀比较
let docFolder = [
    "java.docx",
    "JavaBean.docx",
    "Objecitve-C.xlsx",
    "Swift.docx"
]

var wordDocCount = 0
for doc in docFolder {
    if doc.hasSuffix(".docx") {
        ++wordDocCount
    }
}
print("文件夹中Word文档个数是： \(wordDocCount)")

var javaDocCount = 0
for doc in docFolder {
    
    let lowercaseDoc = doc.lowercaseString
    
    if lowercaseDoc.hasPrefix("java") {
        ++javaDocCount
    }
}
print("文件夹中Java相关文档个数是： \(javaDocCount)")

