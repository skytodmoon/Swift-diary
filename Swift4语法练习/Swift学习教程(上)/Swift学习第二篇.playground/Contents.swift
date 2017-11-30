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
for character in "Dog!?"{
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
print("unsualMenagrie has \(unsualMenagrie.count) characters ")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

//字符串索引
let greeting = "Guten Tag"
greeting[greeting.startIndex]

for index in greeting.indices{
    print("\(greeting[index])")
}

//插入
var Welcome = "hello"
Welcome.insert("!", at: Welcome.endIndex)
Welcome.insert(contentsOf: "there", at: Welcome.endIndex)

//字符串/字符相等
let qutation = "we're a lot alike, you and I"
let sameQuotation = "we're a lot alike, you and I"
if qutation == sameQuotation {
    print("These two strings are considered equal")
}

//前缀/后缀相等
let remoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

//hasPrefix(_:) 方法来计算话剧中第一幕的场景数
var act1SceneCount = 0
for scene in remoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
//        ++act1SceneCount
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

//hasSuffix(_:) 方法来计算发生在不同地方的场景数：
var mansionCount = 0
var cellCount = 0
for scene in remoAndJuliet{
    if scene.hasPrefix("Caplet's mansion"){
//        ++mansionCount
    }else if scene.hasPrefix("Frial Lawrence's cell"){
//        ++cellCount
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

