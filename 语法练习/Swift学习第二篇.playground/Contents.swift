//: Playground - noun: a place where people can play

import UIKit

//字符串字面量
let someString = "Some string literal value"

//空字符串字面量
var emptyString = ""
//初始化方法
var anotherEmptyString = String()
//两个字符串均为空并等价
if emptyString.isEmpty{
    print("Nothring to see here")
}

//字符串可变性
var variableString = "Horse"
variableString += "and carriage"

let constantString = "Highlander"
//编译错误 - 常量字符串不可以被修改
//constantString += "and another Higlander"

//使用字符
for character in "Dog!?".characters{
    print(character)
}

let exclamationMark: Character = "!"
let catCharacters: [Character] = ["c","a","t","!","?"]
let catString = String(catCharacters)
print(catString)

//拼接字符串和字符
let string1 = "hello"
let string2 = "there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark2: Character = "!"
welcome.append(exclamationMark2)

//字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


//Unicode标量

let wiseWords = "\"Imagination is more important than knowlegdge\" - Einstein"
let dellarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparkLingHeart = "\u{1F496}"


//计算字符串数量

let unsualMenagrie = "Koala ?, Snail ?, Penguin ?, Dromedary ?"
print("unsualMenagrie has \(unsualMenagrie.characters.count) characters ")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")

//字符串索引
let greeting = "Guten Tag"
greeting[greeting.startIndex]

for index in greeting.characters.indices{
    print("\(greeting[index])")
}

//插入
var Welcome = "hello"
Welcome.insert("!", at: Welcome.endIndex)
Welcome.insert(contentsOf: "there".characters, at: Welcome.endIndex)

//字符串/字符相等


